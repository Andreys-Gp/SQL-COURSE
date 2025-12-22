DROP DATABASE curso_sql;
CREATE DATABASE curso_sql;
USE curso_sql;
SHOW TABLES;
CREATE TABLE usuarios(
	usuario_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	apellidos VARCHAR(30) NOT NULL,
	correo VARCHAR(50) UNIQUE,
	edad INT DEFAULT 0
);
INSERT  INTO usuarios(nombre,apellidos,correo,edad) VALUES
	("Brayan","Gonzalez","brayan6gonzalez@gmail.com",26),
	("Kenai","Love","kenai@gmail.com",18),
	("Irma","Rueda","Irma@gmail.com",34),
	("Rosita","Campos","rosita@gmail.com",44),
	("Pepito","Perez","pepito@gmail.com",33),
	("Macario","Rosel","macario@gmail.com",64);

CREATE TABLE productos(
	producto_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR (50),
	precio DECIMAL(7,2),
	cantidad INT UNSIGNED
);
INSERT  INTO productos(nombre,descripcion,precio,cantidad) VALUES
	("computadora","macbook air m2", 29999.1, 5),
	("celular","nothing phone 1", 11999.99 , 15),
	("camara web","logitech c920", 1500, 13),
	("microfono","blue yeti", 2500, 19),
	("audifonos","audifonos bose", 6500, 10);
#funciones matematicas
SELECT 6+5 AS calculo;
SELECT MOD(4,2) AS modulo;
SELECT CEILING(7.1) AS numero_proximo;
SELECT FLOOR(7.9) AS numero_inferior;
SELECT ROUND(7.5) AS redondeo;
SELECT POWER(2,6) AS potenciar;
SELECT SQRT(81) AS raiz_cuadrada;


#columnas calculadas 
USE curso_sql;
SELECT nombre,precio,cantidad,(precio*cantidad) AS ganancia FROM productos;

#funciones de agrupamiento
SELECT MAX(precio) AS precio_maximo FROM   productos;
SELECT MIN(precio) AS precio_minimo FROM productos;
SELECT * FROM productos;
SELECT SUM(cantidad) AS existencias FROM productos;
SELECT AVG(precio) AS precio_promedio FROM productos;
SELECT COUNT(*) AS producto_total FROM productos;
SELECT nombre, precio, MAX(precio) AS precio_maximo FROM productos GROUP BY precio,nombre;

CREATE TABLE caballeros(
	caballero_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(30),
	armadura VARCHAR(30),
	rango VARCHAR(30),
	signo VARCHAR(30),
	ejercito VARCHAR(30),
	pais VARCHAR(30)
);

INSERT INTO caballeros VALUES
  (0,"Seiya","Pegaso","Bronce","Sagitario","Athena","Japón"),
  (0,"Shiryu","Dragón","Bronce","Libra","Athena","Japón"),
  (0,"Hyoga","Cisne","Bronce","Acuario","Athena","Rusia"),
  (0,"Shun","Andromeda","Bronce","Virgo","Athena","Japón"),
  (0,"Ikki","Fénix","Bronce","Leo","Athena","Japón"),
  (0,"Kanon","Géminis","Oro","Géminis","Athena","Grecia"),
  (0,"Saga","Géminis","Oro","Géminis","Athena","Grecia"),
  (0,"Camus","Acuario","Oro","Acuario","Athena","Francia"),
  (0,"Rhadamanthys","Wyvern","Espectro","Escorpión","Hades","Inglaterra"),
  (0,"Kanon","Dragón Marino","Marino","Géminis","Poseidón","Grecia"),
  (0,"Kagaho","Bennu","Espectro","Leo","Hades","Rusia");


SELECT * FROM caballeros;
SELECT signo, COUNT(*) AS total_signos FROM caballeros GROUP BY signo;
SELECT rango, COUNT(*) AS total FROM caballeros GROUP BY rango;
SELECT rango, COUNT(*) AS total FROM  caballeros WHERE ejercito="Athena" GROUP BY rango;
SELECT rango, COUNT(*) AS total FROM caballeros  WHERE ejercito="Athena" GROUP BY rango HAVING total >= 4;
SELECT nombre, precio, MAX(precio) AS precio_maximo FROM productos GROUP BY precio,nombre HAVING precio_maximo >= 10000;

SELECT DISTINCT signo FROM caballeros;
SELECT * FROM caballeros ORDER BY nombre ASC;
SELECT * FROM caballeros ORDER BY nombre,signo DESC;
SELECT * FROM caballeros WHERE ejercito="Athena"  ORDER BY nombre,signo DESC;
SELECT ejercito,COUNT(*) AS total FROM caballeros GROUP BY ejercito ORDER BY ejercito DESC;
SELECT nombre, precio, MAX(precio) AS precio_maximo FROM productos GROUP BY precio,nombre HAVING precio_maximo >= 10000 ORDER BY nombre;

SELECT * FROM productos WHERE precio >= 5000 AND precio <=15000;
SELECT * FROM productos WHERE precio BETWEEN 5000 AND 15000;
SELECT * FROM productos WHERE nombre REGEXP "[a-z]";
SELECT * FROM productos WHERE descripcion REGEXP "[0-9]";

SELECT  LOWER('Hola Mundo');
SELECT LCASE('Hola Mundo');
SELECT UPPER('Hola Mundo');
SELECT UCASE('Hola Mundo');
SELECT LEFT('Hola Mundo',6);
SELECT RIGHT('Hola Mundo',6);
SELECT LENGTH('Hola Mundo');
SELECT REPEAT('Hola Mundo',3);
SELECT REVERSE('Hola Mundo');
SELECT REPLACE('Hola Mundo','o','p');
SELECT LTRIM('   Hola Mundo   ');
SELECT RTRIM('Hola Mundo');
SELECT TRIM('Hola Mundo');
SELECT CONCAT('Hola Mundo',' desde',' colombia');
SELECT CONCAT_WS('-','Hola','Mundo','desde','Colombia');
SELECT UPPER(nombre), LOWER(descripcion),precio FROM productos;

SHOW INDEX FROM usuarios;









