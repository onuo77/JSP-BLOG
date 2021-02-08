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
<pre><code>
CREATE USER 'bloguser'@'%' IDENTIFIED BY 'blog001';
GRANT ALL privileges ON *.* TO 'bloguser'@'%';
CREATE DATABASE bloguser;
</code></pre>
