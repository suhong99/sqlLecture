use mydb;
-- 문제1) EMPLOYEES 테이블에서 부서별로 인원수,평균 급여,급여의 합,최소 급여,최대 급여를 포함하는
-- EMP_DEPTNO 테이블을 생성하라.
create table EMP_DEPTNO
as
select department_id as 부서, count(department_id) as 인원수, round(avg(salary)) as 평균급여,
	sum(salary) as 급여합, min(salary) as 최소급여, max(salary) as 최대급여
from employees
group by department_id;
-- round 안할 경우 경고문 뜸
select * from EMP_DEPTNO;
drop table EMP_DEPTNO;
-- 문제2) EMP_DEPTNO 테이블에 ETC COLUMN을 추가하라.
-- 단 자료형은 VARCHAR2(50) 사용하라.
alter table EMP_DEPTNO
add  ETC  varchar(50);

-- 문제3) EMP_DEPTNO 테이블에 ETC COLUMN을 수정하라. -- 수정은 modify
-- 자료 형은 VARCHAR2(15)로 하라.
alter table EMP_DEPTNO
modify
ETC varchar(15);

-- 문제4) EMP_DEPTNO 테이블에 있는 ETC 을 삭제하고 확인하라. -- drop
alter table EMP_DEPTNO
drop column ETC;
select * from EMP_DEPTNO;

alter table emp_deptno
drop etc;

-- 문제5) 위에 생성한 EMP_DEPTNO 테이블의 이름을 EMP_DEPT로 변경하라. -- rename to
alter table EMP_DEPTNO
rename to EMP_DEPT;


-- 문제6) EMP_DEPT 테이블을 삭제하라.
drop table EMP_DEPT;

-- 문제7) EMPLOYEES 테이블을 EMP 테이블을 생성하고 복제하도록 하라.
-- (데이터 포함)
-- "사원번호", "이름", "월급", "부서번호", "부서명", "부서월급순위"
create table EMP
as
select employee_id as 사원번호, last_name as 이름,  salary as 월급, 
e.department_id as 부서번호, d.department_name as 부서명,
-- rank() over (partition by e.department_id order by salary desc) as 부서월급순위
count(*) over (partition by e.department_id order by salary  desc) as 부서월급순위
from employees e, departments d
where e.department_id = d.department_id	;

select * from emp;
drop table EMP;

-- 문제8) EMP 테이블에 row를 추가해 봅니다.
-- 다만, 반드시 데이터를 기입을 안해도 되면, NULL로 설정하도록 한다.
-- "사원번호", "이름", "월급", "부서번호", "부서명", "부서월급순위"

insert into emp(사원번호,이름,월급,부서명, 부서월급순위)
values(2000,'김수홍',3800,'FrontEnd',1);

-- 문제9) EMPLOYEES 테이블에서 EMPNO,ENAME,SAL,HIREDATE, DEPARTMENT_ID의 COLUMN만 선택하여
-- EMP_10 테이블을 생성(데이터 미포함)합시다.
CREATE TABLE EMP_10 AS
select employee_id as EMPNO,first_name as ENAME,salary as SAL,hire_date as HIREDATE,department_id as DEPARTMENT_ID
from employees
where 1=0; -- 항상 틀린 조건

select * from EMP_10;
drop table Emp_10;
-- 문제10) 50번 부서만 선택하여 이에 대응하는 값을 EMP_10테이블에 추가하라.

insert into EMP_10 (EMPNO, ENAME, SAL, HIREDATE, DEPARTMENT_ID )
select employee_id, first_name, salary,hire_date,department_id
from employees
where department_id=50;