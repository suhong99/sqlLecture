

use mydb;

 -- ------------------------------------------------------------------------- 
 -- ------------------------------------------------------------------------- 

 -- ------------------------------------------------------------------------- 

-- 2. 온라인 마켓 TABLE을 작성하라.

-- PRODUCT(상품) : 상품번호, 상품명, 상품가격, 상품설명
-- CONSUMER(소비자) : 소비자 ID, 이름, 나이
-- CART(장바구니) : 장바구니 번호, 소비자 ID, 상품번호, 수량

-- 상품 테이블에 상품을 등록합니다(개수는 원하는 데로).
-- 소비자를 등록합니다.
-- 소비자가 쇼핑한 상품을 추가합니다.
-- 쇼핑한 상품을 출력합니다.


-- ##상품 생성과 등록
create table OM_PRODUCT(
		product_num int auto_increment primary key, -- 중복되지 않는 값 
		product_name varchar(30) not null,
        price int not null,
        product_desc varchar(45)
);

insert into OM_PRODUCT(product_name, price, product_desc) -- 1
values('새우깡', 2000,'손이가요손이가');
insert into OM_PRODUCT(product_name, price, product_desc) -- 2
values('엄마손파이', 3000,'그손이바로엄마손');
insert into OM_PRODUCT(product_name, price, product_desc) -- 3
values('위생장갑', 2000,'엄마가쓴바로그장갑');
insert into OM_PRODUCT(product_name, price, product_desc) -- 4
values('비누', 2000,'그래도손은행궈야겠지?');


-- ##소비자 생성과 등록
create table OM_CONSUMER(
		consumer_id int auto_increment primary key, -- 중복되지 않는 값 
		consumer_name varchar(30) not null,
		age int 
);

insert into OM_CONSUMER( consumer_name, age) -- 1
values( '마미손',24);
insert into OM_CONSUMER( consumer_name, age) -- 2
values( '아이유',31);
insert into OM_CONSUMER( consumer_name, age) -- 3
values( '홍승채',40);
insert into OM_CONSUMER( consumer_name, age) -- 4
values( '구씨',40);

-- ##카트 생성과 등록
-- CART(장바구니) : 장바구니 번호, 소비자 ID, 상품번호, 수량

create table  OM_CART(
	cart_num int auto_increment primary key, -- 중복되지 않는 값 
	count int,
	-- 외래키
	consumer_id int,
	product_num int,    
	foreign key( product_num) references OM_PRODUCT(product_num ),
    foreign key( consumer_id) references OM_CONSUMER( consumer_id)
);

-- 카트 구매 내역
-- 마미손은 새우,엄마,장갑,비누 3355개

insert into OM_CART(product_num,consumer_id,count)
values(1,1,3);
insert into OM_CART(product_num,consumer_id,count)
values(2,1,3);
insert into OM_CART(product_num,consumer_id,count)
values(3,1,5);
insert into OM_CART(product_num,consumer_id,count)
values(4,1,5);

-- 아이유는 새우,엄마,장갑,비누 8282개
insert into OM_CART(product_num,consumer_id,count)
values(1,2,8);
insert into OM_CART(product_num,consumer_id,count)
values(2,2,2);
insert into OM_CART(product_num,consumer_id,count)
values(3,2,8);
insert into OM_CART(product_num,consumer_id,count)
values(4,2,2);

-- 홍승채는 새우깡 엄마손
insert into OM_CART(product_num,consumer_id,count)
values(1,3,1);
insert into OM_CART(product_num,consumer_id,count)
values(2,3,1);

-- 검색하기

select co.consumer_name, pr.product_name, ca.count
from OM_PRODUCT pr , OM_CONSUMER co , OM_CART ca
where pr.product_num = ca.product_num
	and co.consumer_id = ca.consumer_id
	and co.consumer_id = 2; 
