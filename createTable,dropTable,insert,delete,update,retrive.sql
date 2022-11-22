--create Student table

CREATE TABLE Student (
  id			VARCHAR2(13),
  name			VARCHAR2(13) NOT NULL,
  DOB			DATE,
  total_credits		NUMBER(5,2),
  CGPA			NUMBER(3,2),
  PRIMARY KEY (id),
  CHECK (CGPA >=0 AND CGPA <=4)
);

-- drop student table

DROP Student Table;

--insert a record into Student table

INSERT INTO Student VALUES 
	('2021-1-60-042','sumaiya','10/24/1998',140.00,2.34);

INSERT INTO Student VALUES 
	('2021-1-60-043','sanjida','10/17/1998',140.00,2.59);

INSERT INTO Student VALUES 
	('2021-1-60-044','atkeya','10/23/1998',140.00,3.16);

INSERT INTO Student VALUES 
	('2021-1-60-045','fahmida','10/12/1998',140.00,2.99);

INSERT INTO Student VALUES 
	('2021-1-60-042','tabassum','10/27/1998',140.00,3.66);

--delete a record from Student table

DELETE FROM Student
WHERE id = '2021-1-60-042';

--update an existing record of student table
UPDATE Student
SET CGPA =3.79
WHERE id ='2021-1--60-044';

--Rtrive data of Student table
--SELECT-FROM-WHERE querey

SELECT * FROM Student;

--Show id, name and cgpa of all students
SELECT id, name, cgpa
FROM Student;

--Show id,name,cgpa who have 
--cgpa more than or equal to 3

SELECT id,name,cgpa
FROM Student
WHERE CGPA => 3;