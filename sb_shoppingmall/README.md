# SAGOBOJA SHOPPING MALL - Team Project

## 개요
+ 4개월동안 배운 것을 토대로 팀원과 함께 프로젝트 진행
+ 사고보자 쇼핑몰은 식자재마트를 모티브로 제작되었습니다.
+ 일반사용자는 상품을 조회 및 수량 조정하여 장바구니에 담기 기능
+ 🙋‍♀️관리자는 기획전/레시피 조회, 추가, 수정, 삭제 기능 (+BOOTSTRAP을 이용한 디자인, UI 설계)
+ 레시피에서 해당하는 상품목록을 한 번에 장바구니에 담는 기능
+ 기획전의 마감 시간을 초단위로 출력하는 기능

<hr/>

## 프로젝트 개발환경 및 기술 (Development Environment)
+ eclipse
+ ORACLE DB
+ Apache Tomcat 10
+ MyBatis
+ Java
+ Jsp
+ JavaScript
+ HTML
+ CSS
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

## SB 패키지 (Pakage)
![image](https://user-images.githubusercontent.com/78708523/123630549-a01a6600-d850-11eb-9a67-e1e1b8d969dc.png)
![image](https://user-images.githubusercontent.com/78708523/123630588-ac9ebe80-d850-11eb-9143-a7bd66b74559.png)
![image](https://user-images.githubusercontent.com/78708523/123630644-baecda80-d850-11eb-958c-ff6d3a828407.png)
![image](https://user-images.githubusercontent.com/78708523/123630816-ef609680-d850-11eb-9197-332e5f5ca38a.png)
![image](https://user-images.githubusercontent.com/78708523/123630847-fd161c00-d850-11eb-943f-80375d7de52e.png)

<hr/>

## 데이터베이스 모델링 (ERD)
![image](https://user-images.githubusercontent.com/78708523/123609608-c503de80-d83a-11eb-98fd-64c4fa829146.png)

<hr/>

## 메인화면 및 세부화면 캡쳐
![image](https://user-images.githubusercontent.com/78708523/123630145-208c9700-d850-11eb-9636-360a5398185e.png)
![image](https://user-images.githubusercontent.com/78708523/123630365-65b0c900-d850-11eb-9a97-5bf330fbf1ed.png)
![image](https://user-images.githubusercontent.com/78708523/123630945-1b7c1780-d851-11eb-94d9-6f4241c9a3bb.png)
![image](https://user-images.githubusercontent.com/78708523/123631014-351d5f00-d851-11eb-8fab-137c7aef0db3.png)

<hr/>

## 주요기능 (Key Features)
+ 🙋‍♀️관리자는 기획전/레시피 조회, 추가, 수정, 삭제 기능
+ [관리자페이지 접근 시 로그인 화면으로 이동](#관리자페이지접근시로그인화면으로이동)	
+ [로그인 시 메인화면](#로그인시메인화면)
+ [기획전 조회](#기획전조회)
+ [기획전 등록](#기획전등록)
+ [레시피 조회](#레시피조회)
+ [레시피 등록](#레시피등록)

### [관리자페이지 접근 시 로그인 화면으로 이동](#주요기능-Key-Features)
![image](https://user-images.githubusercontent.com/78708523/123631349-9c3b1380-d851-11eb-9b5f-59874c1eaf03.png)

<hr/>

### [로그인 시 메인화면](#주요기능-Key-Features)
![image](https://user-images.githubusercontent.com/78708523/123633909-c04c2400-d854-11eb-82c8-a3992a444994.png)
- 등록된 기획전/레시피의 갯수 확인 가능
- 최근 등록된 3개의 기획전/레시피 확인 가능

<hr/>

### [기획전 조회](#주요기능-Key-Features)
![image](https://user-images.githubusercontent.com/78708523/123633794-9e52a180-d854-11eb-9d00-c75b3d620490.png)
- 등록된 기획전의 썸네일, 기획전명, 시작일, 종료일 확인 가능 게시판 목록에서 수정 및 삭제 가능
![image](https://user-images.githubusercontent.com/78708523/123632315-c17c5180-d852-11eb-9617-6b53a5234380.png)
- 기획전 상세 조회로 등록된 썸네일 및 상품 조회가 가능
- 리스트에서와 마찬가지로 수정, 삭제 가능

<hr/>

### [기획전 등록](#주요기능-Key-Features)
![GIF 2021-06-28 오후 8-58-48](https://user-images.githubusercontent.com/78708523/123633396-1e2c3c00-d854-11eb-85c0-ca60507efb46.gif)
- 타이틀, 내용(기획전 소제목), 시작일, 종료일, 카테고리별 상품 선택 가능
- 시작일과 종료일은 등록하는 당일 이전을 선택할 수 없으며, 시작일은 종료일을 넘는 것이 불가능

<hr/>

### [기획전 수정 및 삭제](#주요기능-Key-Features)
![GIF 2021-06-28 오후 9-15-19](https://user-images.githubusercontent.com/78708523/123635084-31400b80-d856-11eb-81e0-f9d41729576f.gif)
- 기존에 등록되어 있던 레시피 수정 가능
- 등록할 때와 마찬가지로 날짜, 썸네일 선택 가능
- 기존에 선택했던 상품들이 체크되어 있어서 쉽게 확인 가능
![GIF 2021-06-28 오후 9-20-09](https://user-images.githubusercontent.com/78708523/123635492-b1667100-d856-11eb-879e-cd4fce1db29b.gif)
- 삭제버튼으로 손쉽게 삭제 가능
<hr/>

### [레시피 조회](#주요기능-Key-Features)
![image](https://user-images.githubusercontent.com/78708523/123634276-318bd700-d855-11eb-9731-bedabb31b229.png)
- 등록된 레시피의 썸네일, 레시피명 확인 가능 게시판 목록에서 수정 및 삭제 가능
![image](https://user-images.githubusercontent.com/78708523/123634436-65ff9300-d855-11eb-8cae-ede2134630b6.png)
![image](https://user-images.githubusercontent.com/78708523/123634481-744daf00-d855-11eb-805d-c9d83f395e20.png)
- 레시피 상세 조회로 등록된 썸네일 및 상품 조회가 가능
- 리스트에서와 마찬가지로 수정, 삭제 가능

<hr/>

### [레시피 등록](#주요기능-Key-Features)
![GIF 2021-06-28 오후 8-58-48](https://user-images.githubusercontent.com/78708523/123633396-1e2c3c00-d854-11eb-85c0-ca60507efb46.gif)
- 타이틀, 내용(기획전 소제목), 시작일, 종료일, 카테고리별 상품 선택 가능
- 시작일과 종료일은 등록하는 당일 이전을 선택할 수 없으며, 시작일은 종료일을 넘는 것이 불가능

<hr/>
## 초기 UI/UX 디자인
+ 댓글 수정 및 대댓글 기능
+ 게시글 앞에 이미지 첨부 시 썸네일 표시 기능
+ 좋아요 및 해시태그 기능
