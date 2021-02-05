
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${cp }/public/shopstyle.css?ver=1607311742">
<link rel="stylesheet" href="${cp }/public/stylep.css?ver=887788">
<link rel="stylesheet" href="${cp }/public/font-awesome.min.css">
<script src="${cp }/js/jquery-latest.min.js"></script>
<script src="${cp }/js/jquery.cookie.js"></script>
<script src="${cp }/js/swiper.min.js"></script>
<style>
/* Remove the navbar's default rounded borders and increase the bottom margin */
.navbar {
	margin-bottom: 50px;
	border-radius: 30;
	background-color: #FFB6C1;
}

/* Remove the jumbotron's default bottom margin */
.jumbotron {
	margin-bottom: 0;
}

.panel-heading, .panel-footer {
	text-align: center;
}

body {
	color: #000080;
	background-color: #F0F8FF;
	background-attachment: fixed;
}

#inputrecipe {
	border: 1px solid skyblue;
	background-color: #E0FFFF;
	color: #4B0082;
	float: right;
}

footer {
	background-color: #FFB6C1;
	padding: 25px;
}

#textarea1 {
	overflow-y: hidden;
}

/*  수정이수정5 */
img:hover {
	opacity: 0.7;
}

.container {
	background-color: #d9e5ff;
}
</style>
<title>레시피 메인</title>
</head>

<script>



$(function(){

	

	

	

	// 사진 누르면 상세페이지 이동

	$(".img-responsive").on('click' , function(){

		var rbcod = $(this).attr("id");

		location.href="${cp}/middleController/viewOneRecipe?rbcod=" + rbcod;
	

	}) // 사진 누르면 상세페이지 이동 끝 

	

	

	//버튼누르면 레시피 등록하기 

		

<%-- 	$('#inputrecipe').on('click' , function(){

		 title = $('#rtitle').val();

		 cont = $('#cont').val();

		

		//저장된 아이디가 꼭 필요하다. ( 로그인시 저장된 아이디)

		// in = 

		$.ajax({

			url : '<%=request.getContextPath()%>/recipe/recipeinput.do' ,

			type : 'get',

			data : {

				'title' :  title,

				'cont' : cont

			} , 

			success : function(res){

				//서버 재 업로드 

				location.reload(true);

				

			},

			error : function(xhr){

				alert("상태 : " + xhr.status);

			},

			

			dataType : 'json'

			

			

		})	

			

		

	}) --%>

	

	

	

}) //전체 함수 끝 





</script>



