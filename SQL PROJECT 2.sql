CREATE DATABASE  HR_DATABASE_MANAGEMENT_SYSTEM
drop DATABASE [HR_DATABASE_MANAGEMENT_SYSTEM]
CREATE TABLE regions (
	region_id INT PRIMARY KEY,
	region_name VARCHAR (25) DEFAULT NULL
);

CREATE TABLE countries (
	country_id CHAR (2) PRIMARY KEY,
	country_name VARCHAR (40) DEFAULT NULL,
	region_id INT NOT NULL,
	FOREIGN KEY (region_id) REFERENCES regions (region_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE locations (
	location_id INT PRIMARY KEY,
	street_address VARCHAR (40) DEFAULT NULL,
	postal_code VARCHAR (12) DEFAULT NULL,
	city VARCHAR (30) NOT NULL,
	state_province VARCHAR (25) DEFAULT NULL,
	country_id CHAR (2) NOT NULL,
	FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE jobs
(
	job_id INT PRIMARY KEY,
	job_title VARCHAR (35) NOT NULL,
	min_salary DECIMAL (8, 2) DEFAULT NULL,
	max_salary DECIMAL (8, 2) DEFAULT NULL
);
CREATE TABLE departments (
	department_id INT PRIMARY KEY,
	department_name VARCHAR (30) NOT NULL,
	location_id INT DEFAULT NULL,
	FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR (20) DEFAULT NULL,
	last_name VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	phone_number VARCHAR (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id INT NOT NULL,
	salary DECIMAL (8, 2) NOT NULL,
	manager_id INT DEFAULT NULL,
	department_id INT DEFAULT NULL,
	FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);

CREATE TABLE dependents (
	dependent_id INT PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	relationship VARCHAR (25) NOT NULL,
	employee_id INT NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO regions VALUES 
(1,'Europe'),
(2,'Americas'),
(3,'Asia'),
(4,'Middle East and Africa')
SELECT * FROM regions

INSERT INTO countries VALUES 
('AR','Argentina',2),
('AU','Australia',3),
('BE','Belgium',1),
('BR','Brazil',2),
('CA','Canada',2),
('CH','Switzerland',1),
('CN','China',3),
('DE','Germany',1),
('DK','Denmark',1),
('EG','Egypt',4),
('FR','France',1),
('HK','HongKong',3),
('IL','Israel',4),
('IN','India',3),
('IT','Italy',1),
('JP','Japan',3),
('KW','Kuwait',4),
('MX','Mexico',2),
('NG','Nigeria',4),
('NL','Netherlands',1),
('SG','Singapore',3),
('UK','United Kingdom',1),
('US','United States of America',2),
('ZM','Zambia',4),
('ZW','Zimbabwe',4)

SELECT * FROM[dbo].[countries]

INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)VALUES 
(1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US'),
(1500,'2011 Interiors Blvd','99236','South San Francisco','California','US'),
(1700,'2004 Charade Rd','98199','Seattle','Washington','US'),
(1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA'),
(2400,'8204 Arthur St',NULL,'London',NULL,'UK'),
(2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK'),
(2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE')

SELECT * FROM[dbo].[locations]

INSERT INTO  jobs(job_id,job_title,min_salary,max_salary)VALUES 
(1,'Public Accountant',4200.00,9000.00),
(2,'Accounting Manager',8200.00,16000.00),
(3,'Administration Assistant',3000.00,6000.00),
(4,'President',20000.00,40000.00),
(5,'Administration Vice President',15000.00,30000.00),
(6,'Accountant',4200.00,9000.00),
(7,'Finance Manager',8200.00,16000.00),
(8,'Human Resources Representative',4000.00,9000.00),
(9,'Programmer',4000.00,10000.00),
(10,'Marketing Manager',9000.00,15000.00),
(11,'Marketing Representative',4000.00,9000.00),
(12,'Public Relations Representative',4500.00,10500.00),
(13,'Purchasing Clerk',2500.00,5500.00),
(14,'Purchasing Manager',8000.00,15000.00),
(15,'Sales Manager',10000.00,20000.00),
(16,'Sales Representative',6000.00,12000.00),
(17,'Shipping Clerk',2500.00,5500.00),
(18,'Stock Clerk',2000.00,5000.00),
(19,'Stock Manager',5500.00,8500.00)

SELECT * FROM[dbo].[jobs]



INSERT INTO departments(department_id,department_name,location_id)VALUES 
(1,'Administration',1700),
(2,'Marketing',1800),
(3,'Purchasing',1700),
(4,'Human Resources',2400),
(5,'Shipping',1500),
(6,'IT',1400),
(7,'Public Relations',2700),
(8,'Sales',2500),
(9,'Executive',1700),
(10,'Finance',1700),
(11,'Accounting',1700)



INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES
 (100,'Steven','King','steven.king@sqltutorial.org','515.123.4567','1987-06-17',4,24000.00,NULL,9),
 (101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','1989-09-21',5,17000.00,100,9),
 (102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569','1993-01-13',5,17000.00,100,9),
 (103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','1990-01-03',9,9000.00,102,6),
 (104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','1991-05-21',9,6000.00,103,6),
 (105,'David','Austin','david.austin@sqltutorial.org','590.423.4569','1997-06-25',9,4800.00,103,6),
(106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','1998-02-05',9,4800.00,103,6),
(107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','1999-02-07',9,4200.00,103,6),
(108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','1994-08-17',7,12000.00,101,10),
(109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','1994-08-16',6,9000.00,108,10),
(110,'John','Chen','john.chen@sqltutorial.org','515.124.4269','1997-09-28',6,8200.00,108,10),
(111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','1997-09-30',6,7700.00,108,10),
(112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469','1998-03-07',6,7800.00,108,10),
(113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','1999-12-07',6,6900.00,108,10),
(114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561','1994-12-07',14,11000.00,100,3),
 (115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562','1995-05-18',13,3100.00,114,3),
(116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563','1997-12-24',13,2900.00,114,3),
 (117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564','1997-07-24',13,2800.00,114,3),
 (118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565','1998-11-15',13,2600.00,114,3),
 (119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566','1999-08-10',13,2500.00,114,3),
 (120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234','1996-07-18',19,8000.00,100,5),
 (121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234','1997-04-10',19,8200.00,100,5),
(122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234','1995-05-01',19,7900.00,100,5),
(123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234','1997-10-10',19,6500.00,100,5),
(126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224','1998-09-28',18,2700.00,120,5),
(145,'John','Russell','john.russell@sqltutorial.org',NULL,'1996-10-01',15,14000.00,100,8),
(146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,'1997-01-05',15,13500.00,100,8),
(176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,'1998-03-24',16,8600.00,100,8),
(177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,'1998-04-23',16,8400.00,100,8),
(178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,'1999-05-24',16,7000.00,100,8),
(179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,'2000-01-04',16,6200.00,100,8),
(192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876','1996-02-04',17,4000.00,123,5),
(193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876','1997-03-03',17,3900.00,123,5),
(200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444','1987-09-17',3,4400.00,101,1),
(201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555','1996-02-17',10,13000.00,100,2),
(202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666','1997-08-17',11,6000.00,201,2),
(203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777','1994-06-07',8,6500.00,101,4),
 (204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888','1994-06-07',12,10000.00,101,7),
 (205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080','1994-06-07',2,12000.00,101,11),
 (206,'William','Gietz','william.gietz@sqltutorial.org','515.123.8181','1994-06-07',1,8300.00,205,11)

 select * from [dbo].[employees]

 INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES
 (1,'Penelope','Gietz','Child',206),
(2,'Nick','Higgins','Child',205),
(3,'Ed','Whalen','Child',200),
(4,'Jennifer','King','Child',100),
(5,'Johnny','Kochhar','Child',101),
(6,'Bette','De Haan','Child',102),
(7,'Grace','Faviet','Child',109),
 (8,'Matthew','Chen','Child',110),
(9,'Joe','Sciarra','Child',111),
(10,'Christian','Urman','Child',112),
(11,'Zero','Popp','Child',113),
(12,'Karl','Greenberg','Child',108),
(13,'Uma','Mavris','Child',203),
(14,'Vivien','Hunold','Child',103),
(15,'Cuba','Ernst','Child',104),
(16,'Fred','Austin','Child',105),
(17,'Helen','Pataballa','Child',106),
(18,'Dan','Lorentz','Child',107),
(19,'Bob','Hartstein','Child',201),
(20,'Lucille','Fay','Child',202),
(21,'Kirsten','Baer','Child',204),
(22,'Elvis','Khoo','Child',115),
(23,'Sandra','Baida','Child',116),
 (24,'Cameron','Tobias','Child',117),
 (25,'Kevin','Himuro','Child',118),
 (26,'Rip','Colmenares','Child',119),
 (27,'Julia','Raphaely','Child',114),
 (28,'Woody','Russell','Child',145),
 (29,'Alec','Partners','Child',146),
 (30,'Sandra','Taylor','Child',176)

 SELECT * FROM [dbo].[dependents]



 A.	To get data from all the rows and columns in the employees table:
 SELECT * FROM EMPLOYEES

B.	select data from the employee id, first name, last name, and hire date of all rows in the employees table:
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE FROM EMPLOYEES

C.	to get the first name, last name, salary, and new salary:
SELECT FIRST_NAME,LAST_NAME,salary,NEW_SALARY FROM EMPLOYEES

D.	Increase the salary two times and named as New_SALARY from employees table

UPDATE employees
SET NEW_SALARY = salary*2



A.	returns the data from the employee id, first name, last name, hire date, and salary column of the employees table:
SELECT 
EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,SALARY
FROM employees

B.	to sort employees by first names in alphabetical order:
SELECT FIRST_NAME 
FROM employees
ORDER BY first_name

C.	to sort the employees by the first name in ascending order and the last name in descending order:
SELECT FIRST_NAME,last_name
FROM employees
ORDER BY first_name ASC, last_name DESC

D.	to sort employees by salary from high to low:
SELECT SALARY
FROM employees
ORDER BY SALARY DESC

E.	to sort the employees by values in the hire_date column from:
SELECT HIRE_DATE 
FROM employees
ORDER BY hire_date

F.	sort the employees by the hire dates in descending order:
SELECT HIRE_DATE 
FROM employees
ORDER BY hire_date DESC

A.	selects the salary data from the salary column of the employees table and sorts them from high to low:
SELECT SALARY 
FROM EMPLOYEES
ORDER BY SALARY DESC
B.	select unique values from the salary column of the employees table:
SELECT DISTINCT(SALARY) FROM employees

C.	selects the job id and salary from the employees table:
SELECT JOB_ID,SALARY 
FROM employees
D.	to remove the duplicate values in job id and salary:

E.	returns the distinct phone numbers of employees:
SELECT DISTINCT(PHONE_NUMBER)
FROM employees


A.	returns all rows in the employees table sorted by the first_name column.

SELECT *
FROM employees
ORDER BY FIRST_NAME

B.	to return the first 5 rows in the result set returned by the SELECT clause:

SELECT TOP 5 * FROM EMPLOYEES 

C.	to return five rows starting from the 4th row:
SELECT *
FROM EMPLOYEES
ORDER BY
EMPLOYEE_ID
OFFSET 4 ROWS
FETCH NEXT 5 ROWS ONLY



D.	gets the top five employees with the highest salaries.

SELECT TOP 5 *
FROM employees
ORDER BY SALARY DESC 

E.	to get employees who have the 2nd highest salary in the company


SELECT first_name,SALARY FROM EMPLOYEES
WHERE SALARY =
(SELECT MAX(SALARY) FROM EMPLOYEES
WHERE SALARY <
(SELECT MAX(SALARY) FROM employees
)
);


A.	query finds employees who have salaries greater than 14,000 and sorts the results sets based on the salary in descending order.
SELECT SALARY FROM EMPLOYEES
WHERE SALARY>14000
ORDER BY SALARY DESC
SELECT * FROM EMPLOYEES

B.	query finds all employees who work in the department id 5.

SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID =5

C.	query finds the employee whose last name is Chen

SELECT * FROM EMPLOYEES
WHERE LAST_NAME ='CHEN'

D.	To get all employees who joined the company after January 1st, 1999

SELECT * FROM EMPLOYEES
WHERE HIRE_DATE >'1999-01-01'

E.	to find the employees who joined the company in 1999,
SELECT * FROM EMPLOYEES
WHERE HIRE_DATE= '1999'-------------------

F.	statement finds the employee whose last name is Himuro
SELECT * FROM EMPLOYEES
WHERE LAST_NAME = 'Himuro'

G.	the query searches for the string Himuro in the last_name column of the employees table.

SELECT *
FROM
EMPLOYEES
WHERE 
LAST_NAME LIKE '%HIMURO%'

H.	to find all employees who do not have phone numbers:
SELECT * FROM employees
WHERE PHONE_NUMBER  IS NULL 

I.	returns all employees whose department id is not 8.
SELECT  * FROM EMPLOYEES 
WHERE DEPARTMENT_ID <> 8;
J.	finds all employees whose department id is not eight and ten.
SELECT  * FROM EMPLOYEES 
WHERE DEPARTMENT_ID NOT IN( 8 , 10);

K.	to find the employees whose salary is greater than 10,000,
SELECT  * FROM EMPLOYEES 
WHERE SALARY > 10000;

L.	finds employees in department 8 and have the salary greater than 10,000:
SELECT  DEPARTMENT_ID ,SALARY FROM EMPLOYEES 
WHERE DEPARTMENT_ID = 8
AND
SALARY > 10000;
M.	the statement below returns all employees whose salaries are less than 10,000:
SELECT * FROM EMPLOYEES
WHERE SALARY< 10000


N.	finds employees whose salaries are greater than or equal 9,000:
SELECT * FROM EMPLOYEES
WHERE SALARY>= 9000

O.	finds employees whose salaries are less than or equal to 9,000:
SELECT * FROM EMPLOYEES
WHERE SALARY<= 9000


CREATE TABLE COURSES
(
COURSE_ID INT,
COURSE_NAME VARCHAR(255)
)

A.	adds a new column named credit_hours to the courses table.
ALTER TABLE COURSES
ADD CREDIT_HOUR INT;

B.	adds the fee and max_limit columns to the courses table and places these columns after the course_name column.
ALTER TABLE COURSES
ADD FEE INT,MAX_LIMIT INT  
C.	changes the attribute of the fee column to NOT NULL.
ALTER TABLE COURSES
ALTER COLUMN FEE INT NOT NULL

D.	to remove the fee column of the courses table
ALTER TABLE  COURSES
DROP COLUMN FEE 
E.	removes the max_limit and credit_hours of the courses table.
ALTER TABLE COURSES
DROP COLUMN MAX_LIMIT,CREDIT_HOUR


CREATE TABLE  projects
(
project_id INT PRIMARY KEY,
project_name VARCHAR(255),
start_date DATE NOT NULL,
end_date DATE NOT NULL
);

CREATE TABLE project_milestones
(
milestone_id INT PRIMARY KEY,
project_id INT,
milestone_name VARCHAR(100)
);


A.	toadd an SQL FOREIGN KEY constraint to the project_milestones table to enforce the relationship between the projects and project_milestones tables.
ALTER TABLE PROJECT_MILESTONES
ALTER COLUMN PROJECT_ID INT NOT NULL

ALTER TABLE PROJECT_MILESTONES
ADD  FOREIGN KEY (PROJECT_ID)--------------------

B.	Suppose the project_milestones already exists without any predefined foreign key and you want to define a FOREIGN KEY constraint for the project_id column so write a Query to add a FOREIGN KEY constraint to existing table
ALTER TABLE MI
 


A.	finds all employees whose salaries are greater than 5,000 and less than 7,000:
SELECT * FROM EMPLOYEES
WHERE SALARY >5000
AND
SALARY < 7000
B.	finds employees whose salary is either 7,000 or 8,000:
SELECT * FROM EMPLOYEES
WHERE SALARY = 7000
OR 
SALARY = 8000
C.	finds all employees who do not have a phone number:
SELECT * FROM EMPLOYEES
WHERE PHONE_NUMBER IS NULL
D.	finds all employees whose salaries are between 9,000 and 12,000.

SELECT * FROM EMPLOYEES
WHERE SALARY IN (9000,12000)

E.	finds all employees who work in the department id 8 or 9.

SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID = 8
OR 
DEPARTMENT_ID =9

F.	finds all employees whose first name starts with the string jo

select first_name from employees
where first_name LIKE '%JO%'
--------------------
G.	finds all employees with the first names whose the second character is  h
select FIRST_NAME 
FROM employees
WHERE 
SUBSTRING(FIRST_NAME,2,1)='H'
-----------------------
H.	finds all employees whose salaries are greater than all salaries of employees in the department 8:
SELECT * 
FROM employees
WHERE
SALARY > ALL(
SELECT 
SALARY
FROM
EMPLOYEES
WHERE
DEPARTMENT_ID=8
)


Part 2:- 
SELECT first_name,SALARY FROM EMPLOYEES
WHERE SALARY =
(SELECT MAX(SALARY) FROM EMPLOYEES
WHERE SALARY <
(SELECT MAX(SALARY) FROM employees
)
);

	---------------------------------
	A.	finds all employees whose salaries are greater than the average salary of every department:
	SELECT * 
	FROM EMPLOYEES E
	WHERE SALARY > ALL(
	SELECT
	AVG(SALARY)
	FROM EMPLOYEES
	GROUP BY 
	DEPARTMENT_ID
	)


SELECT * FROM employees
SELECT * FROM dependents

B.	finds all employees who have dependents:


SELECT * FROM employees AS E
JOIN
dependents D
ON
E.employee_id = D.employee_id

C.	to find all employees whose salaries are between 2,500 and 2,900:

SELECT * FROM  employees
WHERE SALARY  > 2500
AND 
SALARY <2900;

D.	to find all employees whose salaries are not in the range of 2,500 and 2,900:
SELECT * FROM  employees
WHERE SALARY < 2500 
OR
SALARY > 2900


E.	to find all employees who joined the company between January 1, 1999, and December 31, 2000:
SELECT * FROM  employees
WHERE hire_date > '1999-01-01'
AND
hire_date < '2000-12-31'

F.	to find employees who have not joined the company from January 1, 1989 to December 31, 1999:

SELECT * FROM  employees
WHERE hire_date NOT IN( '1999-01-01','2000-12-31')

G.	to find employees who joined the company between 1990 and 1993:

SELECT * FROM EMPLOYEES
WHERE
HIRE_DATE BETWEEN '1990-01-01' AND '1993-12-31'


A.	to find all employees whose first names start with Da
SELECT * FROM EMPLOYEES
WHERE 
FIRST_NAME LIKE 'DA%'
B.	to find all employees whose first names end with er
SELECT * FROM EMPLOYEES
WHERE 
FIRST_NAME LIKE '%ER'

C.	to find employees whose last names contain the word an:
SELECT * FROM EMPLOYEES
WHERE 
LAST_NAME LIKE '%AN%'

D.	retrieves employees whose first names start with Jo and are followed by at most 2 characters:
SELECT * FROM EMPLOYEES
WHERE 
FIRST_NAME LIKE 'JO%' AND LEN(FIRST_NAME) <=5


E.	to find employees whose first names start with any number of characters and are followed by at most one character:
SELECT * FROM EMPLOYEES
WHERE 
FIRST_NAME LIKE '%_'

F.	to find all employees whose first names start with the letter S but not start with Sh:
SELECT * FROM EMPLOYEES
WHERE 
FIRST_NAME LIKE 'S%'
AND FIRST_NAME NOT LIKE 'SH%'

art 4:-
A.	retrieves all employees who work in the department id 5.

SELECT * FROM employees
WHERE DEPARTMENT_ID = 5

B.	To get the employees who work in the department id 5 and with a salary not greater than 5000.

SELECT * FROM employees
WHERE SALARY <= 5000

C.	statement gets all the employees who are not working in the departments 1, 2, or 3.
SELECT * FROM employees
WHERE DEPARTMENT_ID IN (1,2,3)

D.	retrieves all the employees whose first names do not start with the letter D.
SELECT * FROM EMPLOYEES
WHERE 
FIRST_NAME  NOT LIKE 'D%'

E.	to get employees whose salaries are not between 5,000 and 1,000.
SELECT * FROM employees
WHERE SALARY < 1000
OR
SALARY > 5000

Part 5:- 
 
A.	Write a query to get the employees who do not have any dependents by above image
SELECT * FROM employees E
 LEFT JOIN 
dependents D
ON 
E.employee_id= D.employee_id
where D.EMPLOYEE_ID is null

B.	To find all employees who do not have the phone numbers

SELECT * FROM employees
WHERE phone_number IS NULL

C.	To find all employees who have phone numbers

SELECT * FROM employees
WHERE phone_number IS NOT NULL
---------------------

-------------TASK 3-------------


1)	Write a Query to 


A.	To get the information of the department id 1,2, and 3
select * from employees e
 inner join
departments d
on
e.department_id=d.department_id
where 
e.department_id in(1,2,3);

B.	To get the information of employees who work in the department id 1, 2 and 3
 ------------

Write a Query to get the first name, last name, job title, and department name of employees who work in department id 1, 2, and 3.
select e.first_name,e.last_name,j.job_title,d.department_name,e.department_id from employees e
 inner join
departments d
 on
e.department_id=d.department_id
inner join
jobs j
on
e.job_id= j.job_id
where 
e.department_id in(1,2,3);

------------

SELECT * FROM[dbo].[countries]
SELECT * FROM[dbo].[locations]
A.	To query the country names of US, UK, and China

select * from countries
where country_name in('China','United States of America','United Kingdom')
 
B.	query retrieves the locations located in the US, UK and China:

select * from countries
where country_name in('China','United States of America','United Kingdom')


C.	To join the countries table with the locations table

SELECT *  FROM COUNTRIES C
 LEFT OUTER JOIN
LOCATIONS L
ON
C. COUNTRY_ID = L.COUNTRY_ID

D.	to find the country that does not have any locations in the locations table

SELECT *  FROM COUNTRIES C
 LEFT OUTER JOIN
LOCATIONS L
ON
C. COUNTRY_ID = L.COUNTRY_ID
where L.country_id is null


Write a query to join 3 tables: regions, countries, and locations


SELECT * FROM REGIONS R 
 JOIN
COUNTRIES C
ON
R.REGION_ID=C.REGION_ID
JOIN
LOCATIONS L
ON
C.COUNTRY_ID=L.COUNTRY_ID

SELF JOIN
-----






--------------SQL FULL OUTER JOIN clause-----
CREATE TABLE fruits (
	fruit_id INT PRIMARY KEY,
	fruit_name VARCHAR (255) NOT NULL,
	basket_id INTEGER
);
CREATE TABLE baskets (
	basket_id INT PRIMARY KEY,
	basket_name VARCHAR (255) NOT NULL
);
INSERT INTO fruits VALUES
(1, 'Apple', 1),
(2, 'Orange', 1),
(3, 'Banana', 2),
(4, 'Strawberry', NULL);

INSERT INTO baskets VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');
SELECT * FROM  FRUITS
SELECT * FROM  BASKETS


A.	Write a query to  returns each fruit that is in a basket and each basket that has a fruit, but also returns each fruit that is not in any basket and each basket that does not have anyfruit.


B.	Write a query to find the empty basket, which does not store any fruit
SELECT * FROM BASKETS B
LEFT JOIN
FRUITS F
ON
B.BASKET_ID = F.BASKET_ID
WHERE F.BASKET_ID IS NULL



C.	Write a query  which fruit is not in any basket
SELECT * FROM BASKETS B
RIGHT JOIN
FRUITS F
ON
B.BASKET_ID = F.BASKET_ID
WHERE B.BASKET_ID IS NULL


CREATE TABLE sales_organization
(
sales_org_id INT PRIMARY KEY,
sales_org VARCHAR (255)
)

CREATE TABLE sales_channel 
(
channel_id INT PRIMARY KEY,
channel VARCHAR (255)
)

INSERT INTO sales_organization VALUES
(1, 'Domestic'),
(2,'Export')

INSERT INTO sales_channel VALUES
(1, 'Wholesale'),
(2, 'Retail'),
(3, 'eCommerce'),
(4, 'TV Shopping')

Write a Query To find the all possible sales channels that a sales organization 

	
SELECT * FROM sales_organization S
CROSS JOIN
 sales_channel SC
 


 -------------
 SELECT * FROM[dbo].[employees]
 SELECT * FROM[dbo].[departments]
 A.	to group the values in department_id column of the employees table:

 SELECT DEPARTMENT_ID  
 FROM EMPLOYEES
 GROUP BY  DEPARTMENT_ID

B.	to count the number of employees by department:
SELECT department_id, COUNT(EMPLOYEE_ID) AS EMPLOYEE
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID

SELECT * FROM EMPLOYEES

C.	returns the number of employees by department
SELECT DEPARTMENT_ID,COUNT(EMPLOYEE_ID) AS  NO_OF_EMPLOYEE
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID

SELECT *  FROM EMPLOYEES
SELECT * FROM DEPARTMENTS

D.	to sort the departments by headcount:
SELECT D.DEPARTMENT_ID,
D.DEPARTMENT_NAME,
COUNT(E.EMPLOYEE_ID) AS HEADCOUNT
FROM
DEPARTMENTS D
LEFT JOIN
EMPLOYEES E 
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID,
D.DEPARTMENT_NAME
ORDER BY HEADCOUNT DESC

E.	to find departments with headcounts are greater than 5:
SELECT D.DEPARTMENT_ID,
D.DEPARTMENT_NAME,
COUNT(E.EMPLOYEE_ID) AS HEADCOUNT
FROM
DEPARTMENTS D
LEFT JOIN
EMPLOYEES E 
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID,
D.DEPARTMENT_NAME
HAVING COUNT(E.EMPLOYEE_ID) >5
ORDER BY HEADCOUNT DESC

F.	returns the minimum, maximum and average salary of employees in each department.
SELECT DEPARTMENT_NAME, MAX(SALARY) AS MAX_SALARY,MIN(SALARY)AS MIN_SALARY,AVG(SALARY) AS AVERAGE_SALARY FROM EMPLOYEES AS E
JOIN 
DEPARTMENTS  AS D
ON 
E.DEPARTMENT_ID= D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME

G.	To get the total salary per department,
SELECT DEPARTMENT_NAME,SUM(SALARY) TOTAL_SALARY FROM EMPLOYEES AS E
JOIN 
DEPARTMENTS  AS D
ON 
E.DEPARTMENT_ID= D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME

SELECT * FROM DEPARTMENTS
SELECT * FROM JOBS

H.	groups rows with the same values both department_id and job_id columns in the same group then return the rows for each of these groups
SELECT * FROM DEPARTMENTS D
INNER JOIN
JOBS J
ON 
D.DEPARTMENT_ID= J.JOB_ID


GROUP BY ----------------

---------------HAVING CLAUSE-----
 
 SELECT * FROM EMPLOYEES
 SELECT * FROM DEPARTMENTS



A.	To get the managers and their direct reports, and  to group employees by the managers and to count the direct reports
SELECT 
E.EMPLOYEE_ID AS MANAGER_ID,
E.FIRST_NAME AS MANAGER_FIRST_NAME,
E.LAST_NAME AS MANAGER_LAST_NAME,
COUNT(E.EMPLOYEE_ID) AS DIRECT_REPORTS
FROM 
EMPLOYEES E
LEFT JOIN
DEPARTMENTS D
ON E.EMPLOYEE_ID= E.EMPLOYEE_ID
GROUP BY 
E.EMPLOYEE_ID,E.FIRST_NAME,E.LAST_NAME
ORDER BY
DIRECT_REPORTS DESC

B.	To find the managers who have at least five direct reports
SELECT 
E.EMPLOYEE_ID AS MANAGER_ID,
E.FIRST_NAME AS MANAGER_FIRST_NAME,
E.LAST_NAME AS MANAGER_LAST_NAME,
COUNT(E.EMPLOYEE_ID) AS DIRECT_REPORTS
FROM 
EMPLOYEES E
LEFT JOIN
DEPARTMENTS D
ON E.EMPLOYEE_ID= E.EMPLOYEE_ID
GROUP BY 
E.EMPLOYEE_ID,E.FIRST_NAME,E.LAST_NAME
HAVING COUNT(E.EMPLOYEE_ID)>=5
ORDER BY DIRECT_REPORTS DESC

C.	calculates the sum of salary that the company pays for each department and selects only the departments with the sum of salary between 20000 and 30000.
SELECT DEPARTMENT_ID,SUM(SALARY) AS TOTAL_SALARY
FROM
EMPLOYEES
GROUP BY 
DEPARTMENT_ID
HAVING 
SUM(SALARY)BETWEEN 20000 AND 30000

D.	To find the department that has employees with the lowest salary greater than 10000

SELECT E.DEPARTMENT_ID,MIN(SALARY) AS LOWEST_SALARY,D.DEPARTMENT_NAME
FROM
EMPLOYEES E
JOIN
DEPARTMENTS D
ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
GROUP BY
E.DEPARTMENT_ID,D.DEPARTMENT_NAME
HAVING 
MIN(SALARY) >1000

E.	To find the departments that have the average salaries of employees between 5000 and 7000

SELECT  D.DEPARTMENT_NAME, E.AVG(SALARY) FROM EMPLOYEES E
JOIN
DEPARTMENTS D
ON 
E.DEPARTMENT_ID=D.DEPARTMENT_ID
HAVING AVG(E.SALARY) >5000
AND
AVG(E.SALARY)<7000
GROUP BY DEPARTMENT_NAME------------





---------------TASK 5------------

SELECT * FROM EMPLOYEES
SELECT * FROM DEPENDENTS

Write a Query to combine the first name and last name of employees and dependents

SELECT  CONCAT(FIRST_NAME,' ',LAST_NAME) AS FULL_NAME
FROM EMPLOYEES
UNION
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS FULL_NAME
FROM DEPENDENTS


Write a Query to  Applies the INTERSECT operator to the A and B tables and sorts the combined result set by the id column in descending order


-------EXIST OPERATOR
A.	finds all employees who have at least one dependent.
SELECT DISTINCT * 
FROM EMPLOYEES E
WHERE EXISTS
(
SELECT 1
FROM DEPENDENTS D
WHERE D.EMPLOYEE_ID= E.EMPLOYEE_ID
)
;
B .finds employees who do not have any dependents:
SELECT DISTINCT * 
FROM EMPLOYEES E
WHERE  NOT EXISTS
(
SELECT 1
FROM DEPENDENTS D
WHERE D.EMPLOYEE_ID= E.EMPLOYEE_ID
)


----------------CASE-----------

A.	Suppose the current year is 2000. How to  use the simple CASE expression to get the work anniversaries of employees by 


B.	Write a Query  If the salary is less than 3000, the CASE expression returns “Low”. If the salary is between 3000 and 5000, it returns “average”. When the salary is greater than 5000, the CASE expression returns “High"

SELECT  *,
SALARY,
   CASE
WHEN SALARY< 3000 THEN 'LOW'
WHEN SALARY <5000 THEN 'HIGH'
WHEN SALARY >=3000 AND  SALARY <= 5000 THEN 'AVERAGE'
ELSE 'UNKNOWN'

END AS SALARYCATEGORY
FROM EMPLOYEES




----------------------------Suppose the employee id 192 Sarah Bell changed her last name from Bell to Lopez and you need to update her record in the  employees table.
Write a Query to update Sarah’s last name from  Bell to Lopez
SELECT

UPDATE EMPLOYEES
SET LAST_NAME ='LOPEZ'
WHERE EMPLOYEE_ID= 192

SELECT * FROM EMPLOYEES

How to  make sure that the last names of children are always matched with the last name of parents in the  employees table, 

---------------------

--------------------FINAL TASK

SELECT * FROM [dbo].[departments]
SELECT * FROM [dbo].[locations]
SELECT * FROM[dbo].[employees]
First, find all departments located at the location whose id is 1700:

SELECT DEPARTMENT_NAME,LOCATION_ID FROM DEPARTMENTS
WHERE LOCATION_ID = 1700


Second, find all employees that belong to the location 1700 by using the department id list of the previous query:

SELECT E.EMPLOYEE_ID,E.FIRST_NAME,E.LAST_NAME,D.DEPARTMENT_ID,L.LOCATION_ID
FROM EMPLOYEES E
JOIN 
DEPARTMENTS D
ON
E.DEPARTMENT_ID=D.DEPARTMENT_ID
JOIN
LOCATIONS L
ON

D.LOCATION_ID=L.LOCATION_ID
WHERE L.LOCATION_ID=1700

A.	Combine Above two queries using subquery in order find all departments located at the location whose id is 1700 and find all employees that belong to the location 1700 by using the department id list of the previous query

B.	to find all employees who do not locate at the location 1700:
SELECT E.FIRST_NAME,E.LAST_NAME, L.LOCATION_ID
FROM EMPLOYEES E
JOIN 
DEPARTMENTS D
ON
E.DEPARTMENT_ID=D.DEPARTMENT_ID
JOIN LOCATIONS L
ON 
D.LOCATION_ID=L.LOCATION_ID
WHERE L.LOCATION_ID <> 1700

C.	finds the employees who have the highest salary:
SELECT *
FROM EMPLOYEES
WHERE
SALARY = (SELECT MAX(SALARY) 
FROM EMPLOYEES)

D.	finds all employees who salaries are greater than the average salary of all employees:

SELECT * FROM EMPLOYEES
WHERE 
SALARY > (SELECT AVG(SALARY)
FROM EMPLOYEES)

E.	finds all departments which have at least one employee with the salary is greater than 10,000:

SELECT E.*,D.DEPARTMENT_ID,D.DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN 
DEPARTMENTS D
ON 
D.DEPARTMENT_ID= E.DEPARTMENT_ID
WHERE
SALARY>10000

F.	finds all dep-artments that do not have any employee with the salary greater than 10,000:
SELECT E.*,D.DEPARTMENT_ID,D.DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN 
DEPARTMENTS D
ON 
D.DEPARTMENT_ID= E.DEPARTMENT_ID
WHERE
SALARY>10000

G.	to find the lowest salary by department:
SELECT E.*,
D.DEPARTMENT_ID,
MIN(E.SALARY) AS LOWEST_SALARY
FROM
EMPLOYEES E
JOIN
DEPARTMENTS D
ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY
D.DEPARTMENT_ID

H.	finds all employees whose salaries are greater than the lowest salary of every department:
SELECT E.* 
FROM
EMPLOYEES E
JOIN
DEPARTMENTS D
ON
D.DEPARTMENT_ID=E.DEPARTMENT_ID
WHERE E.SALARY >(
SELECT MIN(T.SALARY)
FROM EMPLOYEES T
WHERE
T.DEPARTMENT_ID=E.DEPARTMENT_ID
)


I.	finds all employees whose salaries are greater than or equal to the highest salary of every department
SELECT E.* 
FROM
EMPLOYEES E
JOIN
DEPARTMENTS D
ON
D.DEPARTMENT_ID=E.DEPARTMENT_ID
WHERE E.SALARY >= (
SELECT MAX(T.SALARY)
FROM EMPLOYEES T
WHERE
T.DEPARTMENT_ID=E.DEPARTMENT_ID
)

J.	returns the average salary of every department
SELECT D.DEPARTMENT_NAME,AVG(E.SALARY) AS AVERAGE_SALARY
FROM EMPLOYEES E
JOIN
DEPARTMENTS D
ON
D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME


K.	to calculate the average of average salary of departments :

WITH DEPARTMENTAVERAGES AS (
SELECT D.DEPARTMENT_NAME,AVG(E.SALARY) AS AVERAGE_SALARY
FROM EMPLOYEES E
JOIN
DEPARTMENTS D
ON
D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
)
SELECT AVG(AVERAGE_SALARY) AS AVERAGE_OF_AVERAGES
FROM
DEPARTMENTAVERAGES

L.	finds the salaries of all employees, their average salary, and the difference between the salary of each employee and the average salary.
WITH AVGSALARY AS(
SELECT AVG(SALARY) AS 
AVERAGE_SALARY
FROM EMPLOYEES
)
SELECT E.*,E.SALARY,A.AVERAGE_SALARY,E.SALARY - A.AVERAGE_SALARY AS SALARY_DIFFERENCE
FROM 
EMPLOYEES E
CROSS JOIN
AVGSALARY A





