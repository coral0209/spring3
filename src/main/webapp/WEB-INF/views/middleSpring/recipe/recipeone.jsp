<%@page import="kr.or.ddit.middle.spring.vo.RecipeReviewVO"%>
<%@page import="kr.or.ddit.middle.spring.vo.RecipeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="${cp}/js/jquery-latest.min.js"></script>
	<script src="${cp}/js/jquery.cookie.js"></script>
	<script src="${cp}/js/swiper.min.js"></script> 
	<script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script>
	<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
	<script type = "text/javascript" src = "https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${cp}/public/shopstyle.css?ver=1607311742">
	<link rel="stylesheet" href="${cp}/public/stylep.css?ver=887788">
	<link rel="stylesheet" href="${cp}/public/font-awesome.min.css">
  <title>레시피 메인</title>
  <style>
     body {
    	color : #000080;
 		background-color : 	#F0F8FF;
 	
    }
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #FFB6C1;
      padding: 25px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
    .container-fluid {
    	text-align : center;
    }
    
    img {
    width : 600px;
    height : 500px;
    }
    
    .recipegif {
    width : 300px;
    height : 200px;
    
    }
    
    #heartimg , #peachimg {
    width : 50px;
    height : 50px;
    }
    
    
    
    
  </style>
</head>

<script>
 
 $(document).ready(function(){
	 replyCont = $('#text').val(); 
	 $('#submitReply').on('click' , function(){
	 
		var rbcod = $('.pcontent').attr("id");
        var replyContent = $(this).parents(".success").find('#text').val();
        console.log(replyContent)
        location.href='${cp}/middleController/insertReply?rbcod=' + rbcod + '&replyContent=' + replyContent
      

	})

		//PDF 버튼을 누르면 넘어간다. 

	$('#savePdf').on('click', function(){
		
		var rbcod = $('.pcontent').attr('id');
		//var filename = $('.recipegif').attr('id');
		console.log("rbcod 검사 : " +  rbcod )
		//jsp 를 만들어줘서 
		location.href='${cp}/middleController/recipepdf?rbcod=' + rbcod
			//?content=' + content1
		});

	 //신고하기 버튼

	 

	 $('.alert1').on('click' , function(){
		 var id4 = $('.mainimg').attr("id");
		 var rbcod = $('.pcontent').attr("id");
		 console.log(rbcod);
		 location.href='${cp}/middleAlert/alert?id4=' + id4 + '&rbcod=' + rbcod
		 
		 
		/*  $.ajax({  
			 url :  '${cp}/recipe/recipeAlert.do',
			 type : 'post',
			 data : {
				 'rbcod' : rbcod,
				 'writerid' : id4
				 	 
				 
			 },
			 success : function(res) {

					alert(res.sw);
					location.reload(); 
			 }, 		
			 error : function(xhr) {

					alert("상태 : " + xhr.status);

			},

			dataType : 'json'
	
		
		 }) */
	 })

	 
//댓글 수정 버튼

	//댓글 수정버튼 클릭
	$(".updateReply").on("click", function(){
		console.log("==>" +  $(this).parent().parent().find(".replyCont").text().trim());
		
		$("#ba_cod").val($(this).attr("id"));
		$("#replcontupdate").val($(this).parent().parent().find(".replyCont").text().trim());
		$("#replyUpdateModal").modal('show');
	});
 
	 //수정된 댓글 저장 버튼 클릭 
 	$('#savereply').on('click' , function(){
//  		alert("시험");
		var bacod =  $("#ba_cod").val();
		var rbcod = $('.pcontent').attr("id");
		var updateCont = $('#replcontupdate').val();
		console.log(bacod);
		location.href='${cp}/middleController/updateReply?bacod=' + bacod + '&updateCont=' + updateCont + '&rbcod=' + rbcod; 
        
		
		
	})   
	
	//댓글 삭제 버튼
	$('.deleteReply').on('click' , function(){
		
		//버튼
		var bacod = $(this).attr('id'); 
		var rbcod = $('.pcontent').attr("id");
		console.log(bacod);
		location.href='${cp}/middleController/deleteReply?bacod=' + bacod + '&rbcod=' + rbcod 

	})
	
	
	//레시피 삭제 버튼
	
	$('.deleteRecipe').on('click' , function(){
		
		var rbcod = $(this).attr('id'); 
		console.log(rbcod);
		location.href='${cp}/middleController/deleteRecipe?rbcod=' + rbcod;
	})
	
	
	//레시피 수정 버튼클릭하면 원래 내용을 띄워주기
	$('.updateRecipe').on('click' , function(){
			
		//textarea 아이디 텍스트에 레시피 글을 쓴 내용을 입력하겠다.
		
		//RB_CONTENT 를 얻어오기 
		
		console.log($('.pcontent').text().trim());
		//pdf_wrap 의 p 태그 
	 	$("#recipecontupdate").val($('.pcontent').text().trim()); 
		$('#RecipeUpdateModal').modal('show'); 
	})
	})
	
	
	
	

