package com.sb.web.user;

import java.io.IOException;
import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;

import com.sb.dao.UserDao;
import com.sb.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/change")
public class PwdChangeServlet extends HttpServlet{
	
	UserDao userDao = UserDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/user/pwdChange.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String password = req.getParameter("newPwd");
		String newPwd = DigestUtils.sha256Hex(password);
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("LOGIN_USER"); 
		
		user.setPwd(newPwd);
		
		userDao.passwordChange(user);
		
		resp.sendRedirect("/sb/mypage");
		
	
	}	
}
