<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>:::SAGOBOJA 기획전:::</title>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style>
.event-box{
   border: 1px outset black;
   /* text-align: center; */
   /* width: 100%; */
   height: 300px;
   overflow: hidden;
   margin: 0 auto;
}
.thumbnail {
   /* position: relative !important; */
   /* padding-top: 100%; */ /* 1:1 ratio */
   /* overflow: hidden; */
   width: 100% !important;
   max-height:300px;
   padding:0;
}
.thumbnail img {
/*    position: absolute !important;
   top:25%; left:25%; */
   min-width: 100%; 
   height: auto;
   background-size: cover;
   height: 300px;
   /* transform: translate(-25%, -75%); */
}
.title{
   padding-top: 91px;
    /* vertical-align: middle; */
    /* z-index: 111111111111; */
    background-color: rgba(0,0,0,0.5);
    position: absolute !important;
    top: -50%;
    /* left: 154px; */
    left: 50%;
    /* margin-left: 30%; */
    transform: translate(-50%, 50%);
    color: white;
    height: 300px;
    width: 100%;
    text-shadow: 2px 2px 1px black;
    
   <%--
   background-color: rgba(0,0,0,0.5);
    position: absolute !important;
    left: 50%;
    transform: translate(-50%, 20%);
    color: white;
    /* height: 300px; */
    padding: 50px;
    border-radius: 10px;
   --%>
}
h1{
   text-align: center;
}
p{   <!--자간 간격조정-->
   vertical-align: middle;
   margin: 0 auto;
   padding:0px;
}
</style>
<body>
<div class="container">
<%@ include file="../../common/header.jsp" %>
   <main>
      <div class="row">
         <div class="col-12" style="padding:60px">
            <h1>사고보자 기획전</h1>
         </div>
      </div>
      <c:choose>
         <c:when test="${empty events }">
            <div class="row">   
               <div class="col-12" style="padding:60px; text-align:center">
               <p>현재 진행중인 기획전이 없습니다.</p>
               </div>
            </div>
         </c:when>
         <c:otherwise>      
      <!-- 기획전 배너 시작 -->
            <c:forEach var="event" items="${events }">
               <a href="event/detail?no=${event.no }">
               <div class="row event-box mb-5">
                  <div class="thumbnail text-center col-12">
                     <img src="/sb/resources/event/${event.fileName}" alt="">
                  <div class="title">
                     <h5 class="remain-time-box" data-id="${event.no }" data-time="${event.endDateTime }"> 남은시간: <span id="day-box-${event.no}">00</span>일 <span id="hour-box-${event.no }">00</span>:<span id="min-box-${event.no }">00</span>:<span id="sec-box-${event.no }">00</span></h5>
                     <h1>${event.title }</h1>
                     <h5>${event.content }</h5>
                  </div>
                  </div>
               </div>
               </a>
      <!-- 배너 끝: for문으로 돌리기 -->
            </c:forEach>
         </c:otherwise>
      </c:choose>      
   </main>
   <%@ include file="../../common/footer.jsp" %>
</div>
<script type="text/javascript">
   (function() {
      var elements = document.querySelectorAll(".remain-time-box");   
      for (var i=0; i<elements.length; i++) {
         var el = elements[i];
         var time = el.getAttribute("data-time");
         refreshTime(el, time)
      }
      
      function refreshTime(el, time) {
         var id = el.getAttribute("data-id");
         var dayEl = document.getElementById("day-box-" + id);
         var hourEl = document.getElementById("hour-box-" + id);
         var minEl = document.getElementById("min-box-" + id);
         var secEl = document.getElementById("sec-box-" + id);
         setInterval(() => {
            var currentTime = new Date().getTime();
            var remainTime = (time - currentTime)/1000;
            
            var day = Math.trunc(remainTime / (24*3600));
            remainTime -= day*24*3600;
            var hour = Math.trunc(remainTime/3600)
            remainTime -= hour*3600;
            var min = Math.trunc(remainTime/60)
            var sec = Math.trunc(remainTime - (min*60))

            dayEl.textContent = day;
            hourEl.textContent = hour;
            minEl.textContent = min;
            secEl.textContent = sec;
            
            
            
         
         }, 1000);
      }
   })()
   
</script>
</body>
</html>