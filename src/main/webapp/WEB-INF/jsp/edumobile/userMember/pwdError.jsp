<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.com.cmm.service.Globals"%>
<%@ page import="org.springframework.util.StringUtils"%>
<%@ page import="kr.co.unp.util.CacheUtil"%>
<%@ page import="kr.co.unp.mpm.vo.*" %>
<%@ page import="kr.co.unp.member.vo.*" %>
<%@ page import="kr.co.unp.cmm.sec.ram.service.impl.UnpUserDetailsHelper" %>
<%@ page import="kr.co.unp.siteMng.service.*" %>
<%@ page import="kr.co.unp.mpm.service.MasterMenuManager"%>
<%@ page import="kr.co.unp.cmm.sec.ram.service.impl.SessionSavedRequestAwareAuthenticationHandler"%>
<%@ page import="kr.co.unp.util.ZValue"%>
<%@ page import="kr.co.unp.banner.vo.Banner"%>
<%@ page import="kr.co.unp.banner.service.BannerService"%>
<%@page import="egovframework.com.cmm.service.EgovProperties"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<c:set var="siteNm" value="${paramVO.service}"/>
<%
	String domain = request.getServerName();
	session.setAttribute("ssoDomain2", domain);
	
	String requestUri = request.getRequestURL().toString();
	String host = request.getRemoteHost();

	String menuNo = request.getParameter("menuNo");
	String siteNm = (String)pageContext.getAttribute("siteNm");  

	String contextScopeMenuAllName = MasterMenuManager.CONTEXT_SCOPE_MENU_PREFIX + SiteMngService.EDUMOBILE_SITE_ID;
	pageContext.setAttribute("contextScopeMenuAllName", contextScopeMenuAllName);
	org.springframework.context.ApplicationContext context =
			org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(getServletContext());
	HashMap<String, List<MenuManageVO>> menuMap = (HashMap<String, List<MenuManageVO>>)application.getAttribute(contextScopeMenuAllName);
	MasterMenuManager masterMenuManagerService = (MasterMenuManager)context.getBean("masterMenuManagerService");
	MenuManageVO currentVo = masterMenuManagerService.getCurrentMenu(menuMap, Integer.parseInt(menuNo));
	pageContext.setAttribute("currMenu", currentVo);
%>
<c:set var="pathData" value="${fn:split(currMenu.path, '|')}" />
<c:set var="pathData0" value="${pathData[0]}" />
<c:choose>
	<c:when test="${fn:indexOf(pathData0 , '?????????????????????') != -1 }">
		<c:set var="homeUrl" value="/edumobile/main/main.do?siteName=testbed"/>
	</c:when>
	<c:otherwise>
		<c:set var="homeUrl" value="/edumobile/main/main.do"/>
	</c:otherwise>
</c:choose>

<script type="text/javascript">
//<![CDATA[

	$(function(){

		crtfcPopup = function(authSe) { // ????????? ?????? ?????????
			var val = "<c:out value='${result.mbtlnum}'/>";

			window.open("/edu/userMember/crtfcPopup.do?viewType=BODY&authSe="+authSe+"&val="+val+"&mode=PE&checkIntercepter=edumobile", "crtfcPopup", "top=300, left=600, width=568, height=463, status=yes, resizable=yes, scrollbars=no");
		};

	});

//]]>
</script>

<c:choose>
	<c:when test="${result.authSe eq '01'}">

		<h2 class="fs5 tac">???????????? ????????? 5??? ???????????????. ??????????????? ????????? 5??? ?????? ?????? ?????? ???????????? <span class="fcBlack">??????????????????</span>??? ???????????????.</h2>

		<div class="boxGray  mt40 mb40 pt30 pb30">
			<p class="tac">
			?????? ?????? ??? ???????????? ???????????? <strong class="fs4">???????????? ?????????</strong> ????????? ??????????????????, ????????????  ??????????????? <strong class="fs4">???????????? ?????????</strong> ???????????? ????????????.
			 </p>
			<p class="mt20">
			<span class="fcRed">??? SNS(????????????, ?????????)??? ???????????? ?????? ?????? SNS ????????? ?????? ??? ???????????? ????????? ????????? ????????? ??????????????? </span>
			</p>

		</div>

		<div class="btnSet mt30" style="margin-bottom:80px">
			<a href="${homeUrl }" class="btn btn-primary">????????? ??????</a>
		</div>

	</c:when>

	<c:otherwise>
		<input type="hidden" id="userId" value="<c:out value='${result.userId}'/>" />
		<h2 class="fs5 tac">
			???????????? ????????? 5??? ???????????????. <br>
			??????????????? ????????? 5??? ?????? ?????? ?????? ???????????? ????????????????????? ???????????????.
			?????? ?????? ??? ???????????? <strong>?????????????????????</strong>??? ???????????? ???????????? ??????????????? ????????????.
		</h2>

		<div class="btnSet tac">
			<a href="javascript:crtfcPopup('02');" class="btn btn-primary">???????????????</a>
		</div>

		<!-- <div class="popBx">
			<span class="popLogo"><span class="sr-only">????????????????????????</span></span>
			<a href="#self" class="popClose"><span class="sr-only">????????? ??????</span></a>
			<h2>????????????</h2>

			<form action="">
				<fieldset>
					<legend>???????????? ??????</legend>

						<label for="PATHM_0"><input type="radio" name="PATHM" value="?????????" id="PATHM_0"> ??????????????? </label>
						<label for="PATHM_1"><input type="radio" name="PATHM" value="?????????" id="PATHM_1"> ??????????????? </label>
				</fieldset>
				<div class="pathM01">
					??????????????? <strong><a href="mailto:superart@naver.com" title="????????????" target="_blank">superart@naver.com</a></strong> ?????? ??????????????? ?????????????????????.<br>
					???????????? ???????????? ??????????????? ??????????????? ??????????????? ?????? ?????????.

					<a href="#self" class="btn btn-prmary">??????</a>
				</div>
				<div class="pathM02">
					??????????????? ?????? ??????????????? ???????????? ??? [??????]??? ???????????????.

					<div>
						<label for="AUTHNM">????????????</label>
						<input type="text" name="AUTHNM" id="AUTHNM" value="">
						<a href="#self" class="btn btn-default btn-sm btn-black">???????????? ?????????</a>
					</div>
					<div>
						<h4>??????????????? ???????????? ?????? ??????</h4>
						<ul>
							<li>???????????? ????????? ?????????.</li>
							<li>???????????????, ????????? ??? ?????? ?????? ??????, ??????????????? ????????? ?????????.</li>
							<li>?????? ?????? ?????? ??? ?????? ?????? ??? ???????????? ???????????????.</li>
						</ul>
					</div>

				</div>
			</form>
			<div class="btnSet">
				<button type="submit" class="btn btn-primary">??????</button>
				<a href="javascript:void(0);" class="btn btn-default">??????</a>
			</div>

		</div> -->

	</c:otherwise>
</c:choose>