package com.sb.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sb.dto.CntDto;
import com.sb.dto.EventProduct;
import com.sb.util.MybatisUtils;
import com.sb.vo.Category;
import com.sb.vo.Event;
import com.sb.vo.Product;

public class AdminEventDao {
	
	private SqlSessionFactory sqlSessionfactory;
	
	private static AdminEventDao instance = new AdminEventDao();
	private AdminEventDao() {
		this.sqlSessionfactory = MybatisUtils.getSqlSessionFactory();
	}
	public static AdminEventDao getInstance(){
		return instance;
	}
		
	/**
	 * Event객체를 전달받아 새로운 기획전을 추가한다.
	 * @param event
	 */
	public void insertEvent(Event event) {
		SqlSession session = sqlSessionfactory.openSession(true);
		session.insert("adminEvents.insertEvent", event);
		session.close();
	}
	
	/**
	 * 기획전 번호를 전달받아 기획전 삭제한다.
	 * @param eventNo 기획전 번호
	 */
	public void deleteEvent(int eventNo) {
		SqlSession session = sqlSessionfactory.openSession(true);
		session.delete("adminEvents.deleteEvent", eventNo);
		session.close();		
	}
	
	/**
	 * 수정된 기획전 정보를 갱신한다.
	 * @param eventNo 기획전 번호
	 */
	public void updateEvent(Event event) {
		SqlSession session = sqlSessionfactory.openSession(true);
		session.update("adminEvents.updateEvent", event);
		session.close();			
	}
	
	/**
	 * 새로 추가되는 event no를 획득한다.
	 * @return 추가되는 event no
	 */
	public int getEventSeqNo() {
		SqlSession session = sqlSessionfactory.openSession();
		int eventNo = session.selectOne("adminEvents.getEventSeqNo");
		session.close();
		return eventNo;				
	}
	
	/**
	 * Admin 메인에서 등록된 기획전과 레시피를 조회한다.
	 * @return 등록된 기획전과 레시피 수
	 */
	public CntDto getCountByTable() {
		SqlSession session = sqlSessionfactory.openSession();
		CntDto cnt = session.selectOne("adminEvents.getCountByTable");
		session.close();
		return cnt;		
	}
	
	/**
	 * 게시글 갯수 조회하기
	 * @param param 
	 * @return 조회된 게시글 개수
	 */
	public int getTotalRows(Map<String, Object> param) {
		SqlSession session = sqlSessionfactory.openSession();
		int totalRows = session.selectOne("adminEvents.getTotalRows", param);
		session.close();
		return totalRows;		
	}
	
	/**
	 * Admin page에서 기획전 조회를 눌렀을 때 목록을 반환한다.
	 * @return 범위 내의 기획전 목록
	 */
	public List<Event> getEvents(Map<String, Object> param){
		SqlSession session = sqlSessionfactory.openSession();
		List<Event> events = session.selectList("adminEvents.getEvents", param);
		session.close();
		return events;
	}
	
	/**
	 * Admin event form에서 추가할 카테고리를 출력한다.
	 * @return 카테고리
	 */	
	public List<Category> getAllCategory(){
		SqlSession session = sqlSessionfactory.openSession();
		List<Category> category = session.selectList("adminEvents.getAllCategory");
		session.close();
		return category;
	}

	/**
	 * Admin event form에서 추가할 상품목록을 출력한다.
	 * @param categoryNo 카테고리 번호
	 * @return 카테고리번호로 찾은 상품목록
	 */
	public List<Product> getProductsByCategoryNo(int categoryNo){
		SqlSession session = sqlSessionfactory.openSession();
		List<Product> products = session.selectList("adminEvents.getProductsByCategoryNo", categoryNo);
		session.close();
		return products;
	}
	
	/**
	 * 기획전에 등록된 정보를 반환한다.
	 * @param eventNo 기획전 번호
	 * @return 기획전 번호로 찾은 기획전 정보
	 */
	public Event getEventInfoByEventNo(int eventNo) {
		SqlSession session = sqlSessionfactory.openSession();
		Event event = session.selectOne("adminEvents.getEventInfoByEventNo", eventNo);
		session.close();
		return event;		
	}
	
	/**
	 * 기획전에 등록된 상품 정보를 반환한다.
	 * @param eventNo 기획전 번호
	 * @return 기획전 번호로 찾은 기획전 상품 정보
	 */
	public List<EventProduct> getProductsByEventNo(int eventNo) {
		SqlSession session = sqlSessionfactory.openSession();
		List<EventProduct> products = session.selectList("adminEvents.getProductsByEventNo", eventNo);
		session.close();
		return products;		
	}
	
	/**
	 * 기획전에 등록된 최근 3건을 조회한다.
	 * @return 최근 3건의 기획전 목록
	 */
	public List<Event> getRecentEvents(){
		SqlSession session = sqlSessionfactory.openSession();
		List<Event> events = session.selectList("adminEvents.getRecentEvents");
		session.close();
		return events;
	}
}
