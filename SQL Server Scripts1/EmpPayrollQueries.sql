------  UC1 ----------------------
create database EmpPayroll;
SELECT * FROM sys.databases ;  
use EmpPayroll;

------  UC2 ----------------------
create Table EmployeePayroll
(
ID			int	identity(1, 1),
Name		varchar(255) NOT Null,
Salary		int,
StartDate	Date,
primary key(ID)
)

------  UC3 ----------------------

insert into EmployeePayroll(Name, Salary, StartDate) values
('Dipesh', 10000, '2018-01-01'),
('Dhanesh', 15000, '2019-01-01'),
('Mohan', 30000, '2020-01-01');

------  UC4 ----------------------

select * from EmployeePayroll


------  UC5 ----------------------

select salary from EmployeePayroll where Name = 'Dipesh';
select * from EmployeePayroll where StartDate	between '2018-01-01' and GETDATE();

------  UC6 ----------------------

alter table EmployeePayroll add Gender char(1)
update EmployeePayroll set Gender = 'M'; 
insert into EmployeePayroll(Name, Salary, StartDate,Gender) values
('Shivani', 15000, '2019-01-01','F'),
('Mohini', 30000, '2020-01-01','F');


------  UC7 ----------------------

select sum(salary) as total_salary from EmployeePayroll
select avg(salary) as average_salary from EmployeePayroll
select min(salary) as min_salary from EmployeePayroll
select max(salary) as max_salary from EmployeePayroll
select count(salary) as salary_count from EmployeePayroll

select Gender, sum(salary) as total_salary from EmployeePayroll group by Gender
select Gender, count(salary) as salary_count from EmployeePayroll group by Gender
select Gender, max(salary) as max_salary from EmployeePayroll group by Gender;

------  UC8 ----------------------

alter table EmployeePayroll add PhoneNumber bigint, Address varchar(150) default('banglore'), Department varchar(50) not null default 'Tech';

------  UC9 ----------------------

alter table EmployeePayroll add Deduction int, TaxablePay int, IncomeTax int, NetPay int;
EXEC sp_RENAME 'EmployeePayroll.Salary', 'BasicPay', 'column'

------  UC10 ----------------------

insert into EmployeePayroll(Name, Salary, StartDate,Gender) values
('Terissa', 15000, '2019-01-01','F');
update EmployeePayroll set Department = 'Sales'  where Name  = 'Terissa';
insert into EmployeePayroll(Name, Department) values('Terissa', 'Marketing');

------  UC11 ----------------------


select ID, BasicPay, Deduction, TaxablePay, IncomeTax, NetPay into Payroll from EmployeePayroll
select * from Payroll
alter table Payroll add foreign key(ID) references EmployeePayroll(ID)
alter table EmployeePayroll drop column BasicPay, Deduction, TaxablePay, IncomeTax, NetPay;

select ID into Company from EmployeePayroll
alter table Company add CompanyName varchar(20) default 'Marlabs';
update Company  set CompanyName = 'Marlabs' where CompanyName IS NULL ;
select * from Company
drop table Company;

select ID, Department into Department from EmployeePayroll
alter table Department add foreign key(ID) references EmployeePayroll(ID)

select * from Department;
drop table Department;
ALTER TABLE Employee_Payroll DROP CONSTRAINT DF__EmployeeP__Depar__023D5A04

alter table EmployeePayroll drop column Department



select * from EmployeePayroll;
select * from Payroll;
select * from Department;
select * from Company;

delete from Payroll where ID=13;
delete from EmployeePayroll where ID=13;

------  UC12 ----------------------

select * from EmployeePayroll;
select BasicPay from Payroll where ID = (select ID from EmployeePayroll where Name = 'Terissa')
select * from EmployeePayroll where StartDate	between '2018-01-01' and GETDATE();

select avg(BasicPay) as average_BasicPay from Payroll
select Gender, sum(BasicPay) as total_BasicPay from Payroll, EmployeePayroll where Payroll.ID = EmployeePayroll.ID group by Gender
select Gender, count(BasicPay) as salary_BasicPay from Payroll, EmployeePayroll where Payroll.ID = EmployeePayroll.ID group by Gender
select Gender, max(BasicPay) as max_BasicPay from Payroll, EmployeePayroll where Payroll.ID = EmployeePayroll.ID group by Gender;
select Gender, min(BasicPay) as min_BasicPay from Payroll, EmployeePayroll where Payroll.ID = EmployeePayroll.ID group by Gender;



select BasicPay from Payroll where ID = (select ID from EmployeePayroll where Name = 'Terissa')

select * from EmployeePayroll, Department  where EmployeePayroll.ID = Department.ID and StartDate between '2018-01-01' and GETDATE();

select EmployeePayroll.ID,Name,StartDate,Gender,PhoneNumber,Address,
	   Department,BasicPay,Deduction,TaxablePay,IncomeTax
	   NetPay,CompanyName
 from EmployeePayroll, Department , Payroll , Company  
where EmployeePayroll.ID = Department.ID and
      EmployeePayroll.ID = Payroll.ID and
	  EmployeePayroll.ID = Company.ID; 

use EmpPayroll;
select * from EmployeePayroll

Update EmployeePayroll set PhoneNumber = 54321 where Name = 'Dipesh'