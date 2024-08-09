CREATE DATABASE SQL_PROJECT



CREATE TABLE EMPLOYEES_DETAIL_TABLE
(EMPLOYEE_ID INT,
FIRST_NAME VARCHAR(255),
GENDER CHAR(100)
LAST_NAME VARCHAR(255),
SALARY MONEY,
JOINING_DATE DATE,
DEPARTMENT CHAR(100),
)



INSERT INTO EMPLOYEES_DETAIL_TABLE VALUES
(1,'VIKAS','AHLAWAT',600000,'12-2-2013','IT','MALE'),
(2,'NIKITA','JAIN',530000,'11-2-2013','HR','FEMALE'),
(3,'ASHISH','KUMAR',1000000,'2-14-2013','IT','MALE'),
(4,'NIKHIL','SHARMA',480000,'2-15-2013','HR','MALE'),
(5,'ANISH','KADIAN',500000,'2-16-2013','PAROL','MALE')

SELECT * FROM EMPLOYEES_DETAIL_TABLE

----1
1) Write a query to get all employee detail from "EmployeeDetail" table

SELECT * FROM EMPLOYEES_DETAIL_TABLE

2) Write a query to get only "FirstName" column from "EmployeeDetail" table
SELECT FIRST_NAME FROM EMPLOYEES_DETAIL_TABLE


3) Write a query to get FirstName in upper case as "First Name".
SELECT UPPER(FIRST_NAME) FROM EMPLOYEES_DETAIL_TABLE

4) Write a query to get FirstName in upper case as "First Name".
SELECT UPPER(FIRST_NAME) FROM EMPLOYEES_DETAIL_TABLE

5) Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name)
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS NAME FROM [dbo].[EMPLOYEES_DETAIL_TABLE]

6) Select employee detail whose name is "Vikas
 SELECT * FROM [dbo].[EMPLOYEES_DETAIL_TABLE]
 WHERE FIRST_NAME = 'VIKAS'

7) Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'.
SELECT * FROM [dbo].[EMPLOYEES_DETAIL_TABLE]
WHERE FIRST_NAME LIKE 'A%'


8) Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'.
SELECT * FROM [dbo].[EMPLOYEES_DETAIL_TABLE]
WHERE FIRST_NAME LIKE 'A%'


9. Get all employee details from EmployeeDetail table whose "FirstName" end with 'h'
SELECT * FROM [dbo].[EMPLOYEES_DETAIL_TABLE]
WHERE FIRST_NAME LIKE '%H'


10. Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p'

SELECT * FROM [dbo].[EMPLOYEES_DETAIL_TABLE]
WHERE FIRST_NAME LIKE '[A-P]%'



11)	 Get all employee detail from EmployeeDetail table whose "FirstName" not start with any single character between 'a-p'
SELECT * FROM [dbo].[EMPLOYEES_DETAIL_TABLE]
WHERE FIRST_NAME  NOT LIKE '[A-P]%'


12)	 Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters. The Underscore(_) Wildcard Character represents any single character
SELECT * FROM [dbo].[EMPLOYEES_DETAIL_TABLE]
WHERE GENDER LIKE '_LE%' AND LEN(GENDER)=4 -----------------


13)	 Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters

SELECT * FROM [dbo].[EMPLOYEES_DETAIL_TABLE]
WHERE FIRST_NAME LIKE'A%' AND LEN(FIRST_NAME)=5

14)	 Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as".


15)	 Get all unique "Department" from EmployeeDetail table

SELECT DISTINCT(DEPARTMENT) FROM[dbo].[EMPLOYEES_DETAIL_TABLE]

16)	 Get the highest "Salary" from EmployeeDetail table.
SELECT MAX(SALARY) FROM[dbo].[EMPLOYEES_DETAIL_TABLE]

17)	 Get the lowest "Salary" from EmployeeDetail table
SELECT MIN(SALARY) FROM [dbo].[EMPLOYEES_DETAIL_TABLE]

18)	 Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013
SELECT CONVERT( VARCHAR,Joining_Date, 106) AS JoiningDateFormatted from [dbo].[EMPLOYEES_DETAIL_TABLE]


