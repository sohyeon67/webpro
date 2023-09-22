<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.mybatis.config.MyBatisUtil"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- --%>

<%

// 클라이언트에서 전송되는 값을 받는다

// db처리
SqlSession sql = MyBatisUtil.getSqlSession();

List<LprodVO> list = sql.selectList("lprod.selectLprod");

// list로 json 객체 배열을 생성

%>

[
<%
	for(int i=0; i<list.size(); i++) {
		LprodVO vo = list.get(i);
		if(i>0) out.print(",");
%>		
		{
			"id" : "<%= vo.getLprod_id() %>",
			"gu" : "<%= vo.getLprod_gu() %>",
			"nm" : "<%= vo.getLprod_nm() %>"
		}
		
<%	
	}
%>
]