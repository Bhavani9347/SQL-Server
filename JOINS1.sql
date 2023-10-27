-----INNER JOINS
SELECT HumanResources.Employee.BusinessEntityID,HumanResources.Employee.Gender,
HumanResources.EmployeeDepartmentHistory.BusinessEntityID
FROM HumanResources.Employee
INNER JOIN HumanResources.EmployeeDepartmentHistory  ON HumanResources.Employee.BusinessEntityID=HumanResources.EmployeeDepartmentHistory.BusinessEntityID


----LEFT JOIN
SELECT HumanResources.Employee.BusinessEntityID,HumanResources.Employee.JobTitle,
HumanResources.EmployeeDepartmentHistory.BusinessEntityID,HumanResources.EmployeeDepartmentHistory.DepartmentID
FROM HumanResources.Employee
LEFT JOIN HumanResources.EmployeeDepartmentHistory ON HumanResources.Employee.BusinessEntityID=HumanResources.EmployeeDepartmentHistory.BusinessEntityID


-----RIGHT JOIN
SELECT HumanResources.Employee.BusinessEntityID,HumanResources.Employee.MaritalStatus,
HumanResources.EmployeeDepartmentHistory.BusinessEntityID,EmployeeDepartmentHistory.DepartmentID
FROM HumanResources.Employee
RIGHT JOIN HumanResources.EmployeeDepartmentHistory ON HumanResources.Employee.BusinessEntityID=HumanResources.EmployeeDepartmentHistory.BusinessEntityID


----Cross Join
SELECT HumanResources.Employee.BusinessEntityID,
HumanResources.EmployeeDepartmentHistory.BusinessEntityID
From HumanResources.Employee
CROSS JOIN HumanResources.EmployeeDepartmentHistory
