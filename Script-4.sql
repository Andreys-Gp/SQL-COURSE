CREATE DATABASE curso_sql;
DROP DATABASE curso_sql;
USE curso_sql;
SHOW TABLES;

DROP TABLE armaduras;

/* motores de tablas*/
CREATE TABLE armaduras_myisam(
	armadura_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	armadura VARCHAR(30)NOT NULL
)ENGINE = MyISAM DEFAULT CHARSET=utf8mb4;

CREATE TABLE armaduras_innodb(
	armadura_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	armadura VARCHAR(30)NOT NULL
)ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

/* RESTRICCIONES (DELETE Y UPDATE)
 * CASCADE
 * SET NULL
 * SET DEFAULT 
 * RESTRICT
 *
 * */
CREATE TABLE lenguajes(
	lenguaje_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	lenguaje VARCHAR(30) NOT NULL
);
INSERT INTO lenguajes(lenguaje)VALUES
	('JavaScript'),
	('PHP'),
	('Python'),
	('Ruby'),
	('JAVA');

CREATE TABLE entornos(
	entorno_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	entorno VARCHAR(30) NOT NULL 
);

INSERT INTO entornos (entorno) VALUES 
	('Frontend'),
	('Backend');

CREATE TABLE frameworks(
	framework_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	framework VARCHAR(30) NOT NULL,
	lenguaje INT UNSIGNED,
	entorno INT UNSIGNED,	
	FOREIGN KEY (lenguaje) 
		REFERENCES lenguajes(lenguaje_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE ,
	FOREIGN KEY (entorno)	
		REFERENCES entornos(entorno_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
	);

INSERT INTO frameworks(framework,lenguaje,entorno) VALUES  
	('React',1,1),
	('Angular',1,1),
	('Vue',1,1),
	('Svelte',1,1),
	('Laravel',2,2),
	('Symfony',2,2),
	('Flask',3,2),
	('Django',3,2),
	('On Rails',4,2);

SELECT * FROM lenguajes;
SELECT * FROM frameworks;
SELECT * FROM entornos LIMIT 200;

SELECT *
	FROM frameworks f 
	INNER JOIN lenguajes l
	ON f.lenguaje=l.lenguaje_id;
SELECT *
	FROM frameworks f
	INNER JOIN lenguajes l ON f.lenguaje = l.lenguaje_id
	INNER JOIN entornos e ON f.entorno = e.entorno_id;


DELETE FROM lenguajes WHERE lenguaje_id=5;
UPDATE lenguajes SET lenguaje_id = 13 WHERE lenguaje_id = 3;
DROP TABLE lenguajes;	
DROP TABLE frameworks;

START TRANSACTION;
	DELETE FROM frameworks;
	UPDATE frameworks SET framework = 'Vue.js' WHERE  framework_id = 11;
	INSERT INTO framework VALUES(0,'Spring',5,2);
ROLLBACK; 
COMMIT;


/* INCRIPTACION */ 

SELECT MD5('mi Super Clave');
SELECT SHA1('Mi super Clave');
SELECT SHA2('mi Super Clave ',256);
SELECT AES_ENCRYPT('mi SuperClave =)','palabra_secreta');
SELECT AES_DECRYPT(nombredecampo,palabrasecreta);


USE curso_sql;

CREATE TABLE pagos_recurrentes(
	cuenta VARCHAR(8) PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	tarjeta BLOB
);

INSERT INTO pagos_recurrentes VALUES
  ('12345678', 'Jon', AES_ENCRYPT('1234567890123488', '12345678')),
  ('12345677', 'Irma', AES_ENCRYPT('1234567890123477', '12345677')),
  ('12345676', 'Kenai', AES_ENCRYPT('1234567890123466', '12345676')),
  ('12345674', 'Kala', AES_ENCRYPT('1234567890123455', 'super_llave')),
  ('12345673', 'Miguel', AES_ENCRYPT('1234567890123444', 'super_llave'));

SELECT * FROM pagos_recurrentes;
SELECT CAST(AES_DECRYPT(tarjeta,'12345677') AS CHAR) AS tdc, nombre
	FROM pagos_recurrentes;


