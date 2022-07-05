<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
	<link rel="stylesheet" type="text/css" href="/edu/css/common.css">
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/layout.css"/>

<c:choose>
	<c:when test="${param.menuNo eq '500205'}">
		<link rel="stylesheet"  href="//unpkg.com/swiper/swiper-bundle.min.css"/>
	</c:when>
	<c:when test="${param.menuNo eq '500203'}">
		<link rel="stylesheet"  href="//unpkg.com/swiper/swiper-bundle.min.css"/>
	</c:when>
	<c:otherwise>
		<link rel="stylesheet" type="text/css" href="/edu/js/bm/swiper/swiper.min.css"/>
	</c:otherwise>
</c:choose>

	<link rel="stylesheet" type="text/css" href="/edu/css/bm/animate.min.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/bootstrap.reset.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/common_prev.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/flaticon.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/ie.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/portfolio.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/search.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/sub.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/submain.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/common.css">
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/wevenResponsive.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/main.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/sub_layout.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/sub_page.css"/>
	<link rel="stylesheet" type="text/css" href="/js/jquery-ui/jquery-ui.css" />

	<c:if test="${param.menuNo  eq '500034' || param.menuNo  eq '500046'}">
		<link rel="stylesheet" type="text/css" href="/edu/css/submain.css" />
	</c:if>
	<c:if test="${param.menuNo  eq '500079'}">
		<link rel="stylesheet" href="/js/jquery-ui/ui-1.10.3/themes-smoothness-jquery-ui.css" />
	</c:if>
	
	<!-- 리뉴얼 추가 -->
	<link rel="stylesheet" type="text/css" href="/edu/css/new/header.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/new/css.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/new/footer.css"/>
	<!-- 리뉴얼 추가 끝 -->

	<!-- 라이브리 프로퍼티설정-->
	<!-- SNS에 포스팅될설명-->
	<meta property="og:description" content="에듀코카"/>
	<!-- SNS에 포스팅될사이트URL -->
	<meta property="og:site" content="https://edu.kocca.kr"/>
	<!-- SNS에 포스팅될썸네일이미지-->
	<meta property="og:image" content="https://edu.kocca.kr/upload/about/koccaesc_logo.jpg"/>
	<!-- SNS 포스팅될타이틀값-->
	<!-- <meta property="og:title" content="한국콘텐츠아카데미"/> -->
	<!-- 프로퍼티설정끝 -->
	
	
	<!-- <script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script> -->
	<script type="text/javascript" src="/edu/js/new/jquery-ui/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/js/jquery.carouFredSel-6.2.1-packed.js"></script>
	<script type="text/javascript" src="/js/nwmatcher.js"></script>
	<script type="text/javascript" src="/js/selectivizr-min.js"></script>
	<script type="text/javascript" src="/js/jquery.cookies.js"></script>
	
	<script type="text/javascript" src="/js/jquery.sticky.js"></script>
	<script type="text/javascript" src="/js/jquery.scrollTo.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="/js/jquery.appear.js"></script>
	<script type="text/javascript" src="/js/modernizr.min.js"></script>
	<script type="text/javascript" src="/js/mousewheel.js"></script>
	<script type="text/javascript" src="/js/base64.js"></script>
	<script type="text/javascript" src="/js/ssl.js"></script>
	<script type="text/javascript" src="/js/miya_validator.js"></script>
	<script type="text/javascript" src="/js/jquery.maskedinput.min.js"></script>
	<script type="text/javascript" src="/edu/js/sub.js"></script>
	<script type="text/javascript" src="/edu/js/bm/bm.js"></script>
	<script type="text/javascript" src="/edu/js/bm/sub.js"></script>
	
	<script type="text/javascript" src="/edu/js/new/popper.min.js"></script>
	<script type="text/javascript" src="/edu/js/new/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="/edu/js/new/subjs.js"></script>
	
	<script type="text/javascript" src="/edu/js/new/mainHeader.js"></script>


	<!-- Link Swiper's 8.4.2 CSS -->
	<%--<link rel="stylesheet"  href="https://unpkg.com/swiper/swiper-bundle.min.css"/>--%>


	<link rel="stylesheet" href="/edu/css/renew2022/assets/plugins/animation/css/animate.min.css">
	<link rel="stylesheet" href="/edu/css/renew2022/assets/css/style.css">
	<link rel="stylesheet" href="/edu/css/renew2022/renew.css">
	<!-- renew2022 CSS end -->

	<!-- renew2022 JavaScript start -->

<c:choose>
	<c:when test="${param.menuNo eq '500205'}">
		<script src="//unpkg.com/swiper/swiper-bundle.min.js"></script>
	</c:when>
	<c:when test="${param.menuNo eq '500203'}">
		<script src="//unpkg.com/swiper/swiper-bundle.min.js"></script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript" src="/edu/js/bm/swiper/swiper.min.js"></script>
	</c:otherwise>
</c:choose>

	<script src="/edu/css/renew2022/renew.js"></script>
	<!-- Required Js -->
	<script src="/edu/css/renew2022/assets/js/vendor-all.min.js"></script>
	<script src="/edu/css/renew2022/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="/edu/css/renew2022/assets/js/pcoded.min.js"></script>

	<!-- sweet alert Js -->
	<script src="/edu/css/renew2022/assets/plugins/sweetalert/js/sweetalert.min.js"></script>
	<!-- Swiper8.4.2 JS -->
	<%--<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>--%>
	<script src="/edu/css/renew2022/assets/js/pages/ac-alert.js"></script>
	<!-- 챗봇js-->
	<script id="happytalkSDK" src="//design.happytalkio.com/sdk/happytalk.chat.v2.min.js"></script>

	<!-- renew2022 JavaScript end -->
	
<!-- 끝 -->


	<sec:authorize ifAnyGranted="ROLE_USER">
	<script type="text/javascript">
	//<![CDATA[
        var url = location.href;
        if (url.indexOf("/edu/userMember/reAgre.do") == -1 && url.indexOf("/edu/userMember/secsn.do") == -1 && url.indexOf("/edu/userMember/secsnRequest.do") == -1) {
			var reAgreDt = "<fmt:formatDate pattern="yyyyMMdd" value="${userVO.otherDt}" />";
			var nowDt = new Date();
			var yyyy = nowDt.getFullYear().toString();
		  	var mm = (nowDt.getMonth()+1).toString(); // getMonth() is zero-based
			var dd  = nowDt.getDate().toString();
			var today = yyyy + (mm[1]?mm:"0"+mm[0]) + (dd[1]?dd:"0"+dd[0]); // padding
			if (Number(reAgreDt) <= Number(today)) {
				alert("개인정보처리방침 재동의 후 사용하실 수 있습니다.");
				location.href = "/edu/userMember/reAgre.do?menuNo=500077${empty mode ? '' : '&mode=i'}";
			}
	    }
	//]]>
	<!-- 챗봇 Js start -->
	var ht = new Happytalk({
		siteId: '5000100237',
		siteName: '한국콘텐츠진흥원',
		categoryId: '146368',
		divisionId: '146369',
	});
	<!-- 챗봇 Js end -->
	</script>
	</sec:authorize>