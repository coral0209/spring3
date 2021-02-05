/**
 * 
 */
currentPage = 1;

var hitUpdateServer = function(but){ // but : 제목이 있는 a태그 - list
	$.ajax({
		url : '/board/HitUpdate.do',
		type : 'get',
		data : {"seq" : vidx},	//data : "seq=" + vidx,  
		success : function(res){
			//alert(res.sw);
			//화면의 조회수 수정 
			hit = $(but).parents('.panel').find('.hspan').text();
			hit = parseInt(hit) + 1;
			$(but).parents('.panel').find('.hspan').text(hit);
			
		},
		error: function(xhr){
			alety("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

var boardUpdateServer = function(){
	$.ajax({
		url : '/board/BoardUpdate.do',
		type : 'post',
		data : board, //seq, writer, subject, content,password, mail
		success : function(res){
			//alert(res.sw);
			//화면 수정 - 수정마달창에 있는 값들을 다시 가져와서(board객체) 화면에 출력
			$(pbody).find('.nspan').text(board.writer);
			$(pbody).find('.mspan').text(board.mail);
				content = board.content;
				content = content.replace(/\n/g, "<br>");
				
			$(pbody).find('.cspan').text(content);
			$(pbody).find('a').text(board.subject);
			
			today = new Date();
			today = today.toLocaleDateString();
			$(pbody).find('.wspan').text(today);
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}



var boardDeleteServer = function(but){	//but:삭제버튼
	$.get('/board/BoardDelete.do',
			{"seq" : vidx},
			function(res){
//				alert(res.sw);
				//화면에서 지우기
				$(but).parents('.panel').remove();
			},
			'json'
		)
}

var boardSaveServer = function(){
	$.ajax({
		url : '/board/BoardSave.do',
		data : $('#wform').serializeJSON(),
		type : 'post',
		dataType : 'json',
		success : function(res){
//			alert(res.sw);
			listPageServer(1);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}

var replyDeleteServer = function(but){ //but = 댓글삭제버튼
/*	$.getJSON('/boadrd/ReplyDelete.do',
		  {"renum" : vidx},
		  function(res){  })*/
		  
	$.ajax({
		url : '/board/ReplyDelete.do',
		type : 'get',
		data : {"renum" : vidx},
		success : function(res){
			//성공 - 화면에서 해당 댓글 삭제,화면재구성(this)/remove()
//			alert(res.sw);
			$(but).parents('.rep').remove();
		},
		error : function(xhr){
			alert("상태" + xhr.status);
		},
		dataType : 'json'
	})
}

var replyModifyServer = function(){
/*	$.ajax({
		url : '/board/ReplyModify.do',
		type : 'post',
		data : {'renum' : vidx, 'cont' : modicont},
		success : function(res){
			alert(res.sw);
		},
		error : function(xhr){
			alert("상태" + xhr.status);
		},
		dataType : 'json'
	})*/

//	$.post(url,data,success,dataType); 순서일치해야됨!
	$.post('/board/ReplyModify.do',
			{'renum' : vidx, 'cont' : modicont},
			function(res){alert(res.sw);},
			'json')
}

var replyListServer = function(but){	//but => 등록버튼
	$.ajax({
		url : '/board/ReplyList.do',
		type : 'post',
		data : {"bonum" : vidx},
		success : function(res){
			$(but).parents('.panel').find('.pbody').find('.rep').remove();
			code = "";
			$.each(res, function(i,v){
				code += ' <div class="panel-body rep">';
			    code += ' 	<p class ="p1">';
			    code += 		v.name + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			    code += 		v.redate + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			    code += 		'<br><br><span class="cont">' + v.cont +'</span>';
			    code += '  	</p>';
			    code += '  	<p class="p2">';
			    code += '  		<button type="button" idx="' + v.renum +'" name="r_modify" class="action">댓글수정</button>';
			    code += '  		<button type="button" idx="' + v.renum +'" name="r_delete" class="action">댓글삭제</button>';
			    code += '  	</p>';
			    code += ' </div>';
			})
			$(but).parents('.panel').find('.pbody').append(code);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status)
		},
		dataType : 'json'
	})
}

var replySaveServer = function(but){	//but => 등록버튼
	$.ajax({
		url : '/board/ReplySave.do',
		type : 'post',
		data : reply,	//bonum, name, cont
		success : function(res){
			replyListServer(but);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status)
		},
		dataType : 'json'
		
	})
}

// 페이지별 리스트 - html에서 listPageServer(1)호출
// cpage 변수는 페이지번호이고 Controller로 전송한다.

var listPageServer = function(cpage){
	$.ajax({
		url : '/board/List.do',
		type : 'post',
		data : {"page" : cpage},
		dataType : 'json',
		success : function(res){
			code ='<div class="panel-group" id="accordion">';
			$.each(res.datas, function(i,v){
				code += '<div class="panel panel-default">';
			    code += '  <div class="panel-heading">';
			    code += '    <h4 class="panel-title">';
			    code += '      <a name="list" class="action" idx="' + v.seq + '" data-toggle="collapse" data-parent="#accordion" href="#collapse' + v.seq + '">'+ v.title +'</a>';
			    code += '    </h4>';
			    code += '  </div>';
			    code += '  <div id="collapse' + v.seq + '" class="panel-collapse collapse">';
			    code += '    <div class="panel-body pbody">';
			    code += '    	<p class ="p1">';
			    code += '     		작성자 : <span class="nspan">' + v.name + '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			    code += '   		메   일 : <span class="mspan">' + v.mail + '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			    code += '   		조회수 : <span class="hspan">' + v.hit + '</sapn>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			    code += '   		작성일 : <span class="wspan">' + v.wdate + '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			    code += '    	</p>';
			    code += '    	<p class="p2">';
			    code += '   		<button type="button" idx="' + v.seq +'" name="modify" class="action">수정</button>';
			    code += '    		<button type="button" idx="' + v.seq +'" name="delete" class="action">삭제</button>';
			    code += '    	</p>';
			    code += '     	<hr>';
			    code += '     	<p><span class="cspan">';
			    code += 			v.cont;
			    code += '     	</span></p>';
			    code += '     	<p>';
			    code += '     		<textarea class="area" cols="60"></textarea>';
			    code += '      		<button type="button" idx="' + v.seq +'" class="action repb" name="reply">댓글등록</button>';
			    code += '    	</p>';
				code += '     </div>';
				code += '  </div>';
				code += '</div>';
			})
			code += '</div>';
			$('.box').html(code);	
			
			//pagelist에 append를 이용해서 출력
			$('#pagelist').empty();
			//이전버튼출력
			if(res.sp>1){
				pager ='<ul class="pager">';
				pager +='<li><a class="prev" href="#">Previous</a></li>';
				pager +='</ul>';

				$('#pagelist').append(pager);
			}
			
			//페이지번호 출력
			pager = '<ul class="pagination pager">';
			for(i=res.sp; i<=res.ep; i++){
				if(currentPage == i){
					pager += '<li class="active"><a class="paging" href="#">' + i + '</a></li>';
				}else{
					pager += '<li><a class="paging" href="#">' + i + '</a></li>';
				}
			}
			pager += '</ul>';
			$('#pagelist').append(pager);
			
			//다음버튼 출력
			if(res.ep < res.tp){
				pager ='<ul class="pager">';
				pager +='<li><a class="next" href="#">Next</a></li>';
				pager +='</ul>';

				$('#pagelist').append(pager);
			}
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}

var listAll = function(){
	//게시글 가져오기
	$.ajax({
		url : '/board/List.do',
		type : 'get',
		dataType :'json',
		success : function(res){
			code ='<div class="panel-group" id="accordion">';
			$.each(res, function(i,v){
				code += '<div class="panel panel-default">';
			    code += '  <div class="panel-heading">';
			    code += '    <h4 class="panel-title">';
			    code += '      <a data-toggle="collapse" data-parent="#accordion" href="#collapse' + v.seq + '">'+ v.title +'</a>';
			    code += '    </h4>';
			    code += '  </div>';
			    code += '  <div id="collapse' + v.seq + '" class="panel-collapse collapse">';
			    code += '    <div class="panel-body">';
			    code += '    	<p class ="p1">';
			    code += '     		작성자 : ' + v.name + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			    code += '   		메   일 : ' + v.mail + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			    code += '   		조회수 : ' + v.hit + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			    code += '   		작성일 : ' + v.wdate + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			    code += '    	</p>';
			    code += '    	<p class="p2">';
			    code += '   		<button type="button" idx="' + v.seq +'" name="modify" class="action">수정</button>';
			    code += '    		<button type="button" idx="' + v.seq +'" name="delete" class="action">삭제</button>';
			    code += '    	</p>';
			    code += '     	<hr>';
			    code += '     	<p>';
			    code += 			v.cont;
			    code += '     	</p>';
			    code += '     	<p>';
			    code += '     		<textarea class="area" cols="60"></textarea>';
			    code += '      		<button type="button" idx="' + v.seq +'" class="action repb" name="reply">댓글등록</button>';
			    code += '    	</p>';
				code += '     </div>';
				code += '  </div>';
				code += '</div>';
			})
			code += '</div>';
			$('.box').html(code);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}