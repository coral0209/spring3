const foodmainSlider = document.querySelector(".banner-contain");
const foodbnContent = document.querySelectorAll(".banner-contain > .bn-col"); 
const foodNumBtn = document.querySelectorAll(".bn-num > span"); 
const bannerImg = document.querySelectorAll(".bn-inner > figure > img ");
//button
const prevButton = document.querySelector("#bn-perv-btn");
const nextButton = document.querySelector("#bn-next-btn");

let counter = 1;

var mql = window.matchMedia("screen and (max-width: 768px)");

mql.addListener(function(e) {
    if(e.matches) {
        // console.log('모바일 화면 입니다.');
        location.reload();
    } else {
        // console.log('데스크탑 화면 입니다.');
        location.reload();
    }
});


if(window.innerWidth <  991){
    // console.log('moblie');
}

const bnNum = foodbnContent.length;

foodmainSlider.style.width = bnNum * window.innerWidth + 'px';
for(var i=0; i<bannerImg.length;i++){
    bannerImg[i].style.marginLeft = window.innerWidth / 2 * -1 +'px';
}

const bnSize = foodbnContent[0].clientWidth;

foodmainSlider.style.transform = 'translateX(' + (-bnSize * counter ) + 'px)'; 

// infinity 슬라이드 처리
foodmainSlider.addEventListener('transitionend', ()=>{
    if(foodbnContent[counter].id === "lastClon"){
        foodmainSlider.style.transition = "none";
        counter = foodbnContent.length - 2;
        foodmainSlider.style.transform = 'translateX(' + (-bnSize * counter ) + 'px)'; 
    }
    if(foodbnContent[counter].id === "firstClon"){
        foodmainSlider.style.transition = "none";
        counter = foodbnContent.length - counter;
        foodmainSlider.style.transform = 'translateX(' + (-bnSize * counter ) + 'px)'; 
    }
    let num = counter - 1;
    for (var i = 0; i < foodNumBtn.length; i++) {
        foodNumBtn[i].classList.remove('activeBtn')
    }
    foodNumBtn[num].classList.add("activeBtn");
});


// 이전버튼 클릭 처리
prevButton.addEventListener('click',()=>{
    if(counter <= 0) return;
    foodmainSlider.style.transition = "transform 0.4s ease-in-out";
    counter--;
    foodmainSlider.style.transform = 'translateX(' + (-bnSize * counter ) + 'px)'; 
});
// 다음버튼 클릭 처리
nextButton.addEventListener('click',()=>{
    if(counter >= foodbnContent.length - 1) return;
    foodmainSlider.style.transition = "transform 0.4s ease-in-out";
    counter++;
    foodmainSlider.style.transform = 'translateX(' + (-bnSize * counter ) + 'px)'; 
});


foodNumBtn[0].addEventListener('click',()=>{
    foodmainSlider.style.transition = "transform 0.4s ease-in-out";
    counter = 1;
    foodmainSlider.style.transform = 'translateX(' + (-bnSize * counter ) + 'px)'; 
});
foodNumBtn[1].addEventListener('click',()=>{
    foodmainSlider.style.transition = "transform 0.4s ease-in-out";
    counter = 2;
    foodmainSlider.style.transform = 'translateX(' + (-bnSize * counter ) + 'px)'; 
});
foodNumBtn[2].addEventListener('click',()=>{
    foodmainSlider.style.transition = "transform 0.4s ease-in-out";
    counter = 3;
    foodmainSlider.style.transform = 'translateX(' + (-bnSize * counter ) + 'px)'; 
});

