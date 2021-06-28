package com.sb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sb.util.MybatisUtils;
import com.sb.vo.Event;

public class EventDao {
	
	private static EventDao instance = new EventDao();
	
	private EventDao() {
		this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory(); 
	}

	private SqlSessionFactory sqlSessionFactory;
	
	public static EventDao getInstance() {
		return instance;
	}
	
	public List<Event> getActiveEvents(){
		SqlSession session = sqlSessionFactory.openSession();
		List<Event> events = session.selectList("events.getActiveEvents");
		session.close();
		return events;
	}
	
	public List<Event> getAllEvents(){
		SqlSession session = sqlSessionFactory.openSession();
		List<Event> events = session.selectList("events.getAllEvents");
		session.close();
		return events;
	}
	
	public Event getEventByNo(int no) {
		SqlSession session = sqlSessionFactory.openSession();
		Event event = session.selectOne("getEventByNo", no);
		session.close();
		return event;
	}
}
