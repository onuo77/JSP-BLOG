package com.sb.web.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;

import com.sb.dao.AdminEventDao;
import com.sb.dao.AdminEventItemDao;
import com.sb.util.CommonUtils;
import com.sb.vo.Category;
import com.sb.vo.Event;
import com.sb.vo.EventItem;
import com.sb.vo.Product;
import com.sb.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/eventmodify")
@MultipartConfig
public class EventModifyServlet extends HttpServlet{
	
	AdminEventDao eventDao = AdminEventDao.getInstance();
	AdminEventItemDao eventItemDao = AdminEventItemDao.getInstance();

	//썸네일 저장 경로
	private static final String saveDirectory = "C:\\Users\\jhta\\Documents\\카카오톡 받은 파일\\sb_test\\src\\main\\webapp\\resources\\event";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//관리자페이지 로그인 체크
		HttpSession session = req.getSession();
		User admin = (User) session.getAttribute("LOGIN_USER");
		if(admin == null || admin.getRoleType().equals("USER")) {
			resp.sendRedirect("login?fail=admin");
			return;
		}

		int eventNo = Integer.parseInt(req.getParameter("eventNo"));
		
		List<Category> category = eventDao.getAllCategory();
		req.setAttribute("category", category);
		
		//선택되어있는 상품 구하기
		Map<String, Object> selectedProduct = new HashMap<String, Object>();
		selectedProduct.put("eventNo", eventNo);
		
		
		for(Category cate : category) {
			List<Product> products = eventDao.getProductsByCategoryNo(cate.getNo());
			req.setAttribute("category"+String.valueOf(cate.getNo()), products);
			
			//카테고리 번호 저장하기
			selectedProduct.put("categoryNo", cate.getNo());
			//맵 저장
			req.setAttribute("products" + cate.getNo(), eventItemDao.getSelectedProducts(selectedProduct));
		}
		
		//기획전 번호로 찾은 기획전 정보
		Event eventInfo = eventDao.getEventInfoByEventNo(eventNo);
		req.setAttribute("startDate",CommonUtils.dateToDateLocal(eventInfo.getStartDate()));
		req.setAttribute("endDate",CommonUtils.dateToDateLocal(eventInfo.getEndDate()));
		req.setAttribute("eventInfo", eventInfo);
		
		
		req.getRequestDispatcher("/WEB-INF/admin/eventModify.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int eventNo = Integer.parseInt(req.getParameter("eventNo"));

		//등록되어있는 기획전 아이템 전부 삭제하기
		eventItemDao.deleteEventProduct(eventNo);
		
		//요청파라미터 조회
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		Part part = req.getPart("newEventThum");
		String[] products =  req.getParameterValues("check-product");

		//기획전 썸네일 이름을 현재 기획전 번호로 변경
		String eventThum = part.getSubmittedFileName();
		int idx = eventThum.indexOf(".");
		String fileName = eventNo + eventThum.substring(idx);
		
		//기획전 썸네일 경로에 저장
		OutputStream out = new FileOutputStream(new File(saveDirectory, fileName));
		InputStream in = part.getInputStream();
		IOUtils.copy(in, out);
		out.close();
		
		//변경된 기획전 내용 갱신하기
		Event event = eventDao.getEventInfoByEventNo(eventNo);
		event.setTitle(title);
		event.setContent(content);
		try {
			event.setStartDate(CommonUtils.StringtoDate(startDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		try {
			event.setEndDate(CommonUtils.StringtoDate(endDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		event.setFileName(fileName);
		
		eventDao.updateEvent(event);
		
		//변경된 기획전 상품 객체에 등록하기
		EventItem eventItem = new EventItem();
		eventItem.setEventNo(eventNo);
		for(String product : products) {
			eventItem.setProductNo(CommonUtils.stringToInt(product));
			eventItemDao.insertEventItem(eventItem);
		}
		
		req.getRequestDispatcher("/adminEvents").forward(req, resp);
	}
}
