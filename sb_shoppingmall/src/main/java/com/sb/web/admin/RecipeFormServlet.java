package com.sb.web.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.util.List;

import org.apache.commons.io.IOUtils;

import com.sb.dao.AdminEventDao;
import com.sb.dao.AdminEventItemDao;
import com.sb.dao.AdminRecipeDao;
import com.sb.dao.AdminRecipeItemDao;
import com.sb.util.CommonUtils;
import com.sb.vo.Category;
import com.sb.vo.Event;
import com.sb.vo.EventItem;
import com.sb.vo.Product;
import com.sb.vo.Recipe;
import com.sb.vo.RecipeItem;
import com.sb.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/adminRecipeForm")
@MultipartConfig
public class RecipeFormServlet extends HttpServlet{
	
	AdminRecipeDao recipeDao = AdminRecipeDao.getInstance();
	AdminRecipeItemDao recipeItemDao = AdminRecipeItemDao.getInstance();
	
	//썸네일 저장 경로
	private static final String saveDirectory = "C:\\Users\\jhta\\Documents\\카카오톡 받은 파일\\sb_test\\src\\main\\webapp\\resources\\recipe";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//관리자페이지 로그인 체크
		HttpSession session = req.getSession();
		User admin = (User) session.getAttribute("LOGIN_USER");
		if(admin == null || admin.getRoleType().equals("USER")) {
			resp.sendRedirect("login?fail=admin");
			return;
		}
		
		List<Category> category = recipeDao.getAllCategory();
		req.setAttribute("category", category);
		
		for(Category cate : category) {
			List<Product> products = recipeDao.getProductsByCategoryNo(cate.getNo());
			req.setAttribute("category"+String.valueOf(cate.getNo()), products);
		}
		
		req.getRequestDispatcher("/WEB-INF/admin/recipeForm.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//요청파라미터 조회
		Part part = req.getPart("recipeThum");
		String title = req.getParameter("title");
		String ingredient = req.getParameter("ingredient");
		String content = req.getParameter("content");
		String[] products = req.getParameterValues("check-product");
		
		//레시피 번호 시퀀스 증가
		int recipeSeqNo = recipeDao.getRecipeSeqNo();
		
		//레시피 썸네일 이름을 현재 레시피 번호로 변경
		String recipeThum = part.getSubmittedFileName();
		int idx = recipeThum.indexOf(".");
		String fileName = recipeSeqNo + recipeThum.substring(idx);
		
		//레시피 썸네일 경로에 저장
		OutputStream out = new FileOutputStream(new File(saveDirectory, fileName));
		InputStream in = part.getInputStream();
		IOUtils.copy(in, out);
		out.close();
		
		//레시피 객체에 등록하기
		Recipe recipe = new Recipe();
		recipe.setNo(recipeSeqNo);
		recipe.setTitle(title);
		recipe.setIngredient(ingredient);
		recipe.setContent(content);
		recipe.setFileName(fileName);
		
		recipeDao.insertRecipe(recipe);
		
		//레시피에 등록된 상품을 레시피 상품 객체에 등록하기
		RecipeItem recipeItem = new RecipeItem();
		recipeItem.setRecipeNo(recipeSeqNo);
		for(String product : products) {
			recipeItem.setProductNo(CommonUtils.stringToInt(product));
			recipeItemDao.insertRecipeItem(recipeItem);
		}
		
		req.getRequestDispatcher("/adminRecipes").forward(req, resp);	
	}
}
