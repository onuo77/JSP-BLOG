# JSP-BLOG (Reply builtin Board System) - Personal Project

## 목적(Purpose)
+ 웹개발의 전체적인 순서를 이해하기
+ 반복된 연습으로 최적화된 게시판 생성하기

<hr/>

## 개발환경(Development Environment)
+ eclips 4.16.0
+ MySQL 8.0
+ Apache Tomcat 8.5

## 개발언어(Programming Language)
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

## MYSQL Creating Database & User
<pre>
CREATE USER 'bloguser'@'%' IDENTIFIED BY 'blog001';
GRANT ALL privileges ON *.* TO 'bloguser'@'%';
CREATE DATABASE bloguser;
</pre>

## MYSQL Creating Table
<pre>
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
</pre>
