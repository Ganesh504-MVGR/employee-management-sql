-- 1. Find employees working on more than one project
SELECT EmpID, COUNT(ProjectID) AS ProjectCount
FROM EmployeeProjects
GROUP BY EmpID
HAVING COUNT(ProjectID) > 1;


-- 2. Top 2 highest salaries in each department
SELECT DepartmentID, EmpID, Salary
FROM (
SELECT e.*, ROW_NUMBER() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS rn
FROM Employees e
) AS x
WHERE rn <= 2;


-- 3. Departments with total salary expense > 100000
SELECT d.DeptName, SUM(e.Salary) AS TotalExpense
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DeptID
GROUP BY d.DeptName
HAVING SUM(e.Salary) > 100000;


-- 4. Get employees not assigned to any project
SELECT e.EmpID, e.FirstName, e.LastName
FROM Employees e
LEFT JOIN EmployeeProjects ep ON e.EmpID = ep.EmpID
WHERE ep.ProjectID IS NULL;


-- 5. List project names with number of employees involved
SELECT p.ProjectName, COUNT(ep.EmpID) AS EmployeeCount
FROM Projects p
LEFT JOIN EmployeeProjects ep ON p.ProjectID = ep.ProjectID
GROUP BY p.ProjectName;


-- 6. Find longest-serving employee
SELECT EmpID, FirstName, LastName, HireDate
FROM Employees
ORDER BY HireDate ASC
LIMIT 1;


-- 7. Salary percentile ranking of employees
SELECT EmpID, FirstName, LastName,
PERCENT_RANK() OVER (ORDER BY Salary) AS SalaryPercentile
FROM Employees;


-- 8. Project with maximum allocated hours
SELECT p.ProjectName, SUM(ep.AllocationHours) AS TotalHours
FROM EmployeeProjects ep
JOIN Projects p ON ep.ProjectID = p.ProjectID
GROUP BY p.ProjectName
ORDER BY TotalHours DESC
LIMIT 1;


-- 9. Department-wise highest and lowest salaries
SELECT d.DeptName,
MAX(e.Salary) AS MaxSalary,
MIN(e.Salary) AS MinSalary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DeptID
GROUP BY d.DeptName;


-- 10. Employee details and total project hours (if any)
SELECT e.EmpID, e.FirstName, e.LastName,
COALESCE(SUM(ep.AllocationHours), 0) AS TotalHours
FROM Employees e
LEFT JOIN EmployeeProjects ep ON e.EmpID = ep.EmpID
GROUP BY e.EmpID, e.FirstName, e.LastName;