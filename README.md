# Software Architecture
This repository is used to store the labs and projects of software architecture course.

'''
Laboratory #1 - SQL Script
CREATE TABLE cliente (id VARCHAR(255) NOT NULL, apellido VARCHAR(255), email VARCHAR(255), nombre VARCHAR(255), telefono VARCHAR(255), PRIMARY KEY (id));
CREATE TABLE venta (idVenta INTEGER AUTO_INCREMENT NOT NULL, fecha DATE, precio INTEGER, comprador VARCHAR(255), matricula VARCHAR(255), vendedor VARCHAR(255), PRIMARY KEY (idVenta));
CREATE TABLE vehiculo (matricula VARCHAR(255) NOT NULL, imagen LONGBLOB, marca VARCHAR(255), modelo VARCHAR(255), precio INTEGER, tipo VARCHAR(255), PRIMARY KEY (matricula));
CREATE TABLE administrador (id VARCHAR(255) NOT NULL, apellido VARCHAR(255), nombre VARCHAR(255), password VARCHAR(255), username VARCHAR(255), PRIMARY KEY (id));
ALTER TABLE venta ADD CONSTRAINT FK_venta_comprador FOREIGN KEY (comprador) REFERENCES cliente (id);
ALTER TABLE venta ADD CONSTRAINT FK_venta_vendedor FOREIGN KEY (vendedor) REFERENCES administrador (id);
ALTER TABLE venta ADD CONSTRAINT FK_venta_matricula FOREIGN KEY (matricula) REFERENCES vehiculo (matricula);

'''
