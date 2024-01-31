<%@page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="kr.co.unp.cmm.sec.ram.service.impl.UnpUserDetailsHelper" %>
<%@ page import="kr.co.unp.member.vo.*" %>
<%@ page import="org.springframework.util.StringUtils" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="kr.co.unp.mpm.vo.MenuManageVO" %>
<%@ page import="kr.co.unp.mpm.service.MasterMenuManager" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.unp.co.kr/util" prefix="util" %>
<%@ page import="kr.co.unp.main.service.MainService" %>
<%@ page import="kr.co.unp.util.ZValue" %>

<c:set var='siteName' value='${paramVO.siteName}'/>
<%
    UsersVO user = UnpUserDetailsHelper.getAuthenticatedUser();
    pageContext.setAttribute("userVO", user);

    String menuNo = request.getParameter("menuNo");
    String debug = request.getParameter("debug");

    org.springframework.context.ApplicationContext context2 = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(getServletContext());
    MainService mainService = (MainService) context2.getBean("mainService");
    ZValue zParam = new ZValue();

    if(user.getUserIdx() > 0) {
        zParam.put("userid", user.getUserId());
        zParam.put("grcode", "N000001");
        zParam.put("type", "random");
        List<ZValue> curriculumList = mainService.getCurriculumList(zParam);

        // 랜덤 추천 정규과정 목록(20개)
        int currCnt = mainService.getCurriculumChkCnt(zParam);
        zParam.put("currCnt", currCnt);

        List<ZValue> eduSubjList = mainService.getEduSubjList(zParam);

        pageContext.setAttribute("curriculumList", curriculumList);
        pageContext.setAttribute("eduSubjList", eduSubjList);
    }else{
        zParam.put("grcode", "N000001");
        zParam.put("type", "new");

        // 정규과정 신규 목록(20개)
        List<ZValue> eduSubjList = mainService.getEduSubjList(zParam);
        pageContext.setAttribute("eduSubjList", eduSubjList);
    }

    // 랜덤 키워드 조회
    String randomKeyword = mainService.getRandomKeyword(zParam);
    pageContext.setAttribute("randomKeyword", randomKeyword);

//if( "1".equals(debug) ){

    if (StringUtils.hasText(menuNo)) {
        org.springframework.context.ApplicationContext context = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(getServletContext());
        MasterMenuManager masterMenuManagerService = (MasterMenuManager) context.getBean("masterMenuManagerService");

//HashMap<String, List<MenuManageVO>> menuMap = (HashMap<String, List<MenuManageVO>>)application.getAttribute("menuAll5");
        /* testbed20170830 */
        String siteName = (String) pageContext.getAttribute("siteName") != null ? (String) pageContext.getAttribute("siteName") : "";
        HashMap<String, List<MenuManageVO>> menuMap = new HashMap<String, List<MenuManageVO>>();
        HashMap<String, List<MenuManageVO>> eduMenuMap = (HashMap<String, List<MenuManageVO>>) application.getAttribute("menuAll5");
        HashMap<String, List<MenuManageVO>> testbedMenuMap = (HashMap<String, List<MenuManageVO>>) application.getAttribute("menuAll7");
        menuMap.putAll(eduMenuMap);
        if ("testbed".equals(siteName))
            menuMap.putAll(testbedMenuMap);
        /* //testbed20170830 */

        MenuManageVO currentVo = masterMenuManagerService.getCurrentMenu(menuMap, Integer.parseInt(menuNo));
        pageContext.setAttribute("currMenu", currentVo);

        String position = currentVo.getPosition();
        int depth01 = Integer.parseInt(position.substring(0, 2)) - 1;
        int depth02 = Integer.parseInt(position.substring(2, 4)) - 1;
        int depth03 = Integer.parseInt(position.substring(4, 6)) - 1;
        int depth04 = Integer.parseInt(position.substring(6, 8)) - 1;
        int depth05 = Integer.parseInt(position.substring(8, 10)) - 1;
        pageContext.setAttribute("depth01", depth01);
        pageContext.setAttribute("depth02", depth02);
        pageContext.setAttribute("depth03", depth03);
        pageContext.setAttribute("depth04", depth04);
        pageContext.setAttribute("depth05", depth05);
    }
%>

<%@include file="/WEB-INF/jsp/edu/inc/incMainFn.jsp" %>

<jsp:useBean id="todayNow" class="java.util.Date"/>
<fmt:formatDate value="${todayNow}" var="today" pattern="yyyy-MM-dd"/>

<c:set var="userVO" value="${userVO }" scope="request"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>에듀코카 - 누구나 쉽게 배우는 K콘텐츠</title>
    <meta name="robots" content="index,follow" />
    <meta name="subject" content="에듀코카 - 누구나 쉽게 배우는 K콘텐츠" />
    <meta name="title" content="에듀코카 - 누구나 쉽게 배우는 K콘텐츠" />
    <meta name="author" content="에듀코카">
    <meta name="description" content="한국콘텐츠진흥원이 운영하는 온라인 교육 사이트. 방송/영상, 게임, 음악/공연, 웹툰 등 콘텐츠산업 관련 교육콘텐츠 무료 제공." />
    <meta name="keywords" content="에듀코카,한국콘텐츠진흥원,에듀KOCCA,EDU코카,콘텐츠진흥원,edukocca,EDUKOCCA,한콘,K콘텐츠,사이버콘텐츠아카데미,온라인교육,이러닝,교육콘텐츠,방송교육,게임교육,음악교육,공연교육,웹툰교육" />

    <meta property="og:type" content="website" />
    <meta property="og:site_name" content="에듀코카" />
    <meta property="og:title" content="에듀코카" />
    <meta property="og:description" content="한국콘텐츠진흥원이 운영하는 온라인 교육 사이트. 방송/영상, 게임, 음악/공연, 웹툰 등 콘텐츠산업 관련 교육콘텐츠 무료 제공." />
    <meta property="og:image" content="https://edu.kocca.kr/edu/images/renew2022/og_edukocca.jpg" />
    <meta property="og:url" content="https://edu.kocca.kr" />

    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1, maximum-scale=3, minimum-scale=1"/>
    <link rel="apple-touch-icon" sizes="57x57" href="/favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon/favicon-16x16.png">
    <link rel="manifest" href="/favicon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/favicon/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">

    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
    <link rel="stylesheet" type="text/css" href="/edu/css/new/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/edu/css/animate.min.css"/>
    <link rel="stylesheet" type="text/css" href="/edu/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/edu/css/layout.css"/>
    <link rel="stylesheet" href="/edu/js/bm/swiper/swiper.min.css"/>
    <%--<link rel="stylesheet" href="/edu/css/bm/animate.min.css"/>--%>
    <link rel="stylesheet" href="/edu/css/bm/bootstrap.reset.css"/>
    <link rel="stylesheet" href="/edu/css/bm/common_prev.css"/>
    <link rel="stylesheet" href="/edu/css/bm/flaticon.css"/>
    <link rel="stylesheet" href="/edu/css/bm/ie.css"/>
    <link rel="stylesheet" href="/edu/css/bm/layout.css"/>
    <link rel="stylesheet" href="/edu/css/bm/portfolio.css"/>
    <link rel="stylesheet" href="/edu/css/bm/search.css"/>
    <link rel="stylesheet" href="/edu/css/bm/sub.css"/>
    <link rel="stylesheet" href="/edu/css/bm/submain.css"/>
    <link rel="stylesheet" href="/edu/css/bm/common.css">
    <link rel="stylesheet" href="/edu/css/bm/wevenResponsive.css"/>
    <link rel="stylesheet" href="/edu/css/bm/main.css"/>
    <link rel="stylesheet" type="text/css" href="/edu/css/new/header.css"/>
    <link rel="stylesheet" type="text/css" href="/edu/css/new/css.css"/>
    <link rel="stylesheet" type="text/css" href="/edu/css/new/footer.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <script type="text/javascript" src="/edu/js/new/jquery-ui/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/js/jquery.carouFredSel-6.2.1-packed.js"></script>
    <script type="text/javascript" src="/edu/js/common.js"></script>
    <script type="text/javascript"> subMenuOpenIng = true; </script>

    <!-- Slider -->
    <script type="text/javascript" src="/js/jquery.sticky.js"></script>
    <script type="text/javascript" src="/js/jquery.scrollTo.min.js"></script>
    <script type="text/javascript" src="/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="/js/jquery.appear.js"></script>
    <script type="text/javascript" src="/js/modernizr.min.js"></script>
    <script type="text/javascript" src="/js/ssl.js"></script>
    <script type="text/javascript" src="/edu/js/bm/swiper/swiper.min.js"></script>
    <script type="text/javascript" src="/edu/js/bm/rollingEvent.js"></script>

    <!-- Bootstrap JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="/edu/js/new/jquery-ui/jquery-ui-1.11.4/jquery-ui.min.js"></script>
    <script src="/edu/js/new/popper.min.js"></script>
    <script src="/edu/js/new/bootstrap/bootstrap.min.js"></script>

    <!-- 현재 메인 스크립트 -->
    <script type="text/javascript" src="/edu/js/new/mainHeader.js"></script>
    <script type="text/javascript" src="/edu/js/new/js.js"></script>

    <!-- renew2022 CSS start -->
    <%--<link rel="stylesheet" href="/edu/css/renew2022/assets/plugins/animation/css/animate.min.css">--%>
    <link rel="stylesheet" href="/edu/css/renew2022/assets/css/style.css">
    <link rel="stylesheet" href="/edu/css/renew2022/renew.css">
    <link rel="stylesheet" href="/edu/css/renew2022/AOS/aos.css">

    <!-- renew2022 CSS end -->

    <!-- renew2022 JavaScript start -->
    <script src="/edu/css/renew2022/renew.js"></script>
    <script src="/edu/css/renew2022/AOS/aos.js"></script>

    <!-- Required Js -->
    <script src="/edu/css/renew2022/assets/js/vendor-all.min.js"></script>
    <script src="/edu/css/renew2022/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="/edu/css/renew2022/assets/js/pcoded.min.js"></script>

    <!-- sweet alert Js -->
    <script src="/edu/css/renew2022/assets/plugins/sweetalert/js/sweetalert.min.js"></script>
    <script src="/edu/css/renew2022/assets/js/pages/ac-alert.js"></script>

    <!-- 챗봇js-->
    <script id="happytalkSDK" src="https://design.happytalkio.com/sdk/happytalk.chat.v2.min.js"></script>

    <!-- renew2022 JavaScript end -->

    <!-- 사이트 연관채널 등록 SEO -->
    <script type="application/ld+json">
        {
            "@context": "http://schema.org",
            "@type": "Person",
            "name": "에듀코카 - 누구나 쉽게 배우는 K콘텐츠",
            "url": "https://edu.kocca.kr",
            "sameAs": [
                "https://www.facebook.com/edukocca",
                "https://twitter.com/edukocca",
                "https://blog.naver.com/edukocca",
                "https://www.instagram.com/edu.kocca",
                "https://youtube.com/@edukocca"
            ]
        }
    </script>
