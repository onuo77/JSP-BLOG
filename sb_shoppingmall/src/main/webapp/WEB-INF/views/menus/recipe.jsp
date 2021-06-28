<%@page import="com.sb.vo.Event"%>
<%@page import="java.util.List"%>
<%@page import="com.sb.dao.EventDao"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
	text-align: center;
	weight: 100%;
	height: 350px;
	overflow: hidden;
	margin: 0 auto;
}
#bigbox {
	position: relative;
	height: 350px !important;
	overflow: hidden;
}
.img-thumbnail {
	position: absolute;
	top:100%; left:25%;
	max-width: 100%; height: auto;
	transform: translate(-25%, -75%);
}
#inbox{
	position: absolute;
	top: 80%;
	left: 40%;
	transform: translate(-25%, -70%);
}
.title{
    color: white;
    background-color: rgba(0,0,0,0.5);
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    position: absolute;
    width: 100%;
    height: 350px;   
}
h1{
   line-height: 350px;
   text-align: center;
}
.card{
	position: relative;
	height: 400px !important;
	overflow: hidden;
	
}
.card .img{
	position: absolute;
	top:100%; left:25%;
	max-width: 100%; height: auto;
	object-fit:cover;
	transform: translate(-25%, -75%);
}
</style>
<body>


<div class="container">
	<%@ include file="../../common/header.jsp" %>
	<main>
		<div class="row mb-3">
			<div class="col-12" id="bigbox">
				<img src="../resources/event/16.jpg" class="img-thumbnail w-100" alt="">
				<div class="title">
					<h1>SB's Recipe</h1>
				</div>
				<div class="row mb-2">
					<div class="col-12" id="inbox">
						<form id="form-search">
							<div class="form-group row">
								<div class="col-6 offset-1">
									<input type="hidden" name="no" value="" />
									<input type="hidden" name="page" value="${pagination.pageNo }">
									<input type="text" class="form-control" name="keyword" value="${param.keyword }">
								</div>
								<div class="col-2">
									
									<button class="btn btn-success" onclick="submitForm()">검색</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="row mb-2">
			<c:choose>
				<c:when test="${empty recipes }">
					<div class="col-12 text-center">조회가능한 레시피가 없습니다.</div>
				</c:when>
			</c:choose>
			<div class="col-12">
				<div class="border p-2">
					<div class="row">
						<c:forEach var="recipe" items="${recipes }">
							<div class="col-4 mb-2">
								<div class="card">
									<div class="text-center p-5" style="font-size: 25px; font-weight: bolder;"><a href="recipe/detail?no=${recipe.no }" class="text-dark">${recipe.title }</a></div>
									<a href="javascript:goToDetail(${recipe.no })"><img src="../resources/recipe/${recipe.fileName}" class="card-img-top" alt="..."></a>
								</div>
							</div>
						</c:forEach>	
					</div>
				</div>
			</div>
		</div>
		<c:if test="${pagination.totalRows gt 0 }">
			<div class="row mb-2">
				<div class="col-12">
					<ul class="pagination justify-content-center">
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
</script>
</body>
</html>
