use mydb;

-- 문제1) EMPLOYEES Table의 모든 자료를 출력하여라.

select * from employees;

-- 문제2) EMPLOYEES Table의 컬럼들을 모두 출력하라.

DESCRIBE EMPLOYEES;
desc EMPLOYEES;

-- 문제3) EMPLOYEES Table에서 사원 번호, 이름, 급여, 담당업무(job)를 출력하여라.
select employee_id,last_name, salary, job_id
from employees;

-- 문제4) 모든 종업원의 급여를 $300증가 시키기 위해서 덧셈 연산자를 사용하고 결과에 SALARY+300을 디스플레이 합니다.
select salary+300 from employees;

-- 문제5) EMPLOYEES 테이블에서 사원번호, 이름, 급여, 보너스, 보너스 금액을 출력하여라.
-- (참고로 보너스는 월급 + (월급*커미션))
select employee_id, last_name, salary, commission_pct,salary*commission_pct
from employees;

-- 문제6) EMPLOYEES 테이블에서 LAST_NAME을 "이름"으로 SALARY을 "급여"로 출력하여라.
select last_name AS 이름, salary AS 급여
from employees;

-- 문제7) EMPLOYEES 테이블에서 LAST_NAME을 Name으로 SALARY *12 를 Annual Salary(연봉)로 출력하여라

select last_name AS Name, salary*12 AS "Annual Salary"
from employees;

-- 문제8) EMPLOYEES 테이블에서 이름과 업무를 연결하여 출력하여라.
select concat("이름: ",last_name, " 업무 : ", job_id ) as "이름과 업무"
from employees;

-- 문제9) EMPLOYEES 테이블에서 이름과 업무를 "KING is a PRESIDENT" 형식으로 출력하여라.

select concat(last_name, "is a(an)", job_id ) as "이름과 업무"
from employees;

-- 문제10) EMPLOYEES 테이블에서 이름과 연봉을 "KING: 1 Year salary = 60000" 형식으로 출력하여라.
select concat(last_name, ": 1 Year salary = ", salary*12 ) as "이름과 연봉"
from employees;

create table tb_timestamp(
col timestamp);

insert into tb_timestamp(col)
values(now());

insert into tb_timestamp(col)
values('2023-06-17');

select * from tb_timestamp;

SELECT YEAR(col) AS year, MONTH(col) AS month, DAY(col) AS day, HOUR(col) AS hour, MINUTE(col) AS minute, SECOND(col) AS second
FROM tb_timestamp;

select date_format(col, "%Y") as "연도",
	date_format(col,"&c") as "월",
    	date_format(col,"&e") as "일",
	date_format(col,"&k") as "시",
	date_format(col,"&i") as "분",
	date_format(col,"&s") as "초"

from tb_timestamp;