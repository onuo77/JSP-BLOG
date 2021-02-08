package com.blog.domain.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.blog.config.DB;
import com.blog.domain.board.dto.DetailRespDto;
import com.blog.domain.board.dto.SaveReqDto;
import com.blog.domain.board.dto.UpdateReqDto;

public class BoardDao {
	public int save(SaveReqDto dto) { 
		String sql = "INSERT INTO board(userId, title, content, createDate) VALUES (?,?,?,now())";
		Connection conn = DB.getInstance();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getUserId());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			int result = pstmt.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DB.close(conn, pstmt);
		}
		return -1;
	}
	
	public List<Board> findAll(int page){
		String sql = "SELECT * FROM board ORDER BY id DESC LIMIT ?,4";
		
		Connection conn = DB.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, page*4);
			rs = pstmt.executeQuery();
			
			List<Board> tempBoardList = new ArrayList<>();
		
			while(rs.next()) {
				
				Board tempBoard = Board.builder()
						.id(rs.getInt("id"))
						.userId(rs.getInt("userId"))
						.title(rs.getString("title"))
						.content(rs.getString("content"))
						.readCount(rs.getInt("readCount"))
						.createDate(rs.getTimestamp("createDate"))
						.build();
				
				tempBoardList.add(tempBoard);
			}
			return tempBoardList;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DB.close(conn, pstmt);
		}
		return null;
	}
	
	public int count() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM board";
		Connection conn = DB.getInstance();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DB.close(conn, pstmt, rs);
		}
		return -1;
	}
	
	public DetailRespDto findById(int boardId) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("SELECT b.id,b.userId, b.title, b.content, b.readCount, b.createDate, u.username ");
		buffer.append("FROM board b INNER JOIN user u ");
		buffer.append("ON b.userId = u.id ");
		buffer.append("WHERE b.id=?");
		
		String sql = buffer.toString();
		Connection conn = DB.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				DetailRespDto dto = DetailRespDto.builder()
						.Id(rs.getInt("b.id"))
						.userId(rs.getInt("b.userId"))
						.title(rs.getString("b.title"))
						.content(rs.getString("b.content"))
						.readCount(rs.getInt("b.readCount"))
						.createDate(rs.getTimestamp("b.createDate"))
						.username(rs.getString("u.username"))
						.build();
				return dto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DB.close(conn, pstmt, rs);
		}
		return null;		
	}
	
	public void updateReadCount(int boardId) {
		String sql = "UPDATE board SET readCount = readCount+1 WHERE id = ?";
		Connection conn = DB.getInstance();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardId);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(conn, pstmt);
		}
	}
	
	public int deleteById(int BoardId) {
		String sql = "DELETE FROM board WHERE id = ?";
		Connection conn = DB.getInstance();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, BoardId);
			int result = pstmt.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DB.close(conn, pstmt);
		}
		return -1;
	}
	
	public int update(UpdateReqDto dto) {
		String sql = "UPDATE board SET title = ?, content = ? WHERE id = ?";
		Connection conn = DB.getInstance();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getBoardId());
			int result = pstmt.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DB.close(conn, pstmt);
		}
		
		return -1;
	}
	
	public List<Board> findByKeyword(String keyword, int page){
		List<Board> tempBoardList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM board WHERE title LIKE ? ORDER BY id DESC LIMIT ?,4";
		Connection conn = DB.getInstance();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, page*4);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board tempBoard = Board.builder()
						.id(rs.getInt("id"))
						.userId(rs.getInt("userId"))
						.title(rs.getString("title"))
						.content(rs.getString("content"))
						.readCount(rs.getInt("readCount"))
						.createDate(rs.getTimestamp("createDate"))
						.build();
				tempBoardList.add(tempBoard);
			}
			return tempBoardList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(conn, pstmt, rs);
		}
		return null;
	}
}
