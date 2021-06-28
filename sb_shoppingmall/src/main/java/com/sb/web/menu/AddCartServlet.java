package com.sb.web.menu;

import java.io.IOException;
import java.util.List;

import com.sb.dao.CartItemDao;
import com.sb.dao.RecipeDao;
import com.sb.util.CommonUtils;
import com.sb.vo.Recipe;
import com.sb.vo.User;
import com.sb.vo.CartItem;
import com.sb.vo.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/menu/recipe/addcart")
public class AddCartServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RecipeDao recipeDao = RecipeDao.getInstance();
		int no = CommonUtils.stringToInt(request.getParameter("no"), 1);
		System.out.println("!!!!!!!!!!!!!!  no " + no);
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
		//로그인 된 경우 유저아이디 획득
		String userId = sessionSavedUser.getId();

		//레시피 상품리스트 불러오기
		List<Product> products = recipeDao.getProductByRecipeNo(no);
		
		//레시피 상품 중에 품절상품이 있는지 확인
		//품절되었으면 리스트에서 제외한다.
		for(Product item: products) {
			if (item.getStock() == 0) {
				products.remove(products.indexOf(item));	//맞는 코드인가?
			}
		}
		
		//CartItem객체를 생성해서 장바구니에 사용자아이디, 상품번호를 저장한다.
		CartItemDao cartItemDao = CartItemDao.getInstance();
		CartItem cartItem = new CartItem();

		cartItem.setUserId(userId);			//id는 공통영역이니 여기 있어도 되지 않을까...?
		
		
		for(Product item : products) {
			cartItem.setProductNo(item.getNo());
			cartItem.setUserId(userId);
			cartItem.setAmountNo(1);			//원래는 있는지 확인하고 있으면 +1 해야하는데
										//cartItemDao에서 내용을 userId와 상품번호로 불러오는 기능이 필요해서 그냥 단순하게...
			cartItemDao.insertCartItem(cartItem);
		}
		
		response.sendRedirect(request.getHeader("referer"));
	}
}
