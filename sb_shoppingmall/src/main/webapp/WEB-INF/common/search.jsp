<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>SAGOBOJA</title>
</head>

<body>


	<div class="container">

		<div class="row" style="text-align: center;">
			<div class="col-md"
				style="display: block; text-align: center; margin-bottom: 25px;">
				<a href="/sb//index"> <img src="/sb/resources/images/common/close.png"
					style="width: 69px; margin: 100px 0px 70px 0px">
				</a>
			</div>
		</div>
	</div>

	<br />
	<div class="row justify-content-center">
		<div class="col-12 col-md-10 col-lg-8">
			<form id="form-search" class="card card-sm" action="../menu/list">
				<div class="card-body row no-gutters align-items-center">
					<div class="col-auto">
						<i class="fas fa-search h4 text-body"></i>
					</div>
					<!--end of col-->
					<div class="col">
						<input type="hidden" name="no" value="" />
						<input type="hidden" name="page" value="${pagination.pageNo }">
						<input
							class="form-control form-control-lg form-control-borderless"
							type="text" name="keyword" value="${param.keyword }" placeholder="Search topics or keywords">
					</div>
					<!--end of col-->

					<img src="/sb/resources/images/common/search.png" style="width: 60px;" onclick="submitForm()">

					<!--end of col-->
				</div>
			</form>
		</div>
		<!--end of col-->
	</div>
	<script type="text/javascript">
	function submitForm() {
		var text = document.querySelector("input[name='keyword']").value;
		if (!text) {
			alert("검색어를 입력하세요");
			document.querySelector("input[name='keyword']").focus();
			return;
		}
		document.querySelector("input[name='page']").value = 1;
		document.querySelector("#form-search").submit();
	}

	function goToPage(pageNo) {
		var text = document.querySelector("input[name='keyword']").value;
		if (!text) {
			document.querySelector("select[name='opt']").disabled = true;
			document.querySelector("input[name='keyword']").disabled = true;
		}
		document.querySelector("input[name='no']").disabled = true;
		
		document.querySelector("input[name='page']").value = pageNo;
		document.querySelector("#form-search").setAttribute("action", "list");
		document.querySelector("#form-search").submit();
	}
	
	function goToDetail(boardNo) {
		var text = document.querySelector("input[name='keyword']").value;
		if (!text) {
			document.querySelector("select[name='opt']").disabled = true;
			document.querySelector("input[name='keyword']").disabled = true;
		}
		
		document.querySelector("input[name='no']").value = boardNo;
		document.querySelector("#form-search").setAttribute("action", "detail");
		document.querySelector("#form-search").submit();
	}
</script>
	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>
</html>