

/*
SINTAXIS TRIGGERS

DELIMITER //
CREATE TRIGGER nombre_disparador
  [BEFORE | AFTER] [INSERT | UPDATE | DELETE]
  ON nombre_tabla
  FOR EACH ROW
BEGIN
END //
DELIMITER ;

*/

DELIMITER //
CREATE TRIGGER tg_actividad_clientes
	AFTER INSERT 
	ON clientes
	FOR EACH ROW
	BEGIN
		INSERT INTO actividad_clientes VALUES (0, NEW.cliente_id, NOW() );
	END //
	
DELIMITER ;
