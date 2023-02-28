function onAttrChange(){
    $('.contentBox.swiper-container-horizontal .swiper-slide').attr('aria-hidden', 'true');
    $('.contentBox.swiper-container-horizontal .swiper-slide-active').attr('aria-hidden', 'false');
}

$(function(){

    /* MAIN */
    /*$(".all_search_btn").click(function(){
        var keyword = $("#all_search_keyword").val();
        $("#q2").val(keyword);
        $("[name=frmSearch2]").submit();
    });*/

    function search2(form){
        if(!form.q.value){
            alert("검색어를 입력하세요.");
            $("#q2")[0].focus();
            return false;
        }
        return true;
    }

    //메인배너 슬라이드
    var swiper0 = new Swiper('#main_visual_slide', {
        effect : 'fade',
        fadeEffect: {
            crossFade: true
        },

        autoplay: 6000
        ,loot: true
        ,speed: 700
        ,slidesPerView: 1 // 한번에 보이는 슬라이드 갯수
        ,spaceBetween: 0 // 슬라이드 사이의 간격 px 단위
        ,autoplayDisableOnInteraction: false,
        //pagination: '.swiper_page_all_box .swiper-pagination',
        paginationClickable: true,
        //페이징
        pagination: '.swiper-pagination',
        paginationType: 'fraction'
        //구버전 swiper 방향표
        ,nextButton: '.swiper-button-next'
        ,prevButton: '.swiper-button-prev',
        on: {
            slideChange: function () {
                alert('슬라이드 변경');
            }
        },
    });

    //메인 배너 정지버튼
    $('.main_visual_contents .swiper-button-pause').click(function() {
        swiper0.stopAutoplay();
        swiper00.stopAutoplay();
        $('.main_visual_contents .swiper-button-play').show();
        $('.main_visual_contents .swiper-button-pause').hide();
    });
    //메인 배너 재성버튼
    $('.main_visual_contents .swiper-button-play').click(function() {
        swiper0.startAutoplay();
        swiper00.startAutoplay();
        $('.swiper-button-play').hide();
        $('.swiper-button-pause').show();
    });

    var swiper00 = new Swiper('#mo_main_visual_slide', {
        effect : 'fade', // 페이드 효과 사용
        autoplay: 6000
        ,loot: true
        ,speed : 700
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: 1 // 한번에 보이는 슬라이드 갯수
        ,spaceBetween: 0 // 슬라이드 사이의 간격 px 단위
        ,autoplayDisableOnInteraction: false,
        //pagination: '.swiper_page_all_box .swiper-pagination',
        paginationClickable: true,
        //페이징
        pagination: '.swiper-pagination',
        paginationType: 'fraction'
        //구버전 swiper 방향표
        ,nextButton: '.swiper-button-next'
        ,prevButton: '.swiper-button-prev',
    });



    //메인 아이콘카테고리(방송영상,게임,만애캐,문화일반,인경교일) 슬라이드
    var swiper1 = new Swiper('.main_news_contents .swiper-container', {

        speed : 700
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: 5 // 한번에 보이는 슬라이드 갯수
        ,autoplayDisableOnInteraction: false

        //구버전 swiper 방향표
        ,nextButton: '.swiper-button-next'
        ,prevButton: '.swiper-button-prev'
        ,breakpoints: {
            640: {
                slidesPerView: 3,
                spaceBetween: 20
            },

        }
    });

    //메인 KOCCA 교육 시설 슬라이드
    var swiper2 = new Swiper('.main_place_contents .swiper-container', {

        speed : 300
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: '1' // 한번에 보이는 슬라이드 갯수
        ,keyboardControl: true
        ,spaceBetween: 20

    });


    /*$(".main_slide_banner .swiper-button-pause").click(function(){
    	swiper1.stopAutoplay();
    	$(".main_slide_banner .swiper-button-pause").attr({"disabled":true}).css({"opacity":"0.6"});
    	$(".main_slide_banner .swiper-button-play").attr({"disabled":false}).css({"opacity":"1"});
    });

    $(".main_slide_banner .swiper-button-play").click(function(){
    	swiper1.startAutoplay();
    	$(".main_slide_banner .swiper-button-play").attr({"disabled":true}).css({"opacity":"0.6"});
    	$(".main_slide_banner .swiper-button-pause").attr({"disabled":false}).css({"opacity":"1"});
    });*/


    /*$(".visual_searchBox form input").focusin(function(){
        $(".visual_searchBox form label").css({"opacity":"0"});
    });
    $(".visual_searchBox form input").focusout(function(){
        if($(this).val() == ""){
            $(".visual_searchBox form label").css({"opacity":"1"});
        }
    });
    
    $(".visual_card ul li").each(function(){
        var cardname = $(this).attr('data-cardname');
        $(this).append("<span class='card_name'>"+cardname+"</span>");
    });
    
    
    $(".visual_card > ul > li").click(function(){
        if(!$(this).hasClass("active")){
        	clearInterval(visualSlide);
            
        	$(this).addClass("active");
            $(this).siblings("li").removeClass("active");
            var pos = $(this).index();
            $(".visual_card > ul").stop().animate({"margin-left":pos*-200+"px"},300);
            $(".visual_card_pagination span").eq(pos).addClass("active");
            $(".visual_card_pagination span").eq(pos).siblings("span").removeClass("active");
            
            visualSlideInterval();
        }
    });
    
    $(".visual_card_pagination span").click(function(){
        if(!$(this).hasClass("active")){
        	clearInterval(visualSlide);

            var pos = $(this).index();
            $(".visual_card > ul").stop().animate({"margin-left":pos*-200+"px"},300);
            $(".visual_card > ul > li").eq(pos).addClass("active");
            $(".visual_card > ul > li").eq(pos).siblings("li").removeClass("active");
            $(this).addClass("active");
            $(this).siblings("span").removeClass("active");
            
            visualSlideInterval();
        }
    });
    
    var visualSlide;
    var visualSlideInterval = function() {
	    visualSlide = setInterval(function(){
	        var pos = $(".visual_card > ul > li.active").index();
	        if(pos == 5){
	            $(".visual_card > ul > li").eq(pos).removeClass("active");
	            pos = 0;
	            $(".visual_card > ul > li").eq(pos).addClass("active");
	            $(".visual_card > ul").stop().animate({"margin-left":"0px"});
	            $(".visual_card_pagination span").eq(pos).addClass("active");
	            $(".visual_card_pagination span").eq(pos).siblings("span").removeClass("active");
	        }else{
	            $(".visual_card > ul > li").eq(pos).removeClass("active");
	            $(".visual_card > ul > li").eq(pos+1).addClass("active");    
	            $(".visual_card > ul").stop().animate({"margin-left":(pos+1)*-200+"px"});
	            $(".visual_card_pagination span").eq(pos+1).addClass("active");
	            $(".visual_card_pagination span").eq(pos+1).siblings("span").removeClass("active");
	        }
	    },4000)
    }
    visualSlideInterval();*/

    var swiper2 = new Swiper('.news_slide_banner .swiper-container', {
        pagination: '.news_slide_banner .swiper-pagination'
        ,loop : false
        ,autoplay: 4000
        ,paginationClickable: true
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: 1 // 한번에 보이는 슬라이드 갯수
        ,spaceBetween: 0 // 슬라이드 사이의 간격 px 단위
        ,mousewheelControl: true // 마우스 휠로 슬라이드 움직임
        ,keyboard:{
            enable: true,
            onlyInViewport: false
        }
        ,autoplayDisableOnInteraction: false
        ,paginationBulletRender: function (swiper, index, className) {
            return '<button class="' + className + '" tabindex="0"><span class="ally-hidden">'+(index+1)+'번째 배너로 이동</span></button>';
        },

    });
    // 자동재생 일시정지 시작 버튼
    $('.wrap-autoplay-control .start').on('click',function(){
        swiper2.startAutoplay();
        /*alert("start");*/
        return false;
    })
    $('.wrap-autoplay-control .stop').on('click',function(){
        swiper2.stopAutoplay();
        /*alert("stop");*/
        return false;
    });








    /*  home 서브 메인 슬라이드  */
    $(".visual_arrow.left").on('click', function(){
        visualLeft();
    });
    $(".visual_arrow.right").on('click', function(){
        visualRight();
    });
    var mainVisualAutoPlay = setInterval(function(){visualRight();}, 10000);
    // clearInterval(mainVisualAutoPlay);
    function visualRight(){
        if( isMove ) return;
        else isMove = true;
        //clearInterval(mainVisualAutoPlay);
        var idx = $('[class*="main_visual_00"]').index( $('[class*="main_visual_00"].active') );
        var lastIdx = $('[class*="main_visual_00"]').index( $('[class*="main_visual_00"]:last-child') );
        var prev = null;
        var next = null;
        var curr = $('[class*="main_visual_00"].active');
        if(idx == lastIdx ){
            next = $('[class*="main_visual_00"]')[0];
        }else{
            next = $('[class*="main_visual_00"]')[idx+1];
        }
        curr.css({'left':'0%'});
        $(next).css({'left':'100%'});
        $(prev).css({'left':'-100%'});
        curr.animate({'left':'-100%'}, 500);
        $(next).animate({'left':'0%'}, 500, function(){
            isMove = false;
            //mainVisualAutoPlay = setInterval(visualRight, 3000);
            //clearInterval(mainVisualAutoPlay);
        });

        curr.removeClass('active')
        $(next).addClass('active')
    }
    var isMove = false;
    function visualLeft(){
        if( isMove ) return;
        else isMove = true;
        //clearInterval(mainVisualAutoPlay);
        var idx = $('[class*="main_visual_00"]').index( $('[class*="main_visual_00"].active') );
        var lastIdx = $('[class*="main_visual_00"]').index( $('[class*="main_visual_00"]:last-child') );
        var prev = null;
        var next = null;
        var curr = $('[class*="main_visual_00"].active');
        if(idx == 0 ){
            prev = $('[class*="main_visual_00"]')[lastIdx];
        }else{
            prev = $('[class*="main_visual_00"]')[idx-1];
        }


        curr.css({'left':'0%'});
        $(next).css({'left':'100%'});
        $(prev).css({'left':'-100%'});
        curr.animate({'left':'100%'}, 500);
        $(prev).animate({'left':'0%'}, 500, function(){
            isMove = false;
            // mainVisualAutoPlay = setInterval(visualRight, 3000);
            //clearInterval(mainVisualAutoPlay);
        });


        curr.removeClass('active')
        $(prev).addClass('active')
    }

    /* ------------------------------ */
    //half_banner
    $(".type3_banner li").each(function(){
        var background_image = $(this).find(".banner_box").attr("data-image");
        $(this).find(".banner_box").css({"background-image":"url('"+background_image+"')"});
    });

    //full_banner
    /*$(".full_banner").each(function(){
        var background_image = $(this).attr("data-image");
        $(this).css({"background-image":"url('"+background_image+"')"});
    })*/


    /*//vertical_slide
    var scroll_ele = $(".vertical_slide");
    scroll_ele.scroll(function(){
        if($(this).scrollTop() != 0){
            $(this).find(".top_blur").css({"display":"block"});
        }else if($(this).scrollTop() != $(this).height()){
            $(this).find(".bottom_blur").css({"display":"block"});
        }else if($(this).scrollTop() == 0){
            $(this).find(".top_blur").css({"display":"none"});
        }
    });*/

});