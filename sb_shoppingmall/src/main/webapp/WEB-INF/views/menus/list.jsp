<%@page import="com.sb.vo.Event"%>
<%@page import="java.util.List"%>
<%@page import="com.sb.dao.EventDao"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>:::SAGOBOJA 신상품:::</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style>
.banner-wrapper{
	border: 1px outset black;
	text-align: center;
	weight: 100%;
	height: 300px;
	overflow: hidden;
	margin: 0 auto;
	margin-bottom: 30px
}
.banner {
	position: relative;
	weight: 100%;
	height: 300px;
	overflow: hidden;
}

#banner-img {
	position: absolute;
	padding-top: 100%; /* 1:1 ratio */
	top:25%; left:25%;
	max-width: 100%; height: auto;
	transform: translate(-25%, -75%);
	}
.title{
	background-color: yellow;
	position: absolute;
	top: 30%; left: 50%;
	transform: translate(-50%, 50%);	
}

p{	<!--자간 간격조정-->
	padding-top: 20px;
	padding-right: 10px;
	margin-bottom: 0px;
}
ul{
	list-style:none;
	padding-left:0px;
}

#item-box{
	border: 1px outset #cccccc;
	width: 270px;
	height: 330px;
	float: left;
	overflow: hidden;
	text-align: center;
	margin: 3px
}
#item{
	width: 270px;
	height: 320px;
	float: left;
	overflow: hidden;
	text-align: center;
}

#items-name{
	font-weight: bold;
	color: black;
	margin-top: 20px;
}
#item-price{
	font-weight: bold;
	color: black;
}
#item-thumbnail{
	width: 260px;
	height: 260px;
	object-fit:cover;
	z-index: 1;
}
#item-box{
	position: relative;
}
#hover-box{
	position: absolute;
	right: 5%; top: -15%;
}
/*
#hover-box{
	position: absolute;
    width: 270px;
    height: 44px;
  	transform: translate(0%, 300px);	
    overflow: hidden;
}

#hover-button{
	position: absolute;
    bottom: -44px;
    left: 50%;
    width: 180px;
    height: 44px;
    margin-left: -90px;
    overflow: hidden;
}
*/

</style>
<body>
<div class="container">
	<%@ include file="../../common/header.jsp" %>
	<main>
		<div class="row">
			<div class="col-12">
				<div class="banner-wrapper">
					<div class="banner">
						<a href=""><img id="banner-img" src="../resources/event/1.jpg" alt="레시피 대배너"></a>
						<h1 class="title">상품조회</h1>
						<h5>총 ${pagination.totalRows }건</h5>
					</div>	
				</div>
			</div>
		</div>	
		<div class="row">
			<div class="col-12">
				<c:choose>
					<c:when test="${empty products }">
						<p>"조회 가능한 상품이 없습니다."
					</c:when>
					
					<c:otherwise>
						<section id="content" class="row">
							<div class="box col-12">
								<div class="clear"></div>
							<!-- 중앙정렬 어떻게...? -->
								<c:forEach var="item" items="${products }">
									<div id="item-box" class="item-box">
										<!-- 각 상품으로 링크 -->
										<a href="어쩌고product?no={}">
											<ul id="item">
												<li><img id="item-thumbnail" src="../resources/product/${item.no}.jpg"></li>
												<li id="item-name">${item.name }/${item.producer }</li>
												<li id="item-price">${item.price }</li>
											</ul></a>
											<div id="hover-box" class="hover-box" style="max-width:100%;">
												<a href="어쩌고addCart?no={}"><button type="button" style="margin:0px;"class="btn btn-success"><i class="fas fa-cart-arrow-down"></i></button></a>
											</div>	
									</div>
								</c:forEach>
							</div>
							<div class="clear"></div>
						</section>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<c:if test="${pagination.totalRows gt 0 }">
			<div class="row mb-2">
				<div class="col-12">
					<ul class="pagination justify-content-center" id="pagination">
						<li class="page-item ${pagination.pageNo le 1 ? 'disabled' : ''}">
							<a class="page-link" href="javascript:goToPage(${pagination.pageNo - 1 })">이전</a>
						</li>
						<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
							<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
								<a class="page-link" href="javascript:goToPage(${num })">${num }</a>
							</li>
						</c:forEach>
						<li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : ''}">
							<a class="page-link" href="javascript:goToPage(${pagination.pageNo + 1 })">다음</a>
						</li>
					</ul>
				</div>
			</div>
		</c:if>
	</main>
	<%@ include file="../../common/footer.jsp" %>
</div>
<script type="text/javascript">
function submitForm() {
	var text = document.querySelector("input[name='keyword']").value;
	if (!text) {
		alert("검색어를 입력하세요");
		document.querySelector("input[name='keyword']").focus();
		return;
	}
	document.querySelector("input[name='page']").value = 1;
	document.querySelector("#form-search").submit();
}

function goToPage(pageNo) {
	var text = document.querySelector("input[name='keyword']").value;
	if (!text) {
		document.querySelector("input[name='keyword']").disabled = true;
	}
	document.querySelector("input[name='no']").disabled = true;
	
	document.querySelector("input[name='page']").value = pageNo;
	document.querySelector("#form-search").setAttribute("action", "recipe");
	document.querySelector("#form-search").submit();
}

function goToDetail(RecipeNo) {
	var text = document.querySelector("input[name='keyword']").value;
	if (!text) {
		document.querySelector("input[name='keyword']").disabled = true;
	}
	
	document.querySelector("input[name='no']").value = RecipeNo;
	document.querySelector("#form-search").setAttribute("action", "recipe/detail");
	document.querySelector("#form-search").submit();
}
	
	$(".item-box").hover(function() {
		$(this).find(".hover-box").animate({ "top": "4%" }, "slow" );
	}, function() {
		$(this).find(".hover-box").animate({ "top": "-15%" }, "slow" );
		
	});
</script>
</body>
</html>
