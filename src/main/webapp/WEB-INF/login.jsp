<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <%@ include file="/common/loginheader.jsp" %>
<%@ include file="/css/logincss.jsp" %> --%>

<script type="text/javascript">
	$(function(){
		
		
		//쿠키에 rememberme 라는 세션이 있고 userid 있으면 -> 그것을 활용
		
		if(Cookies.get("rememberme") != null && Cookies.get("userid") != null) {
			$('#rememberme').attr("checked" , "checked");
			$('#userid').val(Cookies.get("userid")); 
		}
				
		//로그인버튼클릭하면	
		$('#signin').on("click" , function(){
			
			//rememberme 체크박스가 체크되어 있으면 
			if($("#rememberme").is(":checked") == true){
				
			//cookie 에 userid 와 rememberme y 로 저장해 놓는다. 
				Cookies.set("userid" , $('#userid').val());
				Cookies.set("rememberme" , "Y");
				$('#frm').submit();
				
			//rememberme 가 체크되어 있지 않으면 , 모든 저장된 쿠키를 삭제하기 (rememberme 와 userid 삭제)
			}else {
				Cookies.remove("userid");
				Cookies.remove("rememberme");
				$('#frm').submit();
			}
			
		})
		
		
		
		
	})
	




</script>



</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="#"><b>로그인</b></a>
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">Sign in to start your session</p>

				<form id="frm" action="${cp3}/login" method="post">
					<div class="form-group has-feedback">
						<input type="text" class="form-control" name="userid" id="userid"
							placeholder="아이디를 입력하세요." value="${param.userid}"> 
							<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="password" class="form-control" name="pass"
							placeholder="패스워드를 입력하세요." value="${param.pass}"> <span
							class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					<div class="row">
						<div class="col-sm-8">
							<div class="checkbox icheck">
								<label> <input type="checkbox" name="rememberMe"
									id="rememberme" value=""> Remember Me
								</label>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-sm-4">
							<button type="button" id="signin"
								class="btn btn-primary btn-block btn-flat">로그인</button>
						</div>
						<!-- /.col -->
					</div>
				</form>

			</div>
			<!-- /.login-box-body -->
		</div>
	</div>
	<!-- /.login-box -->

	<!-- jQuery -->
	<script src="${cp3}/bootstrap/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${cp3}/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${cp3}/bootstrap/dist/js/adminlte.min.js"></script>




</body>
</html>