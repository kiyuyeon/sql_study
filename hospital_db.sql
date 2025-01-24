CREATE DATABASE hospital_db default CHARACTER SET UTF8; 
SHOW DATABASES;
use hospital_db;


CREATE TABLE user
(
     _id INT PRIMARY KEY AUTO_INCREMENT,
     usr_id VARCHAR(32) NOT NULL,
     password VARCHAR(32) NOT NULL,
     name VARCHAR(32) NOT NULL,
     phone VARCHAR(12)
);
select *from user;
DESCRIBE user;

INSERT INTO user
(usr_id,password, name, phone)
VALUES('1','1','1','1');

CREATE TABLE user
(
     _id INT PRIMARY KEY AUTO_INCREMENT,
     usr_id VARCHAR(32) NOT NULL,
     password VARCHAR(32) NOT NULL,
     name VARCHAR(32) NOT NULL,
     phone VARCHAR(12)
);


create table hosipital
(
	_id INT PRIMARY KEY AUTO_INCREMENT,
	hosipital VARCHAR(32) NOT NULL,
    city​_code varchar(32) NOT NULL,
    city_name varchar(32) NOT NULL,
    hospital_address varchar(300) NOT NULL,
    Coordinates_X varchar(100) NOT NULL,
    Coordinates_Y varchar(100) NOT NULL
);
SHOW TABLES;

SELECT * FROM hos;
