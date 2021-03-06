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

<c:set var='siteName' value='${paramVO.siteName}'/>
<%
    UsersVO user = UnpUserDetailsHelper.getAuthenticatedUser();
    pageContext.setAttribute("userVO", user);
    String menuNo = request.getParameter("menuNo");

    if (StringUtils.hasText(menuNo)) {
        org.springframework.context.ApplicationContext context = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(getServletContext());
        MasterMenuManager masterMenuManagerService = (MasterMenuManager) context.getBean("masterMenuManagerService");

        if(user.getUserIdx() > 0) {
            MainService mainService = (MainService) context.getBean("mainService");
            ZValue zParam = new ZValue();
            zParam.put("userid", user.getUserId());
            List<ZValue> curriculumList = mainService.getCurriculumList(zParam);

            pageContext.setAttribute("curriculumList", curriculumList);
        }

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

        if (currentVo != null) {
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
<c:set var="pathData" value="${fn:split(currMenu.path, '|')}"/>
<script type="text/javascript">
    function search2(form) {
        if (!form.q.value) {
            alert("???????????? ???????????????.");
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

    function goEventList(type) {
        document.formEvent.op3.value = type;
        document.formEvent.action = "/edu/bbs/B0000048/list.do?menuNo=500203";
        document.formEvent.submit();
    }

    //?????? ??????(??????)
    function fnSearchGoldList(gubun) {
        $("#pGubun1").val(gubun);
        $("#p_type").val(gubun);
        $("#pageIndex").val("1");
        $("#p_sort").val("N");

        $("#formCate").attr({
            action:"/edu/onlineEdu/openLecture/list.do?menuNo=500085",
            method: "post",
            target: "_self"
        });
        $("#formCate").submit();
    }
</script>

<form id="formEvent" name="formEvent" method="post">
    <input type="hidden" id="op3" name="op3" value="">
</form>

<form id="formCate" name="formCate" action="" method="post">
    <input type="hidden" name="pGubun1" id="pGubun1" value=""/>
    <input type="hidden" name="p_sort" id="p_sort" value=""/>
    <input type="hidden" name="p_type" id="p_type" value=""/>
    <input type="hidden" name="pageIndex" id="pageIndex" value=""/>
</form>

<div class="col-12 header_wrap" style="padding-top: 0; padding-bottom: 0;">
    <!-- ??????????????? ?????? // headerTopOn -->
    <div class="col-12 col-center mw-1280 over-visible header_inner">
        <div class="col-12 pr15 pl15">
            <header>
                <div class="container h-100">
                    <nav class="navbar navbar-expand-xl">
                        <a href="/edu/main/main.do" class="navbar-brand" title="???????????????????????? ???????????? ?????? - ???????????????????????? ???????????? ??????">
                            <img src="/edu/new_image/main/logo.png" alt="???????????????????????? ???????????? ?????? - ???????????????????????? ???????????? ??????">
                        </a>
                        <!-- ????????? ????????? start -->
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main_nav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <!-- ????????? ????????? end -->

                        <div class="nav_search_box">
                            <input type="text" placeholder="???????????? ??????????????????.">
                            <button class="nav_search_btn"></button>
                        </div>

                        <!-- nav start -->
                        <div class="collapse navbar-collapse" id="main_nav">
                            <!-- ????????? ?????????/???????????? start -->
                            <!-- ????????? ???-->
                            <sec:authorize ifAnyGranted="ROLE_USER">
                                <div class="nav_my_box mo">
                                    <input type="image" src="/edu/images/renew2022/all_menu_white.png" class="gnb_menu" alt="GNB ??????" style="padding:0;">
                                    <a href="/${paramVO.siteName}/member/logout.do" class="ico4 logoutBtn" title="????????????" style="font-size: 18px; color: #fff; margin-left: 15px;">????????????</a>
                                </div>
                            </sec:authorize>

                            <!-- ????????? ???-->
                            <sec:authorize ifNotGranted="ROLE_USER">
                                <c:url var="loginUrl" value="/edu/member/forLogin.do">
                                    <c:param name="menuNo" value="500077"/>
                                    <c:param name="_targetUrl" value="${_targetUrl}"/>
                                </c:url>
                                <c:choose>
                                    <c:when test="${paramVO.siteName eq 'testbed'}">
										<span class="login_out_box mo">
											<span class="show vm fontsize14 header_util_item">
												<a href="javascript:document.getElementById('loginForm').submit();" class="ico1" title="?????????">?????????</a>
											</span>
											<form class="login_form" name="loginForm" id="loginForm" action="/edu/member/forLogin.do?menuNo=500077" method="post" style="display: none;">
												<input type="hidden" name="redirectUrl" value="/${paramVO.siteName}/main/main.do"/>
											</form>
											<span class="show vm fontsize14 header_util_item">
												<a href="/testbed/member/join01.do?menuNo=700121" class="ico2" title="????????????">????????????</a>
											</span>
										</span>
                                    </c:when>
                                    <c:otherwise>
										<span class="login_out_box mo">
											<span class="show vm fontsize14 header_util_item">
												<a href="/edu/member/forLogin.do?menuNo=500077" class="ico1" title="?????????">?????????</a>
											</span>
											<span class="show vm fontsize14 header_util_item">
												<a href="/edu/member/join01.do?menuNo=500076" class="ico2" title="????????????">????????????</a>
											</span>
										</span>
                                    </c:otherwise>
                                </c:choose>
                            </sec:authorize>
                            <!-- ????????? ?????????/???????????? end -->

                            <ul class="navbar-nav">
                                <!-- nav ????????? one-daps start -->
                                <li><a href="javascript:void(0);">?????????</a>
                                    <!-- nav ????????? two-daps start -->
                                    <ul>
                                        <li><a href="javascript:void(0);" onclick="goEventList('1')">???????????? ?????????</a></li>
                                        <li><a href="javascript:void(0);" onclick="goEventList('2')">??????????????????</a></li>
                                        <li><a href="javascript:void(0);" onclick="goEventList('3')">??????????????????</a></li>
                                        <li><a href="javascript:void(0);" onclick="goEventList('4')">???????????????</a></li>
                                    </ul>
                                    <!-- nav ????????? two-daps end -->
                                </li>
                                <!-- nav ????????? one-daps end -->

                                <!-- nav ???????????? one-daps start -->
                                <li>
                                    <a href="javascript:void(0);">????????????</a>
                                    <!-- nav ???????????? two-daps start -->
                                    <ul>
                                        <li><a href="/edu/onlineEdu/themeLecture/list.do?menuNo=500157">???????????????</a></li>
                                        <li><a href="javascript:void(0);" onclick="fnSearchGoldList('B0'); return false;">????????????</a></li>
                                        <li><a href="javascript:void(0);" onclick="fnSearchGoldList('G0'); return false;">??????</a></li>
                                        <li><a href="javascript:void(0);" onclick="fnSearchGoldList('K0'); return false;">??????/??????/?????????</a></li>
                                        <li><a href="javascript:void(0);" onclick="fnSearchGoldList('M0'); return false;">????????????(????????????)</a></li>
                                        <li><a href="javascript:void(0);" onclick="fnSearchGoldList('S0'); return false;">??????/??????/??????/??????</a></li>
                                    </ul>
                                    <!-- nav ???????????? two-daps end -->
                                </li>
                                <!-- nav ???????????? one-daps end -->

                                <!-- nav ???????????? one-daps start -->
                                <li><a href="javascript:void(0);">????????????</a>
                                    <!-- nav ????????? two-daps start -->
                                    <ul>
                                        <li><a href="/edu/progrm/master/list.do?prgSe=01&amp;prgCl=12&amp;menuNo=500216">??????????????????</a></li>
                                        <li><a href="/edu/progrm/master/list.do?prgSe=01&prgCl=13&menuNo=500215">?????????????????????</a></li>
                                        <li><a href="/edu/main/contents.do?menuNo=500213">??????????????????</a></li>
                                        <li><a href="/edu/dream/mainRsltManage/list.do?menuNo=500040">??????????????????</a></li>
                                        <li><a href="/edu/main/contents.do?menuNo=500110">?????????????????????</a></li>
                                        <li><a href="/edu/main/contents.do?menuNo=500263">AI???????????????</a></li>
                                        <li><a href="/edu/main/contents.do?menuNo=500179">?????????????????????</a></li>
                                        <%--<li>
                                            <!-- ???url ??????????????????????????? ???????????????????????? ???????????????-->
                                            <a href="/edu/bbs/B0000023/list.do?menuNo=500206">
                                                ????????????
                                            </a>
                                        </li>
                                        <li>
                                            <a href="/edu/archiveUser/list.do?menuNo=500226&amp;workField=1">
                                                ????????????
                                            </a>
                                        </li>--%>
                                    </ul>
                                    <!-- nav ???????????? two-daps end -->
                                </li>
                                <!-- nav ???????????? one-daps end -->

                                <!-- nav ???????????? one-daps start -->
                                <li><a href="javascript:void(0);">????????????</a>
                                    <!-- nav ???????????? two-daps start -->
                                    <ul>
                                        <li><a href="/testbed/main/main.do?menuNo=500108">?????????????????????</a></li>
                                        <li><a href="/testbed/main/contents.do?menuNo=700133">????????????????????????</a></li>
                                    </ul>
                                    <!-- nav ???????????? two-daps end -->
                                </li>
                                <!-- nav ???????????? one-daps end -->

                                <sec:authorize ifAnyGranted="ROLE_USER">
                                    <!-- ???????????? ????????? one-daps start -->
                                    <li class="nav_support_box mo">
                                        <a href="/testbed/main/main.do?menuNo=500108">????????????</a>
                                        <!-- ???????????? two-daps start -->
                                        <ul>
                                            <li><a href="/edu/main/contents.do?menuNo=500033" title="???????????????">???????????????</a></li>
                                            <li><a href="/edu/bbs/B0000011/list.do?menuNo=500008" title="????????????">????????????</a></li>
                                        </ul>
                                        <!-- nav ???????????? two-daps end -->
                                    </li>
                                    <!-- ???????????? ????????? one-daps end -->

                                    <!-- ??????????????? ????????? one-daps start -->
                                    <li class="nav_support_box mo">
                                        <a href="/edu/onlineEdu/mylctrum/list.do?menuNo=500061">???????????????</a>
                                        <!-- ??????????????? ????????? two-daps start -->
                                        <ul>
                                            <li><a href="/edu/userMember/forUpdate.do?menuNo=500056" title="???????????? ??????">???????????? ??????</a></li>
                                            <li><a href="/edu/userMember/simpleLogin.do?menuNo=500058" title="??????????????? ??????">??????????????? ??????</a></li>
                                            <li><a href="/edu/progrm/applcnt/listMypage.do?menuNo=500064" title="???????????? ??????/??????">???????????? ??????/??????</a></li>
                                            <li><a href="/edu/bbs/B0000076/listMy.do?menuNo=500201" title="?????? ????????????">?????? ????????????</a></li>
                                        </ul>
                                        <!-- ??????????????? ????????? two-daps end -->
                                    </li>
                                    <!-- ??????????????? ????????? one-daps end -->
                                </sec:authorize>
                            </ul>
                        </div>
                        <div class="ml-auto searchCon">
                            <!-- ????????? ???-->
                            <sec:authorize ifAnyGranted="ROLE_USER">
                                <div class="nav_support_box">
                                    <a href="/edu/main/contents.do?menuNo=500033">
                                        <img src="/edu/images/renew2022/ico_FAQ_white.png" alt="????????????">
                                    </a>
                                    <ul>
                                        <li><a href="/edu/main/contents.do?menuNo=500033" title="???????????????">???????????????</a></li>
                                        <li><a href="/edu/bbs/B0000011/list.do?menuNo=500008" title="????????????">????????????</a></li>
                                    </ul>
                                </div>
                                <div class="nav_my_box pc">
                                    <c:if test="${paramVO.siteName eq 'edu' }">
                                        <c:set var="mypageNm" value="???????????????"/>
                                        <c:set var="mypageUrl" value="/edu/onlineEdu/mylctrum/list.do?menuNo=500061"/>
                                    </c:if>
                                    <c:if test="${paramVO.siteName eq 'testbed' }">
                                        <c:set var="mypageNm" value="???????????????"/>
                                        <c:set var="mypageUrl" value="/testbed/userMember/forUpdate.do?menuNo=700118"/>
                                    </c:if>
                                    <a href="${mypageUrl}" title="${mypageNm}">
                                        <img src="/edu/images/renew2022/my.png" alt="???????????????">
                                    </a>
                                    <ul>
                                        <li id="myPageMenu"><a href="/edu/onlineEdu/mylctrum/list.do?menuNo=500061" title="???????????????">???????????????</a></li>
                                        <li><a href="/edu/userMember/forUpdate.do?menuNo=500056" title="???????????? ??????">???????????? ??????</a></li>
                                        <li><a href="/edu/userMember/simpleLogin.do?menuNo=500058" title="??????????????? ??????">??????????????? ??????</a></li>
                                        <li><a href="/edu/progrm/applcnt/listMypage.do?menuNo=500064" title="???????????? ??????/??????">???????????? ??????/??????</a></li>
                                        <li><a href="/edu/bbs/B0000076/listMy.do?menuNo=500201" title="?????? ????????????">?????? ????????????</a></li>
                                        <li><a href="/edu/member/logout.do" class="ico4 logoutBtn" title="????????????">????????????</a></li>
                                    </ul>
                                </div>
                                <input type="image" src="/edu/images/renew2022/all_menu_white.png" class="gnb_menu" alt="GNB ??????" style="padding:0;">
                            </sec:authorize>

                            <!-- ????????? ???-->
                            <sec:authorize ifNotGranted="ROLE_USER">
                                <c:url var="loginUrl" value="/edu/member/forLogin.do">
                                    <c:param name="menuNo" value="500077"/>
                                    <c:param name="_targetUrl" value="${_targetUrl}"/>
                                </c:url>
                                <c:choose>
                                    <c:when test="${paramVO.siteName eq 'testbed'}">
										<span class="login_out_box">
											<span class="show vm fontsize14 header_util_item">
												<a href="javascript:document.getElementById('loginForm').submit();" class="ico1" title="?????????">?????????</a>
											</span>
											<form class="login_form" name="loginForm" id="loginForm" action="/edu/member/forLogin.do?menuNo=500077" method="post" style="display: none;">
												<input type="hidden" name="redirectUrl" value="/${paramVO.siteName}/main/main.do"/>
											</form>
											<span class="show vm fontsize14 header_util_item">
												<a href="/testbed/member/join01.do?menuNo=700121" class="ico2" title="????????????">????????????</a>
											</span>
										</span>
                                    </c:when>
                                    <c:otherwise>
										<span class="login_out_box">
											<span class="show vm fontsize14 header_util_item">
												<a href="/edu/member/forLogin.do?menuNo=500077" class="ico1" title="?????????">?????????</a>
											</span>
											<span class="show vm fontsize14 header_util_item">
												<a href="/edu/member/join01.do?menuNo=500076" class="ico2" title="????????????">????????????</a>
											</span>
										</span>
                                    </c:otherwise>
                                </c:choose>
                            </sec:authorize>
                        </div>
                        <!-- pc ????????? ?????? ???????????? start-->
                        <div class="collapse navbar-collapse" id="main_nav_full">
                            <div class="cy_navbar-nav">
                                <a href="/edu/main/main.do" class="navbar-brand" title="???????????????????????? ???????????? ?????? - ???????????????????????? ???????????? ??????">
                                    <img src="/edu/new_image/main/logo.png" alt="???????????????????????? ???????????? ?????? - ???????????????????????? ???????????? ??????">
                                </a>
                                <input type="image" src="/edu/img/gnb_close.png" class="gnb_close" alt="GNB ?????? ??????" style="padding:0;">
                                <h2>?????????????????????<span class="pc cy_list_txt">?????? ??????????????? ??????????????? ????????????????????? ??????????????? ????????? ????????????.(??????????????????)</span></h2>
                                <div class="cy_contents_box">
                                    <p class="mo cy_list_txt">?????? ??????????????? ??????????????? ????????????????????? ??????????????? ????????? ????????????.(??????????????????)</p>
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
                        </div>
                        <!-- pc ????????? ?????? ???????????? end -->
                    </nav>
                </div>

                <script type="text/javascript">
                    var selectCount = false;

                    $(document).ready(function () {
                        $('#myPageMenu').mouseover(function () {
                            showMypageLayer('IN');
                        });

                        $('#myPageMenu').mouseout(function () {
                            showMypageLayer('OUT');
                        });

                        $('.mypageSubLayer').mouseout(function () {
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
                        $.ajax({
                            url: '/edu/onlineEdu/mylctrum/selectMyStudyCount.json',
                            dataType: 'json',
                            data: null,
                            success: function (data) {
                                $('.mypageSubLayer').find('#studyCount').html(data.studyCount);
                            }
                        });
                    }
                </script>
            </header>
        </div>
    </div>

    <c:choose>
        <c:when test='${fn:indexOf(pathData[0], "HOME") > -1 }'>
            <div class="sub_visual"></div>
        </c:when>
        <c:when test='${fn:indexOf(pathData[0], "??????????????????") > -1 }'>
            <div class="sub_visual img_001"></div>
        </c:when>
        <c:when test='${fn:indexOf(pathData[0], "???????????????") > -1 }'>
            <div class="sub_visual img_003"></div>
        </c:when>
        <c:when test='${fn:indexOf(pathData[0], "??????????????????") > -1 }'>
            <div class="sub_visual img_002"></div>
        </c:when>
        <c:when test='${fn:indexOf(pathData[0], "????????????") > -1 }'>
            <div class="sub_visual img_004"></div>
        </c:when>
        <c:when test='${fn:indexOf(pathData[0], "?????????????????????") > -1 }'>
            <c:choose>
                <c:when test="${fn:indexOf(pathData[1], '????????????') > -1 }">
                    <div class="sub_visual img_006"></div>
                </c:when>
                <c:when test="${fn:indexOf(pathData[1], '?????? ?????????') > -1 }">
                    <div class="sub_visual img_007"></div>
                </c:when>
                <c:when test="${fn:indexOf(pathData[1], '??????????????????') > -1 }">
                    <div class="sub_visual img_008"></div>
                </c:when>
                <c:when test="${fn:indexOf(pathData[1], '????????????') > -1 }">
                    <div class="sub_visual img_009"></div>
                </c:when>
                <c:when test="${fn:indexOf(pathData[1], '????????????????????????') > -1 }">
                    <div class="sub_visual img_010"></div>
                </c:when>
                <c:otherwise>
                    <div class="sub_visual img_005"></div>
                </c:otherwise>
            </c:choose>
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>
</div>
