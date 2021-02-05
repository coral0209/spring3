<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang=ko dir="ltr">

<head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta charset="utf-8">
    <meta http-equiv="content-type" content="text/html" charset="utf-8">
    <meta name="viewport" content="width=device-width, viewport-fit=cover', initial-scale=1, user-scalable=no, shrink-to-fit=no">
    <meta name="description" content="매달 전국각지의 양조장에서 오는 다양한 종류의 전통주를 경험하세요!">
    <meta name="naver-site-verification" content="4b50d2f7153266cc1244c9e6320a62b2ca97d83e" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/lib/w3.css">
    <link rel="apple-touch-icon" sizes="180x180" href="/public/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/public/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/public/favicon/favicon-16x16.png">
    <link rel="manifest" href="/public/favicon/site.webmanifest">
    <link rel="mask-icon" href="/public/favicon/safari-pinned-tab.svg" color="#000000">
    <meta name="msapplication-TileColor" content="#da532c">
    <meta name="theme-color" content="#ffffff">
    <link rel="stylesheet" href="../public/popup.css">
    <link rel="shortcut icon" href="/public/favicon/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/public/favicon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="../public/shopstyle.css?ver=1607311742">
    <link rel="stylesheet" href="../public/stylep.css?ver=887788">
    <link rel="stylesheet" href="../public/font-awesome.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="../js/jquery-latest.min.js"></script>
    <script src="../js/jquery.cookie.js"></script>
    <script src="../js/swiper.min.js"></script>
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-131050684-1"></script>
<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
    width: 50%;
    margin: auto;
  }
.fff1{
text-align : center;
	color : gray;
}
</style>
    <!-- Kakao Pixel Code -->
    <script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
    <script type="text/javascript"> kakaoPixel('2697732037242932303').pageView(); </script>

    <noscript><img height="1" width="1" style="display:none"
                   src="https://www.facebook.com/tr?id=336321937762415&ev=PageView&noscript=1"
        /></noscript>
    <!-- End Facebook Pixel Code -->
    
    <title>쿡마켓 메인</title>
</head>

<body>
        <div id="wrap">
        <div id="header">
            <div id="header_content">
                <input type="hidden" name="loginConfirm" value="">
                <label for="menuCheck" class="sidemenu_button">
                    <span class="icon_bar"></span>
                </label>
                
     		<!--수정부분 로고에 uri 없앰-->
                <a class="logo">
                    <img src="../image/logo.png">
                </a>
                <label for="cartCheck" class="cart_button">
                    <img src="../image/카트.png">
                    <span>0</span>
                </label>
                <div id="header_login_group">
                <%
                	String id = (String)session.getAttribute("id");
                		request.setAttribute("id", id);
                %>
                    <a href="<%=request.getContextPath()%>/mypage/Mypagemain.do">마이페이지</a>
                    <a href="<%=request.getContextPath()%>/cookmarket/Cookmarket.do">로그아웃</a>
                    <a href="<%=request.getContextPath()%>/mypage/Coinmain.do">충전소</a>
                </div>
            </div>
            
           <!--             cart start -->
<!--             <form id="cartOrderFrom" action="/order/" method="POST"> -->
<!--                 <input type="hidden" id="orderType" name="orderType" value="cart"> -->
<!--                 <input type="checkbox" id="cartCheck" class="inputhidden"> -->
<!--                 <label for="cartCheck" id="sidemenu_bg"></label> -->
                
