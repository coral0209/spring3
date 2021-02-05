/**
 * 
 */

function idcheck(){
	idvalue = $('#id').val().trim();
	
	$('#idCk').text("*필수항목").css("color", "red");
	
	//공백 체크
	if(idvalue.length <1) {
		$("#idCk").html("Id입력하세요").css("color","red")
		return false;
	}
	
	//id길이(4~12)
	if(idvalue.length < 4 || idvalue.length > 12){
		$("#idCk").html("Id 4~12사이").css("color","red")
		return false;
	}
	//id 정규식 - 소문자로 시작하고 대문자와 숫자로 조합가능
	idreg=/^[a-z][a-zA-Z0-9]{3,11}$/;//전체는4~8자(길이[a-z]{3,11}==>4~12)
	if(!(idreg.test(idvalue))){
		$("#idCk").html("입력형식오류").css("color","red")
		return false;
	}else{
		$('#idCk').text("✔").css("color", "green");
	}
	
	return true;
}

function pwdcheck(){
	//비밀번호(공백,길이,정규식)
	pwdvalue = $('#pwd').val().trim();
	pwdreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,12}$/;
	pwd2value =$('#pwd2').val().trim();
	
	$('#pwCk').text("*필수항목").css("color", "red");
	
	//공백
	if(pwdvalue.length < 1){
		$("#pwCk").text("password 입력").css("color","red")
		return false;
	}
	//길이(8~12)
	if(pwdvalue.length < 8 || pwdvalue.length > 12){
		$("#pwCk").text("password :8~12").css("color","red")
		return false;
	}
	//정규식(영대소문자, 숫자 특수문자 1개이상씩)
	if(!(pwdreg.test(pwdvalue))){
		$("#pwCk").text("비밀번호형식오류").css("color","red")
		return false;
	}else {
		$('#pwCk').text("✔").css("color", "green");
	}
	//비밀번호 확인
	if(pwd2value.length < 1){
		$("#pwreCk").text("password입력").css("color","red")
		return false;
	}
	if(pwdvalue != pwd2value){
		$("#pwreCk").text("❌불일치❌").css("color","red")
		return false;
	}else{
		$("#pwreCk").text("✔일치✔").css("color","green")
	}
	return true;
}


function phonecheck(){
	$('#phoneCk').text("*필수항목").css("color", "red");
	
	//전화번호(공백,정규식)
	phonevalue = $('#phone').val().trim();
	//공백
	if(phonevalue.length<1){
		$('#phoneCk').html("핸드폰 번호를 입력하세요").css('color', 'red');
		return false;
	}
	//정규식
	hpreg = /^\d{3}-\d{4}-\d{4}$/;
	if(!(hpreg.test(phonevalue))){
		$('#phoneCk').html("형식오류").css('color', 'red');
		return false;
	}else{
		$('#phoneCk').text("✔").css("color", "green");
	}
	return true;
}

function mailcheck(){
	//이메일(공백,정규식)
	emailvalue = $('#email').val().trim();
	//공백
	if(emailvalue.length <1){
		$('#mailCk').html("email을 입력하세요").css('color', 'red');
		return false;
	}
	//정규식
	emailreg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	if(!(emailreg.test(emailvalue))){
		$('#mailCk').html("email 형식오류").css('color', 'red');
		return false;
	}else{
		$('#mailCk').text("✔").css("color", "green");
	}
	return true;
}


//요리사 필수항목 정규식체크
function addrcheck(){
	vaddr = $('#add2').val().trim();
	if(vaddr.length<1){
		$('#addrCk').html("상세주소를 입력하세요").css('color', 'red');
		return true;
	}else{
		$('#addrCk').html("✔").css("color", "green");
	}
}
//정규식 체크(일반)
function regcheck(){
	idcheck();
	pwdcheck();
	phonecheck();
	mailcheck();
	return true;
}
//정규식 체크(요리사)
function regcheck1(){
	idcheck();
	pwdcheck();
	phonecheck();
	mailcheck();
	addrcheck();
	return true;
}