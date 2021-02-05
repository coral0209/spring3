
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">

<head>

<meta charset="utf-8">
<!-- Somehow I got an error, so I comment the title, just uncomment to show -->
<!-- <title>Transparent Login Form UI</title> -->
<link rel="stylesheet" href="${cp }/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<script>
	$(function(){
		//<![CDATA[
		//사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('c212569280ec9ae12c0ad5fa52b00d2c');

		//카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {
			Kakao.API.request({
				url : '/v2/user/me',
//				data:{
		//   propertyKeys: ['kaccount_email']
		//  },
				success : function(res) {
					alert(JSON.stringify(res));
					location.href = "main.do";
				},
				fail : function(error) {
					alert('login success, but failed to request user information: '	+ JSON.stringify(error))
				},
				})
			},
			fail : function(err) {
				alert('failed to login: ' + JSON.stringify(err))
			},
		});
		
// 		$('#lgin').on('click',function(){
// 			var id = $('#vid').val();
// 			var pass = $('#vpass').val();
// 			alert(id + pass);
// 			$.ajax({
<%-- 				url : "<%=request.getContextPath()%>/LoginCheck.do", --%>
// 				method : "get",
// 				data : { "id" : id , "pass" : pass},
// 				dataType : "json",
// 				success : function(result){
// 					//alert(result);
// 					if(result=="no"){  // 중복되지 않을 때
// 						location.href="Login.do";
// 					}else if(result=="ok"){ // 중복될 때
// 						location.href="main.do";
// 					}
// 				},
// 				error : function(xhr){
// 					alert("오류 - 상태값 : " + xhr.status);
// 				}
// 			})
// 		})
// ---------------------------------------------------------------------------------------------------
		// modal
		$('#smodal').on('click',function(){
			$('#newModal').modal({backdrop: 'static', keyboard: false}) ;
			$('#sModal').modal("show");
		})
			
		$('#imodal').on('click',function(){
			$('#newModal').modal({backdrop: 'static', keyboard: false}) ;
			$('#wModal').modal("show");
		})
		
		//일반회원가입창
		$('#nuser').on('click',function(){
			location.href="memberForm.do";
		})
		//요리사회원가입창
		$('#cuser').on('click',function(){
			location.href="memberForm2.do";
		})
// 		//아이디 찾기
// 		$('#searchBtn').on('click', function(){
// 			var name=$('#inputName_1').val();
// 			var email=$('#inputEmail_1').val();
// // 			alert(name + email);
// 			$.ajax({
<%-- 				url : '<%=request.getContextPath()%>/SearchId.do', --%>
// 				type : 'post',
// 				data : { "name" : name , "email" : email},
// 				success : function(res){
// 					alert(res.sw);
// 			},
// 				error : function(xhr){
// 					alert('상태' + xhr.status);
// 				},
// 				dataType : "json"
// 			})
// 		})
// 		//비밀번호 찾기
// 		$('#searchBtn2').on('click', function(){
// 			var id=$('#inputId_1').val();
// 			var email=$('#inputEmail_2').val();
// 			$.ajax({
<%-- 				url : '<%=request.getContextPath()%>/SearchPass.do', --%>
// 				type : 'get',
// 				data : { "id" : id , "email" : email},
// 				success : function(res){
// 					alert(res.sw);
// 					$('#inputId_1').empty(this);
// 					$('#inputEmail_2').empty(this);
// 			},
// 				error : function(xhr){
// 					alert('상태' + xhr.status);
// 				},
// 				dataType : "json"
// 			})
// 		})
		
		mail = '<%= session.getAttribute("authKey")%>';
		//인증번호 전송(id찾기)
		$('#Certificationbtn').on('click',function(){
			var email = $('#inputEmail_1').val();
			var name = $('#inputName_1').val();
			$.ajax({
				url : '<%=request.getContextPath()%>/SearchId.do',
				type : 'post',
				data : {"email":email, "name":name},
// 				data : {"authKey":authKey},
				success : function(res){
					alert(res.sw);
					$('#sModal').modal('hide');
					$.ajax({
						url : '<%=request.getContextPath()%>/Mail.do',
						type : 'get',
						data : {"email":email},
						success : function(res){
							window.open("./public/certification.jsp", "", "width=420, height=400");
						}
					})
				},
				error : function(xhr){
					alert("상태" + xhr.status);
				},
				dataType: 'json'
			})
		})
		
		//인증번호 전송(pw찾기)
		$('#Certificationbtn2').on('click',function(){
			var id = $('#inputId_1').val()
			var email = $('#inputEmail_2').val();
			$.ajax({
				url : '<%=request.getContextPath()%>/SearchPass.do',
				type : 'post',
				data : {"email":email, "id":id},
				success : function(res){
					alert(res.sw);
					$('#sModal').modal("hide");
					$.ajax({
						url : '<%=request.getContextPath()%>/Mail.do',
						type : 'get',
						data : {"email":email},
						success : function(res){
							window.open("./public/certification2.jsp", "", "width=430, height=400");
						}
					})
				},
				error : function(xhr){
					alert("상태" + xhr.status);
				},
				dataType: 'json'
			})
		})
		$('#cfbtn2').on('click',function(){
			/* var mail = authKey.val(); */
			if(mail== $('#Certificationbtn_2').val()){
				$('#cfcheck2').html("인증성공").css("color","green");
			}else{
				$('#cfcheck2').html("인증실패").css("color","red");
			}
		})
		
	})
		function search_check(num){
			if (num == '1') {
				document.getElementById("searchP").style.display = "none";
				document.getElementById("searchI").style.display = "";	
			} else {
				document.getElementById("searchI").style.display = "none";
				document.getElementById("searchP").style.display = "";
			}
		}
	
