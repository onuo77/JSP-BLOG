package com.sb.web;

import java.io.IOException;

import com.sb.dao.ReviewDao;
import com.sb.util.CommonUtils;
import com.sb.vo.Review;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/product/itemReviewDelete")
public class ItemDeleteServlet extends HttpServlet{
	
	ReviewDao reviewDao = ReviewDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int reviewNo = CommonUtils.stringToInt(req.getParameter("reviewNo"),0);
		int productNo = CommonUtils.stringToInt(req.getParameter("no"), 1);
		
		reviewDao.deleteReview(reviewNo);
			
		resp.sendRedirect("/sb/product/itemDetail?productNo="+productNo);
	}
}