</script>



<body>
<div id="header">
            <div id="header_content">
                <input type="hidden" name="loginConfirm" value="">
                <label for="menuCheck" class="sidemenu_button">
                    <span class="icon_bar"></span>
              
                </label>
                <a class="logo">
                    <img src="../image/logo.png" style="height: 40px;">
                </a>
                <label for="cartCheck" class="cart_button">
                    <span>0</span>
                </label>
                <div id="header_login_group">
                    <a href="${cp}/mypage/Mypagemain.do">마이페이지</a>
                    <a href="${cp}/cookmarket/Cookmarket.do">로그아웃</a>
                    <a href="${cp}/mypage/Coinmain.do">충전소</a>
                </div>
            </div>

     
            <div id="nav">
                <div id="nav_content">
                    <input type="checkbox" id="Main_category" class="inputhidden">
                    <label for="Main_category" class="Main_category_btn">
                  
					<!-- 수정부분 식자재 경로 넣었고, 이벤트 삭제했습니다 -->
                    </label>
                    <div class="nav_set">
                        <a href="${cp}/grocery/Foodmain.do" class="nav_new">식자재</a>
                        <a href="${cp}/class/classList.do" class="nav_best">클래스</a>
                        <a href="${cp}/middleController/recipeMain" class="nav_event">레시피</a>
                    </div>
                    
                    <div class="nav_search">
                        <img src="/public/img/shop/searchIcon.png" alt="">
                    </div>
                    <div class="search_box_goods">
                        <div class="search_box_header">
                            <span>무엇을 찾고 계신가요?</span>
                            <span class="closeSearchBox"><img src="/public/img/shop/close.png" alt=""></span>
                        </div>
                        <form method="GET" id="sdhSearch" action="/sdhsearch/">
                            <div class="search_box_input">
                                <input type="text" id="" name="searchText" value="" placeholder="제품명 혹은 양조장명을 입력해주세요">
                                <button>
                                    <img src="/public/img/shop/searchIcon.png" alt="">
                                </button>
                            </div>
                        </form>
                    
                    </div>
                    <input type="search" id="nav_search_pc" name="nav_search_pc" placeholder="검색" value="" onkeypress="if(event.keyCode===13) {sdhsearch();}">
                    <input type="checkbox" id="cart_pc" class="inputhidden">
                </div>
            </div>
        </div>





	


	



   <br><br>

	<!-- 메인 body -->

	<div class="container-fluid text-center">

		<div class="row content">
				
				<br>
			
				<img class="mainimg" src="${cp}/image/${oneRecipe.filename}"  id="${oneRecipe.id}" >	
				
					<h1>${oneRecipe.rb_title}</h1>
									<hr>
					<h3>레시피 내용</h3>
					<div class="pcontent"  style="white-space:pre;" id="${oneRecipe.rb_cod}" >${oneRecipe.rb_content}</div><br>

				<!-- 신고하기버튼 -->
				<input type="button" class="btn btn-warning alert1 " value="신고하기"><br>
				<span>${result}</span>
				<br><br>
				<!-- PDF 저장하기 버튼 -->
				<button type="button" class="btn btn-primary" id="savePdf">PDF 저장</button><br><br>

				<div class="reply">

					<h3>댓글</h3>
					<div class="container" id="replydiv">
						<table class="table">
							<thead>
								<tr>
									<th style="width: 15%" id="replyid">아이디</th>
									<th id="replycont">댓글</th>
									<th>작성시간</th>
									<th>
									<th>
								</tr>
							</thead>
							<tbody>
								<tr class="success">
									<td><span>댓글을 입력하세요</span></td>
									<td><textarea id="text" rows="5" cols="30"></textarea></td>
									<!--  <td><input type="text" id="replycont" style="width:800px;"></td> -->
									<td><span><input type="button" id="submitReply" 
											value="댓글등록" class="btn btn-info btn-xsm"></span></td>
									<td><span></span></td>
									<td><span></span></td>
								</tr>
								
								<c:forEach items="${replyList}" var="replylist">
	
								<tr class="warning">
									<td id="forid">${replylist.id}</td>
									<td class="replyCont">${replylist.ba_content}</td>
									<td class="ForBacod">${replylist.ba_date}</td>

									<td>
									
									<c:if test="${replylist.id == sessionScope.S_USER }">

									<input type="button" value="삭제" id="${replylist.ba_cod}" class="btn btn-info btn-xsm deleteReply" id="">
									<input type="button" value="수정" id="${replylist.ba_cod}" class="btn btn-info btn-xsm updateReply"> 
									
									</c:if>
									
									
									<div class="modal fade" id="replyUpdateModal" role="dialog">
									    <div class="modal-dialog modal-lg">

     									 <div class="modal-content">

       										 <div class="modal-header">

         										 <button type="button" class="close" data-dismiss="modal">&times;</button>

          										 <h4 class="modal-title">Modal Header</h4>

        									</div>

        								<div class="modal-body">

          								<h7>댓글 수정하기</h7>
										<form id="rform">
          									<label>댓글입력</label><br>
          									<textarea cols="40" rows="5" id="replcontupdate"></textarea><br><br>
          									<input type="hidden" id="ba_cod" value="">
          									<input type="button" value="댓글 저장하기" id="savereply">
           								</form>
  
        								</div>

       							 			<div class="modal-footer">
          										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        									</div>
      									</div>

    									</div>
									</div>
									
									</td>
									<td></td>

								</tr>

							</c:forEach>

							</tbody>

						</table>

					</div>



				</div>

				<!-- reply 끝 -->
				
				<!-- 삭제 수정 -->
				
				
				<br>
				<br>
				
				<h3>-</h3>
			
				<c:if test="${oneRecipe.id == sessionScope.S_USER }">
				<input type="button" value="레시피 삭제" id="${oneRecipe.rb_cod}" class="deleteRecipe btn btn-primary" >
				<input type="button" value="레시피 수정" id="${oneRecipe.rb_cod}" class="updateRecipe btn btn-primary">
				</c:if>
				
				<div class="modal fade" id="RecipeUpdateModal" role="dialog">
									    <div class="modal-dialog modal-lg">

     									 <div class="modal-content">
       										 <div class="modal-header">

         										 <button type="button" class="close" data-dismiss="modal">&times;</button>

          										 <h4 class="modal-title">레시피 수정하기</h4>

        									</div>

        								<div class="modal-body">

          								<h7>레시피 게시글 수정하기</h7>
										<form id="aform" action="${cp}/middleController/updateRecipe" method="post">
          									<label>글 입력</label><br>
          									<textarea cols="70" rows="30" name="rb_content" id="recipecontupdate"></textarea><br><br>
          									<input type="hidden" name="rb_cod" value="${oneRecipe.rb_cod}">
          									<input type="submit" value="레시피 저장하기" >
           								</form>
  
        								</div>

       							 			<div class="modal-footer">
          										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        									</div>
      									</div>

    									</div>
									</div>
				
				<br>
				<h3>-</h3>
				

			</div>

		</div>
	

</body>

</html>