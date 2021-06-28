package com.sb.web.admin;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import com.sb.dao.AdminEventDao;
import com.sb.dao.AdminRecipeDao;
import com.sb.dto.CntDto;
import com.sb.vo.Event;
import com.sb.vo.Recipe;
import com.sb.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		//관리자페이지 로그인 체크
		HttpSession session = req.getSession();
		User admin = (User) session.getAttribute("LOGIN_USER");
		if(admin == null || admin.getRoleType().equals("USER")) {
			res.sendRedirect("login?fail=admin");
			return;
		}
		
		AdminEventDao eventDao = AdminEventDao.getInstance();
		CntDto cntDto = eventDao.getCountByTable();
		req.setAttribute("cntDto", cntDto);
		
		List<Event> recentEvents = eventDao.getRecentEvents();
		req.setAttribute("recentEvents", recentEvents);
		
		AdminRecipeDao recipeDao = AdminRecipeDao.getInstance();
		List<Recipe> recentRecipes = recipeDao.getRecentRecipes();
		req.setAttribute("recentRecipes", recentRecipes);
		
		req.getRequestDispatcher("/WEB-INF/admin/admin.jsp").forward(req, res);
	}
}