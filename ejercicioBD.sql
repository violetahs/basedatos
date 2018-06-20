DROP DATABASE IF EXISTS ejercicio;
CREATE DATABASE ejercicio;
USE ejercicio;

CREATE TABLE categoria(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nombre_categoria VARCHAR(50)
);

CREATE TABLE cliente(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nombre_cliente  VARCHAR(30) NOT NULL,
	direccion VARCHAR(30) NOT NULL,
	telefono VARCHAR(10),
	activo BOOLEAN  NOT NULL DEFAULT TRUE

);

CREATE TABLE usuario(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	categoria_id INT  NOT NULL,
	nombre_usuario VARCHAR(50) NOT NULL,
	nip VARCHAR(20) UNIQUE NOT NULL,
	pass VARCHAR(100) NOT NULL,
	telefono varchar(10),
	activo BOOLEAN NOT NULL DEFAULT TRUE,
	FOREIGN KEY(categoria_id) REFERENCES categoria(id)
);

CREATE TABLE marca(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nombre VARCHAR(50) NOT NULL
);

CREATE TABLE categoriaArt( 
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nombre VARCHAR(50) NOT NULL

);

CREATE TABLE  articulo(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nombre_articulo VARCHAR(50) NOT NULL,
	precio_p DOUBLE NOT NULL,
	precio_a DOUBLE NOT NULL,
	activo BOOLEAN NOT NULL DEFAULT TRUE,
	marca_id INT  NOT NULL,
	categoria_id INT  NOT NULL,
	FOREIGN KEY(marca_id) REFERENCES marca(id),
	FOREIGN KEY(categoria_id)REFERENCES categoriaArt(id)); 
  
CREATE TABLE MovimientoCaja(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nombre VARCHAR(15) NOT NULL,
	descripcion VARCHAR(200)

);

CREATE TABLE  caja(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	total  DOUBLE NOT NULL,
	movimiento_id INT NOT NULL,
	FOREIGN KEY(movimiento_id) REFERENCES MovimientoCaja(id)
);

CREATE TABLE venta(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	folio VARCHAR(20)NOT NULL,
	fecha DATE NOT NULL,
	articulo_id INT NOT NULL,
	cantidadProducto INT NOT NULL,
	usuario_id INT NOT NULL,
	cliente_id INT NOT NULL,
	total DOUBLE NOT NULL,
	FOREIGN KEY (articulo_id)REFERENCES articulo(id),
	FOREIGN KEY (usuario_id) REFERENCES usuario(id),
	FOREIGN KEY (cliente_id)REFERENCES cliente(id)
);

INSERT INTO categoria(nombre_categoria)VALUES('Dueño');
INSERT INTO categoria(nombre_categoria)VALUES('Empleado');

INSERT INTO MovimientoCaja(nombre,descripcion)VALUES('Salida','se realizo la compra los de productos que hacian falta');
INSERT INTO MovimientoCaja(nombre,descripcion)VALUES('Entrada','Las venta de los productos');
INSERT INTO MovimientoCaja(nombre,descripcion)VALUES('Prestamo','Se reealizo un prestamo a untrabajador');

INSERT INTO caja(total,movimiento_id) VALUES(1000,2);
INSERT INTO caja(total,movimiento_id) VALUES(500,1);
INSERT INTO caja(total,movimiento_id) VALUES(400,3);
INSERT INTO caja(total,movimiento_id) VALUES(2000,2);
INSERT INTO caja(total,movimiento_id) VALUES(3000,2);
INSERT INTO caja(total,movimiento_id) VALUES(4000,2);
INSERT INTO caja(total,movimiento_id) VALUES(3000,1);

select*from caja;

INSERT INTO usuario(categoria_id, nombre_usuario, nip, pass, telefono, activo)VALUES(1,'Ana','A12','12An','4661793778',true);
INSERT INTO usuario(categoria_id, nombre_usuario, nip, pass, telefono, activo)VALUES(2,'Guadalupe','GA13','GPE778','4662345678',TRUE);
INSERT INTO usuario(categoria_id, nombre_usuario, nip, pass, telefono, activo)VALUES(2,'Daniel','DA14','DAN779','4665412654',TRUE);
INSERT INTO usuario(categoria_id, nombre_usuario, nip, pass, telefono, activo)VALUES(2,'Alejandra','Ale15','AL123','4665412684',TRUE);
INSERT INTO usuario(categoria_id, nombre_usuario, nip, pass, telefono, activo)VALUES(2,'Aronn','AR24','AR23','4663412654',TRUE);
INSERT INTO usuario(categoria_id, nombre_usuario, nip, pass, telefono, activo)VALUES(2,'Saul','SA25','SAL12','4667412654',TRUE);
INSERT INTO usuario(categoria_id, nombre_usuario, nip, pass, telefono, activo)VALUES(2,'Joel','JO26','JOE26','4668412654',TRUE);
INSERT INTO usuario(categoria_id, nombre_usuario, nip, pass, telefono, activo)VALUES(2,'Norma','NO29','NOR27','4665432654',TRUE);
INSERT INTO usuario(categoria_id, nombre_usuario, nip, pass, telefono, activo)VALUES(2,'Pilar','PI30','PIL28','4665472654',TRUE);
INSERT INTO usuario(categoria_id, nombre_usuario, nip, pass, telefono, activo)VALUES(2,'Noemi','NOE17','NOE79','4665412634',TRUE);
select*from usuario;


