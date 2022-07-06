<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="org.springframework.util.StringUtils"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.unp.member.vo.*"%>
<%@ page import="kr.co.unp.cmm.sec.ram.service.impl.UnpUserDetailsHelper"%>
<%@ page import="kr.co.unp.mpm.vo.MenuManageVO"%>
<%@ page import="kr.co.unp.mpm.service.MasterMenuManager"%>
<%@ page import="kr.co.unp.main.service.MainService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page import="kr.co.unp.util.ZValue"%>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>

<c:set var='siteName' value='${paramVO.siteName}' />
<%
	UsersVO user = UnpUserDetailsHelper.getAuthenticatedUser();
	pageContext.setAttribute("userVO", user);
	String menuNo = request.getParameter("menuNo");

	if (StringUtils.hasText(menuNo)) {

		org.springframework.context.ApplicationContext context = org.springframework.web.context.support.WebApplicationContextUtils
				.getWebApplicationContext(getServletContext());
		MasterMenuManager masterMenuManagerService = (MasterMenuManager) context
				.getBean("masterMenuManagerService");

		/* testbed20170830 */
		String siteName = (String) pageContext.getAttribute("siteName") != null
				? (String) pageContext.getAttribute("siteName")
				: "";
		HashMap<String, List<MenuManageVO>> menuMap = new HashMap<String, List<MenuManageVO>>();
		HashMap<String, List<MenuManageVO>> eduMenuMap = (HashMap<String, List<MenuManageVO>>) application
				.getAttribute("menuAll5");
		System.out.println(eduMenuMap);
		HashMap<String, List<MenuManageVO>> testbedMenuMap = (HashMap<String, List<MenuManageVO>>) application
				.getAttribute("menuAll7");
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
		int depth06 = Integer.parseInt(position.substring(10, 12)) - 1;
		if ("testbed".equals(siteName))//testbed20170830
			depth01 = 5;
		pageContext.setAttribute("depth01", depth01);
		pageContext.setAttribute("depth02", depth02);
		pageContext.setAttribute("depth03", depth03);
		pageContext.setAttribute("depth04", depth04);
		pageContext.setAttribute("depth05", depth05);
		pageContext.setAttribute("depth06", depth06);
	}
%>
<c:set var="pathData" value="${fn:split(currMenu.path, '|')}" />
<script type="text/javascript">
	//<![CDATA[
	function search2(form) {
		if (!form.q.value) {
			alert("검색어를 입력하세요.");
			$("#q2")[0].focus();
			return false;
		}
		return true;
	}
	function logoutSSO() {
		$.get("/${paramVO.siteName}/member/logout.json", function(data) {
			var retUrl = "${ssoDomain}/sso/member/logoutSSO.do?service=${paramVO.siteName}";
			//alert(retUrl);
			location.href = retUrl;
		}, "json");
		return false;
	}
	$(function() {
		$(".logoutBtn").click(function() {
			logoutSSO();
			return false;
		});
	});

	//과정 조회
	function fnCmdSearchCateList(gubun1, gubun2, gubun3, ordersnm, orders){
		$("#pGubun1").val(gubun1);
		$("#pageIndex").val("1");
		$("#p_sort").val("N");

		$("#frmCate").attr({
			action:"/edu/onlineEdu/realm/list.do?menuNo=<c:out value='${paramVO.menuNo }'/>",
			method:"post",
			target:"_self"
		});
		$("#frmCate").submit();
	}
	//]]>
</script>

