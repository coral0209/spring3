$(function(){
    $(".layerOpen").click(function(){
        reviewID = $(this).children("#reviewID").val();
        merchant_id = $(this).data('merchant');
        $.ajax({
            method: "POST",
            url: "/dashboard/reviewWrite/",
            data: {
                reviewID: reviewID,
                merchant_id:merchant_id
            }
        })
        .done(function(data){
            $("#reviewBox").html(data);
            $(".layerBox").show();
            $(".white-overlay").show();
        });
    });

    $(".routineGift").click(function(){
        od_id = $(this).children("#od_id").val();
        $.ajax({
            method: "POST",
            url: "/dashboard/orderdetail/",
            dataType:"html",
            data: {
                od_id: od_id
            }
        }).done(function(data){
            $("#orderView").html(data);
            $(".order_detail").css("display","flex");
        });
    });
    //dashboard page

    // 대시보드 등록
    $("#requestsBtn").click(function(){
        var uGUID = $("input[name=uGUID]").val();
        var r_title = $("input[name=r_title]").val();
        var r_cate = $("select[name=r_cate] option:selected").val();
        var r_phone = $("input[id=phone_number1]").val() + $("input[id=phone_number2]").val() + $("input[id=phone_number3]").val();
        var r_content = $("textarea[name=r_content]").val();
        var Question_add_img = null;
        if($("input[name=Question_add_img]")[0].files[0] != undefined){
            Question_add_img = $("input[name=Question_add_img]")[0].files[0];
        }
    
        var rData = new FormData();
        rData.append('Question_add_img',Question_add_img);
        rData.append('uGUID',uGUID);
        rData.append('r_title',r_title);
        rData.append('r_cate',r_cate);
        rData.append('r_phone',r_phone);
        rData.append('r_content',r_content);
        rData.append('r_mailChk',r_mailChk);
        if($("input[name=r_mailChk]").is(":checked") == true){
            var r_mailChk = $("input[name=r_mailChk]").val()
        }else{
            var r_mailChk = '';
        }
        if(r_title == ''){
            alert('제목을 입력해주세요.');
        }
        else if(r_content == ''){
            alert('내용을 입력해주세요.');
        }
        else if(confirm('문의사항을 등록하시겠습니까?') === true){
            $.ajax({
                method:"POST",
                url:"/dashboard/regRequests",
                processData: false,
                contentType: false,
                data:rData,
                success:function(msg){
                    alert(msg);
                    window.location = "/dashboard/questionlist/1";
                }
            })
        }
        else{
            return false;
        }
    });
    
    //메일 중복검사
    $("#overlapEmali").click(function(){
        var uMEmail = $("input[name=modifyEmail]").val();
        if(!uMEmail){
            alert('변경하실 이메일을 입력해주세요.');
        }
        else if(mailChk(uMEmail) == false){
            alert('이메일형식이 잘못되었습니다.');
        }
        else{
            $.ajax({
                method:"POST",
                url:"/dashboard/overlapEmail/",
                data:{
                    uMEmail:uMEmail,
                },
                success:function(msg){
                    if(msg != ''){
                        alert(msg);
                        $("input[name=modifyEmail]").val('');
                    }
                    else{
                        alert('수정하실 수 있는 이메일입니다.');
                        $("input[name=confirmEmail]").val(uMEmail);
                        $("input[name=confirmEmail]").prop('checked',true);
                    }
                }
            });
        }
    });
    
    //이메일 변경
    $("#regModifyInfo").click(function(){
        var uMEmail = $("input[name=modifyEmail]").val();
        var uGUID = $("input[name=uGUID]").val();
        var uMPhone = $("input[name=uMPhone]").val();
        var password = $("input[name=uPass]").val();
        var confirmEmail = $("input[name=confirmEmail]").is(':checked');
        if(!uMEmail){
            alert('변경하실 이메일을 입력해주세요.');
        }
        else if(mailChk(uMEmail) == false){
            alert('이메일형식이 잘못되었습니다.');
        }
        else if(confirmEmail == false){
            alert('이메일 중복확인을 해주세요.');
        }
        else if($("input[name=confirmEmail]").val() != uMEmail){
            alert('변경될 이메일이 정확하지 않습니다.');
        }
        else{
            $.ajax({
                method:"POST",
                url:"/dashboard/regModifyInfo/",
                data:{
                    uGUID:uGUID,
                    uMEmail:uMEmail,
                    password:password,
                    uMPhone:uMPhone
                },
                success:function(msg){
                    alert(msg);
                }
            });
        }
    });

    //회원비밀번호변경
    $("#modifyPass").click(function(){
        var uGUID = $("input[name=uGUID]").val();
        var password = $("input[name=uPass]").val();
        $.ajax({
            method:"POST",
            url:"/dashboard/confirmPass/",
            data:{
                uGUID:uGUID,
                password:password
            },
            success:function(msg){
                console.log(msg.length)
                if(msg.trim() != ''){
                    alert(msg);
                }
                else{
                    $(".newPass").show();
                }
            }
        })
    });

    //회원탈퇴
    $("#removeMember").click(function(){
        const uGUID = $("input[name=uGUID]").val();
        const point = $("input[name=point]").val();
        const pointRenderer = Number(point) ? Number(point).toLocaleString() : '';
        const message = '술담화 회원을 탈퇴하시겠습니까?\n' +
            '탈퇴 후에는 현재 보유하신 ' + pointRenderer + '포인트가 자동 소멸되며, 개인정보가 삭제되어 복구하실 수 없습니다.';
        if(confirm(message) == true){
            $.ajax({
                method:"POST",
                url:"/member/unregister",
                data:{
                    uGUID:uGUID,
                },
                success:function(msg){
                    const successMessage = '회원탈퇴가 완료되었습니다.\n' +
                        '그동안 술담화를 이용해 주셔서 대단히 감사드립니다.';
                    alert(successMessage);
                    location.href = '/';
                },
            })
        }
        else{
            return false;
        }
    });
});

