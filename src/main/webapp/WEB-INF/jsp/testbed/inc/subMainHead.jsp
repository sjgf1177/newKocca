<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="org.springframework.util.StringUtils" %>
<%@ page import="java.util.*" %>
<%@ page import="kr.co.unp.member.vo.*" %>
<%@ page import="kr.co.unp.cmm.sec.ram.service.impl.UnpUserDetailsHelper" %>
<%@ page import="kr.co.unp.mpm.vo.MenuManageVO" %>
<%@ page import="kr.co.unp.mpm.service.MasterMenuManager" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="kr.co.unp.main.service.MainService" %>
<%@ page import="kr.co.unp.util.ZValue" %>

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
        List<ZValue> curriculumList = mainService.getCurriculumList(zParam);

        pageContext.setAttribute("curriculumList", curriculumList);
    }

    // 랜덤 키워드 조회
    String randomKeyword = mainService.getRandomKeyword(zParam);
    pageContext.setAttribute("randomKeyword", randomKeyword);
%>

<script type="text/javascript">
    function search2(form) {
        if (!form.q.value) {
            alert("검색어를 입력하세요.");
            $("#q2")[0].focus();
            return false;
        }
        return true;
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

    function eventList(type) {
        document.eListForm.op3.value = type;
        document.eListForm.action = "/edu/bbs/B0000048/list.do?menuNo=500203";
        document.eListForm.submit();
    }

    //과정 조회(열린)
    function fnCmdGoldList(gubun) {
        $("#pGubun1").val(gubun);
        $("#p_type").val(gubun);
        $("#pageIndex").val("1");
        $("#p_sort").val("N");

        $("#frmGold").attr({
            action:"/edu/onlineEdu/openLecture/list.do?menuNo=500085",
            method: "post",
            target: "_self"
        });
        $("#frmGold").submit();
    }
</script>

<form id="eListForm" name="eListForm" method="post">
    <input type="hidden" id="op3" name="op3" value="">
</form>

<form id="frmGold" name="frmGold" action="" method="post">
    <input type="hidden" name="pGubun1" id="pGubun1" value=""/>
    <input type="hidden" name="p_sort" id="p_sort" value=""/>
    <input type="hidden" name="p_type" id="p_type" value=""/>
</form>

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
                        <form name="frmSearch4" method="post" action="/edu/search/list.do?menuNo=500079" onsubmit="return search2(this);">
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
                                <a href="/${paramVO.siteName}/member/logout.do" class="ico4 logoutBtn" title="로그아웃" style="font-size: 18px; color: #fff; margin-left: 15px;">로그아웃</a>
                            </div>
                        </sec:authorize>

                        <!-- 로그인 전-->
                        <sec:authorize ifNotGranted="ROLE_USER">
                            <c:url var="loginUrl" value="/edu/member/forLogin.do">
                                <c:param name="menuNo" value="500077"/>
                                <c:param name="_targetUrl" value="${_targetUrl}"/>
                            </c:url>
                            <c:choose>
                                <c:when test="${paramVO.siteName eq 'testbed'}">
                                    <span class="login_out_box mo">
                                        <span class="show vm fontsize14 header_util_item">
                                            <a href="javascript:document.getElementById('loginForm').submit();" class="ico1" title="로그인">로그인</a>
                                        </span>
                                        <form class="login_form" name="loginForm" id="loginForm" action="/edu/member/forLogin.do?menuNo=500077" method="post" style="display: none;">
                                            <input type="hidden" name="redirectUrl" value="/${paramVO.siteName}/main/main.do"/>
                                        </form>
                                        <span class="show vm fontsize14 header_util_item">
                                            <%--<a href="/testbed/member/join02.do?menuNo=700121" class="ico2" title="회원가입">회원가입</a>--%>
                                            <a href="/edu/member/join02.do?menuNo=500076" class="ico2" title="회원가입">회원가입</a>
                                        </span>
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="login_out_box mo">
                                        <span class="show vm fontsize14 header_util_item">
                                            <a href="/edu/member/forLogin.do?menuNo=500077" class="ico1" title="로그인">로그인</a>
                                        </span>
                                        <span class="show vm fontsize14 header_util_item">
                                            <a href="/edu/member/join02.do?menuNo=500076" class="ico2" title="회원가입">회원가입</a>
                                        </span>
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </sec:authorize>
                        <!-- 모바일 로그인/회원가입 end -->

                        <ul class="navbar-nav">
                            <!-- nav 이벤트 one-daps start -->
                            <li><a href="/edu/bbs/B0000048/list.do?menuNo=500205">이벤트</a>
                                <!-- nav 이벤트 two-daps start -->
                                <ul>
                                    <li><a href="javascript:void(0);" onclick="eventList('1')">에듀코카 이벤트</a></li>
                                    <li><a href="javascript:void(0);" onclick="eventList('2')">교육신청하기</a></li>
                                    <li><a href="javascript:void(0);" onclick="eventList('3')">공모참여하기</a></li>
                                    <li><a href="javascript:void(0);" onclick="eventList('4')">종료이벤트</a></li>
                                </ul>
                                <!-- nav 이벤트 two-daps end -->
                            </li>
                            <!-- nav 이벤트 one-daps end -->

                            <!-- nav 카테고리 one-daps start -->
                            <li><a href="/edu/onlineEdu/themeLecture/list.do?menuNo=500157">카테고리</a>
                                <!-- nav 카테고리 two-daps start -->
                                <ul>
                                    <li><a href="/edu/onlineEdu/themeLecture/list.do?menuNo=500157">테마과정</a></li>
                                    <li><a href="javascript:void(0);" onclick="fnCmdGoldList('B0'); return false;">방송영상</a></li>
                                    <li><a href="javascript:void(0);" onclick="fnCmdGoldList('G0'); return false;">게임</a></li>
                                    <li><a href="javascript:void(0);" onclick="fnCmdGoldList('K0'); return false;">만화/애니/캐릭터</a></li>
                                    <li><a href="javascript:void(0);" onclick="fnCmdGoldList('M0'); return false;">음악/공연</a></li>
                                    <li><a href="javascript:void(0);" onclick="fnCmdGoldList('S0'); return false;">인문교양</a></li>
                                </ul>
                                <!-- nav 카테고리 two-daps end -->
                            </li>
                            <!-- nav 카테고리 one-daps end -->

                            <!-- nav 사업안내 one-daps start -->
                            <li><a href="/edu/dream/mainRsltManage/list.do?menuNo=500040">사업안내</a>
                                <!-- nav 이벤트 two-daps start -->
                                <ul>
                                    <li><a href="/edu/progrm/master/list.do?prgSe=01&amp;prgCl=12&amp;menuNo=500216">콘텐츠스텝업</a></li>
                                    <li><a href="/edu/main/contents.do?menuNo=500263">AI콘텐츠창작</a></li>
                                    <li><a href="/edu/main/contents.do?menuNo=500110">실감콘텐츠창작</a></li>
                                    <li><a href="/edu/dream/mainRsltManage/list.do?menuNo=500040">창의인재동반</a></li>
                                    <li><a href="/edu/progrm/master/list.do?prgSe=01&prgCl=13&menuNo=500215">콘텐츠인사이트</a></li>
                                    <li><a href="/edu/main/contents.do?menuNo=500213">콘텐츠임팩트</a></li>
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
                                </ul>
                            </div>
                            <div class="nav_my_box pc">
                                <c:if test="${paramVO.siteName eq 'edu' }">
                                    <c:set var="mypageNm" value="마이페이지"/>
                                    <c:set var="mypageUrl" value="/edu/onlineEdu/mylctrum/list.do?menuNo=500061"/>
                                </c:if>
                                <c:if test="${paramVO.siteName eq 'testbed' }">
                                    <c:set var="mypageNm" value="마이페이지"/>
                                    <c:set var="mypageUrl" value="/testbed/userMember/forUpdate.do?menuNo=700118"/>
                                </c:if>
                                <a href="${mypageUrl}" title="${mypageNm}">
                                    <img src="/edu/images/renew2022/my.png" alt="마이페이지">
                                </a>
                                <ul>
                                    <li id="myPageMenu"><a href="/edu/onlineEdu/mylctrum/list.do?menuNo=500061" title="마이페이지">마이페이지</a></li>
                                    <li><a href="/edu/userMember/forUpdate.do?menuNo=500056" title="회원정보 수정">회원정보 수정</a></li>
                                    <li><a href="/edu/userMember/simpleLogin.do?menuNo=500058" title="간편로그인 설정">간편로그인 설정</a></li>
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
                            <c:choose>
                                <c:when test="${paramVO.siteName eq 'testbed'}">
                                    <span class="login_out_box">
                                        <span class="show vm fontsize14 header_util_item">
                                            <a href="javascript:document.getElementById('loginForm').submit();" class="ico1" title="로그인">로그인</a>
                                        </span>
                                        <form class="login_form" name="loginForm" id="loginForm" action="/edu/member/forLogin.do?menuNo=500077" method="post" style="display: none;">
                                            <input type="hidden" name="redirectUrl" value="/${paramVO.siteName}/main/main.do"/>
                                        </form>
                                        <span class="show vm fontsize14 header_util_item">
                                           <%-- <a href="/testbed/member/join02.do?menuNo=700121" class="ico2" title="회원가입">회원가입</a>--%>
                                            <a href="/edu/member/join02.do?menuNo=500076" class="ico2" title="회원가입">회원가입</a>
                                        </span>
                                    </span>
                                </c:when>
                                <c:otherwise>
										<span class="login_out_box">
											<span class="show vm fontsize14 header_util_item">
												<a href="/edu/member/forLogin.do?menuNo=500077" class="ico1" title="로그인">로그인</a>
											</span>
											<span class="show vm fontsize14 header_util_item">
												<a href="/edu/member/join02.do?menuNo=500076" class="ico2" title="회원가입">회원가입</a>
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
                </nav>
            </div>
            <script type="text/javascript">
                var selectCount = false;
                $(document)
                    .ready(
                        function () {
                            $('#myPageMenu')
                                .mouseover(
                                    function () {
                                        showMypageLayer('IN');
                                    });
                            $('#myPageMenu')
                                .mouseout(
                                    function () {
                                        showMypageLayer('OUT');
                                    });
                            $('.mypageSubLayer')
                                .mouseout(
                                    function () {
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
                            url: '/edu/onlineEdu/mylctrum/selectMyStudyCount.json',
                            dataType: 'json',
                            data: null,
                            success: function (data) {
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
    </div>
</div>
