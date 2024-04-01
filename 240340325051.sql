###########################################################################################################################
#											    ##MySQL##

#1.
create table students(studentID int primary key,name varchar(20) unique key,age int, gender char(10), Standard varchar(10),section varchar(10) foreign key);
#----------------------------------------------------------------------------------------------------------------------------#
#2.
insert into students values (001,"Sid",10,"Male","Sixth","A");
insert into students values (002,"Piyu",10,"Female","Sixth","B");
insert into students values (003,"Aryan",12,"Male","Eigth","C");
insert into students values (004,"Simon",12,"Male","Eigth","A");
insert into students values (005,"Siya",7,"Female","Fourth","C");
select * from students;
#----------------------------------------------------------------------------------------------------------------------------#
###########################################################################################################################

use hr;
#3.
select count(employee_id) from employees where first_name like "%d" group by department_id;
#----------------------------------------------------------------------------------------------------------------------------#
#4.
select first_name from employees where salary between max(salary) and max(salary,-2) group by department_id;
#----------------------------------------------------------------------------------------------------------------------------#
#5.
select first_name, last_name from employees where salary > (select avg(salary) from employees); 
# used subquery to get check salary amount greater than average salary of all employees.
#----------------------------------------------------------------------------------------------------------------------------#
#6.
select count(e.employee_id), l.location_id from employees e
INNER JOIN departments d ON e.department_id=d.department_id
INNER JOIN locations l ON d.location_id=l.location_id
where  year(e.HIRE_DATE)>date_sub(year(e.HIRE_DATE), INTERVAL 5 YEAR);
/*
used "e.HIRE_DATE>date_sub(e.HIRE_DATE, INTERVAL 5 YEAR" to check whether hiring yeare of employees is greater than
5 years of Experience.
*/
#----------------------------------------------------------------------------------------------------------------------------#
#7.
select e.employee_id from employees e
INNER JOIN jobs_history h ON e.employee_id=h.employee_id
INNER JOIN jobsON e.job_id=j.job_id
group by j.job_title 
having h.end_date!=currdate()
order by e.hire_date asc;
#----------------------------------------------------------------------------------------------------------------------------#
#8.
delimiter //
create procedure emp_details(IN emp_ID int,OUT f_name varchar(30),OUT dept_id int, OUT rankk int)
begin
		select FIRST_NAME into f_name, department_id into dept_id, autoincrement=1 into rank 
        from employees where employee_id=emp_id group by dept_id order by salary desc;
        end; 
        //
delimiter ;
call emp_details(100,@f_name,@dept_id,@rank);
#----------------------------------------------------------------------------------------------------------------------------#
##############################################################################################################################

##############################################################################################################################
/*
							#MongoDB#
test>show dbs;
test>use check;
1. -- check> db.restaurant.find({borough:{$eq:"Manhattan"}});
2. -- check> db.restaurant.aggregate([{$sort:{name:1}}]);
3. -- check> db.restaurant.find([{grades:[{$eq:"A"}]}]);
*/
#----------------------------------------------------------------------------------------------------------------------------#
##############################################################################################################################