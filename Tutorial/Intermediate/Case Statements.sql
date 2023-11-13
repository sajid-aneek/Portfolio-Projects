/* Case Satement 
*/

SELECT FirstName, LastName, Age,
CASE
	WHEN Age = 38 THEN 'Stanley'
	When Age>30 THEN 'OLD' 
	When Age Between 27 and 30 THEN 'Young'
	Else 'Kiddo'
END
From EmployeeDemographics
Where Age is NOT NULL
Order by Age

/* USE CASES */

-- What will be the pay for the salesmen after their raise since they are the only one getting the pay raise. 
Select FirstName, LastName, Jobtitle, Salary,
CASE
	WHEN  JobTitle = 'Salesman' THEN Salary + (Salary * .10)
	When JobTitle = 'Accountant' THEN Salary + (Salary * .05)
	Else Salary 
END AS SalaryAfterRaise
From EmployeeDemographics
JOIN EmployeeSalary
On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


