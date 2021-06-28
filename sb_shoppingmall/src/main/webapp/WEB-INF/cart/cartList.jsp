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

function showConfirm(){
	if(confirm("장바구니에 추가하시겠습니까?")){
		if(confirm("장바구니에서 삭제하시겠습니까?")){
			
		}
	}
}


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
				<h3 class="border p-3 bg-light"><small class="text-right">장바구니 목록</small></h3>
			</div>
		</div>

		<div class="row mb-3">
			<div class="col-12">
				<div class="card">
					<form method="get" action="/sb/addOrder">
						<div class="card-body pb-0">
							<table class="table" id="cartitem-table">
							<thead>
								<tr>
									<th>번호</th>
									<th>상품번호</th>
									<th>상품명</th>
									<th>주문아이디</th>
									<th class="text-right">가격</th>
									<th>수량</th>
									<th>비고</th>
									<th></th>
								</tr>
							</thead>
							
							<tbody>
								<c:choose>
									<c:when test="${empty cartItems }">
										<p>아무것도 없다</p>
									</c:when>
									<c:otherwise>
										<c:forEach var="item" items="${cartItems }" varStatus="i">
											<tr>
												<td>${i.count }</td>
												<td>${item.productNo}</td>
												<td>${item.productName }</td>
												<td>${item.userId }</td>
												<td>${item.productPrice}</td>
												<td>${item.cartitemAmount }</td>
												<td><a href="/sb/addOrder?no=${item.productNo }&cartNo=${item.no}&amount=${item.cartitemAmount}" class="btn btn-danger btn-sm">주문</a></td>
												<td><a href="/sb/delete?no=${item.no }" class="btn btn-danger btn-sm">삭제</a></td>
											</tr>
										</c:forEach>
									</c:otherwise>
									
								</c:choose>
							</tbody>
							</table>
						</div>
						<div class="mb-1">
							<button type="submit" id="allOrder" class="btn btn-outline-primary btn-sm" onclick="location.href='/sb/addOrder?no=${item.no}'">전체
								주문</button>
						</div>
					</form>
					<form method="post" is="add-order" action="/sb/addOrder">
						
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