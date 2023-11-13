/* 
Union, Union All
*/


---- Inserting Null Values into Employee Demographics Table 
--Insert into EmployeeDemographics VALUES
--(1011, 'Ryan', 'Howard', 26, 'Male'),
--(NULL, 'Holly', 'Flax', NULL, NULL),
--(1013, 'Darryl', 'Philbin', NULL, 'Male')


---- Creating a new Table, WareHouseEmployeeDemographics
--Create Table WareHouseEmployeeDemographics 
--(EmployeeID int, 
--FirstName varchar(50), 
--LastName varchar(50), 
--Age int, 
--Gender varchar(50)
--)
---- Inserting Values into it 
--Insert into WareHouseEmployeeDemographics VALUES
--(1013, 'Darryl', 'Philbin', NULL, 'Male'),
--(1050, 'Roy', 'Anderson', 31, 'Male'),
--(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
--(1052, 'Val', 'Johnson', 31, 'Female')

Select * 
From EmployeeDemographics
Full Outer Join WareHouseEmployeeDemographics 
On EmployeeDemographics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID

Select * 
From EmployeeDemographics
UNION 
Select * 
From WareHouseEmployeeDemographics

Select * 
From EmployeeDemographics
UNION ALL
Select * 
From WareHouseEmployeeDemographics
ORDER BY EmployeeID