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

    <!-- ???????????? ???????????? s -->
    <input type="hidden" name="s_year" id="s_year" value=""/>
    <input type="hidden" name="s_cpsubj" id="s_cpsubj" value=""/>
    <input type="hidden" name="s_cpsubjseq" id="s_cpsubjseq" value=""/>
    <input type="hidden" name="s_company" id="s_company" value=""/>
    <input type="hidden" name="s_contenttype" id="s_contenttype" value=""/>
    <input type="hidden" name="s_subj" id="s_subj" value=""/>
    <input type="hidden" name="s_subjseq" id="s_subjseq" value=""/>
    <input type="hidden" name="s_lesson" id="s_lesson" value=""/>
    <!-- ???????????? ???????????? e -->

    <input type="hidden" name="p_isLesson" id="p_isLesson" value="<c:out value='${subjDuplCheck }' />"/>
</form>

<div class="over-hidden sub_contents_header">
    <div class="linemap_wrap"> <!-- fl class ?????? -->
        <ul class="col-12 linemap_con">
            <li><a href="/edu/main/main.do"><span style="clip: rect(1px, 1px, 1px, 1px); position:absolute;">Home</span></a></li>
            <li><a href="javascript:void(0);" tabindex="-1"><span>????????????</span></a></li>
            <li><a href="javascript:void(0);" tabindex="-1"><span>????????????</span></a></li>
        </ul>
    </div>
</div>

<div class="sub_title s_tit02">
    <div class="col-center mw-1280">????????????</div>
</div>

<!-- ?????? ???????????? -->
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
                        <img alt="${view.subjnm }" src="<c:out value="${view.introducefilenamenew}" />" width="381px;" height="247px;"/>
                    </c:when>
                    <c:otherwise>
                        <img alt="${view.subjnm }" src="/edu/images/edupro/stepsub-03.png" width="381px;" height="247px;"/>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="info_box">
                <div class="sub_board_body">
                    <table class="contents_insight_view style_2">
                        <caption>????????????</caption>
                        <colgroup>
                            <col width="20%">
                            <col width="auto">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>????????????</th>
                            <td class="color_gray">??????</td>
                        </tr>
                        <tr>
                            <th>????????????</th>
                            <td class="color_gray">???????????? ?????? 30 ???</td>
                        </tr>
                        <tr>
                            <th>????????????</th>
                            <td class="color_gray">1??????</td>
                        </tr>
                        <tr>
                            <th>?????????</th>
                            <td class="color_gray">??????</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-12 mt15 board_util_btn_con">
            <c:if test='${view.preurl != null }'>
                <a href="javascript:openWindowPopup('${view.preurl }', '?????? ????????????', '${view.prewidth }', '${view.preheight }');" class="fl btn_style_0 green edu_prev_view online_edu" title="????????????">
                    ?????? ????????????
                </a>
            </c:if>

            <span>
                <a href="javascript:void(0);" class="btn_style_0 blue edit online_edu" onclick="fnCmdLrnAction('${view.year}', '', '', '', '${view.contenttype }', '${view.subj }', '${view.subjseq }', '', '${view.subjnm }', '${param.p_scupperclass }'); return false;">
                    ????????????
                </a>

                <a href="javascript:void(0);" class="btn_style_0 gray online_edu" onclick="fnCmdSearchList('${param.pGubun1 }', '${param.pGubun2 }', '${param.pGubun3 }', '${param.p_ordersnm }', '${param.p_orders }'); return false;">
                    ?????? ?????? ??????
                </a>
            </span>
        </div>
    </div>
</div>

