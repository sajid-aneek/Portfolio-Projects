/* 
Temp Tables 
*/

Create Table #temp_Employee (
EmployeeID int, 
JobTitle varchar(100),
Salary int
) 
Insert into #temp_Employee
Select * 
From Tutorial..EmployeeSalary

Select * 
From #temp_Employee
