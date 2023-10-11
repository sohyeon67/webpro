package kr.or.ddit.reply.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.reply.service.IReplyService;
import kr.or.ddit.reply.service.ReplyServiceImpl;
import kr.or.ddit.reply.vo.ReplyVO;

@WebServlet("/ReplyList.do")
public class ReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 전송 데이터 가져오기
		int bonum = Integer.parseInt(request.getParameter("bonum"));
		
		// service객체
		IReplyService service = ReplyServiceImpl.getInstance();
		
		// 메소드 호출 - 결과 List
		List<ReplyVO> list = service.listReply(bonum);
		
		// 저장
		request.setAttribute("result", list);
		
		// view페이지 설정 - forward
		request.getRequestDispatcher("/boardview/replyList.jsp").forward(request, response);
		
		
	}

}