</head>

<body>
<script type="text/javascript">

    // 레이어 팝업 열기
    function popupOpen(popID) {

        var showLength = $('#' + popID).siblings('[class^="layer_"]:visible').length;

        if (showLength > 0) {
            $('.bg_layer').css({'z-index': 1000 + (showLength + 1)});
            $('#' + popID).css({ 'z-index': 1001 + (showLength + 2) }).fadeIn(200);
        } else {
            $('.bg_layer').css({'z-index': 1000}).fadeIn(200);
            $('#' + popID).fadeIn(200);
        }
    };


    // 레이어 팝업 닫기
    function popupClose(popID) {

        var showLength = $('#' + popID).siblings('[class^="layer_"]:visible').length;

        $('#' + popID).fadeOut(200);

        if (showLength == 0) {
            $('.bg_layer').fadeOut(200).css({ 'z-index': 1000 });

        } else {
            $('.bg_layer').css({ 'z-index': 1000 + (showLength - 2) });
        }

    };

    function search2(form) {
        if (!form.q.value) {
            alert("검색어를 입력하세요.");
            $("#q2")[0].focus();

            return false;
        }

        return true;
    }

    $(function () {
        $("#empmnForm").submit(function () {
            $("#keyword").val(encodeURIComponent($("#keywordStr").val()));
        });

        $("#headerPopupContainer").bind("click", function (evt) {
            if (evt.target == $("#headerPopupContainer")[0]) {
                location.href = "https://edu.kocca.kr/micro/micMain.do";
            }
        });

        if (getCookie("divpop1") == "Y") {
            $("#headerPopupContainer").remove();
        }
    });

    $('.adClose').click(function (event) {
        $('.ad').slideToggle()
        $(this).toggleClass('off');
    });

    function closeTopPopup(key) {
        if ($("#todaycloseyn").prop("checked")) {
            setCookie('divpop' + key, 'Y', 1);
        }
        $("#headerPopupContainer").remove();
    }

    function setCookie(name, value, expiredays) {
        var todayDate = new Date();
        todayDate.setDate(todayDate.getDate() + expiredays);
        document.cookie = name + '=' + escape(value) + '; path=/; expires=' + todayDate.toGMTString() + ';'
    }

    function getCookie(name) {
        var obj = name + "=";
        var x = 0;
        while (x <= document.cookie.length) {
            var y = (x + obj.length);
            if (document.cookie.substring(x, y) == obj) {
                if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
                    endOfCookie = document.cookie.length;
                return unescape(document.cookie.substring(y, endOfCookie));
            }
            x = document.cookie.indexOf(" ", x) + 1;
            if (x == 0) break;
        }

        return "";
    }

    function logoutSSO() {
        $.get("/${paramVO.siteName}/member/logout.json", function (data) {
            var retUrl = "${ssoDomain}/sso/member/logoutSSO.do?service=${paramVO.siteName}";
            location.href = retUrl;
        }, "json");
        return false;
    }

    $(function () {
        $(".logoutBtn").click(function () {
            logoutSSO();

            return false;
        });
    });

    function fnCmdGoldSearchList(gubun){
        if(gubun){
            $("#gubun").val(gubun == "ALL" ? "" : gubun);
        }

        $("#pageIndex").val("1");
        $("#pGubun1").val(gubun);
        $("#p_type").val(gubun);
        $("#p_sort").val("N");

        $("#frm").attr({
            action:"/edu/onlineEdu/openLecture/list.do?menuNo=500085",
            method:"post",
            target:"_self"
        });
        $("#frm").submit();
    }

    //과정 조회(정규)
    function fnCmdSubjSearchList(gubun1, gubun2, gubun3, ordersnm, orders) {
        $("#pGubun1").val(gubun1);
        $("#pageIndex").val("1");
        $("#p_sort").val("N");

        $("#frm").attr({
            action: "/edu/onlineEdu/realm/list.do?menuNo=500027",
            method: "post",
            target: "_self"
        });
        $("#frm").submit();
    }

    function fnManualDownLoad() {
        if (confirm("이용자 매뉴얼을 다운로드하시겠습니까?")) {
            window.open("https://edu.kocca.kr/upload/homepage/eduKocca_manual.pdf");
        }
    }

    //과정 상세화면
    function fnSubjViewPage(subj, subjnm, isonoff, scupperclass, uclassnm, year, subjseq) {
        $("#p_subj").val(subj);
        $("#p_subjnm").val(subjnm);
        $("#p_isonoff").val(isonoff);
        $("#p_scupperclass").val(scupperclass);
        $("#p_uclassnm").val(uclassnm);
        $("#p_year").val(year);
        $("#p_subjseq").val(subjseq);

        $("#s_subj").val(subj);
        $("#s_year").val(year);
        $("#s_subjseq").val(subjseq);

        $("#frm").attr({
            action: "/edu/onlineEdu/realm/view.do?menuNo=500027&p_subj=" + subj + "&p_year=" + year + "&p_subjseq=" + subjseq,
            method: "post",
            target: "_self"
        });
        $("#frm").submit();
    }

    // 콘텐츠커리큘럼 저장
    function fnSaveCurriculum(cd1, cd2, chk) {
        $.ajax({
            type : "post",
            url:"/edu/onlineEdu/realm/regContentCurriculum.json",
            data : {
                cd1 : cd1,
                cd2 : cd2,
                chk : chk,
                userId : '${userVO.userId}'
            },
            success:function(data){
                if(data.result < 1){
                    alert(data.system_msg);
                }
            },error:function(xhr,status,error){
                alert('에러' + xhr.status);
            }
        });
    }

    function fnGoEvent(type) {
        document.eFrm.op3.value = type;
        document.eFrm.action = "/edu/bbs/B0000048/list.do?menuNo=500203";
        document.eFrm.submit();
    }

    <!-- 챗봇 Js start -->
    var ht = new Happytalk({
        siteId: '5000100237',
        siteName: '한국콘텐츠진흥원',
        categoryId: '146368',
        divisionId: '146369',
    });
    <!-- 챗봇 Js end -->

    //애니메이션 라이브러리 불러오기
    AOS.init();
</script>

<!-- html 작업본-->
<!-- <ul class="skip"> -->
<!-- 	<li><a href="#content" class="skipContents">본문내용 바로가기</a></li> -->
<!-- 	<li><a href="#gnb">주메뉴 바로가기</a></li> -->
<!-- </ul> -->

<form id="frm" name="frm" action="/edu/onlineEdu/realm/list.do?menuNo=500027" method="post" class="main_online_category">
    <input type="hidden" name="pGubun1" id="pGubun1" value="">
    <input type="hidden" name="pGubun2" id="pGubun2" value="">
    <input type="hidden" name="pGubun3" id="pGubun3" value="">
    <input type="hidden" name="p_ordersnm" id="p_ordersnm" value="ldate">
    <input type="hidden" name="p_orders" id="p_orders" value="desc">
    <input type="hidden" name="pageIndex" id="pageIndex" value="">

    <input type="hidden" name="p_subj" id="p_subj" value=""/>
    <input type="hidden" name="p_subjnm" id="p_subjnm" value=""/>
    <input type="hidden" name="p_isonoff" id="p_isonoff" value=""/>
    <input type="hidden" name="p_scupperclass" id="p_scupperclass" value=""/>
    <input type="hidden" name="p_uclassnm" id="p_uclassnm" value=""/>
    <input type="hidden" name="p_year" id="p_year" value=""/>
    <input type="hidden" name="p_subjseq" id="p_subjseq" value=""/>
    <input type="hidden" name="s_subj" id="s_subj" value=""/>
    <input type="hidden" name="s_year" id="s_year" value=""/>
    <input type="hidden" name="s_subjseq" id="s_subjseq" value=""/>
    <input type="hidden" name="p_type" id="p_type" value="">
    <input type="hidden" name="p_sort" id="p_sort" value="">
</form>

<form id="eFrm" name="eFrm" method="post">
    <input type="hidden" id="op3" name="op3" value="">
</form>

