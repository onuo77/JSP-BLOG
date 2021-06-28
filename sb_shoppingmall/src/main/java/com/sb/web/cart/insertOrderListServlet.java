package com.sb.web.cart;

import java.io.IOException;
import java.util.List;

import com.sb.dao.CartItemDao;
import com.sb.dao.OrderListDao;
import com.sb.dao.ProductDao;
import com.sb.dto.CartitemDto;
import com.sb.util.CommonUtils;
import com.sb.vo.CartItem;
import com.sb.vo.OrderList;
import com.sb.vo.Product;
import com.sb.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

@WebServlet("/addOrder")
public class insertOrderListServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = CommonUtils.stringToInt(request.getParameter("no"));
		int cartNo = CommonUtils.stringToInt(request.getParameter("cartNo"));
		int amount = CommonUtils.stringToInt(request.getParameter("amount"));
		HttpSession session = request.getSession();
		User sessionSavedUser = (User) session.getAttribute("LOGIN_USER");
		
		
		System.out.println("############  productNo " + no);
		
		if (sessionSavedUser == null){
			String returnURL = "/menu/recipe/detail?no="+no;
			session.setAttribute("returnURL", returnURL);
			response.sendRedirect("/sb/login");
			return;
		}
		
		// 아이디 획득
		String userId = sessionSavedUser.getId();
		
		CartItemDao cartItemDao = CartItemDao.getInstance();
		OrderListDao orderListDao = OrderListDao.getInstance();
		
		List<CartItem> cartitems = cartItemDao.getCartItemListByNo(userId);
		List<OrderList> ol = orderListDao.getOrderItemListByUserId(userId);
		
		// 장바구니 상품리스트 불러오기\
		OrderList orderList = new OrderList();
		
		
		
		
		orderList.setProductNo(no);
		orderList.setUserId(userId);
		orderList.setNo(cartNo);
		orderList.setOrderItemAmount(amount);
		orderList.setOrderStatus("주문완료");
		System.out.println("!@#!@#!@#!@#!!!" + no + userId);
		
		// 상품 재고 삭제
		ProductDao productDao = ProductDao.getInstance();
		productDao.updateStockByNo(no);
		
		orderListDao.insertOrderList(orderList);
		cartItemDao.deleteCartItem(no);
		
		
		response.sendRedirect("/sb/order");
		
		
		
	}
}
