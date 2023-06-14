use mydb;

-- 문제1) EMPLOYEES 테이블에서 급여가 6000이상인 사원의 사원번호, 이름, 담당업무, 급여를 출력하라.
select employee_id, first_name, job_id,salary
from employees
where salary >= 6000;

-- 문제2) EMPLOYEES 테이블에서 담당 업무가 ST_MAN인 사원의 사원번호, 성명, 담당업무, 급여, 부서번호를 출력하라.
select employee_id, first_name, job_id,salary, department_id
from employees
where job_id ='ST_MAN';

-- 문제3) EMPLOYEES 테이블에서 입사일자가 1999년 1월 1일 이후에 입사한 사원의 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라.

select employee_id, first_name, job_id,salary,hire_date ,department_id
from employees
where hire_date >'1999-01-01';
-- where hire_date > date('1999-01-01');

-- 문제4) EMPLOYEES 테이블에서 급여가 3000에서 5000사이의 사원의 성명, 담당업무, 급여, 부서번호를 출력하라.

select  first_name, job_id,salary ,department_id
from employees
where salary between 3000 and 5000;

-- select  first_name, job_id,salary ,department_id
-- from employees
-- where salary >= 3000 and salary <=5000;

-- 문제5) EMPLOYEES 테이블에서 사원번호가 145,152,203인 사원의 사원번호, 성명, 담당업무, 급여, 입사일자를 출력하라
select employee_id,first_name,  job_id,salary, hire_date
from employees
where employee_id in(145,152,203);

-- 문제6) EMPLOYEES 테이블에서 입사일자가 2000년도에 입사한 사원의 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라.
select employee_id, first_name,last_name, job_id,salary,hire_date, department_id
from employees
where hire_date like '2000-%';

select employee_id, first_name,last_name, job_id,salary,hire_date, department_id
from employees
where subString(hire_date,1,4)=2000;
-- 			 컬럼명    시작위치 끝위치
select substr(hire_date,1,4) , substr(first_name,1,3),first_name -- db는 인덱스가 1부터 시작
from employees;
-- 문제7) EMPLOYEES 테이블에서 보너스가 NULL인 사원의 사원번호, 성명, 담당업무, 급여, 입사일자, 보너스, 부서번호를 출력하라.

select employee_id, first_name,last_name, job_id, salary, hire_date, commission_pct, department_id
from employees
where commission_pct is null;

-- ifnull(commission_pct, 300)
select employee_id, ifnull(commission_pct, 0) AS adjusted_salary, commission_pct
FROM employees;

-- 문제8) EMPLOYEES 테이블에서 급여가 7000이상이고 JOB이 ST_MAN인 사원의 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라

select employee_id, first_name,last_name, job_id, salary, hire_date, department_id
from employees
where salary >=7000 and job_id='ST_MAN';

-- 문제9) EMPLOYEES 테이블에서 급여가 10000이상이거나 JOB이 ST_MAN인 사원의 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라

select employee_id, first_name,last_name, job_id, salary, hire_date, department_id
from employees
where salary >=10000 or job_id='ST_MAN';

-- 문제10) EMPLOYEES 테이블에서 JOB_ID가 ST_MAN, SA_MAN, SA_REP가 아닌 사원의 사원번호, 성명, 담당업무, 급여, 부서번호를 출력하라

select	 employee_id,first_name, last_name, job_id, salary, department_id 
from employees
where job_id not in ('ST_MAN','SA_MAN','SA_REP');

-- 문제11) 업무가 AD_PRES 이고 급여가 12000이상이거나 업무가 SA_MAN인 사원의 사원번호, 이름, 업무, 급여를 출력하라.

select  employee_id, first_name, job_id, salary
from employees
where (job_id="AD_PRES" and salary>=12000) or job_id='SA_MAN';

select  employee_id, first_name, job_id, salary
from employees
where job_id="AD_PRES" 
	and salary>=12000    -- or 나올떄까지 같이..
        or job_id='SA_MAN'
        and salary <12000
        and salary<'10000'
        and salary >6000;
        

-- 문제12) 업무가 AD_PRES 또는 SALESMAN(SA_)이고 급여가 12000이상의 사원의 사원번호, 이름, 업무, 급여를 출력하라.
select  employee_id, first_name, job_id, salary
from employees
where (job_id="AD_PRES" or job_id='SA_MAN') and salary>=12000;