19)	Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15"
SELECT CONVERT( VARCHAR,Joining_Date, 111) AS JoiningDateFormatted from [dbo].[EMPLOYEES_DETAIL_TABLE]

20)	 Show only time part of the "JoiningDate"

21)	Get only Year part of "JoiningDate"
SELECT DATEPART(YEAR,'JOINING_DATE') AS JOINING_YEAR FROM [dbo].[EMPLOYEES_DETAIL_TABLE]-----------

22)	Get only Month part of "JoiningDate"

SELECT MONTH(JOINING_DATE) AS JOINING_MONTH
FROM EMPLOYEES_DETAIL_TABLE


23)	Get system date
SELECT GETDATE() AS 
CURRENT_DATE_TIME

24)	Get UTC date.

SELECT GETDATE() AS UTC_DATE

a)	Get the first name, current date, joiningdate and diff between current date and joining date in months.
SELECT FIRST_NAME,GETDATE() AS CURRENT_DATE_TIME,
JOINING_DATE,
DATEDIFF(MONTH,JOINING_DATE,
GETDATE()) AS MONTH_DIFFRENCE
 FROM EMPLOYEES_DETAIL_TABLE


25)	Get the first name, current date, joiningdate and diff between current date and joining date in days.
SELECT FIRST_NAME,GETDATE() AS CURRENT_DATE_TIME,
JOINING_DATE,
DATEDIFF(DAY,JOINING_DATE,
GETDATE()) AS MONTH_DIFFRENCE
 FROM EMPLOYEES_DETAIL_TABLE

26)	 Get all employee details from EmployeeDetail table whose joining year is 2013
     SELECT * FROM [dbo].[EMPLOYEES_DETAIL_TABLE]
	 WHERE JOINING_DATE= 2013-----------------


27)	Get all employee details from EmployeeDetail table whose joining month is Jan(1)

SELECT * FROM EMPLOYEES_DETAIL_TABLE
WHERE DAY(JOINING_DATE) = 1

29)	Get how many employee exist in "EmployeeDetail" table
SELECT   COUNT(EMPLOYEE_ID) FROM [dbo].[EMPLOYEES_DETAIL_TABLE]
 

 31. Select only one/top 1 record from "EmployeeDetail" table
 SELECT TOP 1 * FROM [dbo].[EMPLOYEES_DETAIL_TABLE] 

32. Select all employee detail with First name "Vikas","Ashish", and "Nikhil".

SELECT * FROM [dbo].[EMPLOYEES_DETAIL_TABLE]
WHERE FIRST_NAME IN('VIKAS','ASHISH','NIKHIL')	

33. Select all employee detail with First name not in "Vikas","Ashish", and "Nikhil"

SELECT * FROM [dbo].[EMPLOYEES_DETAIL_TABLE]
WHERE FIRST_NAME NOT IN('VIKAS','ASHISH','NIKHIL')	


34. Select first name from "EmployeeDetail" table after removing white spaces from right side
SELECT RTRIM(FIRST_NAME) AS FIRST_NAME
FROM EMPLOYEES_DETAIL_TABLE

35. Select first name from "EmployeeDetail" table after removing white spaces from left side
SELECT LTRIM(FIRST_NAME) AS FIRST_NAME
FROM EMPLOYEES_DETAIL_TABLE

36. Display first name and Gender as M/F.(if male then M, if Female then F)

SELECT FIRST_NAME,
CASE
WHEN GENDER = 'MALE' THEN 'M'
WHEN GENDER = 'FEMALE' THEN 'F'
 END AS GENDER 
 FROM EMPLOYEES_DETAIL_TABLE

37. Select first name from "EmployeeDetail" table prifixed with "Hello
SELECT 'HELLO'' ' + FIRST_NAME AS PREFIXED_NAME
FROM EMPLOYEES_DETAIL_TABLE

38. Get employee details from "EmployeeDetail" table whose Salary greater than 600000
SELECT * FROM [dbo].[EMPLOYEES_DETAIL_TABLE]
WHERE SALARY >600000

39. Get employee details from "EmployeeDetail" table whose Salary less than 700000
SELECT * FROM [dbo].[EMPLOYEES_DETAIL_TABLE]
WHERE SALARY <600000

