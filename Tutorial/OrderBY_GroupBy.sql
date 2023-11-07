/*
Group By & Order By
*/

Select Gender,  count(gender)
From EmployeeDemographics
Where Age > 31
Group by gender


Select Gender,  count(gender) as CountGender
From EmployeeDemographics
Where Age > 31
Group by gender 
order by CountGender desc

Select * 
From EmployeeDemographics
Order by age Desc, gender desc

Select * 
From EmployeeDemographics
Order by 4 Desc, 5 desc



