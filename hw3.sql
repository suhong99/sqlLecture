
use mydb;

-- 문제1) EMPLOYEES 테이블에서 입사일자 순으로 정렬한 사원번호, 이름, 업무, 급여, 입사일자,부서번호를 출력하라.
select employee_id,first_name,job_id,salary,hire_date,department_id
from employees order by hire_date;

-- 문제2) EMPLOYEES 테이블에서 가장 최근에 입사한 순으로 정렬한 사원번호, 이름, 업무, 급여, 입사일자,부서번호를 출력하라.

select employee_id,first_name,job_id,salary,hire_date,department_id
from employees order by hire_date desc;

-- 문제3) EMPLOYEES 테이블에서 부서번호로 정렬한 후 부서번호가 같을 경우 급여가 많은 순으로 정렬한
-- 사원번호, 성명, 업무, 부서번호, 급여를 출력하여라.

select employee_id,first_name,job_id,department_id,salary
from employees 
order by department_id , salary desc;

-- 문제4) EMPLOYEES 테이블에서 첫번째 정렬은 부서번호로 두번째 정렬은 업무로 세번째 정렬은 급여가 많은 순으로 정렬한
-- 사원번호, 성명, 입사일자, 부서번호, 업무, 급여를 출력하여라.
select employee_id,first_name,department_id ,job_id,salary
from employees 
order by department_id , job_id, salary desc;

-- 그룹핑
-- 문제1) EMPLOYEES 테이블에서 모든 SALESMAN(SA_)에 대하여 급여의 평균, 최고액, 최저액, 합계를 구하여 출력하여라.

select job_id ,avg(salary), max(salary), min(salary), sum(salary)
from employees
where job_id like 'SA%'
group by job_id ;

-- 문제2) EMPLOYEES 테이블에 등록되어 있는 인원수, 보너스가 NULL이 아닌 인원수, 보너스의 평균, 등록되어 있는 부서의 수를 구하여 출력하라.
-- count(commission_pct) null이 아닌거만 세어줌
select count(*) , count(commission_pct),avg(commission_pct), count(distinct department_id)  -- 애초에 null인거 세지 않음)
from employees;

select  count(*)
from employees
where commission_pct is not null;

-- 문제3) EMPLOYEES 테이블에서 부서별로 인원수, 평균 급여, 최저급여, 최고 급여, 급여의 합을 구하여 출력하라.
select department_id,count(*), avg(salary), min(salary), max(salary), sum(salary)
from employees
group by department_id;

-- 문제4) EMPLOYEES 테이블에서 각 부서별로 인원수,급여의 평균, 최저 급여, 최고 급여, 급여의 합을 구하여 급여의 합이 많은 순으로 출력하여라.

select department_id,count(*), avg(salary), min(salary), max(salary), sum(salary)
from employees
group by department_id
order by sum(salary) desc;

-- 문제5) EMPLOYEES 테이블에서 부서별, 업무별 그룹하여 결과를 부서번호, 업무, 인원수, 급여의 평균, 급여의 합을 구하여 출력하여라.

select department_id,job_id,count(*), avg(salary),  sum(salary)
from employees
group by department_id, job_id;

-- 문제6) EMPLOYEES 테이블에서 부서 인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 구하여 출력하여라

select department_id,count(*) as 인원수,  sum(salary)
from employees
group by department_id
having 인원수 >4;

-- 문제7) EMPLOYEES 테이블에서 급여가 최대 10000이상인 부서에 대해서 부서번호, 평균 급여, 급여의 합을 구하여 출력하여라.

select department_id,count(*) as 인원수,  sum(salary) as 급여합
from employees
group by department_id
having 급여합 >10000;

-- 문제8) EMPLOYEES 테이블에서 업무별 급여의 평균이 10000 이상인 업무에 대해서 업무명,평균 급여, 급여의 합을 구하여 출력하라.

select job_id,count(*) as 인원수,  avg(salary) as 평균급여,sum(salary) as 급여합
from employees
group by job_id
having avg(salary) >=10000;

select job_id,count(*) as 인원수,  avg(salary) as 평균급여,sum(salary) as 급여합
from employees
group by job_id
having 평균급여 >=10000;

select job_id,count(*) as 인원수,  avg(salary) as "평균 급여",sum(salary) as 급여합
from employees
group by job_id
having "평균 급여" >=10000;  -- mysql에선 안됨

-- 문제9) EMPLOYEES 테이블에서 전체 월급이 10000을 초과하는 각 업무에 대해서 업무와 월급여 합계를 출력하라.
-- 단 판매원(SA_)은 제외하고 급여 합계로 정렬(내림차순)하라.

select job_id,sum(salary) as 전체월급
from employees
where job_id not like "SA%"
group by job_id
having 전체월급 > 10000
order by 전체월급 desc;


