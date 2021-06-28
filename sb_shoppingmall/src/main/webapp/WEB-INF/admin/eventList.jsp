<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  	<title>SAGOBOJA ADMIN</title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="resources/css/admin.css">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>
<body>
	<c:set var="menu" value="EVENTLIST"/>

	<div class="container-fluid h-100 overflow-hidden">
		<%@include file="/WEB-INF/common/adminHeader.jsp" %>
		<div class="row h-100">
			<%@include file="/WEB-INF/common/adminAside.jsp" %>
			<div class="col-10 h-100 side-content">
			
				<h3 class="pt-4 pl-4">기획전 조회</h3>
				<!-- 리스트시작 -->
				<div class="row justify-content-center">
					<div class="col-10 table-hover text-center">
						<table class="table mt-5">
							<colgroup>
								<col width="7%"/>
								<col width="23%"/>
								<col width="25%"/>
								<col width="15%"/>
								<col width="15%"/>
								<col width="15%"/>
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>썸네일</th>
									<th>기획전명</th>
									<th>시작일</th>
									<th>종료일</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty events }">
										<tr>
											<td colspan="6">등록된 기획전이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="event" items="${events }" varStatus="loop">
											<tr>
												<td class="align-middle">${(pagination.pageNo-1)*5+loop.count}</td>
												<td><img src="resources/event/${event.fileName }" width="200px" height="55px"></td>
												<td class="align-middle"><a href="/sb/adminEventDetail?eventNo=${event.no }&page=${pagination.pageNo}" class="text-body">${event.title }</a></td>
												<td class="align-middle"><fmt:formatDate value="${event.startDate }" pattern="yyyy-MM-dd HH:mm"/> </td>
												<td class="align-middle"><fmt:formatDate value="${event.endDate }" pattern="yyyy-MM-dd HH:mm"/></td>
												<td class="align-middle">
													<a href="/sb/eventmodify?eventNo=${event.no}" class="btn btn-outline-warning">수정</a>
													<a href="/sb/eventdelete?eventNo=${event.no}" class="btn btn-outline-danger">삭제</a>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>																
							</tbody>
						</table>
					</div>
				</div>
				<!-- 리스트끝  -->
				
				<!-- 페이지번호 시작 -->
				<c:if test="${pagination.totalRows gt 0 }">
					<div class="row mb-2">
						<div class="col-12">
							<ul class="pagination justify-content-center">
								<li class="page-item ${pagination.pageNo le 1 ? 'disabled' : ''}">
									<a class="page-link text-body" href="adminEvents?page=${pagination.pageNo - 1 }">이전</a>
								</li>
								<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
									<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
										<a class="page-link text-body" href="adminEvents?page=${num }">${num }</a>
									</li>
								</c:forEach>
								<li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : ''}">
									<a class="page-link text-body" href="adminEvents?page=${pagination.pageNo + 1 }">다음</a>
								</li>
							</ul>
						</div>
					</div>
				</c:if>
				<!-- 페이지번호 끝 -->
				
			</div>
		</div>
	</div>	
</body>
</html>