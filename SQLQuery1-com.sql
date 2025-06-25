create database com
use com
--CREATING EMPLOYEE TABLE
create table employee (
			ssn int primary key identity(1,1)  , fname nvarchar(10) , lname nvarchar(10),
			bdate date , gender nvarchar(6) , supervisor int, dnum int
			foreign key (supervisor) references employee(ssn)
	)




--CREATING DEPARTMENT TABLE
create table department (
			dnum int primary key identity(1,1) , dname nvarchar(10) , hdate int, ssn int,
			foreign key (ssn) references employee (ssn)
			)


EXEC sp_rename 'department.ssn', 'mangerSSN', 'COLUMN';




--TO ADD FOREIGN KEY TO EMPLOYEE DEPARTMENT
ALTER TABLE employee
ADD CONSTRAINT FK_dnum
FOREIGN KEY (dnum) REFERENCES department(dnum)



--CREATE LOCATIONS TABLE
create table locations (
			dnum int , locations nvarchar(10) , primary key (dnum,locations),
			foreign key (dnum) references department (dnum)
			)




--CREATING PROJECT TABLE
create table project (
			pnum int primary key , pname nvarchar(10) ,location_name nvarchar(10),
			city nvarchar(8) , dnum int, foreign key (dnum) references department (dnum)
			)




--CREATING DEPENDENTS TABLE
create table dependents (
			dep_name nvarchar(8) ,ssn int, gender nvarchar(7) ,bdate int,
			primary key (dep_name,ssn) , foreign key (ssn) references employee(ssn)
			)




--CREATING WORK TABLE
create table work (
			ssn int , pnum int , working_hrs int,
			primary key (ssn,pnum) , foreign key (ssn) references employee (ssn),
			foreign key (pnum) references project(pnum)
			)



--INSERT VALUE TO EMPLOYEE TABLE(WRONG WAY FOR DATE)
insert into employee (fname,lname,bdate,gender) 
values ('maather','alwadhahi',04-09-1999,'female')


--INSERT VALUE TO EMPLOYEE TABLE
insert into employee (fname,lname,bdate,gender) 
values ('maather','alwadhahi','04-09-1999','female')


--INSERT VALUE TO DEP TABLE
insert into department (dname,hdate) 
values ('sales','2-2-2002'),('it','3-3-2000'),('admin','5-3-2002')


--INSERT VALUE TO LOC TABLE
insert into locations (dnum,locations) 
values (1,'muscat')


--INSERT VALUE TO PROJECT TABLE
insert into project(pnum,pname,location_name,city)
values (1,'course','rihal','muscat')

--INSERT VALUE TO DEPENDENT TABLE
insert into dependents (dep_name,ssn,gender,bdate)
values ('mn',2,'female',04-09-1999)


--INSERT VALUE TO WORK TABLE
insert into work (ssn,pnum,working_hrs)
values (2,1,3)

--CHANGE DATA TYPE FOR BDATE AS DATE INSTADE OF INT
alter table employee 
alter column bdate date

--DELET HDATE COLUMN
alter table department
drop column hdate 

-- DELET BDATE COLUMN 
alter table employee 
drop column bdate 


--ADD NEW COLUMN 
alter table employee
add  bdate date
 alter table department
 add hdate date 

--DISPLAY TABLES
select * from department
select * from employee
select * from project
select * from work
select * from locations
select * from dependents


--CHANGE VALUES
update employee 
set supervisor= 2 
where ssn = 5

--CHANGE VALUES IN EMPLOYEE TABLE
update employee 
set fname='khalid'
where ssn = 5


insert employee (fname,lname,gender,supervisor,dnum,bdate)
values ('noor','alharthi','female',3,5,'4-5-1997')

update employee
set dnum = 4
where ssn = 5

update employee
set gender = 'male' 
where ssn = 5


--CHANGE VALUES IN DEPARTMENT TABLE
update department
set dname = 'management'
where dnum = 2

update department
set mangerSSN = 6
where dnum = 5

update department
set hdate = '5-12-2001'
where dnum = 1

--CHANGE VALUES IN PROJECT TABLE
update project
set dnum = 2 
where pnum = 1