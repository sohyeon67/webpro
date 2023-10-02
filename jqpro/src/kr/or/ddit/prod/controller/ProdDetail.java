package kr.or.ddit.prod.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.prod.vo.ProdVO;

@WebServlet("/ProdDetail.do")
public class ProdDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProdDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 클라이언트 요청시 전송데이터 받기 - pid
		String prodId = request.getParameter("pid");
		
		// service객체 얻기
		IProdService service = ProdServiceImpl.getService();
		
		// service메소드 호출 - vo
		ProdVO vo = service.selectByIdDetail(prodId);
		
		// vo 결과값을 request에 저장
		request.setAttribute("result", vo);
		
		// jsp view페이지 설정 - // forward
		request.getRequestDispatcher("0927/prodDetail.jsp").forward(request, response);
		
	}

}
