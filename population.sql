use sisi_velas;

-- Inserciones en la tabla estado_pedido
INSERT INTO estado_pedido (detalle) VALUES
('Por confirmar'),
('Completado'),
('Cancelado'),
('En preparacion');

-- Inserciones en la tabla tipo_vela
INSERT INTO tipo_vela (descripcion, tamanio) VALUES
('Vela 80GR', '80'),
('Vela 160GR', '160');

-- Inserciones en la tabla cliente 
INSERT INTO cliente (nombre, apellido, email, telefono, ruc) VALUES
('Juan', 'Gonzalez', 'juan@gmail.com', '123456789', '12345678'),
('María', 'López', 'maria@gmail.com', '987654321', '98765432'),
('Pedro', 'Martinez', 'pedro@gmail.com', '555555555', '55555555'),
('Laura', 'Rodriguez', 'laura@gmail.com', '444444444', '44444444'),
('Ana', 'Pérez', 'ana@gmail.com', '666666666', '66666666'),
('David', 'Gomez', 'david@gmail.com', '777777777', '77777777'),
('Sofía', 'Hernández', 'sofia@gmail.com', '888888888', '88888888'),
('Carlos', 'Díaz', 'carlos@gmail.com', '999999999', '99999999'),
('Elena', 'Fernández', 'elena@gmail.com', '101010101', '10101010'),
('Javier', 'Ruiz', 'javier@gmail.com', '121212121', '12121212'),
('Luis', 'Sanchez', 'luis@gmail.com', '141414141', '14141414'),
('Andrea', 'Torres', 'andrea@gmail.com', '161616161', '16161616'),
('Martín', 'Ramirez', 'martin@gmail.com', '181818181', '18181818'),
('Silvia', 'Ortega', 'silvia@gmail.com', '202020202', '20202020'),
('Diego', 'Moreno', 'diego@gmail.com', '222222222', '22222222'),
('Monica', 'Jimenez', 'monica@gmail.com', '242424242', '24242424'),
('Rosa', 'Dominguez', 'rosa@gmail.com', '262626262', '26262626'),
('Alejandro', 'Vega', 'alejandro@gmail.com', '282828282', '28282828'),
('Patricia', 'Cruz', 'patricia@gmail.com', '303030303', '30303030'),
('Raúl', 'Molina', 'raul@gmail.com', '323232323', '32323232');


INSERT INTO domicilio (calle, altura, piso, unidad, paralela_uno, paralela_dos, observaciones, id_cliente) VALUES
('Calle Principal', '123', '1', 'A', 'Avenida Central', NULL, 'Frente al parque', 1),
('Avenida Norte', '456', NULL, NULL, NULL, NULL, 'Cerca de la plaza', 2),
('Calle Este', '789', '2', 'B', 'Calle Lateral', NULL, 'Edificio Amarillo', 3),
('Calle Oeste', '321', NULL, NULL, NULL, NULL, 'Junto al supermercado', 4),
('Avenida Sur', '654', NULL, NULL, NULL, NULL, 'Al lado de la estación', 5),
('Calle Central', '987', '3', 'C', 'Avenida Principal', 'Calle Secundaria', 'Cerca del centro comercial', 6),
('Avenida Lateral', '654', '4', 'D', NULL, NULL, 'En la esquina', 7),
('Calle Lateral', '321', '2', 'B', NULL, NULL, 'Frente al parque', 8),
('Calle Secundaria', '159', NULL, NULL, NULL, NULL, 'Al lado del restaurante', 9),
('Avenida Principal', '753', '5', 'A', NULL, NULL, 'Cerca de la parada de autobús', 10),
('Avenida Central', '111', '3', 'A', 'Calle Principal', 'Calle Lateral', 'Frente a la tienda', 11),
('Calle Oeste', '222', NULL, NULL, NULL, NULL, 'Junto a la farmacia', 12),
('Calle Norte', '333', '1', 'C', NULL, NULL, 'En la esquina', 13),
('Avenida Este', '444', '2', 'B', 'Avenida Principal', NULL, 'Cerca del banco', 14),
('Calle Sur', '555', NULL, NULL, NULL, NULL, 'Frente a la escuela', 15),
('Avenida Central', '666', '4', 'A', NULL, NULL, 'Junto al parque', 16),
('Calle Principal', '777', '3', 'D', 'Calle Lateral', NULL, 'Al lado del cine', 17),
('Calle Este', '888', NULL, NULL, NULL, NULL, 'Cerca de la biblioteca', 18),
('Avenida Oeste', '999', NULL, NULL, NULL, NULL, 'Frente al hospital', 19),
('Avenida Sur', '1010', '2', 'B', NULL, NULL, 'En la esquina', 20);


