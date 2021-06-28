<%@page import="com.sb.dao.CartItemDao"%>
<%@page import="com.sb.vo.Product"%>
<%@page import="com.sb.vo.CartItem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.sb.util.CommonUtils"%>
<%@page import="com.sb.dto.CartitemDto"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.sb.vo.User"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>SAGOBOJA</title>
<script type="text/javascript">




</script>
</head>
<body>
<div class="container">
	<header>
		<%@ include file="../common/header.jsp"%>
	</header>
	<%
		
	%>
	<main>
		<div class="row mb-3">
			<div class="col-12">
				<h3 class="border p-3 bg-light"><small class="text-right">나의 주문목록</small></h3>
			</div>
		</div>

		<div class="row mb-3">
			<div class="col-12">
				<div class="card">
					<form method="get" action="../order/insert.jsp">
						<div class="card-body pb-0">
							<table class="table" id="cartitem-table">
							<thead>
								<tr>
									<th>번호</th>
									<th>상품번호</th>
									<th>상품명</th>
									<th>주문아이디</th>
									<th>가격</th>
									<th>수량</th>
									<th>주문날짜</th>
									<th>주문취소</th>
								</tr>
							</thead>
							
							<tbody>
								<c:choose>
									<c:when test="${empty orderList }">
										<p>주문한 상품이 없습니다.</p>
									</c:when>
									<c:otherwise>
										<c:forEach var="item" items="${orderList }">
											<tr>
												<td>${item.orderNo }</td>
												<td>${item.productNo}</td>
												<td>${item.productName }</td>
												<td>${item.userId }</td>
												<td>${item.productPrice}</td>
												<td>${item.orderItemAmount }</td>
												<td>${item.orderCreatedDate }</td>
												<td><a href="/sb/orderDelete?no=${item.orderNo }&productNo=${item.productNo}" class="btn btn-danger btn-sm">취소</a></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								
							</tbody>
							</table>
							
							
						</div>
					</form>
				</div>
			</div>
		</div>

	</main>
	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>
</div>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>