package com.sb.web.admin;

import java.io.IOException;

import com.sb.dao.AdminEventDao;
import com.sb.dao.AdminEventItemDao;
import com.sb.dao.AdminRecipeDao;
import com.sb.dao.AdminRecipeItemDao;
import com.sb.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/recipedelete")
public class RecipeDeleteServlet extends HttpServlet{

	AdminRecipeDao recipeDao = AdminRecipeDao.getInstance();
	AdminRecipeItemDao recipeItemDao = AdminRecipeItemDao.getInstance();
	
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
		recipeDao.deleteRecipe(recipeNo);
		recipeItemDao.deleteRecipeProduct(recipeNo);
		
		req.getRequestDispatcher("/adminRecipes").forward(req, res);
	}
}
