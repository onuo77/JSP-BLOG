package com.sb.web.menu;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.math.NumberUtils;

import com.sb.dao.ListDao;
import com.sb.util.CommonUtils;
import com.sb.vo.Pagination;
import com.sb.vo.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu/best")
public class BestServlet extends HttpServlet{
	// 한 페이지당 표시할 게시글 행의 갯수
	private static final int ITEMS_PER_PAGE = 12;
	// 페이지블록 당 한번에 표시할 페이지번호 갯수
	private static final int PAGES_PER_PAGE_BLOCK = 5;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ListDao listDao = ListDao.getInstance();
		
		int pageNo = NumberUtils.toInt(request.getParameter("page"),1);
		
		Map<String, Object> param = new HashMap<String, Object>();

		param.put("beginIndex", (pageNo-1)*ITEMS_PER_PAGE+1);
		param.put("endIndex", pageNo*ITEMS_PER_PAGE);
		
//		List<Product> products = listDao.getProductsByBest(param);
		
		//요청객체에 속성으로 조회된 데이터를 속성으로 저장한다.
//		request.setAttribute("products", products);

		
		int totalRows = listDao.getAllProductsTotalRows(param);
		// 전체페이지
		int totalPages = (int) Math.ceil((double) totalRows/ITEMS_PER_PAGE);
		// 전체 페이지블록
		int totalPageBlocks = (int) Math.ceil((double) totalPages/PAGES_PER_PAGE_BLOCK);
		// 현재페이지블록
		int currentPageBlock = (int) Math.ceil((double) pageNo/PAGES_PER_PAGE_BLOCK);
		// 현재 페이지블록의 시작페이지 번화 끝 페이지번호를 계산하기
		int beginPage = (currentPageBlock - 1)*PAGES_PER_PAGE_BLOCK + 1;
		int endPage = currentPageBlock*PAGES_PER_PAGE_BLOCK;
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
		
		request.setAttribute("pagination", pagination);
		//내부이동
		request.getRequestDispatcher("/WEB-INF/views/menus/eventdetail.jsp").forward(request, response);
	}
}
