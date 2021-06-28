package com.sb.web.menu;

import java.io.IOException;
import java.util.List;

import com.sb.dao.RecipeDao;
import com.sb.util.CommonUtils;
import com.sb.vo.Product;
import com.sb.vo.Recipe;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu/recipe/detail")
public class RecipeDetailServlet extends HttpServlet{
	RecipeDao recipeDao = RecipeDao.getInstance();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = CommonUtils.stringToInt(request.getParameter("no"), 1);
		Recipe recipe = recipeDao.getRecipeByNo(no);
		
		List<Product> recipeItems = recipeDao.getProductByRecipeNo(no);
		
		request.setAttribute("recipe", recipe);
		request.setAttribute("recipeItems", recipeItems);
		request.getRequestDispatcher("/WEB-INF/views/menus/recipedetail.jsp").forward(request, response);

	}
}