$( document ).ready( function() {
    //************************************************************
    //    * navi arcodion jquery
    //************************************************************
  
    var popCoo = $.cookie('popup');
    if(popCoo == 1){
        $("#main_popup").hide();
    }
    else{
        $("#main_popup").show();
    }

   


    $("#siSe").click(function(){
        $(this).css('border-left','1px solid #ddd');
        $(".searchBox").addClass("searchBox-on");
        $(".side-menu").addClass("side-menu-top");
        $(".search-item").css('display','block');
        $(".header > .side-menu > ul").addClass('side-menu-show');
    });
    $(".search-item-close > span").click(function(){
        $(".searchBox").removeClass("searchBox-on");
        $(".side-menu").removeClass("side-menu-top");
        $(".search-item").css('display','none','max-height','0');
        $(".header > .side-menu > ul").removeClass('side-menu-show');
        $("input:checkbox[id='pc-search']").attr('checked','false');
    });

    //************************************************************
    //    * top 고정 jquery
    //************************************************************
    var scrTop = $( document ).scrollTop();
    if ( scrTop > 50 ) {
        $( '.nav' ).addClass( 'nav-fixed' );
    }
    $( window ).scroll( function() {
        var scrTop = $( document ).scrollTop();
        if ( scrTop > 50 ) {
            $( '.nav' ).addClass( 'nav-fixed' );
        }
        else{
            $( '.nav' ).removeClass( 'nav-fixed' );
        }
    });

    //************************************************************
    //    * side 메뉴 jquery
    //************************************************************
    $('.buger').click(function(){
        if($(this).hasClass('buger-x')){
            $(this).removeClass('buger-x');
            $('html').removeClass('overflow-y');
            $('.side-menu').removeClass('side-menu-on');
            $('.side-menu').removeClass('side-menu-on-top');
        }
        else {
            var headtop = $( '.nav' ).offset().top;
            $(this).addClass('buger-x');
            $('html').addClass('overflow-y');
            if ( headtop > 50 ) {
                $('.side-menu').addClass('side-menu-on-top');
            }
            else{
                $('.side-menu').addClass('side-menu-on');
            }
        }
    });

    //************************************************************
    //    * basketBox jquery
    //************************************************************
    $('.basket-x').click(function(){
        $('.basketBox').toggleClass('basketBox-on');
        $('.basket-overlay').toggleClass('basket-overlay-on');
        $('html').css('overflow','hidden');
        $('.side-menu').removeClass('side-menu-on');
        $('.buger').removeClass('buger-x');
    });
    $(".basket-overlay").click(function(){
        $(this).removeClass('basket-overlay-on');
        $('html').removeClass('overflow-y');
        $('.basketBox').removeClass('basketBox-on');
        $('html').css('overflow','auto');
    });
    $(".basketTop > span").click(function(){
        $('.basket-overlay').removeClass('basket-overlay-on');
        $('.basketBox').removeClass('basketBox-on');
        $('html').css('overflow','auto');
    });
    $("#cartBtnSubmit").click(function(){
        var loginConfirm = $("input[name=loginConfirm]").val();
        var cartlength = $(".cart_content_brewery").length;
        if(cartlength != 0){
            if(!loginConfirm){
                if(confirm('로그인이 필요한서비스입니다.로그인하시겠습니까?') == true){
                    location.href="/login/?menu=order&page=orderReady";
                }
                else{
                    return false;
                }
            }
            else{
                if(typeof fbq == 'function' ){
                    fbq('track', 'InitiateCheckout');
                }
                $("#cartOrderFrom").submit();
            }
        }
        else{
            alert('상품이 없습니다.');
        }
    });

    //************************************************************
    //    * close 메뉴 jquery
    //************************************************************
    $('.close').click(function(){
        $('.buger').removeClass('buger-x');
        $('.side-menu').removeClass('side-menu-on');
        $('.detail-info').removeClass('detail-info-on');
        $('html').removeClass('overflow-y');
    });

    $('.mtSc').click(function(){
        var scmove = $('#lss').offset().top;
        $('html,body').animate({scrollTop:scmove}, 400);
    });

    $('.filter-btn').click(function(){
        $('.detail-info').toggleClass('detail-info-on');
        $('html').toggleClass('overflow-y');
    });

    $("#closeDay").click(function(){
        $.cookie('popup', '1', { expires: 1 });
        $("#main_popup").hide();
    });

    //검색페이지 노출
    $(".nav_search").click(function(){
        $(".search_box_goods").show();
    });

    $(".closeSearchBox").click(function(){
        $(".search_box_goods").hide();
    });
    //************************************************************
    //    * 완성 후 삭제
    //************************************************************
    $('.filter-view').click(function(){
        $(this).toggleClass('on');
        $('.choice-filter').toggle();
    });
    $('.deliy-view1').click(function(){
        $(this).toggleClass('on');
        $('.sGoods > ul > li > div > ul > li:first-child').toggle();
    });
    $('.deliy-view2').click(function(){
        $(this).toggleClass('on');
        $('.sGoods > ul > li > div > ul > li:nth-child(2)').toggle();
    });
    $('.deliy-view3').click(function(){
        $(this).toggleClass('on');
        $('.sGoods > ul > li > div > ul > li:nth-child(3)').toggle();
    });
    $(".login-1").click(function(){
        $(".loginBefor").toggle();
        $(".loginAfter").toggle();
    });

    //login
    $("#login-submit").submit(function(event){
        event.preventDefault();
        var loginEmail = $("#username").val();
        var loginPass = $("#password1").val();
        var getPage = $("input[name=getPage]").val();
        var getMenu = $("input[name=getMenu]").val();
        if(loginEmail == ""){
            alert('이메일을 입력해주세요.');
        }
        else if(mailChk(loginEmail) == false){
            alert('이메일 형식에 맞지 않습니다.');
        }
        else if (loginPass == ""){
            alert('비밀번호를 입력해주세요');
        }
        else if (loginEmail != "" && loginPass != ""){
            $.ajax({
                method: "POST",
                url: "/login/loginCheck/",
                data: { 
                    username: loginEmail,
                    password: loginPass
                },
                success:function(msg){
                    if(msg.trim() === ''){
                        if(getPage === ''){
                            location.href='/'+getMenu;
                        }
                        else{
                            if(getMenu === 'detail'){
                                location.href='/shop/'+getMenu + '/' + getPage;
                            }
                            else{
                                if(getPage === 'orderReady'){
                                    location.href='/'+getMenu + '/' + getPage + '?orderType=cart';
                                }
                                else if(getPage === "myorderlist"){
                                    location.href='/'+getMenu + '/' + getPage + '/1';
                                }
                                else{
                                    location.href='/'+getMenu + '/' + getPage;
                                }
                            }
                        }
                    }
                    else{
                        alert(msg);
                    }
                }
            })
        }
    });
    
    $(".addrOpen").click(function(){
        //load함수를 이용하여 core스크립트의 로딩이 완료된 후, 우편번호 서비스를 실행합니다.
        daum.postcode.load(function(){
            new daum.Postcode({
                oncomplete: function(data) {
                    $('input[name=zonecode]').val(data.zonecode);
                    $('input[name=roadAddress01]').val(data.roadAddress);
                }
            }).open();
        });
    });
    
    //구독 - 선물하기 
    $("#pointInsert").on("keyup", function(){
        var orderPrice = $("input[name=orderPrice]").val();
        var totalPrice = $("input[name=totalPrice]").val();
        var totalP = 0;
        $.ajax({
            method: "POST",
            url: "/order/pointChk/",
            data: {
                uguid: $("input[name=uGUID]").val(),
                hpoint: $("#havePoint").val(),
                point: $("#pointInsert").val()
            },
            success:function(msg){
                if(msg == 'true'){
                    alert('사용가능한 포인트를 초과 입력하였습니다.');
                    $("#pointInsert").val('0');
                    $("#totalprice").html(orderPrice);
                }
                else if((msg == 'false')){
                    totalP = orderPrice - $("#pointInsert").val();
                    if(totalP < 0){
                        alert('결제금보다 포인트가 많습니다');
                        $("#totalprice").html(orderPrice + '원');
                    }
                    else{
                        $("#totalprice").html(totalP.toLocaleString() + '원');
                        $("input[name=totalPrice]").val(totalP);
                    }
                }
            }
        });
    });
    
    $("input[name=giftChk]").on('change',function(){
        if($(this).is(":checked") == true){
            $("#msgSms").show();
        }
        else{
            $("#msgSms").hide();
        }
    });

    $("#giftpayment").click(function(){
        var giftChk = 'N';
        var msgSms = '';
        if($("input[name=giftChk]").is(":checked") == true){
            giftChk = 'Y';
            msgSms = $("textarea[name=msgSms]").val();
        }
        else{
            giftChk = 'N';
            msgSms = '';
        }
        IMP.init('imp57657385');
        var totalPrice = $("input[name=totalPrice").val();
        var point = $("#pointInsert").val();
        var payprice = totalPrice - point;
        var merchant_id = $("input[name=merchant_id]").val(); 
        //주문서 준비 관련 기존 것과 맞춰봅시다...
        var name = $("input[name=productName]").val();
        var gift = 1;
        var buyer_name = $("input[name=name]").val();
        var buyer_tel = $("input[name=phone]").val();
        var ogiftNm = $("input[name=gift_name]").val();
        var gift_Phone = $("input[name=gift_phone]").val();
        var oGetNm = $("input[name=gift_name]").val();
        var oGetPhone = $("input[name=gift_phone]").val();
        var zone_code = $("#zonecode").val();
        var addr01 = $("#roadAddress").val();
        var addr02 = $("#roadAddress02").val();
        var month = ''
        var memo = $("#memo").val();
        var privacy1 = 'agree';
        var privacy2 = 'agree';
        var teakbae = 'teakFree';
        var pay_method = $("#pay_method").val();
        var amount = $("input[name=totalPrice").val();
        var point = $("#pointInsert").val();
        var couponPrice = 0;
        var oDeliPrice = 0;
        var couponKey = '';
        var addpoint = '';
        updateOrder(merchant_id,totalPrice,oDeliPrice,point,couponPrice,couponKey);
        if($("#gift_name").val() == ''){
            alert('받는분 성함을 입력해주세요.');
        }
        else if($("#gift_phone").val() == ''){
            alert('받는분 전화번호를 입력해주세요.');
        }
        else if ($("#zonecode").val() == '') {
            alert('배송지를 입력해주세요.');
        }
        else if ($("#pay_method").val() == '') {
            alert('결제 방법을 선택해주세요.');
        }
        else{
            const getEndPoint = function() {
                const hostname = window.location.hostname;

                if (!hostname) {
                    return "https://sooldamhwa.com";
                }

                if (hostname.indexOf('localhost') > -1) {
                    return 'http://localhost:8000';
                } else if (hostname.indexOf('sdhprep.cafe24.com') > -1) {
                    return 'http://sdhprep.cafe24.com';
                }

                return "https://sooldamhwa.com";
            };

            const endPoint = getEndPoint();
            IMP.request_pay({
                pg : 'nice.IMPsoool1m',//'nice.IMPsool01m',     //MPsoool2m'                           // version 1.1.0부터 지원.
                pay_method:pay_method,
                merchant_uid:merchant_id,
                name : name,
                amount : payprice,
                buyer_email : $("input[name=email]").val(),
                buyer_name : buyer_name,
                buyer_tel : buyer_tel,
                buyer_addr : addr01 + addr02,
                buyer_postcode : zone_code,
                notice_url: endPoint + '/order/vbankcomplete/',
                m_redirect_url : endPoint + '/order/completemobile?product_name_display=' + name + '&gift=' + gift  + '&oNm=' + buyer_name + '&phone=' + buyer_tel + '&ogiftNm=' + ogiftNm + '&gift_Phone=' + gift_Phone + '&oGetNm=' + oGetNm + '&oGetPhone=' + oGetPhone + '&zone_code=' + zone_code + '&addr01=' + addr01 + '&addr02=' + addr02 + '&month=' + month + '&memo=' + memo  + '&privacy1=' + privacy1 + '&privacy2=' + privacy2 + '&oDeliPrice=' + teakbae + '&pay_way=' + pay_method + '&totalPrice=' + payprice + '&point=' + point + '&coupon=' + couponPrice + '&couponNo=' + couponKey + '&addpoint=' + addpoint,
            }, function(rsp) {
                if (rsp.success){
                    $.ajax({
                        method:"POST",
                        url:"/order/completeOrder/",
                        data:{
                            merchant_uid:rsp.merchant_uid,
                            imp_uid:rsp.imp_uid,
                            product_name_display:name,
                            gift:gift,
                            oNm:buyer_name,
                            phone:buyer_tel,
                            ogiftNm:ogiftNm,
                            gift_Phone:gift_Phone,
                            oGetNm:oGetNm,
                            oGetPhone:oGetPhone,
                            zone_code:zone_code,
                            addr01:addr01,
                            addr02:addr02,
                            month:month,
                            memo:memo,
                            privacy1:privacy1,
                            privacy2:privacy2,
                            oDeliPrice:teakbae,
                            pay_way:pay_method,
                            totalPrice:payprice,
                            point:point,
                            coupon:couponPrice,
                            couponNo:couponKey,
                            addpoint:addpoint,
                            giftChk:giftChk,
                            msgSms:msgSms
                        },
                        success:function(re){
                            location.href='/order/orderComplete/' + rsp.merchant_uid;
                        }
                    });
                }
                else {
                    var msg = '결제에 실패하였습니다.';
                    check_process = '3';
                    pointUse = '0';
                    msg += '에러내용 : ' + rsp.error_msg;
                }
            });
        }
    });
});

