package kr.or.ddit.board.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

@WebServlet("/BoardUpdate.do")
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// 전송 데이터 받기 - vo에 저장하기
		BoardVO vo = new BoardVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		vo.setWip(request.getRemoteAddr());
		
		// service객체 얻기
		IBoardService service = BoardServiceImpl.getInstance();
		
		// service 메소드 호출
		int res = service.updateBoard(vo);
		
		// view 페이지 설정 - forward
		request.setAttribute("result", res);
		
		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);
		
		
	}

}