<!--                 <div id="cart"> -->
<!--                                         <div class="baskitTotalPrice"> -->
<!--                         <span>현재 총 구매 가격</span> -->
<!--                         <span id="baskitTotalPrice">0원</span> -->
<!--                         <div class="TotalPriceIcon"><img src="../image/구매하기.png"></div> -->
<!--                     </div> -->
<!--                     <button type="button" id="cartBtnSubmit" class="buyBtn" name="button"> -->
<!--                       			  구매하기 -->
                        <div class="TotalPriceIcon"  onclick="<%=request.getContextPath() %>/pay/pay.do'">
                            <!-- <img src="../image/구매하기.png">
                        </div>
                    </button>
                    <div class="cart_top">
                        <a class="nav_suggest">쿡마켓</a>
                            수정부분 이미지 넣었습니다 카트
                        <div class="cart_img"><img src="../image/카트1.png"></div>
				           <div id="cart_length">
                            <div>0</div>
                        </div>
                    </div>
                    <div class="cart_content_event">
                        <a href="/shop/shopList/category_best/" class="nav_best">장바구니</a>
                    </div>
                    <div class="cart_content">
                        <div class="cartblank"></div>
                        <div class="cart_content_brewery">장바구니가 비었습니다.</div>                                        </div>
                    </div>
            </form> -->


            <!-- 장바구니 end -->
     
            <div id="nav">
                <div id="nav_content">
                    <input type="checkbox" id="Main_category" class="inputhidden">
                    <label for="Main_category" class="Main_category_btn">
                    </label>
                    
                    <div class="nav_set">
                        <a href="<%=request.getContextPath() %>/grocery/Foodmain.do" class="nav_new">식자재</a>
                        <a href="<%=request.getContextPath() %>/class/classList.do" class="nav_best">클래스</a>
                        <a href="<%=request.getContextPath() %>/middleController/recipeMain" class="nav_event">레시피</a>
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
                                <input type="text" id="" name="searchText" value="" placeholder="제품명을 입력해주세요">
                                <button>
                                    <img src="/public/img/shop/searchIcon.png" alt="">
                                </button>
                            </div>
                        </form>
                        <div class="search_box_list">
                            <span>추천</span>
                            <ul>
                                <li>검색</li>
                            </ul>
                        </div>
                        <div class="search_box_list">
                            <span>최근검색</span>
                            <ul>
                                <li>검색</li>
                            </ul>
                        </div>
                    </div>
                    <input type="search" id="nav_search_pc" name="nav_search_pc" placeholder="검색" value="" onkeypress="if(event.keyCode===13) {sdhsearch();}">
                    <input type="checkbox" id="cart_pc" class="inputhidden">

                    
                   <!--  <label for="cartCheck" class="cart_pc_btn" onclick="reTotalPrice('');" style="position:fixed;">
                        <img src="https://sooldamhwa.com/public/img/shop/cart_png.png" alt="">
                        <span>0</span>
                    </label> -->
                </div>
            </div>
        </div>

        <!-- PC버전 header end -->
        <!-- 20200420 황선주 수정 확인 -->
        <div id="content" ><div class="h_event">
    <div class="h_event_pc">
        <div class="top-bn-contain">
            <!-- slider btn -->
            <button type="button" id="bn-perv-btn" class="bn-prev-btn"></button>
            <button type="button" id="bn-next-btn" class="bn-next-btn"></button>
            <!--  슬라이드 배너 시작점입니다. slider btn -->
            <div class="top-banner">
                <div class="bn-num">
                    <span class="activeBtn"  ></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
    </div>
</div>

<!--수정부분 url 경로 넣음 -->
<div class="shop-banner-section">
    <div class="rec" onclick="location.href='<%=request.getContextPath() %>/grocery/Foodmain.do'">
        <img src="../image/식품쇼핑2.png">
        <h2>식자재</h2>
        <h5>식자재 서비스 바로가기 ></h5>
    </div>

    <div class="sub" onclick="location.href='<%=request.getContextPath() %>/class/classList.do'">
        <img src="../image/요리사.png">
        <h6>클래스</h6>
        <h5>클래스 서비스 바로가기 ></h5>
    </div>
    
    <div class="event" onclick="location.href='<%=request.getContextPath() %>/recipe/Recipemain.do'">
        <img src="../image/레시피1.png">
        <h2>레시피</h2>
        <h5>레시피 서비스 바로가기 ></h5>
    </div>
</div>

<div class="detail_text">
    <div class="rec_text"><h2>다양한 식자재 간편하게 구입하기</h2></div> 
    <div class="sub_text"><h2>다양한 요리 클래스 배워보기</h2></div>
    <div class="event_text"><h2>다양한 레시피 구경하기</h2></div>
</div>
<div class="horizontal_line"><hr class="line"></div>

  <div class="container-fluid">
    <div class="navbar-header">
    </div>
  </div>
  <div class="container">
	<h1 class="fff1"><span>오늘의 Best 상품 추천!</span></h1>
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
      <li data-target="#myCarousel" data-slide-to="5"></li>
      <li data-target="#myCarousel" data-slide-to="6"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="../image/파.jpg" alt="파" width="100" height="100">
        <div class="carousel-caption">
          <h3>파 가격:3500원</h3>
          <h4>1단 2Kg내외</h4>
        </div>
      </div>

      <div class="item">
        <img src="../image/쏘야.jpg" alt="소시지" width="100" height="100">
        <div class="carousel-caption">
          <h3>소시지 가격:4000원</h3>
          <h4>세상에서 가장매운 떡볶이 한팩세트</h4>
        </div>
      </div>
    
      <div class="item">
        <img src="../image/순대국밥.jpg" alt="Flower" width="100" height="100">
        <div class="carousel-caption">
          <h3>순대국밥 가격:500원</h3>
          <h4>든든한~ 순대국밥 한팩세트</h4>
        </div>
      </div>

      <div class="item">
        <img src="../image/김치찌개.jpg" alt="Flower" width="100" height="100">
        <div class="carousel-caption">
          <h3>김치찌개 가격:6000원</h3>
          <h4>엄마가 끓여준 맛있는 김치찌개 재료 세트</h4>
        </div>
      </div>
      
            <div class="item">
        <img src="../image/된장찌개.jpg" alt="Flower" width="100" height="100">
        <div class="carousel-caption">
          <h3>된장찌개 가격:6000원</h3>
          <h4>한국인의 깊은맛이 나는 된장찌개 재료 세트</h4>
        </div>
      </div>
      
            <div class="item">
        <img src="../image/마늘조림.jpg" alt="Flower" width="100" height="100">
        <div class="carousel-caption">
          <h3>마늘조림 가격:3500원</h3>
          <h4>의성마늘로 만드는 마늘조림 세트</h4>
        </div>
      </div>
      
            <div class="item">
        <img src="../image/김치.jpg" alt="Flower" width="100" height="100">
        <div class="carousel-caption">
          <h3>김치 가격:24,200원</h3>
          <h4>김장김치</h4>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

