<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
  
  h1, p {
  	text-align: center;
  }
  
  .title {
  	background: blue;
  	font-size: 1.2rem;
  	font-weight: bold;
  	color: white;
  }
</style>
<body>
  <h1>JSP : Java Server Page</h1>
  <p>클라이언트 전송시 보내진 데이터를 가져온다</p>
  <%
  	request.setCharacterEncoding("utf-8");
  
  	String userId = request.getParameter("id");
  	String userName = request.getParameter("name");
	String userGender = request.getParameter("gender");
	String fr[] = request.getParameterValues("fruit");
	String upfile = request.getParameter("file");
	
	String str="";
  
	for(int i=0; i<fr.length; i++) {
		str += fr[i] + "&nbsp;&nbsp;&nbsp;";
	}
	
	/* for(String ff : fr) {
		str += ff;
	} */
  %>
  
  <table border="1">
  	<tr>
  	  <td class="title">아이디</td>
  	  <td><%= userId %></td>
  	</tr>
  	
  	<tr>
  	  <td class="title">이름</td>
  	  <td><%= userName %></td>
  	</tr>
  	
  	<tr>
  	  <td class="title">파일</td>
  	  <td><%= upfile %></td>
  	</tr>
  	
  	<tr>
  	  <td class="title">성별</td>
  	  <td><%= userGender %></td>
  	</tr>
  	
  	<tr>
  	  <td class="title">과일</td>
  	  <td><%= str %></td>
  	</tr>
  </table>
</body>
</html>