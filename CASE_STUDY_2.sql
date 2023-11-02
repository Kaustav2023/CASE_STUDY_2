--create database Case_Study_2
--use Case_Study_2

CREATE TABLE LOCATION (
  Location_ID INT PRIMARY KEY,
  City VARCHAR(50)
);

INSERT INTO LOCATION (Location_ID, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');


 CREATE TABLE DEPARTMENT (
  Department_Id INT PRIMARY KEY,
  Name VARCHAR(50),
  Location_Id INT,
  FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
);


INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);

	   CREATE TABLE JOB (
  Job_ID INT PRIMARY KEY,
  Designation VARCHAR(50)
);

CREATE TABLE JOB
(JOB_ID INT PRIMARY KEY,
DESIGNATION VARCHAR(20))

INSERT  INTO JOB VALUES
(667, 'CLERK'),
(668,'STAFF'),
(669,'ANALYST'),
(670,'SALES_PERSON'),
(671,'MANAGER'),
(672, 'PRESIDENT')


CREATE TABLE EMPLOYEE
(EMPLOYEE_ID INT,
LAST_NAME VARCHAR(20),
FIRST_NAME VARCHAR(20),
MIDDLE_NAME CHAR(1),
JOB_ID INT FOREIGN KEY
REFERENCES JOB(JOB_ID),
MANAGER_ID INT,
HIRE_DATE DATE,
SALARY INT,
COMM INT,
DEPARTMENT_ID  INT FOREIGN KEY
REFERENCES DEPARTMENT(DEPARTMENT_ID))

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30)


--1.>...............................
select * from Employee

--2.>...............................
select * from Job

--3.>...............................
select * from Department

--4.>...............................
select * from Location 

--5.>...............................
select First_Name, Last_Name,Salary,Comm from employee


--6.>...............................
select Employee_id AS [ID of the Employee] ,Last_Name AS [Name of the Employee],Department_Id AS [Dep_id] from employee

--7.>...............................
select (Salary*12)AS [Annual SALARY],First_Name,Last_Name from employee


--1.>...............................
--1. List the details about "Smith". 
select * from employee
where Last_Name='SMITH' OR First_Name='SMITH'

--2.>...............................
--2. List out the employees who are working in department 20. 
select * from employee where department_id=20

--3.>...............................
--3. List out the employees who are earning salaries between 3000and4500.
select * from employee where salary Between 3000 and 4500

--4.>...............................
--4. List out the employees who are working in department 10 or 20. 
select * from employee where department_id=10 or department_id=20

--5.>...............................
--5. Find out the employees who are not working in department 10 or 30. 
select * from employee where department_id!=10 and department_id !=30

--6.>...............................
--6. List out the employees whose name starts with 'S'.
select * from employee where First_Name LIKE 'S%'

--7.>...............................
--7. List out the employees whose name starts with 'S' and ends with'H'. 
select * from employee where first_name like 'S%' and first_name like '%H'
-----------------OR---------------------------------------
select * from employee where first_name like 'S%' and last_name like '%H'

--8.>...............................
--8. List out the employees whose name length is 4 and start with 'S'.
select * from employee where len(First_Name)=4 AND First_Name like 'S%'

--9.>...............................
--9. List out employees who are working in department 10 and drawsalariesmorethan 3500. 
select * from employee where department_id=10 and salary>3500

--10.>...............................
--10. List out the employees who are not receiving commission.
select * from employee where comm IS NULL
 
 --1.>...............................
--ORDER BY Clause:
--1. List out the Employee ID and Last Name in ascending order based on the Employee ID.
select Employee_Id, Last_Name from employee order by Employee_Id

 --2.>...............................
--2. List out the Employee ID and Name in descending order based onsalary. 
select Employee_id, First_Name, Middle_Name,Last_Name from employee order by salary DESC

 --3.>...............................
--3. List out the employee details according to their Last Name in ascending-order.
select * from employee order by Last_Name

 --4.>...............................
--4. List out the employee details according to their Last Name in ascendingorder and then Department ID in descending order. 
select * from employee order by Last_Name ASC, Department_ID DESC

 --1.>...............................
