<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<br/>
<br/>
<div class="container">
	<form action="/jspblog/user?cmd=update" method="post" onsubmit="return valid()">
		<input type="hidden" name="userId" value="${sessionScope.principal.id }">
		
		<div class="form-group">
			<input type="text" name="username" id="username" class="form-control" value="${sessionScope.principal.username }" required readonly/>
		</div>	
		
		<div class="form-group">
			<input type="password" name="password" class="form-control" placeholder="Enter Password" required/>
		</div>
		
		<div class="form-group">
			<input type="email" name="email" class="form-control" placeholder="Enter Email" value="${sessionScope.principal.email }" required/>
		</div>
		
		<div class="form-group">
			<input type="text" name="address" id="address" class="form-control" placeholder="Enter Address" value="${sessionScope.principal.address }" required/>
		</div>
		
		<br/>
		
		<button type="submit" class="btn btn-primary">MODIFY</button>
		
	</form>
</div>
</body>
</html>