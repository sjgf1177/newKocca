<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

	<!--
	<link rel="stylesheet" type="text/css" href="/js/bootstrap/css/bootstrap.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/bootstrap.reset.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/animate.min.css" />
	<link rel="stylesheet" type="text/css" href="/edu/css/common.css" />
	<link rel="stylesheet" type="text/css" href="/edu/css/layout.css" />
	<link rel="stylesheet" type="text/css" href="/edu/css/sub.css" />
	-->

<!-- 	<link rel="stylesheet" type="text/css" href="/js/bootstrap/css/bootstrap.kb.css"/> -->
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/animate.min.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/base.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/new/bootstrap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/bootstrap.reset.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/common_prev.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/contents.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/flaticon.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/ie.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/layout.css"/>
	<link rel="stylesheet" type="text/css" href="/edu/css/bm/member.css"/>
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

	<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="/js/nwmatcher.js"></script>
	<script type="text/javascript" src="/js/selectivizr-min.js"></script>
	<script type="text/javascript" src="/js/jquery.cookies.js"></script>
	<script type="text/javascript" src="/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/jquery.carouFredSel-6.2.1-packed.js"></script>
	<script type="text/javascript" src="/js/jquery.sticky.js"></script>
	<script type="text/javascript" src="/js/jquery.scrollTo.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="/js/jquery.appear.js"></script>
	<script type="text/javascript" src="/js/modernizr.min.js"></script>
	<script type="text/javascript" src="/js/mousewheel.js"></script>
	<script type="text/javascript" src="/js/tablesummary.js"></script>
	<script type="text/javascript" src="/js/base64.js"></script>
	<script type="text/javascript" src="/js/ssl.js"></script>
	<script type="text/javascript" src="/js/miya_validator.js"></script>
	<script type="text/javascript" src="/js/jquery.maskedinput.min.js"></script>
	<script type="text/javascript" src="/edu/js/sub.js"></script>
	<script type="text/javascript" src="/edu/js/bm/bm.js"></script>
	<script type="text/javascript" src="/edu/js/bm/sub.js"></script>


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

	</script>
	</sec:authorize>

<!--[if lt IE 9]>
	<link rel="stylesheet" href="/ckl/css/ie.css" type="text/css" />
	<script type="text/javascript" src="/js/bootstrap/html5shiv.min.js"></script>
	<script type="text/javascript" src="/js/respond.min.js"></script>
	<script type="text/javascript"> $('html').attr('id','ie');</script>
<![endif]-->

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
	<script src="assets/js/vendor-all.min.js"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/pcoded.min.js"></script>

	<!-- sweet alert Js -->
	<script src="assets/plugins/sweetalert/js/sweetalert.min.js"></script>
	<script src="assets/js/pages/ac-alert.js"></script>

	<!-- renew2022 JavaScript end -->