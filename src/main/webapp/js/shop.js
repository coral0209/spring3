var swiper = new Swiper('.mobileSlide', {
  spaceBetween: 30,
  effect: 'fade',
  loop: true,
  autoplay: {
    delay: 4500,
    disableOnInteraction: false,
  },
  pagination: {
    el: '.h_event_rolling',
    clickable: true,
    renderBullet: function (index, className) {
      return '<span class="' + className + '">' + (index + 1) + '</span>';
    },
  },
  // on: {
  //   slideChangeTransitionEnd: function(){
  //     SetPageNumber(activeIndex+1);
  //   },
  // },
    
});
var windowWidth = $( window ).width();
if(windowWidth < 500){
  var preview = 2.6;
  var group = 2;
  var previewtitle = 1;
  var subpreview = 1.4;
  var center = false;
  var loop = false;
  var margin = 6;
  var mobile = true;
}else{
  var preview = 4.6;
  var group = 4;
  var previewtitle = 'auto';
  var subpreview = 3;
  var center = false;
  var loop = false;
  var margin = 15;
  var mobile = false;
}

var swiper = new Swiper('.bestSeller', {
  //slidesPerView: winEa,
  slidesPerView: preview,
  slidesPerGroup: group,
  centeredSlides: center,
  loop: loop,
  loopFillGroupWithBlank: true,
  spaceBetween: margin,
  paginationClickable: true,
  navigation: {
    nextEl: '#best_next',
    prevEl: '#best_prev',
  },
  // nextButton:'#jsnext',
});

var swiper = new Swiper('.recommendation', {
  //slidesPerView: winEa,
  loopFillGroupWithBlank: false,
  slidesPerView: preview,
  slidesPerGroup: group,
  centeredSlides: center,
  loop: loop,
  loopFillGroupWithBlank: false,
  spaceBetween: margin,
  navigation: {
    nextEl: '#rec_next',
    prevEl: '#rec_prev',
  },
});

var swiper = new Swiper('.firstRecBox', {

  slidesPerView: preview,
  slidesPerGroup: group,
  centeredSlides: center,
  loop: loop,
  loopFillGroupWithBlank: false,
  spaceBetween: margin,
  navigation: {
    nextEl: '#fir_next',
    prevEl: '#fir_prev',
  },
});

var swiper = new Swiper('.last-category', {
  loopFillGroupWithBlank: false,
  slidesPerView: preview,
  slidesPerGroup: group,
  centeredSlides: center,
  loop: loop,
  loopFillGroupWithBlank: false,
  spaceBetween: margin,
  navigation: {
    nextEl: '#sale_next',
    prevEl: '#sale_prev',
  },
});

var swiper = new Swiper('.brewery_product', {
  //slidesPerView: winEa,
  loop: loop,
  slidesPerView: function() {if (mobile) { return 2.6 } else { return 3 } }(),
  slidesPerGroup: function() {if (mobile) { return 2 } else { return 3 } }(),
  centeredSlides: center,
  //loop: true,
  loopFillGroupWithBlank: false,
  spaceBetween: function() {if (mobile) { return 0 } else { return 20 } }(),
  navigation: {
    nextEl: '#brewery_next',
    prevEl: '#brewery_prev',
  },
});

var swiper = new Swiper('.detailPage_img', {
  //slidesPerView: winEa,
  loop: loop,
  slidesPerView: previewtitle,
  centeredSlides: center,
  //loop: true,
  loopFillGroupWithBlank: false,
  spaceBetween: 0,
  pagination : { // 페이징 설정
    el : '.detailPage_img_rolling',
    clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
  }
});

function SetPageNumber(nPageNumber){
  document.getElementById("page_number").innerHTML = nPageNumber;
}

// new Swiper('.h_event_pc', {
//   height: 565,
//   pagination: {
//     el: '.swiper-pagination',
//     clickable: true,
//     renderBullet: function (index, className) {
//       return '<div class="' + className + '"></div>';
//     },
//   },
//   navigation: {
//     nextEl: '.swiper-button-next',
//     prevEl: '.swiper-button-prev',
//   },
// });

// category, sticky
const nav = document.getElementById("nav");
window.addEventListener("scroll", function() {
  if (window.innerWidth > 1200) {
    if (window.scrollY > 67) {
      nav.style.top = '0';
      nav.style.position = ' fixed';
    } else {
      nav.style.top = '67px';
      nav.style.position = ' absolute';
    }
  }
});

// show cart
window.onload = function(){
  // cart appears then hide category
  document.getElementById("cartCheck").addEventListener('change', function () {
    if (this.checked) {
      document.getElementById("Main_category").checked = false;
    }
  });

  if(window.location.hash && window.location.hash === "#cart") {
    if (document.getElementById("cartCheck") !== null) {
      const uGUID = $("input[name=cartuGUID]").val();
      reTotalPrice(uGUID);
      document.getElementById("cartCheck").checked = true;
    }
  }
};

const rec_radios = document.querySelectorAll('[name^=recom]');
const progress_bars = document.getElementsByClassName("quiz_progress_bar");
for (let i = 0; i < rec_radios.length; i++) {
  rec_radios[i].addEventListener('change', function() {
    const index = parseInt(this.name[this.name.length -1]);
    progress_bars[index-1].className += " active";
    document.querySelectorAll(`#Q${index} img`).forEach((img)=> {
      img.style.opacity = 1;
    });
    if (index < 8) {
      const scrollTarget = document.querySelector("#Q" + (index + 1)).offsetTop - (window.innerWidth <1200 ? 103 + 60: 67);
      window.scroll({
        top: scrollTarget,
        behavior: 'smooth'
      });
    }
  });
}
