package com.sb.web.user;

import java.io.IOException;

import org.apache.commons.codec.digest.DigestUtils;

import com.sb.dao.UserDao;
import com.sb.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	UserDao userDao = UserDao.getInstance();

	@Override 
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	  req.getRequestDispatcher("/WEB-INF/views/loginform.jsp").forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		UserDao userDao = UserDao.getInstance();
		User savedUser = userDao.getUserById(id); 
		
		if (savedUser == null) {
			resp.sendRedirect("login?fail=invalid");
			return;
		}

		if (!savedUser.getPwd().equals(DigestUtils.sha256Hex(pwd))) {
			resp.sendRedirect("login?fail=invalid");
			return;
		}
		
		if ("Y".equals(savedUser.getStatus())) {
			resp.sendRedirect("login?fail=out");
			return;
		} 

		HttpSession session = req.getSession();
		session.setAttribute("LOGIN_USER", savedUser);
		
		
		if ("USER".equals(savedUser.getRoleType())) {
			resp.sendRedirect("/sb/index");
			return;
			
		} else if ("ADMIN".equals(savedUser.getRoleType())) {
			resp.sendRedirect("/sb/admin");
			return;
		}

	}
}
