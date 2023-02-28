



$(document).ready(function() {

    // 웹접근성 건너뛰기 기능 제공
    function uiAppendHeader(){
        var uiAppendHeader = '<div id="skip" class="skip">';
        uiAppendHeader += '<a href="#GnbBox">메인메뉴 바로가기</a>';
        uiAppendHeader += '<a href="#ContentBox" class="skipContents">본문 바로가기</a>';
        uiAppendHeader += '<a href="#footer">하단메뉴 바로가기</a>';
        uiAppendHeader += '</div>';
        $('body').prepend(uiAppendHeader);
    }
    uiAppendHeader();

    $('header').attr('id', 'GnbBox');
    $('.contents_section, .sub_contents_wrap').attr('id', 'ContentBox');
    $('.fwo_snail_box > a, .fwo_tit_box > a').attr('tabindex', '-1');


    // 추천 클래스 슬라이드
    var fwocard01 = new Swiper('.fwo_card01 .fwo_card', {
        /*loop: true,*/
        speed : 700
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: 4 // 한번에 보이는 슬라이드 갯수
        ,spaceBetween: 20 // 슬라이드 사이의 간격 px 단위
        ,slidesPerGroup : 1 // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

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
                spaceBetween: 15
            },
        }

    });

    // 인기 클래스 슬라이드
    var fwocard02 = new Swiper('.fwo_card02 .fwo_card', {
        /*loop: true,*/
        speed : 700
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

    // 진행 중인 이벤트 슬라이드
    var fwocard03 = new Swiper('.fwo_card03 .fwo_card', {
        /*loop: true,*/
        speed : 700
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

    var fwocard04 = new Swiper('.fwo_card04 .fwo_card', {
        /*loop: true,*/
        speed : 700
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: 4 // 한번에 보이는 슬라이드 갯수
        ,spaceBetween: 20 // 슬라이드 사이의 간격 px 단위

        //구버전 swiper 방향표
        ,nextButton: '.fwo_card04 .swiper-button-next'
        ,prevButton: '.fwo_card04 .swiper-button-prev'
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

    var fwocard05 = new Swiper('.fwo_card05 .fwo_card', {
        /*loop: true,*/
        speed : 700
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: 4 // 한번에 보이는 슬라이드 갯수
        ,spaceBetween: 20 // 슬라이드 사이의 간격 px 단위

        //구버전 swiper 방향표
        ,nextButton: '.fwo_card05 .swiper-button-next'
        ,prevButton: '.fwo_card05 .swiper-button-prev'
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

    var fwocard06 = new Swiper('.fwo_card06 .fwo_card', {
        /*loop: true,*/
        speed : 700
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: 4 // 한번에 보이는 슬라이드 갯수
        ,spaceBetween: 20 // 슬라이드 사이의 간격 px 단위

        //구버전 swiper 방향표
        ,nextButton: '.fwo_card06 .swiper-button-next'
        ,prevButton: '.fwo_card06 .swiper-button-prev'
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

    var fwocard07 = new Swiper('.fwo_card07 .fwo_card', {
        /*loop: true,*/
        speed : 700
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: 4 // 한번에 보이는 슬라이드 갯수
        ,spaceBetween: 20 // 슬라이드 사이의 간격 px 단위

        //구버전 swiper 방향표
        ,nextButton: '.fwo_card07 .swiper-button-next'
        ,prevButton: '.fwo_card07 .swiper-button-prev'
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


    var fwocard08 = new Swiper('.fwo_card08 .fwo_card', {
        /*loop: true,*/
        speed : 700
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: 4 // 한번에 보이는 슬라이드 갯수
        ,spaceBetween: 20 // 슬라이드 사이의 간격 px 단위

        //구버전 swiper 방향표
        ,nextButton: '.fwo_card08 .swiper-button-next'
        ,prevButton: '.fwo_card08 .swiper-button-prev'
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


    var fwocard09 = new Swiper('.fwo_card09 .fwo_card', {
        /*loop: true,*/
        speed : 700
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: 4 // 한번에 보이는 슬라이드 갯수
        ,spaceBetween: 20 // 슬라이드 사이의 간격 px 단위

        //구버전 swiper 방향표
        ,nextButton: '.fwo_card09 .swiper-button-next'
        ,prevButton: '.fwo_card09 .swiper-button-prev'
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

    var fwocard10 = new Swiper('.fwo_card10 .fwo_card', {
        /*loop: true,*/
        speed : 700
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: 4 // 한번에 보이는 슬라이드 갯수
        ,spaceBetween: 20 // 슬라이드 사이의 간격 px 단위

        //구버전 swiper 방향표
        ,nextButton: '.fwo_card10 .swiper-button-next'
        ,prevButton: '.fwo_card10 .swiper-button-prev'
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

    var fwocard11 = new Swiper('.fwo_card11 .fwo_card', {
        /*loop: true,*/
        speed : 700
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: 4 // 한번에 보이는 슬라이드 갯수
        ,spaceBetween: 20 // 슬라이드 사이의 간격 px 단위

        //구버전 swiper 방향표
        ,nextButton: '.fwo_card11 .swiper-button-next'
        ,prevButton: '.fwo_card11 .swiper-button-prev'
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

    var fwocard12 = new Swiper('.fwo_card12 .fwo_card', {
        /*loop: true,*/
        speed : 700
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: 4 // 한번에 보이는 슬라이드 갯수
        ,spaceBetween: 20 // 슬라이드 사이의 간격 px 단위

        //구버전 swiper 방향표
        ,nextButton: '.fwo_card12 .swiper-button-next'
        ,prevButton: '.fwo_card12 .swiper-button-prev'
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

    var fwocard13 = new Swiper('.fwo_card13 .fwo_card', {
        /*loop: true,*/
        speed : 700
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: 4 // 한번에 보이는 슬라이드 갯수
        ,spaceBetween: 20 // 슬라이드 사이의 간격 px 단위

        //구버전 swiper 방향표
        ,nextButton: '.fwo_card13 .swiper-button-next'
        ,prevButton: '.fwo_card13 .swiper-button-prev'
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


    // KOCCA 교육 사업 슬라이드
    var threecard01 = new Swiper('.main_study_contents .three_card01', {
        /*loop: true,*/
        speed : 700
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

    // new신규 클래스 슬라이드

    var onecard02 = new Swiper('.main_new_contents .one_card01', {
        /*loop: true,*/
        /*autoplay : 3000 */
        speed : 700
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: 1 // 한번에 보이는 슬라이드 갯수
        ,spaceBetween: 20 // 슬라이드 사이의 간격 px 단위
        //구버전 swiper 방향표
        ,nextButton: '.main_new_contents .swiper-button-next'
        ,prevButton: '.main_new_contents .swiper-button-prev'

    });



    // KOCCA교육 시설 슬라이드
    var onecard01 = new Swiper('.main_place_contents .one_card01', {
        /*loop: true,*/
        autoplay : 3000
        ,speed : 700
        ,direction: 'horizontal' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
        ,slidesPerView: 1 // 한번에 보이는 슬라이드 갯수
        ,spaceBetween: 20 // 슬라이드 사이의 간격 px 단위

    });

    //공지사항 배너 정지버튼
    $('.main_place_contents .swiper-button-pause').click(function() {
        onecard01.stopAutoplay();
        $('.main_place_contents .swiper-button-play').show();
        $('.main_place_contents .swiper-button-pause').hide();
    });
    //공지사항 배너 재성버튼
    $('.main_place_contents .swiper-button-play').click(function() {
        onecard01.startAutoplay();
        $('.main_place_contents .swiper-button-play').hide();
        $('.main_place_contents .swiper-button-pause').show();
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


    //콘텐츠커리큘럼 toggle
    $('#main_nav_full li button').click(function () {
        $(this).toggleClass('active');
    });

    //로그인 후 수강, 로그인 전 수강 전체보기 버튼
    $('.all_view_btn_box button').click(function () {
        $(".all-list-wrap").toggleClass('on'); //전체 리스트 보기
        $(".dae-list-box").toggleClass('off'); // 슬라이드 숨기기
        $(".category_list_btn").toggleClass('on'); // 카테고리로 버튼 보기
        $(".all_list_btn").toggleClass('off'); //전체보기 버튼 보기
    });




});