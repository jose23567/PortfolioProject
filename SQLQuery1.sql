--SELECT COUNT(GENDER)
--FROM [SQL Tutorial].dbo.EmployeeDemographics /*when having multiple databases and you
----don't know which one to use, always select from specific database and then the data you 
--want to use*/ 

--/*
--WHERE STATEMENT 
--=,<> ,<,>,AND, OR, LIKE, NULL, NOT NULL, IN

--*/

--SELECT * 
--FROM EmployeeDemographics
--WHERE Age <= 32

--SELECT *
--FROM EmployeeDemographics
--WHERE LastName LIKE 'S%O%'

--/*
--WHEN USING LIKE, CAN BE USED FOR NUMERICAL OR TEXT FINDING 
--USE %  LOOKING FOR SPECIFIC PLACE
--IF USED IN THE BEGINNING AFTER CHARACTER OR NUMBER STARTS (S%)
--ANYTHING THAT BEGINS WITH LETTER S
--ELSE IF (%S) LOOK FOR LETTER AT END OF WORD OR PATTERN
--ELSE IF (%S%) ON BOTH SIDES, THEN FIND ANYWHERE IN THE WORD OR PATTERN
--CAN USE FOR MULTIPLE OCCURENCES (S%O%)-THIS WILL FIND ANYTHING 
--WITH S FOR BEGINNING AND O FORANYWHERE IN WORD
--*/

--SELECT * 
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--LEFT JOIN [SQL Tutorial].dbo.EmployeeSalary
--ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE EmployeeSalary.EmployeeID IS NOT NULL
--ORDER BY EmployeeDemographics.EmployeeID DESC

--/*
--GROUP BY, ORDER BY
--*/

--SELECT *
--FROM EmployeeDemographics 
--WHERE FirstName LIKE '%A%'
--AND GENDER = 'MALE'
--ORDER BY AGE DESC

--SELECT Gender,Age,COUNT(GENDER)
--FROM EmployeeDemographics
--GROUP BY Gender,Age

--SELECT * 
--FROM EmployeeDemographics
--ORDER BY Age, Gender

--SELECT * 
--FROM EmployeeDemographics
--ORDER BY 3 ASC,4 ASC, 5 ASC

--/*
--BY DEFAULT, ORDER BY WILL BE PUT FROM SMALLEST TO LARGEST (A-Z, 0-9)
--UNLESS WE STATE WHAT TO USE (ASC, DESC)
--*/

--/*
--INTERMIDATE

--JOINS
--UNIONS
--CASE STATEMENTS
--UPDATING/DELETING DATA
--PARTITION BY
--DATA TYPES
--ALIASIN
--CREATING VIEWS
--HAVING VS GROUP BY STATEMENT
--PRIMARY KEY VS FOREIGN KEY

--*/


--/*
--ADVANCED

--CTEs
--SYS TABLES
--SUBQUERIES
--TEMP TABLES
--STRING FUNCTIONS(TRIM,LTRIM,RTRIM, REPLACE, SUBSTRING, UPPER, LOWER)
--REGULAR EXPRESSION
--STORED PROCEDURES
--IMPORTING DATA FROM DIFFERENT FILE TYPES/SOURCES
--EXPORTING DATA TO DIFFERENT FILE TYPES

--*/


--/*
--INNER JOINS, FULL/LEFT/RIGHT OUTER JOINS
--*/

--SELECT *
--FROM [SQL Tutorial].dbo.EmployeeDemographics

--SELECT * 
--FROM [SQL Tutorial].dbo.EmployeeSalary

--SELECT EmployeeDemographics.EmployeeID, FirstName,LastName, Salary
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--FULL JOIN [SQL Tutorial].dbo.EmployeeSalary
--ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE FirstName <> 'MICHAEL'
--ORDER BY Salary DESC

