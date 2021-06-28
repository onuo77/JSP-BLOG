package com.sb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sb.dto.MainDto;
import com.sb.util.MybatisUtils;
import com.sb.vo.Product;

public class MainDao {

	private static MainDao instance = new MainDao();
	private MainDao() {
		this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();
	}
	public static MainDao getInstance() {
		return instance;
	}
	
	private SqlSessionFactory sqlSessionFactory;
	
	public Product getProductInfo(int productNo) {
		SqlSession session = sqlSessionFactory.openSession();
		Product product = session.selectOne("mains.getProductInfo", productNo);
		session.close();
		return product;
	}
	
	public List<Product> getRecentProducts() {
		SqlSession session = sqlSessionFactory.openSession();
		List<Product> products = session.selectList("mains.getRecentProducts");
		session.close();
		return products;
	}
	
	public List<MainDto> getEventProducts(int eventNo) {
		SqlSession session = sqlSessionFactory.openSession();
		List<MainDto> events = session.selectList("mains.getEventProducts", eventNo);
		session.close();
		return events;
	}
}
