<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc" %>

<sec:authentication var="user" property="principal"/>
<c:set value="${user != 'anonymousUser' ? user.username : '' }" var="userVrify"/>
<c:set value="${userVrify }" var="idCeck"/>

<form id="frm" name="frm" action="/edu/onlineEdu/${paramVO.programId}/view.do?menuNo=${paramVO.menuNo }" method="post" class="form-inline">
    <input type="hidden" name="pageQueryString" value='<c:out value="${pageQueryString }" escapeXml="false"/>'>

    <input type="hidden" name="pGubun1" id="pGubun1" value="${param.pGubun1 }"/>
    <input type="hidden" name="pGubun2" id="pGubun2" value="${param.pGubun2 }"/>
    <input type="hidden" name="pGubun3" id="pGubun3" value="${param.pGubun3 }"/>

    <input type="hidden" name="p_subj" id="p_subj" value="${param.p_subj }"/>
    <input type="hidden" name="p_subjnm" id="p_subjnm" value="${param.p_subjnm }"/>
    <input type="hidden" name="p_isonoff" id="p_isonoff" value="${param.p_isonoff }"/>
    <input type="hidden" name="p_scupperclass" id="p_scupperclass" value="${param.p_scupperclass }"/>
    <input type="hidden" name="p_uclassnm" id="p_uclassnm" value="${param.p_uclassnm }"/>
    <input type="hidden" name="p_year" id="p_year" value="${param.p_year }"/>
    <input type="hidden" name="p_subjseq" id="p_subjseq" value="${param.p_subjseq }"/>

    <input type="hidden" name="p_searchtext" id="p_searchtext" value="${param.p_searchtext }"/>
    <input type="hidden" name="p_orders" id="p_orders" value="<c:out value="${param.p_orders }"/>"/>
    <input type="hidden" name="p_ordersnm" id="p_ordersnm" value="<c:out value="${param.p_ordersnm }"/>"/>
    <input type="hidden" name="p_tabselect" id="p_tabselect" value="<c:out value="${param.p_tabselect }"/>"/>

    <!-- paging s -->
    <input type="hidden" name="gubun" id="gubun" value="<c:out value='${param.gubun }' />"/>
    <input type="hidden" name="option1" id="option1" value="<c:out value='${param.option1 }' />"/>
    <input type="hidden" name="option5" id="option5" value="<c:out value='${param.option5 }' />"/>
    <input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${param.pageIndex }' />"/>
    <!-- paging e -->

    <!-- 학습하기 파라미터 s -->
    <input type="hidden" name="s_year" id="s_year" value=""/>
    <input type="hidden" name="s_cpsubj" id="s_cpsubj" value=""/>
    <input type="hidden" name="s_cpsubjseq" id="s_cpsubjseq" value=""/>
    <input type="hidden" name="s_company" id="s_company" value=""/>
    <input type="hidden" name="s_contenttype" id="s_contenttype" value=""/>
    <input type="hidden" name="s_subj" id="s_subj" value=""/>
    <input type="hidden" name="s_subjseq" id="s_subjseq" value=""/>
    <input type="hidden" name="s_lesson" id="s_lesson" value=""/>
    <!-- 학습하기 파라미터 e -->

    <input type="hidden" name="p_isLesson" id="p_isLesson" value="<c:out value='${subjDuplCheck }' />"/>
</form>

<div class="over-hidden sub_contents_header">
    <div class="linemap_wrap"> <!-- fl class 삭제 -->
        <ul class="col-12 linemap_con">
            <li><a href="/edu/main/main.do"><span style="clip: rect(1px, 1px, 1px, 1px); position:absolute;">Home</span></a></li>
            <li><a href="javascript:void(0);" tabindex="-1"><span>카테고리</span></a></li>
            <li><a href="javascript:void(0);" tabindex="-1"><span>로그인 후 수강</span></a></li>
        </ul>
    </div>
</div>

<div class="sub_title s_tit02">
    <div class="col-center mw-1280">로그인 후 수강</div>
