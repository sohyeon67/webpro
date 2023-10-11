<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost/boardpro/css/logpro.css">
</head>
<body>

<header>
	<div class="dlog">
		<!-- 로그인/로그아웃 - http session을 이용하여 로그인폼 또는 로그아웃폼을 삽입 
		logpro.jsp를 실행시킨 결과물을 현재 페이지에 삽입 -->
		<jsp:include page="logpro.jsp"></jsp:include>
	</div>
	<br>
	<a href="join.jsp" target="iboard">회원가입</a>&nbsp;&nbsp;&nbsp;
	<a href="../board/board.jsp" target="iboard">게시판</a>
</header>
<section>
	<iframe name="iboard" src="../board/board.jsp"></iframe>
</section>
</body>
</html>