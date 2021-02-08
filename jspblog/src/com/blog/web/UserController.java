package com.blog.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.domain.user.User;
import com.blog.domain.user.dto.JoinReqDto;
import com.blog.domain.user.dto.LoginReqDto;
import com.blog.domain.user.dto.UpdateReqDto;
import com.blog.service.UserService;
import com.blog.util.Script;

@WebServlet("/user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public UserController() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String cmd = req.getParameter("cmd");
		UserService userService = new UserService();
		RequestDispatcher dis = null;
		
		if(cmd.equals("loginForm")) { //아이디기억
			dis = req.getRequestDispatcher("user/loginForm.jsp");
			
		}else if(cmd.equals("login")) { //서비스호출
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			LoginReqDto dto = new LoginReqDto();
			dto.setUsername(username);
			dto.setPassword(password);
			User userEntity = userService.signIn(dto);
			
			if(userEntity != null) {
				HttpSession session = req.getSession();
				session.setAttribute("principal", userEntity);
				dis = req.getRequestDispatcher("index.jsp");
			}else {
				Script.back(resp, "Sign in Failed");
				return;
			}
			
		}else if(cmd.equals("joinForm")) {
			dis = req.getRequestDispatcher("user/joinForm.jsp");

		}else if(cmd.equals("join")) {
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			String email = req.getParameter("email");
			String address = req.getParameter("address");
			
			JoinReqDto dto = new JoinReqDto();
			dto.setUsername(username);
			dto.setPassword(password);
			dto.setEmail(email);
			dto.setAddress(address);
			
			System.out.println("회원가입 : " +dto);
			int result = userService.signUp(dto);
			if (result==1) {
				dis = req.getRequestDispatcher("index.jsp");
			}else {
				Script.back(resp, "Sign Up Failed");
				return;
			}
			
			userService.signUp(dto);
		}else if(cmd.equals("usernameCheck")) {
			BufferedReader br = req.getReader();
			String username = br.readLine();
			System.out.println(username);
			int result = userService.idCheck(username);
			PrintWriter out = resp.getWriter();
			if(result == 1) {
				out.print("ok");
			}else {
				out.print("fail");
			}
			out.flush();
			return;
			
		}else if(cmd.equals("logout")) {
			HttpSession session = req.getSession();
			session.invalidate();
			dis = req.getRequestDispatcher("index.jsp");
		
		}else if(cmd.equals("updateForm")) {
			dis = req.getRequestDispatcher("user/updateForm.jsp");
		
		}else if(cmd.equals("update")) {
			int userId = Integer.parseInt(req.getParameter("userId"));
			UpdateReqDto dto = UpdateReqDto.builder()
					.password(req.getParameter("password"))
					.email(req.getParameter("email"))
					.address(req.getParameter("address"))
					.build();
			
			int result = userService.userInfoModify(userId, dto);
			
			if(result == 1) {
				dis = req.getRequestDispatcher("index.jsp");
			}else {
				Script.back(resp, "Failed to modify");
			}
		}
		
		dis.forward(req, resp);
	}
}
