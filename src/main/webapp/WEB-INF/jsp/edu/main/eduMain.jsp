<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="kr.co.unp.cmm.sec.ram.service.impl.UnpUserDetailsHelper" %>
<%@ page import="kr.co.unp.member.vo.*" %>
<%@ page import="org.springframework.util.StringUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="kr.co.unp.mpm.vo.MenuManageVO"%>
<%@ page import="kr.co.unp.mpm.service.MasterMenuManager"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.unp.co.kr/util" prefix="util" %>

<c:set var='siteName' value='${paramVO.siteName}'/>
<%
UsersVO user = UnpUserDetailsHelper.getAuthenticatedUser();
pageContext.setAttribute("userVO", user);

String menuNo = request.getParameter("menuNo");
String debug = request.getParameter("debug");

//if( "1".equals(debug) ){
	
if( StringUtils.hasText(menuNo) ) {

	org.springframework.context.ApplicationContext context =
	org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(getServletContext());
	MasterMenuManager masterMenuManagerService = (MasterMenuManager)context.getBean("masterMenuManagerService");

//HashMap<String, List<MenuManageVO>> menuMap = (HashMap<String, List<MenuManageVO>>)application.getAttribute("menuAll5");
/* testbed20170830 */
	String siteName = (String)pageContext.getAttribute("siteName") != null ? (String)pageContext.getAttribute("siteName") : "" ;
	HashMap<String, List<MenuManageVO>> menuMap = new HashMap<String, List<MenuManageVO>>();
	HashMap<String, List<MenuManageVO>> eduMenuMap = (HashMap<String, List<MenuManageVO>>)application.getAttribute("menuAll5");
	HashMap<String, List<MenuManageVO>> testbedMenuMap = (HashMap<String, List<MenuManageVO>>)application.getAttribute("menuAll7");
	menuMap.putAll(eduMenuMap);
	if ( "testbed".equals( siteName ) )	
		menuMap.putAll( testbedMenuMap );
/* //testbed20170830 */

   MenuManageVO currentVo = masterMenuManagerService.getCurrentMenu(menuMap, Integer.parseInt(menuNo));
   pageContext.setAttribute("currMenu", currentVo);

   String position = currentVo.getPosition();
   int depth01 = Integer.parseInt(position.substring(0,2)) -1;
   int depth02 = Integer.parseInt(position.substring(2,4)) -1;
   int depth03 = Integer.parseInt(position.substring(4,6)) -1;
   int depth04 = Integer.parseInt(position.substring(6,8)) -1;
   int depth05 = Integer.parseInt(position.substring(8,10)) -1;
   pageContext.setAttribute("depth01", depth01);
   pageContext.setAttribute("depth02", depth02);
   pageContext.setAttribute("depth03", depth03);
   pageContext.setAttribute("depth04", depth04);
   pageContext.setAttribute("depth05", depth05);
}
%>
    
<%@include file="/WEB-INF/jsp/edu/inc/incMainFn.jsp"%>

<jsp:useBean id="todayNow" class="java.util.Date"  />
<fmt:formatDate value="${todayNow}" var="today" pattern="yyyy-MM-dd" />

<c:set var="userVO" value="${userVO }" scope="request" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>에듀코카 korea creative content agency</title>
    <%-- <c:if test="${param.mobileTp ne 'Y' }">
		<script type="text/javascript">
	        if (/(iphone|ipod|ipad|android|blackberry|windows ce|palm|symbian)/i.test(navigator.userAgent)) {
	        	location.href="https://medu.kocca.kr/edumobile/main/main.do";
	        }
		</script>
    </c:if>
    <c:if test="${param.mobileTp eq 'Y' }">
    	<meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1, maximum-scale=3, minimum-scale=1" />
    </c:if> --%>
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1, maximum-scale=3, minimum-scale=1" />
    <link rel="apple-touch-icon" sizes="57x57" href="/favicon/apple-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="/favicon/apple-icon-60x60.png">
	<link rel="apple-touch-icon" sizes="72x72" href="/favicon/apple-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="76x76" href="/favicon/apple-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="114x114" href="/favicon/apple-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="120x120" href="/favicon/apple-icon-120x120.png">
	<link rel="apple-touch-icon" sizes="144x144" href="/favicon/apple-icon-144x144.png">
	<link rel="apple-touch-icon" sizes="152x152" href="/favicon/apple-icon-152x152.png">
	<link rel="apple-touch-icon" sizes="180x180" href="/favicon/apple-icon-180x180.png">
	<link rel="icon" type="image/png" sizes="192x192"  href="/favicon/android-icon-192x192.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/favicon/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/favicon/favicon-16x16.png">
	<link rel="manifest" href="/favicon/manifest.json">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="/favicon/ms-icon-144x144.png">
	<meta name="theme-color" content="#ffffff">
	
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
	<link rel="stylesheet" type="text/css" href="/edu/css/new/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/edu/css/animate.min.css" />
    <link rel="stylesheet" type="text/css" href="/edu/css/common.css"  />
    <link rel="stylesheet" type="text/css" href="/edu/css/layout.css"  />
    <!-- <link rel="stylesheet" type="text/css" href="/edu/css/main.css"  /> -->
    <link rel="stylesheet" href="/edu/js/bm/swiper/swiper.min.css"/>
    <link rel="stylesheet" href="/edu/css/bm/animate.min.css"/>
    <link rel="stylesheet" href="/edu/css/bm/bootstrap.reset.css"/>
    <link rel="stylesheet" href="/edu/css/bm/common_prev.css"/>
    <link rel="stylesheet" href="/edu/css/bm/flaticon.css"/>
    <link rel="stylesheet" href="/edu/css/bm/ie.css"/>
    <link rel="stylesheet" href="/edu/css/bm/layout.css"/>
    <!-- <link rel="stylesheet" href="/edu/css/bm/main_prev.css"/> -->
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
    <script type="text/javascript"  src="/js/jquery.carouFredSel-6.2.1-packed.js"></script>
    <script type="text/javascript" src="/edu/js/common.js"></script>
    <script type="text/javascript"> subMenuOpenIng=true; </script>
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
	<link rel="stylesheet" href="/edu/css/renew2022/assets/plugins/animation/css/animate.min.css">
	<link rel="stylesheet" href="/edu/css/renew2022/assets/css/style.css">
	<link rel="stylesheet" href="/edu/css/renew2022/renew.css">
	<!-- renew2022 CSS end -->

	<!-- renew2022 JavaScript start -->
	<script src="/edu/css/renew2022/renew.js"></script>

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
</head>