<div id="wrap" class="over-hidden">
    <!-- header start -->
    <header>
        <div class="container h-100">
            <nav class="navbar navbar-expand-xl">
                <a href="/edu/main/main.do" class="navbar-brand" title="콘텐츠인재캠퍼스 에듀코카 로고 - 콘텐츠인재캠퍼스 메인으로 이동">
                    <img src="/edu/new_image/main/logo.png" alt="콘텐츠인재캠퍼스 에듀코카 로고 - 콘텐츠인재캠퍼스 메인으로 이동">
                </a>

                <!-- 모바일 햄버거 start -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main_nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!-- 모바일 햄버거 end -->

                <div class="nav_search_box">
                    <form name="frmSearch2" method="post" action="/edu/search/list.do?menuNo=500079" onsubmit="return search2(this);">
                        <input type="text" class="q2" name="q" id="q2" placeholder='"${randomKeyword}" 검색해 보세요.' title='"${randomKeyword}" 검색해 보세요.'>
                        <button class="nav_search_btn" title="검색하기"></button>
                    </form>
                </div>

                <!-- nav start -->
                <div class="collapse navbar-collapse" id="main_nav">
                    <!-- 모바일 로그인/회원가입 start -->
                    <!-- 로그인 후-->
                    <sec:authorize ifAnyGranted="ROLE_USER">
                        <div class="nav_my_box mo">
                            <input type="image" src="/edu/images/renew2022/all_menu_white02.png" class="gnb_menu" alt="추천 클래스 설정" title="추천 클래스 설정" style="padding:0;">
                            <a href="/edu/member/logout.do" class="ico4 logoutBtn" title="로그아웃" style="font-size: 18px; color: #fff; margin-left: 15px;">로그아웃</a>
                        </div>
                    </sec:authorize>

                    <!-- 로그인 전-->
                    <sec:authorize ifNotGranted="ROLE_USER">
                        <c:url var="loginUrl" value="/edu/member/forLogin.do">
                            <c:param name="menuNo" value="500077"/>
                            <c:param name="_targetUrl" value="${_targetUrl}"/>
                        </c:url>
                        <span class="login_out_box mo">
								<span class="show vm fontsize14 header_util_item">
									<a href="/edu/member/forLogin.do?menuNo=500077" class="ico1" title="로그인">로그인</a>
								</span>
								<span class="show vm fontsize14 header_util_item">
									<a href="/edu/member/join02.do?menuNo=500076" class="ico2" title="회원가입">회원가입</a>
								</span>
							</span>
                    </sec:authorize>
                    <!-- 모바일 로그인/회원가입 end -->

                    <ul class="navbar-nav">
                        <!-- nav 카테고리 one-daps start -->
                        <li>
                            <a href="/edu/onlineEdu/themeLecture/list.do?menuNo=500157">카테고리</a>
                            <!-- nav 카테고리 two-daps start -->
                            <ul>
                                <!-- li태그에 class명 "new"가 붙으면 N아이콘이 생김.. -->
                                <c:set var='now_dt' value='${today}'/>
                                <c:set var='chk_dt' value='2023-11-30'/>
                                <fmt:parseDate value="${now_dt}" var="pd_now_dt" pattern="yyyy-MM-dd"/>
                                <fmt:parseNumber value="${pd_now_dt.time / (1000*60*60*24)}" integerOnly="true" var="pn_now_dt"></fmt:parseNumber>
                                <fmt:parseDate value="${chk_dt}" var="pd_chk_dt" pattern="yyyy-MM-dd"/>
                                <fmt:parseNumber value="${pd_chk_dt.time / (1000*60*60*24)}" integerOnly="true" var="pn_chk_dt"></fmt:parseNumber>

                                <c:choose>
                                    <c:when test='${ (pn_chk_dt - pn_now_dt) >= 0 }'>
                                        <li class="new"><a href="/edu/onlineEdu/themeLecture/list.do?menuNo=500157">테마과정</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="new"><a href="/edu/onlineEdu/themeLecture/list.do?menuNo=500157">테마과정</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <li><a href="javascript:void(0);" onclick="fnCmdGoldSearchList('B0'); return false;">방송영상</a></li>
                                <li><a href="javascript:void(0);" onclick="fnCmdGoldSearchList('G0'); return false;">게임</a></li>
                                <li><a href="javascript:void(0);" onclick="fnCmdGoldSearchList('K0'); return false;">만화/애니/캐릭터</a></li>
                                <li><a href="javascript:void(0);" onclick="fnCmdGoldSearchList('M0'); return false;">음악/공연</a></li>
                                <li><a href="javascript:void(0);" onclick="fnCmdGoldSearchList('S0'); return false;">인문교양</a></li>
                            </ul>
                            <!-- nav 카테고리 two-daps end -->
                        </li>
                        <!-- nav 카테고리 one-daps end -->

                        <!-- nav 이벤트 one-daps start -->
                        <li>
                            <a href="/edu/bbs/B0000048/list.do?menuNo=500205">참여마당</a>
                            <!-- nav 이벤트 two-daps start -->
                            <ul>
                                <li><a href="/edu/bbs/B0000011/list.do?menuNo=500008">공지사항</a></li>
                                <li><a href="javascript:void(0);" onclick="fnGoEvent('1')">에듀코카 이벤트</a></li>
                                <li><a href="javascript:void(0);" onclick="fnGoEvent('2')">교육신청</a></li>
                                <li><a href="javascript:void(0);" onclick="fnGoEvent('3')">구인/공모</a></li>
                                <li><a href="javascript:void(0);" onclick="fnGoEvent('4')">종료이벤트</a></li>
                            </ul>
                            <!-- nav 이벤트 two-daps end -->
                        </li>
                        <!-- nav 이벤트 one-daps end -->

                        <!-- nav 사업안내 one-daps start -->
                        <li>
                            <a href="/edu/dream/mainRsltManage/list.do?menuNo=500040">사업안내</a>
                            <!-- nav 이벤트 two-daps start -->
                            <ul>
                                <li><a href="/edu/progrm/master/list.do?prgSe=01&amp;prgCl=12&amp;menuNo=500216">콘텐츠스텝업</a></li>
                                <%--<li><a href="/edu/main/contents.do?menuNo=500263">AI콘텐츠창작</a></li>
                                <li><a href="/edu/main/contents.do?menuNo=500110">실감콘텐츠창작</a></li>--%>
                                <li><a href="/edu/progrm/master/list.do?prgSe=01&prgCl=13&menuNo=500215">콘텐츠인사이트</a></li>
                                <li><a href="/edu/dream/mainRsltManage/list.do?menuNo=500040">창의인재동반</a></li>
                                <%--<li><a href="/edu/main/contents.do?menuNo=500213">콘텐츠임팩트</a></li>--%>
                                <li><a href="/edu/main/contents.do?menuNo=500179">콘텐츠원캠퍼스</a></li>
                                <%--<li>
                                    <!-- 현url 에듀코카이야기에서 에듀코카페이지로 변경해야함-->
                                    <a href="/edu/bbs/B0000023/list.do?menuNo=500206">
                                        에듀코카
                                    </a>
                                </li>
                                <li>
                                    <a href="/edu/archiveUser/list.do?menuNo=500226&amp;workField=1">
                                        주요성과
                                    </a>
                                </li>--%>
                                <li><a href="https://www.ncakocca.kr/" target="_blank">뉴콘텐츠아카데미</a></li>
                            </ul>
                            <!-- nav 사업안내 two-daps end -->
                        </li>
                        <!-- nav 사업안내 one-daps end -->

                        <!-- nav 시설안내 one-daps start -->
                        <li>
                            <a href="/testbed/main/contents.do?menuNo=700133">시설안내</a>
                            <!-- nav 시설안내 two-daps start -->
                            <ul>
                                <li><a href="/testbed/main/main.do?menuNo=500108">콘텐츠문화광장</a></li>
                                <li><a href="/testbed/main/contents.do?menuNo=700133">콘텐츠인재캠퍼스</a></li>
                            </ul>
                            <!-- nav 시설안내 two-daps end -->
                        </li>
                        <!-- nav 시설안내 one-daps end -->

                        <sec:authorize ifAnyGranted="ROLE_USER">
                            <!-- 학습지원 모바일 one-daps start -->
                            <li class="nav_support_box mo">
                                <a href="/testbed/main/main.do?menuNo=500108">학습지원</a>
                                <!-- 학습지원 two-daps start -->
                                <ul>
                                    <%--<li><a href="/edu/main/contents.do?menuNo=500033" title="지원서비스">지원서비스</a></li>--%>
                                    <li><a href="/edu/bbs/B0000011/list.do?menuNo=500008" title="공지사항">공지사항</a></li>
                                        <%--<li><a href="/edu/bbs/B0000076/list.do?menuNo=500221" title="함께:톡톡">함께:톡톡</a></li>
                                        <li><a href="/edu/bbs/B0000046/list.do?menuNo=500073" title="FAQ">FAQ</a></li>
                                        <li><a href="/edu/main/contents.do?menuNo=500005" title="기업맞춤교육지원">기업맞춤교육지원</a></li>--%>
                                </ul>
                                <!-- nav 학습지원 two-daps end -->
                            </li>
                            <!-- 학습지원 모바일 one-daps end -->

                            <!-- 마이페이지 모바일 one-daps start -->
                            <li class="nav_support_box mo">
                                <a href="/edu/onlineEdu/mylctrum/list.do?menuNo=500061">마이페이지</a>
                                <!-- 마이페이지 모바일 two-daps start -->
                                <ul>
                                    <li><a href="/edu/userMember/forUpdate.do?menuNo=500056" title="회원정보 수정">회원정보 수정</a></li>
                                    <li><a href="/edu/userMember/simpleLogin.do?menuNo=500058" title="간편로그인 설정">간편로그인 설정</a></li>
                                        <%--<li><a href="/edu/job/empymnCnsl/empymnCnslListMypage.do?menuNo=500059" title="1:1컨설팅내역">1:1컨설팅내역</a></li>--%>
                                    <li><a href="/edu/onlineEdu/mylctrum/listLessonHistory.do?menuNo=500099" title="수료증 출력">수료증 출력</a></li>
                                    <li><a href="/edu/progrm/applcnt/listMypage.do?menuNo=500064" title="프로그램 신청/접수">프로그램 신청/접수</a></li>
                                    <li><a href="/edu/bbs/B0000076/listMy.do?menuNo=500201" title="나의 문의내역">나의 문의내역</a></li>
                                </ul>
                                <!-- 마이페이지 모바일 two-daps end -->
                            </li>
                            <!-- 마이페이지 모바일 one-daps end -->
                        </sec:authorize>
                    </ul>
                </div>
                <div class="ml-auto searchCon">
                    <!-- 로그인 후-->
                    <sec:authorize ifAnyGranted="ROLE_USER">
                        <div class="nav_support_box">
                            <a href="/edu/bbs/B0000011/list.do?menuNo=500008" title="공지사항">
                                <img src="/edu/images/renew2022/ico_FAQ_white.png" alt="학습지원">
                            </a>
                            <ul>
                                <%--<li><a href="/edu/main/contents.do?menuNo=500033" title="지원서비스">지원서비스</a></li>--%>
                                <li><a href="/edu/bbs/B0000011/list.do?menuNo=500008" title="공지사항">공지사항</a></li>
                                    <%--<li><a href="/edu/bbs/B0000076/list.do?menuNo=500221" title="함께:톡톡">함께:톡톡</a></li>
                                    <li><a href="/edu/bbs/B0000046/list.do?menuNo=500073" title="FAQ">FAQ</a></li>
                                    <li><a href="/edu/main/contents.do?menuNo=500005" title="기업맞춤교육지원">기업맞춤교육지원</a></li>--%>
                            </ul>
                        </div>
                        <div class="nav_my_box pc">
                            <a href="/edu/onlineEdu/mylctrum/list.do?menuNo=500061">
                                <img src="/edu/images/renew2022/my.png" alt="마이페이지">
                            </a>
                            <ul>
                                <li id="myPageMenu"><a href="/edu/onlineEdu/mylctrum/list.do?menuNo=500061" title="마이페이지">마이페이지</a></li>
                                <li><a href="/edu/userMember/forUpdate.do?menuNo=500056" title="회원정보 수정">회원정보 수정</a></li>
                                <li><a href="/edu/userMember/simpleLogin.do?menuNo=500058" title="간편로그인 설정">간편로그인 설정</a></li>
                                    <%--<li><a href="/edu/job/empymnCnsl/empymnCnslListMypage.do?menuNo=500059" title="1:1컨설팅내역">1:1컨설팅내역</a></li>--%>
                                <li><a href="/edu/onlineEdu/mylctrum/listLessonHistory.do?menuNo=500099" title="수료증 출력">수료증 출력</a></li>
                                <li><a href="/edu/progrm/applcnt/listMypage.do?menuNo=500064" title="프로그램 신청/접수">프로그램 신청/접수</a></li>
                                <li><a href="/edu/bbs/B0000076/listMy.do?menuNo=500201" title="나의 문의내역">나의 문의내역</a></li>
                                <li><a href="/edu/member/logout.do" class="ico4 logoutBtn" title="로그아웃">로그아웃</a></li>
                            </ul>
                        </div>
                        <input type="image" src="/edu/images/renew2022/all_menu_white02.png" class="gnb_menu" alt="추천 클래스 설정" title="추천 클래스 설정" style="padding:0;">
                    </sec:authorize>

                    <!-- 로그인 전-->
                    <sec:authorize ifNotGranted="ROLE_USER">
                        <c:url var="loginUrl" value="/edu/member/forLogin.do">
                            <c:param name="menuNo" value="500077"/>
                            <c:param name="_targetUrl" value="${_targetUrl}"/>
                        </c:url>
                        <span class="login_out_box">
								<span class="show vm fontsize14 header_util_item">
									<a href="/edu/member/forLogin.do?menuNo=500077" class="ico1" title="로그인">로그인</a>
								</span>
								<span class="show vm fontsize14 header_util_item">
									<a href="/edu/member/join02.do?menuNo=500076" class="ico2" title="회원가입">회원가입</a>
								</span>
							</span>
                    </sec:authorize>
                </div>

                <c:if test="${fn:length(curriculumList) > 0}">
                    <!-- pc 햄버거 버튼 눌렀을때 start-->
                    <div class="collapse navbar-collapse" id="main_nav_full">
                        <div class="cy_navbar-nav">
                            <a href="/edu/main/main.do" class="navbar-brand" title="콘텐츠인재캠퍼스 에듀코카 로고 - 콘텐츠인재캠퍼스 메인으로 이동">
                                <img src="/edu/new_image/main/logo.png" alt="콘텐츠인재캠퍼스 에듀코카 로고 - 콘텐츠인재캠퍼스 메인으로 이동">
                            </a>
                            <input type="image" src="/edu/img/gnb_close.png" class="gnb_close" alt="추천 클래스 설정 닫기" style="padding:0;">
                            <h2>추천 클래스 설정<span class="pc cy_list_txt">아래 관심분야를 <b>선택</b>하시면 추천 클래스에서 <b>맞춤과정</b>을 <b>추천</b>해 드립니다.(다수선택 가능)</span></h2>
                            <div class="cy_contents_box">
                                <p class="mo cy_list_txt">아래 관심분야를 <b>선택</b>하시면 추천 클래스에서 <b>맞춤과정</b>을 <b>추천</b>해 드립니다.(다수선택 가능)</p>
                                <c:set var="contentType" value=""/>
                                <c:forEach items="${curriculumList }" var="result" varStatus="status">
                                <c:if test="${status.first eq false}">
                                <c:if test="${contentType ne result.cd1}">
                                </ul>
                            </div>
                            </c:if>
                            </c:if>
                            <c:if test="${contentType ne result.cd1}">
                            <div class="cy_list_box">
                                <h3>${result.cdnm1}</h3>
                                <ul>
                                        <c:set var="contentType" value="${result.cd1}"/>
                                    </c:if>
                                    <li>
                                        <button type="button" onclick="fnSaveCurriculum('${result.cd1}', '${result.cd2}', '${result.chkyn}');" <c:if test="${result.chkyn eq 'Y'}">class="active"</c:if> >${result.cdnm2}</button>
                                    </li>
                                    </c:forEach>
                            </div>
                        </div>
                        <div class="board_util_btn_con" style="text-align: center;">
                            <button type="button" class="btn_style_0 blue row-btn gnb_save">저장하기</button>
                        </div>
                    </div>
                    <!-- pc 햄버거 버튼 눌렀을때 end -->
                </c:if>
            </nav>
        </div>
    </header>
    <!-- //header end -->

    <div id= "ContentBox" class="contents_section">
        <!-- 메인 배너 pc -->
        <div class="main_visual_contents pc">
            <div class="swiper-container" id="main_visual_slide" draggable="true">
                <div class="swiper-wrapper">
                    <c:set var="tidx" value="0" />
                    <c:forEach items="${mainBannerList }" var="result" varStatus="status">
                        <c:if test="${status.index > 0}">
                            <c:set var="tidx" value="-1" />
                        </c:if>
                        <div class="swiper-slide">
                            <a href="${result.bnrUrl}" tabindex="${tidx}" <c:if test="${result.popup eq 'Y'}">target="_blank"</c:if> <c:if test="${result.popup ne 'Y'}">target="_self"</c:if>>
                                <img src="/cmm/fms/getImage.do?atchFileId=${result.atchFileId}&fileSn=1" alt="${result.bnrNm}">
                            </a>
                        </div>
                    </c:forEach>
                    <!-- //반복 -->
                </div>

                <div class="swiper_page_all_box">
                    <div class=" swiper-pagination"></div>
                    <div class="swiper_control_box">
                        <div><button type="button" class="swiper-button-prev" title="이전 배너보기"></button></div>
                        <button class="swiper-button-play"><img src="/edu/images/renew2022/ico_play.png" alt="배너 재생"></button>
                        <button class="swiper-button-pause"><img src="/edu/images/renew2022/ico_stop.png" alt="배너 정지"></button>
                        <div ><button type="button" class="swiper-button-next" title="다음 배너보기"></button></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 메인 배너 mobile -->
        <div class="main_visual_contents mo">
            <div class="swiper-container" id="mo_main_visual_slide" draggable="true">
                <div class="swiper-wrapper">
                    <c:set var="mtidx" value="0" />
                    <c:forEach items="${mainBannerList }" var="result" varStatus="status">
                        <c:if test="${status.index > 0}">
                            <c:set var="mtidx" value="-1" />
                        </c:if>
                        <div class="swiper-slide">
                            <a href="${result.bnrUrl}" tabindex="${mtidx}" <c:if test="${result.popup eq 'Y'}">target="_blank"</c:if> <c:if test="${result.popup ne 'Y'}">target="_self"</c:if>>
                                <img src="/cmm/fms/getImage.do?atchFileId=${result.atchFileId}&fileSn=2" alt="${result.bnrNm}" style="width:100%;">
                            </a>
                        </div>
                    </c:forEach>
                    <!-- //반복 -->
                </div>

                <div class="swiper_page_all_box">
                    <div class=" swiper-pagination"></div>
                    <div class="swiper_control_box">
                        <div class="swiper-button-prev"></div>
                        <button class="swiper-button-play"><img src="/edu/images/renew2022/ico_play.png" alt="배너 재생"></button>
                        <button class="swiper-button-pause"><img src="/edu/images/renew2022/ico_stop.png" alt="배너 정지"></button>
                        <div class="swiper-button-next"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- SNS / 공지사항 start -->
        <div class="main_sns_notice_box">
            <div class="main_sns_notice_inner_box">
                <div class="show vm header_util_icon_con">
                    <span class="show header_util_icon_item">
                        <a href="https://www.facebook.com/edukocca" target="_blank" title="새창열림">
                            <img src="/edu/images/renew2022/ico_facebook_black.png" alt="페이스북 바로가기">
                        </a>
                    </span>
                    <span class="show header_util_icon_item">
                        <a href="https://twitter.com/edukocca" target="_blank" title="새창열림">
                            <img src="/edu/images/renew2022/ico_twitter_black.png" alt="트위터 바로가기">
                        </a>
                    </span>
                    <span class="show header_util_icon_item">
                        <a href="https://blog.naver.com/edukocca" target="_blank" title="새창열림">
                            <img src="/edu/images/renew2022/ico_blog_black.png" alt="블로그 바로가기">
                        </a>
                    </span>
                    <span class="show header_util_icon_item">
                        <a href="https://www.youtube.com/channel/UCJ78W_fNjOW7A-lZ6uEClgA" target="_blank" title="새창열림">
                            <img src="/edu/images/renew2022/ico_youtube_black.png" alt="유튜브 바로가기">
                        </a>
                    </span>
                    <span class="show header_util_icon_item">
                        <a href="https://www.instagram.com/edu.kocca/" target="_blank" title="새창열림">
                            <img src="/edu/images/renew2022/ico_instar_black.png" alt="인스타그램 바로가기">
                        </a>
                    </span>
                </div>

                <div class="notice_swiper_box">
                    <div class="news_notice_list">
                        <span class="title">
                            <a href="/edu/bbs/B0000011/list.do?menuNo=500008">공지사항</a>
                        </span>
                        <div class="list_box notice_list_box swiper-container">
                            <ul class="swiper-wrapper">
                                <c:forEach var="result" items="${B0000011List}" end="3" varStatus="status">
                                    <li class="swiper-slide">
                                        <a href="/edu/bbs/<c:out value="${result.bbsId}"/>/view.do?nttId=<c:out value="${result.nttId}"/>&amp;menuNo=500008">
                                            <span class="abbreviation<c:if test="${status.first}"></c:if>"><c:out value="${result.nttSj}"/></span>
                                            <span>
	                                        	<fmt:parseDate var="dateFmt" pattern="yyyy-MM-dd" value="${fn:substring(result.regDate,0,10)}"/>
	                                        	<fmt:formatDate var="dateTempParse" pattern="yyyy.MM.dd" value="${dateFmt}"/>
	                                        	<c:out value="${dateTempParse}"/>
	                                        </span>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <button class="swiper-button-play" title="슬라이드 재생하기" style="display: none; font-size: 16px;">재생</button>
                        <button class="swiper-button-pause" title="슬라이드 정지하기" style="font-size: 16px;">정지</button>
                        <a href="/edu/bbs/B0000011/list.do?menuNo=500008" class="">더보기</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- SNS / 공지사항 end -->

        <!--  신규클래스 /추천과정/ 수강한 과정 start -->
        <div class="main_online_contents">
            <div class="container">
                <!-- 신규 클래스 start -->
                <div id="main_new_class" class="main_new_contents pc"> <!-- pc 슬라이드 -->
                    <div class="container">
                        <span class="main_title main_title_bold">
                            <a href="" alt="NEW 신규 클래스">NEW 신규 클래스</a>
                        </span>
                        <div class="swiper-container one_card01">
                            <ul class="swiper-wrapper pc">
                                <li class="swiper-slide">
                                    <span class="new_snail_box">
                                        <a href="https://edu.kocca.kr/edu/onlineEdu/openLecture/view.do?menuNo=500085&pSeq=1172&pLectureCls=GC01" tabindex="-1">
                                            <img src="/edu/images/renew2022/new_class06.png" alt="">
                                        </a>
                                    </span>
                                    <div class="new_txt_box">
                                        <h3>크리에이터를 만드는 크리에이터</h3>
                                        <p class="new_info_box">
                                            채널 컨설팅부터 마케팅과 브랜딩까지!<br>
                                            콘텐츠의 시작과 끝을 책임진다.<br>
                                            크리에이터와 함께하는 사람들의 이야기
                                        </p>
                                    </div>
                                </li>
                                <li class="swiper-slide">
                                    <span class="new_snail_box">
                                        <a href="https://edu.kocca.kr/edu/onlineEdu/openLecture/view.do?menuNo=500085&pSeq=1166&pLectureCls=GC04" tabindex="-1">
                                            <img src="/edu/images/renew2022/new_class07.png" alt="">
                                        </a>
                                    </span>
                                    <div class="new_txt_box">
                                        <h3>무한한 창작, 음악에 관하여</h3>
                                        <p class="new_info_box">
                                            음악 콘텐츠🎵 창작엔 끝이 없다!<br>
                                            매체별 작품 제작 사례와 함께 알아보는<br>
                                            음악 창작과 실무 이야기
                                        </p>
                                    </div>
                                </li>
                                <li class="swiper-slide">
                                    <span class="new_snail_box">
                                        <a href="https://edu.kocca.kr/edu/onlineEdu/openLecture/view.do?menuNo=500085&pSeq=1186&pLectureCls=GC05" tabindex="-1">
                                            <img src="/edu/images/renew2022/new_class08.png" alt="">
                                        </a>
                                    </span>
                                    <div class="new_txt_box">
                                        <h3>장애인을 고려한 접근성 높은 게임</h3>
                                        <p class="new_info_box">
                                            누구나 즐길 수 있는 게임?🎮<br>
                                            게임 콘텐츠 접근성과 재미를 모두 잡는다!<br>
                                            장애인을 위한 게임 편의성 향상 프로젝트<br>
                                            * 본 과정은 ‘수어자막‘ 버전으로도 제공됩니다.
                                        </p>
                                    </div>
                                </li>
                                <li class="swiper-slide">
                                    <span class="new_snail_box">
                                        <a href="https://edu.kocca.kr/edu/onlineEdu/openLecture/view.do?menuNo=500085&pSeq=1180&pLectureCls=GC01" tabindex="-1">
                                            <img src="/edu/images/renew2022/new_class09.png" alt="">
                                        </a>
                                    </span>
                                    <div class="new_txt_box">
                                        <h3>콘텐츠, 스토리텔링을 담다</h3>
                                        <p class="new_info_box">
                                            탐사 보도부터 서바이벌, 스포츠 예능까지!<br>
                                            온라인 콘텐츠로 만나는 현장의 생생함<br>
                                            진정성, 리얼리티 그리고 공감의 이야기
                                        </p>
                                    </div>
                                </li>
                                <li class="swiper-slide">
                                    <span class="new_snail_box">
                                        <a href="https://url.kr/4kizp9" tabindex="-1">
                                            <img src="/edu/images/renew2022/new_class05.png" alt="">
                                        </a>
                                    </span>
                                    <div class="new_txt_box">
                                        <h3>빛나는 아티스트를 만드는 사람들</h3>
                                        <p class="new_info_box">
                                            전세계의 사랑을 받는 K-POP 아티스트를 꿈꾼다!<br>
                                            신인 개발, 매니지먼트 그리고 각종 공연 기획까지,
                                            음악 산업의 다양한 직무와 역량이 궁금하다면?<br>
                                            지금 바로 에듀코카에서 확인하세요!
                                        </p>
                                    </div>
                                </li>
                                <li class="swiper-slide">
                                    <span class="new_snail_box">
                                        <a href="https://url.kr/o8z1ua" tabindex="0">
                                            <img src="/edu/images/renew2022/new_class04.png" alt="모두를 위한 즐거움 : 배리어프리
                                            물리적, 심리적 장벽을 없애기 위한 첫 걸음.
                                            배리어 프리(Barrier – free), 얼마나 알고 계신가요?
                                            콘텐츠산업 내 배리어프리가 궁금하다면?
                                            지금 에듀코카에서 확인해보세요!
                                            ">
                                        </a>
                                    </span>
                                    <div class="new_txt_box">
                                        <h3>모두를 위한 즐거움 : 배리어프리</h3>
                                        <p class="new_info_box">
                                            물리적, 심리적 장벽을 없애기 위한 첫 걸음.<br>
                                            배리어 프리(Barrier – free), 얼마나 알고 계신가요?<br>
                                            콘텐츠산업 내 배리어프리가 궁금하다면?<br>
                                            지금 에듀코카에서 확인해보세요!
                                        </p>
                                    </div>
                                </li>
                                <li class="swiper-slide">
                                    <span class="new_snail_box">
                                        <a href="https://edu.kocca.kr/edu/onlineEdu/openLecture/view.do?menuNo=500085&pSeq=1103&pLectureCls=GC02" tabindex="-1">
                                            <img src="/edu/images/renew2022/new_class03.png" alt="게임회사의 모든 것 (feat.직무)
                                            게임 기업 취업, 이직을 희망하고 있다면?
                                            실무진들의 다양한 직무 Ssul은 물론
                                            게임 회사가 원하는 인재상부터
                                            게임 산업의 전체 구조까지 다 알려드립니다!
                                            지금 바로 에듀코카에서 확인해보세요.
                                            ">
                                        </a>
                                    </span>
                                    <div class="new_txt_box">
                                        <h3>게임회사의 모든 것 (feat.직무)</h3>
                                        <p class="new_info_box">
                                            게임 기업 취업, 이직을 희망하고 있다면?<br/>
                                            실무진들의 다양한 직무 Ssul은 물론<br/>
                                            게임 회사가 원하는 인재상부터<br/>
                                            게임 산업의 전체 구조까지 다 알려드립니다!<br/>
                                            지금 바로 에듀코카에서 확인해보세요.
                                        </p>
                                    </div>
                                </li>
                                <li class="swiper-slide">
                                    <span class="new_snail_box">
                                        <a href="https://edu.kocca.kr/edu/onlineEdu/openLecture/view.do?pSeq=1092&pageIndex2=&pLectureCls=&&menuNo=500085&searchCnd=&searchWrd=&p_type=K0&p_gcd1=&p_gcd2=&p_level=&p_sort=N&pGubun1=K0&p_list_type=C&pageIndex=1" tabindex="-1">
                                            <img src="/edu/images/renew2022/new_class02.png" alt="웹툰 회사에서는 어떤 일을 할까?
                                            콘텐츠 IP로써 새로운 한류 문화로 자리매김한 웹툰!
                                            웹툰 산업에서 선도적인 역할을 하고 있는 기업에서는
                                            과연 어떤 일을 하고 있는지 궁금하다면?
                                            지금 바로 에듀코카에서 확인하세요!
                                            ">
                                        </a>
                                    </span>
                                    <div class="new_txt_box">
                                        <h3>웹툰 회사에서는 어떤 일을 할까?</h3>
                                        <p class="new_info_box">
                                            콘텐츠 IP로써 새로운 한류 문화로 자리매김한 웹툰!<br/>
                                            웹툰 산업에서 선도적인 역할을 하고 있는 기업에서는<br/>
                                            과연 어떤 일을 하고 있는지 궁금하다면?<br/>
                                            지금 바로 에듀코카에서 확인하세요!
                                        </p>
                                    </div>
                                </li>
                                <li class="swiper-slide">
                                    <span class="new_snail_box">
                                        <a href="https://edu.kocca.kr/edu/onlineEdu/openLecture/view.do?pSeq=1087&pageIndex2=&pLectureCls=&&menuNo=500085&searchCnd=&searchWrd=&p_type=B0&p_gcd1=&p_gcd2=&p_level=&p_sort=N&pGubun1=B0&p_list_type=C&pageIndex=1" tabindex="-1">
                                            <img src="/edu/images/renew2022/new_class.png" alt="">
                                        </a>
                                    </span>
                                    <div class="new_txt_box">
                                        <h3>콘텐츠 뒤의 사람들, OTT 이야기</h3>
                                        <p class="new_info_box">
                                            빠르고, 크고, 다양하게 퍼져 나가는 OTT!
                                            콘텐츠 기업에서 하는 일이 궁금한 사람들을 위해 준비했습니다.
                                            OTT플랫폼 현직자들과 다양한 직무분야에 대한 이야기가 궁금하다면?
                                            에듀코카에서 확인하세요!
                                        </p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="swiper_btn_box">
                            <div><button type="button" class="swiper-button-prev" title="이전 배너보기"></button></div>
                            <div><button type="button" class="swiper-button-next" title="다음 배너가기"></button></div>
                        </div>
                    </div>
                </div>

                <div class="main_new_contents mo"> <!-- 모바일 슬라이드 -->
                    <div class="container">
                        <span class="main_title main_title_bold">
                            <a href="#" alt="NEW 신규 클래스">NEW 신규 클래스</a>
                        </span>
                        <div class="swiper-container one_card01">
                            <ul class="swiper-wrapper pc">
                                <li class="swiper-slide">
                                    <span class="new_snail_box">
                                        <a href="https://edu.kocca.kr/edu/onlineEdu/openLecture/view.do?menuNo=500085&pSeq=1172&pLectureCls=GC01">
                                            <img src="/edu/images/renew2022/m_new_class06.png" alt="">
                                        </a>
                                    </span>
                                </li>
                                <li class="swiper-slide">
                                    <span class="new_snail_box">
                                        <a href="https://edu.kocca.kr/edu/onlineEdu/openLecture/view.do?menuNo=500085&pSeq=1166&pLectureCls=GC04">
                                            <img src="/edu/images/renew2022/m_new_class07.png" alt="">
                                        </a>
                                    </span>
                                </li>
                                <li class="swiper-slide">
                                    <span class="new_snail_box">
                                        <a href="https://edu.kocca.kr/edu/onlineEdu/openLecture/view.do?menuNo=500085&pSeq=1186&pLectureCls=GC05">
                                            <img src="/edu/images/renew2022/m_new_class08.png" alt="">
                                        </a>
                                    </span>
                                </li>
                                <li class="swiper-slide">
                                    <span class="new_snail_box">
                                        <a href="https://edu.kocca.kr/edu/onlineEdu/openLecture/view.do?menuNo=500085&pSeq=1180&pLectureCls=GC01">
                                            <img src="/edu/images/renew2022/m_new_class09.png" alt="">
                                        </a>
                                    </span>
                                </li>
                                <li class="swiper-slide">
                                    <span class="new_snail_box">
                                        <a href="https://url.kr/4kizp9">
                                            <img src="/edu/images/renew2022/m_new_class05.png" alt="">
                                        </a>
                                    </span>
                                </li>
                                <li class="swiper-slide">
                                    <span class="new_snail_box">
                                        <a href="https://url.kr/o8z1ua">
                                            <img src="/edu/images/renew2022/m_new_class04.png" alt="">
                                        </a>
                                    </span>
                                </li>
                                <li class="swiper-slide">
                                    <span class="new_snail_box">
                                        <a href="https://edu.kocca.kr/edu/onlineEdu/openLecture/view.do?menuNo=500085&pSeq=1103&pLectureCls=GC02">
                                            <img src="/edu/images/renew2022/m_new_class03.png" alt="">
                                        </a>
                                    </span>
                                </li>
                                <li class="swiper-slide">
                                    <span class="new_snail_box">
                                        <a href="https://edu.kocca.kr/edu/onlineEdu/openLecture/view.do?pSeq=1092&pageIndex2=&pLectureCls=&&menuNo=500085&searchCnd=&searchWrd=&p_type=K0&p_gcd1=&p_gcd2=&p_level=&p_sort=N&pGubun1=K0&p_list_type=C&pageIndex=1">
                                            <img src="/edu/images/renew2022/m_new_class02.png" alt="">
                                        </a>
                                    </span>
                                </li>
                                <li class="swiper-slide">
                                    <span class="new_snail_box">
                                        <a href="https://edu.kocca.kr/edu/onlineEdu/openLecture/view.do?pSeq=1087&pageIndex2=&pLectureCls=&&menuNo=500085&searchCnd=&searchWrd=&p_type=B0&p_gcd1=&p_gcd2=&p_level=&p_sort=N&pGubun1=B0&p_list_type=C&pageIndex=1">
                                            <img src="/edu/images/renew2022/m_new_class.png" alt="">
                                        </a>
                                    </span>
                                </li>
                            </ul>
                        </div>
                        <div class="swiper_btn_box">
                            <div class="swiper-button-prev"></div>
                            <div class="swiper-button-next"></div>
                        </div>
                    </div>
                </div>
                <!-- 신규 클래스 end -->

                <!-- 추천 클래스 start -->
                <div id="main_best_class" class="fwo_card_list_box fwo_card01">
                    <span class="main_title animate__pulse01" style="width: auto;">추천 클래스</span>
                    <div class="fwo_card swiper-container">
                        <ul class="swiper-wrapper">
                            <c:forEach items="${eduSubjList }" var="result">
                                <li class="swiper-slide">
                                    <!-- 썸네일 start -->
                                    <div class="fwo_snail_box">
                                        <a href="javascript:void(0);" onclick="fnSubjViewPage('${result.subj }', '${result.subjnm }', '${result.isonoff }', '${result.scupperclass }', '${result.uclassnm }', '${result.scyear }', '${result.subjseq }'); return false;">
                                            <c:choose>
                                                <c:when test="${result.introducefilenamenew == null or result.introducefilenamenew == '' }">
                                                    <img src="/edu/images/renew2022/fwo_snail01.png" alt="이미지 설명들어가는 곳">
                                                </c:when>
                                                <c:otherwise>
                                                    <img alt="${result.subjnm } - 메인 이미지" src="<c:out value="${result.introducefilenamenew}" />"/>
                                                    <%--<img src="	https://edu.kocca.kr/upload/renewsnail/CB21005.png" alt="이미지 설명들어가는 곳">--%>
                                                </c:otherwise>
                                            </c:choose>
                                        </a>

                                        <!-- 설명란 start-->
                                        <div class="fwo_info_box">
                                            <h3 class="fwo_tit_box">
                                                <a href="javascript:void(0);" onclick="fnSubjViewPage('${result.subj }', '${result.subjnm }', '${result.isonoff }', '${result.scupperclass }', '${result.uclassnm }', '${result.scyear }', '${result.subjseq }'); return false;">
                                                        ${result.subjnm }
                                                </a>
                                            </h3>
                                            <p>${result.g2nm }ㆍ${result.g3nm }</p>
                                            <a href="javascript:void(0);" onclick="fnSubjViewPage('${result.subj }', '${result.subjnm }', '${result.isonoff }', '${result.scupperclass }', '${result.uclassnm }', '${result.scyear }', '${result.subjseq }'); return false;" class="go_page_a"></a>
                                        </div>
                                        <!-- 설명란 start-->
                                    </div>
                                    <!-- 썸네일 end -->
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
                    <div class="swiper_btn_box">
                        <div><button type="button" class="swiper-button-prev" title="이전 배너보기"></button></div>
                        <div><button type="button" class="swiper-button-next" title="다음 배너가기"></button></div>
                    </div>
                </div>
                <!-- 추천 클래스 end -->

                <!-- 인기 클래스 start -->
                <div id="main_hot_class" class="fwo_card_list_box fwo_card02">
                    <span class="main_title animate__pulse02" style="width: auto;">인기 클래스</span>
                    <div class="fwo_card swiper-container">
                        <ul class="swiper-wrapper">
                            <c:forEach items="${popularityList }" var="result">
                                <c:url var="url" value="/edu/onlineEdu/openLecture/view.do">
                                    <c:param name="pSeq" value="${result.seq }"/>
                                    <c:param name="pageIndex2" value="${param.pageIndex2 }"/>
                                    <c:param name="pLectureCls" value="${param.pLectureCls }"/>
                                    <c:param name="menuNo" value="500085"/>
                                </c:url>
                                <li class="swiper-slide">
                                    <!-- 썸네일 start -->
                                    <div class="fwo_snail_box">
                                        <a href='<c:out value="${url }" />'>
                                            <c:choose>
                                                <c:when test="${result.vodimg == null or result.vodimg == '' }">
                                                    <img src="/edu/images/renew2022/fwo_snail01.png" alt="이미지 설명들어가는 곳">
                                                </c:when>
                                                <c:otherwise>
                                                    <img alt="<c:out value='${result.lecnm }' escapeXml="false" /> - 메인 이미지" src="<c:out value='${result.vodimg }'/>"/>
                                                </c:otherwise>
                                            </c:choose>
                                        </a>

                                        <!-- 설명란 start-->
                                        <div class="fwo_info_box">
                                            <h3 class="fwo_tit_box">
                                                <a href='<c:out value="${url }" />'><c:out value='${result.lecnm }' escapeXml="false"/></a>
                                            </h3>
                                            <p>${result.g2nm}ㆍ${result.g3nm}</p>
                                            <a href='<c:out value="${url }" />' class="go_page_a"></a>
                                        </div>
                                        <!-- 설명란 start-->
                                    </div>
                                    <!-- 썸네일 end -->
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
                    <div class="swiper_btn_box">
                        <div><button type="button" class="swiper-button-prev" title="이전 배너보기"></button></div>
                        <div><button type="button" class="swiper-button-next" title="다음 배너가기"></button></div>
                    </div>
                </div>
                <!-- 인기 클래스 end -->
            </div>
        </div>
        <!-- 추천과정/ 수강한 과정 end -->

        <!-- 아이콘카테고리(방송영상,게임,만애캐,문화일반,인경교일) start -->
        <div class="main_news_contents">
            <div class="container">
                <div class="swiper-container">
                    <ul class="swiper-wrapper">
                        <li class="swiper-slide"><a href="javascript:void(0);" onclick="fnCmdSubjSearchList('B0', '', '', '', ''); return false;" ${selectedGubunAtag}>방송영상<br>Broadcast Video</a></li>
                        <li class="swiper-slide"><a href="javascript:void(0);" onclick="fnCmdSubjSearchList('G0', '', '', '', ''); return false;" ${selectedGubunAtag}>게임<br>Games</a></li>
                        <li class="swiper-slide"><a href="javascript:void(0);" onclick="fnCmdSubjSearchList('K0', '', '', '', ''); return false;" ${selectedGubunAtag}>만화·애니·캐릭터<br>Cartoon · Character</a></li>
                        <li class="swiper-slide"><a href="javascript:void(0);" onclick="fnCmdSubjSearchList('M0', '', '', '', ''); return false;" ${selectedGubunAtag}>음악/공연<br>Music · Performance</a></li>
                        <li class="swiper-slide"><a href="javascript:void(0);" onclick="fnCmdSubjSearchList('S0', '', '', '', ''); return false;" ${selectedGubunAtag}>인문교양<br>Liberal Arts</a></li>
                    </ul>

                    <!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
                    <div class="swiper_btn_box">
                        <div><button type="button" class="swiper-button-prev" title="이전 배너보기"></button></div>
                        <div><button type="button" class="swiper-button-next" title="다음 배너가기"></button></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 아이콘카테고리(방송영상,게임,만애캐,문화일반,인경교일) end -->

        <!-- 진행 중 이벤트 start -->
        <div class="main_offline_contents">
            <div class="container">
                <div class="fwo_card_list_box fwo_card03">
                    <span class="main_title main_title_bold">
                        <a href="/edu/bbs/B0000048/list.do?menuNo=500205" alt="진행 중 이벤트 바로가기">진행 중 이벤트</a>
                    </span>
                    <div class="fwo_card swiper-container">
                        <ul class="swiper-wrapper">
                            <c:forEach items="${openEventList }" var="result" varStatus="status">
                                <c:set value="${fileMap[result.atchFileId] }" var="fileList"/>
                                <c:url var="url" value="/edu/bbs/${paramVO.bbsId}/view.do?nttId=${result.nttId}&delCode=0&menuNo=500203&pageIndex=1"/>
                                <fmt:parseDate value="${result.ntceBgnde}" var="sdt" pattern="yyyy-MM-dd"/>
                                <fmt:parseNumber value="${sdt.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
                                <fmt:parseDate value="${result.ntceEndde}" var="edt" pattern="yyyy-MM-dd"/>
                                <fmt:parseNumber value="${edt.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
                                <c:set var="now" value="<%=new java.util.Date()%>"/>
                                <c:set var="nowDt"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></c:set>
                                <fmt:parseDate value="${nowDt}" var="ndt" pattern="yyyy-MM-dd"/>
                                <fmt:parseNumber value="${ndt.time / (1000*60*60*24)}" integerOnly="true" var="nowDate"></fmt:parseNumber>

                                <li class="swiper-slide">
                                    <!-- 썸네일 start -->
                                    <div class="fwo_snail_box">
                                        <a href="<c:out value="${url }" escapeXml="false" />">
                                            <c:choose>
                                                <c:when test='${ fileList.size() > 0 }'>
                                                    <c:forEach var="file" items="${fileList }">
                                                        <c:choose>
                                                            <c:when test="${file.fileFieldName eq 'main_image' }">
                                                                <img alt="에듀코카 이벤트 이미지" src="/cmm/fms/getImage.do?atchFileId=<c:out value="${file.atchFileId}" />&amp;fileSn=<c:out value="${file.fileSn}" />" />
                                                            </c:when>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <img alt="No Image" src="/edu/images/bm/noimage.png"/>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test='${ (nowDate-endDate) > 0 }'>
                                                    <span class="tag_off" style="margin-bottom: 0;">종료</span>
                                                </c:when>
                                                <c:when test='${ (nowDate-strDate) < 0 }'>
                                                    <span class="tag_off" style="margin-bottom: 0;">D${strDate-nowDate}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="tag_off" style="margin-bottom: 0;">진행</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </a>
                                    </div>
                                    <!-- 썸네일 end -->

                                    <!-- 설명란 start-->
                                    <div class="fwo_info_box2">
                                        <h3 class="fwo_tit_box"><a href=""><c:out value="${result.nttSj }"/></a></h3>
                                        <p>[이벤트]</p>
                                        <a href="<c:out value="${url }" escapeXml="false" />" class="go_page_a"></a>
                                    </div>
                                    <!-- 설명란 start-->
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
                    <div class="swiper_btn_box">
                        <div><button type="button" class="swiper-button-prev" title="이전 배너보기"></button></div>
                        <div><button type="button" class="swiper-button-next" title="다음 배너가기"></button></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 진행 중 이벤트 end -->

        <!-- KOCCA 교육 사업 start -->
        <div class="main_study_contents">
            <div class="container">
                <span class="main_title main_title_bold">
                    <a href="/edu/dream/mainRsltManage/list.do?menuNo=500040" alt="KOCCA 교육 사업 바로가기">KOCCA 교육 사업</a>
                </span>
                <div class="three_card01 swiper-container">
                    <ul class="three_card_list_box swiper-wrapper">
                        <li class="swiper-slide"
                            data-aos="fade-up"
                            data-aos-anchor-placement="bottom-bottom"
                            data-aos-delay="0"
                            data-aos-duration="300">
                            <div class="three_card_top_box">
                                <span class="circle_snail_box"><img src="/edu/images/renew2022/biz_01.png" alt="창의인재동반"></span>
                                <h3>창의인재동반</h3>
                                <p>대한민국 콘텐츠 산업의 미래를 이끌어갈 우수한 콘텐츠 창작자 육성</p>
                            </div>
                            <div class="three_card_bottom_box">
                                <a href="/edu/dream/mainRsltManage/list.do?menuNo=500040" alt="창의인재동반 바로가기">바로가기</a>
                            </div>
                        </li>

                        <%--<li class="swiper-slide"
                            data-aos="fade-up"
                            data-aos-anchor-placement="bottom-bottom"
                            data-aos-delay="400"
                            data-aos-duration="300">
                            <div class="three_card_top_box">
                                <span class="circle_snail_box"><img src="/edu/images/renew2022/biz_02.png" alt="AI콘텐츠 창작"></span>
                                <h3>AI콘텐츠 창작</h3>
                                <p>문화 콘텐츠 융복합 AI 프로젝트 혁신인재 양성</p>
                            </div>
                            <div class="three_card_bottom_box">
                                <a href="/edu/main/contents.do?menuNo=500263" alt="AI콘텐츠 창작 바로가기">바로가기</a>
                            </div>
                        </li>--%>

                        <%--<li class="swiper-slide"
                            data-aos="fade-up"
                            data-aos-anchor-placement="bottom-bottom"
                            data-aos-delay="700"
                            data-aos-duration="300">
                            <div class="three_card_top_box">
                                <span class="circle_snail_box"><img src="/edu/images/renew2022/biz_03.png" alt="실감 콘텐츠 창작"></span>
                                <h3>실감 콘텐츠 창작</h3>
                                <p>산업계 실수요 맞춤형 실감 콘텐츠 창의인재 양성</p>
                            </div>
                            <div class="three_card_bottom_box">
                                <a href="/edu/main/contents.do?menuNo=500110" alt="실감 콘텐츠 창작 바로가기">바로가기</a>
                            </div>
                        </li>--%>

                        <li class="swiper-slide"
                            data-aos="fade-up"
                            data-aos-anchor-placement="bottom-bottom"
                            data-aos-delay="400"
                            data-aos-duration="300">
                            <div class="three_card_top_box">
                                <span class="circle_snail_box"><img src="/edu/images/renew2022/biz_04.png" alt="콘텐츠원캠퍼스"></span>
                                <h3>콘텐츠원캠퍼스</h3>
                                <p>산·학·연·관 협력 체계 기반의 융복합 인재 양성</p>
                            </div>
                            <div class="three_card_bottom_box">
                                <a href="https://edu.kocca.kr/edu/main/contents.do?menuNo=500179" alt="콘텐츠원캠퍼스 바로가기">바로가기</a>
                            </div>
                        </li>

                        <%--<li class="swiper-slide">
                            <div class="three_card_top_box">
                                <span class="circle_snail_box"><img src="/edu/images/renew2022/biz_05.png" alt="콘텐츠임팩트"></span>
                                <h3>콘텐츠임팩트</h3>
                                <p>고급 크리에이터 및 문화기술개발자를 발굴·양성하는 한국콘텐츠진흥원의 인재 양성 사업</p>
                            </div>
                            <div class="three_card_bottom_box">
                                <a href="" alt="콘텐츠임팩트 바로가기">바로가기</a>
                            </div>
                        </li>--%>

                        <li class="swiper-slide"
                            data-aos="fade-up"
                            data-aos-anchor-placement="bottom-bottom"
                            data-aos-delay="700"
                            data-aos-duration="300">
                            <div class="three_card_top_box">
                                <span class="circle_snail_box"><img src="/edu/images/renew2022/biz_06.png" alt="콘텐츠 인사이트"></span>
                                <h3>콘텐츠 인사이트</h3>
                                <p>국내외 거장급 전문가 초청 열린 세미나를 통해 콘텐츠산업계 인사이트 제공</p>
                            </div>
                            <div class="three_card_bottom_box">
                                <a href="https://edu.kocca.kr/edu/progrm/master/list.do?prgSe=01&prgCl=13&menuNo=500215" alt="콘텐츠 인사이트 바로가기">바로가기</a>
                            </div>
                        </li>

                        <li class="swiper-slide"
                            data-aos="fade-up"
                            data-aos-anchor-placement="bottom-bottom"
                            data-aos-delay="1000"
                            data-aos-duration="300">
                            <div class="three_card_top_box">
                                <span class="circle_snail_box"><img src="/edu/images/renew2022/biz_07.png" alt="콘텐츠 스텝업"></span>
                                <h3>콘텐츠 스텝업</h3>
                                <p>콘텐츠산업 트렌드를 반영한 단기특강 및 심화 교육</p>
                            </div>
                            <div class="three_card_bottom_box">
                                <a href="https://edu.kocca.kr/edu/progrm/master/list.do?prgSe=01&prgCl=12&menuNo=500216" alt=">콘텐츠 스텝업 바로가기">바로가기</a>
                            </div>
                        </li>
                    </ul>

                    <!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
                    <div class="swiper_btn_box">
                        <div><button type="button" class="swiper-button-prev" title="이전 배너보기"></button></div>
                        <div><button type="button" class="swiper-button-next" title="다음 배너가기"></button></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- KOCCA 교육 사업 end -->

        <!-- KOCCA 교육 시설 start -->
        <div class="main_place_contents" data-aos="zoom-in">
            <div class="container" style="position: relative;">
                <span class="main_title main_title_bold">
                    <a href="/testbed/main/contents.do?menuNo=700133" alt="KOCCA 교육 시설 바로가기">KOCCA 교육 시설</a>
                </span>
                <div class="swiper-container one_card01">
                    <ul class="swiper-wrapper">
                        <li class="swiper-slide">
                            <span class="place_snail_box"><img src="/edu/images/renew2022/open_benner01.jpg" alt=""></span>
                            <div class="place_txt_box">
                                <h3>콘텐츠 문화 광장</h3>
                                <p class="place_info_box">
                                    콘텐츠문화광장은 융복합 콘텐츠의 테스트베드(TEST BED)로서
                                    블랙박스 구조의 스테이지66과 스튜디오1, 2, 연습실 등을 갖추고
                                    콘텐츠 산업의 미래를 여는 역할을 하고 있습니다.
                                </p>
                                <p class="go_add_btn_box"><a href="/testbed/main/main.do?menuNo=500108">전체보기</a></p>
                            </div>
                        </li>

                        <li class="swiper-slide">
                            <span class="place_snail_box"><img src="/edu/images/renew2022/open_benner02.png" alt=""></span>
                            <div class="place_txt_box">
                                <h3>콘텐츠 인재 캠퍼스</h3>
                                <p class="place_info_box">
                                    콘텐츠인재캠퍼스는 생애주기별교육, 온라인교육, 등 한국콘텐츠진흥원에서 진행하는 교육 프로그램을 망라한 교육 플랫폼으로
                                    4차 산업혁명 시대를 이끌어 갈 융합형인재를 육성하기 위한 터전이자 출발점입니다.
                                </p>
                                <p class="go_add_btn_box"><a href="/testbed/main/contents.do?menuNo=700133">전체보기</a></p>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="swiper_btn_box">
                    <button class="swiper-button-play" title="슬라이드 재생하기" style="display: none; font-size: 16px;">재생</button>
                    <button class="swiper-button-pause" title="슬라이드 정지하기" style="font-size: 16px;">정지</button>
                </div>
            </div>
        </div>
        <!-- KOCCA 교육 시설 end -->
    </div>
    <!-- footer -->
    <div id="menu5" class="menu5">
        <!-- 정보보호인증마크 JS -->
        <script type="text/javascript" src="https://www.eprivacy.or.kr/seal/mark.js"></script>
        <script type="text/javascript">
            function winMarkPopup(theURL, winName, features) { //v2.0
                window.open(theURL, winName, features);
            }
        </script>
        <!-- 정보보호인증마크 JS -->

        <!-- footer -->
        <div id="footer" class="col-12">
            <div class="container">
                <div class="col-xl-8 col-lg-12 col-md-12">
                    <ul>
                        <li>
                            <%--<a href="javascript:winMarkPopup('http://www.kocca.kr/cop/contents.do?menuNo=200931','','status=yes,scrollbars=yes,width=1280,height=800')" class="footer_link_item fontweight400" title="새창열림">개인정보처리방침</a>--%>
                            <a href="https://www.kocca.kr/kocca/subPage.do?menuNo=204912" target="_blank" class="footer_link_item fontweight400" title="새창열림">개인정보처리방침</a>
                        </li>
                        <li><a href="/edu/main/contents.do?menuNo=500072" class="footer_link_item">이용약관</a></li>
                        <li><a href="/edu/bbs/B0000011/list.do?menuNo=500008" class="footer_link_item">공지사항</a></li>
                        <!--<li><a href="/edu/bbs/B0000046/list.do?menuNo=500073" class="footer_link_item">FAQ</a></li>-->
                        <li><a href="/edu/main/contents.do?menuNo=500227" class="footer_link_item">찾아오시는길</a></li>
                    </ul>
                    <span>본 페이지에 게시된 이메일주소가 자동 수집되는 것을 거부하며, 이를 위반시 정보통신법에 의해 처벌됨을 유념하시기 바랍니다.</span>
                    <div>
                        <span class="footer_logo"><img src="/edu/images/renew2022/fotter_logo.png" alt="한국콘텐츠진흥원 로고"></span>
                        <ul>
                            <li>홍릉분원 : [02456] 서울특별시 동대문구 회기로 66</li>
                            <li>본원 : [58217] 전라남도 나주시 교육길 35 한국콘텐츠진흥원 | 사업자번호 : 105-82-17272</li>
                            <li>온라인교육 02-6310-0770</li>
                            <li style="margin-top: 10px;">Copyright 2015. Korea Creative Content Agency all rights reserved.</li>
                        </ul>
                    </div>
                    <br/>
                </div>
                <div class="col-xl-4 col-lg-12 col-md-12 ml-auto">
                    <div class="footer_sns_link">
					<span class="footer_sns_icon">
						<a href="https://www.facebook.com/edukocca" target="_blank" title="새창열림">
							<img src="/edu/images/bm/facebook_icon_color.png" alt="페이스북 바로가기">
						</a>
					</span>
                        <span class="footer_sns_icon">
						<a href="https://twitter.com/edukocca" target="_blank" title="새창열림">
							<img src="/edu/images/bm/twitter_icon_color.png" alt="트위터 바로가기">
						</a>
					</span>
                        <span class="footer_sns_icon">
						<a href="https://blog.naver.com/edukocca" target="_blank" title="새창열림">
							<img src="/edu/images/bm/blog_icon_color.png" alt="블로그 바로가기">
						</a>
					</span>
                        <span class="footer_sns_icon">
						<a href="https://www.youtube.com/channel/UCJ78W_fNjOW7A-lZ6uEClgA" target="_blank" title="새창열림">
							<img src="/edu/images/bm/youtube_icon_color.png" alt="유튜브 바로가기">
						</a>
					</span>
                        <span class="footer_sns_icon">
						<a href="https://www.instagram.com/edu.kocca/" target="_blank" title="새창열림">
							<img src="/edu/images/bm/instargram_icon_color.png" alt="인스타그램 바로가기">
						</a>
					</span>
                    </div>
                    <div class="relation_site_link">
                        <select class="relation_site" name="relation_site" id="relation_site" title="관련사이트 바로가기">
                            <option value="">관련사이트</option>
                            <option value="http://www.mcst.go.kr/main.jsp">문화체육관광부</option>
                            <option value="http://www.kocca.kr/cop/main.do">한국콘텐츠진흥원</option>
                            <option value="http://www.kgq.or.kr/service/pub/IntroServlet">게임국가자격기술검정</option>
                        </select>
                        <input type="button" value="이동" onclick="window.open(document.getElementById('relation_site').value,'_blank')" title="관련사이트 새창열림" class="relation_site_button">
                        <label for="relation_site"><span style="display:block; font-size:0; height:0; line-height:0; margin:0; overflow:hidden; padding:0; width:0">관련사이트 바로가기</span></label>
                        <ul class="footer_util_link">
                            <li>
