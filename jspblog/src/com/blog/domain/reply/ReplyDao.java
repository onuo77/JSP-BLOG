package com.blog.domain.reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.blog.config.DB;
import com.blog.domain.reply.dto.DeleteReqDto;
import com.blog.domain.reply.dto.SaveReqDto;
import com.blog.domain.reply.dto.SaveRespDto;

public class ReplyDao {
	
	public int save(SaveReqDto dto) { 
		String sql = "INSERT INTO reply(userId, boardId, content, createDate) VALUES (?,?,?,now())";
		Connection conn = DB.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int generateKey;
		
		try {
			pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, dto.getUserId());
			pstmt.setInt(2, dto.getBoardId());
			pstmt.setString(3, dto.getContent());
			int result = pstmt.executeUpdate();
			rs = pstmt.getGeneratedKeys();
			
			if(rs.next()) {
				generateKey = rs.getInt(1);
				if(result==1) {
					return generateKey;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		
		}finally {
			DB.close(conn, pstmt, rs);
		}
		
		return -1;
	}
	
	public SaveRespDto findById(int replyId) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("SELECT r.id, r.userId, u.username, r.content, r.createDate ");
		buffer.append("FROM reply r INNER JOIN user u ");
		buffer.append("ON r.userId = u.id ");
		buffer.append("WHERE r.id = ?");
		
		String sql = buffer.toString();
		Connection conn = DB.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				SaveRespDto dto = SaveRespDto.builder()
						.id(rs.getInt("r.id"))
						.userId(rs.getInt("r.userId"))
						.username(rs.getString("u.username"))
						.content(rs.getString("r.content"))
						.createDate(rs.getTimestamp("r.createDate"))
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
	
	public int deleteById(DeleteReqDto dto) {
		String sql = "DELETE FROM reply WHERE id = ? AND userId = ?";
		Connection conn = DB.getInstance();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getReplyId());
			pstmt.setInt(2, dto.getUserId());
			int result = pstmt.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DB.close(conn, pstmt);
		}
		return -1;
	}
	
	public List<SaveRespDto> findAll(int boardId){
		StringBuffer buffer = new StringBuffer();
		buffer.append("SELECT r.id, r.userId, u.username, r.content, r.createDate ");
		buffer.append("FROM reply r INNER JOIN user u ");
		buffer.append("ON r.userId = u.id ");
		buffer.append("WHERE r.boardId = ? ");
		buffer.append("ORDER BY id DESC");
		
		String sql = buffer.toString();
		Connection conn = DB.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<SaveRespDto> replyList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SaveRespDto dto = SaveRespDto.builder()
						.id(rs.getInt("r.id"))
						.userId(rs.getInt("r.userId"))
						.username(rs.getString("u.username"))
						.content(rs.getString("r.content"))
						.createDate(rs.getTimestamp("r.createDate"))
						.build();
				replyList.add(dto);
			}
			return replyList;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DB.close(conn, pstmt, rs);
		}
		return null;
	}

}
