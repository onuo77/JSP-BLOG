<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>SAGOBOJA :: 로그인</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<main>
		<img src="/sb/resources/images/common/sagoboja_logo.png"
		style="margin-left: 45%; width: 100px; margin-bottom: 30px; margin-top: 50px;">
		<div class="row mx-auto" style="width: 100px;">
			<h3 class="mt-2 font-weight-bold">로그인</h3>
		</div>
		<c:choose>
			<c:when test="${param.fail eq 'invalid' }">
				<div class="row mt-5">
					<div class="col-6 offset-3">
						<div class="alert alert-danger">
							<strong>로그인 실패</strong> 아이디 혹은 비밀번호가 올바르지 않습니다.
						</div>
					</div>
				</div>
			</c:when>
			<c:when test="${param.fail eq 'out' }">
				<div class="row mt-5">
					<div class="col-6 offset-3">
						<div class="alert alert-danger">
							<strong>로그인 실패</strong> 이미 탈퇴한 회원입니다.
						</div>
					</div>
				</div>
			</c:when>
		</c:choose>
		<div class="row mt-5">
			<div class="col-6 offset-3">
				<div class="border p-2 border p-3 bg-light" style="padding:30px;">
					<form method="post" id="login-form" action="/sb/login">
						<div class="mb-3">
							<input type="text" class="form-control" id="id" name="id" placeholder="아이디" />
						</div>
						<div class="mb-3">
							<input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호" />
						</div>
						<div class="mt-3 form-group">
							<button type="button" class="btn btn-success btn-block" onclick="formSubmit()">로그인</button>
						</div>
						<br /> 
						<h6 align="center">아직도 SAGOBOJA의 회원이 아니세요?</h6>
						<div class="form-group">
							<a href="/sb/register" class="btn btn-outline-secondary btn-block">회원가입</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
		
</div>  
<script type="text/javascript">
	function formSubmit() {
		var idEl = document.getElementById("id");
		if (!idEl.value.trim()) {
			alert("아이디는 필수입력값입니다.");
			idEl.focus()
			return false;
		}
		var passwordEl = document.getElementById("pwd");
		if (!passwordEl.value.trim()) {
			alert("비밀번호는 필수입력값입니다.");
			passwordEl.focus();
			return false;
		}
		
		document.getElementById("login-form").submit();
	}
</script>
</body>
</html>