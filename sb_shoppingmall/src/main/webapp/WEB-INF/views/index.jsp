<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<title>SAGOBOJA</title>
<style>
#banner {
	object-fit: cover;
}

#banner-box {
	width: 100%;
}

<!--
image grid -->.product-grid4, .product-grid4 .product-image4 {
	position: relative
}

.product-grid4 {
	font-family: Poppins, sans-serif;
	text-align: center;
	border-radius: 5px;
	overflow: hidden;
	z-index: 1;
	transition: all .3s ease 0s
}

.product-grid4:hover {
	box-shadow: 0 0 10px rgba(0, 0, 0, .2)
}

.product-grid4 .product-image4 a {
	display: block
}

.product-grid4 .product-image4 img {
	width: 100%;
	height: auto
}

.product-grid4 .pic-1 {
	opacity: 1;
	transition: all .5s ease-out 0s
}

.product-grid4:hover .pic-1 {
	opacity: 0
}

.product-grid4 .pic-2 {
	position: absolute;
	top: 0;
	left: 0;
	opacity: 0;
	transition: all .5s ease-out 0s
}

.product-grid4:hover .pic-2 {
	opacity: 1
}

.product-grid4 .social {
	width: 180px;
	padding: 0;
	margin: 0 auto;
	list-style: none;
	position: absolute;
	right: 0;
	left: 0;
	top: 50%;
	transform: translateY(-50%);
	transition: all .3s ease 0s
}

.product-grid4 .social li {
	display: inline-block;
	opacity: 0;
	transition: all .7s
}

.product-grid4 .social li:nth-child(1) {
	transition-delay: .15s
}

.product-grid4 .social li:nth-child(2) {
	transition-delay: .3s
}

.product-grid4 .social li:nth-child(3) {
	transition-delay: .45s
}

.product-grid4:hover .social li {
	opacity: 1
}

.product-grid4 .social li a {
	color: #222;
	background: #fff;
	font-size: 17px;
	line-height: 36px;
	width: 40px;
	height: 36px;
	border-radius: 2px;
	margin: 0 5px;
	display: block;
	transition: all .3s ease 0s
}

.product-grid4 .social li a:hover {
	color: #fff;
	background: #309f45;
}

.product-grid4 .social li a:after, .product-grid4 .social li a:before {
	content: attr(data-tip);
	color: #fff;
	background-color: #000;
	font-size: 12px;
	line-height: 20px;
	border-radius: 3px;
	padding: 0 5px;
	white-space: nowrap;
	opacity: 0;
	transform: translateX(-50%);
	position: absolute;
	left: 50%;
	top: -30px
}

.product-grid4 .social li a:after {
	content: '';
	height: 15px;
	width: 15px;
	border-radius: 0;
	transform: translateX(-50%) rotate(45deg);
	top: -22px;
	z-index: -1
}

.product-grid4 .social li a:hover:after, .product-grid4 .social li a:hover:before
	{
	opacity: 1
}

.product-grid4 .product-discount-label, .product-grid4 .product-new-label
	{
	color: #fff;
	background-color: #16a085;
	font-size: 13px;
	font-weight: 800;
	text-transform: uppercase;
	line-height: 45px;
	height: 45px;
	width: 45px;
	border-radius: 50%;
	position: absolute;
	left: 10px;
	top: 15px;
	transition: all .3s
}

.product-grid4 .product-discount-label {
	left: auto;
	right: 10px;
	background-color: #d7292a
}

.product-grid4:hover .product-new-label {
	opacity: 0
}

.product-grid4 .product-content {
	padding: 25px
}

.product-grid4 .title {
	font-size: 15px;
	font-weight: 400;
	text-transform: capitalize;
	margin: 0 0 7px;
	transition: all .3s ease 0s
}

.product-grid4 .title a {
	color: #222
}

.product-grid4 .title a:hover {
	color: #16a085
}

.product-grid4 .price {
	color: #16a085;
	font-size: 17px;
	font-weight: 700;
	margin: 0 2px 15px 0;
	display: block
}

.product-grid4 .price span {
	color: #909090;
	font-size: 13px;
	font-weight: 400;
	letter-spacing: 0;
	text-decoration: line-through;
	text-align: left;
	vertical-align: middle;
	display: inline-block
}

.product-grid4 .add-to-cart {
	border: 1px solid #e5e5e5;
	display: inline-block;
	padding: 10px 20px;
	color: #888;
	font-weight: 600;
	font-size: 14px;
	border-radius: 4px;
	transition: all .3s
}

.product-grid4:hover .add-to-cart {
	border: 1px solid transparent;
	background: #16a085;
	color: #fff
}

.product-grid4 .add-to-cart:hover {
	background-color: #505050;
	box-shadow: 0 0 10px rgba(0, 0, 0, .5)
}

@media only screen and (max-width:990px) {
	.product-grid4 {
		margin-bottom: 30px
	}
}
<!--
image




 




grid




 




end




 




-->
</style>
</head>
<body>
	<div class="container">
		<%@ include file="../common/header.jsp"%>
		<main>
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			  <ol class="carousel-indicators">
			    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			  </ol>
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="/sb/resources/images/common/sagoboja_main1.png" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="/sb/resources/images/common/sagoboja_main2.jpg" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="/sb/resources/images/common/sagoboja_main3.jpg" class="d-block w-100" alt="...">
			    </div>
			  </div>
			  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>

			<!-- image grid -->


			<div class="container" style="background: #fff;">
				<br /> <br />
				<h3 class="h3" style="margin-left: 100px; margin-top: 35px;">신상품</h3>

				<div class="row" style="width: 70%; margin-left: auto;">
					<!-- 신상품시작 -->
					<c:forEach var="product" items="${products }">
						<div class="col-md-3 col-sm-6">
							<div class="product-grid4">
								<div class="product-image4">
									<a href="/sb/product/itemDetail?productNo=${product.no }"> <img class="pic-1"
										src="/sb/resources/product/${product.no }.jpg"> <img
										class="pic-2" src="/sb/resources/products/${product.no }.jpg">
									</a>
									<ul class="social">
											<!-- 카트담기로 링크 -->
										<li><a href="/sb/addCart?no=${product.no }" data-tip="Add to Cart"><i
												class="fa fa-shopping-cart"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- 신상품끝 -->
				</div>

				<br /> <br />
			</div>
			<div class="container" style="background: #f4f4f4; padding-bottom:30px;">
				<br /> <br />
				<h3 class="h3" style="margin-left: 100px; margin-top: 35px;">${events[0].title }</h3>
				<div class="row" style="width: 70%; margin-left: auto;">
					<c:forEach var="event" items="${events }" begin="0" end="7">
						<div class="col-md-3 col-sm-6">
							<div class="product-grid4">
								<div class="product-image4">
									<a href="/sb/product/itemDetail?productNo=${event.productNo }"> <img class="pic-1"
										src="/sb/resources/products/${event.productNo }.jpg"> <img
										class="pic-2"
										src="/sb/resources/products/${event.productNo }.jpg"">
									</a>
									<ul class="social">
											<!-- 카트담기로 링크 -->
										<li><a href="/sb/addCart?no=${event.productNo }" data-tip="Add to Cart"><i
												class="fa fa-shopping-cart"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</c:forEach>
					<br />
					<br />
					<br />
				</div>
			</div>
	</div>


	<!-- image grid  end -->
	</main>
	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>