# JSP-BLOG (Reply builtin Board System) - Personal Project

## 목적(Purpose)
+ 웹개발의 전체적인 순서를 이해하기
+ 반복된 연습으로 최적화된 게시판 생성하기

<hr/>

## 개발환경 (Development Environment)
+ eclips 4.16.0
+ MySQL 8.0
+ Apache Tomcat 8.5

## 개발언어 (Programming Language)
+ Java 1.8.0_261
+ Jsp
+ JavaScript
+ HTML
+ CSS

## 프레임워크 및 라이브러리 (Framework & library)
+ Bootstrap 4.5.2
+ Lombok
+ jQuery 3.5.1
+ AJAX
+ Jsoup
+ Json
+ Gson

## API
+ SummerNote

<hr/>

## MYSQL 데이터베이스 & 사용자 생성 (Creating Database & User)
```sql
CREATE USER 'bloguser'@'%' IDENTIFIED BY 'blog001';
GRANT ALL privileges ON *.* TO 'bloguser'@'%';
CREATE DATABASE bloguser;
```

## MYSQL 테이블 생성(Creating Table)
```sql
use bloguser; 

CREATE TABLE users(
	id int primary key auto_increment,
    username varchar(100) not null unique,
    password varchar(100) not null,
    email varchar(100) not null,
    address varchar(100),
    userRole varchar(20),
    createDate timestampid
) engine=InnoDB default charset=utf8;

create table board(
	id int primary key auto_increment,
    userId int,
    title varchar(100) not null,
    content longtext,
    readCount int default 0,
    createDate timestamp,
    foreign key (userId) references users (id)
) engine = InnoDB default charset = utf8;

create table reply(
	id int primary key auto_increment,
    userId int,
    boardId int,
    content varchar(300) not null,
    createDate timestamp,
    foreign key (userId) references users (id) on delete set null,
    foreign key (boardId) references board (id) on delete cascade
)engine = InnoDB default charset = utf8;
```

<hr/>

## jspblog 패키지 (Pakage)
![image](https://user-images.githubusercontent.com/78708523/107164592-1a0d9800-69f3-11eb-8d41-d3ddfb45648d.png)
![image](https://user-images.githubusercontent.com/78708523/107164641-475a4600-69f3-11eb-8818-40a1561fc376.png)

<hr/>

## jspblog 데이터베이스 모델링 (ERD)
![image](https://user-images.githubusercontent.com/78708523/107164686-753f8a80-69f3-11eb-905f-96d0baf5ebe0.png)

<hr/>

## 주요기능 (Key Features)
+ 회원가입(Sign Up)
![001](https://user-images.githubusercontent.com/78708523/107165837-82f70f00-69f7-11eb-88e9-e91f08dfebc5.gif)
