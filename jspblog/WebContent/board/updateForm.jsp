<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>
<br/>
<div class="container">
	<form action="/jspblog/board?cmd=update" method="post">
		<input type="hidden" name="boardId" value="${board.id}"/>
		<div class="form-group">
			<label for="title">TITLE : </label>
			<input type="text" class="form-control" placeholder="title" id="title" name="title" value="${board.title }">
		</div>
		
		<div class="form-group">
			<label for="content">CONTENT : </label>
			<textarea id="summernote" class="form-control" rows="5" id="content" name="content">
				${board.content }
			</textarea>
		</div>
		
		<button type="submit" class="btn btn-primary">MODIFY</button>
	</form>
</div>

<script>
	$('#summernote').summernote({
		placeholder:'content..',
		tabsize:2,
		height:400
	});
</script>

</body>
</html>