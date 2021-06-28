package com.sb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sb.util.MybatisUtils;
import com.sb.vo.Review;


public class ReviewDao {

	private static ReviewDao instance = new ReviewDao();
	private ReviewDao() {
		this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();
	}
	public static ReviewDao getInstance() {
		return instance;
	}
	
	private SqlSessionFactory sqlSessionFactory;
	
	public List<Review> getReviewsByProductNo(int productNo) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Review> reviews = session.selectList("getReviewsByProductNo", productNo);
		session.close();
		return reviews;
	}
	
	public void insertReview(Review review) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.insert("insertReview", review);
		session.close();
	}
	
	public void deleteReview(int reviewNo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.delete("deleteReview", reviewNo);
		session.close();
		
	}
}
