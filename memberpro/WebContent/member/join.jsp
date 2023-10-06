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
<style>
input[type=button] {
	margin: 5px;
	border-radius: 30px;
}

.ziptr:hover {
	background : crimson;
}

</style>
<script>
proc1 = () => {
	
	dongvalue = $('#dong').val().trim();
	console.log(dongvalue);
	
	if(dongvalue.length < 1) {
		alert("동이름 입력");
		return false;
	}
	
	dongreg = /^[가-힣]+$/;
	
	if(!(dongreg.test(dongvalue))) {
		alert("형식오류~~");
		return false;
	}
	
	$.ajax({
		url : 'http://localhost/memberpro/SelectByDong.do',
		data : { "dong" : dongvalue },
		type : 'post',
		success : function(res) {
			
			code = "<table class='table table-hover'>";
			code += "<tr><th>우편번호</th><th>주소</th><th>번지</th></tr>";
			$.each(res, function(i, v) {
				
				bunji = v.bunji;
				if(typeof bunji == "undefined") bunji = "";
				
				code += `<tr class="ziptr"><td>${v.zipcode}</td>`;
				code += `<td>${v.sido} ${v.gugun} ${v.dong}</td>`;
				code += `<td>${bunji}</td><tr>`;
			})
			code += "</table>";
			
			$('#result1').html(code);
			
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	}) // ajax
	
} // proc1

$(function() {
	// 우편번호 검색 결과에서 한 행을 선택하면
	$(document).on('click', '.ziptr', function() {
		zipcode = $('td:eq(0)', this).text();
		add1 = $('td:eq(1)', this).text();
				
		$('#zip').val(zipcode);
		$('#add1').val(add1);

		$('#dong').val("");
		$('#result1').empty();
		$('#myModal').modal('hide');
	})
	
	$('input[value=중복검사]').on('click', function() {
		
		// 입력한 값 가져오기
		idvalue = $('#id').val().trim();
		console.log(idvalue);
		
		// 값의 형식비교
		idreg = /^[a-z][a-zA-Z0-9]{3,7}$/;
		if(!(idreg.test(idvalue))) {
			alert("id형식오류 입니다");
			return false;
		}
		
		// 서버로 전송
		$.ajax({
			url : "<%= request.getContextPath()%>/IdCheck.do",
			data : { "id" : idvalue },
			type : 'get',
			success : function(res) {
				$('#idcheck').text(res.flag).css('color', 'red');
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
	
	// 우편번호 검색
	$('#zipbtn').on('click', function() {
		window.open("searchDong.html", "우편번호찾기", "width=500 height=400");
	})
	
	// 가입하기
	// submit버튼이 아니고 type=button일 경우
	$('button[type=button]').on('click', function() {
		
		/* // 입력한 모든 값을 가져온다
		idvalue = $('#id').val();
		// 공백 또는 형식 체크 - return false;
		namevalue = $('#name').val();
		birvalue = $('#bir').val();
		passvalue = $('#pwd').val();
		hpvalue = $('#hp').val();
		emailvalue = $('#email').val();
		zipvalue = $('#zip').val();
		add1value = $('#add1').val();
		add2value = $('#add2').val();
		
		vdata = {	"id" : idvalue, 
					"name" : namevalue, 
					"bir" : birvalue,
					"pass" : passvalue,
					"hp" : passvalue,
					"email" : emailvalue,
					"zip" : zipvalue,
					"add1" : add1value,
					"add2" : add2value
				}; */
		
		// name 속성을 이용하여 자동으로 만들기
		sv = $('form').serialize();
		vdata = $('form').serializeArray();
		console.log(sv);
		console.log(vdata);
		
		<%-- $.ajax({
			url : "<%= request.getContextPath()%>/Insert.do",
			data : vdata,
			type : 'post',
			success : function(res) {
				//location.href="http://www.naver.com";	// 서블릿으로 보내거나?
				$('#join').html(res.sw).css('color', 'red');
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		}) --%>
	})
	
})
</script>
</head>
<body>

<div class="container mt-3">
  <h2>회원가입</h2>
  <form>
    <div class="mb-3 mt-3 col-sm-3">
      <label for="id">아이디</label>
      <input type="button" value="중복검사" class="btn btn-success btn-sm">
      <span id="idcheck"></span>
      <input type="text" class="form-control" id="id" name="mem_id">
    </div>

    <div class="mb-3 col-sm-3">
      <label for="id">이름</label>
      <input type="text" class="form-control" id="name" name="mem_name">
    </div>
      
    <div class="mb-3 col-sm-3">
      <label for="id">생년월일</label>
      <input type="date" class="form-control" id="bir" name="mem_bir">
    </div>
    
    <div class="mb-3 col-sm-3">
      <label for="pwd">비밀번호</label>
      <input type="password" class="form-control" id="pwd" name="mem_pass">
    </div>
    
    <div class="mb-3 col-sm-3">
      <label for="hp">전화번호</label>
      <input type="text" class="form-control" id="hp" name="mem_hp">
    </div>
    
    <div class="mb-3 col-sm-3">
      <label for="email">이메일</label>
      <input type="email" class="form-control" id="email" name="mem_mail">
    </div>
    
    <div class="mb-3 col-sm-3">
      <label for="zip">우편번호</label>
      <input type="button" value="번호검색" class="btn btn-success btn-sm" id="zipbtn">
      
      <input type="button" value="번호검색모달" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#myModal">
      <input type="text" class="form-control" id="zip" name="mem_zip">
    </div>
    
    <div class="mb-3 col-sm-3">
      <label for="add1">주소</label>
      <input type="text" class="form-control" id="add1" name="mem_add1">
    </div>
    
    <div class="mb-3 col-sm-6">
      <label for="add2">상세주소</label>
      <input type="text" class="form-control" id="add2" name="mem_add2">
    </div>

    <button type="button" class="btn btn-primary btn-lg">Submit</button>
    <span id="join"></span>
  </form>
</div>


<!-- 우편번호 Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">우편번호 찾기</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <p>찾는 동이름을 입력하세요</p>
		<input type="text" id="dong">
		<input type="button" value="확인" id="btn1" onclick="proc1()">
		<br><br>
		<div id="result1"></div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

</body>
</html>