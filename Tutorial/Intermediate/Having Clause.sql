/* 
Having Clause
*/

Select Jobtitle, COUNT(JobTitle)
From EmployeeDemographics
JOIN EmployeeSalary
On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
Group By Jobtitle
Having COUNT(JobTitle) > 1


Select Jobtitle, AVG(Salary) as AverageSALARY 
From EmployeeDemographics
JOIN EmployeeSalary
On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
Group By Jobtitle
Having AVG(Salary) > 45000
Order by AVG(Salary) 