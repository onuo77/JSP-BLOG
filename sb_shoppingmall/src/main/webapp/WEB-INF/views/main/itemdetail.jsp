<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>상품 상세 정보</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
.main-section {
	position: absolute;
	left: 50%;
	right: 50%;
	transform: translate(-50%, 5%);
}

.product_name {
	font-size: 30px;
	color: #000;
}

.left-side-product-box img {
	width: 100%;
}

.left-side-product-box .sub-img img {
	margin-top: 5px;
	width: 83px;
	height: 100px;
}

.right-side-pro-detail span {
	font-size: 15px;
}

.right-side-pro-detail p {
	font-size: 25px;
	color: #a1a1a1;
}

.right-side-pro-detail .price-pro {
	color: #E45641;
}

.right-side-pro-detail .tag-section {
	font-size: 18px;
	color: #5D4C46;
}

.pro-box-section .pro-box img {
	width: 100%;
	height: 200px;
}

@media ( min-width :360px) and (max-width:640px) {
	.pro-box-section .pro-box img {
		height: auto;
	}
}

.total {
	color: #28a745;
	font-size: 40px;
	font-weight: bold;
	padding-top: 20px;
	text-align: right;
}

#image-box {
	width: 350px;
}

#image {
	object-fit: cover;
}

/* 탭 전체 스타일 */
.tabs {
	margin-top: 50px;
	padding-bottom: 40px;
	background-color: #ffffff;
	width: 1000px;
	margin: 0 auto;
}

/* 탭 스타일 */
.tab_item {
	width: calc(100%/ 2);
	height: 50px;
	border-bottom: 3px solid #28a745;
	background-color: #ffffff;
	line-height: 50px;
	font-size: 16px;
	text-align: center;
	color: #333333;
	display: block;
	float: left;
	text-align: center;
	font-weight: bold;
	transition: all 0.2s ease;
}

.tab_item:hover {
	opacity: 0.75;
}

/* 라디오 버튼 UI삭제*/
input[name="tab_item"] {
	display: none;
}

/* 탭 컨텐츠 스타일 */
.tab_content {
	display: none;
	padding: 40px 40px 0;
	clear: both;
	overflow: hidden;
}

/* 선택 된 탭 콘텐츠를 표시 */
#all:checked ~ #all_content, #programming:checked ~ #programming_content,
	#design:checked ~ #design_content {
	display: block;
}

/* 선택된 탭 스타일 */
.tabs input:checked+.tab_item {
	background-color: #28a745;
	color: #fff;
}
</style>
	
</head>
<body>
	<div class="container">
		<%@ include file="../../common/header.jsp"%>
		<main>

			<div class="col-lg-10 main-section bg-white">
				<div class="row m-0">
					<div class="col-lg-6 left-side-product-box pb-3">
						<div id="image-box">
							<img src="../resources/product/${product.no }.jpg" id="image"
								class="product_image">
						</div>
					</div>
					<div class="col-lg-6">
						<div class="right-side-pro-detail">
							<div class="row">
								<div class="col-lg-12">
									<div class="product_name">${product.name }</div>
									<span>${product.producer}</span>
									<hr class="m-0 pt-3 mt-3">
								</div>

								<div class="col-lg-12">
									<table>
										<tr>
											<th>판매가:</th>
											<td><span id="product-price"><fmt:formatNumber value="${product.price }" /></span>원</td>
										</tr>
									</table>
									<hr class="m-0 pt-3 mt-3">
								</div>


								<div class="col-lg-12">
									<h6>구매수량</h6>
									<div class="col-12 postion-relative border rounded" style="width:100px; height:50px;">
										<button onclick="refreshPrice(1)" class="btn position-absolute plus" style="right:5px; top:0; height:25px; padding:0px; font-size:14px;">▲</button>
										<input type="text" id="stock" readonly="readonly" class="text-center position-absolute h-100" value="1" style="width:76px; left:0px; border:none; outline:none;">
										<button onclick="refreshPrice(-1)" class="btn position-absolute minus" style="bottom:0; right:5px; height:25px; padding:0px; font-size:14px;">▼</button>
									<div class="total position-absolute" style="right:-228px; top:-25px;">
										<span id="total-price" style="font-size:38px;"><fmt:formatNumber value="${product.price }" /></span><span>원</span>
									</div>
									</div>
								</div>
								<div class="col-lg-12">
								</div>

								<div class="col-lg-12 mt-4">
									<div class="row">
										<div class="col-lg-6 pb-2">
											<a href="/sb/addCart?no=${product.no}" class="btn btn-danger w-100">Add To Cart</a>
										</div>
										<div class="col-lg-6">
											<a href="#" class="btn btn-success w-100">Shop Now</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</main>
	</div>
	<br />
	<br />
	<br />
	<div class="container">
		<div class="tabs">
			<input id="all" type="radio" name="tab_item" checked> <label
				class="tab_item" for="all">상품정보</label> <input id="programming"
				type="radio" name="tab_item"> <label class="tab_item"
				for="programming">상품평</label>
			<div class="tab_content" id="all_content">
				<%@ include file="./iteminfo.jsp"%>
			</div>
			<div class="tab_content" id="programming_content">
				<%@ include file="./review.jsp"%>
			</div>
			
		</div>
	</div>
	<%@ include file="../../common/footer.jsp"%>
	
<script type="text/javascript">

	function refreshPrice(val){
		var input = document.querySelector("#stock");
		input.value = parseInt(input.value) + val
		if (input.value == 0) {
			input.value = 1;
		}

		var price = document.getElementById("product-price").textContent.replace(/,/g, '');
		
		var totalPrice = input.value * price;
		document.getElementById("total-price").textContent = new Number(totalPrice).toLocaleString();
		
	}
</script>

</body>
</html>