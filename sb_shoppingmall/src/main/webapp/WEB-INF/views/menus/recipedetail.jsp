<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Bootstrap 4 Example</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
 	
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://localhost/sb/resources/splide-2.4.21/dist/css/splide.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="http://localhost/sb/resources/splide-2.4.21/dist/js/splide.min.js"></script>
</head>
<style>
	.image-box {
	position: relative;
	width: 100%;
	overflow: hidden;
	}
	h1{
		text-align: center;
	}
	ul{
		list-style:none;
		padding-left:0px;
	}
#item{
	width: 270px;
	height: 320px;
	float: left;
	overflow: hidden;
	text-align: center;
	margin: 3px
}

#item-name{
	font-weight: bold;
	font-size: 20px;
	color: black;
	margin-top: 5px;
}
#item-price{
	font-weight: bold;
	color: #32a852;
}
#item-thumbnail{
	width: 260px;
	height: 260px;
	object-fit:cover;
}
#item-box{
	position: relative;
}
#hover-box{
	position: absolute;
	right: 7%; top: -15%;
}

</style>
<body>
<div class="container">
<%@ include file="../../common/header.jsp" %><!-- 여기 절대경로로 이렇게 써도 되나...? -->
	<main>
		<!-- 레시피 정보 시작 -->
		<div class="row">
			<div class="col-12 mb-5">
				<div style="padding-top: 50px; text-weight: bold;">
					<h1 class="display-4">SB's Recipe</h1>
					<h1 class="display-4">${recipe.title }</h1>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12 mb-5">
				<div class="image-box">
					<img style="width:100%; height: auto;" src="../../resources/recipe/${recipe.fileName }"/>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12 mb-5">
				<h4>재료</h4>
				<p>${recipe.ingredient }</p>
			</div>
		</div>
		<div class="row mb-5">
			<div class="col-12">
				<h4>HOW TO</h4>
				<p>${recipe.contentWithBr }</p>
			</div>
		</div>
				<div class="splide" data-splide='{"type":"loop","perPage":4, "perMove": 4}'>
					<div class="splide__track">
						<div class="splide__list">
							<c:forEach var="item" items="${recipeItems }">
								<div class="splide__slide">
					        	  <a href="/sb/product/itemDetail?productNo=${item.no }">
					        		<ul id="item">
										<li><img class="item-box" id="item-thumbnail" src="../../resources/product/${item.no}.jpg"></li>
										<li id="item-name">${item.name }/${item.producer }</li>
										<li id="item-price">${item.price }</li>
									</ul>
								  </a>
									<div id="hover-box" class="hover-box" style="max-width:100%;">
										<button type="button" style="margin:0px;"class="btn btn-success" onclick="location.href='/sb/addCart?no=${item.no}'"><i class="fas fa-cart-arrow-down"></i></button>
									</div>	
								</div>	
					        </c:forEach>
						</div>
					</div>
				</div>
		<!-- 레시피 정보 끝 -->
		<!-- 카트에 전체 담기 -->		
	    <div class="row" style="margin:0px;">
	    	<div class="col-12">
	    		<div class="wrapper" style="text-align: center;">
	    			<a href="./addcart?no=${recipe.no}"><button type="button" style="display: inline-block;" class="btn btn-primary align-center">전체담기</button></a>
	    		</div>
	    	</div>
	    </div>
	    <!-- 카트감기 끝 -->
	    <div class="row">
	    	<div class="col-12" style="padding:40px;">
	    		<a href="../recipe"><button type="button" class="btn btn-success float-right">목록으로</button></a>
	    	</div>
	    </div>
	</main>
<%@ include file="../../common/footer.jsp" %>
</div>
<script type="text/javascript">
new Splide( '.splide' ).mount();

$(".splide__slide").hover(function() {
		$(this).find(".hover-box").animate({ "top": "4%" }, "slow" );
	}, function() {
		$(this).find(".hover-box").animate({ "top": "-15%" }, "slow" );
		
	});
</script>
</body>
</html>
