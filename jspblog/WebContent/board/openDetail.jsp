<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../layout/header.jsp" %>
<br/>
<br/>
<input type="hidden" id="loginUserId" value="${sessionScope.principal.id }"/>
<div class="container"> 

	<c:if test="${sessionScope.principal.id == board.userId}">
		<button class="btn " onclick="deleteById(${board.id})" style="float:right; padding:5px; font-size:10px;">DELETE</button>
		<a href="/jspblog/board?cmd=updateForm&boardId=${board.id}"  class="btn " style="float:right; padding:5px; font-size:10px; margin-right:5px;">
		MODIFY</a>
	</c:if>

	<h6 class="m-2" style="text-align:right; font-size:10px; clear:both;">
		<br/>
		글번호 : <i>${board.id}</i> &nbsp;&nbsp;
		작성자 : <i>${board.username}</i> &nbsp;&nbsp;
		조회수 : <i>${board.readCount}</i>&nbsp;&nbsp;
		작성일 : <i>${board.createDate}</i>
	</h6>
	
	<hr/>
	
	<h3 class="m-2">
		${board.title}
	</h3>

	<div class="form-group">
		<div class="m-2">${board.content}</div> 
	</div>
	
	<hr/>
	
	<!-- comment box-->
	<div class="row bootstrap sinppets">
		<div class="col-md-12">
			<div class="comment-wrapper">
				<div class="panel panel-info">
					<div class="panel-heading m-2"><b>COMMENT</b></div>
					<div class="panel-body">
					
						<textarea id="reply__write__form" name="content" class="form-control" placeholder="Write a comment.." rows="2" required></textarea>
						<br/>
						<button onclick="replySave(${sessionScope.principal.id},${board.id })" class="btn btn-primary pull-right" style="float:right;">COMMENT</button>
						<div class="clearfix"></div>
						
						<hr/>
						
						<!-- comment list -->
						<ul id="reply__list" class="media-list">
							<!-- comment item -->
							<c:forEach var="reply" items="${replyList }">
								<li id="reply-${reply.id }" class="media">
									<div class="media-body">
										<strong class="text-primary">${reply.username }</strong>
										<p>
											${reply.content }
										</p>
									</div>
									<div class="m-2">
										<c:if test="${sessionScope.principal.id == reply.userId }">
											<i onclick="deleteReply(${reply.id})" class="material-icons">DELETE</i>
										</c:if>
									</div>
								</li>
							</c:forEach>
						</ul> <!-- comment list end -->
					</div>
				</div>
			</div>
		</div>
	</div> <!-- comment box end -->
	
</div>

<script src="/jspblog/js/boardDetail.js"></script>


</body>
</html>