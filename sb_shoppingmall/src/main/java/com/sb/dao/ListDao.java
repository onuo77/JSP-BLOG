package com.sb.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sb.util.MybatisUtils;
import com.sb.vo.Product;

public class ListDao {
	private static ListDao instance = new ListDao();
	
	private ListDao() {
		this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory(); 
	}

	private SqlSessionFactory sqlSessionFactory;
	
	public static ListDao getInstance() {
		return instance;
	}
	
	public int getProductsByEventTotalRows(int no) {
		SqlSession session = sqlSessionFactory.openSession();
		int totalRows = session.selectOne("lists.getProductsByEventTotalRows", no);
		session.close();
		return totalRows;
	}
	
	public List<Product> getProductsByEvent(Map<String, Object> param){
		SqlSession session = sqlSessionFactory.openSession();
		List<Product> events = session.selectList("lists.getProductsByEventNo", param);
		session.close();
		return events;
	}
	
	public List<Product> getProductsByRecipe(int no){
		SqlSession session = sqlSessionFactory.openSession();
		List<Product> events = session.selectList("lists.getProductsByRecipe", no);
		session.close();
		return events;
	}
	
	public int getAllProductsTotalRows(Map<String, Object> param){
		SqlSession session = sqlSessionFactory.openSession();
		int totalRows = session.selectOne("getAllProductsTotalRows", param);
		session.close();
		return totalRows;
	}
	
	public List<Product> getAllProductsUpToDate(Map<String, Object> param){
		SqlSession session = sqlSessionFactory.openSession();
		List<Product> events = session.selectList("lists.getAllProductsUpToDate", param);
		session.close();
		return events;
	}
	
	public String getCateNameByCateNo(int no) {
		SqlSession session = sqlSessionFactory.openSession();
		String categoryName = session.selectOne("lists.getCateNameByCateNo", no);
		session.close();
		return categoryName;
	}
	
	public int getProductsByCateTotalRows(int no) {
		SqlSession session = sqlSessionFactory.openSession();
		int totalRows = session.selectOne("lists.getProductsByCateTotalRows", no);
		session.close();
		return totalRows;
	}
	
	public List<Product> getProductsByCateUpToDate(Map<String, Object> param){
		SqlSession session = sqlSessionFactory.openSession();
		List<Product> events = session.selectList("lists.getProductsByCateUpToDate", param);
		session.close();
		return events;
	}
	public int getProductsThisMonthTotalRows(Map<String, Object> param) {
		SqlSession session = sqlSessionFactory.openSession();
		int totalRows = session.selectOne("lists.getProductsThisMonthTotalRows", param);
		session.close();
		return totalRows;
	}
	
	public List<Product> getProductsThisMonthUpToDate(Map<String, Object> param){
		SqlSession session = sqlSessionFactory.openSession();
		List<Product> events = session.selectList("lists.getProductsThisMonthUpToDate", param);
		session.close();
		return events;
	}
	
}
