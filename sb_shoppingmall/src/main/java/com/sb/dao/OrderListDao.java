package com.sb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sb.dto.CartitemDto;
import com.sb.dto.OrderListDto;
import com.sb.util.MybatisUtils;
import com.sb.vo.CartItem;
import com.sb.vo.OrderList;
import com.sb.vo.Product;

public class OrderListDao {
	private static OrderListDao instance = new OrderListDao();

	private SqlSessionFactory sqlSessionFactory;
	
	private OrderListDao() {
		this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();
	}
	
	public static OrderListDao getInstance() {
		return instance;
	}
	
	
	public void insertOrderList(OrderList orderList) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.insert("orderList.insertOrderList", orderList);
		session.close();
	}
	
	public void deleteOrderList(int no) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.delete("deleteOrderList", no);
		session.close();
	}
	
	public List<OrderListDto> getOrderListByUserId(String userId){
		SqlSession session = sqlSessionFactory.openSession();
		List<OrderListDto> items = session.selectList("orderList.getOrderListByUserId", userId);
		session.close();
		return items;
	}
	
	public List<OrderList> getOrderItemListByUserId(String userId){
		SqlSession session = sqlSessionFactory.openSession();
		List<OrderList> items = session.selectList("orderList.getOrderListByUserId", userId);
		session.close();
		return items;
	}
	
	public List<CartItem> getCartListByUserId(String userId){
		SqlSession session = sqlSessionFactory.openSession();
		List<CartItem> items = session.selectList("getCartListByUserId", userId);
		session.close();
		return items;
	}
	
	public OrderList getOrderItemByNo(int itemNo) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		OrderList item = sqlSession.selectOne("getOrderItemByNo", itemNo);
		sqlSession.close();
		return item;
	}
	
	public List<OrderList> updateAmountByNo(int no){
		SqlSession session = sqlSessionFactory.openSession();
		List<OrderList> item = session.selectList("orderList.updateAmountByNo", no);
		session.close();
		return item;
	}
}
