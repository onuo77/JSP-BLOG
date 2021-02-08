package com.blog.service;

import java.util.List;

import com.blog.domain.board.Board;
import com.blog.domain.board.BoardDao;
import com.blog.domain.board.dto.DetailRespDto;
import com.blog.domain.board.dto.SaveReqDto;
import com.blog.domain.board.dto.UpdateReqDto;

public class BoardService {
	
	private BoardDao boardDao;
	
	public BoardService() {
		boardDao = new BoardDao();
	}
	
	public int postWrite(SaveReqDto dto) {
		return boardDao.save(dto);
	}
	
	public List<Board> listView(int page){
		return boardDao.findAll(page);
	}
	
	public int postCount() {
		return boardDao.count();	
	}
	
	public int postCount(String keyword) {
		return boardDao.count();
	}
	
	public DetailRespDto detailView(int boardId) {
		boardDao.updateReadCount(boardId);
		return boardDao.findById(boardId);
	}
	
	public int postDelete(int boardId) {
		return boardDao.deleteById(boardId);
	}
	
	public int postModify(UpdateReqDto dto) {
		return boardDao.update(dto);
	}
	
	public List<Board> keywordSearch(String keyword, int page){
		return boardDao.findByKeyword(keyword, page);
	}
}
