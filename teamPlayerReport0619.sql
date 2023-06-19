-- 1. 운동부 TABLE을 작성하라.
-- TEAM : 팀 아이디, 지역, 팀 명, 개설 날짜, 전화번호, 홈페이지
-- PLAYER : 선수번호, 선수 명, 등록일, 포지션, 키, 팀 아이디

-- TEAM을 두 개만 등록합니다.

-- 두 개의 TEAM에 선수를 각각 3명씩 등록(추가)합니다.

-- 선수를 입력하면 그 선수의 팀 명과 전화번호, 홈페이지가 출력되도록 합니다.

use mydb;
-- 팀 테이블 생성
create table  EX_TEAM(
	team_id int auto_increment primary key, -- 중복되지 않는 값 
	team_region varchar(30),
	team_name varchar(30),
	team_startDate timestamp,
    team_phoneNum  varchar(30) not null,
	team_url varchar(45) not null
);
-- 선수 테이블 생성
create table  EX_PLAYER(
	player_num int auto_increment primary key, -- 중복되지 않는 값 
	player_name varchar(30) not null,
	player_entryDate timestamp,
	player_positon varchar(30),
    height varchar(30),
    team_id int ,
    foreign key( team_id) references EX_TEAM( team_id)
);

-- drop table EX_PLAYER;

-- 팀 2개 입력
insert into EX_TEAM(team_region, team_name, team_startDate, team_phoneNum, team_url)
values('부산', '롯데','1990-01-02','010-5353-5353','http://lotteTeam.com');
insert into EX_TEAM(team_region, team_name, team_startDate, team_phoneNum, team_url)
values('울산', '현대','1990-02-02','010-0520-0520','http://hyundaeTeam.com');

select * from EX_TEAM;
-- 선수 값 입력
insert into EX_PLAYER( player_name, player_entryDate, player_positon, height,team_id)
values('롯데산1호','1990-02-04','투수',190.2, 1);
insert into EX_PLAYER( player_name, player_entryDate, player_positon, height,team_id)
values('롯데산2호','1990-02-05','포수',170.2, 1);
insert into EX_PLAYER( player_name, player_entryDate, player_positon, height,team_id)
values('롯데산3호','1990-02-06','타자',176.2, 1);
insert into EX_PLAYER( player_name, player_entryDate, player_positon, height,team_id)
values('현대산1호','1990-03-04','투수',190.2, 2);
insert into EX_PLAYER( player_name, player_entryDate, player_positon, height,team_id)
values('현대산2호','1990-03-05','포수',170.2, 2);
insert into EX_PLAYER( player_name, player_entryDate, player_positon, height,team_id)
values('현대산3호','1990-03-06','타자',176.2, 2);

-- 선수 검색
select player_name, team_name, team_phoneNum,team_url
from EX_TEAM t , EX_PLAYER p
where t.team_id = p.team_id
	and p.player_name = '롯데산2호';
 
