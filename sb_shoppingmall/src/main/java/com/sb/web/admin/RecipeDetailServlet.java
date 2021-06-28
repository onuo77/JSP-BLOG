package com.sb.web.admin;

import java.io.IOException;
import java.util.List;

import com.sb.dao.AdminRecipeDao;
import com.sb.dto.RecipeProduct;
import com.sb.vo.Recipe;
import com.sb.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminRecipeDetail")
public class RecipeDetailServlet extends HttpServlet{
	
	AdminRecipeDao recipeDao = AdminRecipeDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		//관리자페이지 로그인 체크
		HttpSession session = req.getSession();
		User admin = (User) session.getAttribute("LOGIN_USER");
		if(admin == null || admin.getRoleType().equals("USER")) {
			res.sendRedirect("login?fail=admin");
			return;
		}
		
		int recipeNo = Integer.parseInt(req.getParameter("recipeNo"));
		
		//기획전 번호로 찾은 기획전 정보
		Recipe recipeInfo = recipeDao.getRecipeInfoByRecipeNo(recipeNo);
		req.setAttribute("recipeInfo", recipeInfo);
		//기획전 번호로 찾은 기획전 상품정보
		List<RecipeProduct> recipeProducts = recipeDao.getProductsByRecipeNo(recipeNo);
		req.setAttribute("recipeProducts", recipeProducts);
		
		req.getRequestDispatcher("/WEB-INF/admin/recipeDetail.jsp").forward(req, res);
	}
}
