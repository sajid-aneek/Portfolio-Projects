/* WHERE STATEMENT 
=, ,<>, <,>, AND, OR, LIKE, NULL, NOT NULL, IN 
*/

select * from EmployeeDemographics
where EmployeeID = 1002

select * from EmployeeDemographics
where FirstName <> 'Jim'

select * from EmployeeDemographics
where EmployeeID < 1002

select * from EmployeeDemographics
where EmployeeID > 1002

select * from EmployeeDemographics
where Age >= 32 AND Gender = 'Male'

select * from EmployeeDemographics
where Age < 32 OR Gender = 'Female'

select * from EmployeeDemographics
where LastName LIKE '%H%'

select * from EmployeeDemographics
where LastName is NULL

select * from EmployeeDemographics
where LastName is NOT NULL
