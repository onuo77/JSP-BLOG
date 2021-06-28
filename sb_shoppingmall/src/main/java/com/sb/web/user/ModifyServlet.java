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

@WebServlet("/modify")
public class ModifyServlet extends HttpServlet{
	
	UserDao userDao = UserDao.getInstance();
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/user/modifyform.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		// 요청파라미터값을 조회
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		
		// 세션에서 사용자 정보 조회
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("LOGIN_USER"); 
		
		// 사용자정보에 요청파라미터값을 저장해서 변경된 값을 사용자정보객체에 저장
		user.setEmail(email);
		user.setPhone(phone);
		user.setAddress(address);
		
		// UserDao객체의 updateUser(user);
		userDao.updateUser(user);	
		
		resp.sendRedirect("/sb/mypage");
	}
}