//콤마찍기
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

//특수문자 제거
function removeSpecialletter(e){
    //함수를 호출하여 특수문자 검증 시작.
    var regExp = /[\{\}\[\]\/?,<>p;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
    if(regExp.test(e.value)){
        var t = e.value.replace(regExp, "");
        //특수문자를 대체. ""
        // alert("특수문자 제거. ==>" + t);
        alert('특수문자는 사용하실 수 없습니다.');
        e.value = t;
        //특수문자 제거. ==>20171031
    }else{
        // alert("특수문자 없음 "+e.value);
    }
}

//검색
function sdhsearch(){
    var searchWord = $("input[name=nav_search_pc]").val();
    if(!searchWord){
        alert('검색어를 입력해주세요.');
    }
    else{
        kakaoPixel('2697732037242932303').search({ keyword: searchWord });
        $("input[name=searchText]").val(searchWord);
        $("#sdhSearch").submit();
    }
}

// 추천서비스
function recommSubmit(){
    var uGUID = document.getElementById('uGUID').value;
    var qdx = 7;
    var recommNumber = new Array(); 
    for(var i=0; i<=qdx; i++) {
        var q = i + 1;
        if($('input[name="recom0'+q+'"]:checked').val() == null){
            alert(q+'번째 문항을 작성하지 않았습니다.');
            return false;
        }
        else{
            recommNumber[i] = $('input[name="recom0'+q+'"]:checked').val();
        }  
    }
    $.ajax({
        method:"POST",
        url:"/dashboard/seRecomm/",
        data:{
            recommNumber:recommNumber
        },
        success:function(msg){
            if(msg == 'false'){
                alert('정상적으로 등록되지 않았습니다.');
                return false;
            }
        }
    });

    document.getElementById('recommSubmit').submit();
}

function phoneChk(phone){
    var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
    if ( !regExp.test( phone ) ) {
        return false
    }
    else{
        return true;
    }
}

function mailChk(mail){
    var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if(!regExp.test(mail)) {
        return false;
    }
}

function qlistSearch(rcate){
    $("input[name=rcate]").val(rcate);
    $("#qlistSubmit").submit();
}

// 팝업창띄우기 
function popupOpen(url,title){
    var popUrl = url;
    var popOption = "width=650px, height=550px, resizable=no, location=no, top=300px, left=300px;"
     
    window.open(popUrl,title,popOption);    
}

function paging(startIndex, totalCount, pageCnt, pMethod) {

    var pagingHTML 			= "";
    var page            = parseInt(startIndex);     // ���� ������ ��ȣ
    var totalCount      = parseInt(totalCount);     // ��ü �ο� ī��Ʈ
    var pageBlock				= parseInt(pageCnt);             // �� �������� ǥ�õ� Row ī��Ʈ
    var navigatorNum    = 10;                       // ������ �׺����̼� ī��Ʈ
    var firstPageNum		= 1;

    var lastPageNum		= Math.floor((totalCount-1)/pageBlock) + 1;
    var previewPageNum  = page == 1 ? 1 : page-1;
    var nextPageNum		= page == lastPageNum ? lastPageNum : page+1;
    var indexNum		= startIndex <= navigatorNum  ? 0 : parseInt((startIndex-1)/navigatorNum) * navigatorNum;

    if (totalCount >= 1) {
        pagingHTML += "<ul class='pagination pagination-sm justify-content-center mt-3'>";
        if (startIndex >= 1) {
            pagingHTML += '<li class="'+'page'+'-'+'item' +'"><a class="'+'page'+'-'+'link" href="'+pMethod+previewPageNum+'"><div class="myDamhwa_triangle_left"></div></a></li>' ;
        }

        for (var i=1; i<=navigatorNum; i++) {
            var pageNum = i + indexNum;
            if (pageNum == startIndex)
                pagingHTML += '<li class="'+'page'+'-'+'item' +' active"><a class="'+'page'+'-'+'link" href="'+pMethod+pageNum+'">'+pageNum+'</a></li>' ;
            else
                pagingHTML += '<li class="'+'page'+'-'+'item' +'"><a class="'+'page'+'-'+'link" href="'+pMethod+pageNum+'">'+pageNum+'</a></li>' ;
            if (pageNum==lastPageNum)
                break;
        }
        pagingHTML += '<li class="'+'page'+'-'+'item' +'"><a class="'+'page'+'-'+'link" href="'+pMethod+nextPageNum+'"><div class="myDamhwa_triangle_right"></div></a></li>' ;
        pagingHTML += "</ul>";
    }
    return pagingHTML;
}

NodeList.prototype.indexOf = Array.prototype.indexOf;
function moveToNextSibling(el) {
    let allInputsArr = document.getElementsByName(el.getAttribute("name"));
    let presentInput = allInputsArr.indexOf(el);
    let maxLength = parseInt(el.getAttribute('maxlength'));
    if(el.value.length >= maxLength) {
        el.value = el.value.substring(0, maxLength);
        if(presentInput + 1 !== allInputsArr.length) {
            allInputsArr[presentInput+1].focus();
        }
    }
}

function quitSubscription() {
    window.scrollTo({ top: 0, behavior: 'smooth' });
    document.querySelector("#cancel-subscription-mask").style.display = 'block';
    document.querySelector("#cancel-subscription-modal").style.display = 'block';
}

function unicodeToChar(text){
    return text.replace(/\\u[\dA-F]{4}/gi,
    function (match) {
        return String.fromCharCode(parseInt(match.replace(/\\u/g, ''), 16));
    });
}

function updateOrder(merchant_id,totalPrice,oDeliPrice,point,coupon,couponNo){
    var merchant_id = merchant_id;
    var totalPrice = totalPrice;
    var oDeliPrice = oDeliPrice;
    var point = point;
    var coupon = coupon;
    var couponNo = couponNo;
    $.ajax({
        method: "POST",
        url:"/order/masterOrderUpdate",
        data:{
            merchant_id:merchant_id,
            totalPrice:totalPrice,
            oDeliPrice:oDeliPrice,
            point:point,
            coupon:coupon,
            couponNo:couponNo
        },success:function(msg){
      
      
        }
    })
}

function NumComma(obj) {
    var deleteComma = obj.value.replace(/\,/g, "");
    if(isFinite(deleteComma) == false) {
        alert("문자는 입력하실 수 없습니다.");
        obj.value = obj.value.replace(/[^0-9]/g, "");
    }
    obj.value = inputNumberWithComma(inputNumberRemoveComma(obj.value));
}

function inputNumberWithComma(str) {
    if (!str) {
        return 0;
    }

    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
}

function inputNumberRemoveComma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, "");
}
//이메일 정규식
function isEmail(asValue) {

	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	return regExp.test(asValue); // 형식에 맞는 경우 true 리턴	

}

function addrOpen(){
    daum.postcode.load(function(){
        new daum.Postcode({
            oncomplete: function(data) {
                document.querySelector('input[name=zonecode]').value = data.zonecode;
                document.querySelector('input[name=roadAddress01]').value = data.roadAddress;
            }
        }).open();
    });
}