<%--                                <a href="https://www.eprivacy.or.kr/front/certifiedSiteMark/certifiedSiteMarkPopup.do?certCmd=EP&certNum=2021-EP-R040" target="_black">
                                    <img src="https://www.eprivacy.or.kr/images/mng/sub/mark1_eprivacy_plus.png" alt="개인정보보호인증 마크" title="개인정보보호인증 새창열림">
                                </a>--%>

                                <a href="javascript:winMarkPopup('https://www.eprivacy.or.kr/front/certifiedSiteMark/certifiedSiteMarkPopup.do?certCmd=EP&certNum=2023-EP-R037','seal','width=527,height=720,location=no,status=no,scrollbars=no');" title="개인정보보호인증 새창열림">
                                    <img src="https://www.eprivacy.or.kr/images/mng/sub/mark1_eprivacy_plus.png" style="cursor:pointer;" alt="개인정보보호인증 마크 ">
                                </a>
                            </li>
                            <%--
                            <li>
                                <img alt="굿콘텐츠 서비스 인증 마크" src="/edu/images/bm/footer_util_link_003.png">
                            </li>
                            --%>
                            <li>
                                <a href="javascript:winMarkPopup('/contents/temp/04_elearning.html','','status=yes,scrollbars=no,width=430,height=560');" title="한국u러닝연합회 e러닝전문기관인증 새창열림">
                                    <img src="/edu/images/bm/footer_util_link_004.png" alt="한국u러닝연합회 e러닝전문기관인증 마크">
                                </a>
                            </li>
                            <li>
                                <a href="javascript:winMarkPopup('/contents/temp/01_contents_certificate.html','','status=yes,scrollbars=no,width=430,height=560');" title="교육기부기관 교육부 Donation for Education 새창열림">
                                    <img src="/edu/images/bm/footer_util_link_005.png" alt="교육기부기관 교육부 Donation for Education 마크">
                                </a>
                            </li>
