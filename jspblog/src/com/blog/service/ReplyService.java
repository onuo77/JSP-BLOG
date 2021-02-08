package com.blog.service;

import java.util.List;

import com.blog.domain.reply.ReplyDao;
import com.blog.domain.reply.dto.DeleteReqDto;
import com.blog.domain.reply.dto.SaveReqDto;
import com.blog.domain.reply.dto.SaveRespDto;

public class ReplyService {
	
	ReplyDao replyDao;
	
	public ReplyService() {
		replyDao = new ReplyDao();
	}

	public int commentWrite(SaveReqDto dto) {
		return replyDao.save(dto);
	}
	
	public SaveRespDto commentFind(int replyId) {
		return replyDao.findById(replyId);
	}
	
	public int commentDelete(DeleteReqDto dto) {
		return replyDao.deleteById(dto);
	}
	
	public List<SaveRespDto> commentView(int boardId){
		return replyDao.findAll(boardId);
	}
}