INSERT INTO aroma (nombre_aroma, disponible) VALUES
('Lavanda', 1),
('Vainilla', 1),
('Canela', 1),
('Limón', 1),
('Rosas', 1),
('Jazmín', 1),
('Coco', 1),
('Mandarina', 1),
('Manzana Verde', 1),
('Pino', 1);


INSERT INTO producto (nombre, descripcion, precio, stock, id_tipo_vela, id_aroma) VALUES
('Vela de Lavanda 80gr', 'Vela perfumada con aroma a lavanda, tamaño 80 gramos', 57732, 50, 1, 1),
('Vela de Vainilla 80gr', 'Vela perfumada con aroma a vainilla, tamaño 80 gramos', 51000, 40, 1, 2),
('Vela de Canela 160gr', 'Vela perfumada con aroma a canela, tamaño 160 gramos', 88371, 30, 2, 3),
('Vela de Limón 80gr', 'Vela perfumada con aroma a limón, tamaño 80 gramos', 62700, 60, 1, 4),
('Vela de Rosas 160gr', 'Vela perfumada con aroma a rosas, tamaño 160 gramos', 100250, 35, 2, 5),
('Vela de Jazmín 80gr', 'Vela perfumada con aroma a jazmín, tamaño 80 gramos', 57800, 45, 1, 6),
('Vela de Coco 160gr', 'Vela perfumada con aroma a coco, tamaño 160 gramos', 90250, 25, 2, 7),
('Vela de Mandarina 80gr', 'Vela perfumada con aroma a mandarina, tamaño 80 gramos', 54312, 55, 1, 8),
('Vela de Manzana Verde 160gr', 'Vela perfumada con aroma a manzana verde, tamaño 160 gramos', 78200, 20, 2, 9),
('Vela de Pino 80gr', 'Vela perfumada con aroma a pino, tamaño 80 gramos', 66225, 65, 1, 10);


-- Inserciones en la tabla pedido
INSERT INTO pedido (id_cliente, id_estado_pedido, fecha) VALUES
(1, 1, '2024-03-05 10:30:00'),
(2, 1, '2024-03-10 15:45:00'),
(3, 1, '2024-03-15 11:20:00'),
(4, 1, '2024-03-20 08:55:00'),
(5, 1, '2024-03-25 14:10:00'),
(6, 1, '2024-04-01 09:30:00'),
(7, 1, '2024-04-05 12:45:00'),
(8, 1, '2024-04-10 16:20:00'),
(9, 1, '2024-04-15 10:55:00'),
(10, 1, '2024-04-20 15:10:00'),
(11, 1, '2024-03-08 08:30:00'),
(12, 1, '2024-03-12 13:45:00'),
(13, 1, '2024-03-17 10:20:00'),
(14, 1, '2024-03-22 09:55:00'),
(15, 1, '2024-03-27 11:10:00'),
(16, 1, '2024-04-03 14:30:00'),
(17, 1, '2024-04-07 17:45:00'),
(18, 1, '2024-04-11 11:20:00'),
(19, 1, '2024-04-16 08:55:00'),
(20, 1, '2024-04-21 10:10:00');

-- Inserciones en la tabla item_pedido
INSERT INTO item_pedido (id_pedido, id_producto, cantidad) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 3),
(3, 4, 2),
(3, 5, 1),
(4, 6, 2),
(5, 7, 1),
(6, 8, 3),
(7, 9, 2),
(8, 10, 1),
(11, 1, 2),
(11, 2, 1),
(12, 3, 3),
(13, 4, 2),
(14, 5, 1),
(15, 6, 2),
(16, 7, 1),
(17, 8, 3),
(18, 9, 2),
(19, 10, 1),
(20, 1, 2),
(20, 2, 1);


