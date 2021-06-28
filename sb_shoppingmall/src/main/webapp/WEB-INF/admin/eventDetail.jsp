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
	<c:set var="menu" value="EVENTLIST"/>
	
	<div class="container-fluid h-100">
		<%@include file="/WEB-INF/common/adminHeader.jsp" %>
		<div class="row h-100">
		<%@include file="/WEB-INF/common/adminAside.jsp" %>
			<div class="col-10 h-100 side-content">
				<h3 class="pt-4 pl-4">기획전 상세 조회</h3>
				
				<!-- 글내용시작 -->
				<div class="row justify-content-center">
					<div class="col-10">
						<div class="row justify-content-end text-center">
							<a href="/sb/eventmodify?eventNo=${eventInfo.no }" class="btn btn-outline-warning mr-1">수정</a>
							<a href="/sb/eventdelete?eventNo=${eventInfo.no }" class="btn btn-outline-danger">삭제</a>
						</div>
						
						<div class="row justify-content-center">
							<div class="col-12 mt-3 text-center p-3 align-middle" style="border-top:1px solid black; border-bottom:1px solid black;">
								<h5><strong>${eventInfo.title }</strong></h5>
							</div>
						</div>
						
						<div class="row">
							<div class="col-12 mt-3">
								<div>
									<h6><strong>썸네일</strong></h6>
									<img src="resources/event/${eventInfo.fileName}" width="1000px" height="300px">
								</div>
								<div class="mt-3">
									<h6><strong>기획전 내용</strong></h6>
									<p>${eventInfo.content}</p>
								</div>
								<div class="mt-3">
									<h6><strong>기획전 기간</strong></h6>
									<p><fmt:formatDate value="${eventInfo.startDate }" pattern="yyyy-MM-dd HH:mm"/> ~ <fmt:formatDate value="${eventInfo.endDate }" pattern="yyyy-MM-dd HH:mm"/></p>
								</div>
								<div class="text-center">
									<table class="table">
										<colgroup>
											<col width="15%">
											<col width="60%">
											<col width="25%">
										</colgroup>
										<thead>
											<tr>
												<th>카테고리</th>
												<th>상품명</th>
												<th>가격</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var="pd" items="${eventProducts}">
											<tr>
												<td>${pd.category}</td>
												<td>${pd.productName }</td>
												<td><fmt:formatNumber>${pd.productPrice }</fmt:formatNumber>원</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						
					</div>
				</div>
				<!-- 글내용끝  -->
			</div>
		</div>
	</div>
</body>
</html>