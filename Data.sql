INSERT INTO Departments VALUES
(1, 'Engineering'),
(2, 'HR'),
(3, 'Finance');


INSERT INTO Employees VALUES
(101, 'Amit', 'Sharma', 1, 65000, '2022-01-15'),
(102, 'Sara', 'Khan', 2, 45000, '2021-07-19'),
(103, 'John', 'Doe', 1, 70000, '2020-03-10'),
(104, 'Priya', 'Singh', 3, 52000, '2023-02-11');


INSERT INTO Projects VALUES
(11, 'AI Automation', 1),
(12, 'Recruitment Portal', 2),
(13, 'Budget Optimization', 3);


INSERT INTO EmployeeProjects VALUES
(101, 11, 35),
(103, 11, 30),
(102, 12, 40),
(104, 13, 25);