<!-- ???????????? -->
<div class="col-center mw-1280">
    <p class="col-12 online_edu_card_view_title">????????????</p>
    <div class="col-12 mb70 sub_board_body">
        <table class="contents_insight_view style_2">
            <caption>????????????</caption>
            <colgroup>
                <col width="20%">
                <col width="auto">
            </colgroup>
            <tbody>
            <tr>
                <th>????????????</th>
                <td class="color_gray">
                    <c:set var="arrayofedumans" value="${fn:split(view.edumans,'-')}"/>
                    <c:forEach var="i" begin="0" end="${fn:length(arrayofedumans)-1 }">
                        <div>${arrayofedumans[i] }</div>
                    </c:forEach>
                </td>
            </tr>
            <c:if test="${fn:length(view.tutor) > 0 }">
                <tr>
                    <th>?????????</th>
                    <td class="color_gray">
                        <div>${view.tutor }</div>
                    </td>
                </tr>
            </c:if>
            <tr>
                <th>????????????</th>
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
                <th>????????????</th>
                <td class="color_gray">
                    <c:set var="arrayofsubjexplain" value="${fn:split(view.explain,'-')}"/>
                    <c:forEach var="i" begin="0" end="${fn:length(arrayofsubjexplain) }">
                        <div>${arrayofsubjexplain[i] }</div>
                    </c:forEach>
                </td>
            </tr>
            <c:if test="${view.memo != null }">
                <tr>
                    <th>????????????</th>
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

<!-- ??????????????? -->
<div class="col-center mw-1280">
    <p class="col-12 online_edu_card_view_title">???????????????</p>
    <div class="col-12 mb70 sub_board_body">
        <table class="board_type_0 online_edu">
            <caption>??????????????? ??????(??????, ??????????????? ???????????? ???)</caption>
            <colgroup>
                <col style="width:20%;"/>
                <col/>
                <col style="width:100px;"/>
            </colgroup>
            <thead>
            <tr>
                <th scope="col">??????</th>
                <th scope="col" colspan="2">????????????</th>
            </tr>
            </thead>
            <tbody>

            <!-- ?????? ?????? s -->
            <c:forEach items="${lessonList }" var="item" varStatus="status">
                <tr>
                    <td>${item.lesson }</td>
                    <td class="contents_text">${item.sdesc }</td>
                    <td>
                        <div class="board_util_btn_con center">
                            <c:choose>
                                <c:when test="${empty item.firstedu }">
                                    <a href="javascript:void(0);" class="btn_style_0 end_online_edu_edu" onclick="fnCmdLrnAction('${view.year}','','','${view.company }','${view.contenttype }','${view.subj }','${view.subjseq }', '${item.lesson }', '${view.subjnm }', '${param.p_scupperclass }'); return false;">
                                        ????????????
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="javascript:void(0);" class="btn_style_0 end_online_edu_edu end_btn" onclick="fnCmdLrnAction('${view.year}','','','${view.company }','${view.contenttype }','${view.subj }','${view.subjseq }', '${item.lesson }', '${view.subjnm }', '${param.p_scupperclass }'); return false;">
                                        <span class="end_online_edu_edu">????????????</span>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            <!-- ?????? ?????? e -->
            </tbody>
        </table>
    </div>
</div>

<!-- ?????? ?????? ??????????????? ?????? ?????? -->
<c:set var="nextcode" value=""/>
<c:set var="upperSystm" value=""/>
<c:set var="middleSystm" value=""/>
<c:set var="lowSystm" value=""/>

<!-- ?????? ?????? ??????-->
<!-- ?????? ?????? ?????? ??????
<div class="col-center mw-1280">
<p class="col-12 online_edu_card_view_title">?????? ?????? ??????</p>
<ul class="col-12 mb70 teach_table_box">
<li>
<table class="contents_insight_view style_2">
<caption>?????? ?????? ??????</caption>
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
<p class="teach_name">????????????</p>
<p class="teach_intr">?????? ????????? 2???</p>
<p class="teach_port">????????? ??????</p>
<p class="teach_port">????????? ??????</p>
</td>
</tr>
</tbody>
</table>
</li>
<li>
<table class="contents_insight_view style_2">
<caption>?????? ?????? ??????</caption>
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
<p class="teach_name">????????????</p>
<p class="teach_intr">?????? ????????? 2???</p>
<p class="teach_port">????????? ??????</p>
<p class="teach_port">????????? ??????</p>
</td>
</tr>
</tbody>
</table>
</li>
</ul>
</div>
-->

