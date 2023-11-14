/* 
Aliasing
*/

Select FirstName + ' ' + LastName AS FullName
From EmployeeDemographics


Select *
From EmployeeDemographics As Demo
FUll OUter JOIN EmployeeSalary AS Sal
ON Demo.EmployeeID = Sal.EmployeeID
