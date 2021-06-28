package com.sb.web;

import java.io.IOException;
import java.util.List;

import com.sb.dao.AdminEventDao;
import com.sb.dao.MainDao;
import com.sb.dto.MainDto;
import com.sb.vo.Category;
import com.sb.vo.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/index")
public class IndexServlet extends HttpServlet{

	MainDao mainDao = MainDao.getInstance();
	AdminEventDao adminEventDao = AdminEventDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Category> categories = adminEventDao.getAllCategory();
		req.setAttribute("categories", categories);
		
		List<Product> products = mainDao.getRecentProducts();
		req.setAttribute("products", products);
		
		List<MainDto> events = mainDao.getEventProducts(5);
		req.setAttribute("events", events);
		
		req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
	}
}
