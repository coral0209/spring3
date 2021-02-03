<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="kr.or.ddit.user.model.UserVo"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<!-- 달력 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" href="../../favicon.ico">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link href="${cp}/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap core CSS -->
<script src="${cp}/js/bootstrap.js"></script>
<!-- Custom styles for this template -->
<link href="${cp}/css/dashboard.css"
	rel="stylesheet">
<link href="${cp}/css/blog.css" rel="stylesheet">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<!-- 달력 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    //load함수를 이용하여 core스크립트의 로딩이 완료된 후, 우편번호 서비스를 실행합니다.
  $(function(){
	  $( "#datepicker" ).datepicker();
	  $("#addrBtn").on("click" , function(){
	    daum.postcode.load(function(){
	        new daum.Postcode({
	            oncomplete: function(data) {
	                data.roadAddress; //도로주소
	                data.zonecode; //우편주소 
	            	
	              $('#addr1').val(data.roadAddress); 
	              $('#zipcode').val(data.zonecode);
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            	//사용자 편의성을 위해 상세주소 입력 input 태그로 focus 설정 
	              $("#addr2").focus(); 
	            }
	        }).open();
	    });
	  })

	  
   });
 
 </script>
 <script>

function send(){
		if ($('#chkMsg').val() == "사용불가능" ){
			alert("아이디가 중복됩니다. 다른 아이디로 입력해주세요")
			return false;
		} 	 
 		if ($('#userId').val() == "" || $('#userNm').val() == "" ||  $('#useralias').val() == ""  || $('#pass').val() == ""  || $('#datepicker').val() == ""  ||
		$('#addr1').val() == "" || $('#addr2').val() == "" || $('#zipcode').val() == ""  ){
		alert("모든항목을 빠짐없이 입력해주세요")	
			return false; 
		}
 
 		/* 	
 		
		if ($('#userId').val() == "")
			alert("아이디를 입력해주세요")
			return false;
		}
		if ($('#userNm').val() == ""  ){
			alert("이름 입력해주세요")
			return false;
		}
 		if ($('#useralias').val() == ""  ){
			alert("별명을 입력해주세요")
			return false;
		}
		if ($('#pass').val() == ""  ){
			alert("비밀번호를 입력해주세요")
			return false;
		}
		if ($('#datepicker').val() == ""  ){
			alert("날짜를 입력해 주세요")
			return false;
		}
		if ($('#addr1').val() == ""  ){
			alert("주소찾기 버튼을  눌러주세요")
			return false;
		}
		if ($('#addr2').val() == ""  ){
			alert("상세주소를 입력해주세요")
			return false;
		}	
		if ($('#zipcode').val() == ""  ){
			alert("주소찾기 버튼을 눌러주세요")
			return false;
		}   */

		$('#fm').submit();
		
  } 
    </script>

<script >
/* 	function checkId(){
		  var id = $('#userId').val();
		  console.log(id)
		  $.ajax({
			url : '${cp}/idcheck' , 
			type : 'post', 
			data : { "id" : id},
			success : function(data){
				if (data.sw == 1){
					$('#chkMsg').html("사용가능")
				
				}
				else {
					$('#chkMsg').html("사용불가능"); 
				
				}
				
			}, 
			error : function() {
				alert("에러입니다."); 
			},
			dataType : 'json'
		  }); 
	}; */
</script>
</head>

<body>


	
	
	<%--헤더부분 --%>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="row">

		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<%--left 부분 --%>
				<%@ include file="/WEB-INF/views/common/left.jsp"%>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	
			<form class="form-horizontal" role="form" id="fm" action="${cp}/user/registUser" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="userId" class="col-sm-2 control-label">id</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="userId" name="userid" value="kr"<%-- "${param.userid}" --%>
						placeholder="아이디를 입력하세요">
						<span id = "chkMsg"></span>
					<input type="file" class="form-control" name="picture" />
					</div>
				</div>

				

				<div class="form-group">
					<label for="userNm" class="col-sm-2 control-label">name</label>
					<div class="col-sm-10">
					<%-- <%  userNm = userNm == null ? "" : userNm;   %> --%>
					<input type="text" class="form-control" id="userNm" name="userNm" value="네임" <%-- "${param.userNm}" --%>
								placeholder="이름을 입력하세요">
						
						
					</div>
				</div>
				<div class="form-group">
					<label for="userNm" class="col-sm-2 control-label">alias</label>
					<div class="col-sm-10">
					<input type="text" class="form-control" id="useralias" name="userAlias" value="알리아스"<%-- "${param.userAlias}" --%>
								placeholder="별명을 입력하세요">
						
					</div>
				</div>
				<div class="form-group">
					<label for="pass" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
					<input type="password" class="form-control" id="pass" name="pass"  value="pass"<%-- "${param.pass}" --%>
					placeholder="비밀번호를 입력하세요">						
					</div>
				</div>
				
								<div class="form-group">
					<label for="datepicker" class="col-sm-2 control-label">등록 날짜</label>
					<div class="col-sm-10">
					<%-- <input type="text" class="form-control" id="reg_dt" name="reg_dt" value="<%=reg_dt%>"
					placeholder="yyyy.mm.dd">	 --%>
					<input type="text" class="form-control" name="userVos.reg_dt" value="${param.reg_dt}" id="datepicker"/>				
					</div>
				</div>


				
				<div class="form-group">
					<label for="userNm" class="col-sm-2 control-label">주소</label>
					<div class="col-sm-8">
					<input type="text" class="form-control" id="addr1" name="addr1" readonly value="주소1"<%-- "${param.addr1}" --%>
					placeholder="주소검색 버튼을 입력하세요" >		
					</div>
					<div class="col-sm-2">

					<button type="button" id="addrBtn" class="btn btn-default">주소검색</button>				
					</div>
				</div>
				
				<div class="form-group">
					<label for="userNm" class="col-sm-2 control-label">상세주소</label>
					<div class="col-sm-10">
					<%String addr2 = request.getParameter("addr2"); %>
					<input type="text" class="form-control" id="addr2" name="addr2" value="주소2"<%-- "${param.addr2}" --%> 
					placeholder="상세주소">		
						
					</div>
				</div>

				<div class="form-group">
					<label for="userNm" class="col-sm-2 control-label">zipcode</label>
					<div class="col-sm-10">
					<%String zipcode = request.getParameter("zipcode"); %>
					<input type="text" class="form-control" id="zipcode" name="zipcode" readonly value="집코드"<%-- "${param.zipcode}" --%>
					>	
					</div>
				</div>
			
				
								
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" id="register" class="btn btn-default" onclick="send()">사용자등록</button>
					</div>
				</div>
				</form>
		</div>
	</div>
</body>

</html>