<%--<header>
	<div class="container h-100">
		<div class="header_util_wrap">
			<div class="show vm header_util_text_con">
				&lt;%&ndash;<sec:authorize ifAnyGranted="ROLE_USER">
					<c:if test="${paramVO.siteName eq 'edu' }">
						<c:set var="mypageNm" value="마이페이지" />
						<c:set var="mypageUrl" value="/edu/onlineEdu/mylctrum/list.do?menuNo=500061" />
					</c:if>
					<c:if test="${paramVO.siteName eq 'testbed' }">
						<c:set var="mypageNm" value="마이페이지" />
						<c:set var="mypageUrl" value="/testbed/userMember/forUpdate.do?menuNo=700118" />
					</c:if>
					<span class="show vm fontsize14 header_util_item">
						<span class="name_color"><c:out value="${userVO.userNm }" /></span>님 로그인중입니다.
					</span>
					<span class="show vm fontsize14 header_util_item">
						<a href="/${paramVO.siteName}/member/logout.do" class="ico4 logoutBtn" title="로그아웃">로그아웃</a>
					</span>
					<span class="show vm fontsize14 header_util_item header-name-tag" style="position: relative;" id="myPageMenu">
						<a href="${mypageUrl}" class="ico5" title="${mypageNm}">
							${mypageNm}
						</a>
					</span>
				</sec:authorize>
				<sec:authorize ifNotGranted="ROLE_USER">
					<c:url var="loginUrl" value="/${paramVO.siteName}/member/forLogin.do">
						<c:param name="menuNo" value="500077" />
						<c:param name="_targetUrl" value="${_targetUrl}" />
					</c:url>
					<c:choose>
						<c:when test="${paramVO.siteName eq 'testbed'}">
							<span class="show vm fontsize14 header_util_item">
								<a href="javascript:document.getElementById('loginForm').submit();" class="ico1" title="로그인">로그인</a>
							</span>
							<form class="login_form" name="loginForm" id="loginForm" action="/edu/member/forLogin.do?menuNo=500077" method="post" style="display: none;">
								<input type="hidden" name="redirectUrl" value="/${paramVO.siteName}/main/main.do" />
							</form>
							<span class="show vm fontsize14 header_util_item">
								<a href="/testbed/member/join01.do?menuNo=700121" class="ico2" title="회원가입">회원가입</a>
							</span>
						</c:when>
						<c:otherwise>
							<span class="show vm fontsize14 header_util_item">
								<a href="/edu/member/forLogin.do?menuNo=500077" class="ico1" title="로그인">로그인</a>
							</span>
							<span class="show vm fontsize14 header_util_item">
								<a href="/edu/member/join01.do?menuNo=500076" class="ico2" title="회원가입">회원가입</a>
							</span>
						</c:otherwise>
					</c:choose>
				</sec:authorize>
				<span class="show vm fontsize14 header_util_item">
					<a href="/edu/main/contents.do?menuNo=500074" class="ico3" title="사이트맵">사이트맵</a>
				</span>
			</div>
			&ndash;%&gt;
			&lt;%&ndash;<div class="show vm header_util_icon_con">
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
			</div>&ndash;%&gt;
		</div>
		<!-- gnb 영역! -->
		<nav class="navbar navbar-expand-xl">
			<c:choose>
				<c:when test="${paramVO.siteName eq 'testbed'}">
					<a href="/testbed/main/main.do" class="navbar-brand">
						<img src="/edu/images/bm/multi_content_testbed_logo.png" alt="KOCCA(Create NeWave) 콘텐츠문화광장 (대한민국 영토, 콘텐츠로 넓힌다!)">
					</a>
				</c:when>
				<c:otherwise>
					<a href="/edu/main/main.do" class="navbar-brand">
						<img src="/edu/new_image/main/logo.png" alt="KOCCA(Create NeWave) 에듀코카 (대한민국 영토, 콘텐츠로 넓힌다!)">
					</a>
				</c:otherwise>
			</c:choose>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main_nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="nav_search_box">
				<input type="text" placeholder="검색어를 입력해주세요.">
				<button class="nav_search_btn"></button>
			</div>

			<!-- gnb -->
			<div class="collapse navbar-collapse" id="main_nav">
				<c:set var="topCategories" value="${menuAll5['menu_0']}" />
				<c:set var="curD" value="${topCategories[depth01]}" />

				<ul class="navbar-nav">
					<c:forEach var="x" begin="0" end="4">
						<li>
							<c:if test="${x eq depth01}">
								<c:set var="1depth_title" value="${topCategories[x].menuNm}" />
							</c:if>
							<a href="${topCategories[x].fullMenuLink}" ${depth01 eq x ? 'class="active"' : ''} ${topCategories[x].menuPopupYn eq 'Y' ? 'target="_blank" title="새창열림"' : ''}>
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
													<c:forEach var="z" begin="0" end="${fn:length(d03Categories)-1}">
														<c:set var="clss2" value="${y eq depth02 && z eq depth03 ? 'on' : ''}" />
														<c:if test="${y eq depth02 && z eq depth03}">
															<c:set var="curD" value="${d03Categories[z]}" />
															<c:set var="curD03" value="${d03Categories[z]}" />
														</c:if>
														<c:if test="${d02Categories[y].menuNo eq '700001' || d02Categories[y].menuNo eq '700006' || d02Categories[y].menuNo eq '700005'}">
															<li class="${clss2}">
																<a href="${d03Categories[z].fullMenuLink}" ${d03Categories[z].menuPopupYn eq 'Y' ? 'target="_blank" title="새창열림"':''}>
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
			<div class="ml-auto searchCon">
				<span class="nav_support_box"><a href=""><img src="/edu/images/renew2022/ico_FAQ_white.png" alt="학습지원"></a></span>
				<span class="nav_my_box"><a href=""><img src="/edu/images/renew2022/my.png" alt="마이페이지"></a></span>
				&lt;%&ndash; <input type="image" src="/edu/images/bm/search_icon.png" id="all_search_label" style="padding:0;" alt="통합검색"> &ndash;%&gt;
				<!-- 검색창 -->
				<span class="show vm tl input_con">
