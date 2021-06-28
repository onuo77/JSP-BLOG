package com.sb.web.admin;

import java.io.IOException;
import java.util.List;

import com.sb.dao.AdminEventDao;
import com.sb.dto.EventProduct;
import com.sb.vo.Event;
import com.sb.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminEventDetail")
public class EventDetailServlet extends HttpServlet{
	
	AdminEventDao eventDao = AdminEventDao.getInstance();

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
		
		//기획전 번호로 찾은 기획전 정보
		Event eventInfo = eventDao.getEventInfoByEventNo(eventNo);
		req.setAttribute("eventInfo", eventInfo);
		//기획전 번호로 찾은 기획전 상품정보
		List<EventProduct> eventProducts = eventDao.getProductsByEventNo(eventNo);
		req.setAttribute("eventProducts", eventProducts);
				
		req.getRequestDispatcher("/WEB-INF/admin/eventDetail.jsp").forward(req, res);
	}
}
