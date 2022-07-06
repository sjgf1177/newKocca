



$(document).ready(function() {

    // 창작자를 위한 추천과정 슬라이드
    var fwocard01 = new Swiper('.fwo_card01 .fwo_card', {
        loot: true
        ,speed : 700
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: 4 // 한번에 보이는 슬라이드 갯수
        ,spaceBetween: 20 // 슬라이드 사이의 간격 px 단위

        //구버전 swiper 방향표
        ,nextButton: '.fwo_card01 .swiper-button-next'
        ,prevButton: '.fwo_card01 .swiper-button-prev'
        ,breakpoints: {
            1280: {
                slidesPerView: 4,
                spaceBetween: 40
            },
            1279: {
                slidesPerView: 3,
                spaceBetween: 30
            },
            640: {
                slidesPerView: 1,
                spaceBetween: 20
            },
        }

    });

    // 나만 빼고 다 수강한 과정 슬라이드
    var fwocard02 = new Swiper('.fwo_card02 .fwo_card', {
        loot: true
        ,speed : 700
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: 4 // 한번에 보이는 슬라이드 갯수
        ,spaceBetween: 20 // 슬라이드 사이의 간격 px 단위

        //구버전 swiper 방향표
        ,nextButton: '.fwo_card02 .swiper-button-next'
        ,prevButton: '.fwo_card02 .swiper-button-prev'
        ,breakpoints: {
            1280: {
                slidesPerView: 4,
                spaceBetween: 40
            },
            1279: {
                slidesPerView: 3,
                spaceBetween: 30
            },
            640: {
                slidesPerView: 1,
                spaceBetween: 20
            },
        }
    });

    // 곧 만나 볼 수 있어요 슬라이드
    var fwocard03 = new Swiper('.fwo_card03 .fwo_card', {
        loot: true
        ,speed : 700
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: 4 // 한번에 보이는 슬라이드 갯수
        ,spaceBetween: 20 // 슬라이드 사이의 간격 px 단위

        //구버전 swiper 방향표
        ,nextButton: '.fwo_card03 .swiper-button-next'
        ,prevButton: '.fwo_card03 .swiper-button-prev'
        ,breakpoints: {
            1280: {
                slidesPerView: 4,
                spaceBetween: 40
            },
            1279: {
                slidesPerView: 3,
                spaceBetween: 30
            },
            640: {
                slidesPerView: 1,
                spaceBetween: 20
            },
        }
    });

    // KOCCA에서 만날 수 있는 특별한 교육 사업 슬라이드
    var threecard01 = new Swiper('.main_study_contents .three_card01', {
        loot: true
        ,speed : 700
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: 3 // 한번에 보이는 슬라이드 갯수
        ,spaceBetween: 20 // 슬라이드 사이의 간격 px 단위

        //구버전 swiper 방향표
        ,nextButton: '.three_card01 .swiper-button-next'
        ,prevButton: '.three_card01 .swiper-button-prev'
        ,breakpoints: {
            1280: {
                slidesPerView: 4,
                spaceBetween: 40
            },
            1279: {
                slidesPerView: 3,
                spaceBetween: 30
            },
            640: {
                slidesPerView: 1,
                spaceBetween: 20
            },
        }
    });

    /*}).resize();*/


    // KOCCA는 창작자 여러분에게 열려 있습니다 슬라이드
    var onecard01 = new Swiper('.main_place_contents .one_card01', {
        loot: true
        ,autoplay : 3000
        ,speed : 700
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: 1 // 한번에 보이는 슬라이드 갯수
        ,spaceBetween: 20 // 슬라이드 사이의 간격 px 단위

    });


    // 서브페이지 필터/닫기
    $('.close_block_btn').click(function () {
        $(".control_board_header .relation_site").css({display: 'none'});
        $(".board_sorting_con .input_search_con").css({display: 'none'});
        $(".control_board_header").css("background-color","#fff");
        $(".close_block_btn").css({display: 'none'});
        $(".filter_btn").css({display: 'block'});

    });

    $('.filter_btn').click(function () {
        $(".control_board_header .relation_site").css({display: 'block'});
        $(".board_sorting_con .input_search_con").css({display: 'block'});
        $(".control_board_header").css("background-color", '#efefef');
        $(".filter_btn").css({display: 'none'});
        $(".close_block_btn").css({display: 'block'});
    });

    //이벤트 투뎁스
    $('.two_tab li').click(function () {
        $('.two_tab li').removeClass('active');
        $('.two_tab li').children().removeAttr('title','현재탭');
        $(this).addClass('active');
        $(this).children().attr('title','현재탭');
    });


});