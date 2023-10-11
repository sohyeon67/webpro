package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class LogOut
 */
@WebServlet("/LogOut.do")
public class LogOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogOut() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// session값
		HttpSession session = request.getSession();
		
		MemberVO vo = (MemberVO)session.getAttribute("loginok");
		
		if(vo!=null) { // 로그인이 되어 있는 상태
			session.removeAttribute("loginok");
			session.removeAttribute("check");
		}
		
		request.getRequestDispatcher("/member/logpro.jsp").forward(request, response);
		
	}

}