--1. How many employees are in different departments in the organization?
select department.NAME,count(*) AS [No. Of Employee]
from employee left join department on employee.department_id=department.department_id 
group by department.Name order by [No. of Employee]

 --2.>...............................
--2. List out the department wise maximum salary, minimumsalary andaverage salary of the employees. 
select D.Name,Max(Salary) AS [MAXIMUM SALARY],Min(Salary) AS [MINIMUM SALARY] ,Avg(Salary) AS [AVERAGE SALARY] 
from Employee AS E left join Department AS D on E.department_id=D.department_id
group by D.Name

 --3.>...............................
--3. List out the job wise maximum salary, minimum salary and averagesalary of the employees. 
select J.DESIGNATION,Max(Salary) AS [MAXIMUM SALARY],Min(Salary) AS [MINIMUM SALARY] ,Avg(Salary) AS [AVERAGE SALARY] 
from Employee AS E left join Job AS J on E.Job_ID=J.Job_ID 
group by J.DESIGNATION

 --4.>...............................
--4. List out the number of employees who joined each month in ascendingorder.
select Format(HIRE_DATE,'MMMMM') AS EVERY_MONTH,Count(*) AS [No. Of Employee] from Employee group by format(HIRE_DATE,'MMMMM') order by [No. Of Employee]

 --5.>...............................
--5. List out the number of employees for each month and year in ascending order based on the year and month. 
select Format(HIRE_DATE,'MMMMM') AS EVERY_MONTH,Year(HIRE_DATE) AS [YEAR] , COUNT(*)AS [No. Of Employee]
from Employee 
group by Format(HIRE_DATE,'MMMMM'), Year(HIRE_DATE)
order by [YEAR],EVERY_MONTH

 --6.>...............................
--6. List out the Department ID having at least four employees. 
select Department_ID,Count(*) AS EMPLOYEE_NO 
from employee 
group by Department_ID 
HAVING Count(*) >=4

 --7.>...............................
--7. How many employees joined in the month of January?
Select Format(Hire_Date,'MMMMM') AS [MONTH],Count(*) AS [No. Of Employee] from Employee
Group By  Format(Hire_Date,'MMMMM')
HAVING Format(Hire_Date,'MMMMM') = 'JANUARY' OR Format(Hire_Date,'MMMMM') = 'FEBRUARY'

 --8.>...............................
--8. How many employees joined in the month of January or September?
Select Format(Hire_Date,'MMMMM') AS [MONTH],Count(*) AS [No. Of Employee] from Employee
Group By  Format(Hire_Date,'MMMMM')
HAVING Format(Hire_Date,'MMMMM') = 'JANUARY' OR Format(Hire_Date,'MMMMM') = 'SEPTEMBER'

 --9.>...............................
--9. How many employees joined in 1985?
Select Year(HIRE_DATE) AS [YEAR], COUNT(*) AS [No. Of Employee] from Employee 
GROUP BY Year(Hire_Date)
HAVING Year(HIRE_DATE) =1985

 --10.>...............................
--10. How many employees joined each month in 1985?
Select Format(Hire_Date,'MMMMM') AS [MONTH], COUNT(*) AS [No. Of Employee] from Employee 
where Year(HIRE_DATE) =1985
GROUP BY Format(Hire_Date,'MMMMM')

 --11.>...............................

Select Count(*) AS [No. Of Employee Joined in March 1985] from Employee 
Where Format(Hire_Date,'MMMMM')='MARCH' AND Year(Hire_Date)=1985

 --12.>...............................

Select Department_ID,Count(*) AS [No. Of Employee] from Employee 
Where Format(Hire_Date,'MMMMM')='APRIL' AND Year(Hire_Date)=1985
Group By Department_ID
Having Count(*) >=1


------------------------------------------------------------------------
--1. List out the distinct jobs in sales and accounting departments.

select DISTINCT J.Designation from employee AS E left join department AS D on E.department_id=D.department_id left join job AS J on E.job_id = J.job_id
Where D.Name='Sales' OR D.Name='Accounting'


--2. List out all the jobs in sales and accounting departments. 

select J.Designation from employee AS E left join department AS D on E.department_id=D.department_id left join job AS J on E.job_id = J.job_id
Where D.Name='Sales' OR D.Name='Accounting'

