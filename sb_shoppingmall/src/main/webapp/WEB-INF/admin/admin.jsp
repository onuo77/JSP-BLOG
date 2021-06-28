<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  	<title>SAGOBOJA ADMIN</title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="resources/css/admin.css">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>
<body>
	<div class="container-fluid h-100 overflow-hidden">
		<%@include file="/WEB-INF/common/adminHeader.jsp" %>
		<div class="row h-100">
		<%@include file="/WEB-INF/common/adminAside.jsp" %>
			<div class="col-10 p-3 side-content">
				<div class="col-12 bg-light p-5 mb-4 rounded">
				  <h1><i class="fas fa-bell"></i>&nbsp;DASHBOARD</h1>
				  <p>등록된 기획전과 등록된 레시피를 확인하세요</p>
				</div>
				<div class="row justify-content-center">
					<div class="col-5 border rounded mr-5 border-left shadow-sm">
						<h4>
							<i class="far fa-check-square"></i>&nbsp;
							<a href="/sb/adminEvents" class="text-body">
								등록된 기획전
								<span class="badge badge-success float-right">${cntDto.eventCnt}</span>
							</a>
						</h4>
					</div>
					<div class="col-5 border rounded border-left shadow-sm">
						<h4>
							<i class="far fa-check-square"></i>&nbsp;
							<a href="/sb/adminRecipes" class="text-body">
								등록된 레시피 
							<span class="badge badge-success float-right">${cntDto.recipeCnt}</span>
							</a>
						</h4>
					</div>
				</div>
				
				<hr style="border:2px dotted #ddd; width:88% !important;" class="mt-4"/>
				
				<div class="row mt-4 justify-content-center">
					<div class="col-5 rounded mr-5">
						<h5 class="text-center bg-warning rounded p-2 font-weight-bold">최신 기획전</h5>
						<table class="table">
							<colgroup>
								<col width="44%">
								<col width="28%">
								<col width="28%">
							</colgroup>
							<thead>
								<tr class="text-center">
									<th>글제목</th>
									<th>시작일</th>
									<th>종료일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="event" items="${recentEvents}">
									<tr>
										<td><a href="/sb/adminEventDetail?eventNo=${event.no }" class="text-success">${event.title }</a></td>
										<td class="text-center"><fmt:formatDate value="${event.startDate }" pattern="yyyy-MM-dd HH:mm"/></td>
										<td class="text-center"><fmt:formatDate value="${event.endDate }" pattern="yyyy-MM-dd HH:mm"/></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="col-5 rounded">
						<h5 class="text-center bg-warning rounded p-2 font-weight-bold">최신 레시피</h5>
						<table class="table">
							<colgroup>
								<col width="70%">
								<col width="30%">
							</colgroup>
							<thead>
								<tr class="text-center">
									<th>글제목</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="recipe" items="${recentRecipes}">
									<tr>
										<td><a href="/sb/adminRecipeDetail?recipeNo=${recipe.no }" class="text-success">${recipe.title }</a></td>
										<td class="text-center"><fmt:formatDate value="${recipe.createdDate }" pattern="yyyy-MM-dd"/></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>