
SELECT * FROM mydb.employees;


--  한줄 주석문
/*
	 범위 주석문
*/

/*
	SQL : Structured Query Language
		 구조적			질의어
         
	CRUD
    insert delete select update
    
    table create 	테이블 생성, 변경, 삭제
    constraint 		컬럼의 속성 - 무결성
    
    Employess 		: 	(회)사원
    departmesnts	:	부서
    jobs			:	업무
    locations 		:	지역

*/

select * from employees;  -- 대소문자 구분 안됨

/*
			자료형  
            java	vs		MySql
            
            int				int, decimal(5자리)
            double			double, decimal(5,1) 총 개 자리중 소숫점 첫 번쨰까지
            String 			var 	char
            Date			date
            
*/


-- table
-- column(항목) , row(n개의 데이터)

/*
	create table 테이블명(
		컬럼명1 자료형, 			ex) name String;    (cf : 자바에서는 자료형 변수)
        컬렴명2 자료형
    )
*/


-- varchar == String  -> (영문자 1byte , 한글:  3byte)
create table tb_varchar(
	name varchar(10), -- 10byte varchar
    memo varchar(20)
);

insert into tb_varchar(name,memo)
values('홍길동', '친구');

select * from tb_varchar;

-- int , double

CREATE TABLE tb_decimal (
    num DECIMAL,
    math DECIMAL(5),
    height DECIMAL(5 , 2 )
);

insert into tb_decimal(num,math,height)
values(1234.4678,12345.12, 123,456);  -- 반올림되서 올락ㅁ

select * from tb_decimal;

create table tb_int_double(
	num int,
    height double
);

insert into tb_int_double(num, height)
values(123456.1234,123456.1234);

select * from tb_int_double;

-- 날짜
create table tb_date(
	col1 date,
    col2 date
);

-- 현재 날짜는 추가
insert into tb_date(col1,col2)
values('2023-6-13', now()-1);  -- 문자열로 데이트 집어넣는 법 -- 연산은 안됨 에러는 안떠도,, now()와 now() -1 같게 나옴
select * from tb_date;

create table board(
	col1 timestamp,
    col2 timestamp default now()
);

insert into board(col1, col2)
-- values(now(), default);-- 
-- values(now(), '2023-06-25');-- -- 
values(now(), '2023-06-25 12:32:25');-- 

select * from board;

drop table tb_varchar;
drop table tb_date;