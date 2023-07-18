CREATE USER 'testuser'@'localhost' IDENTIFIED BY '1111';
CREATE ROLE testrole;
GRANT ALL PRIVILEGES ON world.* TO testrole;
GRANT testrole TO 'testuser'@'localhost';

GRANT ALL PRIVILEGES ON world.* TO testrole;

use world;

DESCRIBE city;

SELECT id, name
 FROM city;


SELECT id, name
 FROM city;

SELECT district, countrycode, name, id
 FROM city;

SELECT id, name, countrycode, district, population
 FROM city;


SELECT *
 FROM city
 WHERE countrycode = 'KOR';
 
 SELECT *
 FROM city
 WHERE countrycode IN ('KOR', 'JPN');
 
 SELECT *
 FROM city
 WHERE Population BETWEEN 100000 AND 150000;


SELECT *
 FROM city
 WHERE countrycode = 'KOR'
 AND district LIKE 'K%';

 SELECT *
 FROM city
 WHERE countrycode = 'KOR'
 OR district LIKE '%ong%';


SELECT *
 FROM city
 WHERE countrycode = 'KOR'
 AND district IN ('seoul', 'kyonggi');
 
SELECT name, continent, region
 FROM country
 WHERE population > 50000000
 ORDER BY continent, region;
 
 SELECT name, continent, region
 FROM country
 WHERE population > 50000000
 ORDER BY continent, region desc;
 
 SELECT @@session.sql_mode;
 SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT continent
 FROM country
 GROUP BY continent; 
 
 SELECT continent, region
 FROM country
 GROUP BY continent, region
 ORDER BY 1, 2;
 
 SELECT SUBSTRING(district, 1, 2) do
 FROM city
 WHERE countrycode = 'KOR'
 GROUP BY SUBSTRING(district, 1, 2)
 ORDER BY 1;

SELECT last_name
FROM sakila.actor
GROUP BY last_name;

SELECT last_name, COUNT(*)
FROM sakila.actor
GROUP BY last_name;



 SELECT continent
 FROM country
 GROUP BY region
 ORDER BY 1;
 
 SELECT last_name, COUNT(*)
FROM sakila.actor
GROUP BY last_name;


SELECT last_name, COUNT(*)
FROM sakila.actor
GROUP BY last_name
ORDER BY COUNT(*) DESC;


SELECT *
 FROM city
 LIMIT 5;
 
 SELECT *
 FROM country
 WHERE population > 1000000000
 ORDER BY 5 ASC
 LIMIT 5;

SELECT last_name, COUNT(*)
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) > 3;

use sakila;

SELECT c.customer_id AS 'Customer ID',
c.first_name AS 'First Name',
c.last_name AS 'Last Name',
 SUM(amount) AS 'Total Paid'
FROM sakila.payment p
INNER JOIN customer c ON
p.customer_id = c.customer_id
GROUP BY c.customer_id;


use mywork;

select *from highschool_students;

INSERT INTO highschool_students (student_no, student_name) VALUES
(20230013, 'Evelyn Parker');


rollback;
commit;


INSERT INTO highschool_students
(student_no, gender, age, enter_date) VALUES
(20230015, 'female', 23, '2023-02-03');
drop database mywork;
create database mywork;
Use mywork;
CREATE TABLE highschool_students2
(
    student_no   VARCHAR(20)   NOT NULL,
    student_name VARCHAR(100)  NOT NULL,
    grade        TINYINT           NULL,
    class        VARCHAR(50)       NULL,
    gender       VARCHAR(20)       NULL,
    age          SMALLINT          NULL,
    enter_date   DATE,
    PRIMARY KEY (student_no)
);

drop table highschool_students;

INSERT INTO highschool_students2 VALUES
(20230001, 'Celine Larsen', 75, 'English', 'female', NULL, '2023-02-03'),
(20230002, 'Max Matthews', 85, 'Mathematics', 'male', NULL, '2023-02-03'),
(20230003, 'Phil Lawrence', 55, 'Mathematics', 'male', 23, '2023-02-03'),
(20230004, 'Madison Hopkins', 60, 'English', 'female', 21, '2023-02-03'),
(20230005, 'Bailey Glisson', 60, 'English', 'female', 24, '2023-02-03'),
(20230006, 'Alex John', 55, 'English', 'male', 25, '2023-02-03'),
(20230007, 'Ernest Woolery', 78, 'Physics', 'male', 22, '2023-02-03'),
(20230008, 'Rolf Meyer', 85, 'Physics', 'male', 24, '2023-02-03'),
(20230009, 'Owen Turner', 78, 'Arts', 'male', 21, '2023-02-03'),
(20230010, 'Maya Lawrence', 55, 'English', 'female', 25, '2023-02-03'),
(20230011, 'Elissa Stark', 89, 'Arts', 'female', NULL, '2023-02-03'),
(20230012, 'Roselyn Mccarty', 94, 'Arts', 'female', 21, '2023-02-03'),
(20230013, 'Evelyn Parker', 88, 'Korean', 'female', 25, '2023-02-03'),
(20230014, 'Rosie Matthews', 88, 'Korean', 'female', 24, '2023-02-03'); 

