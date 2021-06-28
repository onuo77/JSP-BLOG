package com.sb.web.cart;

import java.io.IOException;
import java.util.List;

import com.sb.dao.CartItemDao;
import com.sb.dto.CartitemDto;
import com.sb.util.CommonUtils;
import com.sb.vo.CartItem;
import com.sb.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class cartListServlet extends HttpServlet {
	
	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		CartItemDao cartItemDao = CartItemDao.getInstance();
		int no = CommonUtils.stringToInt(request.getParameter("no"));
		HttpSession session = request.getSession();
	
		
		//로그인 여부 확인
		User sessionSavedUser = (User) session.getAttribute("LOGIN_USER");
				
		//로그인 안 되었으면 로그인폼 요청
		if (sessionSavedUser == null){
			String returnURL = "/menu/recipe/detail?no="+no;
			session.setAttribute("returnURL", returnURL);
			response.sendRedirect("/sb/login");
					
			return;
		}
		
		String userId = sessionSavedUser.getId();

		System.out.println("userId " + userId);
		
		// 모든 정보 조회
		List<CartitemDto> cartItems = cartItemDao.getCartItemsByUserId(userId);
		// 조회된 부서정보를 요청객체에 속성으로 저장
		System.out.println("cartItems " + cartItems);
		request.setAttribute("cartItems", cartItems);
		
		
		request.getRequestDispatcher("WEB-INF/cart/cartList.jsp").forward(request, response);
		
	}
	
}
