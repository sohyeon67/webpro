<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 서블릿에서 저장한 데이터 꺼내기
	List<BuyerVO> list = 
					(List<BuyerVO>)request.getAttribute("result");
	
%>
[
	<%
		for(int i=0; i<list.size(); i++) {
			BuyerVO vo = list.get(i);
			if(i > 0) out.print(",");
	%>		
			{
				"buyer_id" : "<%= vo.getBuyer_id() %>",
				"buyer_name" : "<%= vo.getBuyer_name() %>"
			}
	<%
		}
	%>
]
