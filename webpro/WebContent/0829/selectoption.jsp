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
  	text-align: center;
  }
  
  table {
  	border: 2px solid blue;
  	margin: 20px auto;
  }
  
  td {
  	width: 400px;
  	height: 50px;
  	text-align: center;
  }

  th {
  	width: 400px;
  	background: lightgreen;
  }  
</style>
</head>
<body>
  <h1>JSP : Java Server Page</h1>
  
  <%
  	request.setCharacterEncoding("utf-8");
  
  	String userId = request.getParameter("id");
  	String userPass = request.getParameter("pass");
  	String userBir = request.getParameter("bir");
  	String food = request.getParameter("food");
  	
  	String foodmulti[] = request.getParameterValues("foodmulti");
  	
  	String str = "";
  	if(foodmulti != null && foodmulti.length > 0) {
	  	for(int i=0; i<foodmulti.length; i++) {
	  		str += foodmulti[i] + "&nbsp;&nbsp;&nbsp;";
	  	}
  	}
  %>
  
  <table border="1">
  	<tr>
  	  <th>아이디</th>
  	  <td><%= userId %></td>
  	</tr>
  	
  	<tr>
  	  <th>비밀번호</th>
  	  <td><%= userPass %></td>
  	</tr>
  	
  	<tr>
  	  <th>생일</th>
  	  <td><%= userBir %></td>
  	</tr>
  	
  	<tr>
  	  <th>좋아하는 음식</th>
  	  <td><%= food %></td>
  	</tr>
  	
  	<tr>
  	  <th>좋아하는 음식들</th>
  	  <td><%= str %></td>
  	</tr>
  </table>
</body>
</html>