INSERT INTO cliente(nombre_cliente,direccion,telefono,activo)VALUES('Maria','Pipila #2','4661234564',TRUE);
INSERT INTO cliente(nombre_cliente,direccion,telefono)VALUES('Carmen','Batan #20','4661244564');
INSERT INTO cliente(nombre_cliente,direccion,telefono)VALUES('Omar','Guillermo Prieto #33','4661254564');
INSERT INTO cliente(nombre_cliente,direccion,telefono)VALUES('Marlem','Cristobal Colon #45','4661264564');
INSERT INTO cliente(nombre_cliente,direccion,telefono)VALUES('Alejandro','Zaragoza #127','4661274564');
INSERT INTO cliente(nombre_cliente,direccion,telefono)VALUES('Moserrat','Alvaro Obregon #543','4661284564');
INSERT INTO cliente(nombre_cliente,direccion,telefono)VALUES('Manuel','Miguel Hidalgo #321','4661294564');
INSERT INTO cliente(nombre_cliente,direccion,telefono)VALUES('Luz','Francisco Madero #211','4661230564');
INSERT INTO cliente(nombre_cliente,direccion,telefono)VALUES('Erika','Fernando Davila #67','4661231564');
INSERT INTO cliente(nombre_cliente,direccion,telefono)VALUES('Maribel','16 septiembre #97','4661232564');
INSERT INTO cliente(nombre_cliente,direccion,telefono)VALUES('Jesus','20 Noviembre #67','4661233564');
INSERT INTO cliente(nombre_cliente,direccion,telefono)VALUES('Dolores','Batanes #67','4661233565');
INSERT INTO cliente(nombre_cliente,direccion,telefono)VALUES('Daniela','Camelina #105','4661233566');
INSERT INTO cliente(nombre_cliente,direccion,telefono)VALUES('Grabiela','Jacaranda #43','4661233567');
INSERT INTO cliente(nombre_cliente,direccion,telefono)VALUES('Jesus','Pino Suarez #112','4661233568');
INSERT INTO cliente(nombre_cliente,direccion,telefono)VALUES('Jesus','Rosa #119','4661233569');

INSERT INTO marca(nombre)VALUES('Sabritas');
INSERT INTO marca(nombre)VALUES('Coca Cola');
INSERT INTO marca(nombre)VALUES('BIMBO');
INSERT INTO marca(nombre)VALUES('Fanta');
INSERT INTO marca(nombre)VALUES('Gota Blanca');
INSERT INTO marca(nombre)VALUES('Cuadritos');
INSERT INTO marca(nombre)VALUES('JUMEX');
INSERT INTO marca(nombre)VALUES('VALLE');
INSERT INTO marca(nombre)VALUES('HOLANDA');
INSERT INTO marca(nombre)VALUES('FUD');
INSERT INTO marca(nombre)VALUES('CHIMEX');
INSERT INTO marca(nombre)VALUES('FAMULOSO');
INSERT INTO marca(nombre)VALUES('P&G');
INSERT INTO marca(nombre)VALUES('DANONE');
INSERT INTO marca(nombre)VALUES('YOPLAIT');
INSERT INTO marca(nombre)VALUES('La Rosa');
INSERT INTO marca(nombre)VALUES('Vero');
INSERT INTO marca(nombre)VALUES('Sorics');
INSERT INTO marca(nombre)VALUES('Ricolino');
INSERT INTO marca(nombre)VALUES('La costeña');

