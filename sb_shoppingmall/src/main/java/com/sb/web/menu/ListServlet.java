package com.sb.web.menu;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.math.NumberUtils;

import com.sb.dao.ListDao;
import com.sb.vo.Pagination;
import com.sb.vo.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu/list")
public class ListServlet extends HttpServlet{
	private final int ITEMS_IN_A_PAGE = 12;
	private final int PAGES_IN_ONE_PAGE = 5;
	
	ListDao listDao = ListDao.getInstance();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNo = NumberUtils.toInt(request.getParameter("pageNo"), 1);
		String keyword = request.getParameter("keyword");
		int categoryNo = NumberUtils.toInt(request.getParameter("category"),1);
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("beginIndex", (pageNo-1)*ITEMS_IN_A_PAGE+1);
		param.put("endIndex", (pageNo)*ITEMS_IN_A_PAGE);
		param.put("category", categoryNo);
	
		if(keyword != null) {
			param.put("keyword", keyword);
		}
		
		List<Product> products = listDao.getAllProductsUpToDate(param);
		
		////
		int totalRows = listDao.getAllProductsTotalRows(param);
		// 전체페이지
		int totalPages = (int) Math.ceil((double) totalRows/ITEMS_IN_A_PAGE);
		// 전체 페이지블록
		int totalPageBlocks = (int) Math.ceil((double) totalPages/PAGES_IN_ONE_PAGE);
		// 현재페이지블록
		int currentPageBlock = (int) Math.ceil((double) pageNo/PAGES_IN_ONE_PAGE);
		// 현재 페이지블록의 시작페이지 번화 끝 페이지번호를 계산하기
		int beginPage = (currentPageBlock - 1)*PAGES_IN_ONE_PAGE + 1;
		int endPage = currentPageBlock*PAGES_IN_ONE_PAGE;
		if (currentPageBlock == totalPageBlocks) {
			endPage = totalPages;
		}
		// 페이징처리에 필요한 정보를 Pagination객체에 저장하기
		Pagination pagination = new Pagination();
		pagination.setPageNo(pageNo);
		pagination.setTotalRows(totalRows);
		pagination.setTotalPages(totalPages);
		pagination.setTotalPageBlocks(totalPageBlocks);
		pagination.setCurrentPageBlock(currentPageBlock);
		pagination.setBeginPage(beginPage);
		pagination.setEndPage(endPage);
		
		
		//요청객체에 속성으로 조회된 데이터를 속성으로 저장한다.
		request.setAttribute("products", products);
		request.setAttribute("pagination", pagination);	
		
		//event.jsp로 내부이동
		request.getRequestDispatcher("/WEB-INF/views/menus/list.jsp").forward(request, response);
	}
}
