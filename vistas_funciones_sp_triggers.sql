use sisi_velas;

-- Vista de los productos mas vendidos junto a su stock, total vendido, total vendido + iva.

DROP VIEW IF exists V_productos_mas_vendidos;
CREATE VIEW V_productos_mas_vendidos AS
SELECT p.id_producto, p.nombre AS nombre_producto, p.descripcion AS descripcion_producto, p.stock,  p.precio as precio_unitario,
       SUM(ip.cantidad) AS total_vendido,  SUM(ip.cantidad * p.precio) AS total_ventas, fn_calcularIva(SUM(ip.cantidad * p.precio)) as total_mas_iva
FROM producto p
JOIN item_pedido ip ON p.id_producto = ip.id_producto
GROUP BY p.id_producto
ORDER BY total_vendido DESC;

-- Funcion que permite calcular el iva (10%) de un producto, manupulan los montos de los productos y devuelve el monto + 10% siempre, tambien puede leer sentencias SQL .

DELIMITER //
CREATE FUNCTION fn_calcularIva(total DECIMAL(15, 2)) 
RETURNS DECIMAL(15, 2)
DETERMINISTIC
reads sql data
BEGIN
    DECLARE total_mas_iva DECIMAL(15, 2);

    IF total <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El monto no puede ser menor o igual a 0';
    END IF;

    SET total_mas_iva = total * 1.10;

    RETURN total_mas_iva;
END //
DELIMITER ;

-- Store Procedure que realiza una venta, recibe por parametro el cliente id, producto id y cantidad del mismo. Verifica que la cantidad pedida pueda ser satisfecha segun el stock con el que cuenta ese producto.
-- en caso de no contar con el stock suficiente no se ejecuta el resto de la operacion. Si cuenta con el stock suficiente, inserta un registro en la tabla pedido, toma ese id y hace una insercion en 
-- la tabla item_pedido. Por ultimo actualiza el stock del producto que fue pedido.

DROP PROCEDURE IF EXISTS realizar_venta;
DELIMITER //
CREATE PROCEDURE sp_realizar_venta(
    IN cliente_id INT,
    IN producto_id INT,
    IN cantidad INT
)
BEGIN
    DECLARE producto_stock INT;
    
    SELECT stock INTO producto_stock FROM producto WHERE id_producto = producto_id;
    
    IF producto_stock < cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay suficiente stock disponible para realizar esta venta';
    ELSE
        START TRANSACTION;
        
        -- Insertar en la tabla pedido
        INSERT INTO pedido (id_cliente, id_estado_pedido) VALUES (cliente_id, 1); 
        SET @pedido_id = LAST_INSERT_ID(); -- Obtener el ID del pedido recién insertado
        
        -- Insertar en la tabla item_pedido
        INSERT INTO item_pedido (id_pedido, id_producto, cantidad) VALUES (@pedido_id, producto_id, cantidad);
        
        -- Actualizar el stock en la tabla producto
        UPDATE producto SET stock = stock - cantidad WHERE id_producto = producto_id;
        
        COMMIT;
    END IF;
END //

DELIMITER ;

-- Tabla historica de movimientos de los pedidos.

DROP TABLE IF exists historico_estado_pedido;
CREATE TABLE historico_estado_pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    estado_pedido_actual INT,
    estado_pedido_anterior INT,
    fecha_estado_actual TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_estado_anterior TIMESTAMP,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (estado_pedido_actual) REFERENCES estado_pedido(id_estado_pedido),
    FOREIGN KEY (estado_pedido_anterior) REFERENCES estado_pedido(id_estado_pedido)
);

-- Trigger que actualiza la tabla de historicos cada vez que haya una actualizacion en el estado de pedido en la tabla pedido. A modo de llevar un historial.

DROP TRIGGER IF exists trigger_actualizar_estado_pedido;
DELIMITER //
CREATE TRIGGER trigger_actualizar_estado_pedido AFTER UPDATE ON pedido
FOR EACH ROW
BEGIN
    IF OLD.id_estado_pedido != NEW.id_estado_pedido THEN
        INSERT INTO historico_estado_pedido (id_pedido, estado_pedido_actual, estado_pedido_anterior, fecha_estado_actual, fecha_estado_anterior)
        VALUES (NEW.id_pedido, NEW.id_estado_pedido, OLD.id_estado_pedido, CURRENT_TIMESTAMP(), OLD.fecha);
    END IF;
END //
DELIMITER ;


DROP VIEW IF exists v_pedidos_detalle;
CREATE VIEW v_pedidos_detalle AS
    SELECT 
        `p`.`id_pedido` AS `id_pedido`,
        `c`.`nombre` AS `nombre_cliente`,
        `c`.`apellido` AS `apellido_cliente`,
        `ep`.`id_estado_pedido` AS `id_estado_pedido`,
        `ep`.`detalle` AS `estado_pedido`,
        `p`.`fecha` AS `fecha_creacion`,
		fn_calcularIva(SUM((`ip`.`cantidad` * `pr`.`precio`))) AS `monto_total_mas_iva`,
        COALESCE(MAX(`h`.`fecha_estado_actual`),
                `p`.`fecha`) AS `fecha_estado_actual`
    FROM
        (((((`pedido` `p`
        JOIN `cliente` `c` ON ((`p`.`id_cliente` = `c`.`id_cliente`)))
        JOIN `estado_pedido` `ep` ON ((`p`.`id_estado_pedido` = `ep`.`id_estado_pedido`)))
        JOIN `item_pedido` `ip` ON ((`p`.`id_pedido` = `ip`.`id_pedido`)))
        JOIN `producto` `pr` ON ((`ip`.`id_producto` = `pr`.`id_producto`)))
        LEFT JOIN (SELECT 
            `historico_estado_pedido`.`id_pedido` AS `id_pedido`,
                MAX(`historico_estado_pedido`.`fecha_estado_actual`) AS `fecha_estado_actual`
        FROM
            `historico_estado_pedido`
        GROUP BY `historico_estado_pedido`.`id_pedido`) `h` ON ((`p`.`id_pedido` = `h`.`id_pedido`)))
    GROUP BY `p`.`id_pedido`


