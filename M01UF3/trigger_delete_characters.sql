DROP TABLE IF EXISTS dead_characters;
DROP TRIGGER IF EXISTS kill_character;

CREATE TABLE dead_characters(
	id_dead_character INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(24),
	dead_time DATETIME NOT NULL DEFAULT now()
);
CREATE TRIGGER kill_character AFTER DELETE on characters FOR EACH ROW INSERT INTO dead_characters(name) VALUES(old.name);



DELIMITER $$
CREATE TRIGGER kill_character_CSV AFTER DELETE on characters FOR EACH ROW
BEGIN
	CALL convert_CVS();
END&&
DELIMITER;;

DELIMITER $$
CREATE PROCEDURE convert_CVS()
BEGIN
	DECLARE id_character_var INT UNSIGNED;
	DECLARE name_var VARCHAR(24);
	DECLARE cursor_var CURSOR FOR SELECT id_character, name FROM characters;
	DECLARE fin_var BOOLEAN DEFAULT false;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_var=true;
	
	OPEN cursor_var;
	
	buble:LOOP
	
	FECH cursor_var INTO id_characters_var, name_var;
	
	IF fin_var THEN
		LEAVE buble;
	END IF;

	SELECT CONCAT(id_character,";",name";")
END LOOP buble:
CLOSE cursor_var;

END$$
DELIMITER;;
