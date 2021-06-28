# SAGOBOJA SHOPPING MALL - Team Project

## 개요
+ 4개월동안 배운 것을 토대로 팀원과 함께 프로젝트 진행
+ 일반사용자는 상품을 조회 및 수량 조정하여 장바구니에 담기 기능
+ 관리자는 기획전/레시피 조회, 추가, 수정, 삭제 기능
+ 레시피에서 해당하는 상품목록을 한 번에 장바구니에 담는 기능
+ 기획전의 마감 시간을 초단위로 출력하는 기능

<hr/>

## 개발환경 (Development Environment)
+ eclieps 
+ ORACLE DB
+ Apache Tomcat 10

## 개발언어 (Programming Language)
+ Java
+ Jsp
+ JavaScript
+ HTML
+ CSS

## 프레임워크 및 라이브러리 (Framework & Library)
+ Bootstrap 4.5.2

<hr/>

## 데이터베이스 & 사용자 생성 (Creating Database & User)
```sql
sqlplus "/as sysdba"
create user sb identified by zxcv1234;
grant connect, resource, dba to sb
```

## 테이블 생성(Creating Table)
```sql
[이벤트,레시피 테이블]

CREATE SEQUENCE EVENT_SEQ NOCACHE;
CREATE SEQUENCE RECIPE_SEQ NOCACHE;

create table sb_events (
   event_no number(7) constraint event_no_pk primary key,
   event_title varchar2(255) constraint event_title_nn not null,
   event_content varchar2(2000),
    event_file_name varchar2(255) constraint event_file_nn not null,
   event_start_date date,
   event_end_date date constraint event_end_date_nn not null,
   event_created_date date default sysdate,
   constraint event_end_date_ck check ((event_end_date>event_start_date) and (event_end_date>event_created_date))
);

create table sb_recipes (
   recipe_no number(7) constraint recipe_no_pk primary key,
   recipe_title varchar2(255) constraint recipe_title_nn not null,
    recipe_ingredient clob,
   recipe_content clob,
    recipe_file_name varchar2(255) constraint recipe_file_nn not null,
   recipe_created_date date default sysdate);

create table sb_event_items(
    event_no number(7,0) not null,
    product_no number(7,0) not null,
   constraint event_items_uk unique (event_no, product_no));

create table sb_recipe_items(
   recipe_no number(7,0) not null,
   product_no number(7,0) not null,
   constraint recipe_items_uk unique (recipe_no, product_no));
```

```sql
[유저 테이블]
create table SB_USERS (
    USER_ID VARCHAR2(20) CONSTRAINT ID_PK PRIMARY KEY,
    USER_PWD CHAR(64) NOT NULL,
    USER_NAME VARCHAR2(255) NOT NULL,
    USER_PHONE VARCHAR2(20),
    USER_EMAIL VARCHAR2(255) NOT NULL,
    USER_ADDRESS VARCHAR2(255),
    USER_ROLE_TYPE VARCHAR2(20) DEFAULT 'USER',
    USER_STATUS VARCHAR2(20) DEFAULT 'N',
    USER_CREATED_DATE DATE DEFAULT SYSDATE,
    USER_EXPIRED_DATE DATE
);
```

```sql
[상품테이블]

CREATE TABLE SB_PRODUCTS
(
   PRODUCT_NO number(7,0) NOT NULL,
   PRODUCT_NAME varchar2(255) NOT NULL,
   PRODUCT_PRICE number(7,0) NOT NULL,
   PRODUCT_STOCK number(7,0) NOT NULL,
   CATEGORY_NO number(7,0) NOT NULL,
   PRODUCT_TYPE varchar2(255) DEFAULT '상품상세정보 참고' NOT NULL,
   PRODUCT_PRODUCER varchar2(255) DEFAULT '상품상세정보 참고' NOT NULL,
   PRODUCT_LOCATION varchar2(255) DEFAULT '상품상세정보 참고' NOT NULL,
   PRODUCT_MFD date DEFAULT '2020/05/01',
   PRODUCT_EXP date DEFAULT '2022/08/01',
   PRODUCT_CS_NUM varchar2(20) DEFAULT '070-0000-0000' NOT NULL,
   PRODUCT_CREATED_DATE date DEFAULT sysdate NOT NULL,
   PRIMARY KEY (PRODUCT_NO)
);

alter table SB_PRODUCTS add constraint PROD_PRICE_CHK CHECK (PRODUCT_PRICE>=0);
alter table SB_PRODUCTS add constraint PROD_STOCK_CHK CHECK (PRODUCT_STOCK>=0);
```