--SELECT EmployeeSalary.JobTitle, AVG(Salary)
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--INNER JOIN [SQL Tutorial].dbo.EmployeeSalary
--ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE JobTitle = 'SALESMAN'
--GROUP BY JobTitle

--/*
--UNION , UNION ALL
--*/



--Insert into EmployeeDemographics VALUES
--(1011, 'Ryan', 'Howard', 26, 'Male'),
--(NULL, 'Holly', 'Flax', NULL, NULL),
--(1013, 'Darryl', 'Philbin', NULL, 'Male')


--Create Table WareHouseEmployeeDemographics 
--(EmployeeID int, 
--FirstName varchar(50), 
--LastName varchar(50), 
--Age int, 
--Gender varchar(50)
--)

--Insert into WareHouseEmployeeDemographics VALUES
--(1013, 'Darryl', 'Philbin', NULL, 'Male'),
--(1050, 'Roy', 'Anderson', 31, 'Male'),
--(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
--(1052, 'Val', 'Johnson', 31, 'Female')

--SELECT * 
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--UNION
--SELECT * 
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--/*
--WHEN WORKING WITH UNIONS, THE ROWS WITH THE SAME INFORMATION IS AUTOMATICALLY 
--REMOVED MAKING IT EASIER TO READ 

--IF WANT TO INCLUDE DUPLICATED AS WELL, WE USE UNION ALL
--*/
--SELECT * 
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--FULL OUTER JOIN [SQL Tutorial].dbo.WareHouseEmployeeDemographics
--ON EmployeeDemographics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID

--/*
--CASE STATEMENT
--*/

--SELECT FirstName, LastName, Age, 
--CASE 
--	WHEN Age > 30 THEN 'OLD'
--	WHEN Age BETWEEN 27 AND 30 THEN 'YOUNG'
--	ELSE 'BABY'
--END 
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--WHERE Age IS NOT NULL
--ORDER BY Age

--SELECT FirstName,LastName,JobTitle,Salary,
--CASE 
--	WHEN JobTitle = 'SALESMAN' THEN Salary + (Salary * .10)
--	WHEN JobTitle = 'ACCOUNTANT' THEN Salary + (Salary * .05)
--	WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
--	ELSE Salary + (Salary*.03)
--END AS SALARYAFTERRAISE
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--JOIN [SQL Tutorial].dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--/*
--HAVING CLAUSE
--*/

--SELECT JobTitle, COUNT(JOBTITLE)
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--JOIN [SQL Tutorial].dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--GROUP BY JobTitle 
--HAVING COUNT(JobTitle) > 1
--/*
--WHEN USING HAVING STATEMENT, ALWAYS INCLUDE THE HAVING AFTER THE GROUP BY BECAUSE IT IS 
--DEPENDENT ON THE GROUP BY*/

--SELECT JobTitle, AVG(SALARY)
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--JOIN [SQL Tutorial].dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--GROUP BY JobTitle 
--HAVING AVG(SALARY) > 45000
--ORDER BY AVG(SALARY)
--/*
--WHEN USING HAVING STATEMENT, ALWAYS INCLUDE THE HAVING BEFORE ORDER BY*/


--/*
--UPDATING/DELETING DATA
--*/

--SELECT * 
--FROM [SQL Tutorial].dbo.EmployeeDemographics

--UPDATE [SQL Tutorial].dbo.EmployeeDemographics
--SET Age = 31, Gender = 'Female'
--WHERE FirstName = 'Holly' and LastName = 'Flax'

--/*WHEN USING UPDATE YOU CAN USE 'SET' TO BE ABLE TO SET WHERE
--COLUMN CAN BE CHANGED IN THE ROW AREA*/

--DELETE FROM [SQL Tutorial].dbo.EmployeeDemographics
--WHERE EmployeeID = 1005
--/*
--WHEN USING DELETE, THERE IS NO WAY TO BE ABLE TO RECOVER THAT DATA
--THERE IS A TRICK TO MAKE SURE THAT YOU KNOW WHAT DATA TO REMOVE BEFORE ACTUALLY 
--DOING IT
--*/

--SELECT * 
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--WHERE EmployeeID=1004

--/*
--USE THIS FORMAT BEFORE USING DELETE TO UNDERSTAND WHAT YOU WILL 
--BE REMOVING SO THAT THERE ARE NO ISSUES!!!!
--*/



--SELECT FirstName AS Fname
--FROM [SQL Tutorial].dbo.EmployeeDemographics

--SELECT FirstName + LastName AS FULLNAME 
--FROM [SQL Tutorial].dbo.EmployeeDemographics

--SELECT FirstName, EmployeeID, COUNT(*)
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--GROUP BY FirstName,EmployeeID
--HAVING COUNT(*)>1

--SELECT * FROM EmployeeDemographics

--DELETE FROM EmployeeDemographics
--WHERE FirstName = 'TOBY'

--Insert into EmployeeDemographics VALUES
--(1001, 'Jim', 'Halpert', 30, 'Male'),
--(1002, 'Pam', 'Beasley', 30, 'Female'),
--(1003, 'Dwight', 'Schrute', 29, 'Male'),
--(1004, 'Angela', 'Martin', 31, 'Female'),
--(1005, 'Toby', 'Flenderson', 32, 'Male'),
--(1006, 'Michael', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'),
--(1008, 'Stanley', 'Hudson', 38, 'Male'),
--(1009, 'Kevin', 'Malone', 31, 'Male'),
--(1011, 'Ryan', 'Howard', 26, 'Male'),
--(1012, 'Holly', 'Flax ', 31, 'Male'),
--(1013, 'Darryl', 'Philbin', NULL, 'Male')

/*
ALIASING
*/

--SELECT FIRSTNAME + ' ' + LastName AS FULLNAME
--FROM [SQL Tutorial].dbo.EmployeeDemographics

--SELECT AVG(AGE) AS AVGAge
--FROM [SQL Tutorial].dbo.EmployeeDemographics

--SELECT DEMO.EmployeeID,SAL.Salary
--FROM [SQL Tutorial].dbo.EmployeeDemographics AS DEMO
--JOIN [SQL Tutorial].dbo.EmployeeSalary AS SAL
--	ON DEMO.EmployeeID = SAL.EmployeeID

--	/* USE ALIASING WHEN YOU HAVE LONG NAMES SUCH AS EMPLOYEEDEMOGRAPHICS 
--	SO THAT YOU CAN RENAME TO SOMETHING MUCH SHORTER AND USE IT AS REFERENCE
--	YOU DON'T NEED TO ADD 'AS' AS IT WILL BE THE SAME THING
--	*/

--SELECT A.EmployeeID,A.FirstName,A.FirstName,B.JobTitle,C.Age--
--FROM [SQL Tutorial].dbo.EmployeeDemographics A--
--LEFT JOIN [SQL Tutorial].dbo.EmployeeSalary B --DO NOT CODE LIKE THIS WHERE YOU ADD ONLY CHARACTERS TO DISTINCT TABLES!!!!
--ON A.EmployeeID = B.EmployeeID--
--LEFT JOIN [SQL Tutorial].dbo.WareHouseEmployeeDemographics C--
--ON A.EmployeeID = C.EmployeeID--


--SELECT DEMO.EmployeeID,DEMO.FirstName,DEMO.FirstName,SAL.JobTitle,WARE.Age--
--FROM [SQL Tutorial].dbo.EmployeeDemographics DEMO--
--LEFT JOIN [SQL Tutorial].dbo.EmployeeSalary SAL --CODE LIKE THIS WHERE YOU ADD EASY TO KNOW WORDS TO DISTINCT TABLES!!!!
--ON DEMO.EmployeeID = SAL.EmployeeID--
--LEFT JOIN [SQL Tutorial].dbo.WareHouseEmployeeDemographics WARE--
--ON DEMO.EmployeeID = WARE.EmployeeID--


--/*
--PARTITION BY
--*/

--SELECT FirstName, LastName, Gender, Salary, 
--COUNT(GENDER) OVER (PARTITION BY GENDER) AS SAME_GENDER_WORKING_WITH
--FROM [SQL Tutorial]..EmployeeDemographics DEM
--INNER JOIN
--[SQL Tutorial]..EmployeeSalary SAL
--ON DEM.EmployeeID = SAL.EmployeeID
--/*THESE BOTH SELECTS DO THE SAME EXACT THING

--GROUP BY modifies the entire query, like:

--select customerId, count(*) as orderCount
--from Orders
--group by customerId

--But PARTITION BY just works on a window function, like ROW_NUMBER():

--select row_number() over (partition by customerId order by orderId)
--    as OrderNumberForThisCustomer
--from Orders

--+	GROUP BY normally reduces the number of rows returned by rolling them up and calculating averages or sums for each row.

--+	PARTITION BY does not affect the number of rows returned, but it changes how a window function's result is calculated.

-- */
--SELECT Gender,COUNT(GENDER)
--FROM [SQL Tutorial]..EmployeeDemographics DEM
--INNER JOIN
--[SQL Tutorial]..EmployeeSalary SAL
--ON DEM.EmployeeID = SAL.EmployeeID
--GROUP BY Gender

/*CTEs*/

--WITH CTE_EMPLOYEE AS 
--(SELECT FIRSTNAME,LASTNAME,GENDER, SALARY,
--COUNT(GENDER) OVER (PARTITION BY GENDER) AS TOTALGENDER,
--AVG(SALARY) OVER (PARTITION BY GENDER) AS AVGSALARY
--FROM [SQL Tutorial]..EmployeeDemographics EMP
--JOIN [SQL Tutorial]..EmployeeSalary SAL
--	ON EMP.EmployeeID = SAL.EmployeeID
--WHERE SALARY > '45000')

--SELECT * FROM CTE_EMPLOYEE
--/*
--USE CTE WHEN YOU ARE JUST TRYING TO USE MEMORY TO FIGURE OUT WHAT INFORMATION YOU WANT 
--TO USE FOR DATA

--ONLY TEMP DATA, ONLY USE WHEN YOU WANT TO PLAY WITH DATA FOR FUTURE USE
--*/


--/*
--TEMP TABLES
--*/

--CREATE TABLE #TEMP_EMPLOYEE
--(EMPLOYEEID INT, 
--JOBTITLE VARCHAR(100),
--SALARY INT
--)

--SELECT * FROM 
--#TEMP_EMPLOYEE

--INSERT INTO #TEMP_EMPLOYEE VALUES (
--'1001','HR','45000'
--)

--INSERT INTO #TEMP_EMPLOYEE
--[SQL Tutorial]..EmployeeSalary

--CREATE TABLE #TEMP_EMPLOYEE2 (
--JOBTITLE VARCHAR(50),
--EMPLOYEESPERJOB INT,
--AVGAGE INT, 
--AVGSALARY INT)



