
<%@page import="kr.or.ddit.user.model.UserVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>페이징 회원정보</title>
<!-- <script src="/js/jquery/jquery-1.12.4.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="${cp}/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap core CSS -->
<script src="${cp}/js/bootstrap.js"></script>
<!-- Custom styles for this template -->
<link href="${cp}/css/dashboard.css"
	rel="stylesheet">
<link href="${cp}/css/blog.css" rel="stylesheet">

<script>
	//문서 로딩이 완료되고 나서 실행되는 영역 
	$(function() {
		$(".user").on("click", function() {
			//this : 클릭 이벤트가 발생한 element  
			//데이터 속성을 손 쉽게 가져올 수 있는 data-userid="list.get(i).getUserid()"- 속성이 존재한다. 
			//데이터는 전부 소문자로 인식이 된다. 
			var userid = $(this).data("userid");
			$('#userid').val(userid);
			$('#frm').submit();
		});
		
		$("#insert").on("click" , function(){
			location.href = "user/registUser.jsp"
		})
		

	})
</script>

</head>

<body>
	<form id="frm" action="${cp}/usercontroller"
		method="get">
		<input type="hidden" id="userid" name="userid" value="">
	</form>

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


			<div class="row">
				<div class="col-sm-8 blog-main">
					<h2 class="sub-header">사용자</h2>
					<div class="table-responsive">
						<table class="table table-striped">
							<tr>
								<th>사용자 아이디</th>
								<th>사용자 이름</th>
								<th>사용자 별명</th>
								<th>등록일시</th>
							</tr>
				
							
				
							
							<c:forEach items="${list}" var="userList">
							<tr class="user" data-userid="${userList.userid}">
							<fmt:formatDate var="regdt" value="${userList.reg_dt}" pattern="yyyy.MM.dd"/>
								<td>${userList.userid}</td>
								<td>${userList.usernm}</td>
								<td>${userList.alias}</td>
								<td>${regdt}</td>

							</tr>

							</c:forEach>
						</table>
					</div>

					<a class="btn btn-default pull-right" id="insert" >사용자 등록</a>
						
					<div class="text-center">
						<ul class="pagination">
							<li class="prev"><a
								href="${cp}/pagingUser?page=1&pagesize=${pageVo.pagesize}">«</a>
							</li>
							<c:forEach begin="1" end="${pagination}" var="i">
								<c:choose>
									<c:when test="${i} == ${pageVo.page}">
										<li class="active"><span>${i}</span></li>
									</c:when>
										<c:otherwise>
											<li><a
											href="${cp}/pagingUser?page=${i}&pagesize=${pageVo.pagesize}">${i}</a></li>
										</c:otherwise>
								</c:choose>
							</c:forEach>
							<li class="next"><a
								href="${cp}/pagingUser?page=${pagination}&pagesize=${pageVo.pagesize}">»</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>