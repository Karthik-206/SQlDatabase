show databases;
use sql_workspace;
show tables;
# Creating department Table
create table Department(DepartmentID int,
						DepartmentName	varchar(40),
                        ManagerID	int,
                        Location	varchar(30),
                        Phone		varchar(20),
                        Budget	float,
                        StartDate	date);

                    
insert into Department
values
(1,'IT',5,'New York','555-9001',500000,'2015-01-01',4,2101,'it@company.com'),
(2,'QA',2,'Boston','555-9002',300000,'2016-02-15',2,2102,'qa@company.com'),
(3,'Data',6,'San Francisco','555-9003',250000,'2017-03-12',3,2103,'data@company.com'),
(4,'Design',4,'Chicago','555-9004',220000,'2018-05-23',5,2104,'design@company.com'),
(5,'HR',11,'Denver','555-9005',200000,'2019-06-30',2,2105,'hr@company.com'),
(6,'Finance',9,'Seattle','555-9006',320000,'2016-08-14',3,2106,'finance@company.com'),
(7,'Accounting',15,'Miami','555-9007',270000,'2014-04-04',6,2107,'accounting@company.com'),
(8,'Legal',18,'Washington DC','555-9008',350000,'2020-11-11',7,2108,'legal@company.com'),
(9,'Marketing',20,'Austin','555-9009',400000,'2021-01-19',8,2109,'marketing@company.com'),
(10,'Operations',NULL,'Atlanta','555-9010',450000,'2013-10-22',1,2110,'operations@company.com'),
(11,'Logistics',NULL,'Dallas','555-9011',220000,'2014-07-05',2,2111,'logistics@company.com'),
(12,'Procurement',NULL,'San Diego','555-9012',300000,'2015-09-10',3,2112,'procurement@company.com'),
(13,'Strategy',NULL,'Orlando','555-9013',330000,'2017-02-20',4,2113,'strategy@company.com'),
(14,'Admin',NULL,'Portland','555-9014',180000,'2016-01-25',5,2114,'admin@company.com'),
(15,'Security',NULL,'Phoenix','555-9015',240000,'2018-06-18',6,2115,'security@company.com'),
(16,'R&D',NULL,'Raleigh','555-9016',370000,'2020-04-02',7,2116,'rnd@company.com'),
(17,'Compliance',NULL,'Salt Lake City','555-9017',290000,'2021-09-09',8,2117,'compliance@company.com'),
(18,'Training',NULL,'Tampa','555-9018',210000,'2022-08-20',9,2118,'training@company.com'),
(19,'Audit',NULL,'Nashville','555-9019',310000,'2023-05-10',10,2119,'audit@company.com'),
(20,'Sales',NULL,'Detroit','555-9020',430000,'2022-12-01',1,2120,'sales@company.com');
                    
                    
                    
# creating Employee table
create table Employee ( EmployeeID int,
						FirstName varchar(20),	
                        LastName varchar(20),
                        Email	varchar(30),
                        Phone	varchar(20),
                        HireDate date,	
                        JobTitle varchar(40),		
                        Salary	float,
                        DepartmentID int,	
                        ManagerID int );
						
# adding data in employee table 
insert into Employee(EmployeeID,FirstName,LastName,Email,Phone,HireDate,JobTitle,Salary,DepartmentID,ManagerID)
values
(1,'Alice','Johnson','alice.j@company.com','555-1010','2018-03-15','Software Engineer',85000,1,5),
(2,'Bob','Smith','bob.s@company.com','555-2020','2019-06-21','QA Analyst',62000,2,5),
(3,'Clara','Zhao','clara.z@company.com','555-3030','2020-01-10','Data Analyst',70000,3,6),
(4,'Dan','Lee','dan.l@company.com','555-4040','2021-11-03','UX Designer',68000,4,7),
(5,'Emma','Davis','emma.d@company.com','555-5050','2017-09-25','Team Lead',95000,1,NULL),
(6,'Felix','Martin','felix.m@company.com','555-6060','2022-02-14','HR Specialist',61000,5,8),
(7,'Grace','Patel','grace.p@company.com','555-7070','2021-05-19','Recruiter',59000,5,8),
(8,'Henry','Kim','henry.k@company.com','555-8080','2020-08-11','Financial Analyst',74000,6,9),
(9,'Irene','Singh','irene.s@company.com','555-9090','2019-12-31','Business Analyst',77000,6,9),
(10,'Jack','Lopez','jack.l@company.com','555-1111','2016-10-01','Systems Admin',80000,1,5),
(11,'Karen','Brown','karen.b@company.com','555-1212','2021-04-20','HR Manager',91000,5,NULL),
(12,'Leo','Wang','leo.w@company.com','555-1313','2018-07-22','IT Support',64000,1,5),
(13,'Maria','Torres','maria.t@company.com','555-1414','2020-09-13','Accountant',70000,7,15),
(14,'Nathan','Ali','nathan.a@company.com','555-1515','2017-01-28','Senior Developer',110000,1,5),
(15,'Olivia','Green','olivia.g@company.com','555-1616','2016-04-05','Finance Manager',98000,7,NULL),
(16,'Paul','White','paul.w@company.com','555-1717','2022-03-17','Junior Developer',58000,1,14),
(17,'Quinn','Baker','quinn.b@company.com','555-1818','2023-06-30','UI Developer',69000,4,4),
(18,'Rachel','Moore','rachel.m@company.com','555-1919','2021-10-12','Legal Counsel',120000,8,NULL),
(19,'Steve','Adams','steve.a@company.com','555-2021','2020-12-25','Compliance Officer',93000,8,18), 
(20,'Tina','Scott','tina.s@company.com','555-2122','2023-01-07','Marketing Manager',88000,9,NULL);


