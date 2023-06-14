
use mydb;

/*
	order by ==Sorting 정령 (오름,내림)
    
*/

select first_name , salary
from employees
order by salary asc; -- 오름

select first_name , salary
from employees
order by salary desc; -- 내림

desc employees;

select first_name , salary
from employees
order by salary; -- 오름

select first_name, job_id, salary
from employees
where job_id = 'IT_PROG'
order by first_name asc;

select first_name, commission_pct
from employees
where commission_pct is not null  -- where은 order by 위에
order by commission_pct asc;

select first_name, job_id, salary
from employees
order by job_id asc, salary desc;

select first_name , salary * 12 as 연봉
from employees
order by 연봉 desc;  -- alias 사용가능

/*
	그룹으로 묶는 기능
    그룹함수(통계) : count,
*/

-- 그룹으로 묶는 기능 
select  department_id
from employees;

select distinct department_id
from employees;

/*
		group by : 그룹으로 묶는 기능
        having : 묶은 후에 조건   		cf) where : 묶기 전에 조건
        
*/
select department_id
from employees
group by department_id; -- 


select department_id , count(employee_id), sum(salary),avg(salary)  -- 그룹으로 묶을수있는 값이여야 함
from employees
group by department_id;

-- round(반올림), truncate(버림, 어디까지)  -1일 경우 1의자리 버리기 0이면 소숫점
select department_id , count(employee_id), sum(salary),avg(salary),truncate(avg(salary),0), truncate(avg(salary),-1)  ,max(salary), min(salary)
from employees
group by department_id;

-- 업무(job_id)별로 급여의 합계가 15000 이상인 업무만 출력해라
select job_id ,count(*),sum(salary)  as 합계
from employees
group by job_id 
having sum(salary)>150000
order by 합계 desc;


