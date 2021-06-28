<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>SAGOBOJA :: 회원가입</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
	<img src="/sb/resources/images/common/sagoboja_logo.png"
		style="margin-left: 45%; width: 100px; margin-bottom: 30px; margin-top: 50px;">
	<div class="mx-auto" style="width: 200px;">
		<h3 class="mt-2 font-weight-bold">회원가입</h3>
	</div>
	<div class="row">
		<div class="col-12">
				<div class="mt-5">
					<form id="register-form" action="register" method="post"
						class="border p-3 bg-light">
						<h5 class="mb-5 font-weight-bold">필수 입력 정보</h5>
						<div class="row mb-3">
							<label for="id" class="col-sm-3 col-form-label">아이디</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="user-id" name="id">
							</div>
						</div>
						<div class="row mb-3">
							<label for="pwd" class="col-sm-3 col-form-label">비밀번호</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="user-pwd"
									name="pwd">
							</div>
						</div>
						<div class="row mb-3">
							<label for="confirmPwd" class="col-sm-3 col-form-label">비밀번호확인</label>
							<div class="col-sm-9">
								<input type="password" class="form-control"
									id="user-pwd-confirm" name="pwdConfirm">
							</div>
						</div>
						<div class="row mb-3">
							<label for="name" class="col-sm-3 col-form-label">이름</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="user-name"
									name="name">
							</div>
						</div>
						<div class="row mb-3">
							<label for="email" class="col-sm-3 col-form-label">이메일</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="user-email"
									name="email">
							</div>
							
						</div>
						<div class="row mb-3">
							<label for="phone" class="col-sm-3 col-form-label">전화번호</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="user-phone" name="phone">
							</div>
						</div>
						<div class="row mb-3">
							<label for="address" class="col-sm-3 col-form-label">주소</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="user-address" name="address">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="mt-5">
			<div class="text-right">
				<a href="/sb/index" class="btn btn-outline-secondary">취소</a>
				<button type="button" class="btn btn-success" onclick="checkForm()">회원가입</button>
			</div>
		</div>
	</div>
<script type="text/javascript">
	function checkForm() {
		var userIdEl = document.getElementById("user-id");	
		if (!userIdEl.value.trim()) {	
			alert("아이디는 필수입력값입니다.");
			userIdEl.focus();
			return;
		}
		if (userIdEl.value.trim().length < 4) {
			alert("아이디는 4글자 이상 입력해야합니다.")
			userIdEl.focus();
			return;
		}
		if (!/^[a-zA-Z0-9]+$/.test(userIdEl.value.trim())) {
	       alert("아이디는 영어대소문자, 숫자만 허용됩니다.");  
			userIdEl.focus();
			return;
	    }
		
		var passwordEl = document.getElementById("user-pwd");
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
		var passwordConfirmEl = document.getElementById("user-pwd-confirm");
		if (passwordEl.value != passwordConfirmEl.value) {
			alert("비밀번호가 서로 일치하지 않습니다.")
			passwordConfirmEl.value="";
			passwordConfirmEl.focus();
			return;
		}
		document.getElementById("register-form").submit();
	}
</script>
</body>
</html>