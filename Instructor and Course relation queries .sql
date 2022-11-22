drop table Instructor_2021160042 cascade constraints;
drop table CSE302_2021160042 cascade constraints;

CREATE TABLE Instructor_2021160042(
id NUMBER,
name VARCHAR2(13),
dept_name VARCHAR2(10),
salary NUMBER
);

CREATE TABLE CSE302_2021160042(
course_id VARCHAR(13),
title VARCHAR(50),
dept_name VARCHAR(10),
credits NUMBER
);


INSERT INTO Instructor_2021160042 	VALUES(10101,'Srinivasan','Comp.Sci.',65000);

INSERT INTO Instructor_2021160042 	VALUES(12121,'Wu','Finance',90000);

INSERT INTO Instructor_2021160042 	VALUES(15151,'Mozart','Music',40000);

INSERT INTO Instructor_2021160042 	VALUES(22222,'Einstein','Physics',95000);

INSERT INTO Instructor_2021160042 
	VALUES(32342,'El Said','History',60000);

INSERT INTO Instructor_2021160042 	VALUES(33456,'Gold','Physics',87000);

INSERT INTO Instructor_2021160042 
	VALUES(45565,'Katz','Comp.Sci.',75000);

INSERT INTO Instructor_2021160042 	VALUES(58583,'Califieri','History',62000);

INSERT INTO Instructor_2021160042 	VALUES(76543,'Singh','Finance',80000);

INSERT INTO Instructor_2021160042 	VALUES(76766,'Crick','Biology',72000);

INSERT INTO Instructor_2021160042 	VALUES(83821,'Brandt','Comp.Sci.',92000);

INSERT INTO Instructor_2021160042 	VALUES(98345,'Kim','Elec.Eng.',80000);



INSERT INTO CSE302_2021160042
	VALUES ('BIO-101','Intro.to Biology','Biology',4);

INSERT INTO CSE302_2021160042 
	VALUES ('BIO-301','Intro.to Biology','Biology',4);

INSERT INTO CSE302_2021160042 
	VALUES ('BIO-399','Genetics','Biology',3);

INSERT INTO CSE302_2021160042 
	VALUES ('CS-101','Intro.to Computer      
                                       Science','Comp.Sci.',4);

INSERT INTO CSE302_2021160042 
	VALUES ('CS-190','Game Design','Comp.Sci.',4);

INSERT INTO CSE302_2021160042 
	VALUES ('CS-315','Robotics','Comp.Sci.',3);

INSERT INTO CSE302_2021160042 
	VALUES ('CS-319','Image Processing','Comp.Sci.',3);

INSERT INTO CSE302_2021160042 
	VALUES ('CS-347','Database System 
                                       Concepts','Comp.Sci.',3);

INSERT INTO CSE302_2021160042 
	VALUES ('EE-181','Intro.to Digital System','Elec.Eng',3);

INSERT INTO CSE302_2021160042 
	VALUES ('FIN-201','Investment Banking','Finance',3);

INSERT INTO CSE302_2021160042 
	VALUES ('HIS-351','World History','History',3);

INSERT INTO CSE302_2021160042 
	VALUES ('MU-199','Music Video Production','Music',3);

INSERT INTO CSE302_2021160042 
	VALUES ('PHY-101','Physics Principles','Physics',4);



--Show instructor name only

SELECT name FROM Instructor_2021160042;

--Show course id and title only

SELECT course_id,title FROM  CSE302_2021160042;

--Find instructor name and department of the instructor with id=22222

SELECT name, dept_name FROM Instructor_2021160042
WHERE id=22222;

--Find course title and credits of the courses offered by ‘Comp. Sci.’ department

SELECT title,credits FROM  CSE302_2021160042
WHERE dept_name='Comp.Sci.';

--Find name and department of instructors who have a salary more than 70000

SELECT name,dept_name FROM Instructor_2021160042
WHERE salary>70000;

--Find course title of the courses which are not less than credits

SELECT title FROM  CSE302_2021160042
WHERE credits > = 4;

--Find name and department of instructors who have a salary in between 80000 and 100000 (bounds are inclusive).

SELECT name,dept_name FROM Instructor_2021160042
WHERE salary BETWEEN 80000 AND 100000;

--Find course titles and credits of the courses not offered by ‘Comp. Sci.’ department

SELECT title,credits FROM  CSE302_2021160042
WHERE dept_name NOT IN('Comp.Sci.');

--Display all records of instructor table

SELECT * FROM Instructor_2021160042;

--Find all courses (display all columns) which are offered by
‘Biology’ department and credits is not 4

SELECT * FROM  CSE302_2021160042
WHERE dept_name='Biology' And credits !=4;
