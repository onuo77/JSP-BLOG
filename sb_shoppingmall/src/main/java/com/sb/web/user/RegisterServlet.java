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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	UserDao userDao = UserDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/user/registerform.jsp").forward(req, resp);
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		
		User savedUser = userDao.getUserById(id);
		if (savedUser != null) {
			resp.sendRedirect("register?fail=invaild");
			return;
		}
		User user = new User();
		user.setId(id);
		user.setPwd(DigestUtils.sha256Hex(pwd));
		user.setName(name);
		user.setEmail(email);
		user.setPhone(phone);
		user.setAddress(address);
		
		userDao.insertUser(user);
		
		resp.sendRedirect("/sb/index");
	}
}