</div>

<!-- 과정 상세정보 -->
<div class="lecture_info_box">
    <div class="col-center mw-1280">
        <div class="mb20 alert big_box type_1 pb_30" style="overflow:hidden;">
            <p>
                <c:if test="${not empty view.lvnm}">
                    <c:choose>
                        <c:when test="${view.lvcd eq 'L0101' or view.lvcd eq 'L0201'}">
                            <span class="tag L1">${view.lvnm}</span>
                        </c:when>
                        <c:when test="${view.lvcd eq 'L0102' or view.lvcd eq 'L0202'}">
                            <span class="tag L2">${view.lvnm}</span>
                        </c:when>
                        <c:when test="${view.lvcd eq 'L0103' or view.lvcd eq 'L0203'}">
                            <span class="tag L3">${view.lvnm}</span>
                        </c:when>
                    </c:choose>
                </c:if>
            </p>
            <p class="fl alert_title" style="margin:0;">
                ${view.subjnm}
            </p>

            <span class="gray_txt view">
                <c:if test="${not empty view.g1nm}">
                    ${view.g1nm}
                </c:if>
                <c:if test="${not empty view.g2nm}">
                    > ${view.g2nm}
                </c:if>
                <c:if test="${not empty view.g3nm}">
                    > ${view.g3nm}
                </c:if>
            </span>
        </div>

        <div class="col-12 online_edu_card_view_wrap">
            <% pageContext.setAttribute("crlf", "\\"); %>
            <div class="img_box">
                <c:choose>
                    <c:when test="${view.introducefilenamenew != null and view.introducefilenamenew != '' }">
                        <img alt="${view.subjnm }" src="<c:out value="${view.introducefilenamenew}" />" />
                        <%--<img src="	https://edu.kocca.kr/upload/renewsnail/CB21005.png" alt="이미지 설명들어가는 곳">--%>
                    </c:when>
                    <c:otherwise>
                        <img alt="${view.subjnm }" src="/edu/images/edupro/stepsub-03.png" width="381px;" height="247px;"/>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="info_box">
                <div class="sub_board_body">
                    <table class="contents_insight_view style_2">
                        <caption>과정정보</caption>
                        <colgroup>
                            <col width="20%">
                            <col width="auto">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>제작연도</th>
                            <td class="color_gray">${view.crdate}</td>
                        </tr>
                        <tr>
                            <th class="lett_s">차 시 수</th>
                            <td class="color_gray">${lessonListCnt}</td>
                        </tr>
                        <tr>
                            <th>러닝타임</th>
                            <td class="color_gray">${view.runningTime}</td>
                        </tr>
                        <tr>
                            <th class="lett_s">강 사 명</th>
                            <td class="color_gray">${view.tutor2}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-12 mt15 board_util_btn_con">
            <c:if test='${view.preurl != null }'>
                <%--<a href="javascript:openWindowPopup('${view.preurl }', '강의 미리보기', '${view.prewidth }', '${view.preheight }');" class="fl btn_style_0 green edu_prev_view online_edu" title="새창열림">--%>
                <a href="javascript:openWindowPopup('${view.preurl }', '강의 미리보기', '${view.prewidth }', '580');" class="fl btn_style_0 green edu_prev_view online_edu" title="새창열림">
                    강의 미리보기
                </a>
            </c:if>

            <span>
                <a href="javascript:void(0);" class="btn_style_0 blue edit online_edu" onclick="fnCmdLrnAction('${view.year}', '', '', '', '${view.contenttype }', '${view.subj }', '${view.subjseq }', '', '${view.subjnm }', '${param.p_scupperclass }'); return false;">
                    학습하기
                </a>

                <a href="javascript:void(0);" class="btn_style_0 gray online_edu" onclick="fnCmdSearchList('${param.pGubun1 }', '${param.pGubun2 }', '${param.pGubun3 }', '${param.p_ordersnm }', '${param.p_orders }'); return false;">
                    다른 과정 보기
                </a>
            </span>
        </div>
    </div>