<%--                            <li>
                                <a href="javascript:winMarkPopup('/contents/temp/08_contents_certificate.html','','status=yes,scrollbars=no,width=430,height=560');" title="에코어워드 인증  새창열림">
                                    <img src="/edu/images/bm/footer_util_link_006.png" alt="에코어워드 인증 마크">
                                </a>
                            </li>--%>
                            <li>
                                <a href="http://webwatch.or.kr" title="WA 품질인증 마크, 웹와치(WebWatch) 2023.02.08 ~ 2024.02.09" target="_blank">
                                    <img src="/edu/images/bm/web_watch_mark_23.png" border="0" alt="과학기술정보통신부 WA(WEB접근성) 품질인증 마크, 웹와치(WebWatch) 2023.02.09 ~ 2024.02.08"/>
                                </a>
                            </li>
                            <li>
<%--                                <a href="javascript:winMarkPopup('/contents/temp/internet_comunication_satisfaction_2020.html','','status=yes,scrollbars=no,width=430,height=575');" title="대한민국인터넷소통대상 (ICSI)인증 새창열림">
                                    <img src="/edu/images/bm/internet_comunication_satisfaction_logo_2019.png" alt="대한민국인터넷소통대상 (ICSI)인증마크">
                                </a>--%>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <iframe name="ssoAuthFrame" id="ssoAuthFrame" style="width:0px;height:0px;border:0;" src="http://edusso.kocca.dev.kr/sso/member/checkSSO.do?service=edu&amp;menuNo=&amp;userTp=0" title="SSO 로그인 유무확인 프레임 입니다."></iframe>

