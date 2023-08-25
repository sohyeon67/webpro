<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  h1 {
  	color: red;
  }
  
  table {
  	border: 2px solid blue;
  }
  
  td {
  	width: 200px;
  	height: 50px;
  	text-align: center;
  }
</style>
</head>
<body>
  <h1>JSP : Java Server Page</h1>
  <p>클라이언트가 제출한 자료를 받아서 처리하고 결과를 전송하는  back-end 프로그램 </p>
  
  <%
  	String userId = request.getParameter("id");
  	String userName = request.getParameter("name");
  	String userPass = request.getParameter("pass");
  	String userTel = request.getParameter("tel");
  	String userAge = request.getParameter("age");
  	
  	
  %>
  
  <table border="1">
  	<tr>
  	  <td>아이디</td>
  	  <td><%= userId %></td>
  	</tr>
  	<tr>
  	  <td>비밀번호</td>
  	  <td><%= userPass %></td>
  	</tr>
  	<tr>
  	  <td>이름</td>
  	  <td><%= userName %></td>
  	</tr>
  	<tr>
  	  <td>전화번호</td>
  	  <td><%= userTel %></td>
  	</tr>
  	<tr>
  	  <td>나이</td>
  	  <td><%= userAge %></td>
  	</tr>
  </table>
</body>
</html>