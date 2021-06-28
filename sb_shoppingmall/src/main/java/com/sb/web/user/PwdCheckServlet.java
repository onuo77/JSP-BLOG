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

@WebServlet("/check")
public class PwdCheckServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/user/pwdCheck.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String password = req.getParameter("pwd");
		String pwd = DigestUtils.sha256Hex(password);
		String job = req.getParameter("job");
 
		HttpSession session = req.getSession();
		User loginedUser = (User) session.getAttribute("LOGIN_USER");
		
		if(pwd.equals(loginedUser.getPwd())) {
			resp.sendRedirect(job);
		}else {
			resp.sendRedirect("check?job="+job);
		}
	
		
	}

}
