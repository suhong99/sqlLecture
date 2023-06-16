use mydb;


/*
		sub query : query 안에 query
					한개의행(row)에서 결과가 반환되는 query
		
        select 한개 row, 한개 column
        from   다중  row , 다중 column
        where	다중 row , 다중 column
*/


select employee_id
from employees
where employee_id = 100;

-- 되는경우
select employee_id, (select first_name from employees where employee_id=100) 
from employees;


-- select				comlum -1개 row 107개
select employee_id, (select first_name from employees)  -- 실행이 안됨
from employees;


-- column이 2개여서 안됨
select employee_id, (select first_name, salary from employees where employee_id=100) 
from employees;

-- group 함수와 같이 써서 에러 남
select employee_id, sum(salary)
from employees;

select employee_id, first_name,
(select sum(salary) from employees) as "합계",
(select avg(salary) from employees) as "평균"
from employees;

select department_id, employee_id, first_name,
(select avg(salary) from employees) as "평균"
	from employees
    where department_id =30;
    
-- from
-- 50 부서에서의 급여가5000이 넘는 사원
select department_id, employee_id , salary
from employees
where department_id = 50
	and salary > 5000;

select department_id, employee_id, salary
from (select department_id, employee_id, salary
from employees
where department_id =50) e  -- mysql에서는 sub query에 alias를 적어야함
where salary >5000;

-- 업무별로 급여의 합계 , 인원수, 사원명 , 월급

select job_id, sum(salary), count(employee_id), first_name, salary -- salary때문에 안됨
from employees
group by job_id;

select e.employee_id, e.first_name, e.salary,j.job_id, j.salsum, j.salcount
from employees e , (select job_id, sum(salary) as salsum, count(employee_id)  as salcount
					from employees 
                    group by job_id) j;

select  employee_id, first_name, hire_date, salary
from (select employee_id, first_name, hire_date, salary
		from employees
		where department_id =50) e;
        
select  empno, name, hire , sal
from (select employee_id as empno, first_name as name, hire_date as hire, salary as sal
		from employees
		where department_id =50) e;
        
        
-- where
-- 평균급여보다 많이 받는 사원
select employee_id, first_name, salary 
from employees
where salary > (select avg(salary) 
				from employees );
                

-- 부서가 90인 사원의 업무
select department_id, first_name, job_id
from employees
where department_id = 90;

select department_id, first_name, job_id
from employees
where job_id in(select  job_id
						from employees
                        where department_id= 90
						);
                        
                        
-- 부서별로 가장 급여가 적게 받는 사원과 같은 급여를 받는 사원

select department_id, first_name , salary
from employees 
where salary in (select min(salary) from employees
				group by department_id);

-- 부서별로 가장 급여가 적게받는 사원
select department_id, first_name , salary
from employees 
where (department_id,salary) in (select department_id, min(salary) from employees
				group by department_id 
				having min(salary)<6000);
                
                
                
-- 특수 query cass when == switch
select employee_id , first_name, phone_number, 
	case  substr(phone_number,1,3) 
		when '515' then '뉴욕'
        when '590' then '워싱턴'
        when '650' then '보스톤'
        else '기타지역'
	end as 지역
from employees;

/*
	over ()
		group by 를 보강하기 위해서 나온 함수
        select절에서만 사용
*/
select department_id, count(*), first_name --  묶으니 다시 에러
from employees
group by department_id;

select department_id, count(*)over(), first_name
from employees;

-- partition by = select 절 안의 group by
-- over() 안에서만 사용
select department_id, first_name, salary,
	count(*)over(partition by department_id),
	avg(salary)over(partition by department_id)
from employees;

/*
		순위함수
        rank() 1 2 3 3 5 6
        dense_rank()	 1 2 3 3 4 5
        row_number() 	1 2 3 4 5 6
        
*/

select employee_id , first_name, salary,
	rank()over(order by salary desc)  as "rank", -- 이때 조건을 over로 넣음
    dense_rank()over(order by salary desc) as "dense_rank",
	row_number()over(order by salary desc) as "row_number"

from employees;

select *
from employees
where employee_id >= 100 and employee_id <110;

select first_name , salary
from employees
where employee_id >= 100 and employee_id <110;

-- 에러 뜸
select row_number()over(order by salary desc) as rnum, first_name, salary
from employees
where rnum <=10
order by salary desc ;

select rnum, first_name, salary
from (select row_number()over(order by salary desc) as rnum, first_name, salary
from employees order by salary desc ) e
where rnum between 6 and 10;

-- limit : 시작위치 ( 0~ ) , 갯수
select first_name, salary
from employees
order by salary desc
limit 5, 5;
