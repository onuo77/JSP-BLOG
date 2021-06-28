<%@page import="com.sb.dao.CartItemDao"%>
<%@page import="com.sb.vo.CartItem"%>
<%@page import="com.sb.util.CommonUtils"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.sb.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 로그인 여부 체크하기
	User sessionSavedUser = (User) session.getAttribute("LOGINED_USER_INFO");

	if(sessionSavedUser == null){
		String encodedText = URLEncoder.encode("장바구니 아이템삭제", "utf-8");
		response.sendRedirect("../user/loginform.jsp?fail=deny&job=" + encodedText);
		return;
	}
	
	// 아이템 번호 조회
	int itemNo = CommonUtils.stringToInt(request.getParameter("no"));
	
	CartItemDao cartItemDao = CartItemDao.getInstance();
	
	CartItem cartItem = cartItemDao.getCartItemByNo(itemNo);
	
	// 아이템 정보 조회
	if(cartItem == null){
		response.sendRedirect("cartList.jsp?faile=invalid");
		return;
	}
	
	// 아이디 확인
	if (!cartItem.getUserId().equals(sessionSavedUser.getId())) {
		response.sendRedirect("list.jsp?fail=deny");
		return;
	}

	// 아이템정보 삭제
	cartItemDao.deleteCartItem(itemNo);
	
	// 재요청 URL
	response.sendRedirect("list.jsp");
	
%>