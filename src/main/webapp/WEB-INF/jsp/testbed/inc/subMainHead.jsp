<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="org.springframework.util.StringUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="kr.co.unp.member.vo.*" %>
<%@ page import="kr.co.unp.cmm.sec.ram.service.impl.UnpUserDetailsHelper" %>
<%@ page import="kr.co.unp.mpm.vo.MenuManageVO"%>
<%@ page import="kr.co.unp.mpm.service.MasterMenuManager"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
//]]>

</script>

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
                                <a href="/edu/onlineEdu/mylctrum/list.do?menuNo=500061">
                                    <img src="/edu/images/renew2022/my.png" alt="마이페이지">
                                </a>
                                <ul>
                                    <li><a href="/edu/member/logout.do" class="ico4 logoutBtn" title="로그아웃">로그아웃</a></li>
                                    <li id="myPageMenu"><a href="/edu/onlineEdu/mylctrum/list.do?menuNo=500061" title="마이페이지">마이페이지</a></li>
                                    <li><a href="/edu/userMember/forUpdate.do?menuNo=500056" title="회원정보 수정">회원정보 수정</a></li>
                                    <li><a href="/edu/userMember/simpleLogin.do?menuNo=500058" title="간편로그인 설정">간편로그인 설정</a></li>
                                    <li><a href="/edu/job/empymnCnsl/empymnCnslListMypage.do?menuNo=500059" title="1:1컨설팅내역">1:1컨설팅내역</a></li>
                                    <li><a href="/edu/progrm/applcnt/listMypage.do?menuNo=500064" title="프로그램 신청/접수">프로그램 신청/접수</a></li>
                                    <li><a href="/edu/bbs/B0000076/listMy.do?menuNo=500201" title="나의 문의내역">나의 문의내역</a></li>
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
                                <a href="/edu/bbs/B0000048/list.do?menuNo=500203"   >
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
                                    </li>-
                                </ul>--%>
                                <!-- nav 이벤트 two-daps end -->
                            </li>
                            <!-- nav 이벤트 one-daps end -->

                            <!-- nav 카테고리 one-daps start -->
                            <li>
                                <a href="javascript:void(0);" onclick="fnCmdSearchList('B0', '', '', '', ''); return false;">
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
                                        <a href="javascript:void(0);" onclick="fnCmdSearchList('B0', '', '', '', ''); return false;">
                                            방송영상
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" onclick="fnCmdSearchList('G0', '', '', '', ''); return false;">
                                            게임
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" onclick="fnCmdSearchList('K0', '', '', '', ''); return false;">
                                            만화/애니/캐릭터
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" onclick="fnCmdSearchList('M0', '', '', '', ''); return false;">
                                            문화일반(음악공연)
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" onclick="fnCmdSearchList('S0', '', '', '', ''); return false;">
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
                                <a href="/edu/dream/mainRsltManage/list.do?menuNo=500040">
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
                                    <li>
                                        <a href="/edu/progrm/master/list.do?prgSe=01&amp;prgCl=12&amp;menuNo=500216">
                                            콘텐츠스텝업
                                        </a>
                                    </li>
                                    <li>
                                        <!-- 현url 에듀코카이야기에서 에듀코카페이지로 변경해야함-->
                                        <a href="/edu/bbs/B0000023/list.do?menuNo=500206">
                                            에듀코카
                                        </a>
                                    </li>
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
                                        <li><a href="/edu/main/contents.do?menuNo=500033" title="지원서비스">지원서비스</a></li>
                                        <li><a href="/edu/bbs/B0000011/list.do?menuNo=500008" title="공지사항">공지사항</a></li>
                                        <li><a href="/edu/bbs/B0000076/list.do?menuNo=500221" title="함께:톡톡">함께:톡톡</a></li>
                                        <li><a href="/edu/bbs/B0000046/list.do?menuNo=500073" title="FAQ">FAQ</a></li>
                                        <li><a href="/edu/main/contents.do?menuNo=500005" title="기업맞춤교육지원">기업맞춤교육지원</a></li>
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
                                    <li><a href="/edu/member/logout.do" class="ico4 logoutBtn" title="로그아웃">로그아웃</a></li>
                                    <li id="myPageMenu"><a href="/edu/onlineEdu/mylctrum/list.do?menuNo=500061" title="마이페이지">마이페이지</a></li>
                                    <li><a href="/edu/userMember/forUpdate.do?menuNo=500056" title="회원정보 수정">회원정보 수정</a></li>
                                    <li><a href="/edu/userMember/simpleLogin.do?menuNo=500058" title="간편로그인 설정">간편로그인 설정</a></li>
                                    <li><a href="/edu/job/empymnCnsl/empymnCnslListMypage.do?menuNo=500059" title="1:1컨설팅내역">1:1컨설팅내역</a></li>
                                    <li><a href="/edu/progrm/applcnt/listMypage.do?menuNo=500064" title="프로그램 신청/접수">프로그램 신청/접수</a></li>
                                    <li><a href="/edu/bbs/B0000076/listMy.do?menuNo=500201" title="나의 문의내역">나의 문의내역</a></li>
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

    </div>
</div>