<div class="horizontal_line2"><hr class="line"></div>
<div class="shop-register-description">지금 포인트 충전 하시고 각종 서비스를 경험하세요!</div>
<div class="shop-register-section">


<!-- 수정부분 게시판 경로 넣었습니다 -->
        <div class="register_icon" onclick="location.href='<%=request.getContextPath() %>/qnaboard/Qnaboard.do'"><img src= "../image/게시판.png"></div> 
        <div class="register_text" onclick="location.href='<%=request.getContextPath() %>/qnaboard/Qnaboard.do'"><h2>게시판 바로가기 ></h2></div>

        
        <div class="get_point_icon"><img src = "../image/시간.png"> </div>
        <div class="get_point_text"> <h2>시간절약 가능</h2></div>
    

    
        <div class="suggest_service_icon"><img src = "../image/레시피2.png"> </div>
        <div class="suggest_service_text"> <h2>글 작성 서비스 이용</h2></div>
        
        	<!-- 수정부분 별점->즐겨찾기 필수! 로 변경했습니다 -->
        <div class="review_write_icon"><img src = "../image/추천.png"> </div>
        <div class="review_write_text"> <h2>즐겨찾기 필수!</h2></div>

        <div class="organized_note_icon"><img src = "../image/리뷰.png"> </div>
        <div class="organized_note_text"> <h2>리뷰 서비스 이용</h2></div>
</div>

<div id="main_popup_" style=" display:none; height:<br />
<b>Notice</b>:  Undefined variable: popup in <b>/home/hosting_users/sooldamhwa/www/application/views/shop/index.php</b> on line <b>528</b><br />
<br />
<b>Notice</b>:  Trying to get property of non-object in <b>/home/hosting_users/sooldamhwa/www/application/views/shop/index.php</b> on line <b>528</b><br />
px; margin-left:-140px;">
    <div class="popup_bottom" style="width:100%; display:flex; padding-top:5px; height:20px; background:#000;">
    <span class="pull-right white" id="closePopup" style="margin-left:auto; margin-right:5px; color:#fff; cursor:pointer;">닫기</span>
    <span class="pull-right white" id="closeDay_" style="margin-left:5px; margin-right:5px; color:#fff; cursor:pointer;">오늘하루 닫기</span>
    </div>
    <a href="https://sooldamhwa.com/shop/detail/180"><img src="https://sooldamhwa-static-file.s3.ap-northeast-2.amazonaws.com/novermber_box.jpg" alt="" style="width:100%;"></a>
</div>

<!-- <div class="horizontal_line2"><hr class="line"></div> -->
<script src="/public/js/main-slider.js"></script>
<script src="/public/js/channelTalk.js"></script>
<script type="text/javascript">

$( document ).ready( function() {
// var popCoo = $.cookie('popup2');
//     if(popCoo == 1){
        $("#main_popup_").hide();
    // }
    // else{
    //     $("#main_popup_").show();
    // }
});





$("#closePopup").click(function(){
    $("#main_popup_").hide('fade');
});

$("#closeDay_").click(function(){
    $.cookie('popup2', '1', { expires: 1 });
    $("#main_popup_").hide();
});
</script>
</div>
<div id="footer">
    <div class="">
        <div class="footer-social">
        </div>
    </div>
    <div class="">
      <ul class="footer-bar">
      </ul>
    </div>
    <div class="damhwaInfo">
      <div class="pcfooter_left">
        <div class="infoNum info02">
            <p>쿡마켓을 이용해주셔서 감사합니다.</p>
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
</div>
</body>
</html>

