<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>SAGOBOJA</title>
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
			<h4 class="mt-5 font-weight-bold">회원정보 수정</h4>
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

				<div class="col-9 border p-3 bg-light">
					<form class="modify-form" action="modify" method="post">
						<h5 class="mb-5 font-weight-bold">필수 입력 정보</h5>
						<div class="row mb-3">
							<label for="id" class="col-sm-3 col-form-label">아이디</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="id" name="id" value="${LOGIN_USER.id }" disabled>
							</div>
						</div>
											
						<div class="row mb-3">
							<label for="name" class="col-sm-3 col-form-label">이름</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="name" name="name" value="${LOGIN_USER.name } " readonly>
							</div>
						</div>
						<div class="row mb-3">
							<label for="email" class="col-sm-3 col-form-label">이메일</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="email" name="email" value="${LOGIN_USER.email }">
							</div>
						</div>
						<div class="row mb-3">
							<label for="phone" class="col-sm-3 col-form-label">전화번호</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="phone" name="phone" value="${LOGIN_USER.phone }">
							</div>
						</div>
						<div class="row mb-3">
							<label for="address" class="col-sm-3 col-form-label">주소</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="address" name="address" value="${LOGIN_USER.address }">
							</div>
						</div>
				
					<div class="mt-5 text-right">
						<button type="submit" class="btn btn-success" onclick="modify()">수정</button>
					</div>	
					</form>
				</div>

		</div>
	</main>
	<footer>
		<%@ include file="../../common/footer.jsp"%>
	</footer>
</div>
<script type="text/javascript">
	function modify() {
		alert("회원정보 수정이 완료되었습니다.");
		document.getElementById("modify-form").submit();
	}
</script>
</body>
</html>