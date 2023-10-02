package kr.or.ddit.prod.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.prod.vo.ProdVO;

@WebServlet("/ProdList.do")
public class ProdList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProdList() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트 요청시 전송 데이터 받기 - lgu
		String lgu = request.getParameter("lgu");
		
		// service객체 얻기
		IProdService service = ProdServiceImpl.getService();
		
		// service메소드 호출 - list
		List<ProdVO> list = service.selectByLgu(lgu);
		
		// list 결과값을 request에 저장
		request.setAttribute("result", list);
		
		// jsp view페이지 설정, forward
		request.getRequestDispatcher("/0927/prodList.jsp").forward(request, response);
		
	}

}
