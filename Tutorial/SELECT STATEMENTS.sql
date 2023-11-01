/* SELECT STATEMENTS 
*, TOP, DISTINCT, COUNT, AS, MAX, MIN, AVG
*/
SELECT * 
FROM EmployeeDemographics

SELECT TOP(5) *
FROM EmployeeDemographics

SELECT DISTINCT(EmployeeID) 
FROM EmployeeDemographics

SELECT COUNT(LastName) As LastNameCount
FROM EmployeeDemographics

SELECT MAX(Salary)As MaximumEmployeeSalary
FROM EmployeeSalary
