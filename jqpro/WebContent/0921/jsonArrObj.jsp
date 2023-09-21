<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//클라이언트 전송시 데이터 받기

	// DB를 이용한 CRUD 처리
	
	// CRUD 처리결과로 응답 데이터를 생성 - json배열객체
	// select * from member;

%>
[
	{
		"name" : "김은대",
		"id" : "a001",
		"tel" : "010-1234-5678",
		"addr" : "대전 서구 둔산동",
		"email" : "kk1234@ddit.or.kr"
	}
	
	,{
		"name" : "성춘향",
		"id" : "b001",
		"tel" : "010-1223-2234",
		"addr" : "대전 동구 판암동",
		"email" : "kk1234@ddit.or.kr"
	}
	
	,{
		"name" : "이쁜이",
		"id" : "c001",
		"tel" : "010-5323-1245",
		"addr" : "대전 유성구 장대동",
		"email" : "kk1234@ddit.or.kr"
	}
	
	,{
		"name" : "갈갈이",
		"id" : "d001",
		"tel" : "010-1212-4455",
		"addr" : "대전 대덕구 법동",
		"email" : "kk1234@ddit.or.kr"
	}
	
	,{
		"name" : "마당발",
		"id" : "e001",
		"tel" : "010-2222-3456",
		"addr" : "대전 중구 문화동",
		"email" : "kk1234@ddit.or.kr"
	}
	
]
