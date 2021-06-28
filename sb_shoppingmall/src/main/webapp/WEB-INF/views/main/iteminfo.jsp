<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap 4 Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<table class="table">
		<colgroup>
			<col width="30%">
			<col width="70%">
		</colgroup>
			<tbody>
				<tr>
					<td>상품유형</td>
					<td>${product.type }</td>
				</tr>
				<tr>
					<td>제조사</td>
					<td>${product.producer }</td>
				</tr>
				<tr>
					<td>제조지</td>
					<td>${product.location }</td>
				</tr>
				<tr>
					<td>제조연월일</td>
					<td><fmt:formatDate value="${product.mfdDate }" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
					<td>유통기한 또는 품질유지기간</td>
					<td><fmt:formatDate value="${product.expDate }" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
					<td>소비자상담관련 전화번호</td>
					<td>${product.cs_num }</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>