package com.sb.web;

import java.io.IOException;
import java.util.List;

import com.sb.dao.MainDao;
import com.sb.dao.ReviewDao;
import com.sb.util.CommonUtils;
import com.sb.vo.Product;
import com.sb.vo.Review;
import com.sb.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/product/itemDetail")
public class ItemDetailServlet extends HttpServlet{
	
	MainDao mainDao = MainDao.getInstance();
	ReviewDao reviewDao = ReviewDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int productNo = CommonUtils.stringToInt(req.getParameter("productNo"));
		
		Product product = mainDao.getProductInfo(productNo);
		req.setAttribute("product", product);
		
		List<Review> reviews = reviewDao.getReviewsByProductNo(productNo);
		req.setAttribute("reviews", reviews);
		
		req.getRequestDispatcher("/WEB-INF/views/main/itemdetail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int productNo = Integer.parseInt(req.getParameter("no"));
		int rating = Integer.parseInt(req.getParameter("opt"));
		String comment = req.getParameter("comment");

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("LOGIN_USER"); 
				
		Review review = new Review();
		review.setRating(rating);
		review.setContent(comment);
		review.setProductNo(productNo);
		review.setUserId(user.getId());
		
		reviewDao.insertReview(review);
		
		resp.sendRedirect("/sb/product/itemDetail?productNo="+productNo);
	}
}
