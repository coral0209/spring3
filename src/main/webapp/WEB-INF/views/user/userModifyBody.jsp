<%@page import="kr.or.ddit.common.model.PageVo"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.user.model.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	






<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

$(function(){
	//주소검색 버튼이 클릭 되었을 때 다음주소 api 팝업을 연다
	$("#addrBtn").on("click", function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	            
	            $("#addr1").val(data.roadAddress);		//도로주소
	            $("#zipcode").val(data.zonecode);		//우편번호
	            
	            //사용자 편의성을 위해 상세주소 입력 input 태그로 focus 설정
	            $("#addr2").focus();
	        }
	    }).open();	
	});
});
    
</script>

	
	


		<div class="row">

			

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				
				<form class="form-horizontal" role="form"
					  action="${cp }/user/modifyTiles" method="post" enctype="multipart/form-data">
					<input type="hidden" name="userid" value="${user.userid }"/>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">사용자 사진</label>
						<div class="col-sm-10">
<%-- 							<img src="${cp }/profile/${user.userid }.png"/> --%>
							<input type="file" class="form-control" id="profile" name="profile"/>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">사용자 아이디</label>
						<div class="col-sm-10">
							<label class="control-label">${user.userid }</label>
						</div>
					</div>

					<div class="form-group">
						<label for="usernm" class="col-sm-2 control-label">사용자 이름</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="usernm" name="usernm"
								placeholder="사용자 이름" value="${user.usernm }"/>
						</div>
					</div>
					
					<div class="form-group">
						<label for="alias" class="col-sm-2 control-label">별명</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="alias" name="alias"
								placeholder="별명" value="${user.alias }"/>
						</div>
					</div>
		
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label">비밀번호</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="pass" name="pass"
								placeholder="비밀번호" value="${user.pass }"/>
						</div>
					</div>
					
					<div class="form-group">
						<label for="reg_dt" class="col-sm-2 control-label">등록일시</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="reg_dt" name="reg_dt"
								placeholder="" value='<fmt:formatDate value="${user.reg_dt }" pattern="yyyy-MM-dd"/>'/>
						</div>
					</div>
					
					<div class="form-group">
						<label for="addr1" class="col-sm-2 control-label">도로주소</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="addr1" name="addr1"
								placeholder="도로주소" value="${user.addr1 }" readonly/>
						</div>
						<div class="col-sm-2">
							<button type="button" id="addrBtn" class="btn btn-default">주소검색</button>
						</div>
					</div>
					
					<div class="form-group">
						<label for="addr2" class="col-sm-2 control-label">상세주소</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="addr2" name="addr2"
								placeholder="상세주소" value="${user.addr2 }"/>
						</div>
					</div>

					<div class="form-group">
						<label for="zipcode" class="col-sm-2 control-label">우편번호</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="zipcode" name="zipcode"
								placeholder="우편번호" value="${user.zipcode }" readonly/>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">사용자 수정</button>
						</div>
					</div>
				</form>
			</div>
		</div>