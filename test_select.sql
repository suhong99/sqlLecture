use mydb;

/*
	Join
			두 개이상의 테이블을 연결(join)해서 데이터를 취득하는 방법
            현재 테이블에서 취득할 수 없는 컬럼의 데이터를  상대테이블에서 취득하기 위함
            
            기본키(primary key) = 중복을 허용하지 않는다.  빈칸도 허용하지 않음
            외래키(foriegn key) = 다른 테이블에서 기본키인 경우가 많다. 빈칸 가능
            
            종류
				inner join
                full outer join
                cross join
                outer join
					left
					right
				self join
*/

-- inner join
-- ansi SQL  -- 오라클등 다른데서도 쓸 수 있는 표준 문법

select e.employee_id, e.first_name,
	e.department_id, d.department_id,
    d.department_name
from employees e inner join departments d
	on e.department_id = d. department_id;  -- e 는 테이블의 alias

-- mysql

select e.employee_id, e.first_name,
	e.department_id, d.department_id, -- 양쪽만 가진건 명시해서 구분해줘야 함
    department_name  -- 한쪽만 가진거 명시 안해도 됨. departments만 가짐
from employees e, departments d
where e.department_id = d.department_id;


select e.employee_id, e.first_name,
	e.job_id, j.job_id,
    j.job_title
from employees e, jobs j
where e.job_id = j.job_id;

-- department가 없는 kimberly 씨가 조인 안됨
select e.employee_id, e.first_name,
	e.department_id, d.department_name,
    e.job_id, j.job_title
from employees e, departments d, jobs j
where e. department_id = d.department_id
	and e.job_id = j.job_id;
    
select distinct department_id
	from employees;
    
-- cross join
select e.employee_id, e.first_name, 
	e.department_id, d.department_id,
	d.department_name
from employees e cross join departments d;

-- left join
-- ansi

select e.employee_id , e.first_name,
	e.department_id, d.department_id,
    d.department_name
from employees e left outer join departments d
	on e.department_id = d.department_id;

-- right join
-- ansi
    
select e.employee_id , e.first_name,
	e.department_id, d.department_id,
    d.department_name
from employees e right outer join departments d
	on e.department_id = d.department_id;
    
-- outer join
select e.employee_id , e.first_name,
	e.department_id, d.department_id,
    d.department_name
from employees e left outer join departments d
	on e.department_id = d.department_id
    where e.department_id is null;

select e.employee_id , e.first_name,
	e.department_id, d.department_id,
    d.department_name
from employees e right outer join departments d
	on e.department_id = d.department_id
    where e.department_id is null;
    
    
-- full outer join
-- mysql에선 지원 안함 union으로 만들기
select e.employee_id , e.first_name,
	e.department_id, d.department_id,
    d.department_name
from employees e left outer join departments d
	on e.department_id = d.department_id
union    
select e.employee_id , e.first_name,
	e.department_id, d.department_id,
    d.department_name
from employees e right outer join departments d
	on e.department_id = d.department_id;

--

select e.employee_id , e.first_name,
	e.department_id, d.department_id,
    d.department_name
from employees e left outer join departments d
	on e.department_id = d.department_id
    where e.department_id is null
    union
select e.employee_id , e.first_name,
	e.department_id, d.department_id,
    d.department_name
from employees e right outer join departments d
	on e.department_id = d.department_id
    where e.department_id is null;

-- self join : 동일한 테이블을 join
-- ansi
select emp.employee_id,emp.first_name,
	emp.manager_id, mgr.employee_id,
    mgr.first_name
from employees emp join employees mgr
	on emp.manager_id = mgr.employee_id;
-- mysql

select emp.employee_id,emp.first_name,
	emp.manager_id, mgr.employee_id,
    mgr.first_name
from employees emp join employees mgr
where emp.manager_id = mgr.employee_id
	and emp.employee_id =104;
    