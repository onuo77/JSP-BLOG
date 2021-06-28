package com.sb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sb.util.MybatisUtils;
import com.sb.vo.User;

public class UserDao {

	public static UserDao instance = new UserDao();
	private UserDao() {
		this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();
	}
	
	public static UserDao getInstance () {
		return instance;
	}
	
	private SqlSessionFactory sqlSessionFactory;
	
	public void insertUser (User user) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.insert("insertUser", user);
		session.close();
	}
	
	public User getUserById(String userId) {
		SqlSession session = sqlSessionFactory.openSession();
		User user = session.selectOne("getUserById", userId); 
		session.close();
		return user;
	}
	
	public User getStat() {
		SqlSession session = sqlSessionFactory.openSession();
		User user = session.selectOne("getStat"); 
		session.close();
		return user;
	}
	
	public User getUserByPwd(String userPwd) {
		SqlSession session = sqlSessionFactory.openSession();
		User user = session.selectOne("getUserByPwd", userPwd);  
		session.close();
		return user;
	}
	
	public List<User> getAllUser() {
		SqlSession session = sqlSessionFactory.openSession();
		List<User> users = session.selectList("users.getAllUser");
		session.close();
		return users;
	}
	
	public void updateUser(User update) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("updateUser", update);
		session.close();
	}
	public void exitUser(User exit) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("exitUser", exit);
		session.close();
	}
	public void passwordChange(User newPwd) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("passwordChange", newPwd);
		session.close();
	}
}
