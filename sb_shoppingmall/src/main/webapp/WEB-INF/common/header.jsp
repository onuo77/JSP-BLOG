<%@page import="com.sb.dao.AdminEventDao"%>
<%@page import="com.sb.vo.Category"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
   AdminEventDao adminEventDao = AdminEventDao.getInstance();
   List<Category> categories = adminEventDao.getAllCategory();
   request.setAttribute("categories", categories);
%>

<style>
.dropdown-toggle::after{
   content:none !important;
}

.navitem{
   font-weight:500;
   text-decoration:none;
}
.navitem a:hover{
   text-decoration:none;
   font-weight:bolder;
}
</style>



<header class="my-3">

   <nav class="navbar navbar-expand-md navbar-Light">

      <div class="container">

         <div class="collapse navbar-collapse justify-content-end"
            id="navbarCollapse">
            <c:choose>
               <c:when test="${empty LOGIN_USER}">
                  <ul class="navbar-nav">
                     <li class="nav-item"><a class="nav-link" href="/sb/login"
                        style="color: black;">로그인</a></li>
                     <li class="nav-item"><a class="nav-link" href="/sb/register"
                        style="color: black;">회원가입</a></li>
                     
                  </ul>
               </c:when>
               <c:when test="${LOGIN_USER.roleType eq 'ADMIN'}">
                  <ul class="navbar-nav">
                     <li class="nav-item"><a class="nav-link" href="/sb/admin"
                        style="color: black;">관리자페이지</a></li>
                     <li class="nav-item"><a class="nav-link" href="/sb/logout"
                        style="color: black;">로그아웃</a></li>
                  </ul>
               </c:when>               
               <c:otherwise>
                  <ul class="navbar-nav">
                     <li class="nav-item"><a class="nav-link" href="/sb/logout"
                        style="color: black;">로그아웃</a></li>
                     <li class="nav-item"><a class="nav-link" href="/sb/mypage"
                        style="color: black;">마이페이지</a></li>
                     <li class="nav-item"><a class="nav-link" href="/sb/order"
                        style="color: black;">주문목록</a></li>
                     <li class="nav-item"><a class="nav-link" href="/sb/cart"
                        style="color: black;">장바구니</a></li>
                  </ul>                  
               </c:otherwise>
            </c:choose>
         </div>
      </div>
   </nav>




   <div class="container">

      <div class="row" style="text-align: center;">
         <div class="col-md"
            style="display: block; text-align: center; margin-bottom: 25px;">
            <a href="/sb/index"> <img src="/sb/resources/images/common/sagoboja_logo.png"
               style="width: 100px; display: inline;">
            </a>
         </div>
      </div>
   </div>

   <div class="container">

      <div class="row" style="text-align: center;">
         <div class="col-md-2">
            <div class="dropdown">
                 <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   <img src="/sb/resources/images/common/category.png" style="width: 25px;">
                 </button>
                 <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                   <c:forEach var="category" items="${categories }">
                      <a class="dropdown-item" href="/sb/menu/category?no=${category.no }">${category.name }</a>
                   
                   </c:forEach>
                 </div>
               </div>
         </div>
            <div class="col-md-2 navitem" style="text-decoration:none;"><a href="/sb/menu/recent" class="text-dark" style="line-height: 40px;">신상품</a></div>
            <div class="col-md-2 navitem" style="color:black;"><a href="#" class="text-dark" style="line-height: 40px;">베스트</a></div>
            <div class="col-md-2 navitem" style="color:black;"><a href="/sb/menu/event" class="text-dark" style="line-height: 40px;">기획전</a></div>
            <div class="col-md-2 navitem" style="color:black;"><a href="/sb/menu/recipe" class="text-dark" style="line-height: 40px;">레시피</a></div>
            <div class="col-md-2">
               <a href="/sb/index/search" style="line-height: 40px;"> <img src="/sb/resources/images/common/search.png"
                  style="width: 28px;">
               </a>
            </div>
      </div>
   </div>
   
</header>