select * from employee;
select * from department;

alter table department
add primary key(DepartmentID);

alter table employee
add foreign key(DepartmentId)  references  Department(DepartmentID);

 
# 1. Get the names of employees and the location of the departments they work in.

select Employee.FirstName,Employee.LastName,Department.Location,Department.DepartmentID
from Employee,Department
where Employee.DepartmentId=Department.DepartmentID
order by Employee.FirstName;

/*Supported Types of Joins in MySQL
INNER JOIN: Returns records that have matching values in both tables
LEFT JOIN: Returns all records from the left table, and the matched records from the right table
RIGHT JOIN: Returns all records from the right table, and the matched records from the left table
CROSS JOIN: Returns all records from both tables */

# 2. Find employees who work in the ‘IT’ department.
select Employee.FirstName,Employee.LastName,Department.DepartmentName
from Employee,Department
where DepartmentName='IT';

# 3. List departments that have no employees.

select Employee.DepartmentID,Department.DepartmentID,Department.DepartmentName
from Employee
right join Department
on Department.DepartmentID=Employee.DepartmentID
where  Employee.DepartmentID is null;

# 4. Count the number of employees in each department.

select count(*) as Count,Department.DepartmentName
from Employee
inner join Department
on Department.DepartmentID=Employee.DepartmentID
group by Department.DepartmentName;

# 5. List employees along with their manager's full name (self-join)

# 6. Find employees whose department has a budget greater than 300,000.

select distinct(Department.DepartmentName),Department.Budget
from Employee
inner join Department
on Department.DepartmentID=Employee.DepartmentId
where Department.Budget>300000;

select * from employee;
select * from department;

/*
Intermediate Multi-Table SQL Questions
1. List all departments with the average salary of their employees.		*/
select avg(Employee.Salary) as Avg_salary,Department.DepartmentName
from Employee
inner join Department
on Department.DepartmentID=Employee.DepartmentID
group by Department.DepartmentName;

# 2. Get the highest-paid employee in each department.

select Department.DepartmentName,max(Employee.Salary) as Max_Salary
from Employee
inner join Department
on Department.DepartmentID=Employee.DepartmentID
group by Department.DepartmentName;

# 3. Find departments where the average employee salary is above 75,000.

select Department.DepartmentName,avg(Employee.Salary) as Avg_salary
from Employee
inner join Department
on Department.DepartmentID=Employee.DepartmentID
where Employee.Salary>75000
group by Department.DepartmentName;

 
# 4. List all employees who joined after their department's StartDate.

select Department.StartDate,Department.DepartmentName,Employee.FirstName,Employee.HireDate
from Employee
inner join Department
on  Department.DepartmentID=Employee.DepartmentID
where Employee.HireDate>Department.StartDate;

# 5. Show departments and the number of employees hired in each year.
select * from (select distinct(year(Employee.Hiredate)) As year_of_Hire,Department.DepartmentName,
count(Employee.Hiredate) over (partition by year(Employee.Hiredate),Department.DepartmentName) as Num
from employee
join Department
on  Department.DepartmentID=Employee.DepartmentID) as Num_rank;
# 6. Find departments with more than 5 employees.
select Department.DepartmentName,count(Employee.FirstName) As No_of_Employees
from Employee
left join Department
on Department.DepartmentID=Employee.DepartmentID
group by Department.DepartmentName;

# Advanced Multi-Table SQL Questions (15–20)

select * from employee;
select * from department;

# 1. List the top 3 highest-paid employees in each department.
select *from(select Employee.FirstName,Employee.Salary,Department.DepartmentName,
row_number() over (partition by Department.DepartmentName order by Employee.Salary desc) as rank_no
from Employee
join Department
on Department.DepartmentID=Employee.DepartmentID)
as Ranked
where rank_no<4;
# 2. Find employees working in the department with the highest budget.

select * from 
(select Employee.FirstName,Employee.Lastname,Department.DepartmentName,Department.Budget,
row_number() over (partition by Department.DepartmentName order by Department.Budget desc) as Depart_Budget_rank
from employee
join Department
on Department.DepartmentID=Employee.DepartmentID) as ranked
where Depart_Budget_rank<2;

# 3. Use a window function to rank employees by salary within each department.
select * from (select Employee.LastName,row_number() over (partition by Department.DepartmentName order by Employee.salary desc) as Rank_of_emp,
				Employee.salary,
                Department.DepartmentName
from employee
join Department
on Department.DepartmentID=Employee.DepartmentID) as Nothing;

# 4. Find employees whose salary is above the average salary of their department.

select * from ( select Employee.LastName,Employee.Salary,
				avg(Employee.Salary) over (partition by Department.DepartmentName order by Department.DepartmentName) as Avg_Salary_of_dept,
                Department.DepartmentName
                from Employee
                join Department
                on Department.DepartmentID=Employee.DepartmentID
                ) as  nothing;

# 5. Find departments where all employees earn more than 60,000.

select * from (select Employee.FirstName,Employee.Salary,Department.DepartmentName
				from Employee
                join Department
                on Department.DepartmentID=Employee.DepartmentID
                where Employee.Salary > 60000
                group by Employee.FirstName,Employee.Salary,Department.DepartmentName) as Nothing;
                
# 6. Write a query to list department names with their total salary cost, ordered by cost descending.

select Department.DepartmentName,sum(Employee.Salary) as Total_Salary_cost_of_Dept
from Employee
join Department
on Department.DepartmentID=Employee.DepartmentID
group by Department.DepartmentName
order by Total_Salary_cost_of_Dept desc;