--3. List out the common jobs in research and accounting departments in ascending order
 
select J.DESIGNATION from employee AS E left join department AS D on E.department_id=D.department_id left join job AS J on E.job_id = J.job_id
Where D.Name='Research' or D.Name='Accounting'
Group by J.Designation
Having COUNT(Distinct D.Name)>1
Order by J.Designation

select * from employee
select * from department
select * from job

-------------------------------------------------OR--------------------------------------------------------

--Create Table #temp(Job_ID int,Job_Name varchar(50),Department_ID int, Department_Name varchar(50))
--Insert into #temp(Job_ID,Job_Name,Department_ID,Department_Name)
--select J.Job_ID, J.Designation, D.Department_ID, D.Name from employee AS E left join department AS D on E.department_id=D.department_id left join job AS J on E.job_id = J.job_id

--select * from #temp
--select Job_Name from #temp 
--group by Job_Name
--Having Count(Distinct Department_Name)>1

-----------------------------------------------------------------------------------------------------------
--Joins:
--1. List out employees with their department names.

Select D.Name,E.Employee_ID,E.Last_Name,E.First_Name,E.Middle_Name,E.Job_ID,E.Manager_ID,E.Hire_Date,E.Salary,E.COMM,E.Department_ID 
from Employee AS E inner join Department AS D on E.Department_ID=D.Department_ID

--2. Display employees with their designations.

Select J.Designation,E.Employee_ID,E.Last_Name,E.First_Name,E.Middle_Name,E.Job_ID,E.Manager_ID,E.Hire_Date,E.Salary,E.COMM,E.Department_ID 
from Employee AS E inner join Job AS J on E.Job_ID=J.JOB_ID

--3. Display the employees with their department names and regional groups.

Select D.Name,D.Location_ID,L.City,E.Employee_ID,E.Last_Name,E.First_Name,E.Middle_Name,E.Job_ID,E.Manager_ID,E.Hire_Date,E.Salary,E.COMM,E.Department_ID 
from Employee AS E Left join Department AS D 
on E.Department_ID=D.Department_ID 
Left join Location AS L
on D.Location_ID=L.Location_ID

--4. How many employees are working in different departments? Displaywithdepartment names.

Select D.Name,Count(*) AS [No. Of Employee] from Employee AS E left join Department AS D 
on E.Department_ID=D.Department_ID
group by D.Name

--5. How many employees are working in the sales department?

Select D.Name,Count(*) AS [No. Of Employee] from Employee AS E left join Department AS D 
on E.Department_ID=D.Department_ID
where D.Name='Sales'
group by D.Name


--6. Which is the department having greater than or equal to 5 employees? Display the department names in ascending order. 

select D.Name from Employee As E left join Department As D
on E.Department_ID=D.Department_ID
group by D.Name
having Count(*) >=5


--7. How many jobs are there in the organization? Display with designations. 

select DISTINCT Designation,Count(*) as [No. of Jobs] from Job 
group by Designation

--8. How many employees are working in "New York"?

select L.City,Count(*) AS[No. Of Employee]
from Employee As E left join Department As D on E.Department_ID=D.Department_ID
left join Location As L on D.Location_ID=L.Location_ID
where L.City='New York'
group by L.city 


--9. Display the employee details with salary grades. Use conditional statement to create a grade column. 

select *,
Grade=
case
when Salary>=500 AND Salary<=1000 then 'E'
when Salary>1000 AND Salary<=1500 then 'D'
when Salary>1500 AND Salary<=2000 then 'C'
when Salary>2000 AND Salary<=2500 then 'B'
when Salary>2500 AND Salary<=3000 then 'A'
end
from Employee

--10. List out the number of employees grade wise. Use conditional statementtocreate a grade column. 

create table #temp(Employee_id int,Last_Name Varchar(50),First_Name varchar(50),Middle_Name Varchar(5),Job_ID int,Manager_ID int,Salary int,Department_ID int,Grade Varchar(1))

