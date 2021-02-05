var swiper = new Swiper('.mobileSlide', {
  spaceBetween: 30,
  effect: 'fade',
  loop: true,
  autoplay: {
    delay: 4500,
    disableOnInteraction: false,
  },
});
var swiper = new Swiper('.quote', {
  spaceBetween: 30,
  effect: 'fade',
  loop: true,
  autoplay: {
    delay: 3500,
    disableOnInteraction: false,
  },
});
var windowWidth = $( window ).width();
if(windowWidth < 500){
  var preview = 1.4;
  var subpreview = 1.4;
  var center = true;
}else{
  var preview = 4;
  var subpreview = 3;
  var center = false;
}




var swiper = new Swiper('.recent_Damhwa', {
  //slidesPerView: winEa,
  slidesPerView: preview,
  centeredSlides: center,
  spaceBetween: 30,
  pagination: {
    el: '.swiper-pagination',
    clickable: true,
  },
  navigation: {
    nextEl: '.swiper-bn-next',
    prevEl: '.swiper-bn-prev',
  },
});

var swiper = new Swiper('.subscribe_intro', {
  //slidesPerView: winEa,
  slidesPerView: subpreview,
  centeredSlides: center,
  spaceBetween: 30,
  pagination: {
    el: '.swiper-pagination',
    clickable: true,
  },
  navigation: {
    nextEl: '.swiper-bn-next',
    prevEl: '.swiper-bn-prev',
  },
});
