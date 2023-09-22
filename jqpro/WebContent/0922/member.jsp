<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.mybatis.config.MyBatisUtil"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//클라이언트 전송시 데이터 받기 - id, pass - 현재 없음

// DB를 이용한 CRUD 처리
// MybatisUtil - mybatis-config.xml 파일을 재료로 해서
// Factory생성 - SqlSession을 생성 - 
// MybatisUtil에서 SqlSession을 얻어온다
SqlSession sqlSession = MyBatisUtil.getSqlSession();


// SqlSession으로 mapper파일의 sql문을 실행한다 - 결과값을 얻는다
// select * from member
List<MemberVO> list = sqlSession.selectList("member.selectMember");

// CRUD 처리결과로 응답 데이터를 생성 - json배열객체

%>

[
	<%
	for(int i=0; i<list.size(); i++) {
		MemberVO vo = list.get(i);
		if(i>0) out.print(",");
		// json 객체 생성
	%>
		
		<%-- json obj --%>
		{
			"id" : "<%= vo.getMem_id() %>",
			"name" : "<%= vo.getMem_name() %>",
			"hp" : "<%= vo.getMem_hp() %>",
			"addr" : "<%= vo.getMem_add1() %> <%= vo.getMem_add2() %>",
			"mail" : "<%= vo.getMem_mail() %>",
			"pass" : "<%= vo.getMem_pass() %>"
		}
<%
	}
%>

]
