<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../layout/header.jsp" %>

<div class="container">
<br/>
<br/>
<h4 style="text-align:center;">LOGIN</h4>
  <form action="/jspblog/user?cmd=login" method="post">
  
    <div class="form-group">
      <input type="text" class="form-control" id="username" name="username" placeholder="Enter Username" required/>
    </div>
    <div class="form-group">
      <input type="password" class="form-control" name="password"  placeholder="Enter Password" required/>
    </div>
    <button type="submit" class="btn btn-primary">LOGIN</button>
  </form>
</div>

</body>
</html>