<!-- ???????????? html ?????? ????????? ????????? ????????? ?????? -->
<c:if test="${nextProposeSubjList ne null and nextProposeSubjList.size() > 0 }">
    <div class="fwo_card_list_box fwo_card01 col-center mw-1280">
        <span class="main_title">????????????</span>
        <div class="fwo_card swiper-container">
            <ul class="swiper-wrapper">
                <c:forEach items="${nextProposeSubjList }" var="item2" varStatus="status2">
                    <li class="swiper-slide">
                        <!-- ????????? start -->
                        <div class="fwo_snail_box">
                            <a class="show-block" href="javascript:void(0);" onclick="fnCmdViewPage('${item2.type }', '${item2.courseId }', '${item2.courseName }', '${item2.isonoff }', '${item2.scupperclass }', '${item2.uclassnm }', '${item2.year }', '${item2.subjseq }'); return false;">
                                <img alt="<c:out value="${not empty item2.courseName ? item2.courseName : '????????????' }" />" src='<c:out value="${item2.imgfile }" />'/>
                            </a>
                            <!-- ????????? start-->
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
                            <!-- ????????? start-->
                        </div>
                        <!-- ????????? end -->
                    </li>
                </c:forEach>
            </ul>
        </div>
        <!-- ?????? ?????? ????????? ?????? ?????? ???????????? -->
        <div class="swiper_btn_box">
            <div class="swiper-button-prev swiper-button-disabled"></div>
            <div class="swiper-button-next"></div>
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
        var stepLinks = $(".step li>a"); // ?????? ???????????? ?????? ?????????
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

    //?????? ??????
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

    //?????? ????????????
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

    //????????????
    function fnCmdLrnAction(year, cpsubj, cpsubjseq, company, contenttype, subj, subjseq, lesson, subjnm, upperclass) {
        var msg = "";

        if (lesson != "") {
            msg = subjnm + " ?????? " + lesson + " ????????? ?????????????????????????";
        } else {
            lesson = "001";
            msg = subjnm + " ????????? ?????????????????????????";
        }
        if ("CK15002" == subj) {
            msg = "??? ??? ????????? [?????????????????????????????????] ???????????? ???????????? ???????????? ???????????? ???????????? ???????????? ????????????.\n\n ?????????????????? ???????????? ????????? ????????? ???????????? [?????????????????????????????????(egenedu.kigepe.or.kr/)]?????? ??????????????? ????????????.\n\n" + msg;
        }

        //Y ????????????
        //N ???????????? ??????
        if ($("#p_isLesson").val() == "Y") {
            if (confirm("??????????????? ???????????????. \n?????? ????????? ?????? ????????? ????????? ?????????. \n??????????????? > ?????? ????????? > ?????????????????? ?????? ???????????????.")) {

            } else {
                return false;
            }
        }
        if (confirm(msg)) {
            // rsg20171120
            if (upperclass == "X01") {
                alert("????????? ???????????????.");
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

    //?????? ?????? ???????????? ?????? ?????? rsg20171117
    function receiveMessage(event) {
        if (event.origin.indexOf("edu.kocca.or.kr") == -1)//?????????????????? ????????? ??????
            return;
        //console.log( "receiveMessage" );
        fnCmdLrnAction('${view.year}', '', '', '', '${view.contenttype }', '${view.subj }', '${view.subjseq }', '', '${view.subjnm }', '${param.p_scupperclass }'); // ???????????? ?????? ??????
    }

    function pad(n, width) {//?????? ????????? ??????
        n = n + '';
        return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
    }

    window.addEventListener("message", receiveMessage, false);

</script>

