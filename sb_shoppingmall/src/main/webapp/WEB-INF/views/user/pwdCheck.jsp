<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<h4 class="mt-5 font-weight-bold">내 정보 수정</h4>
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
			<div class="col-9 mb-5">
				<form id="form-password-check" action="check" method="post" class="border p-3 bg-light">
					<c:choose>
						<c:when test="${param.fail eq 'invaild'}">
							<div class="row mt-5">
								<div class="col-6 offset-3">
									<div class="alert alert-danger">
										<strong>로그인 실패</strong> 비밀번호가 일치하지 않습니다.
									</div>
								</div>
							</div>
						</c:when>
					</c:choose>
					<h6 class="mt-5" align="center">내 정보수정을 위해서는 비밀번호 확인이 필요합니다.</h6>
					<div class="col-6 offset-3 mt-3">
						<input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호">
						<input type="hidden" name="job" value="${param.job}" />
					</div>
					<div class="col-6 offset-3 mt-3 mb-5">
						<button type="button" class="btn btn-success btn-block" onclick="check()">비밀번호 확인</button>
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
	function check() {
		var pwdEl = document.getElementById("pwd");
		if (!pwdEl.value.trim()) {
			alert("비밀번호는 필수입력값입니다.");
			pwdEl.focus();
			return false;
		}
		
		document.getElementById("form-password-check").submit();
	}
</script>
</body>
</html>