```sql
[카테고리 테이블]

CREATE TABLE SB_CATEGORY
(
	CATEGORY_NO number(7,0) NOT NULL,
	CATEGORY_NAME varchar2(255) NOT NULL,
	PRIMARY KEY (CATEGORY_NO)
);

create sequence category_seq start with 1 nocache;

INSERT INTO sb_category(category_no, category_name) VALUES (category_seq.nextval, '농수축산');
INSERT INTO sb_category(category_no, category_name) VALUES (category_seq.nextval, '가공식품');
INSERT INTO sb_category(category_no, category_name) VALUES (category_seq.nextval, '주방조리용품');
INSERT INTO sb_category(category_no, category_name) VALUES (category_seq.nextval, '생활용품');
INSERT INTO sb_category(category_no, category_name) VALUES (category_seq.nextval, '대용량/박스상품');
```

```sql
[리뷰 테이블]

CREATE TABLE SB_REVIEWS 
(
  REVIEW_NO NUMBER(7, 0) NOT NULL 
, REVIEW_RATING NUMBER(1, 0) 
, REVIEW_CONTENT VARCHAR2(1000 BYTE) 
, PRODUCT_NO NUMBER(7, 0) NOT NULL 
, USER_ID VARCHAR2(20 BYTE) NOT NULL 
, REVIEW_CREATED_DATE DATE DEFAULT sysdate 
, CONSTRAINT SYS_C007317 PRIMARY KEY 
  (
    REVIEW_NO 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX SYS_C007317 ON SB_REVIEWS (REVIEW_NO ASC) 
      LOGGING 
      TABLESPACE SYSTEM 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        FREELISTS 1 
        FREELIST GROUPS 1 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL;

create sequence review_seq nocache;
```

```sql
[장바구니/주문 테이블]

create table SB_CART(
    CART_ITEM_NO NUMBER(7) CONSTRAINT CARTITEMS_NO_PK PRIMARY KEY ,
    CART_ITEM_AMOUNT NUMBER(3) DEFAULT 1,
    USER_ID VARCHAR2(20) NOT NULL,
    PRODUCT_NO NUMBER(7) NOT NULL,
    ITEM_CREATED_DATE DATE DEFAULT SYSDATE,
    
    CONSTRAINT CARTITEMS_AMOUNT_CK CHECK (CART_ITEM_AMOUNT >= 1)
);

--------------------------------------------------------
--  DDL for Table SB_ORDERS
--------------------------------------------------------

  CREATE TABLE "SB"."SB_ORDERS" 
   (   "ORDER_NO" NUMBER(8,0), 
   "USER_ID" VARCHAR2(20 BYTE), 
   "PRODUCT_NO" NUMBER(7,0), 
   "ORDER_STATUS" VARCHAR2(50 BYTE) DEFAULT '결재완료', 
   "ORDER_TOTAL_PRICE" NUMBER(8,0), 
   "ORDER_CREATED_DATE" DATE DEFAULT sysdate, 
   "ORDER_ITEM_AMOUNT" NUMBER(3,0) DEFAULT 1, 
   "CART_ITEM_NO" NUMBER(8,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index ORDERS_NO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SB"."ORDERS_NO_PK" ON "SB"."SB_ORDERS" ("ORDER_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table SB_ORDERS
--------------------------------------------------------

  ALTER TABLE "SB"."SB_ORDERS" MODIFY ("CART_ITEM_NO" NOT NULL ENABLE);
  ALTER TABLE "SB"."SB_ORDERS" ADD CONSTRAINT "ORDERS_NO_PK" PRIMARY KEY ("ORDER_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SB"."SB_ORDERS" MODIFY ("PRODUCT_NO" NOT NULL ENABLE);
  ALTER TABLE "SB"."SB_ORDERS" MODIFY ("ORDER_NO" NOT NULL ENABLE);
  ALTER TABLE "SB"."SB_ORDERS" MODIFY ("ORDER_ITEM_AMOUNT" NOT NULL ENABLE);

NOCYCLE;
orderlist_seq
create sequence orderlist_seq
start with 1
increment by 1;

NOCYCLE;
orderlist_seq
create sequence cartitem_seq
start with 1
increment by 1;
```

