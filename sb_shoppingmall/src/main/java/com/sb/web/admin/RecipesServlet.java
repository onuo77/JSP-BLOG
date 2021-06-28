package com.sb.web.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sb.dao.AdminRecipeDao;
import com.sb.util.CommonUtils;
import com.sb.vo.Event;
import com.sb.vo.Pagination;
import com.sb.vo.Recipe;
import com.sb.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminRecipes")
public class RecipesServlet extends HttpServlet{
	
	private static final int ROWS_PER_PAGE = 5;
	//페이지블록 당 한번에 표시할 페이지번호 갯수
	private static final int PAGES_PER_PAGE_BLOCK = 5;
	
	AdminRecipeDao recipeDao = AdminRecipeDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		//관리자페이지 로그인 체크
		HttpSession session = req.getSession();
		User admin = (User) session.getAttribute("LOGIN_USER");
		if(admin == null || admin.getRoleType().equals("USER")) {
			res.sendRedirect("login?fail=admin");
			return;
		}
		
		//페이지번호 조회하기
		int pageNo = CommonUtils.stringToInt(req.getParameter("page"), 1);
		
		//SQL 실행에 필요한 파라미터값을 담는 HashMap객체 생성하기
		Map<String, Object> param = new HashMap<String, Object>();
		
		/*게시글 조회하기*/
		//조회범위를 HashMap객체에 추가하기
		param.put("beginIndex", (pageNo-1)*ROWS_PER_PAGE+1);
		param.put("endIndex", pageNo*ROWS_PER_PAGE);
		//HashMap 객체에 추가된 파라미터값으로 게시글 조회하기
		List<Recipe> recipes = recipeDao.getRecipes(param);
		//조회된 게시글을 요청객체의 속성으로 저장하기
		req.setAttribute("recipes", recipes);
		
		/*페이징 처리하기*/
		//HashMap 객체에 추가된 파라미터값으로 게시글 갯수 조회하기
		int totalRows = recipeDao.getTotalRows(param);
		//전체 페이지 갯수 계산하기
		int totalPages = (int) Math.ceil((double)totalRows/ROWS_PER_PAGE);
		//전체 페이지 블록 갯수 계산하기
		int totalPageBlocks = (int) Math.ceil((double) totalPages/PAGES_PER_PAGE_BLOCK);
		//요청한 페이지번호가 속하는 페이지블록번호 계산하기
		int currentPageBlock = (int) Math.ceil((double) pageNo/PAGES_PER_PAGE_BLOCK);
		//현재 페이지블록의 시작페이지 번호와 끝 페이지 번호를 계산하기
		int beginPage = (currentPageBlock - 1)*PAGES_PER_PAGE_BLOCK+1;
		int endPage = currentPageBlock * PAGES_PER_PAGE_BLOCK;
		if(currentPageBlock == totalPageBlocks) {
			endPage = totalPages;
		}
		//페이징처리에 필요한 정보를 Pagination객체에 저장하기
		Pagination pagination = new Pagination();
		pagination.setPageNo(pageNo);
		pagination.setTotalRows(totalRows);
		pagination.setTotalPages(totalPages);
		pagination.setTotalPageBlocks(totalPageBlocks);
		pagination.setCurrentPageBlock(currentPageBlock);
		pagination.setBeginPage(beginPage);
		pagination.setEndPage(endPage);
		// 요청객체의  속성으로 Pagination객체를 저장하기
		req.setAttribute("pagination", pagination);		
		
		req.getRequestDispatcher("/WEB-INF/admin/recipeList.jsp").forward(req, res);
	}
}
