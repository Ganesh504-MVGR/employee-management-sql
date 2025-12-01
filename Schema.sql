-- Create database (optional)
CREATE DATABASE CompanyDB;
USE CompanyDB;


-- Employees table
CREATE TABLE Employees (
EmpID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
DepartmentID INT,
Salary DECIMAL(10,2),
HireDate DATE
);


-- Departments table
CREATE TABLE Departments (
DeptID INT PRIMARY KEY,
DeptName VARCHAR(50)
);


-- Projects table
CREATE TABLE Projects (
ProjectID INT PRIMARY KEY,
ProjectName VARCHAR(100),
DeptID INT
);


-- Employee Project Mapping
CREATE TABLE EmployeeProjects (
EmpID INT,
ProjectID INT,
AllocationHours INT,
PRIMARY KEY (EmpID, ProjectID)
);