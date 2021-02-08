<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../layout/header.jsp" %>

<div class = "container">
<br/>
<br/>
<h4 style="text-align:center;">SIGN UP</h4>
<br/>
<form action="/jspblog/user?cmd=join" method="post" onsubmit="return valid()">
	
  <div class="form-group" style="text-align:right;">
    <input type="text" name="username" id="username" class="form-control" placeholder="Enter Username" required>
	<button type="button" class="btn" onClick="usernameCheck()">CHECK ID</button>    
	<br/>
  </div>
  
  <div class="form-group">
    <input type="password" name="password" class="form-control" placeholder="Enter password" required>
  </div>
  
   <div class="form-group">
    <input type="email" name="email" class="form-control" placeholder="Enter email" required>
  </div> 
  
   <div class="form-group">
    <input type="text" name="address" class="form-control" placeholder="Enter Address" required>
  </div> 
  
  <button type="submit" class="btn btn-primary">SIGN UP</button>
  
<script>
	var isChecking = false; 
	function valid(){
		if(isChecking == false){
			alert("Please check ID duplication.");
		}
		return isChecking;
	}
	
	function usernameCheck(){
		//DB에서 확인해서 정상이면 isChecking = true
		var username = $("#username").val();
		$.ajax({
			type : "POST",
			url : "/jspblog/user?cmd=usernameCheck",
			data : username,
			contentType : "text/plain; charset=utf-8",
			dataType : "text"
		}).done(function(data){
			if(data == 'ok'){
				isChecking = false;
				alert('"'+username+'" '+"is unavailable.")
			}else{
				isChecking = true;
				alert('"'+username+'" '+"is available.")
			}
		});
	}
</script>
</form>
</div>
</body>
</html>