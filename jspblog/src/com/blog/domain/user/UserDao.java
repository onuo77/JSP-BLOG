package com.blog.domain.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.blog.config.DB;
import com.blog.domain.user.dto.JoinReqDto;
import com.blog.domain.user.dto.LoginReqDto;
import com.blog.domain.user.dto.UpdateReqDto;

public class UserDao {

	public static int save(JoinReqDto dto) { //회원가입
		String sql = "INSERT INTO user(username, password, email, address, userRole, createDate)"
				+"VALUES(?,?,?,?,'USER', now())";
		Connection conn = DB.getInstance();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUsername());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getAddress());
			int result = pstmt.executeUpdate();
			return result;
		}catch (Exception e) {
			e.printStackTrace();
		}finally { //무조건실행
			DB.close(conn, pstmt);
		}
		return -1;
	}
	
	public int update(int userId, UpdateReqDto dto) { //회원수정
		String sql = "UPDATE user SET password = ?, email = ?, address = ? WHERE id = ?";
		Connection conn = DB.getInstance();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPassword());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getAddress());
			pstmt.setInt(4, userId);
			int result = pstmt.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DB.close(conn, pstmt);
		}
		return -1;
	}
	
	public static int usernameCheck(String username) { //ID 중복체크
		String sql = "SELECT * FROM user WHERE username=?";
		Connection conn = DB.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DB.close(conn, pstmt, rs);
		}
		return -1;
	}
	
	public void findById() { //회원정보보기
		
	}
	
	public static int findByUsername(String username) {
		
		String sql = "SELECT * FROM user WHERE username=?";
		Connection conn = DB.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DB.close(conn, pstmt, rs);
		}
		
		return -1;
	}

	public static User findByUsernameAndPassword(LoginReqDto dto) {
		
		String sql = "SELECT id,username, email, address FROM user WHERE username = ? AND password = ?";
		Connection conn = DB.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUsername());
			pstmt.setString(2, dto.getPassword());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				User user = User.builder()
						.id(rs.getInt("id"))
						.username(rs.getString("username"))
						.email(rs.getString("email"))
						.address(rs.getString("address"))
						.build();
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(conn, pstmt, rs);
		}
		return null;
	}
}
