/** Script for SelectTopNrows command from SSMS ***/

SELECT TOP (1000) [EmployeeID]
      ,[FirstName]
      ,[LastName]
      ,[Age]
      ,[Gender]
  FROM [Tutorial].[dbo].[EmployeeDemographics]