Insert into #temp(Employee_id,Last_Name,First_Name,Middle_Name,Job_ID,Manager_ID,Salary,Department_ID,Grade)
Select Employee_id,Last_Name,First_Name,Middle_Name,Job_ID,Manager_ID,Salary,Department_ID,
Grade=
case
when Salary>=500 AND Salary<=1000 then 'E'
when Salary>1000 AND Salary<=1500 then 'D'
when Salary>1500 AND Salary<=2000 then 'C'
when Salary>2000 AND Salary<=2500 then 'B'
when Salary>2500 AND Salary<=3000 then 'A'
end
from Employee

select Grade,Count(*)AS [No. Of Employee] From #temp Group by Grade

--11.Display the employee salary grades and the number of employees between 2000 to 5000 range of salary. 

create table #temp1(Employee_id int,Last_Name Varchar(50),First_Name varchar(50),Middle_Name Varchar(5),Job_ID int,Manager_ID int,Hire_Date date,Salary int,Comm int,Department_ID int,Grade Varchar(1))

Insert into #temp1(Employee_id,Last_Name,First_Name,Middle_Name,Job_ID,Manager_ID,Hire_Date,Salary,Comm,Department_ID,Grade)
Select *,
Grade=
case
when Salary>=500 AND Salary<=1000 then 'D'
when Salary>1000 AND Salary<=1500 then 'C'
when Salary>1500 AND Salary<=2000 then 'B'
when Salary>2000 AND Salary<=5000 then 'A'
end
from Employee

select Grade,Count(Grade)AS [No. Of Employee] From #temp1
where Grade='A'
group by Grade



--12. Display all employees in sales or operation departments

Select * from Employee AS E left join Department AS D on E.Department_ID=D.Department_ID
where D.Name='Sales' Or D.Name='Operations'

--------------------------------------------------------------------------------------------
--SUB QUERY

--1.Display the employees list who got the maximum salary

Select * from Employee As E1 WHERE 1=(select Count(Salary) from Employee As E2 where E1.salary<=E2.salary)

--2. Display the employees who are working in the sales department. 

Select * from Employee Where Department_ID=(select Department_ID from Department where Name='Sales')

--3. Display the employees who are working as 'Clerk'. 

Select * from Employee where Job_ID=(select Job_ID from Job Where Designation='Clerk')

--4. Display the list of employees who are living in "New York". 

Select * from Employee where Department_ID=(Select Department_ID from Department where Location_ID=(Select Location_ID from Location where City='New York'))


--5. Find out the number of employees working in the sales department.

Select Count(*) AS [ No. of Employee] from Employee where Department_ID=(select Department_ID from Department where Name='Sales')

--6. Update the salaries of employees who are working as clerks on the basis of 10%

Update Employee 
set Salary=(Salary* 10/100)+Salary 
where Job_ID=(select Job_ID from Job where Designation='Clerk')

select * from employee

--7. Delete the employees who are working in the accounting department. 

Delete from Employee where Department_ID=(select Department_ID from Department where Name='Accounting')

--8. Display the second highest salary drawing employee details. 

Select * from Employee As E1 where 2=(select Count(DISTINCT Salary) from Employee AS E2 where E1.salary<=E2.Salary)

--9. Display the nth highest salary drawing employee details. 

select * from Employee E1 where 5=(select COUNT(DISTINCT Salary) From Employee AS E2 where E1.salary<=E2.Salary)
--replace n with your desired number

--10. List out the employees who earn more than every employee in department 30.
SELECT *
FROM Employee AS E1
WHERE E1.Salary > ALL (
    SELECT E2.Salary
    FROM Employee AS E2
    WHERE E2.Department_ID = 30
)

--11. List out the employees who earn more than the lowest salary in department.
Select * 
From Employee AS E1 
Where E1.Salary > ALL (
    Select Min(E2.Salary)
	from Employee AS E2
)
--12. Find out which department has no employees. 
SELECT Name
FROM Department
WHERE Name NOT IN (SELECT DISTINCT D.Name FROM Employee As E left join Department AS D on E.Department_ID = D.Department_ID)

Select * From Employee
Select * from Department

--13. Find out the employees who earn greater than the average salary for their department

Select * from Employee AS E1 Where EXISTS (select D.Name,Avg(salary) from Employee AS E2 left join Department AS D 
on E2.Department_ID=D.Department_ID group by D.Name having E1.Salary> AVG(Salary))