package com.blog.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.domain.board.Board;
import com.blog.domain.board.dto.CommonRespDto;
import com.blog.domain.board.dto.DetailRespDto;
import com.blog.domain.board.dto.SaveReqDto;
import com.blog.domain.board.dto.UpdateReqDto;
import com.blog.domain.reply.dto.SaveRespDto;
import com.blog.domain.user.User;
import com.blog.service.BoardService;
import com.blog.service.ReplyService;
import com.blog.util.Script;
import com.google.gson.Gson;

@WebServlet("/board")
public class BoardController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
		
	public BoardController() {
		super();
	}
		
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
		
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cmd = req.getParameter("cmd");
		BoardService boardService = new BoardService();
		ReplyService replyService = new ReplyService();
		RequestDispatcher dis = null;
		
		HttpSession session = req.getSession();
		if(cmd.equals("saveForm")) {
			User principal = (User) session.getAttribute("principal");
			if(principal != null) {
				dis = req.getRequestDispatcher("board/saveForm.jsp");
			}else {
				dis = req.getRequestDispatcher("user/loginForm.jsp");
			}
			
		}else if (cmd.equals("save")) {
			System.out.println(req.getParameter("userId"));
			int userId = Integer.parseInt(req.getParameter("userId"));
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			
			title = title.replace("<","&lt;");
			title = title.replace(">","&gt;");
			
			SaveReqDto dto = SaveReqDto.builder()
					.userId(userId)
					.title(title)
					.content(content)
					.build();
			
			int result = boardService.postWrite(dto);
			if (result == 1) { // Á¤»ó
				dis = req.getRequestDispatcher("index.jsp");
			}else {
				Script.back(resp,"Write Failed");
			}
			
		}else if(cmd.equals("list")) {
			int page = Integer.parseInt(req.getParameter("page"));
			List<Board> boards = boardService.listView(page);	
			int boardCount = boardService.postCount();
			int lastPage = (boardCount - 1) / 4;
			double currentPosition = (double) page/(lastPage) * 100;
			req.setAttribute("lastPage", lastPage);
			req.setAttribute("boardList", boards);
			req.setAttribute("currentPosition", currentPosition);
			
			dis = req.getRequestDispatcher("board/list.jsp");
			
		}else if(cmd.equals("detail")) {
			int boardId = Integer.parseInt(req.getParameter("boardId"));
			List<SaveRespDto> replyList = replyService.commentView(boardId);
			DetailRespDto dto = boardService.detailView(boardId);
			req.setAttribute("board", dto);
			req.setAttribute("replyList", replyList);
			dis = req.getRequestDispatcher("board/openDetail.jsp");
			
			
			
		}else if(cmd.equals("delete")) {
			int boardId = Integer.parseInt(req.getParameter("boardId"));
			int result = boardService.postDelete(boardId);
			
			CommonRespDto<String> respDto = new CommonRespDto<>();
			respDto.setStatusCode(result);
			respDto.setData("SUCESS");
			
			Gson gson = new Gson();
			String respData = gson.toJson(respDto);
			
			PrintWriter out = resp.getWriter();
			out.print(respData);
			out.flush();
			return;
			
		}else if(cmd.equals("updateForm")) {
			int boardId = Integer.parseInt(req.getParameter("boardId"));
			DetailRespDto dto = boardService.detailView(boardId);
			req.setAttribute("board", dto);
			dis = req.getRequestDispatcher("board/updateForm.jsp");
		
		}else if(cmd.equals("update")) {
			int boardId = Integer.parseInt(req.getParameter("boardId"));
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			UpdateReqDto dto = UpdateReqDto.builder()
					.boardId(boardId)
					.title(title)
					.content(content)
					.build();
			
			int result = boardService.postModify(dto);
			if(result == 1) {
				dis = req.getRequestDispatcher("board?cmd=detail&id="+boardId);
			}else {
				Script.back(resp, "Failed to modify");
			}
		
		}else if(cmd.equals("search")) {
			int page = Integer.parseInt(req.getParameter("page")); 
			String keyword = req.getParameter("keyword");
			List<Board> boards = boardService.keywordSearch(keyword,page);	
			int boardCount = boardService.postCount(keyword);
			int lastPage = (boardCount - 1) / 4;
			double currentPosition = (double) page/(lastPage) * 100;
			req.setAttribute("lastPage", lastPage);
			req.setAttribute("boardList", boards);
			req.setAttribute("currentPosition", currentPosition);		
			
			dis = req.getRequestDispatcher("board/search.jsp");
		
		}
		
		
		dis.forward(req, resp);

	}
				
}