</div>

<!-- 과정소개 -->
<div class="col-center mw-1280">
    <p class="col-12 online_edu_card_view_title">과정소개</p>
    <div class="col-12 mb70 sub_board_body">
        <table class="contents_insight_view style_2">
            <caption>과정소개</caption>
            <colgroup>
                <col width="20%">
                <col width="auto">
            </colgroup>
            <tbody>
            <tr>
                <th>교육대상</th>
                <td class="color_gray">
                    <c:set var="arrayofedumans" value="${fn:split(view.edumans,'-')}"/>
                    <c:forEach var="i" begin="0" end="${fn:length(arrayofedumans)-1 }">
                        <div>${arrayofedumans[i] }</div>
                    </c:forEach>
                </td>
            </tr>
            <c:if test="${fn:length(view.tutor) > 0 }">
                <tr>
                    <th>강사명</th>
                    <td class="color_gray">
                        <div>${view.tutor }</div>
                    </td>
                </tr>
            </c:if>
            <tr>
                <th>교육목표</th>
                <td class="color_gray">
                    <c:set var="arrayofsubjintro" value="${fn:split(view.intro,'-')}"/>
                    <c:forEach var="i" begin="0" end="${fn:length(arrayofsubjintro) }">
                        <div>
                            <c:out value="${arrayofsubjintro[i] }"/>
                        </div>
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <th>교육내용</th>
                <td class="color_gray">
                    <c:set var="arrayofsubjexplain" value="${fn:split(view.explain,'-')}"/>
                    <c:forEach var="i" begin="0" end="${fn:length(arrayofsubjexplain) }">
                        <div>${arrayofsubjexplain[i] }</div>
                    </c:forEach>
                </td>
            </tr>
            <c:if test="${view.memo != null }">
                <tr>
                    <th>참고문헌</th>
                    <td class="color_gray">
                        <c:set var="arrayofsubjmemo" value="${fn:split(view.memo,'-')}"/>
                        <c:forEach var="i" begin="0" end="${fn:length(arrayofsubjmemo) }">
                            <div>${arrayofsubjmemo[i] }</div>
                        </c:forEach>
                    </td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>

<!-- 차시리스트 -->
<div class="col-center mw-1280">
    <p class="col-12 online_edu_card_view_title">차시리스트</p>
    <div class="col-12 mb70 sub_board_body">
        <table class="board_type_0 online_edu">
            <caption>차시리스트 목록(차시, 강의주제로 구분되는 표)</caption>
            <colgroup>
                <col style="width:20%;"/>
                <col/>
                <col style="width:100px;"/>
            </colgroup>
            <thead>
            <tr>
                <th scope="col">차시</th>
                <th scope="col" colspan="2">강의주제</th>
            </tr>
            </thead>
            <tbody>

            <!-- 차시 목록 s -->
            <c:forEach items="${lessonList }" var="item" varStatus="status">
                <tr>
                    <td>${item.lesson }</td>
                    <td class="contents_text">${item.sdesc }</td>
                    <td>
                        <div class="board_util_btn_con center">
                            <c:choose>
                                <c:when test="${empty item.firstedu }">
                                    <a href="javascript:void(0);" class="btn_style_0 end_online_edu_edu" onclick="fnCmdLrnAction('${view.year}','','','${view.company }','${view.contenttype }','${view.subj }','${view.subjseq }', '${item.lesson }', '${view.subjnm }', '${param.p_scupperclass }'); return false;">
                                        학습하기
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="javascript:void(0);" class="btn_style_0 end_online_edu_edu end_btn" onclick="fnCmdLrnAction('${view.year}','','','${view.company }','${view.contenttype }','${view.subj }','${view.subjseq }', '${item.lesson }', '${view.subjnm }', '${param.p_scupperclass }'); return false;">
                                        <span class="end_online_edu_edu">학습완료</span>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            <!-- 차시 목록 e -->
            </tbody>
        </table>
    </div>
