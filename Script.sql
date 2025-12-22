/* 
comentario de varias lineas de ejemplo
*/
SHOW DATABASES;
CREATE DATABASE curso_sql;
CREATE DATABASE  IF NOT EXISTS para_brayan;
CREATE USER IF NOT EXISTS 'brayan'@'localhost' IDENTIFIED BY 'Andreys.1206'; 
GRANT ALL PRIVILEGES ON para_brayan.* TO 'brayan'@'localhost';
FLUSH PRIVILEGES;
SHOW DATABASES;
SELECT User, Host FROM mysql.user WHERE User = 'brayan';
SHOW DATABASES;
FLUSH PRIVILEGES; /* actualizar privilegios */
SHOW GRANTS FOR 'brayan'@'localhost'; /*para saber en que base de datos tengo privilegios*/
USE curso_sql;
SHOW TABLES;
USE sys;
SHOW TABLES;
DESCRIBE host_summary;
USE curso_sql;
CREATE TABLE usuarios(
 nombre VARCHAR(50),
 correo VARCHAR(50)
);
SHOW TABLES;
ALTER TABLE usuarios ADD COLUMN cumpleaños VARCHAR(15);
ALTER TABLE usuarios MODIFY cumpleaños DATE;
ALTER TABLE usuarios RENAME COLUMN cumpleaños TO nacimiento;
ALTER TABLE usuarios DROP COLUMN nacimiento;
DROP TABLE usuarios;
CREATE TABLE usuarios(
	usuario_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	apellidos VARCHAR(30) NOT NULL,
	correo VARCHAR(50) UNIQUE NOT NULL,
	direccion VARCHAR(100) DEFAULT 'sin direccion',
	edad INT DEFAULT 0

);
DESCRIBE usuarios;
INSERT INTO usuarios VALUES (
	0,
	"Brayan Andreys",
	"Gonzalez Perez",
	"brayan6gonzalez@gmail.com",
	"calle 21 # 12-06 Alfonso Lopez",
	26
);
USE curso_sql;
SELECT * FROM usuarios;
INSERT INTO usuarios (nombre,apellidos,correo) VALUES ("Brayan Tomas","Moros Torres","menosres@gmail.com");
INSERT INTO usuarios SET nombre="Robin", apellidos="gregorio", correo="pruebas@gmail.com";
SELECT  * FROM usuarios;
ALTER TABLE usuarios ALTER COLUMN direccion SET DEFAULT 'sin direccion';
SELECT * FROM usuarios;
SELECT * FROM usuarios WHERE correo NOT LIKE '@gmail.com';
SELECT * FROM usuarios WHERE nombre LIKE '%B%';
SELECT * FROM usuarios WHERE nombre NOT LIKE '%B%';
SELECT * FROM usuarios WHERE direccion != 'sin direccion'  OR nombre = '%b%';

UPDATE usuarios SET direccion='calle 21 santo domingo', edad = 26 
WHERE usuario_id = 4;
SELECT * FROM usuarios;
DELETE FROM usuarios WHERE usuario_id = 6;

TRUNCATE TABLE usuarios; --para reiniciar una tabla 


