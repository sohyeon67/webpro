package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class Insert
 */
@WebServlet("/Insert.do")
public class Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Insert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		// 전송 데이터 받기
		String id = request.getParameter("mem_id");
		String name = request.getParameter("mem_name");
		String bir = request.getParameter("mem_bir");
		String pass = request.getParameter("mem_pass");
		String hp = request.getParameter("mem_hp");
		String email = request.getParameter("mem_mail");
		String zip = request.getParameter("mem_zip");
		String add1 = request.getParameter("mem_add1");
		String add2 = request.getParameter("mem_add2");
		
		// service 객체 얻기
		IMemberService service = MemberServiceImpl.getInstance();
		
		MemberVO vo = new MemberVO();
		vo.setMem_id(id);
		vo.setMem_name(name);
		vo.setMem_bir(bir);
		vo.setMem_pass(pass);
		vo.setMem_hp(hp);
		vo.setMem_mail(email);
		vo.setMem_zip(zip);
		vo.setMem_add1(add1);
		vo.setMem_add2(add2);
		
		// service 메소드 호출 - int
		int res = service.insertMember(vo);
		
		// int를 저장
		request.setAttribute("result", res);
		request.setAttribute("name", name);
		
		// view페이지(/view/insert.jsp) 설정 - forward
		request.getRequestDispatcher("/view/insert.jsp").forward(request, response);
	}

}
