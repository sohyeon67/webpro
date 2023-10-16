/**
 * 
 */
// 댓글 수정하기
$.updateReplyServer = function() {
	
	$.ajax({
		url : `${mypath}/ReplyUpdate.do`,
		type : 'post',
		data : reply,	// cont, renum
		success : function(res) {
			// 성공 후 화면 변경
			if(res.sw == "성공") {
				$(vp3).html(vnewcont);
			}
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
	
}

// 게시판 글 수정
//function $.updateBoardServer() { }
//$.updateBoardServer = () => { }
$.updateBoardServer = function() {
	
	$.ajax({
		url : `${mypath}/BoardUpdate.do`,
		type : 'post',
		// vdata는 수정창에서 전송 버튼을 클릭했을 때 form의 내용들
		data : vdata,	// num, writer, subject, , password, mail, content
		success : function(res) {
			if(res.sw == "성공") {
				// vdata의 내용으로 화면의 본문 내용을 변경
				// 수정된 내용으로 변경
				
				vparent.find('a').text(vdata.subject);
				vparent.find('.bpass').text(vdata.password);
				vparent.find('.writer').text(vdata.writer);
				vparent.find('.email').text(vdata.mail);
				
				cont = vdata.content;
				cont = cont.replace(/\n/g, "<br>");
				vparent.find('.p3').html(cont);	// <br>태그가 포함
			}
		},
		dataType : 'json',
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		}
	})
}

// 조회수 증가
$.updateHitServer = function() {
	$.ajax({
		url : `${mypath}/BoardHitUpdate.do`,
		type : 'get',
		data : { "num" : vidx },
		success : function(res) {
			if(res.sw == "성공") {
				// boardlist를 다시 불러오면 아코디언 닫힘..
				// 화면부분의 조회수를 변경
				// 공통 조상 찾기 -> 후손(class=hit)을 찾는다
				// 여기서는 this를 쓸 수 없어서 board.jsp에서 target을 주었음
				vhit = target.parents('.card').find('.hit');
				
				// 값을 가져온다 - 1증가
				hitvalue = parseInt($(vhit).text()) + 1;
				
				// 1증가된 값을 다시 출력한다
				$(vhit).text(hitvalue);
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

// 게시판 글 삭제
$.deleteBoardServer = function() {
	
	$.ajax({
		url : `${mypath}/BoardDelete.do`,
		type : 'get',
		data : { "num" : vidx },
		success : function(res) {
			if(res.sw == "성공") {
				$.listBoardServer(currentpage);
			}
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

// 게시판 글 저장
$.insertBoardServer = function() {
	
	$.ajax({
		url : `${mypath}/BoardInsert.do`,
		type : 'post',
		data : vdata,
		success : function(res) {
			if(res.sw == "성공") {
				currentpage = 1;
				$.listBoardServer(currentpage);
			}
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

// 댓글 삭제
$.deleteReplyServer = function() {
	$.ajax({
		url : `${mypath}/ReplyDelete.do`,
		type : 'post',
		data : { "renum" : vidx },
		success : function(res) {
			
			// DB 삭제에 성공했으면 화면에서 삭제
			if(res.sw == "성공") {
				target.parents('.reply-body').remove();
			}
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
							작성자<span class="rwriter">${v.name}</span>
							날짜<span class="rdate">${v.redate}</span>
						</p>`;
				if(mvo!=null && mvo.mem_name == v.name) {
					rcode += `<p class="p2">
							<input idx="${v.renum}" type="button" value="댓글수정" class="action" name="r_modify">
							<input idx="${v.renum}" type="button" value="댓글삭제" class="action" name="r_delete">
						</p>`;
				}
			rcode += `</div>
					<p class="p3 rp3">${vcont}</p>
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

// 게시판 글 리스트 출력
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
				
				cont = v.content;
				cont = cont.replaceAll(/\n/g, "<br>");
				code += 
					`<div class="card">
				      <div class="card-header">
				        <a class="collapsed btn action" name="title" idx="${v.num}" data-bs-toggle="collapse" href="#collapse${v.num}">${v.subject}</a>
				      </div>
				      <div id="collapse${v.num}" class="collapse" data-bs-parent="#accordion">
				        <div class="card-body">
							<div class="pp">
								<p class="p1">
									<span class="bpass">${v.password}</span>
									작성자<span class="writer">${v.writer}</span>
									이메일<span class="email">${v.mail}</span>
									조회수<span class="hit">${v.hit}</span>
									날짜<span class="date">${v.wdate}</span>
								</p>`
								
					if(mvo!=null && mvo.mem_name == v.writer) {
						code +=	`<p class="p2">
									<input idx="${v.num}" type="button" value="수정" class="action" name="modify">
									<input idx="${v.num}" type="button" value="삭제" class="action" name="delete">
								</p>`;
					}
							
					code += 
							`</div>
							<p class="p3">${cont}</p>
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
	
	// 페이지 번호 - 마지막 페이지에서 한 개의 데이터만 남아있고
	// 그 한개의 데이터를 지웠을 때 현재 페이지 번호(currentpage)는 없는 번호가 된다
	// currentpage를 totalpage값으로 변경한다
	if(currentpage > tp) currentpage = tp;
	
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