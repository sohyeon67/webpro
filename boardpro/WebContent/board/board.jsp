<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.7.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="../js/board.js"></script>

<%
	// 로그인 상태 체크
	MemberVO vo = (MemberVO)session.getAttribute("loginok");
	String jsonStr = null;
	
	Gson gson = new Gson();
	
	if(vo!=null) jsonStr = gson.toJson(vo);
	/* jsonStr = {  "mem_id" : "a001",
					"mem_pass" : "asdfasdf",
					"mem_name" : "김은대" } 
	*/

%>

<script>
//스크립트 변수로 변환
mvo = <%= jsonStr%>;	/* mvo.mem_id, mvo.mem_pass, mvo.mem_name */	

mypath = "<%=request.getContextPath()%>";
currentpage = 1;
reply = {};	// 객체 동적으로 추가 - reply.bonum, reply.name, reply.cont

$(function() {
	
	// 실행 하자마자 리스트 출력 - stype, sword 없다
	$.listBoardServer(currentpage);
	
	// 페이지 번호 클릭 이벤트
	$(document).on('click', '.pageno', function() {
		currentpage = parseInt($(this).text().trim());
		$.listBoardServer(currentpage);
	})
	
	// 다음 클릭 이벤트
	$(document).on('click', '#next', function() {
		currentpage = parseInt($('.pageno').last().text()) + 1;
		$.listBoardServer(currentpage);
	})
	
	// 이전 클릭 이벤트
	$(document).on('click', '#prev', function() {
		currentpage = parseInt($('.pageno').first().text()) - 1;
		$.listBoardServer(currentpage);
	})
	
	// search검색 이벤트
	$(document).on('click', '#search', function() {
		currentpage = 1;
		$.listBoardServer(currentpage);
	})

	// 수정, 삭제, 댓글 등록, 제목클릭, 댓글 삭제, 댓글 수정 이벤트
	$(document).on('click', '.action', function() {
		
		target = $(this);	// 전역변수. board.js에서도 사용 가능
		vname = $(this).attr('name');
		vidx = $(this).attr('idx');
		
		if(vname == "delete") {
			alert(vidx + "번 글을 삭제합니다");
		} else if(vname == "title") {
			//alert(vidx + "번글의 댓글을 출력합니다");
			
			// ajax수행 - 댓글 출력
			$.listReplyServer();
			
			
		} else if(vname == "modify") {
			alert(vidx + "번 글을 수정합니다");
		} else if(vname == "reply") {
			//alert(vidx + "번 글에 댓글을 씁니다");
			
			// 입력한 내용 가져오기
			vcont = $(this).prev().val();
			console.log(vcont);
			
			reply.name = mvo.mem_name;
			reply.bonum = vidx;
			reply.cont = vcont;
			
			console.log(reply);
			
			// ajax수행 - 댓글 저장
			$.insertReplyServer();
			
			// 방금 쓴 자기 댓글을 화면에 추가(여기서 하면 안됨)
			// insert가 성공한 다음에 추가해야 함
			
			// 입력한 댓글 값 지우기
			$(this).prev().val("");
		} else if(vname == "r_modify") {
			//alert(vidx + "번 댓글을 수정합니다.");
		} else if(vname == "r_delete") {
			//alert(vidx + "번 댓글을 삭제합니다.");
			
			// ajax 수행 - 댓글 삭제
			$.deleteReplyServer();
			
		}
	}) // click 이벤트
	
}) // $(function)
</script>
<style>
.card-body {
	display : flex;
	flex-direction: column;
}
p {
	border : 1px dotted gold;
	margin : 2px;
	padding : 3px;
}
.pp {
	display : flex;
	flex-direction: row;
}
.p1 {
	flex : 70%;
}
.p2 {
	flex : 30%;
}
nav {
	margin : 2%;
}
nav a {
	/* display : none; */
	visibility : hidden;
}
#pageList {
	margin : 2%;
	margin-left : 10%;
}
input[name=reply] {
	height : 50px;
	vertical-align: top;
}
.reply-body {
	border : 2px dotted orange;
	background: #dadade;
	margin : 3px;
	padding : 5px;
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="javascript:void(0)">Logo</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mynavbar">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">Link</a>
        </li>
      </ul>
      <form class="d-flex">
      	<select class="form-select" id="stype">
      		<option value="">전체</option>
      		<option value="writer">작성자</option>
      		<option value="subject">제목</option>
      		<option value="content">내용</option>
      	</select>
      	
        <input class="form-control me-2" id="sword" type="text" placeholder="Search">
        <button id="search" class="btn btn-primary" type="button">Search</button>
      </form>
    </div>
  </div>
</nav>
<br><br>

<div id="result"></div>
<div id="pageList"></div>
</body>
</html>