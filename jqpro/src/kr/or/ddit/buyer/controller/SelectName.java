package kr.or.ddit.buyer.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.buyer.service.BuyerServiceImpl;
import kr.or.ddit.buyer.service.IBuyerService;
import kr.or.ddit.buyer.vo.BuyerVO;

/**
 * Servlet implementation class SelectName
 */
@WebServlet("/SelectName.do")
public class SelectName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectName() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 클라이언트 요청시 전송 데이터 받기
		
		// service객체 얻어오기
		IBuyerService service = BuyerServiceImpl.getService();
		
		// service메소드 호출 - 결과값 받기 - list
		List<BuyerVO> list = service.selectName();
		
		// request에 결과를 저장
		request.setAttribute("result", list);
		
		// view페이지 설정
		RequestDispatcher disp = request.getRequestDispatcher("/0926/buyerNames.jsp");
		
		// forward
		disp.forward(request, response);
	}

}
