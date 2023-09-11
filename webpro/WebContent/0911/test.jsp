<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%
	// ${}는 jsp에서 el태그로 사용되는 기호
	// ${}를 el태그가 아닌 템플릿 리터럴 기호로 설정해야 한다.
	
	String userId = request.getParameter("id");

%>
<%= userId %>님 환영합니다
<br><br>
<div id="result1"></div>
<script>
str = `protocol : ${location.protocol}<br>`;
str += `hostname : ${location.hostname}<br>`;
str += `port : ${location.port}<br>`;
str += `host : ${location.host}<br>`;
str += `search : ${location.search}<br>`;
str += `pathname : ${location.pathname}<br>`;
str += `href : ${location.href}<br>`

document.querySelector('#result1').innerHTML = str;
</script>
</body>
</html>