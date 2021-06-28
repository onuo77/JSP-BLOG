package com.sb.web.cart;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import com.sb.dao.CartItemDao;
import com.sb.dao.ProductDao;
import com.sb.dao.RecipeDao;
import com.sb.util.CommonUtils;
import com.sb.vo.CartItem;
import com.sb.vo.Product;
import com.sb.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addCart")
public class addCartListSevlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		CartItemDao cartItemDao = CartItemDao.getInstance();
		ProductDao productDao = ProductDao.getInstance();
		
		// 요청 파라미터에서 상품번호 조회
		int productNo = CommonUtils.stringToInt(request.getParameter("no"));
		HttpSession session = request.getSession();
		
		
		// 로그인 확인
		User sessionSavedUser = (User) session.getAttribute("LOGIN_USER");
				
		//로그인 안 되었으면 로그인폼 요청
		if (sessionSavedUser == null){
			String returnURL = "/menu/recipe/detail?no="+productNo;
			session.setAttribute("returnURL", returnURL);
			response.sendRedirect("/sb/login");
			return;
		}
		
		
		// 아이디 획득
		String userId = sessionSavedUser.getId();

		System.out.println("**********여기? productNo " + productNo);
		List<Product> products = productDao.getProductByNo(productNo);
		
		List<CartItem> pn = cartItemDao.getCartItemListByNo(userId);

		
		
		
		CartItem cartItem = new CartItem();
		cartItem.setProductNo(productNo);
		cartItem.setUserId(userId);
		
		
		
		// SB_CART테이블에 대한 CRUD 기능이 구현된 CartItemDao 획득
		System.out.println(""+cartItemDao);
		
		loopOut:
		for(Product item : products) {
			System.out.println("!!!!!!!!!!!" + item.getNo());
			for(CartItem ci : pn) {
				System.out.println("@@@@@@@@" + ci.getProductNo());
				if(item.getNo() == ci.getProductNo()) {
					cartItemDao.updateAmountByNo(productNo);
					break loopOut;
				}
			}
			cartItem.setProductNo(item.getNo());
			cartItemDao.insertCartItem(cartItem);
		}
		
		response.sendRedirect("/sb/cart");
		
		
		
	}
}
