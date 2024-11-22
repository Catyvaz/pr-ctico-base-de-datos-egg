use mi_bd;

select * from empleados;
select * from empleados where id in (1,2,5);

SELECT * FROM productos WHERE nombre like '%Telefono%';

SELECT * from empleados ORDER BY salario ASC;
SELECT * from empleados ORDER BY salario DESC;

select * from productos ORDER BY nombre DESC;
select * from ventas ORDER BY cantidad ASC, precio_unitario DESC;
select * from productos ORDER BY precio DESC LIMIT 5;
select * from productos where precio = 500;
insert into productos (nombre, precio) values ('Almohada', 500);
select * from empleados ORDER BY apellido asc LIMIT 10;
select * from ventas ORDER BY monto_total DESC LIMIT 3;

select id, salario, salario*1.1 as "aumento 10%" from empleados; 

SELECT cliente_id, (SELECT nombre FROM clientes WHERE id = cliente_id) AS nombre, SUM(monto_total) AS 'Total Comprado' FROM VENTAS
GROUP BY cliente_id;

SELECT CONCAT(nombre, ' ',apellido) AS 'Nombre y Apellido' FROM EMPLEADOS;

SELECT nombre, edad,
CASE
WHEN edad >= 40 THEN 'Mayor'
WHEN edad >= 30 AND edad < 40 THEN 'Adulto'
ELSE 'Joven'
END AS categoria_edad
FROM EMPLEADOS
ORDER BY edad DESC;


select id, cantidad from ventas where cantidad = (select max(cantidad) from ventas);

select * from ventas where cantidad = 5;

"""Encuentra los departamentos con un salario promedio de sus empleados superior a $3,000."""

SELECT nombre, edad,
CASE
WHEN edad >= 40 THEN 'Mayor'
WHEN edad >= 30 AND edad < 40 THEN 'Adulto'
ELSE 'Joven'
END AS categoria_edad
FROM EMPLEADOS
ORDER BY edad DESC;

SELECT nombre,
CASE
WHEN nombre LIKE 'A%' THEN 'Comienza con A'
WHEN nombre LIKE 'M%' THEN 'Comienza con M'
ELSE 'Otros'
END AS Categoria
FROM clientes
ORDER BY nombre ASC;

SELECT MIN(edad) FROM EMPLEADOS;

SELECT cantidad FROM VENTAS ORDER BY cantidad DESC LIMIT 1;

SELECT id, cantidad FROM VENTAS WHERE cantidad = (SELECT MAX(cantidad) FROM VENTAS);

SELECT COUNT(*) FROM PRODUCTOS WHERE precio > 500;

SELECT departamento_id, (SELECT nombre FROM departamento WHERE id = departamento_id) AS nombre_departamento,
AVG(salario) AS salario_promedio
FROM empleados
GROUP BY departamento_id
HAVING salario_promedio > 3000;