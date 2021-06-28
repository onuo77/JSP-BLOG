package com.sb.web.menu;

import java.io.IOException;
import java.util.List;

import com.sb.dao.EventDao;
import com.sb.vo.Event;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu/event")
public class EventServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EventDao eventDao = EventDao.getInstance();
		List<Event> events = eventDao.getActiveEvents();
		
		//요청객체에 속성으로 조회된 데이터를 속성으로 저장한다.
		request.setAttribute("events", events);
		
		//event.jsp로 내부이동
		request.getRequestDispatcher("/WEB-INF/views/menus/event.jsp").forward(request, response);
	}
}
