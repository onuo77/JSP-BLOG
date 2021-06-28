<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.main-section1 {
	background: #FFFFFF;
	width: 102%;
	margin: -9 auto;
	padding: 10px;
}

.hedding-title h1 {
	margin: 0px;
	padding: 0px 0px 10px 0px;
	font-size: 25px;
}

.average-rating {
	float: left;
	text-align: center;
	width: 30%;
}

.average-rating h2 {
	margin: 0px;
	font-size: 80px;
}

.average-rating p {
	margin: 0px;
	font-size: 20px;
}

.fa-star, .fa-star-o, .fa-star-half-o {
	color: #FDC91B;
	font-size: 25px !important;
}

.progress, .progress-2, .progress-3, .progress-4, .progress-5 {
	background: #F5F5F5;
	border-radius: 13px;
	height: 18px;
	width: 97%;
	padding: 3px;
	margin: 5px 0px 3px 0px;
}

.progress:after, .progress-2:after, .progress-3:after, .progress-4:after,
	.progress-5:after {
	content: '';
	display: block;
	background: #337AB7;
	width: 80%;
	height: 100%;
	border-radius: 9px;
}

.progress-2:after {
	width: 60%;
}

.progress-3:after {
	width: 40%;
}

.progress-4:after {
	width: 20%;
}

.progress-5:after {
	width: 10%;
}

.loder-ratimg {
	display: inline-block;
	width: 40%;
}

.start-part {
	float: right;
	width: 30%;
	text-align: center;
}

.start-part span {
	color: #337AB7;
	font-size: 23px;
}

.reviews h1 {
	margin: 10px 0px 20px 0px;
}

.user-img img {
	height: 80px;
	width: 80px;
	border: 1px solid blue;
	border-radius: 50%;
}

.user-img-part {
	width: 20%;
	float: left;
}

.user-text {
	float: left;
}

.user-text h4, .user-text p {
	margin: 0px 0px 5px 0px;
}

.user-text p {
	font-size: 20px;
	font-weight: bold;
}

.user-text h4, .user-text span {
	color: #B3B5B4;
	font-size: 13px;
}

.comment {
	width: 75%;
	float: right;
	width:
}
</style>
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
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Barlow+Semi+Condensed"
	rel="stylesheet">
</head>
<body>
	<div class="container">

		<div class="main-section1">
			<div class="rating-part">
				<div style="clear: both;"></div>
				<div class="reviews">
					<h1>Reviews</h1>
				</div>
				
				<c:if test="${not empty LOGIN_USER}">
				<form class="row justify-content-center mb-5 position-relative" action="/sb/product/itemDetail" method="post">
				<input type="hidden" name="no" value="${product.no }">
				 
				 <div class="col-1 p-0">
					 <select name="opt" style="width:100%;">
						<option value="5" selected> 5</option>
						<option value="4" > 4</option>
						<option value="3" > 3</option>
						<option value="2" > 2</option>
						<option value="1" > 1</option>
					 </select>
				 </div>
				 
				 <div class="col-9">
				 	<textarea rows="3" style="width:100%; border-radius: 5px; border: 1px solid #ddd;" name="comment"></textarea>
				 </div>
				 
				 <div class="col-1 p-0 align-bottom">
				 	<button class="btn btn-outline-secondary w-100 position-absolute" style="bottom:6px;" type="submit">등록</button>
				 </div>
				 
				</form>
				</c:if>
				
				
				<div class="comment-part">
					<c:forEach var="review" items="${reviews }">
					
					<div class="user-img-part">
						<div class="user-text">
							<p>${review.userId }</p>
							<h4><fmt:formatDate value="${review.createdDate }" pattern="yyyy.MM.dd"/></h4>
						</div>
						<div style="clear: both;"></div>
					</div>
					<div class="comment">
					<c:choose>
					<c:when test="${review.rating eq 5 }">
						<i aria-hidden="true" class="fa fa-star"></i> 
						<i aria-hidden="true" class="fa fa-star"></i>
						<i aria-hidden="true" class="fa fa-star"></i>
						<i aria-hidden="true" class="fa fa-star"></i>
						<i aria-hidden="true" class="fa fa-star"></i>
					</c:when>
					<c:when test="${review.rating eq 4 }">
						<i aria-hidden="true" class="fa fa-star"></i> 
						<i aria-hidden="true" class="fa fa-star"></i>
						<i aria-hidden="true" class="fa fa-star"></i>
						<i aria-hidden="true" class="fa fa-star"></i>
						<i aria-hidden="true" class="fa fa-star-o"></i>
					</c:when>
					<c:when test="${review.rating eq 3 }">
						<i aria-hidden="true" class="fa fa-star"></i> 
						<i aria-hidden="true" class="fa fa-star"></i>
						<i aria-hidden="true" class="fa fa-star"></i>
						<i aria-hidden="true" class="fa fa-star-o"></i>
						<i aria-hidden="true" class="fa fa-star-o"></i>
					</c:when>
					<c:when test="${review.rating eq 2 }">
						<i aria-hidden="true" class="fa fa-star"></i> 
						<i aria-hidden="true" class="fa fa-star"></i>
						<i aria-hidden="true" class="fa fa-star-o"></i>
						<i aria-hidden="true" class="fa fa-star-o"></i>
						<i aria-hidden="true" class="fa fa-star-o"></i>
					</c:when>
					<c:otherwise>
						<i aria-hidden="true" class="fa fa-star"></i> 
						<i aria-hidden="true" class="fa fa-star-o"></i>
						<i aria-hidden="true" class="fa fa-star-o"></i>
						<i aria-hidden="true" class="fa fa-star-o"></i>
						<i aria-hidden="true" class="fa fa-star-o"></i>
					</c:otherwise>	
					</c:choose>
						<div style="display: inline;">
							<div style='float: right;'>
								<a href="/sb/product/itemReviewDelete?reviewNo=${review.no }"><button type="button" class="btn btn-danger">삭제</button></a>
							</div>
						</div>
						<p>${review.content }</p>
					</div>
					
					
					<div style="clear: both;"></div>
					</c:forEach>
				</div>
				
				</div>
			</div>
		</div>
</html>


</div>
</body>
</html>