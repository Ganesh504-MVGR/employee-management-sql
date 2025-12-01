-- 1. List employees with department names
SELECT e.EmpID, e.FirstName, e.LastName, d.DeptName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DeptID;


-- 2. Find highest paid employee
SELECT *
FROM Employees
ORDER BY Salary DESC
LIMIT 1;


-- 3. Total allocation hours per project
SELECT p.ProjectName, SUM(ep.AllocationHours) AS TotalHours
FROM EmployeeProjects ep
JOIN Projects p ON ep.ProjectID = p.ProjectID
GROUP BY p.ProjectName;


-- 4. Employees hired after 2021
SELECT EmpID, FirstName, LastName
FROM Employees
WHERE HireDate > '2021-12-31';


-- 5. Department-wise average salary
SELECT d.DeptName, AVG(e.Salary) AS AvgSalary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DeptID
GROUP BY d.DeptName;