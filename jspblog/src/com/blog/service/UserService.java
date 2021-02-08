package com.blog.service;

import com.blog.domain.user.User;
import com.blog.domain.user.UserDao;
import com.blog.domain.user.dto.JoinReqDto;
import com.blog.domain.user.dto.LoginReqDto;
import com.blog.domain.user.dto.UpdateReqDto;

public class UserService {
	private UserDao userDao;
	
	public UserService() {
		userDao = new UserDao();
	}
	public int signUp(JoinReqDto dto) {
		int result = UserDao.save(dto);
		return result;
	}
	
	public User signIn(LoginReqDto dto) {
		return UserDao.findByUsernameAndPassword(dto);
	}
	
	public int userInfoModify(int userId, UpdateReqDto dto) {
		return userDao.update(userId, dto);
	}
	
	public int idCheck(String username) {
		int result = UserDao.usernameCheck(username);
		return result;
	}
	
}
