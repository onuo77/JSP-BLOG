<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/layout/header.jsp" %>


<br/>
<div class="container">

	<div class="m-2">
		<form class="form-inline d-flex justify-content-end" action="/jspblog/board?cmd=search">
		<input type="hidden" name="cmd" value="search" />
		<input type="hidden" name="page" value="0"/>
		
		<input type="text" name="keyword" class="form-control mr-sm-2 searchbox" placeholder="Search..">
		<button class="btn btn-primary m-1">SEARCH</button>		
		</form>
	</div>

	<div class="progress col-md-12 m-2">
		<div class="progress-bar" style="width:${currentPosition}%"></div>
	</div>

	<c:forEach var="board" items="${boardList}" >
	
		<div class="card col-md-12 m-2">
			<div class="card-body">
				<h4 class="card-title">${board.title}</h4>
				<a href="/jspblog/board?cmd=detail&boardId=${board.id}" class="btn btn-primary">Detail</a>
			</div>
		</div>
	</c:forEach>

	<br />
	<ul class="pagination justify-content-center">
		<c:choose>
			<c:when test="${param.page eq 0}">
				<li class="page-item disabled"><a class="page-link" href="#">Prev</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link" href="/jspblog/board?cmd=list&page=${param.page-1}">Prev</a></li>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${param.page eq lastPage}">
				<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link" href="/jspblog/board?cmd=list&page=${param.page+1}">Next</a></li>
			</c:otherwise>
		</c:choose>		
	</ul>

</div>
</body>
</html>