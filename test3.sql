use mydb;

/*
		select 절 -> 검색
        형식 : select (값, 컬럼명, 함수, sub query)
        from (테이블명, sub query)
*/

select 1 from dual; -- dual  임시테이블  : 값만 확인할 수 있는 가상 테이블

select '한글' from dual;

select 12.3 from dual;

desc employees;  -- 테이블의 사양  // 마이너를 뺸 인트

/*
	employee_id : 사원번호
    first_name : 이름
    last_name : 성
    email : 이메일
    phone_number : 전화번호
    hire_date : 입사일
    job_ id : 업무아이디
    slary : 급여
    commission_pct : 보너스퍼센트
    manager_id : 상사이이디(사원번호)
*/

select *
from employees;

select *
from departments;

SELECT 
    employee_id, last_name, hire_date
FROM
    employees;



-- 컬럼의 별명( alias)
select employee_id AS 사원번호, first_name as "이름" , salary "월급"  -- AS의 경우 띄워쓰기 안됨 하고 싶으면 AS "사원 번호" 
from employees;

-- 산수영ㄴ산자 (+,-,*,/)
select first_name, salary * 12 as "연봉"
from employees;
-- 문자열 합치기 "hello" + "world"  concat("hello","world")
select concat('이름:', first_name, ' 월급: ' ,salary)
from employees;