&lt;%&ndash; 					<form name="frmSearch2" method="post" action="/edu/search/list.do?menuNo=500079" onsubmit="return search2(this);">
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
</header>--%>
<c:out value=""/>
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
						<input type="image" src="/edu/images/renew2022/all_menu_white.png" class="gnb_menu" alt="GNB 메뉴" style="padding:0;">
						<a href="/edu/member/logout.do" class="ico4 logoutBtn" title="로그아웃" style="font-size: 18px; color: #fff; margin-left: 15px;">로그아웃</a>
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
						<a href="javascript:void(0);">
							이벤트
						</a>
						<!-- nav 이벤트 two-daps start -->
						<ul>
							<li>
								<a href="/edu/bbs/B0000048/list.do?menuNo=500203">
									에듀코카 이벤트
								</a>
							</li>
							<li>
								<a href="">
									교육신청하기
								</a>
							</li>
							<li>
								<a href="">
									공모참여하기
								</a>
							</li>
							<li>
								<a href="">
									종료이벤트
								</a>
							</li>
						</ul>
						<!-- nav 이벤트 two-daps end -->
					</li>
					<!-- nav 이벤트 one-daps end -->

					<!-- nav 카테고리 one-daps start -->
					<li>
						<a href="javascript:void(0);"<%-- onclick="fnCmdSearchCateList('B0', '', '', '', ''); return false;"--%>>
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
								<a href="javascript:void(0);" onclick="fnCmdSearchCateList('B0', '', '', '', ''); return false;">
									방송영상
								</a>
							</li>
							<li>
								<a href="javascript:void(0);" onclick="fnCmdSearchCateList('G0', '', '', '', ''); return false;">
									게임
								</a>
							</li>
							<li>
								<a href="javascript:void(0);" onclick="fnCmdSearchCateList('K0', '', '', '', ''); return false;">
									만화/애니/캐릭터
								</a>
							</li>
							<li>
								<a href="javascript:void(0);" onclick="fnCmdSearchCateList('M0', '', '', '', ''); return false;">
									문화일반(음악공연)
								</a>
							</li>
							<li>
								<a href="javascript:void(0);" onclick="fnCmdSearchCateList('S0', '', '', '', ''); return false;">
									인문/경영/교양/일반
								</a>
							</li>
