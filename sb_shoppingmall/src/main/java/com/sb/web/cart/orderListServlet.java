package com.sb.web.cart;

import java.io.IOException;
import java.util.List;

import com.sb.dao.CartItemDao;
import com.sb.dao.OrderListDao;
import com.sb.dto.CartitemDto;
import com.sb.dto.OrderListDto;
import com.sb.util.CommonUtils;
import com.sb.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order")
public class orderListServlet extends HttpServlet {
	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		OrderListDao orderListDao = OrderListDao.getInstance();
		int no = CommonUtils.stringToInt(request.getParameter("no"),1);
		HttpSession session = request.getSession();
		
		
		// 로그인 여부 확인
		User sessionSavedUser = (User) session.getAttribute("LOGIN_USER");
		
		// 로그인 안되었으면 로그인폼 요청
		if(sessionSavedUser == null) {
			String returnURL = "/menu/recipe/detail?no="+no;
			session.setAttribute("returnURL", returnURL);
			response.sendRedirect("/sb/login");
					
			return;
		}
		
		String userId = sessionSavedUser.getId();
		
		// 정보 조회
		List<OrderListDto> orderList = orderListDao.getOrderListByUserId(userId);
		
		request.setAttribute("orderList", orderList);
		
		request.getRequestDispatcher("WEB-INF/cart/orderList.jsp").forward(request, response);
		
		
	}
}
