create database assignment2;
use assignment2;

create table employee
(
    employee_name varchar(20) primary key,
    streat varchar(20),
    city varchar(25)
);

create table works
(
    employee_name varchar(20) primary key,
    company_name varchar (25),
    salary int(10,2)
);


CREATE TABLE company
(
    company_name varchar(25) primary key,
    city varchar(25)
);


create table manages(

    employee_name varchar(20) primary key,
    manager_name varchar(20)
);

insert into employee values("Md.Kobir","32/A Motijhil","Dhaka");
insert into employee values("Md.Haris","5/B Uposohor","Rajshahi");
insert into employee values("Sri.Dhiman","3/A Polton","Dhaka");
insert into employee values("Md.Rahman","Talaimari Road","Rajshahi");
insert into employee values("Md.Nabid","Jhikagachi Road","Kustia");

insert into works values("Md.Haris","First Bank Corporation",25000);
insert into works values("Sri.Dhiman","Jamuna Gas Pvt.Ltd",18000);
insert into works values("Md.Rahman","Pubali Bank.Ltd",35000);
insert into works values("Md.Nabid","Aman Ciment Pvt.Ltd",5000);
insert into works values("Md.Hasim","Small Bank Corporation",23000);

insert into company values("Pubali Bank.Ltd","Nator");
insert into company values("Aman Ciment Pvt.Ltd","Dhaka");
insert into company values("First Bank Corporation","Chitagong");
insert into company values("Jamuna Gas Pvt.Ltd","Rajshahi");
insert into company values("Small Bank Corporation","Rajshahi");

insert into manages values("Md.Haris","Md.M.Arefin");
insert into manages values("Md.Kobir","Md.M.Arefin");
insert into manages values("Sri.Dhiman","Md.Asifzaman");
insert into manages values("Md.Nabid","Md.M.Arefin");
insert into manages values("Md.Rahman","Md.Asifzaman");


use assignment2;

/* a */
select employee.employee_name as Names,employee.city from employee natural join works where works.company_name="First Bank Corporation";


/* b */
select employee.employee_name as Names,employee.streat as Streat,employee.city from employee natural join works where works.company_name="First Bank Corporation" and salary > 10000;


/* c */
select employee.employee_name as Names,employee.streat,employee.city from employee natural join works where works.company_name<>"First Bank Corporation";


/* d */
select employee_name as Employee_Name from works where salary > all (select salary from works where company_name = 'Small Bank Corporation');


/* e */
select distinct company_name from company where city in (select  distinct city from company where company_name='Small Bank Corporation') and company_name!='Small Bank Corporation';


/* f */
select company_name from works group by company_name having count(distinct employee_name)>=all ( select count(distinct employee_name) from works group by company_name);


/* g */
select company_name from Works group by company_name having avg(salary)>(select avg(salary) from Works where company_name="First Bank Corporation");