40. Get employee details from "EmployeeDetail" table whose Salary between 500000 than 600000

SELECT * FROM [dbo].[EMPLOYEES_DETAIL_TABLE]
WHERE SALARY>500000 AND SALARY<600000



CREATE TABLE PROJECTDETAILS_TABLE
(
PROJECTDETAIL_ID INT,
EMPLOYEESDETAIL_ID INT,
PROJECT_NAME VARCHAR(255)
)

INSERT INTO PROJECTDETAILS_TABLE VALUES
(1,1,'TASKTRACK'),
(2,1,'CLP'),
(3,1,'SURVEY MANAGMENT'),
(4,2,'HR MANAGMENT'),
(5,3,'TASK TRACK'),
(6,3,'GRS'),
(7,3,'DDS'),
(8,4,'HR MANAGMENT'),
(9,6,'GL MANAGMENT')

SELECT * FROM  PROJECTDETAILS_TABLE
SELECT * FROM EMPLOYEES_DETAIL_TABLE

41. Give records of ProjectDetail table
SELECT * FROM  PROJECTDETAILS_TABLE

42. Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table.

SELECT DEPARTMENT,SUM(SALARY) AS TOTAL_SALARY 
FROM EMPLOYEES_DETAIL_TABLE
GROUP BY DEPARTMENT
SELECT * FROM EMPLOYEES_DETAIL_TABLE

43. Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary.

SELECT DEPARTMENT,SUM(SALARY) AS TOTAL_SALARY 
FROM EMPLOYEES_DETAIL_TABLE
GROUP BY DEPARTMENT
ORDER BY TOTAL_SALARY ASC

44. Write the query to get the department and department wise total(sum) salary, display it in descending order according to salary
SELECT DEPARTMENT,SUM(SALARY) AS TOTAL_SALARY 
FROM EMPLOYEES_DETAIL_TABLE
GROUP BY DEPARTMENT
ORDER BY TOTAL_SALARY DESC

45. Write the query to get the department, total no. of departments, total(sum) salary with respect to department from "EmployeeDetail" table.
SELECT DEPARTMENT,COUNT(DEPARTMENT) AS TOTAL_DEPARTMENT,SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES_DETAIL_TABLE
GROUP BY DEPARTMENT


46. Get department wise average salary from "EmployeeDetail" table order by salary ascending
SELECT DEPARTMENT, AVG(SALARY) AS AVERAGE_SALARY
FROM EMPLOYEES_DETAIL_TABLE
GROUP BY DEPARTMENT
ORDER BY AVG(SALARY) ASC

47 .Get department wise maximum salary from "EmployeeDetail" table order by salary ascending
SELECT DEPARTMENT,MAX(SALARY) AS MAX_SALARY FROM EMPLOYEES_DETAIL_TABLE
GROUP BY DEPARTMENT
ORDER BY MAX(SALARY) ASC

48.Get department wise minimum salary from "EmployeeDetail" table order by salary ascending.
SELECT DEPARTMENT,MIN(SALARY) AS MIN_SALARY FROM EMPLOYEES_DETAIL_TABLE
GROUP BY DEPARTMENT
ORDER BY MIN(SALARY) ASC



49. Get department wise minimum salary from "EmployeeDetail" table order by salary ascending
SELECT DEPARTMENT,MIN(SALARY) AS MIN_SALARY FROM EMPLOYEES_DETAIL_TABLE
GROUP BY DEPARTMENT
ORDER BY MIN(SALARY) ASC


EXEC sp_rename'[dbo].[PROJECTDETAILS_TABLE].EMPLOYEESDETAIL_ID' ,'EMPLOYEE_ID'

SELECT * FROM [dbo].[EMPLOYEES_DETAIL_TABLE]


50. Join both the table that is Employee and ProjectDetail based on some common paramter
SELECT * FROM EMPLOYEES_DETAIL_TABLE AS E
  JOIN
PROJECTDETAILS_TABLE AS P
ON E.EMPLOYEE_ID= P.EMPLOYEE_ID



51. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employee which have assigned project already.
SELECT * FROM EMPLOYEES_DETAIL_TABLE AS E
 LEFT JOIN
PROJECTDETAILS_TABLE AS P
ON E.EMPLOYEE_ID= P.EMPLOYEE_ID


52. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee even they have not assigned project.
SELECT E.FIRST_NAME,P.PROJECT_NAME
FROM 
EMPLOYEES_DETAIL_TABLE E
LEFT JOIN
PROJECTDETAILS_TABLE P 
ON E.EMPLOYEE_ID= P.EMPLOYEE_ID
ORDER BY 
E.FIRST_NAME-------

53) Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee if project is not assigned then display "-No Project Assigned"
----------
SELECT E.FIRST_NAME,ISNULL(P.PROJECT_NAME,'NO_PROJECT_ASSIGNMENT') AS PROJECTNAME
FROM 
EMPLOYEES_DETAIL_TABLE E
LEFT JOIN
PROJECTDETAILS_TABLE P 
ON E.EMPLOYEE_ID= P.EMPLOYEE_ID
ORDER BY 
E.FIRST_NAME




54.Get all project name even they have not matching any employeeid, in left table, order by firstname from "EmployeeDetail" and "ProjectDetail
SELECT E.FIRST_NAME,P.PROJECT_NAME
FROM 
EMPLOYEES_DETAIL_TABLE E
RIGHT JOIN
PROJECTDETAILS_TABLE P 
ON E.EMPLOYEE_ID= P.EMPLOYEE_ID
ORDER BY 
E.FIRST_NAME

55. Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL
SELECT * FROM 
EMPLOYEES_DETAIL_TABLE E
FULL OUTER JOIN
PROJECTDETAILS_TABLE P
ON
E.EMPLOYEE_ID= P.EMPLOYEE_ID


56. Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL
SELECT * FROM 
EMPLOYEES_DETAIL_TABLE E
FULL OUTER JOIN
PROJECTDETAILS_TABLE P
ON
E.EMPLOYEE_ID= P.EMPLOYEE_ID

--


57.Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL
SELECT * FROM 
EMPLOYEES_DETAIL_TABLE E
FULL OUTER JOIN
PROJECTDETAILS_TABLE P
ON
E.EMPLOYEE_ID= P.EMPLOYEE_ID
-------



58.Write down the query to fetch EmployeeName& Project who has assign more than one project

WITH EmployeeProjectCounts AS (
SELECT
E.EMPLOYEE_ID,
E.FIRST_NAME,
COUNT(P.PROJECTDETAIL_ID) AS ProjectCount
FROM 
EMPLOYEES_DETAIL_TABLE E
JOIN
PROJECTDETAILS_TABLE P
ON
E.EMPLOYEE_ID=P.EMPLOYEE_ID
GROUP BY
E.EMPLOYEE_ID,E.FIRST_NAME
HAVING
COUNT(P.PROJECTDETAIL_ID) >1
)
SELECT
E.FIRST_NAME,
P.PROJECT_NAME
FROM
EmployeeProjectCounts E
JOIN
PROJECTDETAILS_TABLE P
ON
E.EMPLOYEE_ID=P.EMPLOYEE_ID
ORDER BY
E.FIRST_NAME

59. Write down the query to fetch ProjectName on which more than one employee are working along with EmployeeNam

SELECT 
E.FIRST_NAME,
P.PROJECT_NAME
FROM 
EMPLOYEES_DETAIL_TABLE E
JOIN
PROJECTDETAILS_TABLE P
ON
E.EMPLOYEE_ID=P.EMPLOYEE_ID
WHERE
P.PROJECTDETAIL_ID IN (
SELECT P.PROJECTDETAIL_ID
FROM PROJECTDETAILS_TABLE P
GROUP BY
P.PROJECTDETAIL_ID
HAVING COUNT(P.PROJECT_NAME) >1
)

ORDER BY
E.EMPLOYEE_ID,P.PROJECT_NAME
 
60. Apply Cross Join in Both the tables

SELECT * FROM [dbo].[EMPLOYEES_DETAIL_TABLE]
CROSS JOIN
 [dbo].[PROJECTDETAILS_TABLE]