INSERT INTO categoriaArt(nombre)VALUES('Abarrotes');
INSERT INTO categoriaArt(nombre)VALUES('Cremeria');
INSERT INTO categoriaArt(nombre)VALUES('Dulceria');
INSERT INTO categoriaArt(nombre)VALUES('Botana');
INSERT INTO categoriaArt(nombre)VALUES('Limpieza');
INSERT INTO categoriaArt(nombre)VALUES('Cuidado personal');
INSERT INTO categoriaArt(nombre)VALUES('Panaderia');



  INSERT INTO articulo(nombre_articulo, precio_p, precio_a, marca_id, categoria_id)VALUES('Jabon de barra',10,7,13,5);
  INSERT INTO articulo(nombre_articulo, precio_p, precio_a, marca_id, categoria_id)VALUES('Jabon Ariel de polvo',25,18,13,5);
  INSERT INTO articulo(nombre_articulo, precio_p, precio_a, marca_id, categoria_id)VALUES('Shampoo Pantene',40,35,13,6);
  INSERT INTO articulo(nombre_articulo, precio_p, precio_a, marca_id, categoria_id)VALUES('Liquido para trapear',20,16,12,5);
  INSERT INTO articulo(nombre_articulo, precio_p, precio_a, marca_id, categoria_id)VALUES('Mayonesa',40,30,18,2);
  INSERT INTO articulo(nombre_articulo, precio_p, precio_a, marca_id, categoria_id)VALUES('Ruffles',12,10,1,4);
  INSERT INTO articulo(nombre_articulo, precio_p, precio_a, marca_id, categoria_id)VALUES('Doritos',10,8,1,4);
  INSERT INTO articulo(nombre_articulo, precio_p, precio_a, marca_id, categoria_id)VALUES('Refresco ',13,11,2,1);
  INSERT INTO articulo(nombre_articulo, precio_p, precio_a, marca_id, categoria_id)VALUES('Donas de chocolate',14,12,3,7);
  INSERT INTO articulo(nombre_articulo, precio_p, precio_a, marca_id, categoria_id)VALUES('Roles ',18,15,3,7);
  INSERT INTO articulo(nombre_articulo, precio_p, precio_a, marca_id, categoria_id)VALUES('Mazapan',6,14,16,3);
  INSERT INTO articulo(nombre_articulo, precio_p, precio_a, marca_id, categoria_id)VALUES('Gudu Pop ',4,3,16,3);
  INSERT INTO articulo(nombre_articulo, precio_p, precio_a, marca_id, categoria_id)VALUES('Jugo',16,12,7,1);
  INSERT INTO articulo(nombre_articulo, precio_p, precio_a, marca_id, categoria_id)VALUES('Jugo',18,16,8,1);
  INSERT INTO articulo(nombre_articulo, precio_p, precio_a, marca_id, categoria_id)VALUES('Leche',25,23,5,1);
  INSERT INTO articulo(nombre_articulo, precio_p, precio_a, marca_id, categoria_id)VALUES('Jugo',16,12,7,1);
  INSERT INTO articulo(nombre_articulo, precio_p, precio_a, marca_id, categoria_id)VALUES('Queso',25,20,2,2);
  INSERT INTO articulo(nombre_articulo, precio_p, precio_a, marca_id, categoria_id)VALUES('Principe',12,10,19,1);
  INSERT INTO articulo(nombre_articulo, precio_p, precio_a, marca_id, categoria_id)VALUES('Magnu',25,23,9,1);
  
  
INSERT INTO venta(folio,fecha,articulo_id,cantidadProducto,usuario_id,cliente_id,total)VALUES('VART1','2018-06-15',1,4,2,2,30);
INSERT INTO venta(folio,fecha,articulo_id,cantidadProducto,usuario_id,cliente_id,total)VALUES('VART2','2018-06-15',2,1,2,11,25);
INSERT INTO venta(folio,fecha,articulo_id,cantidadProducto,usuario_id,cliente_id,total)VALUES('VART3','2018-06-16',3,3,3,9,120);
INSERT INTO venta(folio,fecha,articulo_id,cantidadProducto,usuario_id,cliente_id,total)VALUES('VART4','2018-06-16',4,2,3,8,40);
INSERT INTO venta(folio,fecha,articulo_id,cantidadProducto,usuario_id,cliente_id,total)VALUES('VART5','2018-06-17',5,5,4,7,200);
INSERT INTO venta(folio,fecha,articulo_id,cantidadProducto,usuario_id,cliente_id,total)VALUES('VART6','2018-06-17',6,6,4,6,72);
INSERT INTO venta(folio,fecha,articulo_id,cantidadProducto,usuario_id,cliente_id,total)VALUES('VART7','2018-06-18',7,8,5,5,80);
INSERT INTO venta(folio,fecha,articulo_id,cantidadProducto,usuario_id,cliente_id,total)VALUES('VART8','2018-06-18',8,4,5,4,52);

  