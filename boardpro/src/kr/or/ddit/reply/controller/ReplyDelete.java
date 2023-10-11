package kr.or.ddit.reply.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.reply.service.IReplyService;
import kr.or.ddit.reply.service.ReplyServiceImpl;

@WebServlet("/ReplyDelete.do")
public class ReplyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 전송 데이터 받기 - renum
		int renum = Integer.parseInt(request.getParameter("renum"));
		
		// service객체
		IReplyService service = ReplyServiceImpl.getInstance();
		
		// service메소드 호출 - int 결과
		int res = service.deleteReply(renum);
		
		// 결과를 request에 저장 - result.jsp에 있는 이름과 일치시키기
		request.setAttribute("result", res);
		
		// view페이지 설정 - forward
		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);
		
		
	}

}