--/*
--TEMP TABLES ARE STILL CREATED AND LIVE SOMEWHERE IN DATABASE
--IF YOU RUN THE SAME CODE YOU RAN WITH THE DATA THAT WAS JUST
--CREATED, IT WILL GIVE AN ERROR

--WAY TO WORK AROUND THIS IF YOU WANT TO REMOVE A TEMP TABLE OR START OVER IS TO USE
--*DROP TABLE IF EXIST* TO START OVER
--AS LONG AS THE TOP BEFORE REST OF CODE, YOU CAN RERUN IT HOWEVER MANY TIMES YOU WANT
--*/

--DROP TABLE IF EXISTS #TEMP_EMPLOYEE2
--INSERT INTO #TEMP_EMPLOYEE2
--SELECT JOBTITLE, COUNT(JOBTITLE), AVG(AGE), AVG(SALARY)
--FROM [SQL Tutorial]..EmployeeDemographics EMP
--JOIN [SQL Tutorial]..EmployeeSalary SAL
--	ON EMP.EmployeeID = SAL.EmployeeID
--GROUP BY JOBTITLE

--SELECT *
--FROM #TEMP_EMPLOYEE2


--/*
--STRING FUNCTIONS - TRIM, LTRIM, RTRIM, REPLACEM UPPER, LOWER
--*/

