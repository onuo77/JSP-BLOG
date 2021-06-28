<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	<div class="container-fluid h-100">
		<%@include file="/WEB-INF/common/adminHeader.jsp" %>
		<div class="row h-100">
		<%@include file="/WEB-INF/common/adminAside.jsp" %>
			<div class="col-10 h-100 side-content">
			
				<h3 class="pt-4 pl-4">기획전 수정</h3>
				
				<div class="row justify-content-center mt-5">
					<div class="col-10">
						<!--폼시작  -->
						<form action="/sb/eventmodify?eventNo=${eventInfo.no }" method="post" enctype="multipart/form-data">
							<div class="form-group">
							    <label>기획전 제목</label>
							    <input type="text" class="form-control" id="event-title" name="title" value="${eventInfo.title}" required/>
							</div>
							<div class="form-group">
							    <label>기획전 내용</label>
							    <input type="text" class="form-control" placeholder="Enter Content" id="event-title" name="content" value="${eventInfo.content}" required/>
							</div>
							<div class="form-group">
							    <label>기획전 시작일</label>
							    <input type="datetime-local" class="form-control" id="start-date" name="startDate" value="${startDate}" required onchange="checkDate()"/>
							</div>
							<div class="form-group">
							    <label>기획전 종료일</label>
							    <input type="datetime-local" class="form-control" id="end-date" name="endDate" value="${endDate}" required onchange="checkDate()"/>
							</div>
							<div class="form-group">
							    <label>기획전 썸네일<span style="font-size:12px;"> (권장사이즈 1000*300px / jpg, png, gif 파일만 업로드 하세요)</span></label>
							  	<div class="input-group mb-3">
									<input type="file" class="form-control" id="event-thum" name="newEventThum" accept="image/jpeg, image/png, image/gif" style="padding:3px;" required>
								</div>
							</div>
							<div class="form-group">
							    <label>기획전 상품 선택</label><br/>
								
								<!-- 상품 카테고리 -->
								<div class="border w-100 rounded p-3" style="background-color:rgba(0, 0, 0, 0);">
								<c:forEach var="category" items="${category }">
				                     <div class="form-check" style="display:inline-block; width:19%;">
				                          <input class="form-check-input" type="checkbox" name="cartegory" value="${category.no }" id="categories-${category.no }" onclick="toggleCategory(${category.no })">
				                          <label class="form-check-label" for="inlineRadio1" onclick="toggleCategory(${category.no })">${category.name }</label>
				                     </div>			                     
								</c:forEach>
				                </div>
				                <!-- 상품 카테고리 끝 -->
				                
				                <!-- 카테고리 안의 상품 시작 -->
				                <!-- 카테고리1 -->
								<div class="border p-3 bg-light w-100 mt-2 rounded chkbox" id="category-1" style="display: none;">
									<h6 class="bg-success p-1 text-white text-center rounded">농수축산</h6>
									<c:forEach var="product" items="${products1}">
						                     <div class="form-check form-check-inline" style="width:15%;">
						                          <input class="form-check-input" type="checkbox" name="check-product" value="${product.productNo }" ${product.checked eq 'Y' ? 'checked' : '' } id="product-${product.productNo }">
					                          		<label class="form-check-label" for="inlineRadio1" onclick="selectProductCheckbox(${product.productNo })">${product.productName }</label>
						                     </div>
									</c:forEach>
				                </div>
				                <!-- 카테고리1 끝-->		
				                						
				                <!-- 카테고리2 -->
								<div class="border p-3 bg-light w-100 mt-2 rounded chkbox" id="category-2" style="display: none;">
									<h6 class="bg-success p-1 text-white text-center rounded">가공식품</h6>
									<c:forEach var="product" items="${products2 }">
					                     <div class="form-check form-check-inline" style="width:15%;">
					                           <input class="form-check-input" type="checkbox" name="check-product" value="${product.productNo }" ${product.checked eq 'Y' ? 'checked' : '' } id="product-${product.productNo }">
					                          <label class="form-check-label" for="inlineRadio1" onclick="selectProductCheckbox(${product.productNo })">${product.productName }</label>
					                     </div>
									</c:forEach>
				                </div>
				                <!-- 카테고리2 끝-->								
				                						
				                <!-- 카테고리3 -->
								<div class="border p-3 bg-light w-100 mt-2 rounded chkbox" id="category-3" style="display: none;">
									<h6 class="bg-success p-1 text-white text-center rounded">주방조리용품</h6>
									<c:forEach var="product" items="${products3 }">
					                     <div class="form-check form-check-inline" style="width:15%;">
					                          <input class="form-check-input" type="checkbox" name="check-product" value="${product.productNo }" ${product.checked eq 'Y' ? 'checked' : '' } id="product-${product.productNo }">
					                          <label class="form-check-label" for="inlineRadio1" onclick="selectProductCheckbox(${product.productNo })">${product.productName }</label>
					                     </div>
									</c:forEach>
				                </div>
				                <!-- 카테고리3 끝-->								
				                						
				                <!-- 카테고리4 -->
								<div class="border p-3 bg-light w-100 mt-2 rounded chkbox" id="category-4" style="display: none;">
									<h6 class="bg-success p-1 text-white text-center rounded">생활용품</h6>
									<c:forEach var="product" items="${products4 }">
					                     <div class="form-check form-check-inline" style="width:15%;">
					                          <input class="form-check-input" type="checkbox" name="check-product" value="${product.productNo }" ${product.checked eq 'Y' ? 'checked' : '' } id="product-${product.productNo }">
					                          <label class="form-check-label" for="inlineRadio1" onclick="selectProductCheckbox(${product.productNo })">${product.productName }</label>
					                     </div>
									</c:forEach>
				                </div>
				                <!-- 카테고리4 끝-->								
				                						
				                <!-- 카테고리5 -->
								<div class="border p-3 bg-light w-100 mt-2 rounded chkbox" id="category-5" style="display: none;">
									<h6 class="bg-success p-1 text-white text-center rounded">대용량/박스상품</h6>
									<c:forEach var="product" items="${products5 }">
					                     <div class="form-check form-check-inline" style="width:15%;">
					                          <input class="form-check-input" type="checkbox" name="check-product" value="${product.productNo }" ${product.checked eq 'Y' ? 'checked' : '' } id="product-${product.productNo }">
					                          <label class="form-check-label" for="inlineRadio1" onclick="selectProductCheckbox(${product.productNo })">${product.productName }</label>
					                     </div>
									</c:forEach>
				                </div>
				                <!-- 카테고리5 끝-->								
										                	                
							</div>
							<div class="float-right mb-3 mt-2">
								<button type="reset" class="btn btn-outline-danger mr-1">취소</button>
								<button type="submit" class="btn btn-success" onclick="checkform()">올리기</button>
							</div>
						</form>
						<!--폼끝 -->
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	
<script type="text/javascript">
	

	//카테고리 선택 시 체크박스 보이기
	function toggleCategory(no){
		var box = document.getElementById("category-" + no);
		var chkbox = document.getElementById("categories-"+no);
		
		if (box.style.display) {
			box.style.display = ''
			box.checked = true;
			chkbox.checked = true;
		} else {
			box.style.display = 'none'
			box.checked = false
			chkbox.checked = false;
			clearAllChecked("#category-" + no);	
		}
	}
	
	function clearAllChecked(id) {
		var checkboxes = document.querySelectorAll(id + " [name='check-product']");
		for (var i=0; i<checkboxes.length; i++) {
			checkboxes[i].checked = false;
		}
	}
	
	//등록할 상품 선택했는지 체크하기
	function checkform(){
		var chkboxes = document.querySelectorAll("input[name='check-product']");
		var isChecked = false;
		for(var i=0; i<chkboxes.length; i++){
			var chkbox = chkboxes[i];
			if(chkbox.checked){
				isChecked = true;
				break;
			}
		}
		if(!isChecked){
			alert("상품을 하나 이상 선택하세요.");
			return;
		}
	}
	
	//상품 글자를 눌렀을 때 체크되도록 하기
	function selectProductCheckbox(no){
		var chkboxLabel = document.getElementById("product-"+no);
		chkboxLabel.checked = !chkboxLabel.checked;
	}
	
	//시작일 - 현재 날짜, 시간을 기본값 설정 및 이전날짜 선택 못하게 하기
	var offset = new Date().getTimezoneOffset() * 60000;
	document.getElementById("start-date").min = new Date(Date.now()-offset).toISOString().slice(0, 16);
	document.getElementById("start-date").value = new Date(Date.now()-offset).toISOString().slice(0, 16);
	
	//종료일 - 현재 이전날짜 선택 못하게 하기
	document.getElementById("end-date").min = new Date(Date.now()-offset).toISOString().slice(0, 16);
	
	function checkDate(){
		
		var startDate = (document.getElementById("start-date").value).substring(0, 10);
		var endDate = (document.getElementById("end-date").value).substring(0, 10);
		
		var startDateArr = startDate.split('-');
		var endDateArr = endDate.split('-');
		
		var stDtCheck = new Date(startDateArr[0],startDateArr[1],startDateArr[2]);
		var edDtCheck = new Date(endDateArr[0],endDateArr[1],endDateArr[2]);
		
		if(stDtCheck.getTime() > edDtCheck.getTime()){
			alert('시작일은 종료일보다 이전이어야 합니다.');
			document.getElementById("start-date").value = "";
			document.getElementById("start-date").focus();
			return false;
		}
		
	}	
</script>	
</body>
</html>