<body>
	<script type="text/javascript">
		//<![CDATA[
		function search2(form){
			if(!form.q.value){
				alert("검색어를 입력하세요.");
				$("#q2")[0].focus();
				return false;
			}
			return true;
		}	
			
		$(function() {
			$("#empmnForm").submit(function() {
				$("#keyword").val(encodeURIComponent($("#keywordStr").val()));
			});
			
			$("#headerPopupContainer").bind("click", function(evt){
				if(evt.target == $("#headerPopupContainer")[0]){
					location.href="https://edu.kocca.kr/micro/micMain.do";
				}
			});
			
			if(getCookie("divpop1") =="Y"){
				$("#headerPopupContainer").remove();
			}
			
		});
		$('.adClose').click(function(event) {
			$('.ad').slideToggle()
			$(this).toggleClass('off');
		});
		
		function closeTopPopup(key){
			if($("#todaycloseyn").prop("checked")){
	            setCookie('divpop'+key, 'Y' , 1 );
	        }
			$("#headerPopupContainer").remove();
		}
		
		function setCookie( name, value, expiredays ){
		    var todayDate = new Date();
		    todayDate.setDate( todayDate.getDate() + expiredays );
		    document.cookie = name + '=' + escape( value ) + '; path=/; expires=' + todayDate.toGMTString() + ';'
	    }
		
		function getCookie(name) { 
	        var obj = name + "="; 
	        var x = 0; 
	        while ( x <= document.cookie.length ) { 
	            var y = (x+obj.length); 
	            if ( document.cookie.substring( x, y ) == obj ) { 
	                if ((endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
	                    endOfCookie = document.cookie.length;
		                return unescape( document.cookie.substring( y, endOfCookie ) ); 
		        } 
		        x = document.cookie.indexOf( " ", x ) + 1; 
		        if ( x == 0 ) break; 
			} 
		        return ""; 
		}
		
        
		function logoutSSO() {
        	$.get("/${paramVO.siteName}/member/logout.json",function(data) {
        		var retUrl = "${ssoDomain}/sso/member/logoutSSO.do?service=${paramVO.siteName}";
        		//alert(retUrl);
        		location.href= retUrl;
        	},"json");
        	return false;
        }

        $(function() {
        	$(".logoutBtn").click(function() {
        		logoutSSO();
        		return false;
             });
        });
        
		function fnCmdSearchList(gubun1, gubun2, gubun3, ordersnm, orders){
			$.post()
			$("#pGubun1").val(gubun1);
			$("#pGubun2").val(gubun2);
			$("#pGubun3").val(gubun3);
			$("#p_ordersnm").val(ordersnm);
			$("#p_orders").val(orders);
			
			$("#pageIndex").val("1");
			$("#frm").attr({
				action:"/edu/onlineEdu/realm/list.do?menuNo=500027",
				method:"post",
				target:"_self"
			});
			$("#frm").submit();
		}
		
		function fnManualDownLoad(){
			if(confirm("이용자 매뉴얼을 다운로드하시겠습니까?")) {
				window.open("https://edu.kocca.kr/upload/homepage/eduKocca_manual.pdf");
			}
		}
        
        //]]>
	</script>
	<!-- <div class="mainLayerPopup" style="position:absolute; top:5%; left:5%; z-index:9999; background:white; max-width:90%; text-align:right;">
		<a href="javascript:void(0);" onclick="$('.mainLayerPopup').css({'display':'none'})" style="display:inline-block; padding:8px 15px">
			<img src="/edu/images/bm/popup_alarm_close_btn.png">
		</a>
		<a href="https://edu.kocca.kr/edu/bbs/B0000011/view.do?nttId=74323&menuNo=500008" style="display:block;">
			<img src="/edu/new_image/main/mainLayerPopup.png">
		</a>
	</div> -->
	<!-- <div id="headerPopupContainer">
		<div class="container">
			<span>
				<input type='checkbox' name='todaycloseyn' id='todaycloseyn' value='Y'><label for="todaycloseyn">오늘 하루 그만보기</label>
				<button onclick='javascript:closeTopPopup(1);'>
					<img src="/edu/images/bm/btn_style_0_close.png" alt="오늘하루 그만보기 버튼">
				</button>
			</span>
		</div>
	</div> -->

	<!-- html 작업본-->
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
						<input type="text" placeholder="검색어를 입력해주세요.">
						<button class="nav_search_btn"></button>
					</div>

					<!-- nav start -->
					<div class="collapse navbar-collapse" id="main_nav">

						<!-- 모바일 로그인/회원가입 start -->
						<!-- 로그인 후-->
						<sec:authorize ifAnyGranted="ROLE_USER">
							<div class="nav_my_box mo">
								<a href="/edu/onlineEdu/mylctrum/list.do?menuNo=500061">
									<img src="/edu/images/renew2022/my.png" alt="마이페이지">
								</a>
								<ul>
									<li><a href="/edu/member/logout.do" class="ico4 logoutBtn" title="로그아웃">로그아웃</a></li>
									<li id="myPageMenu"><a href="/edu/onlineEdu/mylctrum/list.do?menuNo=500061" title="마이페이지">마이페이지</a></li>
									<li><a href="/edu/userMember/simpleLogin.do?menuNo=500058" title="간편로그인 설정">간편로그인 설정</a></li>
									<li><a href="/edu/job/empymnCnsl/empymnCnslListMypage.do?menuNo=500059" title="1:1컨설팅내역">1:1컨설팅내역</a></li>
									<li><a href="/edu/progrm/applcnt/listMypage.do?menuNo=500064" title="프로그램 신청/접수">프로그램 신청/접수</a></li>
									<li><a href="/edu/progrm/applcnt/listMypage.do?menuNo=500064" title="나의 문의내역">나의 문의내역</a></li>
								</ul>
							</div>
							<%--<input type="image" src="/edu/images/renew2022/all_menu_white.png" class="gnb_menu" alt="GNB 메뉴" style="padding:0;">--%>
						</sec:authorize>
						<!-- 로그인 전-->
						<sec:authorize ifNotGranted="ROLE_USER">
							<c:url var="loginUrl" value="/edu/member/forLogin.do">
								<c:param name="menuNo" value="500077" />
								<c:param name="_targetUrl" value="${_targetUrl}" />
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
							<!-- nav 이벤트 one-daps start -->
							<li>
								<a href="/edu/bbs/B0000048/list.do?menuNo=500203">
									이벤트
								</a>
								<!-- nav 이벤트 two-daps start -->
								<%--<ul>
									<li>
										<a href="/edu/bbs/B0000048/list.do?menuNo=500203">
											참여 이벤트
										</a>
									</li>
									<li>
										<a href="">
											추천 강좌
										</a>
									</li>
									<li>
										<a href="/edu/progrm/master/list.do?prgSe=01&prgCl=13&menuNo=500215">
											콘텐츠인사이트
										</a>
									</li>
									<li>
										<a href="/edu/progrm/master/list.do?prgSe=01&prgCl=12&menuNo=500216">
											콘텐츠스텝업
										</a>
									</li>
									<li>
										<a href="">
											게임인재원
										</a>
									</li>
									<li>
										<a href="">
											게임이해하기
										</a>
									</li>
								</ul>--%>
								<!-- nav 이벤트 two-daps end -->
							</li>
							<!-- nav 이벤트 one-daps end -->

							<!-- nav 카테고리 one-daps start -->
							<li>
								<a href="/edu/onlineEdu/themeLecture/list.do?menuNo=500157">
									카테고리
								</a>
								<!-- nav 카테고리 two-daps start -->
								<ul>
									<li>
										<a href="/edu/onlineEdu/themeLecture/list.do?menuNo=500157">
											학습로드맵
										</a>
									</li>
									<li>
										<a href="/edu/onlineEdu/realm/list.do?p_ordersnm=ldate&p_orders=desc&menuNo=500027">
											방송영상
										</a>
									</li>
									<li>
										<a href="/edu/onlineEdu/realm/list.do?p_ordersnm=ldate&p_orders=desc&menuNo=500027">
											게임
										</a>
									</li>
									<li>
										<a href="/edu/onlineEdu/realm/list.do?p_ordersnm=ldate&p_orders=desc&menuNo=500027">
											만화,애니,캐릭터
										</a>
									</li>
									<li>
										<a href="/edu/onlineEdu/realm/list.do?p_ordersnm=ldate&p_orders=desc&menuNo=500027">
											문화일반
										</a>
									</li>
									<li>
										<a href="/edu/onlineEdu/realm/list.do?p_ordersnm=ldate&p_orders=desc&menuNo=500027">
											인문/경영/교양/일반
										</a>
									</li>
								</ul>
								<!-- nav 카테고리 two-daps end -->
							</li>
							<!-- nav 카테고리 one-daps end -->

							<!-- nav 사업안내 one-daps start -->
							<li>
								<a href="/edu/dream/mainRsltManage/list.do?menuNo=500040"   >
									사업안내
								</a>
								<!-- nav 이벤트 two-daps start -->
								<ul>
									<li>
										<a href="/edu/dream/mainRsltManage/list.do?menuNo=500040">
											창의인재동반
										</a>
									</li>
									<li>
										<a href="/edu/main/contents.do?menuNo=500110">
											실감콘텐츠창작
										</a>
									</li>
									<li>
										<a href="/edu/main/contents.do?menuNo=500263">
											AI콘텐츠창작
										</a>
									</li>
									<li>
										<a href="/edu/main/contents.do?menuNo=500179">
											콘텐츠원캠퍼스
										</a>
									</li>
									<li>
										<a href="/edu/main/contents.do?menuNo=500213">
											콘텐츠임팩트
										</a>
									</li>
									<li>
										<a href="/edu/progrm/master/list.do?prgSe=01&prgCl=13&menuNo=500215">
											콘텐츠인사이트
										</a>
									</li>
								<%--<li>
										<a href="#">
											에듀코카
										</a>
									</li>--%>
									<li>
										<a href="/edu/archiveUser/list.do?menuNo=500226&amp;workField=1">
											주요성과
										</a>
									</li>
								</ul>
								<!-- nav 사업안내 two-daps end -->
							</li>
							<!-- nav 사업안내 one-daps end -->

							<!-- nav 시설안내 one-daps start -->
							<li>
								<a href="/testbed/main/main.do?menuNo=500108"   >
									시설안내
								</a>
								<!-- nav 시설안내 two-daps start -->
								<ul>
									<li>
										<a href="/testbed/main/main.do?menuNo=500108">
											콘텐츠문화광장
										</a>
									</li>
									<li>
										<a href="/testbed/main/contents.do?menuNo=700133">
											콘텐츠인재캠퍼스
										</a>
									</li>
								</ul>
								<!-- nav 시설안내 two-daps end -->
							</li>
							<!-- nav 시설안내 one-daps end -->

							<sec:authorize ifAnyGranted="ROLE_USER">
							<!-- 학습지원 모바일 one-daps start -->
							<li class="nav_support_box mo">
								<a href="/testbed/main/main.do?menuNo=500108">
									학습지원
								</a>
								<!-- 학습지원 two-daps start -->
								<ul>
									<li><a href="/edu/member/logout.do" class="" title="학습가이드">학습가이드</a></li>
									<li><a href="/edu/onlineEdu/mylctrum/list.do?menuNo=500061" title="학습환경 설정">학습환경 설정</a></li>
									<li><a href="/edu/userMember/simpleLogin.do?menuNo=500058" title="원격지원서비스">원격지원서비스</a></li>
									<li><a href="/edu/job/empymnCnsl/empymnCnslListMypage.do?menuNo=500059" title="교육체계도">교육체계도</a></li>
								</ul>
								<!-- nav 학습지원 two-daps end -->
							</li>
							<!-- 학습지원 모바일 one-daps end -->
							</sec:authorize>
						</ul>
					</div>
					<div class="ml-auto searchCon">
						<!-- 로그인 후-->
						<sec:authorize ifAnyGranted="ROLE_USER">
							<div class="nav_support_box">
								<a href="/edu/main/contents.do?menuNo=500033">
									<img src="/edu/images/renew2022/ico_FAQ_white.png" alt="학습지원">
								</a>
								<ul>
									<li><a href="/edu/member/logout.do" class="" title="학습가이드">학습가이드</a></li>
									<li><a href="/edu/onlineEdu/mylctrum/list.do?menuNo=500061" title="학습환경 설정">학습환경 설정</a></li>
									<li><a href="/edu/userMember/simpleLogin.do?menuNo=500058" title="원격지원서비스">원격지원서비스</a></li>
									<li><a href="/edu/job/empymnCnsl/empymnCnslListMypage.do?menuNo=500059" title="교육체계도">교육체계도</a></li>
								</ul>
							</div>
							<div class="nav_my_box pc">
								<a href="/edu/onlineEdu/mylctrum/list.do?menuNo=500061">
									<img src="/edu/images/renew2022/my.png" alt="마이페이지">
								</a>
								<ul>
									<li><a href="/edu/member/logout.do" class="ico4 logoutBtn" title="로그아웃">로그아웃</a></li>
									<li id="myPageMenu"><a href="/edu/onlineEdu/mylctrum/list.do?menuNo=500061" title="마이페이지">마이페이지</a></li>
									<li><a href="/edu/userMember/simpleLogin.do?menuNo=500058" title="간편로그인 설정">간편로그인 설정</a></li>
									<li><a href="/edu/job/empymnCnsl/empymnCnslListMypage.do?menuNo=500059" title="1:1컨설팅내역">1:1컨설팅내역</a></li>
									<li><a href="/edu/progrm/applcnt/listMypage.do?menuNo=500064" title="프로그램 신청/접수">프로그램 신청/접수</a></li>
									<li><a href="/edu/progrm/applcnt/listMypage.do?menuNo=500064" title="나의 문의내역">나의 문의내역</a></li>
								</ul>
							</div>
							<input type="image" src="/edu/images/renew2022/all_menu_white.png" class="gnb_menu" alt="GNB 메뉴" style="padding:0;">
						</sec:authorize>
						<!-- 로그인 전-->
						<sec:authorize ifNotGranted="ROLE_USER">
							<c:url var="loginUrl" value="/edu/member/forLogin.do">
								<c:param name="menuNo" value="500077" />
								<c:param name="_targetUrl" value="${_targetUrl}" />
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
					<!-- pc 햄버거 버튼 눌렀을때 start-->
					<div class="collapse navbar-collapse" id="main_nav_full">

						<div class="cy_navbar-nav">
							<a href="/" class="navbar-brand" title="콘텐츠인재캠퍼스 에듀코카 로고 - 콘텐츠인재캠퍼스 메인으로 이동">
								<img src="/edu/new_image/main/logo.png" alt="콘텐츠인재캠퍼스 에듀코카 로고 - 콘텐츠인재캠퍼스 메인으로 이동">
							</a>
							<input type="image" src="/edu/img/gnb_close.png" class="gnb_close" alt="GNB 메뉴 닫기" style="padding:0;">
							<h2>콘텐츠커리큘럼</h2>
							<div class="cy_contents_box">
								<div class="cy_list_box">
									<h3>방송영상</h3>
									<ul>
										<li><a href="">방송영상 기획 Track</a></li>
										<li><a href="">방송영상 제작(촬영/편집) Track</a></li>
										<li><a href="">방송영상 비즈니스 Track</a></li>
										<li><a href="">방송영상 교양 Track</a></li>
									</ul>
								</div>

								<div class="cy_list_box">
									<h3>게임</h3>
									<ul>
										<li><a href="">게임 기획 Track</a></li>
										<li><a href="">게임 제작(그래픽/프로그래밍) Track</a></li>
										<li><a href="">게임 비즈니스 Track</a></li>
										<li><a href="">게임 교양 Track</a></li>
									</ul>
								</div>

								<div class="cy_list_box">
									<h3>만화/애니/캐릭터</h3>
									<ul>
										<li><a href="">만화/애니/캐릭터 기획 Track</a></li>
										<li><a href="">만화/애니/캐릭터 제작 Track</a></li>
										<li><a href="">만화/애니/캐릭터 비즈니스 Track</a></li>
										<li><a href="">만화/애니/캐릭터 교양 Track</a></li>
									</ul>
								</div>

								<div class="cy_list_box">
									<h3>음악공연/문화일반</h3>
									<ul>
										<li><a href="">음악공연/문화일반 기획 Track</a></li>
										<li><a href="">음악공연/문화일반 제작 Track</a></li>
										<li><a href="">음악공연/문화일반 비즈니스 Track</a></li>
										<li><a href="">음악공연/문화일반 교양 Track</a></li>
									</ul>
								</div>
							</div>
						</div>

						<!--
                        renew이전 nav
                        <ul class="navbar-nav">

                            <li>
                                <a href="/edu/onlineEdu/realm/list.do?p_ordersnm=ldate&amp;p_orders=desc&amp;menuNo=500027"   >
                                    온라인교육
                                </a>
                                <ul>
                                    <li>
                                        <a href="/edu/onlineEdu/mylctrum/list.do?menuNo=500159"  >
                                            나의 강의실
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/edu/onlineEdu/realm/list.do?p_ordersnm=ldate&amp;p_orders=desc&amp;menuNo=500027"  >
                                            정규과정
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/edu/onlineEdu/openLecture/list.do?sortOrder=newOrdr&amp;menuNo=500085"  >
                                            열린강좌
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/edu/onlineEdu/themeLecture/list.do?menuNo=500157"  >
                                            테마과정
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/edu/bbs/B0000048/list.do?menuNo=500203"  >
                                            에듀코카이야기
                                        </a>
                                        <ul>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="/edu/main/contents.do?menuNo=500033"  >
                                            학습지원
                                        </a>
                                        <ul>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="/edu/main/contents.do?menuNo=500005"  >
                                            기업맞춤교육지원
                                        </a>
                                        <ul>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="/edu/dream/mainRsltManage/list.do?menuNo=500040"   >
                                    오프라인교육
                                </a>
                                <ul>
                                    <li>
                                        <a href="/edu/dream/mainRsltManage/list.do?menuNo=500040"  >
                                            창의인재동반
                                        </a>
                                        <ul>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="/edu/main/contents.do?menuNo=500263"  >
                                            AI 콘텐츠 창작
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/edu/main/contents.do?menuNo=500110"  >
                                            실감 콘텐츠 창작
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/edu/main/contents.do?menuNo=500179"  >
                                            콘텐츠원캠퍼스
                                        </a>
                                        <ul>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="/edu/main/contents.do?menuNo=500213"  >
                                            콘텐츠임팩트
                                        </a>
                                        <ul>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="/edu/progrm/master/list.do?prgSe=01&amp;prgCl=13&amp;menuNo=500215"  >
                                            콘텐츠인사이트
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/edu/progrm/master/list.do?prgSe=01&amp;prgCl=12&amp;menuNo=500216"  >
                                            콘텐츠스텝업
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>

                                <a href="/testbed/main/main.do?menuNo=500108"   >
                                    교육 인프라
                                </a>
                                <ul>

                                    <li>
                                        <a href="/testbed/main/contents.do?menuNo=700101"  >
                                            콘텐츠문화광장
                                        </a>
                                        <ul>
                                            <li class="">
                                                <a	href="/testbed/bbs/B0000061/list.do?menuNo=700112" >
                                                    공지사항
                                                </a>
                                            </li>
                                            <li class="">
                                                <a	href="/testbed/main/contents.do?menuNo=700101" >
                                                    콘텐츠문화광장 소개
                                                </a>
                                            </li>
                                            <li class="">
                                                <a	href="/testbed/main/contents.do?menuNo=700103" >
                                                    시설 안내
                                                </a>
                                            </li>
                                            <li class="">
                                                <a	href="/testbed/main/contents.do?menuNo=700108" >
                                                    대관 안내
                                                </a>
                                            </li>
                                            <li class="">
                                                <a	href="/testbed/concert/info/rentList.do?menuNo=700137&amp;selectedMonth=-1&amp;listType=2" >
                                                    대관 현황
                                                </a>
                                            </li>
                                            <li class="">
                                                <a	href="/testbed/main/contents.do?menuNo=700104" >
                                                    찾아오시는 길
                                                </a>
                                            </li>
                                            <li class="">
                                                <a	href="/testbed/bbs/B0000066/list.do?menuNo=700126" >
                                                    자료실
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="/testbed/main/contents.do?menuNo=700133"  >
                                            콘텐츠인재캠퍼스
                                        </a>
                                        <ul>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="/edu/bbs/B0000011/list.do?menuNo=500220"   >
                                    함께 : 톡톡
                                </a>
                                <ul>

                                    <li>
                                        <a href="/edu/bbs/B0000011/list.do?menuNo=500008"  >
                                            공지사항
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/edu/bbs/B0000046/list.do?menuNo=500073"  >
                                            FAQ
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/edu/bbs/B0000076/list.do?menuNo=500221"  >
                                            함께 : 톡톡
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="/edu/archiveUser/list.do?menuNo=500226&amp;workField=1"   >
                                    성과 아카이브
                                </a>
                                <ul>
                                    <li>
                                        <a href="/edu/archiveUser/list.do?menuNo=500251&amp;workField=1"  >
                                            주요성과
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/edu/archiveUser/contentsList.do?menuNo=500259&amp;workField=1"  >
                                            콘텐츠 창의인재동반
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/edu/archiveUser/contentsList.do?menuNo=500260&amp;workField=3"  >
                                            콘텐츠 원캠퍼스
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/edu/archiveUser/contentsList.do?menuNo=500261&amp;workField=4"  >
                                            콘텐츠 임팩트
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/edu/archiveUser/contentsList.do?menuNo=500262&amp;workField=2"  >
                                            실감콘텐츠창작
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/edu/archiveUser/contentsList.do?menuNo=500264&amp;workField=5"  >
                                            AI연계콘텐츠창작
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>-->
					</div>
					<!-- pc 햄버거 버튼 눌렀을때 end -->
				</nav>
			</div>
		</header>
		<!-- //header end -->
		<div class="contents_section">
			<div class="main_visual_contents">
				<div class="swiper-container" id="main_visual_slide" draggable="true">
					<div class="swiper-wrapper">
						<div class="swiper-slide" style="background-image:url('/edu/images/renew2022/main_benner01.png'); background-size:cover; background-position:center;"></div>
						<div class="swiper-slide" style="background-image:url('/edu/images/renew2022/main_benner01.png'); background-size:cover; background-position:center;"></div>
						<div class="swiper-slide" style="background-image:url('/edu/images/renew2022/main_benner01.png'); background-size:cover; background-position:center;"></div>
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
							<span class="title">공지사항</span>
							<div class="list_box notice_list_box swiper-container">
								<ul class="swiper-wrapper">
									<c:forEach var="result" items="${B0000011List}" end="3" varStatus="status">
										<li class="swiper-slide">
											<a href="/edu/bbs/<c:out value="${result.bbsId}"/>/view.do?nttId=<c:out value="${result.nttId}"/>&amp;menuNo=500008">
												<span class="abbreviation<c:if test="${status.first}">2</c:if>"><c:out value="${result.nttSj}"/></span>
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
							<a href="/edu/bbs/B0000011/list.do?menuNo=500008">더보기</a>
						</div>
					</div>
				</div>
			</div>
			<!-- SNS / 공지사항 end -->
			<!-- 추천과정/ 수강한 과정 start -->
			<div class="main_online_contents">
				<div class="container">
					<!-- 창작자를 위한 추천과정 start -->
					<div class="fwo_card_list_box fwo_card01">
						<span class="main_title">창작자를 위한 추천 과정!</span>
						<div class="fwo_card swiper-container">
							<ul class="swiper-wrapper">
								<li class="swiper-slide">
									<!-- 썸네일 start -->
									<div class="fwo_snail_box">
										<a href=""><img src="/edu/images/renew2022/fwo_snail01.png" alt="이미지 설명들어가는 곳"></a>

										<!-- 설명란 start-->
										<div class="fwo_info_box">
											<h3 class="fwo_tit_box"><a href="">누구나 따라하면 문제가 생기는 문제라고 선택의 방법</a></h3>
											<p>온라인교육ㆍ유통</p>
											<a href="" class="go_page_a"></a>
											<!-- <button type="button" class="fwo_like_box"><img src="/edu/images/renew2022/ico_like_off.png" alt="좋아요"></button>  -->
										</div>
										<!-- 설명란 start-->

									</div>
									<!-- 썸네일 end -->

								</li>

								<li class="swiper-slide">
									<!-- 썸네일 start -->
									<div class="fwo_snail_box">
										<a href=""><img src="/edu/images/renew2022/fwo_snail01.png" alt="이미지 설명들어가는 곳"></a>

										<!-- 설명란 start-->
										<div class="fwo_info_box">
											<h3 class="fwo_tit_box"><a href="">누구나 따라하면 문제가 생기는 문제라고 선택의 방법</a></h3>
											<p>온라인교육ㆍ유통</p>
											<a href="" class="go_page_a"></a>
											<!-- <button type="button" class="fwo_like_box"><img src="/edu/images/renew2022/ico_like_off.png" alt="좋아요"></button>  -->
										</div>
										<!-- 설명란 start-->

									</div>
									<!-- 썸네일 end -->

								</li>

								<li class="swiper-slide">
									<!-- 썸네일 start -->
									<div class="fwo_snail_box">
										<a href=""><img src="/edu/images/renew2022/fwo_snail01.png" alt="이미지 설명들어가는 곳"></a>

										<!-- 설명란 start-->
										<div class="fwo_info_box">
											<h3 class="fwo_tit_box"><a href="">누구나 따라하면 문제가 생기는 문제라고 선택의 방법</a></h3>
											<p>온라인교육ㆍ유통</p>
											<a href="" class="go_page_a"></a>
											<!-- <button type="button" class="fwo_like_box"><img src="/edu/images/renew2022/ico_like_off.png" alt="좋아요"></button>  -->
										</div>
										<!-- 설명란 start-->

									</div>
									<!-- 썸네일 end -->

								</li>

								<li class="swiper-slide">
									<!-- 썸네일 start -->
									<div class="fwo_snail_box">
										<a href=""><img src="/edu/images/renew2022/fwo_snail01.png" alt="이미지 설명들어가는 곳"></a>

										<!-- 설명란 start-->
										<div class="fwo_info_box">
											<h3 class="fwo_tit_box"><a href="">누구나 따라하면 문제가 생기는 문제라고 선택의 방법</a></h3>
											<p>온라인교육ㆍ유통</p>
											<a href="" class="go_page_a"></a>
											<!-- <button type="button" class="fwo_like_box"><img src="/edu/images/renew2022/ico_like_off.png" alt="좋아요"></button>  -->
										</div>
										<!-- 설명란 start-->

									</div>
									<!-- 썸네일 end -->

								</li>

								<li class="swiper-slide">
									<!-- 썸네일 start -->
									<div class="fwo_snail_box">
										<a href=""><img src="/edu/images/renew2022/fwo_snail01.png" alt="이미지 설명들어가는 곳"></a>

										<!-- 설명란 start-->
										<div class="fwo_info_box">
											<h3 class="fwo_tit_box"><a href="">누구나 따라하면 문제가 생기는 문제라고 선택의 방법</a></h3>
											<p>온라인교육ㆍ유통</p>
											<a href="" class="go_page_a"></a>
											<!-- <button type="button" class="fwo_like_box"><img src="/edu/images/renew2022/ico_like_off.png" alt="좋아요"></button>  -->
										</div>
										<!-- 설명란 start-->

									</div>
									<!-- 썸네일 end -->

								</li>
							</ul>

						</div>
						<!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
						<div class="swiper_btn_box">
							<div class="swiper-button-prev"></div>
							<div class="swiper-button-next"></div>
						</div>

					</div>
					<!-- 창작자를 위한 추천과정 end -->

					<!-- 나만 빼고 다 수강한 과정 start -->
					<div class="fwo_card_list_box fwo_card02">
						<span class="main_title">나만 빼고 다 수강한 과정!</span>
						<div class="fwo_card swiper-container">
							<ul class="swiper-wrapper">
								<li class="swiper-slide">
									<!-- 썸네일 start -->
									<div class="fwo_snail_box">
										<a href=""><img src="/edu/images/renew2022/fwo_snail01.png" alt="이미지 설명들어가는 곳"></a>

										<!-- 설명란 start-->
										<div class="fwo_info_box">
											<h3 class="fwo_tit_box"><a href="">누구나 따라하면 문제가 생기는 문제라고 선택의 방법</a></h3>
											<p>온라인교육ㆍ유통</p>
											<a href="" class="go_page_a"></a>
											<!-- <button type="button" class="fwo_like_box"><img src="/edu/images/renew2022/ico_like_off.png" alt="좋아요"></button>  -->
										</div>
										<!-- 설명란 start-->

									</div>
									<!-- 썸네일 end -->

								</li>

								<li class="swiper-slide">
									<!-- 썸네일 start -->
									<div class="fwo_snail_box">
										<a href=""><img src="/edu/images/renew2022/fwo_snail01.png" alt="이미지 설명들어가는 곳"></a>

										<!-- 설명란 start-->
										<div class="fwo_info_box">
											<h3 class="fwo_tit_box"><a href="">누구나 따라하면 문제가 생기는 문제라고 선택의 방법</a></h3>
											<p>온라인교육ㆍ유통</p>
											<a href="" class="go_page_a"></a>
											<!-- <button type="button" class="fwo_like_box"><img src="/edu/images/renew2022/ico_like_off.png" alt="좋아요"></button>  -->
										</div>
										<!-- 설명란 start-->

									</div>
									<!-- 썸네일 end -->

								</li>

								<li class="swiper-slide">
									<!-- 썸네일 start -->
									<div class="fwo_snail_box">
										<a href=""><img src="/edu/images/renew2022/fwo_snail01.png" alt="이미지 설명들어가는 곳"></a>

										<!-- 설명란 start-->
										<div class="fwo_info_box">
											<h3 class="fwo_tit_box"><a href="">누구나 따라하면 문제가 생기는 문제라고 선택의 방법</a></h3>
											<p>온라인교육ㆍ유통</p>
											<a href="" class="go_page_a"></a>
											<!-- <button type="button" class="fwo_like_box"><img src="/edu/images/renew2022/ico_like_off.png" alt="좋아요"></button>  -->
										</div>
										<!-- 설명란 start-->

									</div>
									<!-- 썸네일 end -->

								</li>

								<li class="swiper-slide">
									<!-- 썸네일 start -->
									<div class="fwo_snail_box">
										<a href=""><img src="/edu/images/renew2022/fwo_snail01.png" alt="이미지 설명들어가는 곳"></a>

										<!-- 설명란 start-->
										<div class="fwo_info_box">
											<h3 class="fwo_tit_box"><a href="">누구나 따라하면 문제가 생기는 문제라고 선택의 방법</a></h3>
											<p>온라인교육ㆍ유통</p>
											<a href="" class="go_page_a"></a>
											<!-- <button type="button" class="fwo_like_box"><img src="/edu/images/renew2022/ico_like_off.png" alt="좋아요"></button>  -->
										</div>
										<!-- 설명란 start-->

									</div>
									<!-- 썸네일 end -->

								</li>

								<li class="swiper-slide">
									<!-- 썸네일 start -->
									<div class="fwo_snail_box">
										<a href=""><img src="/edu/images/renew2022/fwo_snail01.png" alt="이미지 설명들어가는 곳"></a>

										<!-- 설명란 start-->
										<div class="fwo_info_box">
											<h3 class="fwo_tit_box"><a href="">누구나 따라하면 문제가 생기는 문제라고 선택의 방법</a></h3>
											<p>온라인교육ㆍ유통</p>
											<a href="" class="go_page_a"></a>
											<!-- <button type="button" class="fwo_like_box"><img src="/edu/images/renew2022/ico_like_off.png" alt="좋아요"></button>  -->
										</div>
										<!-- 설명란 start-->

									</div>
									<!-- 썸네일 end -->

								</li>

								<li class="swiper-slide">
									<!-- 썸네일 start -->
									<div class="fwo_snail_box">
										<a href=""><img src="/edu/images/renew2022/fwo_snail01.png" alt="이미지 설명들어가는 곳"></a>

										<!-- 설명란 start-->
										<div class="fwo_info_box">
											<h3 class="fwo_tit_box"><a href="">누구나 따라하면 문제가 생기는 문제라고 선택의 방법</a></h3>
											<p>온라인교육ㆍ유통</p>
											<a href="" class="go_page_a"></a>
											<!-- <button type="button" class="fwo_like_box"><img src="/edu/images/renew2022/ico_like_off.png" alt="좋아요"></button>  -->
										</div>
										<!-- 설명란 start-->

									</div>
									<!-- 썸네일 end -->

								</li>
							</ul>

						</div>
						<!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
						<div class="swiper_btn_box">
							<div class="swiper-button-prev"></div>
							<div class="swiper-button-next"></div>
						</div>

					</div>
					<!-- 나만 빼고 다 수강한 과정 end -->
				</div>
			</div>
			<!-- 추천과정/ 수강한 과정 end -->

			<!-- 아이콘카테고리(방송영상,게임,만애캐,문화일반,인경교일) start -->
			<div class="main_news_contents">
				<div class="container">
					<div class="swiper-container">

						<ul class="swiper-wrapper">
							<li class="swiper-slide">
								<a href="javascript:void(0);" onclick="fnCmdSearchList('B0', '', '', '', ''); return false;">방송영상</a>
							</li>
							<li class="swiper-slide">
								<a href="javascript:void(0);" onclick="fnCmdSearchList('G0', '', '', '', ''); return false;">게임</a>
							</li>
							<li class="swiper-slide">
								<a href="javascript:void(0);" onclick="fnCmdSearchList('K0', '', '', '', ''); return false;">만화/애니/캐릭터</a>
							</li>
							<li class="swiper-slide">
								<a href="javascript:void(0);" onclick="fnCmdSearchList('O0', '', '', '', ''); return false;">문화일반(음악공연)</a>
							</li>
							<li class="swiper-slide">
								<a href="javascript:void(0);" onclick="fnCmdSearchList('S0', '', '', '', ''); return false;">인문/경영/교양/일반</a>
							</li>
						</ul>

						<!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
						<div class="swiper_btn_box">
							<div class="swiper-button-prev"></div>
							<div class="swiper-button-next"></div>
						</div>

					</div>
				</div>
			</div>
			<!-- 아이콘카테고리(방송영상,게임,만애캐,문화일반,인경교일) end -->

			<!-- 곧 만나 볼 수 있어요 start -->
			<div class="main_offline_contents">
				<div class="container">
					<div class="fwo_card_list_box fwo_card03">
						<span class="main_title main_title_bold">곧 만나 볼 수 있어요</span>
						<div class="fwo_card swiper-container">
							<ul class="swiper-wrapper">
								<li class="swiper-slide">
									<!-- 썸네일 start -->
									<div class="fwo_snail_box">
										<a href=""><img src="/edu/images/renew2022/fwo_snail01.png" alt="이미지 설명들어가는 곳">
											<!-- <span class="tag_on">예약알림</span> -->
										</a>
									</div>
									<!-- 썸네일 end -->

									<!-- 설명란 start-->
									<div class="fwo_info_box">
										<h3 class="fwo_tit_box"><a href="">누구나 따라하면 문제가 생기는 문제라고 선택의 방법</a></h3>
										<p>[이벤트]</p>
										<a href="" class="go_page_a"></a>

									</div>
									<!-- 설명란 start-->
								</li>

								<li class="swiper-slide">
									<!-- 썸네일 start -->
									<div class="fwo_snail_box">
										<a href=""><img src="/edu/images/renew2022/fwo_snail01.png" alt="이미지 설명들어가는 곳">
											<!-- <span class="tag_off">예약알림</span> -->
										</a>
									</div>
									<!-- 썸네일  end -->

									<!-- 설명란 start-->
									<div class="fwo_info_box">
										<h3 class="fwo_tit_box"><a href="">누구나 따라하면 문제가 생기는 문제라고 선택의 방법</a></h3>
										<p>[이벤트]</p>
										<a href="" class="go_page_a"></a>

									</div>
									<!-- 설명란 start-->
								</li>

								<li class="swiper-slide">
									<!-- 썸네일 start -->
									<div class="fwo_snail_box">
										<a href=""><img src="/edu/images/renew2022/fwo_snail01.png" alt="이미지 설명들어가는 곳">
											<!-- <span class="tag_on">예약알림</span> -->
										</a>
									</div>
									<!-- 썸네일 end -->

									<!-- 설명란 start-->
									<div class="fwo_info_box">
										<h3 class="fwo_tit_box"><a href="">누구나 따라하면 문제가 생기는 문제라고 선택의 방법</a></h3>
										<p>[이벤트]</p>
										<a href="" class="go_page_a"></a>

									</div>
									<!-- 설명란 start-->
								</li>

								<li class="swiper-slide">
									<!-- 썸네일 start -->
									<div class="fwo_snail_box">
										<a href=""><img src="/edu/images/renew2022/fwo_snail01.png" alt="이미지 설명들어가는 곳">
											<!-- <span class="tag_off">예약알림</span> -->
										</a>
									</div>
									<!-- 썸네일 end -->

									<!-- 설명란 start-->
									<div class="fwo_info_box">
										<h3 class="fwo_tit_box"><a href="">누구나 따라하면 문제가 생기는 문제라고 선택의 방법</a></h3>
										<p>[이벤트]</p>
										<a href="" class="go_page_a"></a>

									</div>
									<!-- 설명란 start-->
								</li>


							</ul>

						</div>
						<!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
						<div class="swiper_btn_box">
							<div class="swiper-button-prev"></div>
							<div class="swiper-button-next"></div>
						</div>

					</div>
				</div>
			</div>
			<!-- 곧 만나 볼 수 있어요 end -->

			<!-- KOCCA에서 만날 수 있는 특별한 교육 사업 start -->
			<div class="main_study_contents">
				<div class="container">
					<span class="main_title main_title_bold">KOCCA에서 만날 수 있는 특별한 교육 사업</span>
					<!--<p class="go_add_btn_box"><a href="">전체보기</a></p>-->
					<div class="three_card01 swiper-container">
						<ul class="three_card_list_box swiper-wrapper">
							<li class="swiper-slide">
								<div class="three_card_top_box">
									<span class="circle_snail_box"><img src="/edu/images/renew2022/biz_01.png" alt="창의인재동반"></span>
									<h3>창의인재동반</h3>
									<p>대한민국 콘텐츠 산업의 미래를 이끌어갈 우수한 콘텐츠 창작자 육성</p>
								</div>
								<div class="three_card_bottom_box">
									<a href="" alt="창의인재동반 바로가기">바로가기</a>
								</div>
							</li>

							<li class="swiper-slide">
								<div class="three_card_top_box">
									<span class="circle_snail_box"><img src="/edu/images/renew2022/biz_02.png" alt="AI콘텐츠 창작"></span>
									<h3>AI콘텐츠 창작</h3>
									<p>문화 콘텐츠 융복합 AI 프로젝트 혁신인재 양성</p>
								</div>
								<div class="three_card_bottom_box">
									<a href="" alt="AI콘텐츠 창작 바로가기">바로가기</a>
								</div>
							</li>

							<li class="swiper-slide">
								<div class="three_card_top_box">
									<span class="circle_snail_box"><img src="/edu/images/renew2022/biz_03.png" alt="실감 콘텐츠 창작"></span>
									<h3>실감 콘텐츠 창작</h3>
									<p>산업계 실수요 맞춤형 실감 콘텐츠 창의인재 양성</p>
								</div>
								<div class="three_card_bottom_box">
									<a href="" alt="실감 콘텐츠 창작 바로가기">바로가기</a>
								</div>
							</li>

							<li class="swiper-slide">
								<div class="three_card_top_box">
									<span class="circle_snail_box"><img src="/edu/images/renew2022/biz_04.png" alt="콘텐츠원캠퍼스"></span>
									<h3>콘텐츠원캠퍼스</h3>
									<p>산·학·연·관 협력 체계 기반의 융복합 인재 양성</p>
								</div>
								<div class="three_card_bottom_box">
									<a href="" alt="콘텐츠원캠퍼스 바로가기">바로가기</a>
								</div>
							</li>

							<li class="swiper-slide">
								<div class="three_card_top_box">
									<span class="circle_snail_box"><img src="/edu/images/renew2022/biz_05.png" alt="콘텐츠임팩트"></span>
									<h3>콘텐츠임팩트</h3>
									<p>고급 크리에이터 및 문화기술개발자를 발굴·양성하는 한국콘텐츠진흥원의 인재 양성 사업</p>
								</div>
								<div class="three_card_bottom_box">
									<a href="" alt="콘텐츠임팩트 바로가기">바로가기</a>
								</div>
							</li>

							<li class="swiper-slide">
								<div class="three_card_top_box">
									<span class="circle_snail_box"><img src="/edu/images/renew2022/biz_06.png" alt="콘텐츠 인사이트"></span>
									<h3>콘텐츠 인사이트</h3>
									<p>국내외 거장급 전문가 초청 열린 세미나를 통해 콘텐츠산업계 인사이트 제공</p>
								</div>
								<div class="three_card_bottom_box">
									<a href="" alt="콘텐츠 인사이트 바로가기">바로가기</a>
								</div>
							</li>

							<li class="swiper-slide">
								<div class="three_card_top_box">
									<span class="circle_snail_box"><img src="/edu/images/renew2022/biz_07.png" alt="콘텐츠 스텝업"></span>
									<h3>콘텐츠 스텝업</h3>
									<p>콘텐츠산업 트렌드를 반영한 단기특강 및 심화 교육</p>
								</div>
								<div class="three_card_bottom_box">
									<a href="" alt=">콘텐츠 스텝업 바로가기">바로가기</a>
								</div>
							</li>
						</ul>

						<!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
						<div class="swiper_btn_box">
							<div class="swiper-button-prev"></div>
							<div class="swiper-button-next"></div>
						</div>
					</div>

				</div>
			</div>
			<!-- KOCCA에서 만날 수 있는 특별한 교육 사업 end -->

			<!-- kocca는 창작자 여러분에게 열려 있습니다 start -->
			<div class="main_place_contents">
				<div class="container">
					<span class="main_title main_title_bold">KOCCA는 창작자 여러분에게 열려 있습니다.</span>
					<div class="swiper-container one_card01">
						<ul class="swiper-wrapper">

							<li class="swiper-slide">
								<span class="place_snail_box"><img src="/edu/images/renew2022/open_benner01.png" alt=""></span>
								<div class="place_txt_box">
									<h3>콘텐츠 문화 광장</h3>
									<p class="place_info_box">
										콘텐츠문화광장은 융복합 콘텐츠의 테스트베드(TEST BED)로서
										블랙박스 구조의 스테이지66과 스튜디오1, 2, 연습실 등을 갖추고
										콘텐츠 산업의 미래를 여는 역할을 하고 있습니다.
									</p>
									<p class="go_add_btn_box"><a href="">전체보기</a></p>
								</div>
							</li>

							<li class="swiper-slide">
								<span class="place_snail_box"><img src="/edu/images/renew2022/open_benner02.png" alt=""></span>
								<div class="place_txt_box">
									<h3>콘텐츠 문화 광장</h3>
									<p class="place_info_box">
										콘텐츠문화광장은 융복합 콘텐츠의 테스트베드(TEST BED)로서
										블랙박스 구조의 스테이지66과 스튜디오1, 2, 연습실 등을 갖추고
										콘텐츠 산업의 미래를 여는 역할을 하고 있습니다.
									</p>
									<p class="go_add_btn_box"><a href="">전체보기</a></p>
								</div>
							</li>

						</ul>
					</div>

				</div>
			</div>
			<!-- kocca는 창작자 여러분에게 열려 있습니다 end -->


		</div>
		<!-- footer -->
		<div id="menu5" class="menu5">
			<!-- 정보보호인증마크 JS -->
			<script type="text/javascript" src="https://www.eprivacy.or.kr/seal/mark.js"></script>
			<script type="text/javascript">
				function winMarkPopup(theURL,winName,features) { //v2.0
					window.open(theURL,winName,features);
				}
			</script>
			<!-- 정보보호인증마크 JS -->

			<!-- footer -->
			<div id="footer" class="col-12">
				<div class="container">
					<div class="col-xl-8 col-lg-12 col-md-12">
						<ul>
							<li><a href="javascript:winMarkPopup('http://www.kocca.kr/cop/contents.do?menuNo=200931','','status=yes,scrollbars=yes,width=1280,height=800')"
								   class="footer_link_item fontweight400" title="새창열림">개인정보처리방침</a></li>
							<li><a href="/edu/main/contents.do?menuNo=500072" class="footer_link_item">이용약관</a></li>
							<li><a href="/edu/bbs/B0000011/list.do?menuNo=500008" class="footer_link_item">공지사항</a></li>
							<li><a href="/edu/bbs/B0000046/list.do?menuNo=500073" class="footer_link_item">FAQ</a></li>
							<li><a href="/edu/main/contents.do?menuNo=500227" class="footer_link_item">찾아오시는길</a></li>
						</ul>
						<span>본 페이지에 게시된 이메일주소가 자동 수집되는 것을 거부하며, 이를 위반시 정보통신법에 의해 처벌됨을 유념하시기 바랍니다.</span>
						<ul>
							<li>홍릉분원 : [02456] 서울특별시 동대문구 회기로 66</li>
							<li>본원 : [58217] 전라남도 나주시 교육길 35 한국콘텐츠진흥원 | 사업자번호 : 105-82-17272</li>
							<li>온라인교육 02-6310-0770</li>
							<li>Copyright 2015. Korea Creative Content Agency all rights reserved.</li>
						</ul>
						<br/>
					</div>
					<div class="col-xl-4 col-lg-12 col-md-12 ml-auto">
						<!-- <a href="/edu/main/contents.do?menuNo=500091" class="app_download"><img src="/edu/new_image/download.jpg" alt="아카데미앱 다운로드"></a> -->
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
						<!-- onchange="window.open(this.options[this.selectedIndex].value,'_blank')" -->
						<div class="relation_site_link">
							<select class="relation_site" name="relation_site" id="relation_site"
									title="관련사이트 바로가기">
								<option value="">관련사이트</option>
								<option value="http://www.mcst.go.kr/main.jsp">문화체육관광부</option>
								<option value="http://www.kocca.kr/cop/main.do">한국콘텐츠진흥원</option>
								<option value="http://www.kgq.or.kr/service/pub/IntroServlet">게임국가자격기술검정</option>
							</select>
							<input type="button" value="이동" onclick="window.open(document.getElementById('relation_site').value,'_blank')" title="관련사이트 새창열림" class="relation_site_button">
							<label for="relation_site"><span style="display:block; font-size:0; height:0; line-height:0; margin:0; overflow:hidden; padding:0; width:0">관련사이트 바로가기</span></label>
							<ul class="footer_util_link">
								<li>
									<a href="https://www.eprivacy.or.kr/front/certifiedSiteMark/certifiedSiteMarkPopup.do?certCmd=EP&certNum=2021-EP-R040" target="_black"><img src="https://www.eprivacy.or.kr/images/mng/sub/mark1_eprivacy_plus.png"  alt="개인정보보호인증 마크" title="개인정보보호인증 새창열림"></a>
								</li>
								<!--<li><a href="#none" onclick="markPopupI('2019-R044');" title="새창열림">
                                        <img src="https://www.eprivacy.or.kr/seal/mark_i.gif" alt="인터넷 사이트 안전마크(i-Safe, 개인정보보호, 시스템보안, 소비자 보호)">
                                    </a></li>
                                    <li><a href="#none" onclick="markPopupE('2019-R105');" title="새창열림">
                                        <img src="https://www.eprivacy.or.kr/seal/mark_e.gif" alt="개인정보보호우수사이트(ePrivacy) 인증마크">
                                    </a></li> -->
								<!-- <li>
                                    <img src="https://www.eprivacy.or.kr/seal/mark_i.gif" alt="인터넷 사이트 안전마크(i-Safe, 개인정보보호, 시스템보안, 소비자 보호)">
                                </li>
                                <li>
                                    <img src="https://www.eprivacy.or.kr/seal/mark_e.gif" alt="개인정보보호우수사이트(ePrivacy) 인증마크">
                                </li>
                                <li><a href="javascript:winMarkPopup('https://www.goodcontent.kr/upload_public/CERTIDW/2018-11-0008_0qx41u74mh4728j20181119134932.png','','status=yes,scrollbars=no,width=430,height=560');" title="새창열림">
                                    <img alt="굿콘텐츠 서비스 인증 마크" src="/edu/images/bm/footer_util_link_003.png">
                                </a></li> -->
								<li>
									<img alt="굿콘텐츠 서비스 인증 마크" src="/edu/images/bm/footer_util_link_003.png">
								</li>
								<li><a href="javascript:winMarkPopup('/contents/temp/04_elearning.html','','status=yes,scrollbars=no,width=430,height=560');" title="한국u러닝연합회 e러닝전문기관인증 새창열림" >
									<img src="/edu/images/bm/footer_util_link_004.png" alt="한국u러닝연합회 e러닝전문기관인증 마크">
								</a></li>
								<li><a href="javascript:winMarkPopup('/contents/temp/01_contents_certificate.html','','status=yes,scrollbars=no,width=430,height=560');" title="교육기부기관 교육부 Donation for Education 새창열림">
									<img src="/edu/images/bm/footer_util_link_005.png" alt="교육기부기관 교육부 Donation for Education 마크">
								</a></li>
								<li><a href="javascript:winMarkPopup('/contents/temp/internet_comunication_satisfaction_2020.html','','status=yes,scrollbars=no,width=430,height=575');" title="대한민국인터넷소통대상 (ICSI)인증 새창열림">
									<img src="/edu/images/bm/internet_comunication_satisfaction_logo_2019.png" alt="대한민국인터넷소통대상 (ICSI)인증마크">
								</a></li>
								<li><a href="javascript:winMarkPopup('/contents/temp/08_contents_certificate.html','','status=yes,scrollbars=no,width=430,height=560');" title="에코어워드 인증  새창열림">
									<img src="/edu/images/bm/footer_util_link_006.png" alt="에코어워드 인증 마크">
								</a></li>
								<!-- <li><a href="javascript:winMarkPopup('/contents/temp/2019_brand_selected_by_Consumer.html','','status=yes,scrollbars=no,width=430,height=560');" title="새창열림">
                                    <img alt="2019 소비자가 뽑은 올해의 브랜드 대상" src="/edu/images/bm/footer_util_link_007.png">
                                </a></li> -->
								<li><a href="http://www.webwatch.or.kr/Situation/WA_Situation.html?MenuCD=110" title="WA 품질인증 마크, 웹와치(WebWatch) 2022.02.09~ 2023.02.08" target="_blank"><img src="/edu/images/bm/web_watch_mark.png" border="0" alt="과학기술정보통신부 WA(WEB접근성) 품질인증 마크, 웹와치(WebWatch) 2022.02.09 ~ 2023.02.08"/>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--     <div class="col-12 mobile_to_pc_view_btn_con">
                    <a href="https://edu.kocca.kr/edu/main/main.do?mobileTp=Y" class="mobile_btn_style_0">
                        PC버전
                    </a>
                    <a href="javascript:void(0)" class="mobile_btn_style_0 go_up_btn">
                        페이지 상단
                    </a>
                </div> -->
			<!-- //footer -->

			<iframe name="ssoAuthFrame" id="ssoAuthFrame" style="width:0px;height:0px;border:0;" src="http://edusso.kocca.dev.kr/sso/member/checkSSO.do?service=edu&amp;menuNo=&amp;userTp=0" title="SSO 로그인 유무확인 프레임 입니다."></iframe>

			<script>
				(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
					(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
						m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
				})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

				ga('create', 'UA-96105088-12', 'auto');
				ga('send', 'pageview');

			</script>

			<script type="text/javascript">
				<!-- UX분석 뷰저블 -->
						(function(w, d, a){
							w.__beusablerumclient__ = {
								load : function(src){
									var b = d.createElement("script");
									b.src = src; b.async=true; b.type = "text/javascript";
									d.getElementsByTagName("head")[0].appendChild(b);
								}
							};w.__beusablerumclient__.load(a);
						})(window, document, '//rum.beusable.net/script/b170309e165707u559/204ae352d6');
				<!-- UX분석 뷰저블 -->

				// 공지사항 세로 슬라이드
				var swiper7 = new Swiper('.notice_list_box', {
					autoplay: 4000
					,loot: true
					,speed : 700
					,direction: 'vertical' // 슬라이드 진행방향은 수평(vertical하면 수직으로 움직임)
					,slidesPerView: 1 // 한번에 보이는 슬라이드 갯수
					,spaceBetween: 0 // 슬라이드 사이의 간격 px 단위
					,autoplayDisableOnInteraction: false

				});

				/* $(document).ready(function () {
                     var newWindowWidth = $(window).width();
                     if(newWindowWidth > 765) {*/



			</script>
		</div>
		<!-- //footer -->
	</div>
	</div>
	<%--<div class="op_bg_box"></div>--%>

	<!-- 원본 -->

	<%--<div id="wrap" class="over-hidden">
		<header>
			<div class="container h-100">
				<div class="header_util_wrap">
					<div class="show vm header_util_text_con">
    					<span class="show vm fontsize14 header_util_item">
							<a href="#visual_searchBox" class="ico3" title="본문으로" tabindex="1">본문으로</a>
						</span>
						<sec:authorize ifAnyGranted="ROLE_USER">
                            	<spanss="show vm fontsize14 header_util_item header-name-tag"> class="name_color"><c:out value="${userVO.userNm }"/></span>님 로그인중입니다.
                            </span>
							<span class="show vm fontsize14 header_util_item">
				            	<a href="/edu/member/logout.do" class="ico4 logoutBtn" title="로그아웃">로그아웃</a>
				            </span>
							<span class="show vm fontsize14 header_util_item" style="position:relative;" id="myPageMenu">
					            <a href="/edu/onlineEdu/mylctrum/list.do?menuNo=500061" class="ico5" title="마이페이지">
					            	마이페이지
					            </a>
				            </span>
						</sec:authorize>
						<sec:authorize ifNotGranted="ROLE_USER">
							<c:url var="loginUrl" value="/edu/member/forLogin.do">
								<c:param name="menuNo" value="500077" />
								<c:param name="_targetUrl" value="${_targetUrl}" />
							</c:url>
							<span class="show vm fontsize14 header_util_item">
                           		<a href="/edu/member/forLogin.do?menuNo=500077" class="ico1" title="로그인">로그인</a>
                           	</span>
							<span class="show vm fontsize14 header_util_item">
				            	<a href="/edu/member/join01.do?menuNo=500076" class="ico2" title="회원가입">회원가입</a>
				            </span>
						</sec:authorize>
						<span class="show vm fontsize14 header_util_item">
   							<a href="/edu/main/contents.do?menuNo=500074" class="ico3" title="사이트맵">사이트맵</a>
   						</span>
					</div>
					<div class="show vm header_util_icon_con">
				        <span class="show header_util_icon_item">
					        <a href="https://www.facebook.com/edukocca" target="_blank" title="새창열림">
					        	<img src="/edu/images/bm/facebook_icon.png" alt="페이스북 바로가기">
					        </a>
				        </span>
						<span class="show header_util_icon_item">
					        <a href="https://twitter.com/edukocca" target="_blank" title="새창열림">
					        	<img src="/edu/images/bm/twitter_icon.png" alt="트위터 바로가기">
					        </a>
				        </span>
						<span class="show header_util_icon_item">
					        <a href="https://blog.naver.com/edukocca" target="_blank" title="새창열림">
					        	<img src="/edu/images/bm/blog_icon.png" alt="블로그 바로가기">
					        </a>
				        </span>
						<span class="show header_util_icon_item">
					        <a href="https://www.youtube.com/channel/UCJ78W_fNjOW7A-lZ6uEClgA" target="_blank" title="새창열림">
					        	<img src="/edu/new_image/youtube_icon.png" alt="유튜브 바로가기">
					        </a>
				        </span>
						<span class="show header_util_icon_item">
					        <a href="https://www.instagram.com/edu.kocca/" target="_blank" title="새창열림">
					        	<img src="/edu/new_image/instargram_icon.png" alt="인스타그램 바로가기">
					        </a>
				        </span>
					</div>
				</div>

				<nav class="navbar navbar-expand-xl">
					<a href="/" class="navbar-brand" title="콘텐츠인재캠퍼스 에듀코카 로고 - 콘텐츠인재캠퍼스 메인으로 이동">
						<img src="/edu/new_image/main/logo.png" alt="콘텐츠인재캠퍼스 에듀코카 로고 - 콘텐츠인재캠퍼스 메인으로 이동">
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main_nav" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="main_nav">
						<c:set var="topCategories" value="${menuAll5['menu_0']}" />
						<ul class="navbar-nav">
							<c:forEach var="x" begin="0" end="4">
								<li>
									<c:if test="${x eq depth01}">
										<c:set var="1depth_title" value="${topCategories[x].menuNm}"/>
									</c:if>
									<a href="${topCategories[x].fullMenuLink}" ${x eq depth01 ? 'class="active"' : ''} ${topCategories[x].menuPopupYn eq 'Y' ? 'target="_blank" title="새창열림"' : ''} >
											${topCategories[x].menuNm}
									</a>
									<c:set var="d02MenuKey" value="menu_${topCategories[x].menuNo}" />
									<c:set var="d02Categories" value="${menuAll5[d02MenuKey]}" />
									<c:if test="${fn:length(d02Categories)>0}">
										<c:set var="curD02" value="${curD02Categories[depth02]}" />
										<c:set var="curD" value="${curD02Categories[depth02]}" />
										<c:if test="${topCategories[x].menuNo == '500108'}">
											<c:set var="curD02Categories" value="${menuAll7[d01menuKey]}" />
											<c:set var="d02MenuKey" value="menu_700000" />
											<c:set var="d02Categories" value="${menuAll7[d02MenuKey]}" />
											<c:set var="curD02" value="${curD02Categories[depth02]}" />
											<c:set var="curD" value="${curD02Categories[depth02]}" />
										</c:if>
										<ul>
											<c:forEach var="y" begin="0" end="${fn:length(d02Categories)-1}">
												<li>
													<a href="${d02Categories[y].fullMenuLink}" ${y eq depth02 ? 'class="on"' : ''} ${d02Categories[y].menuPopupYn eq 'Y' ? 'target="_blank" title="새창열림"' : ''}>
															${d02Categories[y].menuNm}
													</a>
													<c:set var="d03menuKey" value="menu_${d02Categories[y].menuNo}" />
													<c:choose>
														<c:when test="${topCategories[x].menuNo == '500108'}">
															<c:set var="d03Categories" value="${menuAll7[d03menuKey]}" />
														</c:when>
														<c:otherwise>
															<c:set var="d03Categories" value="${menuAll5[d03menuKey]}" />
														</c:otherwise>
													</c:choose>
													<c:if test="${fn:length(d03Categories)>0}">
														<ul>
															<c:forEach var="z" begin="0"	end="${fn:length(d03Categories)-1}">
																<c:set var="clss2" value="${y eq depth02 && z eq depth03 ? 'on' : ''}" />
																<c:if test="${y eq depth02 && z eq depth03}">
																	<c:set var="curD" value="${d03Categories[z]}" />
																	<c:set var="curD03" value="${d03Categories[z]}" />
																</c:if>
																<c:if test="${d02Categories[y].menuNo eq '700001' || d02Categories[y].menuNo eq '700006' || d02Categories[y].menuNo eq '700005'}">
																	<li class="${clss2}">
																		<a	href="${d03Categories[z].fullMenuLink}" ${d03Categories[z].menuPopupYn eq 'Y' ? 'target="_blank" title="새창열림"':''}>
																				${d03Categories[z].menuNm}
																		</a>
																	</li>
																</c:if>
															</c:forEach>
														</ul>
													</c:if>
												</li>
											</c:forEach>
										</ul>
									</c:if>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="ml-auto searchCon" style="height:29px;">
						&lt;%&ndash; <input type="image" src="/edu/images/bm/search_icon.png" id="all_search_label" style="padding:0;" alt="통합검색"> &ndash;%&gt;
						<!-- 검색창
						<span class="show vm tl input_con">
							&lt;%&ndash; 					        <form name="frmSearch2" method="post" action="/edu/search/list.do?menuNo=500079" onsubmit="return search2(this);">
                                                            <input type="text" class="q2" name="q" id="q2" placeholder="검색어를 입력해주세요." title="검색어를 입력해주세요.">
                                                            <input type="image" src="/edu/images/bm/search_icon.png" alt="검색 확인" class="all_search_image">
                                                        </form> &ndash;%&gt;
						</span>
						<!-- //검색창 -->
						<input type="image" src="/edu/img/gnb_icon.png" class="gnb_menu" alt="GNB 메뉴" style="padding:0;">
						<input type="image" src="/edu/img/gnb_close.png" class="gnb_close" alt="GNB 메뉴 닫기" style="padding:0;">
					</div>
				</nav>
			</div>
		</header>
		<!-- //header -->
		<div class="contents_section">
			<div class="main_visual_contents">
				<div class="swiper-container" id="main_visual_slide" draggable="true">
					<div class="swiper-wrapper">
						<div class="swiper-slide" style="background-image:url('/edu/new_image/background/new_visual_Image1.png'); background-size:cover; background-position:center;"></div>
						<div class="swiper-slide" style="background-image:url('/edu/new_image/background/new_visual_Image2.png'); background-size:cover; background-position:center;"></div>
						<div class="swiper-slide" style="background-image:url('/edu/new_image/background/new_visual_Image3.png'); background-size:cover; background-position:center;"></div>
						<!-- //반복 -->
					</div>
				</div>
				<div class="container">
					<div class="visual_searchBox" id="visual_searchBox">
						<span>에듀코카</span>
						<span>미래 콘텐츠 산업을 주도할<br/>융합형 창의 인재양성의 허브</span>

						<!-- <form>
                            <input type="text" id="all_search_keyword">
                            <label for="all_search_keyword">과정명을 입력하세요 <span>(태그검색)</span></label>
                            <a href="javascript:void(0);" class="all_search_btn"></a>
                        </form> -->
					</div>
					<!-- 대메뉴 카드배너 -->
					<div class="main_slide_banner">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<!-- 반복 -->
								<c:forEach var="result" items="${mainPopupList }" varStatus="status">
									<div class="swiper-slide">
										<div>
											<span><c:out value="${result.nttCn}"/></span>
											<span class="abbreviation3">
				            					<c:set var="bannerText1" value="${result.ntcnNm}"/>
				            					<c:out escapeXml="false" value="${fn:replace(bannerText1, '　', '<br>')}"/>
				            				</span>
											<a href="<c:out value="${result.ntcnUrl}"/>" <c:if test="${result.popupAt eq 'Y'}">target="_blank" title="새창열림"</c:if>">바로가기</a>
										</div>
									</div>
								</c:forEach>
								<!-- //반복 -->
							</div>
						</div>
						<div class="main-slide-banner-button-contents">
							<div class=" swiper-pagination"></div>
							<button class="swiper-button-play"><img src="/edu/new_image/icon/play_icon.png" alt="배너 재생"></button>
							<button class="swiper-button-pause"><img src="/edu/new_image/icon/pause_icon.png" alt="배너 정지"></button>
						</div>
					</div>

					<div class="visual_menu_icon">
						<ul>
							<li>
								<a href="/edu/onlineEdu/realm/list.do?p_ordersnm=ldate&p_orders=desc&menuNo=500027">
									<img src="/edu/new_image/icon/mainIcon01.png" alt="정규과정 아이콘">
									<span>정규과정</span>
								</a>
							</li>
							<li>
								<a href="/edu/onlineEdu/openLecture/list.do?sortOrder=newOrdr&menuNo=500085">
									<img src="/edu/new_image/icon/mainIcon02.png" alt="열린강좌 아이콘">
									<span>열린강좌</span>
								</a>
							</li>
							<li>
								<a href="/edu/onlineEdu/edcsystm/list.do?menuNo=500207">
									<img src="/edu/new_image/icon/mainIcon04.png" alt="교육체계도 아이콘">
									<span>교육체계도</span>
								</a>
							</li>
							<li>
								<a href="/edu/bbs/B0000048/list.do?menuNo=500205">
									<img src="/edu/new_image/icon/mainIcon05.png" alt="이벤트 아이콘">
									<span>이벤트</span>
								</a>
							</li>
							<li>
								<a href="/edu/main/contents.do?menuNo=500033">
									<img src="/edu/new_image/icon/mainIcon07.png"  alt="학습지원 아이콘">
									<span>학습지원</span>
								</a>
							</li>
							<li>
								<a href="/edu/main/contents.do?menuNo=500005">
									<img src="/edu/new_image/icon/mainIcon08.png" alt="기업맞춤교육지원 아이콘">
									<span>기업맞춤교육지원</span>
								</a>
							</li>
						</ul>
					</div>

				</div>
			</div>
			<div class="main_online_contents">
				<div class="container">
					<span class="main_title">온라인 교육</span>
					<form id="frm" name="frm" action="/edu/onlineEdu/realm/list.do?menuNo=50027" method="post" class="main_online_category">
						<input type="hidden" name="pGubun1" id="pGubun1" value="">
						<input type="hidden" name="pGubun2" id="pGubun2" value="">
						<input type="hidden" name="pGubun3" id="pGubun3" value="">
						<input type="hidden" name="p_ordersnm" id="p_ordersnm" value="ldate">
						<input type="hidden" name="p_orders" id="p_orders" value="desc">
						<input type="hidden" name="pageIndex" id="pageIndex" value="">
						<div>
							<div>
								<span class="title_large">온라인 교육</span>
								<span class="title_small">ONLINE EDUCATION</span>
								<span></span>
							</div>
							<img src="/edu/new_image/main/onlineCategory01.jpg" alt="온라인교육">
						</div>
						<div>
							<div>
								<span class="title_small">BROADCAST VIDEO</span>
								<span class="title_large">방송영상</span>
								<a href="javascript:void(0);" onclick="fnCmdSearchList('B0', '', '', '', ''); return falst;">
									바로가기
								</a>
							</div>
							<img src="/edu/new_image/main/onlineCategory02.jpg" alt="방송영상">
						</div>
						<div>
							<div>
								<span class="title_small">GAME PRODUCTION</span>
								<span class="title_large">게임</span>
								<a href="javascript:void(0);" onclick="fnCmdSearchList('G0', '', '', '', ''); return false;">
									바로가기
								</a>
							</div>
							<img src="/edu/new_image/main/onlineCategory03.jpg" alt="게임">
						</div>
						<div>
							<div>
								<span class="title_small">CARTOON & CHARACTER</span>
								<span class="title_large">만화/애니/캐릭터</span>
								<a href="javascript:void(0);" onclick="fnCmdSearchList('K0', '', '', '', ''); return false;">
									바로가기
								</a>
							</div>
							<img src="/edu/new_image/main/onlineCategory04.jpg" alt="만화/애니/캐릭터">
						</div>
						<div>
							<div>
								<span class="title_small">CULTURE</span>
								<span class="title_large">문화일반</span>
								<a href="javascript:void(0);" onclick="fnCmdSearchList('O0', '', '', '', ''); return false;">
									바로가기
								</a>
							</div>
							<img src="/edu/new_image/main/onlineCategory05.jpg" alt="문화일반">
						</div>
						<div>
							<div>
								<span class="title_small">HUMANITIES MANAGEMENT LIBERAL ARTS</span>
								<span class="title_large">인문/경영/교양</span>
								<a href="javascript:void(0);" onclick="fnCmdSearchList('S0', '', '', '', ''); return false;">
									바로가기
								</a>
							</div>
							<img src="/edu/new_image/main/onlineCategory06.jpg" alt="인문/경영/교육">
						</div>
					</form>
				</div>
			</div>

			<div class="main_news_contents">
				<div class="container">
					<span class="main_title">소식</span>

					<div class="news_slide_banner">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<!-- 반복 -->
								<c:forEach var="result" items="${mainPopupList }" varStatus="status">
									<div class="swiper-slide">
										<a href="<c:out value="${result.ntcnUrl}"/>" <c:if test="${result.popupAt eq 'Y'}">target="_blank" title="새창열림"</c:if>">
										<!--  <span style="display: none;">배너입니다.</span> -->
										<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${result.atchFileId}"/>&fileSn=<c:out value="${result.fileSn}"/>"  alt="<c:out value="${result.ntcnNm}"/>">
										</a>
									</div>
								</c:forEach>
								<!-- //반복 -->
							</div>
						</div>
						<div class="wrap-autoplay-control">
							<button class="start" aria-pressed="true" aria-label="자동 재생 시작" title="자동 재생 시작"></button>
							<button class="stop" aria-pressed="false" aria-label="자동 재생 일시 정지" title="자동 재생 일시 정지"></button>
						</div>
						<div class=" swiper-pagination"></div>
					</div>
					<div class="news_notice_list">
						<span class="title">공지사항</span>
						<div class="list_box">
							<ul>
								<c:forEach var="result" items="${B0000011List}" end="3" varStatus="status">
									<li>
										<a href="/edu/bbs/<c:out value="${result.bbsId}"/>/view.do?nttId=<c:out value="${result.nttId}"/>&amp;menuNo=500008">
											<span class="abbreviation<c:if test="${status.first}">2</c:if>"><c:out value="${result.nttSj}"/></span>
											<span>
	                                        	<fmt:parseDate var="dateFmt" pattern="yyyy-MM-dd" value="${fn:substring(result.regDate,0,10)}"/>
	                                        	<fmt:formatDate var="dateTempParse" pattern="yyyy.MM.dd" value="${dateFmt}"/>
	                                        	<c:out value="${dateTempParse}"/>
	                                        </span>
										</a>
									</li>ㅂ
								</c:forEach>
							</ul>
						</div>
						<a href="/edu/bbs/B0000011/list.do?menuNo=500008">더보기</a>
					</div>
					<div class="news_archive_list" style="padding: 0;">
						<div class="list_box" style="margin: 0;">
							<a href="/edu/bbs/B0000011/view.do?nttId=75072&delCode=0&menuNo=500008&pageIndex=1" style="width: 100%;">
								<img src="/archive/images/mainArchiveBanner.png" alt="에듀코카(eduKOCCA) 수어자막 서비스 OPEN" style="width: 100%; height: 312px;">
							</a>
						</div>
						<a href="/edu/onlineEdu/realm/list.do?p_ordersnm=ldate&p_orders=desc&menuNo=500027">더보기</a>
					</div>
				</div>
			</div>
			<div class="main_offline_contents">
				<div class="container">
					<ul>
						<li>
							<span>오프라인교육</span>
							<div>
								<ul>
									<c:forEach var="result" items="${offlineEduList}" varStatus="status" end="2">
										<c:choose>
											<c:when test="${result.prgCl eq '12'}">
												<c:set var="subMenuNum" value="500216" />
											</c:when>
											<c:when test="${result.prgCl eq '13'}">
												<c:set var="subMenuNum" value="500215" />
											</c:when>
											<c:when test="${result.prgCl eq '16'}">
												<c:set var="subMenuNum" value="500224" />
											</c:when>
											<c:when test="${result.prgCl eq '14'}">
												<c:set var="subMenuNum" value="500219" />
											</c:when>
										</c:choose>
										<li>
											<a href="/edu/progrm/master/view.do?prgSn=${result.prgSn}&menuNo=${subMenuNum}&prgSe=01&prgCl=${result.prgCl}&siteSe=edu&pageIndex=1">
												<span class="abbreviation"><c:out value="${result.prgNm}" /></span>
												<span>${fn:substring(result.prgBgnde,0,10)}</span>
											</a>
										</li>
									</c:forEach>
								</ul>
							</div>
						</li>
						<li>
							<span>교육지원사업</span>
							<div>
								<ul>
									<c:forEach var="result" items="${eduSuportList}" varStatus="status" end="2">
										<c:choose>
											<c:when test="${result.bbsId eq 'B0000041'}">
												<c:set var="subMenuNum" value="500211" />
											</c:when>
											<c:when test="${result.bbsId eq 'B0000072'}">
												<c:set var="subMenuNum" value="500212" />
											</c:when>
										</c:choose>
										<li>
											<a href="/edu/bbs/${result.bbsId}/view.do?nttId=${result.nttId}&delCode=0&menuNo=${subMenuNum}&pageIndex=1" style="width:100%;">
												<span class="abbreviation">${result.nttSj}</span>
												<span>${result.frstRegistPnttm}</span>
											</a>
										</li>
									</c:forEach>
								</ul>
							</div>
						</li>
						<li>
							<span>콘텐츠인재캠퍼스 시설 안내</span>
							<div></div>
							<a href="/testbed/main/contents.do?menuNo=700135">바로가기</a>
						</li>
						<li>
							<span>콘텐츠문화광장 시설 안내</span>
							<div></div>
							<a href="/testbed/main/contents.do?menuNo=700108">바로가기</a>
						</li>
					</ul>
				</div>
			</div>

		</div>--%>
		<!-- footer -->
		<div id="menu5" class="menu5">
			<jsp:include page="/WEB-INF/jsp/edu/inc/eduFooter.jsp" flush="true" />
		</div>
		<!-- //footer -->
	</div>--%>
</body>
</html>