CREATE DATABASE sisi_velas;

CREATE TABLE cliente (
id_cliente INT NOT NULL AUTO_INCREMENT  PRIMARY KEY
, nombre VARCHAR(70) NOT NULL
, apellido VARCHAR(70) NOT NULL
, email VARCHAR(70) UNIQUE NOT NULL
, telefono VARCHAR(70) NOT NULL
);

CREATE TABLE domicilio (
id_domicilio INT NOT NULL AUTO_INCREMENT  PRIMARY KEY
, calle VARCHAR(70) NOT NULL
, altura VARCHAR(10) NOT NULL
, piso VARCHAR(10) NOT NULL
, unidad VARCHAR(10) NOT NULL
, paralela_uno VARCHAR(70)
, paralela_dos VARCHAR(70)
, observaciones VARCHAR(100)
, id_cliente INT
);

CREATE TABLE aroma (
id_aroma INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, nombre_aroma VARCHAR(70) NOT NULL
, disponible TINYINT DEFAULT 1
);

CREATE TABLE tipo_vela (
id_tipo_vela INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, descripcion VARCHAR(100) NOT NULL
, tamanio VARCHAR(4) NOT NULL
);


CREATE TABLE aroma (
id_aroma INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, nombre_aroma VARCHAR(70) NOT NULL
, disponible TINYINT  NOT NULL
);

CREATE TABLE producto (
id_producto INT NOT NULL AUTO_INCREMENT  PRIMARY KEY
, nombre VARCHAR(70) NOT NULL
, descripcion VARCHAR(150) NOT NULL
, precio DECIMAL(15,3) NOT NULL
, stock INT  NOT NULL
, id_tipo_vela INT 
, id_aroma INT
);


CREATE TABLE item_pedido (
id_item_pedido INT NOT NULL AUTO_INCREMENT  PRIMARY KEY
, id_pedido INT 
, id_producto INT 
, cantidad INT NOT NULL
);

CREATE TABLE estado_pedido (
id_estado_pedido INT NOT NULL AUTO_INCREMENT  PRIMARY KEY
, detalle VARCHAR(100)
);

CREATE TABLE pedido (
id_pedido INT NOT NULL AUTO_INCREMENT  PRIMARY KEY
, id_cliente INT 
, id_estado_pedido INT 
, fecha DATETIME DEFAULT NOW()
);

-- Agregando Constraint FK de cada tabla

ALTER TABLE domicilio 
	ADD CONSTRAINT __fk_domicilio_cliente
    FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente);

ALTER TABLE producto 
	ADD CONSTRAINT __fk_producto_tipo_vela
    FOREIGN KEY(id_tipo_vela) REFERENCES tipo_vela(id_tipo_vela);

ALTER TABLE  producto 
	ADD CONSTRAINT __fk_producto_aroma
    FOREIGN KEY(id_aroma) REFERENCES aroma(id_aroma);

ALTER TABLE item_pedido 
	ADD CONSTRAINT __fk_item_pedido_producto
    FOREIGN KEY(id_producto) REFERENCES producto(id_producto);

ALTER TABLE item_pedido 
	ADD CONSTRAINT __fk_item_pedido_pedido
    FOREIGN KEY(id_pedido) REFERENCES pedido(id_pedido);

ALTER TABLE pedido
	ADD CONSTRAINT __fk_pedido_cliente
    FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente);
   
ALTER TABLE pedido
	ADD CONSTRAINT __fk_pedido_estado_pedido
    FOREIGN KEY(id_estado_pedido) REFERENCES estado_pedido(id_estado_pedido);
