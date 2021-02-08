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
+ [회원가입(Sign Up)](#회원가입Sign-Up)	
+ [로그인(Login)&로그아웃(Logout)](#로그인Login로그아웃Logout)
+ [글수정(Post Modify)](#글수정Post-Modify)
+ [댓글 작성&삭제(Comment Write&Delete)](#댓글-작성삭제Comment-WriteDelete)
+ [검색(Search)](#검색Search)

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