--CREATE TABLE EmployeeErrors (
--EmployeeID varchar(50)
--,FirstName varchar(50)
--,LastName varchar(50)
--)

--Insert into EmployeeErrors Values 
--('1001  ', 'Jimbo', 'Halbert')
--,('  1002', 'Pamela', 'Beasely')
--,('1005', 'TOby', 'Flenderson - Fired')

--Select *
--From EmployeeErrors

--/* 
--Using Trim, LTRIM, RTRIM
--*/

--Select EmployeeID, TRIM(employeeID) AS IDTRIM
--FROM EmployeeErrors 

--Select EmployeeID, RTRIM(employeeID) as IDRTRIM
--FROM EmployeeErrors 

--Select EmployeeID, LTRIM(employeeID) as IDLTRIM
--FROM EmployeeErrors 

	



--/* 
--Using Replace
--*/

--Select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
--FROM EmployeeErrors

--/*
-- Using Substring
--*/
--Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), Substring(err.LastName,1,3), Substring(dem.LastName,1,3)
--FROM EmployeeErrors err
--JOIN EmployeeDemographics dem
--	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
--	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)


--/*
-- Using UPPER and lower
--*/
--Select firstname, LOWER(firstname)
--from EmployeeErrors

--Select Firstname, UPPER(FirstName)
--from EmployeeErrors

