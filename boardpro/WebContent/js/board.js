/**
 * 
 */

// 댓글 삭제
$.deleteReplyServer = function() {
	$.ajax({
		url : `${mypath}/ReplyDelete.do`,
		type : 'post',
		data : { "renum" : vidx },
		success : function(res) {
			
			// DB 삭제에 성공했으면 화면에서 삭제
			
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

// 댓글 리스트 가져오기
$.listReplyServer = function() {
	$.ajax({
		url : `${mypath}/ReplyList.do`,
		type : 'post',
		data : { "bonum" : vidx },
		success : function(res) {
		 	rcode = "";
			
			$.each(res, function(i, v) {
				cont = v.cont;
				vcont = cont.replaceAll(/\n/g, "<br>");
				
				rcode += 
					`<div class="reply-body">
					<div class="pp">
						<p class="p1">
							작성자<span class="writer">${v.name}</span>
							날짜<span class="date">${v.redate}</span>
						</p>
						<p class="p2">
							<input idx="${v.renum}" type="button" value="댓글수정" class="action" name="r_modify">
							<input idx="${v.renum}" type="button" value="댓글삭제" class="action" name="r_delete">
						</p>
					</div>
					<p class="p3">${vcont}</p>
		        </div>`;
			}) /* 반복문 끝 */
			
			// 댓글 출력 = card-body
			target.parents('.card').find('.reply-body').remove();
			target.parents('.card').find('.card-body').append(rcode);
			
		}, /* success */
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

// 댓글 저장 
$.insertReplyServer = function() {
	$.ajax({
		url : `${mypath}/ReplyInsert.do`,
		type : 'post',
		data : reply,	/* name, bonum, cont */
		success : function(res) {
			// 댓글 insert에 성공했을때 화면에 댓글 추가하기 위해서
			// 댓글 리스트 가져오기를 수행
			$.listReplyServer();
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}


$.listBoardServer = function(cpage) {
	
	vtype = $('#stype option:selected').val().trim();
	vword = $('#sword').val().trim();
	
	console.log(vtype, vword);
	
	$.ajax({
		url : `${mypath}/BoardList.do`,
		type : 'post',
		data : {
			"page" : cpage,
			"stype" : vtype,
			"sword" : vword
		},
		success : function(res) {
			code = "<div class='container mt-3'>";
			code += "<div id='accordion'>";
			
			$.each(res.datas, function(i, v) {
				code += 
					`<div class="card">
				      <div class="card-header">
				        <a class="collapsed btn action" name="title" idx="${v.num}" data-bs-toggle="collapse" href="#collapse${v.num}">
				         	${v.subject}
				        </a>
				      </div>
				      <div id="collapse${v.num}" class="collapse" data-bs-parent="#accordion">
				        <div class="card-body">
							<div class="pp">
								<p class="p1">
									작성자<span class="writer">${v.writer}</span>
									이메일<span class="emmail">${v.mail}</span>
									조회수<span class="hit">${v.hit}</span>
									날짜<span class="date">${v.wdate}</span>
								</p>
								<p class="p2">
									<input idx="${v.num}" type="button" value="수정" class="action" name="modify">
									<input idx="${v.num}" type="button" value="삭제" class="action" name="delete">
								</p>
							</div>
							<p class="p3">${v.content}</p>
							<p class="p4">
								<textarea rows="" cols="50"></textarea>
								<input idx="${v.num}" type="button" class="action" name="reply" value="등록">
							</p>
				        </div>
				      </div>
				    </div>`;
			})
			
			code += "</div>";
			code += "</div>";
			
			$('#result').html(code);
			
			// 페이지번호 만들기
			pager = pageList(res.sp, res.ep, res.tp);
			
			// 출력
			$('#pageList').html(pager);
			
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
} /* 리스트 끝 */

pageList = function(sp, ep, tp) {
	
	pager = `<ul class="pagination">`;
	
	// 이전
	if(sp > 1) {
		pager += `<li class="page-item"><a id="prev" class="page-link">Previous</a></li>`;
		
	}
	
	// 페이지 번호
	for(i=sp; i<=ep; i++) {
		if(i==currentpage) {
			pager += `<li class="page-item active"><a class="page-link pageno">${i}</a></li>`;
		} else {
			pager += `<li class="page-item"><a class="page-link pageno">${i}</a></li>`;
		}
	}
	
	// 다음
	if(ep < tp) {
		pager += `<li class="page-item"><a id="next" class="page-link">Next</a></li>`;
	}
	
	
	pager += "</ul>";
	
	return pager;
}