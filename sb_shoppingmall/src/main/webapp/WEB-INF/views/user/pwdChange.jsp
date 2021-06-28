<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.sb.dao.UserDao" %>
<%@ page import="com.sb.vo.User" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>SAGOBOJA :: 내 정보 수정</title>
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
			<h4 class="mt-5 font-weight-bold">비밀번호 변경</h4>
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
				<form id="change-form" action="change" method="post">
					<div class="row mb-3">
						<label for="id" class="col-sm-3 col-form-label">새 비밀번호 입력</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="new-pwd" name="newPwd"  >
							</div>
					</div>					
					<div class="row mb-3">
						<label for="name" class="col-sm-3 col-form-label">비밀번호 확인</label>
						<div class="col-sm-9">
							<input type="password" class="form-control" id="new-pwd-confirm" name="newPwdConfirm ">
						</div>
					</div>
				</form>
				<div class="mt-5 text-right">
					<button type="submit" class="btn btn-success" onclick="checkForm()">수정</button>
				</div>	
			</div>
		</div>

		<script type="text/javascript">
	function checkForm() {
		var passwordEl = document.getElementById("new-pwd");
		if (!passwordEl.value.trim()) {	
			alert("비밀번호는 필수입력값입니다.");
			passwordEl.focus();
			return;
		}
		if (passwordEl.value.trim().length < 6) {
			alert("비밀번호는 6글자 이상 입력해야합니다.")
			passwordEl.focus();
			return;
		}
		var passwordConfirmEl = document.getElementById("new-pwd-confirm");
		if (passwordEl.value != passwordConfirmEl.value) {
			alert("비밀번호가 서로 일치하지 않습니다.")
			passwordConfirmEl.value="";
			passwordConfirmEl.focus();
			return;
		}
		alert("비밀번호 변경이 완료되었습니다.");
		document.getElementById("change-form").submit();
	}
</script>
	</main>
	<footer>
		<%@ include file="../../common/footer.jsp"%>
	</footer>
</div>

</body>
</html>