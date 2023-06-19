use mydb;

/*
	무결성 : constraint
			column 지정하는 성질(값을 넣을 때 규칙)
		
	primary key(PK) : 기본키. null(빈칸)을 허용하지 않는다. 중복을 허용하지 않음 - id 주민번호
	unique key (UK)	: 고유키. null 허용                 중복을 허용하지 않음 - email
    foreign key(FK) : 외래키. null 허용				 join을 하기 위해 사용
					외래키로 지정된 컬럼의 경우, 연결된 테이블(부모)의 기본키(고유키)인 경우가 대부분
    check 			: 설정된 값(지정값, 범위)만을 사용할 수 있따. null 허용
	not null		: null(빈칸)을 허용하지 않는다.
*/

-- not null
create table tb_test(
	name varchar(30) not null,
    height float
);
drop table tb_test;

insert into tb_test(name,height)
values('홍길동', 172.1);

insert into tb_test(height) -- 무결성 에러
values(123.2);
insert into tb_test(name)
values('성춘향');

select * from tb_test;

-- 무결성까지 모두 삭제 (if exists)
drop table if exists tb_test;

-- check

create table tb_check(
	name varchar(30),
    fruit varchar(20),
	numcount int,
    constraint check_1 check(fruit in('apple','pear','banana')),	-- 선택
	constraint check_2 check(numcount > 0 and numcount <= 10)   	-- 범위
);

insert into tb_check(name, fruit, numcount)
values ('홍길동', 'pear',7);

insert into tb_check(name,  numcount)
values ('성범죄자', 7);

insert into tb_check(name,  fruit)
values ('일기토', 'banana');

insert into tb_check(name,  fruit,numcount) -- grape가 선택에 없어서 에러
values  ('일기토', 'grape',8);
 
 insert into tb_check(name, fruit, numcount) -- 범위 벗어남
values ('홍길동', 'pear',11);

-- primary key 중복 X + not null
create table tb_primaryKey(
	id varchar(20) primary key,
    name varchar(30)  			-- 컬럼명 size 사용 안됨.
);

insert into tb_primaryKey(id,name)
values('AAA','홍길시');

insert into tb_primaryKey(id,name)
values('BB','홍길시');

insert into tb_primaryKey(name)  -- 에러 null이면 안됨
values('홍길시');

insert into tb_primaryKey(id,name) -- 빈값 넣으면 안된다. 하지만 '' 이랑 다름
values('','홍길시');

drop table if exists tb_test;
drop table if exists tb_primaryKey;

create table tb_test(
	id varchar(20),
    name varchar(30),
    primary key(id)
);

create table tb_primaryKey(  -- 에러
	id varchar(20) primary key,
    name varchar(30)  primary key			-- 프라이머리 키는 하나여야 해서 에러뜸
);

create table tb_primaryKey(  
	id varchar(20) ,
    name varchar(30),
    primary key(id,name) 			--  한꺼번에 설정은 가능
);

drop table if exists tb_primaryKey;

create table tb_primaryKey(
	id varchar(20),
    name varchar(30)
);

-- 기본키 추가
alter table tb_primaryKey
add primary key(id);

-- 기본키 삭제  -- NN 은 남아있음
alter table tb_primarykey
drop primary key;


-- unique : 고유키 . nul 가능 . 중복 안됨
create table tb_test(
	email varchar(30) unique,
    name varchar(30)
);

insert into tb_test(email, name)
values('abc@naver.com', '홍길주');

insert into tb_test( name)
values( '홍눌이');

/*
	foriegn key : 테이블간에 연결(join)
					왜래키 컬럼의 경우, 외부테이블에서 기본키 또는 고유키만 된다.
*/

--  employees - emp
-- departments - dept

-- 부모테이블 - dept

create table dept(
	department_id int primary key,
    department_name varchar(20),
    location_id int
);


insert into dept(department_id,department_name, location_id)
values(10,'기획부', 1000);
insert into dept(department_id,department_name, location_id)
values(20,'개발부', 1100);
insert into dept(department_id,department_name, location_id)
values(30,'마케팅부', 1200);

-- 자식 테이블 empt
create table emp(
	employee_id int primary key,
    first_name varchar(30) not null,
    department_id int,  -- 아래 foreign 아래 있는거
    foreign key(department_id) references dept(department_id)
);

insert into emp(employee_id, first_name,department_id)
values(1,'홍길동',10);

insert into emp(employee_id, first_name,department_id)
values(2,'성춘향',40); -- 40은 없는 값음 외래키값인데 40은 parent에 존재하지 않음

insert into emp(employee_id, first_name,department_id)
values(2,'성춘향',30); -- 40은 없는 값음 외래키값인데 40은 parent에 존재하지 않음

drop table if exists dept;
drop table if exists emp;

select e.employee_id , e.first_name,
	e.department_id, d.department_name,d.location_id
from emp e, dept d
where e.department_id = d.department_id
