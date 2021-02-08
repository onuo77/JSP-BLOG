<%@page import="com.blog.domain.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../layout/header.jsp" %>
<br/>
<div class="container">
	<form action="/jspblog/board?cmd=save" method="post">
	<input type="hidden" name="userId" value="${sessionScope.principal.id}">
		<div class="form-group">
			<label for="title">TITLE : </label>
			<input type ="text" class="form-control" placeholder="Title.." id="title" name="title">
		</div>
		
		<div>
			<label for="content">CONTENT : </label>
			<textarea id="summernote" class="form=control" rows="5" id="content" name="content"></textarea>
		</div>
		<br/>
		<button type="submit" class="btn btn-primary">WRITE</button>
	</form>
</div>

<script>

	  $('#summernote').summernote({
	        placeholder: 'Write..',
	        tabsize: 2,
	        height: 400,
	      });
	  
  

</script>

</body>
</html>