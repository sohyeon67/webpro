<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 서블릿에서 저장한 데이터 꺼내기
	List<BoardVO> list = (List<BoardVO>)request.getAttribute("boardList");
	int startPage = (Integer)request.getAttribute("startPage");
	int endPage = (Integer)request.getAttribute("endPage");
	int totalPage = (Integer)request.getAttribute("totalPage");
	
	JsonObject obj = new JsonObject();
	obj.addProperty("sp", startPage);
	obj.addProperty("ep", endPage);
	obj.addProperty("tp", totalPage);
	
	Gson gson = new Gson();
	JsonElement jele = gson.toJsonTree(list);	

	obj.add("datas", jele);
	
	out.print(obj);
	out.flush();
	
%>