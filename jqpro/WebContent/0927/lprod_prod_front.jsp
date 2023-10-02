<%@page import="kr.or.ddit.lprod.service.LprodServiceImpl"%>
<%@page import="kr.or.ddit.lprod.service.ILprodService"%>
<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="../css/public.css">
<script src="../js/jquery-3.7.1.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function() {
	// lprodlist 출력
	$('#btn1').on('click', function() {
		
		// 단축메뉴, 각 자리에 값만 써주면 됨
		//$.get(url, data, success, dataType)
		<%-- $.get(
				'<%= request.getContextPath() %>/LprodList.do',
				function(res) {
					
				}, 
				'json') --%>
		
		
		//$.getJSON(url, data, success)
		<%-- $.getJSON(
				'<%= request.getContextPath() %>/LprodList.do', 
				function(res) {
					
				}) --%>
		
		$.ajax({
			url : '<%= request.getContextPath() %>/LprodList.do',
			type: 'get',
			success : function(res) {
				code = "";
				
				$.each(res, function(i, v) {
					code += `<option value="${v.lprod_gu}">${v.lprod_nm}</option>`;
				})
				
				$('#lprod').html(code);
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
	
	
	// lprod의 결과 중 option 하나를 선택하면
	$(document).on('change', '#lprod', function() {
		
		//alert($('option:selected', this).val());
		vdata = $('option:selected', this).val();
		
		$.ajax({
			url : '<%= request.getContextPath()%>/ProdList.do',
			type : 'get',
			data : { "lgu" : vdata },
			success : function(res) {
				code = "";
				
				if(res.sw == "ok") {
					$.each(res.datas, function(i, v) {
						code += `<option value="${v.prod_id}">${v.prod_name}</option>`;
					})
				} else {
					code += `<option value="0">데이터 없음</option>`;
				}
				
				$('#prod').html(code);
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
	
	// prod list 결과 중 option 하나를 선택하면
	$(document).on('change', '#prod', function() {
		
		//alert($('option:selected', this).val());
		vdata = $('option:selected', this).val();
		
		if(vdata == 0) return false;
		$.ajax({
			url : '<%= request.getContextPath()%>/ProdDetail.do',
			type : 'post',
			data : { "pid" : vdata },
			success : function(res) {
				code = `<table border='1'>`;
				code += `<tr><td>항목</td><td>내용</td></tr>`;
				code += `<tr><td>PROD_ID</td><td>${res.prod_id}</td></tr>`;
				code += `<tr><td>PROD_NAME</td><td>${res.prod_name}</td></tr>`;
				code += `<tr><td>PROD_LGU</td><td>${res.prod_lgu}</td></tr>`;
				code += `<tr><td>PROD_COST</td><td>${res.prod_cost}</td></tr>`;
				code += `<tr><td>PROD_PRICE</td><td>${res.prod_price}</td></tr>`;
				code += `<tr><td>PROD_SALE</td><td>${res.prod_sale}</td></tr>`;
				code += `<tr><td>PROD_OUTLINE</td><td>${res.prod_outline}</td></tr>`;
				code += `<tr><td>PROD_DETAIL</td><td>${res.prod_detail}</td></tr>`;
				code += `</table>`;
				
				$('#result1').html(code);
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
	
})
</script>
</head>
<body>
<input type="button" value="확인" id="btn1">
<br><br>

<select id="lprod">
	
</select>

<select id="prod">

</select>

<div id="result1"></div>
<br><br>
</body>
</html>