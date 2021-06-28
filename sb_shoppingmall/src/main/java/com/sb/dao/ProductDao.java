package com.sb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sb.util.MybatisUtils;
import com.sb.vo.Product;

public class ProductDao {

	private static ProductDao instance = new ProductDao();
	private ProductDao() {
		this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();
	}
	public static ProductDao getInstance() {
		return instance;
	}
	
	private SqlSessionFactory sqlSessionFactory;
	
	public Product getProductInfo(int productNo) {
		SqlSession session = sqlSessionFactory.openSession();
		Product product = session.selectOne("getProductInfo", productNo);
		session.close();
		return product;
	}
	
	public List<Product> getProductByNo(int no){
		SqlSession session = sqlSessionFactory.openSession();
		List<Product> products = session.selectList("products.getProductByNo", no);
		session.close();
		return products;
		
	}
	
	public List<Product> updateStockByNo(int no){
		SqlSession session = sqlSessionFactory.openSession();
		List<Product> products = session.selectList("products.updateStockByNo", no);
		session.close();
		return products;
	}
	
	public List<Product> updateAddStockByNo(int no){
		SqlSession session = sqlSessionFactory.openSession();
		List<Product> products = session.selectList("products.updateAddStockByNo", no);
		session.close();
		return products;
	}
	
}
