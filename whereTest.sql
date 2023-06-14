
use mydb;

/*
		where : 조건절
        
        대소판별, 판정-> 논리연산
        > <  >= <=  =  !=  <>
        
        java 			sql
        if( X== null)		is null
        if( X != null)		is not null
							= null <- 사용할 수 없다
                            
		&&(and)				and
        ||(or)				or
*/

select employee_id, first_name
from employees
where first_name = 'John';

select employee_id, first_name
from employees
where first_name != 'John';

select first_name, salary
from employees
where salary >= 10000;

select first_name
from employees
where first_name>= 'John'; -- 아스틱 코드로 따짐

select first_name
from employees
where first_name>= 'J'and first_name < 'K';-- 아스틱 코드로 따짐

-- 1990년도 이전에 입사한 사원
select first_name, hire_date
from employees
where hire_date < '1990-01-01';

select first_name,commission_pct
from employees
where commission_pct is null;

-- 보너스는 없고 급여는 10000이상인사람
select first_name, commission_pct
from employees
where commission_pct is null
	and salary >= 10000;

-- 이름이 John 이거나 Den인 사원
select first_name
from employees
where first_name = 'John'
	or first_name = 'Den';
    
select first_name, job_id, salary
from employees
where job_id = 'IT_PROG'
	and salary > 8000;
    
select first_name,  salary
from employees
where (first_name = 'John'
	or first_name = 'Den')
    and salary>6000;
    
/*
	all, any, in , exists,between
    and  or 	or			  >= <=
    
*/
    
select first_name, salary
from employees
where salary = all(select salary from employees where first_name='John');
-- where salary = 8200 and salary =2700 and salary=14000; -- 이랑 같음

select first_name, salary
from employees
where salary = all(select 8200 from dual);

select first_name, salary
from employees
where salary = any(select salary from employees where first_name='John');

select first_name, salary, job_id
from employees
where job_id in('IT_PROG','AD_VP','FI_ACCOUNT');

select first_name, salary
from employees
where salary in(10000,14000);

select first_name, job_id
from employees e
where exists ( 	select 1 
				from dual 
				where e.job_id ='IT_PROG');
                
select first_name,salary
from employees
where salary >= 6000
	and salary <=10000;
    
select first_name,salary
from employees
where salary between 6000 and 10000;

select first_name,salary
from employees
where salary < 6000
	and salary >10000;
    
select first_name,salary
from employees
where salary not between 6000 and 10000;

/*
	like : 포함하는 문자열
*/

select first_name
from employees
where first_name like 'G_ra_d'; -- _는 한 문자를 의미함

select first_name
from employees
where first_name like 'K%y'; -- %는 글자의 갯수와 상관없음 K시작 y끝

select first_name
from employees
where first_name like 'M%';  -- M으로 시작하는 사람

select first_name
from employees
where first_name like '%y';  -- y로 끝나는 사람

select first_name
from employees
where first_name like '%b%';  -- b가 들어가는 사람

select first_name
from employees
where first_name like '%be%';  -- be가 들어가는 사람alter

select first_name, hire_date
from employees
where hire_date like '2000-01%'; -- 2000년 1월 입사자

select first_name, hire_date
from employees
where hire_date >= '1990-01-01'
	and hire_date <= '1991-01-01'; 