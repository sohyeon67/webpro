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
  <p>html에 java언어를 이용하여 웹페이지를 만든다</p>
  <p>jsp는 서버내에서 실행되는 프로그램</p>
  <p>자바 언어 기술시 &lt;%  %> 기호 사이에 기술한다 </p>
  <p>자바실행후 결과는 &lt;%=  %>을 이용하여 출력한다</p>
  
  <%
  	// 클라이언트가 자료 제출시 입력한 데이터를 가져온다
  	String userId = request.getParameter("id");
  	String userPass = request.getParameter("pass");
  	
  	// userId와 userPass를 이용하여 데이터베이스 CRUD 처리를 한다.
  	// 처리결과를 response를 통하여 클라이언트로 보낸다
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
  </table>
</body>
</html>