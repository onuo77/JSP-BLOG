package com.blog.web;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.domain.board.dto.CommonRespDto;
import com.blog.domain.reply.dto.DeleteReqDto;
import com.blog.domain.reply.dto.SaveReqDto;
import com.blog.domain.reply.dto.SaveRespDto;
import com.blog.service.ReplyService;
import com.blog.util.Script;
import com.google.gson.Gson;

@WebServlet("/reply")
public class ReplyController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public ReplyController() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String cmd = req.getParameter("cmd");
		ReplyService replyService = new ReplyService();
		HttpSession session = req.getSession();
		
		if(cmd.equals("save")) {
			BufferedReader br = req.getReader();
			String reqData = br.readLine();
			Gson gson = new Gson();
			CommonRespDto<SaveRespDto> respDto = new CommonRespDto<>();
			SaveRespDto saveRespDto = null;
			
			SaveReqDto dto = gson.fromJson(reqData, SaveReqDto.class);
			int replyId = replyService.commentWrite(dto);
			
			if(replyId != -1) {
				saveRespDto = replyService.commentFind(replyId);
				respDto.setData(saveRespDto);
				respDto.setStatusCode(1);
			}else {
				respDto.setStatusCode(-1);
			}
			
			String responseData = gson.toJson(respDto);
			Script.responseData(resp, responseData);
			
		}else if(cmd.equals("delete")){
			BufferedReader br = req.getReader();
			String reqData = br.readLine();
			Gson gson = new Gson();
			CommonRespDto<String> respDto = new CommonRespDto<>();
			
			DeleteReqDto dto = gson.fromJson(reqData, DeleteReqDto.class);
			int result = replyService.commentDelete(dto);
			
			respDto.setStatusCode(result);
			
			String respData = gson.toJson(respDto);
			Script.responseData(resp, respData);
		}
	}
	
}