<hr/>

## jspblog 패키지 (Pakage)
![image](https://user-images.githubusercontent.com/78708523/107164592-1a0d9800-69f3-11eb-8d41-d3ddfb45648d.png)
![image](https://user-images.githubusercontent.com/78708523/107164641-475a4600-69f3-11eb-8818-40a1561fc376.png)

<hr/>

## jspblog 데이터베이스 모델링 (ERD)
![image](https://user-images.githubusercontent.com/78708523/107164686-753f8a80-69f3-11eb-905f-96d0baf5ebe0.png)

<hr/>

## 작동과정(Operating Process)
Requ > Controller > DAO > Service > DB > Service > DAO > Controller > Response

<hr/>

## 주요기능 (Key Features)
+ [회원가입(Sign Up)](#회원가입Sign-Up)	
+ [로그인(Login)&로그아웃(Logout)](#로그인Login로그아웃Logout)
+ [개인정보수정(UserInfo Modify)](#개인정보수정UserInfo-Modify)
+ [글작성(Porst Write)](#글작성Post-Write)
+ [글수정(Post Modify)](#글수정Post-Modify)
+ [댓글 작성&삭제(Comment Write&Delete)](#댓글-작성삭제Comment-WriteDelete)
+ [검색(Search)](#검색Search)
+ [페이징 진행바(Paging Progress)](#페이징-진행바Paging-Progress)

### [회원가입(Sign Up)](#주요기능-Key-Features)
![001](https://user-images.githubusercontent.com/78708523/107165837-82f70f00-69f7-11eb-88e9-e91f08dfebc5.gif)

<hr/>

### [로그인(Login)&로그아웃(Logout)](#주요기능-Key-Features)
- 로그인 성공&로그아웃 (Login Sucess & Logout)
![loginout](https://user-images.githubusercontent.com/78708523/107170322-5f39c600-6a03-11eb-99a8-dddc9c0285c1.gif)
- 로그인 실패(Login Failed)
![002_2](https://user-images.githubusercontent.com/78708523/107166432-56dc8d80-69f9-11eb-9323-22c6378e44d5.gif)

<hr/>

### [개인정보수정(UserInfo Modify)](#주요기능-Key-Features)
![007](https://user-images.githubusercontent.com/78708523/107170318-5e089900-6a03-11eb-97c6-9ffd134d1a80.gif)

<hr/>

### [글작성(Post Write)](#주요기능-Key-Features)
![003](https://user-images.githubusercontent.com/78708523/107175983-8b5c4380-6a11-11eb-9794-33343343ed2f.gif)

<hr/>

### [글수정(Post Modify)](#주요기능-Key-Features)
![004](https://user-images.githubusercontent.com/78708523/107167239-b8056080-69fb-11eb-8a5c-f52271662582.gif)

<hr/>

### [글삭제(Post Delete)](#주요기능-Key-Features)
![004_2](https://user-images.githubusercontent.com/78708523/107167243-b9368d80-69fb-11eb-9d67-f54b7b1a5c32.gif)

<hr/>

### [댓글 작성&삭제(Comment Write&Delete)](#주요기능-Key-Features)
![005](https://user-images.githubusercontent.com/78708523/107167247-bb005100-69fb-11eb-8381-6105700ace0c.gif)

<hr/>

### [검색(Search)](#주요기능-Key-Features)
![006](https://user-images.githubusercontent.com/78708523/107168533-f94b3f80-69fe-11eb-8dbd-39709301fa5b.gif)

<hr/>

### [페이징 진행바(Paging Progress)](#주요기능-Key-Features)
![008](https://user-images.githubusercontent.com/78708523/107175500-58fe1680-6a10-11eb-9ff9-f19a399a57c4.gif)

<hr/>

## 더 추가해보고 싶은 기능
+ 댓글 수정 및 대댓글 기능
+ 게시글 앞에 이미지 첨부 시 썸네일 표시 기능
+ 좋아요 및 해시태그 기능