INSERT INTO highschool_students
(student_no, gender, age, enter_date) VALUES
(20230015, 'female', 23, '2023-02-03');

INSERT INTO highschool_students
(grade, student_no, class, student_name, gender, age) VALUES
(88, 20230016, 'English', 'Jayden Simpson', 'male', 25);


select *from highschool_students;

UPDATE student_update2 a, student_update1 b
 SET a.age = b.age + 1000
 WHERE a.student_no = b.student_no;
 
CREATE TABLE student_update1 AS
SELECT *
 FROM highschool_students;
 
ALTER TABLE student_update1
 ADD CONSTRAINT PRIMARY KEY (student_no);

CREATE TABLE student_update2 AS
SELECT *
 FROM highschool_students
 WHERE student_no <= 20230004;

ALTER TABLE student_update2
 ADD CONSTRAINT PRIMARY KEY (student_no);

select *from student_update1;


commit;
UPDATE student_update1
 SET student_name = CONCAT(student_name, '2'),
 age = age + 100;
 
 rollback;

UPDATE student_update1
 SET student_no = student_no + 1
 WHERE student_no >= 20230014
 ORDER BY student_no DESC;


select *from student_update2;

update student_update2
set age = 25
where student_name = 'Max Matthews';

select *from student_delete;

delete from student_delete2;

drop table student_delete2;

CREATE TABLE student_delete AS
SELECT *
 FROM highschool_students;
 
ALTER TABLE student_delete
 ADD CONSTRAINT PRIMARY KEY (student_no);

CREATE TABLE student_delete2 AS
SELECT *
 FROM highschool_students2;

ALTER TABLE student_delete2
 ADD CONSTRAINT PRIMARY KEY (student_no);

select *from student_delete;

DELETE FROM student_delete
 WHERE age IS NULL;

DELETE FROM student_delete;

INSERT INTO student_delete
SELECT *
 FROM highschool_students;

SELECT *
 FROM student_delete
 WHERE student_name LIKE '%Matthews';

DELETE FROM student_delete
 WHERE student_name LIKE '%Matthews'
 ORDER BY student_no DESC
 LIMIT 1;
 
DELETE a, b	
 FROM student_delete a, student_delete2 b
 WHERE a.student_no = b.student_no; 

rollback;

DELETE FROM student_delete
 WHERE student_name LIKE '%Matthews'
 ORDER BY student_no DESC
 LIMIT 1;

select *from student_delete;

DELETE FROM student_delete
 WHERE student_name LIKE '%Matthews'
 ORDER BY student_no DESC
 LIMIT 1;

delete from highschool_students;

drop table highschool_students;

iNSERT INTO highschool_students VALUES
(20230001, 'Celine Larsen', 75, 'English', 'female', NULL, '2023-02-03'),
(20230002, 'Max Matthews', 85, 'Mathematics', 'male', NULL, '2023-02-03'),
(20230003, 'Phil Lawrence', 55, 'Mathematics', 'male', 23, '2023-02-03'),
(20230004, 'Madison Hopkins', 60, 'English', 'female', 21, '2023-02-03'),
(20230005, 'Bailey Glisson', 60, 'English', 'female', 24, '2023-02-03'),
(20230006, 'Alex John', 55, 'English', 'male', 25, '2023-02-03'),
(20230007, 'Ernest Woolery', 78, 'Physics', 'male', 22, '2023-02-03'),
(20230008, 'Rolf Meyer', 85, 'Physics', 'male', 24, '2023-02-03'),
(20230009, 'Owen Turner', 78, 'Arts', 'male', 21, '2023-02-03'),
(20230010, 'Maya Lawrence', 55, 'English', 'female', 25, '2023-02-03'),
(20230011, 'Elissa Stark', 89, 'Arts', 'female', NULL, '2023-02-03'),
(20230012, 'Roselyn Mccarty', 94, 'Arts', 'female', 21, '2023-02-03'),
(20230013, 'Evelyn Parker', 88, 'Korean', 'female', 25, '2023-02-03'),
(20230014, 'Rosie Matthews', 88, 'Korean', 'female', 24, '2023-02-03'),
(20230015, 'Chelsea Duncan', 70, 'English', 'female', 23, '2023-02-03'),
(20230016, 'Jayden Simpson', 88, 'English', 'male', 25, '2023-02-03'),
(20230017, 'Harry Ross', 54, 'Arts', 'male', NULL, '2023-02-03'),
(20230018, 'Aidan Brooks', 75, 'Physics', 'male', 23, '2023-02-03'),
(20230019, 'Lucca Hardin', 18, 'Music', 'male', 21, '2023-02-03'),
(20230020, 'Caitlin Rogers', 65, 'Music', 'female', 20, '2023-02-03');


select *from student_delete;

DELETE a, b
 FROM student_delete a, student_delete2 b
 WHERE a.student_no = b.student_no;
 
 rollback;
 
 DELETE FROM student_delete
 WHERE student_name LIKE '%Matthews'
 ORDER BY student_no DESC
 LIMIT 1;
 
 