</div>

<!-- 추천 학습 경로에서의 해당 단계 -->
<c:set var="nextcode" value=""/>
<c:set var="upperSystm" value=""/>
<c:set var="middleSystm" value=""/>
<c:set var="lowSystm" value=""/>

<!-- 참여 강사 정보-->
<!-- 오픈 이후 개발 예정
<div class="col-center mw-1280">
<p class="col-12 online_edu_card_view_title">참여 강사 정보</p>
<ul class="col-12 mb70 teach_table_box">
<li>
<table class="contents_insight_view style_2">
<caption>참여 강사 정보</caption>
<colgroup>
<col width="10%">
<col width="auto">
</colgroup>
<tbody>
<tr>
<th>
<div><img src="" alt=""></div>
</th>
<td class="color_gray">
<p class="teach_name">강사이름</p>
<p class="teach_intr">강사 소개글 2줄</p>
<p class="teach_port">강사의 이력</p>
<p class="teach_port">강사의 이력</p>
</td>
</tr>
</tbody>
</table>
</li>
<li>
<table class="contents_insight_view style_2">
<caption>참여 강사 정보</caption>
<colgroup>
<col width="10%">
<col width="auto">
</colgroup>
<tbody>
<tr>
<th>
<div><img src="" alt=""></div>
</th>
<td class="color_gray">
<p class="teach_name">강사이름</p>
<p class="teach_intr">강사 소개글 2줄</p>
<p class="teach_port">강사의 이력</p>
<p class="teach_port">강사의 이력</p>
</td>
</tr>
</tbody>
</table>
</li>
</ul>
</div>
-->

<!-- 연계과정 html 현재 클릭시 페이지 이동이 안됨 -->
<c:if test="${nextProposeSubjList ne null and nextProposeSubjList.size() > 0 }">
    <div class="fwo_card_list_box fwo_card01 col-center mw-1280">
        <span class="main_title">연계과정</span>
        <div class="fwo_card swiper-container">
            <ul class="swiper-wrapper">
                <c:forEach items="${nextProposeSubjList }" var="item2" varStatus="status2">
                    <li class="swiper-slide">
                        <!-- 썸네일 start -->
                        <div class="fwo_snail_box">
                            <a class="show-block" href="javascript:void(0);" onclick="fnCmdViewPage('${item2.type }', '${item2.courseId }', '${item2.courseName }', '${item2.isonoff }', '${item2.scupperclass }', '${item2.uclassnm }', '${item2.year }', '${item2.subjseq }'); return false;">
                                <img alt="<c:out value="${not empty item2.courseName ? item2.courseName : '다음강좌' }" />" src='<c:out value="${item2.imgfile }" />'/>
                            </a>
                            <!-- 설명란 start-->
                            <div class="fwo_info_box">
                                <h3 class="fwo_tit_box">
                                    <a class="show-block" href="javascript:void(0);" onclick="fnCmdViewPage('${item2.type }', '${item2.courseId }', '${item2.courseName }', '${item2.isonoff }', '${item2.scupperclass }', '${item2.uclassnm }', '${item2.year }', '${item2.subjseq }'); return false;">${item2.courseName }</a>
                                </h3>
                                <c:if test="${not empty item2.lvnm}">
                                    <c:choose>
                                        <c:when test="${item2.lvcd eq 'L0101' or item2.lvcd eq 'L0201'}">
                                            <span class="tag L1">${item2.lvnm}</span>
                                        </c:when>
                                        <c:when test="${item2.lvcd eq 'L0102' or item2.lvcd eq 'L0202'}">
                                            <span class="tag L2">${item2.lvnm}</span>
                                        </c:when>
                                        <c:when test="${item2.lvcd eq 'L0103' or item2.lvcd eq 'L0203'}">
                                            <span class="tag L3">${item2.lvnm}</span>
                                        </c:when>
                                    </c:choose>
                                </c:if>

                                <c:if test="${not empty item2.g3nm}">
                                    <p>${item2.g3nm}</p>
                                </c:if>

                                <c:if test="${empty item2.g3nm}">
                                    <p>${item2.g2nm}</p>
                                </c:if>
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
            <div><button type="button" class="swiper-button-prev swiper-button-disabled" title="이전 배너보기"></button></div>
            <div><button type="button" class="swiper-button-next" title="다음 배너가기"></button></div>
        </div>
    </div>
