package com.sb.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sb.dto.ModifyProduct;
import com.sb.util.MybatisUtils;
import com.sb.vo.EventItem;

public class AdminEventItemDao {
	
	private SqlSessionFactory sqlSessionfactory;
	
	private static AdminEventItemDao instance = new AdminEventItemDao();
	private AdminEventItemDao() {
		this.sqlSessionfactory = MybatisUtils.getSqlSessionFactory();
	}
	public static AdminEventItemDao getInstance(){
		return instance;
	}
	
	/**
	 * EventItem 객체를 전달받아 새로운 기획전 상품을한다.
	 * @param eventItem
	 */
	public void insertEventItem(EventItem eventItem) {
		SqlSession session = sqlSessionfactory.openSession(true);
		session.insert("adminEvents.insertEventItem", eventItem);
		session.close();
	}
	
	/**
	 * 기획전 번호를 전달받아 기획전에 등록된 상품을 삭제한다.
	 * @param eventNo 기획전 번호
	 */
	public void deleteEventProduct(int eventNo) {
		SqlSession session = sqlSessionfactory.openSession(true);
		session.delete("adminEvents.deleteEventProduct", eventNo);
		session.close();		
	}
	
	/**
	 * 기존에 등록되어 있는 상품을 조회한다.
	 * @param selectedProduct 
	 * @return eventNo과 categoryNo으로 조회된 상품 목록
	 */
	public List<ModifyProduct> getSelectedProducts(Map<String, Object> selectedProduct){
		SqlSession session = sqlSessionfactory.openSession();
		List<ModifyProduct> selectedProducts = session.selectList("adminEvents.getSelectedProducts", selectedProduct);
		session.close();			
		return selectedProducts;
	}
	
}
