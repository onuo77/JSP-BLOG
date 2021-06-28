package com.sb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sb.dto.CartitemDto;
import com.sb.util.MybatisUtils;
import com.sb.vo.CartItem;
import com.sb.vo.Product;

public class CartItemDao {
	
	private static CartItemDao instance = new CartItemDao();

	private SqlSessionFactory sqlSessionFactory;
	
	private CartItemDao() {
		this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();
	}
	
	public static CartItemDao getInstance() {
		return instance;
	}
	
	public List<CartitemDto> getCartItemsByUserId(String userId){
		SqlSession session = sqlSessionFactory.openSession();
		List<CartitemDto> items = session.selectList("cartItems.getCartItemsByUserId", userId);
		session.close();
		return items;
	}
	
	public List<Product> getOrderListByProductNo(int no){
		SqlSession session = sqlSessionFactory.openSession();
		List<Product> items = session.selectList("orderList.getOrderListByProductNo", no);
		session.close();
		return items;
	}
	
	public void insertCartItem(CartItem cartItem) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.insert("insertCartItem", cartItem);
		session.close();
	}
	
	public CartItem getCartItemByNo(int itemNo) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		CartItem item = sqlSession.selectOne("getCartItemByNo", itemNo);
		sqlSession.close();
		return item;
	}
	
	public List<CartItem> getCartItemListByNo(String userId) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<CartItem> item = sqlSession.selectList("cartItems.getCartItemListByNo", userId);
		sqlSession.close();
		return item;
	}
	
	public List<CartItem> updateAmountByNo(int no){
		SqlSession session = sqlSessionFactory.openSession();
		List<CartItem> item = session.selectList("cartItems.updateAmountByNo", no);
		session.close();
		return item;
	}
	
	/*
	public List<Product> getCartItemByUserId(String userId) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<Product> item = sqlSession.selectOne("getCartItemByNo", userId);
		sqlSession.close();
		return item;
	}*/
	
	public void deleteCartItem(int itemNo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.delete("deleteCartItem", itemNo);
		session.close();
	}
	
	public void deleteAllCartItem(String userId) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.delete("deleteAllCartItem", userId);
		session.close();
	}
	
	
	
}