</c:if>

<script type="text/javascript">
    var realmList = $(".online_edu_card_wrap");
    var realmParent = realmList.parent();
    var len = realmList.length;
    var moreBtn = $(".online_edu_card_view_btn_inner");
    var pageBlockNum = 3;

    function openWindowPopup(winUrl, name, w, h) {
        var props = "";
        props += "top=50px,left=50px,height=" + h + ",width=" + w;

        previewPopupWin = window.open("", name, props, false);
        previewPopupWin.location.href = winUrl;
    }

    function getBlockHei() {
        var blockLen = len;
        if (len >= pageBlockNum) blockLen = pageBlockNum;

        var hei = 0;
        for (var i = 0; i < blockLen; i++) {
            if (hei < $(realmList[i]).outerHeight()) hei = $(realmList[i]).outerHeight();
        }
        return hei;
    }

    function initHeight(h) {
        TweenMax.to($(realmParent), 0.5, {"height": h + "px", ease: Cubic.easeInOut});
    }

    function moreBtnClick() {
        var blockHeight = getBlockHei();
        var totalHeight = blockHeight * Math.ceil(len / pageBlockNum);
        initHeight(totalHeight);
        moreBtn.parent().hide();
    }

    $(document).ready(function () {
        var stepLinks = $(".step li>a"); // 해당 탭리스트 링크 셀렉트
        $(stepLinks).each(function (index) {
            $(this).click(function () {
                var boxH = $(this).parent().find(".box").height() + 120;

                $(this).parent().addClass('on').siblings().removeClass('on');
                $('.box').slideUp("fast");
                var boxHref = $(this).attr('href');
                $(boxHref).slideDown("fast");
                return false;
            });
        });
        $(".step .closer").click(function () {
            $('.box').slideUp("fast");
        });

        if (len <= pageBlockNum) moreBtn.parent().hide();

        var blockHeight = getBlockHei();

        initHeight(blockHeight);
    });

    //과정 조회
    function fnCmdSearchList(gubun1, gubun2, gubun3, ordersnm, orders) {
        $("#pGubun1").val(gubun1);
        $("#pGubun2").val(gubun2);
        $("#pGubun3").val(gubun3);
        $("#p_ordersnm").val(ordersnm);
        $("#p_orders").val(orders);

        $("#p_searchtext").val($.trim($("#p_searchtext").val()));
        $("#frm").attr({
            action: "/edu/onlineEdu/realm/list.do?menuNo=<c:out value='${param.menuNo }'/>",
            method: "post",
            target: "_self"
        });
        $("#frm").submit();
    }

    //과정 상세화면
    function fnCmdViewPage(type, subj, subjnm, isonoff, scupperclass, uclassnm, year, subjseq) {
        $("#p_subj").val(subj);
        $("#p_subjnm").val(subjnm);
        $("#p_isonoff").val(isonoff);
        $("#p_scupperclass").val(scupperclass);
        $("#p_uclassnm").val(uclassnm);
        $("#p_year").val(year);
        $("#p_subjseq").val(subjseq);

        var url = "";
        if (type == "S") {
            url = "/edu/onlineEdu/realm/view.do?menuNo=<c:out value='${paramVO.menuNo }'/>&gubun=" + $("#pGubun1").val() + "&option1=" + $("#pGubun2").val() + "&option5=" + $("#pGubun3").val() + "&pageIndex=<c:out value='${param.pageIndex}' />";
        } else {
            url = "/edu/onlineEdu/openLecture/view.do?pSeq=" + subj + "&menuNo=500085&pageIndex=1";
        }

        $("#frm").attr({
            action: url,
            method: "post",
            target: "_self"
        });
        $("#frm").submit();
    }

    //학습하기
    function fnCmdLrnAction(year, cpsubj, cpsubjseq, company, contenttype, subj, subjseq, lesson, subjnm, upperclass) {
        var msg = "";

        if (lesson != "") {
            msg = subjnm + " 과정 " + lesson + " 차시를 학습하시겠습니까?";
        } else {
            lesson = "001";
            msg = subjnm + " 과정을 학습하시겠습니까?";
        }
        if ("CK15002" == subj) {
            msg = "※ 본 과정은 [한국양성평등교육진흥원] 콘텐츠를 지원받아 운영되는 과정으로 수료증이 발급되지 않습니다.\n\n 교육시간으로 인정되는 과정을 원하는 경우에는 [한국양성평등교육진흥원(egenedu.kigepe.or.kr/)]으로 신청하시기 바랍니다.\n\n" + msg;
        }

        //Y 학습기간
        //N 학습기간 종료
        if ($("#p_isLesson").val() == "Y") {
            if (confirm("학습기간이 끝났습니다. \n계속 하시면 지난 과정은 초기화 됩니다. \n마이페이지 > 나의 강의실 > 학습이력에서 확인 가능합니다.")) {

            } else {
                return false;
            }
        }
        if (confirm(msg)) {
            // rsg20171120
            if (upperclass == "X01") {
                alert("폐지된 과정입니다.");
            } else {
                if (typeof previewPopupWin !== "undefined")
                    previewPopupWin.close();

                $("#s_year").val(year);
                $("#s_cpsubj").val(cpsubj);
                $("#s_cpsubjseq").val(cpsubjseq);
                $("#s_company").val(company);
                $("#s_contenttype").val(contenttype);
                $("#s_subj").val(subj);
                $("#s_subjseq").val(subjseq);
                $("#s_lesson").val(lesson);
                $("#p_subjnm").val(subjnm);
                $("#frm").attr({
                    action: "/edu/onlineEdu/realm/viewEdu.do?menuNo=<c:out value='${param.menuNo }'/>",
                    method: "post",
                    target: "_self"
                });
                $("#frm").submit();

                /* $.get(
                  "/edu/onlineEdu/realm/viewEdu.do?menuNo=

                <c:out value='${paramVO.menuNo }'/>",
	              { s_year        : year,
	            	s_cpsubj      : cpsubj,
	            	s_cpsubjseq   : cpsubjseq, 
	            	s_company     : company,
	            	s_contenttype : contenttype,
	            	s_subj        : subj,
	            	s_subjseq     : subjseq,
	            	s_lesson      : lesson
	              }
	            ); */

                //var url = "/edu/onlineEdu/realm/viewEdu.do?menuNo=<c:out value='${paramVO.menuNo }'/>&s_year="+year+"&s_cpsubj="+cpsubj+"&s_cpsubjseq="+cpsubjseq+"&s_company="+company+"&s_contenttype="+contenttype+"&s_subj="+subj+"&s_subjseq="+subjseq+"&s_lesson="+lesson;
                //$(location).attr('href', url);
            }
        }
    }

    //다음 차시 넘어가는 기능 추가 rsg20171117
    function receiveMessage(event) {
        if (event.origin.indexOf("edu.kocca.or.kr") == -1)//강의미리보기 도메인 확인
            return;
        //console.log( "receiveMessage" );
        fnCmdLrnAction('${view.year}', '', '', '', '${view.contenttype }', '${view.subj }', '${view.subjseq }', '', '${view.subjnm }', '${param.p_scupperclass }'); // 학습하기 버튼 클릭
    }

    function pad(n, width) {//정수 자릿수 변경
        n = n + '';
        return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
    }

    window.addEventListener("message", receiveMessage, false);

</script>

