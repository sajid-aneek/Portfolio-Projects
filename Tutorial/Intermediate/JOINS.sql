/*
Inner Joins, Full/Left/Right/ Outer Joins
*/

Select * 
From EmployeeDemographics
Inner Join EmployeeSalary
On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

Select * 
From EmployeeDemographics
Full Outer Join EmployeeSalary
On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

Select * 
From EmployeeDemographics
Left Outer Join EmployeeSalary
On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

Select * 
From EmployeeDemographics
Right Outer Join EmployeeSalary
On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


Select EmployeeDemographics.EmployeeID, FirstName, LastName, Jobtitle, Salary
From EmployeeDemographics
Join EmployeeSalary
On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

Select EmployeeSalary.EmployeeID, FirstName, LastName, Jobtitle, Salary
From EmployeeDemographics
Right Outer Join EmployeeSalary
On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/* USE CASES */
/*Highes paid Employee other than Michael*/

Select EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
From EmployeeDemographics
Inner Join EmployeeSalary
On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
Where FirstName <> 'Michael'
Order by 4 DESC

/* AVG salary for a salesman*/

Select Jobtitle, AVG(Salary) as AverageOfSalesmanSalary
From EmployeeDemographics
Inner Join EmployeeSalary
On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
Where Jobtitle = 'Salesman'
Group by Jobtitle


