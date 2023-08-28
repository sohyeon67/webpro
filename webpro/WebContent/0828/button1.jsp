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
  	background: blue;
  	font-size: 1.2rem;
  	font-weight: bold;
  	color: white;
  }
</style>
</head>
<body>
  <h1> JSP : Java Server Page</h1>
  
  <%
  	// 클라이언트에서 전송된 데이터 가져오기
  	request.setCharacterEncoding("UTF-8");
  	
  	String userId = request.getParameter("id");
  	String userName = request.getParameter("name");
  	String info = request.getParameter("area");
  	
  	// info에는 엔터기호(\r\n)이 포함되어 있다 - \n을 <br>태그로 변환
  	info = info.replaceAll("\n", "<br>");
  	
  	
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
  	  <td>자기소개</td>
  	  <td><%= info %></td>
  	</tr>
  </table>
</body>
</html>