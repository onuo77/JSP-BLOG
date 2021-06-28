<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<c:set var="menu" value="RECIPEFORM"/>

	<div class="container-fluid h-100">
		<%@include file="/WEB-INF/common/adminHeader.jsp" %>
		<div class="row h-100">
		<%@include file="/WEB-INF/common/adminAside.jsp" %>
			<div class="col-10 h-100 side-content">
			
				<h3 class="pt-4 pl-4">레시피 등록</h3>
				
				<div class="row justify-content-center mt-5 mb-5">
					<div class="col-10">
						<!--폼시작  -->
						<form action="/sb/adminRecipeForm" method="post" enctype="multipart/form-data">
							<div class="form-group">
							    <label>레시피 썸네일<span style="font-size:12px;">(사이즈 500*500px)</span></label>
							  	<div class="input-group mb-3">
									<input type="file" class="form-control" id="recipe-thum" name="recipeThum" accept="image/jpeg, image/png, image/gif" style="padding:3px;" required>
								</div>
							</div>
							<div class="form-group">
							    <label>레시피 제목</label>
							    <input type="text" class="form-control" placeholder="Enter Title" id="recipe-title" name="title" required/>
							</div>
							<div class="form-group">
							    <label>레시피 재료</label>
							    <textarea class="form-control" rows="2" placeholder="Enter Ingredient" id="recipe-ingredient" name="ingredient" required></textarea>
							</div>
							<div class="form-group">
							    <label>레시피 내용</label>
							    <textarea class="form-control" rows="10" placeholder="Enter Content" id="recipe-content" name="content" required></textarea>
							</div>
							<div class="form-group">
							    <label>레시피 상품 선택</label><br/>
								
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
									<c:forEach var="product" items="${category1 }">
					                     <div class="form-check form-check-inline" style="width:15%;">
					                          <input class="form-check-input" type="checkbox" name="check-product" value="${product.no }" id="product-${product.no }">
					                          <label class="form-check-label" for="inlineRadio1" onclick="selectProductCheckbox(${product.no })">${product.name }</label>
					                     </div>
					                     
									</c:forEach>
				                </div>
				                <!-- 카테고리1 끝-->		
				                						
				                <!-- 카테고리2 -->
								<div class="border p-3 bg-light w-100 mt-2 rounded chkbox" id="category-2" style="display: none;">
									<h6 class="bg-success p-1 text-white text-center rounded">가공식품</h6>
									<c:forEach var="product" items="${category2 }">
					                     <div class="form-check form-check-inline" style="width:15%;">
					                          <input class="form-check-input" type="checkbox" name="check-product" value="${product.no }" id="product-${product.no }">
					                          <label class="form-check-label" for="inlineRadio1" onclick="selectProductCheckbox(${product.no })">${product.name }</label>
					                     </div>
									</c:forEach>
				                </div>
				                <!-- 카테고리2 끝-->								
				                						
				                <!-- 카테고리3 -->
								<div class="border p-3 bg-light w-100 mt-2 rounded chkbox" id="category-3" style="display: none;">
									<h6 class="bg-success p-1 text-white text-center rounded">주방조리용품</h6>
									<c:forEach var="product" items="${category3 }">
					                     <div class="form-check form-check-inline" style="width:15%;">
					                          <input class="form-check-input" type="checkbox" name="check-product" value="${product.no }" id="product-${product.no }">
					                          <label class="form-check-label" for="inlineRadio1" onclick="selectProductCheckbox(${product.no })">${product.name }</label>
					                     </div>
									</c:forEach>
				                </div>
				                <!-- 카테고리3 끝-->								
				                						
				                <!-- 카테고리4 -->
								<div class="border p-3 bg-light w-100 mt-2 rounded chkbox" id="category-4" style="display: none;">
									<h6 class="bg-success p-1 text-white text-center rounded">생활용품</h6>
									<c:forEach var="product" items="${category4 }">
					                     <div class="form-check form-check-inline" style="width:15%;">
					                          <input class="form-check-input" type="checkbox" name="check-product" value="${product.no }" id="product-${product.no }">
					                          <label class="form-check-label" for="inlineRadio1" onclick="selectProductCheckbox(${product.no })">${product.name }</label>
					                     </div>
									</c:forEach>
				                </div>
				                <!-- 카테고리4 끝-->								
				                						
				                <!-- 카테고리5 -->
								<div class="border p-3 bg-light w-100 mt-2 rounded chkbox" id="category-5" style="display: none;">
									<h6 class="bg-success p-1 text-white text-center rounded">대용량/박스상품</h6>
									<c:forEach var="product" items="${category5 }">
					                     <div class="form-check form-check-inline" style="width:15%;">
					                          <input class="form-check-input" type="checkbox" name="check-product" value="${product.no }" id="product-${product.no }">
					                          <label class="form-check-label" for="inlineRadio1" onclick="selectProductCheckbox(${product.no })">${product.name }</label>
					                     </div>
									</c:forEach>
				                </div>
				                <!-- 카테고리5 끝-->	
				                	                
							</div>
							<div class="float-right">
								<button type="reset" class="btn btn-outline-danger mr-1">취소</button>
								<button type="submit" class="btn btn-success">올리기</button>
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
</script>	
</body>
</html>