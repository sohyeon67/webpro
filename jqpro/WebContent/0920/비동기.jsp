<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userName = request.getParameter("name");
	String userAddr = request.getParameter("addr");
	String userPass = request.getParameter("pass");
%>

<p><%= userName %></p>
<p><%= userAddr %></p>
<p><%= userPass %></p>