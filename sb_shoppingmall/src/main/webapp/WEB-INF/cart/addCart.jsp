<%@page import="com.sb.dao.CartItemDao"%>
<%@page import="com.sb.vo.CartItem"%>
<%@page import="com.sb.vo.User"%>
<%@page import="com.sb.util.CommonUtils"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.sb.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sb.dao.ListDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		// 전송된 상품 id
		User sessionSavedUser = (User)session.getAttribute("LOGINED_USER_INFO");
	
		// 상품 id 넘어오지 않았을때 강제로 상품list.jsp 이동시키고 종료
		if(sessionSavedUser == null){
			String encodedText = URLEncoder.encode("장바구니담기","utf-8");
			response.sendRedirect("../user/loginform.jsp?faile=deny&job=" + encodedText);
			return;
		}
		
		// 요청 파라미터에서 상품번호 조회
		int productNo = CommonUtils.stringToInt(request.getParameter("no"));
		
		// 조회된 사용자정보에서 사용자 아이디 조회
		String userId = sessionSavedUser.getId();
		
		// CartItem객체를 생성해서 사
		CartItem cartItem = new CartItem();
		cartItem.setProductNo(productNo);
		cartItem.setUserId(userId);
		
		// SB_CART테이블에 대한 CRUD 기능이 구현된 CartItemDao 객체 획득하기
		CartItemDao cartItemDao = CartItemDao.getInstance();
		
		cartItemDao.insertCartItem(cartItem);
		
		response.sendRedirect("/sb/list.jsp"); // 주소 설정 다시해야함
	%>
