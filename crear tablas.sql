DROP DATABASE IF EXISTS mi_bd;
create database mi_bd;

use mi_bd;
DROP TABLE IF EXISTS departamentos;
CREATE TABLE departamentos (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50)
);
INSERT INTO departamentos (nombre) VALUES ('Recursos Humanos'), ('Ventas');

drop table if exists empleados;
CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    salario DECIMAL(10, 2),
    fecha_contratacion DATE
);
ALTER TABLE empleados MODIFY COLUMN edad INT NOT NULL;
ALTER TABLE empleados MODIFY COLUMN salario DECIMAL(10,2) default 0;
ALTER TABLE empleados ADD COLUMN departamento VARCHAR(50);
ALTER TABLE empleados ADD COLUMN correo_electronico VARCHAR(100) ;
ALTER TABLE empleados DROP COLUMN fecha_contratacion;
ALTER TABLE empleados ADD COLUMN fecha_contratacion DATETIME DEFAULT NOW() ;
ALTER TABLE empleados ADD COLUMN departamento_id INT;
ALTER TABLE empleados ADD CONSTRAINT fk_departamento FOREIGN KEY (departamento_id) REFERENCES departamentos(id);
alter table empleados drop column departamento;
ALTER TABLE empleados MODIFY correo_electronico VARCHAR(255)
GENERATED ALWAYS AS (CONCAT(nombre, '.', apellido, '@mail.com')) STORED;

INSERT INTO empleados (nombre, apellido, edad, salario, departamento_id)
VALUES ('Luis', 'Fernandez', 28, 2800, 2);

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(100)
);
INSERT INTO clientes (nombre, direccion) VALUES ('María García','Constitucion 456, Lujan');
INSERT INTO clientes (nombre, direccion) VALUES ('Juan Pérez', 'Libertad 3215, Mar del Plata');

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);
INSERT INTO productos (nombre, precio) VALUES ('Laptop', 1200.00);
UPDATE productos SET precio = 1350 WHERE nombre = 'Laptop';
INSERT INTO productos (nombre, precio) VALUES ('Telefono movil', 450.00);

CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT NOT NULL,
    cliente_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    monto_total DECIMAL(10, 2) NOT NULL,
    empleado_id INT NOT NULL,
    FOREIGN KEY (producto_id) REFERENCES productos(id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(id)
);
ALTER TABLE ventas 
MODIFY monto_total DECIMAL(10, 2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED;
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id)
VALUES (1, 1, 2, 1200.00, 1);