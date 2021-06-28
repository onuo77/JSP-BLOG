package com.sb.web.cart;

import java.io.IOException;

import com.sb.dao.CartItemDao;
import com.sb.dao.OrderListDao;
import com.sb.dao.ProductDao;
import com.sb.util.CommonUtils;
import com.sb.vo.CartItem;
import com.sb.vo.OrderList;
import com.sb.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orderDelete")
public class deleteOrderItemServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		// 요청 파라미터에서 상품번호 조회
		int no = CommonUtils.stringToInt(request.getParameter("no"));
		int productNo = CommonUtils.stringToInt(request.getParameter("productNo"));
		HttpSession session = request.getSession();
		
		// 전송된 상품 id
		User sessionSavedUser = (User) session.getAttribute("LOGIN_USER");
				
		
		
		

		// SB_CART테이블에 대한 CRUD 기능이 구현된 CartItemDao 획득
		OrderListDao orderListDao = OrderListDao.getInstance();
		
		OrderList orderList = orderListDao.getOrderItemByNo(no);
		
		
		/*
		if(!cartItem.getUserId().equals(sessionSavedUser)) {
			response.sendRedirect("/sb/userIdError");	// 바꿔야함
			return;
		}
		*/
		
		// 상품에 재고 재등록
		ProductDao productDao = ProductDao.getInstance();
		productDao.updateAddStockByNo(productNo);
		
		
		orderListDao.deleteOrderList(no);
		
		
		response.sendRedirect("/sb/order");
	}
	
}
