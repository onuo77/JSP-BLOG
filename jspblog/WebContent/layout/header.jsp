<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  
  <style>
  .navbar, .progress-bar, .btn, .btn-primary{
  	background-color:#e5c7bd;
  	border:none;
  }
  .btn-primary:hover,.btn-primary:focus,.btn-primary:active, 
  .btn-primary:active:focus:not(:disabled):not(.disabled),
  .btn:focus, .btn:active, .btn:hover{
	box-shadow: none!important;
	background-color:#f2e3de;
	color:#27120d;
	outline: 0;
  }
  .btn{
  	float:right;
  }
  .navbar-brand, .navbar-nav a,.btn,.btn:hover,.navbar {
   	color: #27120d;
  }
  .navbar-brand:hover, .navbar-nav a:hover {
   	color: #fff;
  }
  .material-icons{
  	font-size:10px;
  	cursor:pointer;
  }
  .text-primary{
  	color:#746761 !important;
  	font-size:16px;
  }
  .media-body p{
  	font-size:13px;
  	color:#b0a29f;
  }
  .searchbox{
  	border-radius:0px;
  	border:none;
  	border-bottom:1px solid #b0a29f;
  }
  .page-link{
  	color:#e5c7bd;
  }

  .mh_content{
  	width:100%;
  	height:200px;  
   	text-align:center;
  	color:#fff;
	position:absolute;
	left:50%;
	top:50%;
	margin-left:-50%;
	margin-top:-60px;
  }
  .mainheader{
  	background:url('https://cdn.pixabay.com/photo/2017/05/20/20/22/clouds-2329680_960_720.jpg') no-repeat;  
  	background-size:cover;
  	background-position:center center;
  	background-attachment:fixed;
  	filter:opacity(90%);
  	width:100%;
  	height:200px;
  	position:relative;
  }

  </style>
</head>
<body>

<nav class="navbar navbar-expand-md">
  <!-- Brand -->
  <a class="navbar-brand" href="<%=request.getContextPath()%>/">HOME</a>

  <!-- Toggler/collapsibe Button -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>

 <c:choose>
	<c:when test="${sessionScope.principal != null}">
		<div class="collapse navbar-collapse" id="collaspsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item">
				<a class="nav-link" href="<%=request.getContextPath()%>/board?cmd=saveForm">WRITE</a></li>
				<li class="nav-item">
				<a class="nav-link" href="<%=request.getContextPath()%>/user?cmd=updateForm">USER INFO</a></li>
				<li class="nav-item">
				<a class="nav-link" href="<%=request.getContextPath()%>/user?cmd=logout">LOGOUT</a></li>				
			</ul>
		</div>
	</c:when>
 <c:otherwise>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/user?cmd=joinForm">SIGN UP</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/user?cmd=loginForm">LOGIN</a>
      </li>
    </ul>
  </div>
</c:otherwise>  

 </c:choose>
</nav>

<div class="mainheader">
	<div class="mh_content">
		<h1>GO BLOG</h1>
		<p>─</p>
		<p>
			 : Record your story 
		</p>
	</div>
</div>