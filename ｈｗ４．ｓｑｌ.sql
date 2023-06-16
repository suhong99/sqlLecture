
use mydb;

-- 문제1) 사원들의 이름, 부서번호, 부서명을 출력하라

select e.first_name, e.department_id, d.department_name 
-- from employees e inner join departments d;
from employees e ,departments d
where e.department_id = d.department_id;

-- 문제2) 30번 부서의 사원들의 이름,직업,부서명을 출력하라

select e.first_name, e.department_id, d.department_name , j.job_title
from employees e ,departments d, jobs j
	where e.department_id = d.department_id 
    and e.job_id = j.job_id
    and d.department_id =30;
    
-- 문제3) 커미션을 받는 사원의 이름, 직업, 부서번호, 부서명을 출력하라

select e.first_name, e.commission_pct, j.job_title,e.department_id, d.department_name 
from employees e ,departments d, jobs j
	where e.department_id = d.department_id 
    and e.job_id = j.job_id
    and  e.commission_pct is not null;
    
-- 문제4) 지역번호 2500 에서 근무하는 사원의 이름, 직업, 부서번호, 부서명을 출력하라
select e.first_name, e.job_id, e.department_id, d.department_name, l.location_id
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
where l.location_id = 2500;

-- 문제5) 이름에 A가 들어가는 사원들의 이름과 부서이름을 출력하라

select e.first_name, e.department_id, d.department_name 
from employees e ,departments d
	where e.department_id = d.department_id 
    and e.first_name like "%A%";

-- 문제6) 사원이름과 그 사원의 관리자 이름을 출력하라
select e.first_name, mng.first_name as 관리자이름
from employees e join  employees mng
on e.manager_id = mng.employee_id;

select emp.first_name as 사원, mgr.first_name as 관리자이름
from employees emp, employees mgr
where emp.manager_id = mgr.employee_id;

-- 문제7) 사원이름과 부서명과 월급을 출력하는데 월급이 6000 이상인 사원을 출력하라
select e.first_name, e.salary, e.department_id, d.department_name 
from employees e join departments d
	on e.department_id = d.department_id 
	where e.salary >=6000;

select e.first_name, d.department_name, e.salary
from employees e, departments d
where e.department_id = d.department_id
	and e.salary >= 6000;
    
-- 문제8) first_name 이 TJ 이란 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하라

select e.first_name, e.hire_date
from employees e join employees tj
on tj.first_name = "TJ"
where e.hire_date >= tj.hire_date
order by e.hire_date;

select tj.first_name, tj.hire_date,e.first_name as 사원, e.hire_date
from employees tj, employees e
where tj.first_name = 'TJ'
	and tj.hire_date < e.hire_date
    order by e.hire_date;

-- 문제9) 급여가 3000에서 5000사이인 사원의 이름과 소속부서명 출력하라
select e.first_name, e.salary,e.department_id, d.department_name 
from employees e ,departments d
	where e.department_id = d.department_id 
    and  e.salary between 3000 and 5000
    order by e.salary;
    
-- 문제10) ACCOUNTING 부서 소속 사원의 이름과 입사일 출력하라
select e.first_name, e.hire_date,e.department_id, d.department_name 
from employees e ,departments d
	where e.department_id = d.department_id 
    and  d.department_name ="ACCOUNTING"
    order by e.hire_date;

-- 문제11) 급여가 3000이하인 사원의 이름과 급여, 근무지를 출력하라 -- 중복값?
select  e.first_name,e.last_name, e.salary, l.city 
from employees e join departments d on e.department_id = d.department_id
    join locations l on d.location_id = l.location_id
	where e.salary <=3000;
    
select e.first_name,e.last_name, e.salary, l.city 
from employees e ,departments d , locations l
    where  e.department_id = d.department_id 
    and d.location_id = l.location_id
	and e.salary <=3000;

-- 문제12) 지역별로 근무하는 사원의 수가 5명 이하인 경우, 사원이 적은 도시순으로 정렬하고
-- 사원수와 city를 출력하시오.

select  l.city , count(l.location_id) as 사원수
from employees e join departments d on  e.department_id = d.department_id
    join locations l on d.location_id = l.location_id -- inner 생략이 된 거임
	group by l.city
	having count(*)<=5
    order by count(*);
    
select  l.city , count(l.location_id) as 사원수, l.city
from employees e join departments d on  e.department_id = d.department_id
    inner join locations l on d.location_id = l.location_id
	group by l.city
	having count(e.employee_id)<=5
    order by count(e.employee_id);    
    
select d.location_id, count(e.employee_id), l.city
from employees e left outer join departments d
	on e.department_id = d.department_id
		inner join locations l on d.location_id = l.location_id
	group by d.location_id;
    

-- 문제13) 지정한 부서번호, 사원이름 및 지정한 사원과 동일한 부서에서 근무하는 모든 사원을 표시하도록 하고
-- 부서번호는 deptno, 사원이름은 사원, 동일한 부서에서 근무하는 사원은 동료로 표시하시오.
-- (부서번호, 사원이름, 동료 순으로 오름차순 정렬)

select e.department_id, e.first_name, cw.first_name
from employees e 
join departments d on e.department_id=d.department_id
join employees cw on e.department_id = cw.department_id
order by e.first_name and cw.first_name;

SELECT e.department_id, e.first_name, GROUP_CONCAT(cw.first_name ORDER BY cw.first_name) AS colleagues
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN employees cw ON e.department_id = cw.department_id
GROUP BY e.department_id, e.first_name
ORDER BY e.department_id, e.first_name;

-- 강사님
select e.first_name as "사원", e.department_id as deptno,
c.department_id as deptno, c.first_name as "동료"
from employees e inner join employees c
	on e.department_id = c.department_id
    where e.employee_id <> c.employee_id
--	where e.employee_id != c.employee_id
order by e.department_id asc, e.first_name asc, c.first_name asc;
