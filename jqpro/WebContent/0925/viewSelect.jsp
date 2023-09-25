<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 컨트롤러에서 저장한 결과를 꺼내기
List<MemberVO> list = 
		(List<MemberVO>)request.getAttribute("result");

// json형식의 객체 배열을 생성

%>

[
<%
	for(int i=0; i<list.size(); i++) {
		MemberVO vo = list.get(i);
		if(i>0) out.print(",");
%>
		{
			"id" 	: "<%= vo.getMem_id() %>",
			"name" 	: "<%= vo.getMem_name() %>",
			"hp" 	: "<%= vo.getMem_hp() %>",
			"addr" 	: "<%= vo.getMem_add1() %>"
		}

<%	
	}
%>
]