<%--        <script>
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'G-9L2B36ZV50', 'auto');
            ga('send', 'pageview');
        </script>--%>

        <!-- Google tag (gtag.js) -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=G-9L2B36ZV50"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag(){dataLayer.push(arguments);}
            gtag('js', new Date());

            gtag('config', 'G-9L2B36ZV50');
        </script>

        <script type="text/javascript">
            <!--UX분석뷰저블 -->
                (function (w, d, a) {
                    w.__beusablerumclient__ = {
                        load: function (src) {
                            var b = d.createElement("script");
                            b.src = src;
                            b.async = true;
                            b.type = "text/javascript";
                            d.getElementsByTagName("head")[0].appendChild(b);
                        }
                    };
                    w.__beusablerumclient__.load(a);
                })(window, document, '//rum.beusable.net/script/b170309e165707u559/204ae352d6');
            <!-- UX분석 뷰저블 -->

            // 공지사항 세로 슬라이드
            var swiper7 = new Swiper('.notice_list_box', {
                autoplay: 4000
                , loot: true
                , speed: 700
                , direction: 'vertical' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
                , slidesPerView: 1 // 한번에 보이는 슬라이드 갯수
                , spaceBetween: 0 // 슬라이드 사이의 간격 px 단위
                , autoplayDisableOnInteraction: false
            });

            //공지사항 배너 정지버튼
            $('.notice_swiper_box .swiper-button-pause').click(function() {
                swiper7.stopAutoplay();
                $('.notice_swiper_box .swiper-button-play').show();
                $('.notice_swiper_box .swiper-button-pause').hide();
            });
            //공지사항 배너 재성버튼
            $('.notice_swiper_box .swiper-button-play').click(function() {
                swiper7.startAutoplay();
                $('.notice_swiper_box .swiper-button-play').hide();
                $('.notice_swiper_box .swiper-button-pause').show();
            });





        </script>
    </div>
    <!-- //footer -->

    <!-- layer 컨텐츠 인사이트 팝업-->
    <!--
    <div class="bg_layer"></div>
    <div id="event" class="layer_new_event">
        <div class="layr_header">
            <button type="button" class="btnIcon_close" onclick="popupClose('event')" title="팝업 닫기"></button>
        </div>
        <div class="layr_content swiper-container">
            <div class="swiper-wrapper">
                <div class="event_img_box swiper-slide">
                    <a href="https://edu.kocca.kr/edu/archiveUser/contentsList.do?menuNo=500259&workField=1" target="_blank"><img src="/edu/images/event/layer_event02.png" alt=" 2023 창의인재동반사업 온라인 성과전시 바로가기"></a>
                </div>
                <div class="event_img_box swiper-slide">
                    <a href="http://contentinsight.co.kr/2023/" target="_blank"><img src="/edu/images/event/layer_event01.png" alt="2023 현업인 참여강화를 위한 콘텐츠 인사이트 바로가기"></a>
                </div>
            </div>
            <div class="swiper_btn_box">
                <div><button type="button" class="swiper-button-prev" title="이전 배너보기"></button></div>
                <div><button type="button" class="swiper-button-next" title="다음 배너가기"></button></div>
            </div>
        </div>
        <div class="layr_footer">
        </div>
    </div>
    -->
</div>
</body>
</html>

