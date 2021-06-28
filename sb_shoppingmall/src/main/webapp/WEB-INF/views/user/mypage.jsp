<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>SAGOBOJA :: 마이페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<%@ include file="../../common/header.jsp" %>
	<main>
		<div class="row mx-auto" style="width: 200px;">
			<h4 class="mt-5 font-weight-bold">마이페이지</h4>
		</div>
		<div class="row mt-3">
			<div class="col-3">
				<nav class="navbar bg-light">
				  <ul class="navbar-nav">
				  	<h6 class="mb-1 font-weight-bold">내 정보 수정</h6>
				    <li class="nav-item" style="margin-left:20px">
				      <a class="nav-link" href="/sb/check?job=modify">회원정보 수정</a>
				    </li>
				    <li class="nav-item" style="margin-left:20px">
				      <a class="nav-link" href="/sb/check?job=change">비밀번호 변경</a>
				    </li>
				    <li class="nav-item" style="margin-left:20px">
				      <a class="nav-link" href="/sb/check?job=exit">회원탈퇴</a>
				    </li>
				  </ul>
				
				</nav>
			</div>
			<div class="col-9">
				<form action="mypage" method="post" class="border p-3 bg-light">
				<h6 class="font-weight-bold">마이페이지</h6>
				</form>
			</div>
		</div>
	</main>
	<footer>
		<%@ include file="../../common/footer.jsp"%>
	</footer>
</div>

</body>
</html>