</script>


<style>
	.pass .aa:hover{
		color: black;
		text-decoration: none;
	}
	#Certificationbtn, #Certificationbtn2{
		background: lightgreen;
		color: white;
		width: 110px;
		text-align: center;
		float: right;
	}
	
</style>

</head>

<body>
	<div class="bg-img">
		<div class="content">
			<header>Login</header>
			<form action="${cp}/middleController/login" id="test">
				<div class="field">
					<span class="fa fa-user"></span> <input name="id" id="vid" type="text"
						required placeholder="ID"/>
				</div>
				<div class="field space">
					<span class="fa fa-lock"></span> <input name="pass" type="password"
						class="pass-key" required placeholder="Password" id="vpass"/>
				</div>

				<div class="pass">
					<a class="aa" href="#" data-target="#newModal" data-toggle="modal" data-backdrop="static" data-keyboard="false" id="smodal">Forgot ID/Password?</a>
				</div>
				<div class="pass">
					<a class="aa" href="#" data-target="#newModal" data-toggle="modal" data-backdrop="static" data-keyboard="false" id="imodal">회원가입</a>
				</div>
			
				<div class="field">
					<input id="lgin" type="submit" value="LOGIN">
				</div>
			</form>
			<div class="login">Or login with</div>
			<div class="links">
				<!-- 				<div class="facebook"> -->
				<!-- 					<i class="fab fa-facebook-f"><span>Facebook</span></i> -->
				<!-- 				</div> -->
				<div id="snslogin">
					<a id="kakao-login-btn"></a> 
					<a href="http://developers.kakao.com/logout"></a>
				</div>

			</div>
		</div>

		<div class="signup">
			Don't have account?
		</div>
	</div>
	
	<!-- Modal -->
	<div id="sModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">ID / PASSWORD 찾기</h4>
				</div>
				<div class="modal-body">
					<form id="sform">
					
						<div style="margin-bottom: 10px;" class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
							<label class="custom-control-label font-weight-bold text-white" for="search_1">아이디 찾기</label>
							<span id="aaaa"></span>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
							<label class="custom-control-label font-weight-bold text-white"	for="search_2">비밀번호 찾기</label>
						</div>
						<div id="searchI">
							<div class="form-group">
								<label class="font-weight-bold text-white" for="inputName_1">이름</label>
								<div>
									<input type="text" class="form-control" id="inputName_1" name="inputName_1" placeholder="ex) 아무개">
								</div>
							</div>
							<div class="form-group">
								<label class="font-weight-bold text-white" for="inputEmail_1">이메일</label>
								<div>
									<input style="width: 450px; float: left;"type="text" class="form-control" id="inputEmail_1" name="inputEmail_1" placeholder="ex) E-mail@gmail.com">
									<input type="button" class="form-control" id="Certificationbtn" name="cfbtn" value="인증번호전송"><br><br>
								</div>
							</div>
							
							<div class="form-group">
								<a class="btn btn-danger btn-block" href="Login.do">취소</a>
							</div>
						</div>
						
						<!-- 비밀번호 찾기 -->
						<div id="searchP" style="display: none;">
							<div class="form-group">
								<label class="font-weight-bold text-white" for="inputId_1">아이디</label>
								<div>
									<input type="text" class="form-control" id="inputId_1" name="inputId_2" placeholder="ex) cooks">
								</div>
							</div>
							<div class="form-group">
								<label class="font-weight-bold text-white" for="inputEmail_2">이메일</label>
								<div>
									<input style="width: 450px; float: left;"type="text" class="form-control" id="inputEmail_2" name="inputEmail_2" placeholder="ex) E-mail@gmail.com">
									<input type="button" class="form-control" id="Certificationbtn2" name="cfbtn" value="인증번호전송"><br><br>
								</div>
							</div>
							
							<div class="form-group">
								<a class="btn btn-danger btn-block" href="Login.do">취소</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div id="wModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">회원가입 선택</h4>
				</div>
				<div class="modal-body">
					<form id ="wform">
						<input type='button' value='일반 회원가입' id="nuser">
						<input type='button' value='요리사 회원가입' id="cuser">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

</body>

</html>
