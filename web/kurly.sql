CREATE
DATABASE kurly;

USE
kurly;

CREATE TABLE customer
(
    id       VARCHAR(50)  NOT NULL,
    pw       VARCHAR(16)  NOT NULL,
    name     VARCHAR(10)  NOT NULL,
    reg_date VARCHAR(50)  NOT NULL,
    tel      VARCHAR(20)  NOT NULL,
    postcode INT(10) NOT NULL,
    address  VARCHAR(100) NOT NULL,
    email    VARCHAR(20)  NOT NULL
);

CREATE TABLE item
(
    item_number   int(50),
    item_category VARCHAR(20),
    item_name     VARCHAR(16),
    item_price    int(50),
    item_stock    int(50),
    item_image    VARCHAR(10),
    item_info     VARCHAR(100),
    discount_rate int(50),
    reg_date      VARCHAR(50),
    sold          int(50)
);

CREATE TABLE cart
(
    cart_number int(50),
    buyer       VARCHAR(50),
    item_name   VARCHAR(16),
    buy_price   int(50),
    buy_count   int(50),
    item_image  VARCHAR(50)
);

CREATE TABLE buy
(
    customer_id   VARCHAR(50),
    customer_name VARCHAR(50),
    cart_number   int(50),
    item_name     VARCHAR(50),
    buy_price     int(50),
    buy_count     int(50),
    item_image    VARCHAR(50),
    buy_date      VARCHAR(50),
    howpay        VARCHAR(50),
    address       VARCHAR(100)
);

    CREATE table manager
    (
        id   varchar(50),
        pw   varchar(50),
        name varchar(50)
    );

create table board
(
    num       int(10),
    writer    varchar(20),
    title     varchar(50),
    pw        varchar(20),
    reg_date  date,
    ref       int(10),
    re_step   int(10),
    re_level  int(10),
    readcount int(10),
    content   varchar(100),
    status    varchar(30)
);

---------------------------------------------------------------------------
-- manager 테이블
insert into manager
values ('admin', 'admin', '관리자');

-- customer 테이블
insert into customer
values ('junlee', '1234', '이준규', '2021-02-11', '01027516903', 16944, '용인시 수지', 'junlee0620@naver.com');
insert into customer
values ('qwer', '1234', '이중구', '2020-02-13', '01033334444', 18527, '서울 강남', 'qwer@naver.com');
insert into item

-- item 테이블
values (1, 'vegetable', '대파', 1200, 3, '1.jpg', '대파입니다', 0, now(), 10);
insert into item
values (2, 'vegetable', '상추', 2000, 4, '2.jpg', '상추입니다', 10, now(), 0);
insert into item
values (3, 'vegetable', '당근', 2500, 8, '3.jpg', '당근입니다', 10, now(), 0);
insert into item
values (4, 'vegetable', '깻잎', 1200, 0, '4.jpg', '깻잎입니다', 0, now(), 0);
insert into item
values (5, 'vegetable', '애호박', 1000, 5, '5.jpg', '애호박입니다', 0, now(), 0);
insert into item
values (6, 'vegetable', '버섯', 1500, 4, '6.jpg', '버섯입니다', 20, now(), 0);
insert into item
values (7, 'vegetable', '단호박', 3000, 7, '7.jpg', '단호박입니다', 10, now(), 0);
insert into item
values (8, 'vegetable', '파프리카', 3000, 6, '8.jpg', '파프리카입니다', 10, now(), 0);
insert into item
values (9, 'vegetable', '아스파라거스', 3000, 10, '9.jpg', '아스파라거스입니다', 0, now(), 0);
insert into item
values (10, 'vegetable', '양파', 2000, 11, '10.jpg', '양파입니다', 0, now(), 0);
insert into item
values (11, 'fish', '자반고등어', 5000, 20, '11.jpg', '고등어입니다', 0, now(), 4);
insert into item
values (12, 'fish', '연어', 14000, 40, '12.jpg', '노르웨이산 연어입니다', 0, now(), 0);
insert into item
values (13, 'fish', '오징어', 5000, 10, '13.jpg', '오징어입니다', 10, now(), 0);
insert into item
values (14, 'fish', '바지락', 7000, 0, '14.jpg', '바지락입니다', 0, now(), 0);
insert into item
values (15, 'fish', '새우', 10000, 1, '15.jpg', '새우입니다', 10, now(), 0);
insert into item
values (16, 'fish', '전복', 20000, 5, '16.jpg', '전복입니다', 0, now(), 0);
insert into item
values (17, 'meat', '막창', 20000, 5, '17.jpg', '막창입니다', 0, now(), 0);
insert into item
values (18, 'meat', '안심스테이크', 18000, 0, '18.jpg', '안심스테이크입니다', 0, now(), 0);
insert into item
values (19, 'meat', '닭', 12000, 4, '19.jpg', '닭입니다', 20, now(), 0);
insert into item
values (20, 'meat', '닭다리', 10000, 7, '20.jpg', '닭다리입니다', 0, now(), 8);
insert into item
values (21, 'meat', '폭립', 20000, 10, '21.jpg', '폭립니다', 10, now(), 0);
insert into item
values (22, 'meat', '양념갈비', 25000, 20, '22.jpg', '양념갈비입니다', 30, now(), 0);
insert into item
values (23, 'meat', '등갈비구이', 20000, 0, '23.jpg', '등갈비구이입니다', 0, now(), 5);
insert into item
values (24, 'meat', '치즈돈가스', 13000, 1, '24.jpg', '치즈돈가스입니다', 0, now(), 50);
insert into item
values (25, 'meat', '닭가슴살', 5000, 4, '25.jpg', '닭가슴살입니다', 0, now(), 0);
insert into item
values (26, 'meat', '차돌박이', 20000, 3, '26.jpg', '차돌박이입니다', 10, now(), 10);
insert into item
values (27, 'electronic', '그라인더', 28000, 3, '27.jpg', '그라인더입니다', 10, now(), 0);
insert into item
values (28, 'electronic', '스팀다리미', 30000, 3, '28.jpg', '스팀다리미입니다', 10, now(), 0);
insert into item
values (29, 'electronic', '헤어드라이기', 25000, 3, '29.jpg', '헤어드라이기입니다', 10, now(), 0);
insert into item
values (30, 'electronic', '체중계', 19000, 3, '30.jpg', '체중계입니다', 10, now(), 0);
insert into item
values (31, 'electronic', '전자체중계', 22000, 3, '31.jpg', '전자체중계입니다', 10, now(), 0);
insert into item
values (32, 'electronic', '미니선풍기', 16000, 0, '32.jpg', '미니선풍기입니다', 10, now(), 0);
insert into item
values (33, 'electronic', '청소기', 40000, 3, '33.jpg', '청소기입니다', 10, now(), 0);
insert into item
values (34, 'electronic', '카메라', 50000, 3, '34.jpg', '카메라입니다', 10, now(), 0);
insert into item
values (35, 'electronic', '믹서기', 3800, 3, '35.jpg', '믹서기입니다', 10, now(), 7);


select *
from item;
select *
from customer;







