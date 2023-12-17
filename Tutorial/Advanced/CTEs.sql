/*
CTEs
*/
WITH CTE_Employee as (
Select FirstName, LastName, Gender, Jobtitle, Salary
, COUNT(Gender) OVER (Partition by Gender) as TotalGender
, AVG(Salary) Over (Partition by Jobtitle) as AVGSALARY
From EmployeeDemographics dem
Join EmployeeSalary sal
ON dem.EmployeeID = sal.EmployeeID

)
Select Jobtitle, Salary, AVGSALARY, FirstName +' '+ LastName as FullName
From CTE_Employee