<body>

	<div id="header">
		<div id="header_content">
			<input type="hidden" name="loginConfirm" value=""> <label
				for="menuCheck" class="sidemenu_button"> <span
				class="icon_bar"></span>

			</label> <a class="logo"> <img src="../image/logo.png">
			</a> <label for="cartCheck" class="cart_button"> <span>0</span>
			</label>
			<div id="header_login_group">
				<%
				String id = (String) session.getAttribute("id");
				request.setAttribute("id", id);
				%>
				<a href="${cp}/mypage/Mypagemain.do">마이페이지</a>
				<a
					href="${cp}/cookmarket/Cookmarket.do">로그아웃</a>
				<a href="${cp}/mypage/Coinmain.do">충전소</a>
			</div>
		</div>


		<div id="nav">
			<div id="nav_content">
				<input type="checkbox" id="Main_category" class="inputhidden">
				<label for="Main_category" class="Main_category_btn"> <!-- 수정부분 식자재 경로 넣었고, 이벤트 삭제했습니다 -->
				</label>
				<div class="nav_set">
					<a href="${cp}/grocery/Foodmain.do"
						class="nav_new">식자재</a> <a
						href="${cp}/class/classList.do"
						class="nav_best">클래스</a> <a
						href="${pageContext.request.contextPath}/recipe/Recipemain.do"
						class="nav_event">레시피</a>
				</div>

				<div class="nav_search">
					<img src="/public/img/shop/searchIcon.png" alt="">
				</div>
				<div class="search_box_goods">
					<div class="search_box_header">
						<span>무엇을 찾고 계신가요?</span> <span class="closeSearchBox"><img
							src="/public/img/shop/close.png" alt=""></span>
					</div>
					<form method="GET" id="sdhSearch" action="/sdhsearch/">
						<div class="search_box_input">
							<input type="text" id="" name="searchText" value=""
								placeholder="제품명 혹은 양조장명을 입력해주세요">
							<button>
								<img src="/public/img/shop/searchIcon.png" alt="">
							</button>
						</div>
					</form>

				</div>
				<input type="search" id="nav_search_pc" name="nav_search_pc"
					placeholder="검색" value=""
					onkeypress="if(event.keyCode===13) {sdhsearch();}"> <input
					type="checkbox" id="cart_pc" class="inputhidden">
			</div>
		</div>
	</div>


	<div class="container">
		<div class="row">
			<!-- 레시피 등록하는 모달 창  -->
			<div class="container">
				<!-- Trigger the modal with a button -->
				<!-- 레시피 등록하기 버튼 -->
				<br><br><br><br>
				<br>
				<br>
				<br>
				<br>
				<button type="button" id="inputrecipe" class="btn btn-info btn-xsm"
					data-toggle="modal" data-target="#myModal">레시피등록하기</button>

				<!-- Modal -->

				<div class="modal fade" id="myModal" role="dialog">

					<div class="modal-dialog modal-lg">

						<div class="modal-content">

							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal">&times;</button>

								<h4 class="modal-title">최고의 레시피를 자랑해 보세요</h4>

							</div>

							<div class="modal-body">

								<h3>쿡마켓 레시피 등록하기</h3>

								<!-- 	수정이수정2 -->

								<form id="rform"
									action="${cp}/middleController/recipeInsert"
									method="post" enctype="multipart/form-data">

									<label>제목</label><input type="text" id="rtitle" name="rb_title"><br>
									<br> <label>내용</label><br>

									<textarea id="textarea1" cols="80" rows="30" id="cont"
										name="rb_content"></textarea>
									<br>
									<br> <label>첨부파일</label> <input type="file" id="rfile"
										name="profile"><br>
										<input type="hidden" name="id" value="${sessionScope.S_USER}">
									<br> <input type="submit" value="글 저장하기" id="save"
										class="btn btn-primary">

								</form>



							</div>

							<div class="modal-footer">

								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>

							</div>

						</div>

					</div>

				</div>

			</div>





			<br>

			<c:set var="color" value="panel-primary"></c:set>
			<c:forEach items="${recipeList}" var="recipeList">





				<div class="col-sm-4">

					<div class="panel ${color}">

						<div class="panel-heading title">${recipeList.rb_title}</div>

						<div class="panel-body">
							<img
								src="<%=request.getContextPath() %>/image/${recipeList.filename}"
								class="img-responsive" id="${recipeList.rb_cod}"
								style="width: 100%; height: 230px;" alt="${recipeList.filename}">
						</div>


					</div>

				</div>

			</c:forEach>





		</div>

	</div>
	<br>



	<!-- <footer class="container-fluid text-center">

  <p>Online Store Copyright</p>  

  <form class="form-inline">Get deals:

    <input type="email" class="form-control" size="50" placeholder="Email Address">

    <button type="button" class="btn btn-danger">Sign Up</button>

  </form>

</footer> -->

	<div id="footer" style="height: 200px; background-color: ivory">

		<!--       <div class="footer-social">
        </div> -->

		<!--     <div class="">
      <ul class="footer-bar">
      </ul>
    </div> -->
		<div class="damhwaInfo">
			<div class="pcfooter_left">
				<div class="infoNum info02">
					<p>쿡마켓을 이용해주셔서 감사합니다.</p>
					<br>

					<p>평일 10:00-18:00, 주말 휴무</p>
				</div>
				<div class="info01">
					<p>쿡마켓은 5명의 관리자가 운영하고있습니다.</p>
					<p></p>
				</div>


			</div>
			<div class="pcfooter_right">
				<div class="info00">
					<p>대덕인재개발원</p>
					<p>402호</p>
					<p>대장: 김건호</p>
					<p>3조 화이팅</p>
				</div>

			</div>
		</div>
	</div>


</body>
</html>




</body>

</html>
