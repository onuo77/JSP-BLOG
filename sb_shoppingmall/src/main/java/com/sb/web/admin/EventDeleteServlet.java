package com.sb.web.admin;

import java.io.IOException;

import com.sb.dao.AdminEventDao;
import com.sb.dao.AdminEventItemDao;
import com.sb.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/eventdelete")
public class EventDeleteServlet extends HttpServlet{

	AdminEventDao eventDao = AdminEventDao.getInstance();
	AdminEventItemDao eventItemDao = AdminEventItemDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		//관리자페이지 로그인 체크
		HttpSession session = req.getSession();
		User admin = (User) session.getAttribute("LOGIN_USER");
		if(admin == null || admin.getRoleType().equals("USER")) {
			res.sendRedirect("login?fail=admin");
			return;
		}
		
		int eventNo = Integer.parseInt(req.getParameter("eventNo"));
		eventDao.deleteEvent(eventNo);
		eventItemDao.deleteEventProduct(eventNo);
		
		req.getRequestDispatcher("/adminEvents").forward(req, res);
	}
}
