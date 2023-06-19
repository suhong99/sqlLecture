use mydb;

/*
	Table  : column, row로 이루어져 있다.
			data를 담을 수 있는 틀이다.alter
		
	date 형 
		string 	: var char (byte)
        int		: decimal( 자리수)
        float	: decimal(자리수, 소수점자리)
        date	: date. timestamp
	
    object(table, view) : create, drop , alter (수정)
    data : insert, delete, select, update
*/

select * from tb_test;

insert into tb_test(number, name, address,birth)
values(1,'홍길동', '부산시', '2002-10-12');

delete from tb_test   -- delete , update  
where number =1 ;

set SQL_SAFE_UPDATES =0; -- workbanch 에서 기본으로 설정되어 있는 옵tb_timestamptb_timestamp션

create table tb_test (
	num int,
    name varchar(30),
    address varchar(45),
    birth timestamp
);

create table tb_test1 (
	userid int,
    username varchar(30),
    height decimal(3,1)  -- float 써도 됨
);

drop table tb_test;
drop table tb_test1;

-- table copy  : 데이터포함
create table tb_job
as 
select *
from jobs;

select * from tb_job;

update tb_job
set max_salary = 10000			-- 변경해줄 값
where job_id = 'AC_ACCOUNT';	-- 조건


drop table tb_job;

-- 원하는 데로 (as) , 원하는 갯수 선택 가능

create table tb_job
as 
select job_id as id, job_title as title, max_salary as maxsal
from jobs;

drop table tb_job;

-- table copy : 데이터 미포함
create table if not exists tb_job
like jobs;

select * from tb_job;

create table tb_job
as 
select *
from jobs
where 1=2;

insert into tb_job(job_id, job_title, min_salary, max_salary)
values('IT_PROG','프로그래머',20000,30000);

insert into tb_job
values('ACCOUNT', '가입부', 7000,14000);

insert into tb_job(job_title,job_id, max_salary, min_salary)
values('프로그래머','IT_PROG',50000,20000);

-- 문자열로 집어넣으면 들어가짐, 숫자를 문자에 넣는건 타언어에선 안됨.
insert into tb_job(job_title,job_id, max_salary, min_salary)
values('프로그래머','IT_PROG',50000,'40000');

create table tb_job
select job_id as id, job_title as title
from jobs;

select * from tb_job;

-- 수정 alter
-- 테이블명 수정 
alter table tb_job
rename to tb_newjob;

-- 컬럼의 추가
alter table tb_newjob
add  
maxsal int;

alter table tb_newjob
add
(newcol1 decimal(3,1), newcol2 varchar(30));

alter table tb_newjob
modify
newcol2 date;

-- column 삭제
alter table tb_newjob
drop
column newcol1;

-- sequence : 자도응로 값을 증가 +1
create table tb_test(
 seq int auto_increment primary key, -- 중복되지 않는 값 
 -- auto 시작 숫자 정하는법 검색해보기
 name varchar (30),
 height float
);

insert into tb_test(name,height)
values('홍길동', 172.1);

select * from tb_test;

insert into tb_test(name, height)
values('성춘향', 157.3);