--SELECT * 
--FROM EmployeeErrors









--/*Stored Procedures*/
--/*Def. 
--a group of sql statments that are created and then stored in the database*/

--CREATE PROCEDURE TEST
--AS 
--SELECT * 
--FROM EmployeeDemographics


--EXEC TEST



--CREATE PROCEDURE TEMP_EMPLOYEE
--AS
--CREATE TABLE #TEMP_EMPLOYEE(
--JOBTITLE VARCHAR(100),
--EMPLOYEESPERJOB INT, 
--AVGAGE INT, 
--AVGSALARY INT
--)

--INSERT INTO #TEMP_EMPLOYEE
--SELECT JOBTITLE,COUNT(JOBTITLE), AVG(AGE), AVG(SALARY)
--FROM [SQL Tutorial]..EmployeeDemographics AS EMP
--JOIN [SQL Tutorial]..EmployeeSalary AS SAL 
--	ON EMP.EmployeeID = SAL.EmployeeID
--GROUP BY JobTitle

--SELECT *
--FROM #TEMP_EMPLOYEE

--EXEC TEMP_EMPLOYEE @JOBTITLE = 'SALESMAN'



/*Subqueries (IN THE SELECT, FROM, AND WHERE STATEMENT)*/

Select EmployeeID, JobTitle, Salary
From EmployeeSalary

-- Subquery in Select

Select EmployeeID, Salary, (Select AVG(Salary) From EmployeeSalary) as AllAvgSalary
From EmployeeSalary

-- How to do it with Partition By
Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
From EmployeeSalary

-- Why Group By doesn't work
Select EmployeeID, Salary, AVG(Salary) as AllAvgSalary
From EmployeeSalary
Group By EmployeeID, Salary
order by EmployeeID


-- Subquery in From

Select a.EmployeeID, AllAvgSalary
From 
	(Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
	 From EmployeeSalary) a
Order by a.EmployeeID


-- Subquery in Where


Select EmployeeID, JobTitle, Salary
From EmployeeSalary
where EmployeeID in (
	Select EmployeeID 
	From EmployeeDemographics
	where Age > 30)



















