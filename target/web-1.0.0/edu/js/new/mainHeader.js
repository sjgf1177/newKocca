$(function(){
	function checkMobileSize() {
	    var x = $(window).width() + getScrollbarWidth();
	    if (x >= 1200) {
	        return false;
	    } else {
	        return true;
	    }
	}
	
	function getScrollbarWidth() {
	    var outer = document.createElement("div");
	    outer.style.visibility = "hidden";
	    outer.style.width = "100px";
	    outer.style.msOverflowStyle = "scrollbar"; // needed for WinJS apps

	    document.body.appendChild(outer);

	    var widthNoScroll = outer.offsetWidth;
	    // force scrollbars
	    outer.style.overflow = "scroll";

	    // add innerdiv
	    var inner = document.createElement("div");
	    inner.style.width = "100%";
	    outer.appendChild(inner);

	    var widthWithScroll = inner.offsetWidth;

	    // remove divs
	    outer.parentNode.removeChild(outer);

	    return widthNoScroll - widthWithScroll;
	}

	
	$(window).resize(function(){
		isMobileSize = checkMobileSize();
		if(!isMobileSize){
			$("#main_nav").removeClass("show");
			$("#main_nav > ul > li > ul").css({"display":""});
			$("body").css({"position":""});
			$("header").removeClass("active");

		}else{
			$("header").css({"height":"auto"});
			$("nav").removeClass("gnbActive");
			$("header").css({"background":""});
			$(".gnb_menu").css({"display":"inline-block"});
			$(".gnb_close").css({"display":"none"});
		}
	});
	
	/* gnb 메뉴 */
	/*$(".navbar-nav > li").on('mouseenter', function(){
		if(!$("nav.navbar").hasClass("gnbActive") && !checkMobileSize()){
			$('header').stop().animate({"height":"170px"}, 200);
		}
    });
	$(".navbar-nav > li").on('mouseleave', function(){
		if(!$("nav.navbar").hasClass("gnbActive") && !checkMobileSize()){
			$('header').stop().animate({"height":"145px"}, 200);
		}
    });*/
	
	/* gnb 메뉴 focus 이동시 메뉴 영역 확장 */
	/*$(".navbar-nav").on('focusin', function(){
		$('header').stop().animate({"height":"170px"}, 200);
    });
	$(".navbar-nav").off('focusin', function(){
			$('header').stop().animate({"height":"145px"}, 200);
    });*/
	$(".navbar-nav > li > a").on('focus', function(){
		$(this).parent().addClass("active").siblings().removeClass("active");
	});
	
	$(".gnb_menu").on("click", function(){
		$("#main_nav_full").addClass("gnbActive");
		$("header").css({"background":""});
		$(".gnb_menu").css({"display":"none"});
		$(".gnb_close").css({"display":"inline-block"});
		$('.gnb_close').attr({"alt":"GNB 메뉴 닫기"});
		$('.op_bg_box').addClass("active");
		$('body').css({"overflow":"hidden"});
	});
	
	$("#all_search_label").on("click", function(){
		$(this).addClass("active");
		$(".navbar-nav").css({"display":"none"});
		$(".gnb_menu").css({"display":"none"});
		$(".gnb_close").css({"display":"inline-block"});
		$('.gnb_close').attr({"alt":"통합검색 닫기"});
	});
	
	$(".gnb_close").on("click", function(){
		if($("#all_search_label").hasClass("active")){
			$("#all_search_label").removeClass("active");
			$(".navbar-nav").css({"display":"flex"});
			$(".gnb_menu").css({"display":"inline-block"});
			$(".gnb_close").css({"display":"none"});
			$('.gnb_close').attr({"alt":"GNB 메뉴 닫기"});
			$('.op_bg_box').removeClass("active");
			$('body').css({"overflow":"auto"});
		}else{
			$("#main_nav_full").removeClass("gnbActive");
			$("header").css({"background":""});
			$(".gnb_menu").css({"display":"inline-block"});
			$(".gnb_close").css({"display":"none"});
			$('.op_bg_box').removeClass("active");
			$('body').css({"overflow":"auto"});
		}
	});
	
	$("#main_nav > ul > li").on("click", function(){
		if($("#main_nav").hasClass("show")){
			$(this).children("ul").toggle('fast');
		}
	});
	
	$("header .navbar-toggler").on("click", function(){

		if($("header").hasClass("active")){
			$("header").removeClass("active");
			/*$('.op_bg_box').removeClass("active");*/
			$('header').css({"height":"140px"});
			$('#main_nav').css({"display":"none"});
			$(this).css({"background-image": "url(/edu/img/gnb_icon.png)"});

		}else{
			$("header").addClass("active");
			/*$('.op_bg_box').addClass("active");*/
			$('header').css({"height":"100%"});
			$('#main_nav').css({"display":"block"});
			$(this).css({"background-image": "url(/edu/img/gnb_close.png)"});


		}
	});


})