<%--							<!-- 분류별 목록 s -->

							<c:forEach items="${categoryMenuMap }" var="item" varStatus="status">
								<c:if test="${(fn:length(item.code) < 3 && item.code ne 'O0' && item.code ne 'A' && item.code ne 'T0')}">
									<li ${selectedGubun } >
										<a href="javascript:void(0);" onclick="fnCmdSearchList('${item.code }', '', '', '', ''); return false;" ${selectedGubunAtag}>
												${item.codenm }
										</a>
									</li>
								</c:if>
							</c:forEach>
							<c:forEach items="${realmTabList }" var="item" varStatus="status">
								<c:if test="${(fn:length(item.code) < 3 && item.code ne 'O0' && item.code ne 'A' && item.code ne 'T0')}">
									<li ${selectedGubun } >
										<a href="javascript:void(0);" onclick="fnCmdSearchList('${item.code }', '', '', '', ''); return false;" ${selectedGubunAtag}>
												${item.codenm }
										</a>
									</li>
								</c:if>
							</c:forEach>
							<c:if test="${userVO.userId eq 'kkj9699' or userVO.userId eq 'jmh8263' or userVO.userId eq 'lee1'}">
								<li <c:if test="${param.pGubun1 eq 'T0' or param.gubun eq 'T0' }">class="active"</c:if>>
									<a href="javascript:void(0);" onclick="fnCmdSearchList('T0', '', '', '', ''); return false;">콘텐츠검수</a>
								</li>
							</c:if>--%>
						</ul>
						<!-- nav 카테고리 two-daps end -->
					</li>
					<!-- nav 카테고리 one-daps end -->

					<!-- nav 사업안내 one-daps start -->
					<li>
						<a href="javascript:void(0);">
							사업안내
						</a>
						<!-- nav 이벤트 two-daps start -->
						<ul>
							<li>
								<a href="/edu/progrm/master/list.do?prgSe=01&amp;prgCl=12&amp;menuNo=500216">
									콘텐츠스텝업
								</a>
							</li>
							<li>
								<a href="/edu/progrm/master/list.do?prgSe=01&prgCl=13&menuNo=500215">
									콘텐츠인사이트
								</a>
							</li>
							<li>
								<a href="/edu/main/contents.do?menuNo=500213">
									콘텐츠임팩트
								</a>
							</li>
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
						</ul>
						<!-- nav 사업안내 two-daps end -->
					</li>
					<!-- nav 사업안내 one-daps end -->

					<!-- nav 시설안내 one-daps start -->
					<li>
						<a href="javascript:void(0);">
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
								<li><a href="/edu/main/contents.do?menuNo=500033" title="지원서비스">지원서비스</a></li>
								<li><a href="/edu/bbs/B0000011/list.do?menuNo=500008" title="공지사항">공지사항</a></li>
								<li><a href="/edu/bbs/B0000076/list.do?menuNo=500221" title="함께:톡톡">함께:톡톡</a></li>
								<li><a href="/edu/bbs/B0000046/list.do?menuNo=500073" title="FAQ">FAQ</a></li>
								<li><a href="/edu/main/contents.do?menuNo=500005" title="기업맞춤교육지원">기업맞춤교육지원</a></li>
							</ul>
							<!-- nav 학습지원 two-daps end -->
						</li>
						<!-- 학습지원 모바일 one-daps end -->

						<!-- 마이페이지 모바일 one-daps start -->
						<li class="nav_support_box mo">
							<a href="/edu/onlineEdu/mylctrum/list.do?menuNo=500061">
								마이페이지
							</a>
							<!-- 마이페이지 모바일 two-daps start -->
							<ul>
								<li><a href="/edu/userMember/forUpdate.do?menuNo=500056" title="회원정보 수정">회원정보 수정</a></li>
								<li><a href="/edu/userMember/simpleLogin.do?menuNo=500058" title="간편로그인 설정">간편로그인 설정</a></li>
									<%--<li><a href="/edu/job/empymnCnsl/empymnCnslListMypage.do?menuNo=500059" title="1:1컨설팅내역">1:1컨설팅내역</a></li>--%>
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
						<a href="/edu/main/contents.do?menuNo=500033">
							<img src="/edu/images/renew2022/ico_FAQ_white.png" alt="학습지원">
						</a>
						<ul>
							<li><a href="/edu/main/contents.do?menuNo=500033" title="지원서비스">지원서비스</a></li>
							<li><a href="/edu/bbs/B0000011/list.do?menuNo=500008" title="공지사항">공지사항</a></li>
							<li><a href="/edu/bbs/B0000076/list.do?menuNo=500221" title="함께:톡톡">함께:톡톡</a></li>
							<li><a href="/edu/bbs/B0000046/list.do?menuNo=500073" title="FAQ">FAQ</a></li>
							<li><a href="/edu/main/contents.do?menuNo=500005" title="기업맞춤교육지원">기업맞춤교육지원</a></li>
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
							<li><a href="/edu/progrm/applcnt/listMypage.do?menuNo=500064" title="프로그램 신청/접수">프로그램 신청/접수</a></li>
							<li><a href="/edu/bbs/B0000076/listMy.do?menuNo=500201" title="나의 문의내역">나의 문의내역</a></li>
							<li><a href="/edu/member/logout.do" class="ico4 logoutBtn" title="로그아웃">로그아웃</a></li>
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
					<a href="/edu/main/main.do" class="navbar-brand" title="콘텐츠인재캠퍼스 에듀코카 로고 - 콘텐츠인재캠퍼스 메인으로 이동">
						<img src="/edu/new_image/main/logo.png" alt="콘텐츠인재캠퍼스 에듀코카 로고 - 콘텐츠인재캠퍼스 메인으로 이동">
					</a>
					<input type="image" src="/edu/img/gnb_close.png" class="gnb_close" alt="GNB 메뉴 닫기" style="padding:0;">
					<h2>콘텐츠커리큘럼</h2>
					<div class="cy_contents_box">
						<div class="cy_list_box">
							<h3>방송영상</h3>
							<ul>
								<li><button type="button">방송영상 기획 Track</button></li>
								<li><button type="button">방송영상 제작(촬영/편집) Track</button></li>
								<li><button type="button">방송영상 비즈니스 Track</button></li>
								<li><button type="button">방송영상 교양 Track</button></li>
							</ul>
						</div>

						<div class="cy_list_box">
							<h3>게임</h3>
							<ul>
								<li><button type="button">게임 기획 Track</button></li>
								<li><button type="button">게임 제작(그래픽/프로그래밍) Track</button></li>
								<li><button type="button">게임 비즈니스 Track</button></li>
								<li><button type="button">게임 교양 Track</button></li>
							</ul>
						</div>

						<div class="cy_list_box">
							<h3>만화/애니/캐릭터</h3>
							<ul>
								<li><button type="button">만화/애니/캐릭터 기획 Track</button></li>
								<li><button type="button">만화/애니/캐릭터 제작 Track</button></li>
								<li><button type="button">만화/애니/캐릭터 비즈니스 Track</button></li>
								<li><button type="button">만화/애니/캐릭터 교양 Track</button></li>
							</ul>
						</div>

						<div class="cy_list_box">
							<h3>음악공연/문화일반</h3>
							<ul>
								<li><button type="button">음악공연/문화일반 기획 Track</button></li>
								<li><button type="button">음악공연/문화일반 제작 Track</button></li>
								<li><button type="button">음악공연/문화일반 비즈니스 Track</button></li>
								<li><button type="button">음악공연/문화일반 교양 Track</button></li>
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
<form id="frmCate" name="frmCate"
	  action="/edu/onlineEdu/${paramVO.programId}/list.do?menuNo=<c:out value='${paramVO.menuNo }'/>"
	  method="post">

	<input type="hidden" name="pGubun1" id="pGubun1" value=""/>
	<input type="hidden" name="p_sort" id="p_sort" value=""/>

</form>
