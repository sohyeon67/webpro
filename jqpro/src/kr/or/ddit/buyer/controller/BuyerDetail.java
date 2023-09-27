package kr.or.ddit.buyer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.buyer.service.BuyerServiceImpl;
import kr.or.ddit.buyer.service.IBuyerService;
import kr.or.ddit.buyer.vo.BuyerVO;

@WebServlet("/BuyerDetail.do")
public class BuyerDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public BuyerDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 클라이언트 요청시 전송 데이터 받기
		String buyerId = request.getParameter("id");
		
		// service객체 얻기
		IBuyerService service = BuyerServiceImpl.getService();
		
		// service메소드 호출 - 결과값 얻기
		BuyerVO vo = service.selectById(buyerId);
		
		// request에 저장
		request.setAttribute("result", vo);
		
		// forward를 위한 객체 얻기 - view페이지 설정
		RequestDispatcher disp = request.getRequestDispatcher("/0926/buyerDetail.jsp");
		
		// forward
		disp.forward(request, response);
	}

}
