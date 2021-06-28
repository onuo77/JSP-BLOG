package com.sb.web.cart;

import java.io.IOException;

import com.sb.dao.CartItemDao;
import com.sb.util.CommonUtils;
import com.sb.vo.CartItem;
import com.sb.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart/deleteAll")
public class deleteAllCartItemServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		// 요청 파라미터에서 상품번호 조회
		HttpSession session = request.getSession();
		
		// 전송된 상품 id
		User sessionSavedUser = (User) session.getAttribute("LOGIN_USER");
				
		// 사용자 아이디 조회
		String userId = sessionSavedUser.getId();
		

		// SB_CART테이블에 대한 CRUD 기능이 구현된 CartItemDao 획득
		CartItemDao cartItemDao = CartItemDao.getInstance();
		
		
		cartItemDao.deleteAllCartItem(userId);
		
		
		response.sendRedirect("/sb/cart");
	}
	
}
