<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="org.springframework.util.StringUtils"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.unp.member.vo.*"%>
<%@ page
	import="kr.co.unp.cmm.sec.ram.service.impl.UnpUserDetailsHelper"%>
<%@ page import="kr.co.unp.mpm.vo.MenuManageVO"%>
<%@ page import="kr.co.unp.mpm.service.MasterMenuManager"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

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
		HashMap<String, List<MenuManageVO>> testbedMenuMap = (HashMap<String, List<MenuManageVO>>) application
				.getAttribute("menuAll7");
		menuMap.putAll(eduMenuMap);
		if ("testbed".equals(siteName))
			menuMap.putAll(testbedMenuMap);
		/* //testbed20170830 */
		MenuManageVO currentVo = masterMenuManagerService.getCurrentMenu(menuMap, Integer.parseInt(menuNo));
		pageContext.setAttribute("currMenu", currentVo);

		if(currentVo != null){
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
		$
				.get(
						"/${paramVO.siteName}/member/logout.json",
						function(data) {
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
	//]]>
</script>

<div class="col-12 header_wrap" style="padding-top: 0; padding-bottom: 0;">

	<!-- 하위스크롤 경우 // headerTopOn -->
	<div class="col-12 col-center mw-1280 over-visible header_inner">
		<div class="col-12 pr15 pl15">
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
									<a href="/${paramVO.siteName}/member/logout.do" class="ico4 logoutBtn" title="로그아웃" style="font-size: 18px; color: #fff; margin-left: 15px;">로그아웃</a>
								</div>
								<%--<input type="image" src="/edu/images/renew2022/all_menu_white.png" class="gnb_menu" alt="GNB 메뉴" style="padding:0;">--%>
							</sec:authorize>
							<!-- 로그인 전-->
							<sec:authorize ifNotGranted="ROLE_USER">
								<c:url var="loginUrl" value="/edu/member/forLogin.do">
									<c:param name="menuNo" value="500077" />
									<c:param name="_targetUrl" value="${_targetUrl}" />
								</c:url>
								<c:choose>
									<c:when test="${paramVO.siteName eq 'testbed'}">
										<span class="login_out_box mo">
											<span class="show vm fontsize14 header_util_item">
												<a href="javascript:document.getElementById('loginForm').submit();" class="ico1" title="로그인">로그인</a>
											</span>
											<form class="login_form" name="loginForm" id="loginForm"
												  action="/edu/member/forLogin.do?menuNo=500077"
												  method="post" style="display: none;">
												<input type="hidden" name="redirectUrl"
												   value="/${paramVO.siteName}/main/main.do" />
											</form>
											<span class="show vm fontsize14 header_util_item">
												<a href="/testbed/member/join01.do?menuNo=700121" class="ico2" title="회원가입">회원가입</a>
											</span>
										</span>
									</c:when>
									<c:otherwise>
										<span class="login_out_box mo">
											<span class="show vm fontsize14 header_util_item">
												<a href="/edu/member/forLogin.do?menuNo=500077" class="ico1" title="로그인">로그인</a>
											</span>
											<span class="show vm fontsize14 header_util_item">
												<a href="/edu/member/join01.do?menuNo=500076" class="ico2" title="회원가입">회원가입</a>
											</span>
										</span>
									</c:otherwise>
								</c:choose>
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
											<%--<li><a href="/edu/bbs/B0000076/list.do?menuNo=500221" title="함께:톡톡">함께:톡톡</a></li>
											<li><a href="/edu/bbs/B0000046/list.do?menuNo=500073" title="FAQ">FAQ</a></li>
											<li><a href="/edu/main/contents.do?menuNo=500005" title="기업맞춤교육지원">기업맞춤교육지원</a></li>--%>
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
										<%--<li><a href="/edu/bbs/B0000076/list.do?menuNo=500221" title="함께:톡톡">함께:톡톡</a></li>
										<li><a href="/edu/bbs/B0000046/list.do?menuNo=500073" title="FAQ">FAQ</a></li>
										<li><a href="/edu/main/contents.do?menuNo=500005" title="기업맞춤교육지원">기업맞춤교육지원</a></li>--%>
									</ul>
								</div>
								<div class="nav_my_box pc">
									<c:if test="${paramVO.siteName eq 'edu' }">
										<c:set var="mypageNm" value="마이페이지" />
										<c:set var="mypageUrl"
											   value="/edu/onlineEdu/mylctrum/list.do?menuNo=500061" />
									</c:if>
									<c:if test="${paramVO.siteName eq 'testbed' }">
										<c:set var="mypageNm" value="마이페이지" />
										<c:set var="mypageUrl"
											   value="/testbed/userMember/forUpdate.do?menuNo=700118" />
									</c:if>
									<a href="${mypageUrl}" title="${mypageNm}">
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
								<c:choose>
									<c:when test="${paramVO.siteName eq 'testbed'}">
										<span class="login_out_box">
											<span class="show vm fontsize14 header_util_item">
												<a href="javascript:document.getElementById('loginForm').submit();" class="ico1" title="로그인">로그인</a>
											</span>
											<form class="login_form" name="loginForm" id="loginForm"
												  action="/edu/member/forLogin.do?menuNo=500077"
												  method="post" style="display: none;">
												<input type="hidden" name="redirectUrl"
													   value="/${paramVO.siteName}/main/main.do" />
											</form>
											<span class="show vm fontsize14 header_util_item">
												<a href="/testbed/member/join01.do?menuNo=700121" class="ico2" title="회원가입">회원가입</a>
											</span>
										</span>
									</c:when>
									<c:otherwise>
										<span class="login_out_box">
											<span class="show vm fontsize14 header_util_item">
												<a href="/edu/member/forLogin.do?menuNo=500077" class="ico1" title="로그인">로그인</a>
											</span>
											<span class="show vm fontsize14 header_util_item">
												<a href="/edu/member/join01.do?menuNo=500076" class="ico2" title="회원가입">회원가입</a>
											</span>
										</span>
									</c:otherwise>
								</c:choose>

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

						</div>
						<!-- pc 햄버거 버튼 눌렀을때 end -->
					</nav>
				</div>
				<script type="text/javascript">
					var selectCount = false;
					$(document)
							.ready(
									function() {
										$('#myPageMenu')
												.mouseover(
														function() {
															showMypageLayer('IN');
														});
										$('#myPageMenu')
												.mouseout(
														function() {
															showMypageLayer('OUT');
														});
										$('.mypageSubLayer')
												.mouseout(
														function() {
															showMypageLayer('OUT');
														});

										getMyStudyCount();
									});

					function showMypageLayer(type) {
						if (type == "IN") {
							if (!selectCount) {
								selectCount = true;
								getMyStudyCount();
							}
							$('.mypageSubLayer').show();
						} else {
							$('.mypageSubLayer').hide();
						}
					}

					function getMyStudyCount() {
						$
								.ajax({
									url : '/edu/onlineEdu/mylctrum/selectMyStudyCount.json',
									dataType : 'json',
									data : null,
									success : function(data) {
										$('.mypageSubLayer')
												.find(
														'#studyCount')
												.html(
														data.studyCount);
									}
								});
					}
				</script>
			</header>

			<%--
            <div id="global">
                <!-- 검색창 -->
                <div class="globalSchSet">
                    <form name="frmSearch2" method="post" action="/edu/search/list.do?menuNo=500079" onsubmit="return search2(this);">
                        <input type="text" name="q" id="q2" class="schWordInput vt" value="" title="검색어를 입력하세요." />
                        <input type="image" src="/edu/images/common/schGlobalSetOk.gif" alt="검색 확인" class="p0 m0 vt" />
                    </form>
                </div>
                <!-- //검색창 -->
            </div>
            <!-- gnb -->
            <div class="gnbSet">
                <div class="gnbTotMenu"><a href="javascript:void(0);"><span class="hidden">전체메뉴 열기</span></a></div>
                <div class="totMenuT">
                    <c:forEach var="x" begin="0" end="5">
                        <dl class="tms${x+1}">
                            <dt><a href="${topCategories[x].fullMenuLink}" ${topCategories[x].menuPopupYn eq 'Y' ? 'target="_blank"' : ''}>${topCategories[x].menuNm}</a></dt>
                            <dd>
                                <c:set var="d02MenuKey" value="menu_${topCategories[x].menuNo}" />
                                <c:set var="d02Categories" value="${menuAll5[d02MenuKey]}" />
                                <c:if test="${fn:length(d02Categories)>0}">
                                    <ul>
                                        <c:forEach var="y" begin="0" end="${fn:length(d02Categories)-1}">
                                            <li><a href="${d02Categories[y].fullMenuLink}" ${d02Categories[y].menuPopupYn eq 'Y' ? 'target="_blank"' : ''}>${d02Categories[y].menuNm}</a></li>
                                        </c:forEach>
                                    </ul>
                                </c:if>
                            </dd>
                        </dl>
                    </c:forEach>
                    <a href="javascript:void(0);" class="closetotMenuT"><span class="hidden">전체메뉴 닫기</span></a>
                </div>
            </div>
            <!-- //gnb -->
            --%>
		</div>
	</div>
	<%--<div class="col-12 col-center mw-1280">
		<div class="col-12 pr15 pl15">
			<div class="col-12 tc visual_wrap">
				<div class="col-12 visual_util_wrap">
					<div class="tr sharing_util_icon">
						<li><a href="javascript:void(0);" class="ico01 snsToggleOpen"><span
								class="hidden">SNS 공유하기</span></a>
							<div class="snsDrop" style="display: none;">
								<c:url value="https://www.facebook.com/sharer.php" var="fbUrl">
									<c:param name="t" value="${title}" />
									<c:param name="u" value="${currMenu.fullMenuLink}" />
								</c:url>
								<c:url value="https://twitter.com/share" var="twitterUrl">
									<c:param name="text" value="${title}" />
									<c:param name="url" value="${currMenu.fullMenuLink}" />
								</c:url>
								<ul>
									<li><a href="<c:out value='${fbUrl}' escapeXml='true' />"
										class="icos01" onclick="return facebookOpen();"
										title="(새창열림)페이스북 링크 공유하기" target="_blank"><span
											class="hidden">페이스북</span></a></li>
									<li><a
										href="<c:out value='${twitterUrl}' escapeXml='true' />"
										class="icos02" onclick="return twitterOpen();"
										title="(새창열림)트위터 링크 공유하기" target="_blank"><span
											class="hidden">트위터</span></a></li>
								</ul>
							</div>
						</li>
						<li><a href="#self" Class="ico02 CopyClipOpen"><span
								Class="hidden">URL 복사하기</span></a> <script type="text/javascript">
									//<![CDATA[
									var linkURL = document.URL;
									var param = "";
									$(document)
											.ready(
													function() {
														$(':hidden')
																.each(
																		function() {
																			if (null != $(
																					this)
																					.attr(
																							'name')
																					&& $(
																							this)
																							.val() != "") {
																				if (linkURL
																						.indexOf($(
																								this)
																								.attr(
																										'name')) < 0) {
																					param += "&"
																							+ $(
																									this)
																									.attr(
																											'name')
																							+ "="
																							+ $(
																									this)
																									.val();
																				}
																			}
																		});

														$(
																".sharing_util_icon .ico02")
																.click(
																		function() {
																			urlLink();
																			return false;
																		});
													});

									//$("#COPYCP").prop("value", linkURL);
									function urlLink() {
										var IE = (document.all) ? true : false;
										if (IE) {
											window.clipboardData.setData(
													'Text', linkURL + param);
											alert('주소가 복사되었습니다. 브라우저의 URL 입력창에 Ctrl+V로 붙여 넣기 하세요.');
										} else {
											temp = prompt(
													"이 글의 트랙백 주소입니다. Ctrl+C를 눌러 클립보드로 복사하세요",
													linkURL + param);
										}
										return false;
									}
									//]]>
								</script></li>
						<li><a href="/edu/forPrint.jsp" class="ico03"
							onclick="window.open(this.href, 'printPage', 'width=1120,height=650,scrollbars=1,toolbar=1,status');return false;"
							target="_blank" title="(새창열림)내용인쇄하기"><span class="hidden">인쇄하기</span></a></li>
					</div>
				</div>
				<div class="col-12 tl tr-md visual_text_wrap">


					<c:choose>
						<c:when test='${fn:indexOf(pathData[0], "온라인교육") > -1 }'>
							<h2>
								국내 유일의 방송/문화/게임 <span class="point1">콘텐츠 전문 온라인 교육</span>
							</h2>
							<style type="text/css">
.visual_wrap h2 {
	margin-bottom: 80px;
}

.visual_text_wrap {
	text-align: center;
}

.visual_util_wrap {
	display: none;
}

@media all and (min-width:992px) {
	.visual_wrap h2 {
		margin-bottom: 150px;
	}
}
</style>
						</c:when>
						<c:when test='${fn:indexOf(pathData[0], "취업지원") > -1 }'>
							<h2>
								콘텐츠 전문분야로의 <span class="point1">취업역량 강화를<br /> 위한 맞춤형
								</span> 취업컨설팅
							</h2>
							<style type="text/css">
.visual_wrap h2 {
	margin-bottom: 80px;
}

.visual_text_wrap {
	text-align: center;
}

.visual_util_wrap {
	display: none;
}

@media all and (min-width:992px) {
	.visual_wrap h2 {
		margin-bottom: 150px;
	}
}
</style>
						</c:when>
						<c:when test='${fn:indexOf(pathData[0], "콘텐츠문화광장") > -1 }'>
							<h2>${pathData[1]}</h2>
							<c:choose>
							    <c:when test="${fn:indexOf(pathData[1], '프로그램') > -1 }">
							        <p class="h_desc2" style="display: block;">혁신기술 융합 콘텐츠의 제작 및 시연</p>
							    </c:when>
							    <c:when test="${fn:indexOf(pathData[1], '대관 서비스') > -1 }">
							       <p class="h_desc2" style="display: block;">공연장 및 연습실 대관, 보유 장비 사용 및 하우스 운영 무상 지원</p>
							    </c:when>
							    <c:when test="${fn:indexOf(pathData[1], '문화예술기업') > -1 }">
							        <p class="h_desc2" style="display: block;">융복합 콘텐츠 및 관련 기술 영역 개척 기업에 활동 지원</p>
							    </c:when>
							    <c:when test="${fn:indexOf(pathData[1], '커뮤니티') > -1 }">
							        <p class="h_desc2" style="display: block;">한 걸음 더 가까이 소통하는 콘텐츠 문화광장</p>
							    </c:when>
							    <c:otherwise>
							        <p class="h_desc2" style="display: block;">세계로 열린 콘텐츠 실험무대</p>
							    </c:otherwise>
							</c:choose>
							<style type="text/css">
							.h_desc2 {
								display: none;
							}
							</style>
						</c:when>
						<c:when test='${fn:indexOf(pathData[0], "HOME") > -1 }'>
							<h2>${pathData[0]}</h2>
							<p class="h_desc2" style="display: block;">융합형 창의인재 양성의 중심허브,
								콘텐츠인재캠퍼스</p>
						</c:when>
						<c:when test='${fn:indexOf(pathData[0], "교육지원사업") > -1 }'>
							<h2>${pathData[0]}</h2>
							<p class="h_desc2" style="display: block;">콘텐츠 분야 전문인력 양성을 위한
								현장중심 프로그램 지원</p>
						</c:when>
						<c:otherwise>
							<h2>${pathData[0]}</h2>
							<p class="h_desc2">콘텐츠 분야 잠재인력과 현업인들을 위한 역량강화 프로그램</p>
						</c:otherwise>
					</c:choose>

				</div>
			</div>
		</div>
	</div>--%>
	<c:choose>
		<c:when test='${fn:indexOf(pathData[0], "HOME") > -1 }'>
			<div class="sub_visual"></div>
		</c:when>
		<c:when test='${fn:indexOf(pathData[0], "오프라인교육") > -1 }'>
			<div class="sub_visual img_001"></div>
		</c:when>
		<c:when test='${fn:indexOf(pathData[0], "온라인교육") > -1 }'>
			<div class="sub_visual img_003"></div>
		</c:when>
		<c:when test='${fn:indexOf(pathData[0], "교육지원사업") > -1 }'>
			<div class="sub_visual img_002"></div>
		</c:when>
		<c:when test='${fn:indexOf(pathData[0], "취업지원") > -1 }'>
			<div class="sub_visual img_004"></div>
		</c:when>
 		<c:when test='${fn:indexOf(pathData[0], "콘텐츠문화광장") > -1 }'>
	 		<c:choose>
			    <c:when test="${fn:indexOf(pathData[1], '프로그램') > -1 }">
			        <div class="sub_visual img_006"></div>
			    </c:when>
			    <c:when test="${fn:indexOf(pathData[1], '대관 서비스') > -1 }">
			        <div class="sub_visual img_007"></div>
			    </c:when>
			    <c:when test="${fn:indexOf(pathData[1], '문화예술기업') > -1 }">
			        <div class="sub_visual img_008"></div>
			    </c:when>
			    <c:when test="${fn:indexOf(pathData[1], '커뮤니티') > -1 }">
			        <div class="sub_visual img_009"></div>
			    </c:when>
			    <c:when test="${fn:indexOf(pathData[1], '콘텐츠인재캠퍼스') > -1 }">
			        <div class="sub_visual img_010"></div>
			    </c:when>
			    <c:otherwise>
			        <div class="sub_visual img_005"></div>
			    </c:otherwise>
			</c:choose>
		 		<%-- <c:if test="${fn:indexOf(pathData[1], '프로그램') > -1 }">
	 			<div class="sub_visual img_006"></div>
			</c:if> --%>
		</c:when>
		<c:otherwise>
			<%--<div class="sub_visual"></div>--%>
		</c:otherwise>
	</c:choose>

</div>
