/*
Partition By
*/

Select * 
From EmployeeDemographics

Select *  
From EmployeeSalary

Select FirstName, LastName, Gender, Salary, 
COUNT(Gender) Over (Partition by Gender) as TotalGender
From EmployeeDemographics As demo
Join EmployeeSalary As sal
ON demo.EmployeeID = sal.EmployeeID

Select  Gender, Count(Gender) 
From EmployeeDemographics As demo
Join EmployeeSalary As sal
ON demo.EmployeeID = sal.EmployeeID
Group By Gender
