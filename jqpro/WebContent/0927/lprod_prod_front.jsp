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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function() {
	// 확인 버튼 클릭시 lprodlist 출력
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
				// lprod list출력
				$('#lprod').html(code);
				$('#lprod').trigger('change');
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
					vimg = $("<img src='../images/spongebob.png' alt='spongebob.png'>");
					$('#result1').empty().append(vimg);
				}
				
				// prod list출력
				$('#prod').html(code);
				$('#prod').trigger('change');
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
	
	// prod list 결과 중 option 하나를 선택하면 detail출력
	$(document).on('change', '#prod', function() {
		
		//alert($('option:selected', this).val());
		vdata = $('option:selected', this).val();
		
		if(vdata == 0) return false;
		$.ajax({
			url : '<%= request.getContextPath()%>/ProdDetail.do',
			type : 'post',
			data : { "pid" : vdata },
			success : function(res) {
				code = `<table class="table table-striped">`;
				code += `<tr><th>항목</th><th>내용</th></tr>`;
				code += `<tr><td>PROD_ID</td><td>${res.prod_id}</td></tr>`;
				code += `<tr><td>PROD_NAME</td><td>${res.prod_name}</td></tr>`;
				code += `<tr><td>PROD_LGU</td><td>${res.prod_lgu}</td></tr>`;
				code += `<tr><td>PROD_BUYER</td><td>${res.prod_buyer}</td></tr>`;
				code += `<tr><td>PROD_OUTLINE</td><td>${res.prod_outline}</td></tr>`;
				code += `<tr><td>PROD_SIZE</td><td>${res.prod_size}</td></tr>`;
				code += `<tr><td>PROD_COST</td><td>${res.prod_cost}</td></tr>`;
				code += `<tr><td>PROD_PRICE</td><td>${res.prod_price}</td></tr>`;
				code += `<tr><td>PROD_SALE</td><td>${res.prod_sale}</td></tr>`;
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
<style>
form {
	margin: 20px;
}
img {
	width: 50%;
	height: 50%;
}
</style>
</head>
<body>
<input type="button" value="확인" id="btn1">
<br><br>

<form>
    <label for="lprod" class="form-label">Lprod list</label>
    <select class="form-select" id="lprod" name="sellist1">
      
    </select>
    <br>
    
    <label for="prod" class="form-label">Prod list</label>
    <select class="form-select" id="prod" name="sellist2">
      
    </select>
  </form>

<div id="result1"></div>
<br><br>
</body>
</html>