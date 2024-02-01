DROP TABLE IF EXISTS characters_items;
DROP TABLE IF EXISTS characters_weapons;
DROP TABLE IF EXISTS characters_stats;
DROP TABLE IF EXISTS weapons;
DROP USER IF EXISTS 'commentarios'@'localhost';

DROP TABLE IF EXISTS comments;

DROP TABLE IF EXISTS stats;
DROP TABLE IF EXISTS weapons_types;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS characters;

CREATE TABLE comments (
	id_coment INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`comment` TEXT NOT NULL,
	`datetime` DATETIME NOT NULL DEFAULT now() );
CREATE USER 'commentarios'@'localhost';
	GRANT SELECT, INSERT on faryadventures.comments to 'commentarios'@'localhost'; 

CREATE TABLE characters (
	id_character INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(24) NOT NULL,
	age INT(11),
	gender CHAR(2),
	level INT(11),
	health INT,
	height FLOAT,
	weight FLOAT,
	origin CHAR(2)
);
INSERT INTO characters (
	name, 
	age, 
	gender, 
	level, 
	health, 
	height, 
	weight, 
	origin
)
VALUES
	('EL Fary', 86, 'N', 200, 70, 1.2, 47, 'GY'),
	('El Cigala', 640, 'M', 200, 80, 2.4, 150, 'RU'),
	('El Churumbel', 33, 'M', 33,33, 3.3, 333, 'AS'),
	('El Kiko', -1, 'F', 69, 100, 1.1, 420, 'RE'),
	('El Escalona', 45,'N',10 , 1, 1.8,80,'SN');

CREATE TABLE stats(
	id_stat INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	reputation INT(11),
	speed INT(11),
	morality INT (11),
	hungrer INT (11),
	stamina INT (11),
	defense INT (11),
	reflex INT (11),
	id_character INT UNSIGNED NOT NULL
);

INSERT INTO stats(
	reputation, 
	speed, 
	morality, 
	hungrer, 
	stamina, 
	defense, 
	reflex, 
	id_character
)
VALUES
	(100, 40, 80, 0, -1, 0, 0, 1),
	(69 , 50, 40, 0, 5, 1, 10, 2),
	(70 , 30, 75, 0, 50, 7, 333, 3),
	(90 , 60, 80, 4, 0, 1, 420, 4);

CREATE TABLE items(
	id_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	item CHAR (24) NOT NULL,
	type CHAR (24) NOT NULL,
	equipable BOOLEAN NOT NULL,
	consumible BOOLEAN NOT NULL,
	rarity INT(11) NOT NULL,
	quantity INT (11) NOT NULL,
	shape INT (11) NOT NULL,
	uses INT (11) NOT NULL,
	id_character INT UNSIGNED NOT NULL

);

INSERT INTO items (
	item,
    type, 
	equipable, 
	consumible, 
	rarity, 
	quantity, 
	shape, 
	uses, 
	id_character
)
VALUES
	('Bollo', 'Comida', 0.1, 3, 0 ,5, 1, 20, 1),
	('guitarra flamenca', 'instrumento', 1, 0, 30, 67, 1, 3 ,4),
	('piti', 'Droga', 1, 1, 80, 5, 2, 1 ,3),
	('portatil', 'tecnologia', 2, 5, 30, 50, 9,213, 1),
	('panderete', 'instrumento', 0.2, 1, 1, 40, 100, 98, 1),
	('piano', 'instrumento', 7, 1, 1, 75, 200, 30, 1),
	('escobilla de vater', 'limpieza', 1, 0, 324, 3456, 1, 1, 3);

CREATE TABLE characters_items (
	id_character_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_character INT UNSIGNED NOT NULL,
	id_item INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_character) REFERENCES characters (id_character)
);

INSERT INTO characters_items (
	id_character,
	id_item
	
)
VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4);

CREATE TABLE weapons_types(
	id_weapon_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	type CHAR (24)
);

INSERT INTO weapons_types(type)
VALUES
	('Meele'),
	('Proyectil');

CREATE TABLE weapons (
	id_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	weapon CHAR (24) NOT NULL,
	level INT(24) NOT NULL,
	price FLOAT(24) NOT NULL,
	damage INT(24) NOT NULL,
	critical INT(24) NOT NULL,
	weigth FLOAT NOT NULL,
	id_weapon_type INT UNSIGNED
);

INSERT INTO weapons (
	weapon, 
	level, 
	price, 
	damage, 
	critical, 
	weigth, 
	id_weapon_type
)
VALUES
	('puños', 5, 0, 10, 5, 0.25, 1),
	('spas-12', 42, 400, 370, 23, 1.23, 2),
	('extensible', 40, 540, 680, 89, 2, 1),
	('espada', 20, 400, 234, 453, 2.5, 1),
	('libros', 30, 234,876, 876, 6, 2);


CREATE TABLE characters_weapons (
	id_character_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_character INT UNSIGNED NOT  NULL,
	id_weapon INT UNSIGNED
);
INSERT INTO characters_weapons (
	id_character, 
	id_weapon
)
VALUES
	(2, 3),
	(3,1),
	(1,3);

