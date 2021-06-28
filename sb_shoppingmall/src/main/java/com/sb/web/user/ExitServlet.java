package com.sb.web.user;

import java.io.IOException;

import com.sb.dao.UserDao;
import com.sb.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/exit")
public class ExitServlet extends HttpServlet {

		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			UserDao userDao = UserDao.getInstance();
			
			HttpSession session = req.getSession(false);
			User user = (User) session.getAttribute("LOGIN_USER");
			
			user.setStatus("Y");
			userDao.exitUser(user);
			
			if (session != null) {
				session.invalidate();
			}
			
			resp.sendRedirect("/sb/index");
		}
		
}
