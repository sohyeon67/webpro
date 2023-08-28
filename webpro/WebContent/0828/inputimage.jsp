<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  table {
  	border: 1px solid blue;
  	margin: 20px auto;
  }
  
  td {
  	width: 200px;
  	height: 50px;
  	text-align: center;
  }
  
  h1 {
  	text-align: center;
  	color: red;
  }
  
  tr td:first-child {
  	background: lightblue;
  	font-size: 1.2rem;
  	font-weight: bold;
  }
</style>
</head>
<body>
  <h1>JSP : Java Server Page</h1>
  <%
  	request.setCharacterEncoding("UTF-8");
  	
  	String userId = request.getParameter("id");
  	String userName = request.getParameter("name");
  	String userAddr = request.getParameter("addr");
  	
  %>
  
  <table border="1">
  	<tr>
  	  <td>아이디</td>
  	  <td><%= userId %></td>
  	</tr>
  	
  	<tr>
  	  <td>이름</td>
  	  <td><%= userName %></td>
  	</tr>
  	
  	<tr>
  	  <td>주소</td>
  	  <td><%= userAddr %></td>
  	</tr>
  </table>
</body>
</html>