<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc" %>
<%@ taglib uri="http://www.unp.co.kr/util" prefix="util" %>
<ccc:constantsMap className="kr.co.unp.bbs.vo.SearchVO" var="SearchVO"/>
<jsp:useBean id="todayNow" class="java.util.Date"/>
<fmt:formatDate value="${todayNow}" var="today" pattern="yyyy-MM-dd"/>
<c:url value="/${paramVO.siteName }/bbs/${paramVO.bbsId}/list.do?menuNo=${param.menuNo }" var="searchUrl"/>
<!-- bdList -->
<div class="over-hidden sub_contents_header">
    <div class="linemap_wrap"> <!-- fl class 삭제 -->
        <ul class="col-12 linemap_con">
            <li><a href="/edu/main/main.do"><span style="clip: rect(1px, 1px, 1px, 1px); position:absolute;">Home</span></a>
            </li>
            <li><a href="javascript:void(0);" tabindex="-1"><span>이벤트</span></a></li>
        </ul>
    </div>
</div>

<div class="sub_title s_tit02">
    <div class="col-center mw-1280">이벤트</div>
</div>
<form id="eventFrm" name="eventFrm" method="post">
    <input type="hidden" id="op3" name="op3" value="">
</form>

<script>
    function goEvent(type) {
        document.eventFrm.op3.value = type;
        document.eventFrm.action = "/edu/bbs/B0000048/list.do?menuNo=500205";
        document.eventFrm.submit();
    }
</script>

<%-- 7개 tabs일때
<div class="tab_style_1_con event-tab">
	<ul class="tab_style_1 two_tab">
		<li <c:if test="${paramVO.op3 eq null || paramVO.op3 eq '0'}">class='active'</c:if>>
			<a href="javascript:void(0);" onclick="goEvent('0')">
				<span>이벤트</span>
			</a>
		</li>
		<li <c:if test="${paramVO.op3 eq '1'}">class='active'</c:if>>
			<a href="javascript:void(0);" onclick="goEvent('1')">
				<span>추천콘텐츠</span>
			</a>
		</li>
		<li <c:if test="${paramVO.op3 eq '2'}">class='active'</c:if>>
			<a href="javascript:void(0);" onclick="goEvent('2')">
				<span>창의인재동반</span>
			</a>
		</li>
		<li <c:if test="${paramVO.op3 eq '3'}">class='active'</c:if>>
			<a href="javascript:void(0);" onclick="goEvent('3')">
				<span>AI콘텐츠창작</span>
			</a>
		</li>
		<li <c:if test="${paramVO.op3 eq '4'}">class='active'</c:if>>
			<a href="javascript:void(0);" onclick="goEvent('4')">
				<span>콘텐츠임팩트</span>
			</a>
		</li>
		<li <c:if test="${paramVO.op3 eq '5'}">class='active'</c:if>>
			<a href="javascript:void(0);" onclick="goEvent('5')">
				<span>콘텐츠인사이트</span>
			</a>
		</li>
		<li <c:if test="${paramVO.op3 eq '6'}">class='active'</c:if>>
			<a href="javascript:void(0);" onclick="goEvent('6')">
				<span>콘텐츠스텝업</span>
			</a>
		</li>
	</ul>
</div>
--%>

<div class="tab_style_1_con event-tab">
    <ul class="tab_style_1 five_tab">
        <li <c:if test="${paramVO.op3 eq null || paramVO.op3 eq '0'}">class='active'</c:if>>
            <a href="javascript:void(0);" onclick="goEvent('0')">
                <span>전체보기</span>
            </a>
        </li>
        <li <c:if test="${paramVO.op3 eq '1'}">class='active'</c:if>>
            <a href="javascript:void(0);" onclick="goEvent('1')">
                <span>에듀코카 이벤트</span>
            </a>
        </li>
        <li <c:if test="${paramVO.op3 eq '2'}">class='active'</c:if>>
            <a href="javascript:void(0);" onclick="goEvent('2')">
                <span>교육신청</span>
            </a>
        </li>
        <li <c:if test="${paramVO.op3 eq '3'}">class='active'</c:if>>
            <a href="javascript:void(0);" onclick="goEvent('3')">
                <span>공모참여</span>
            </a>
        </li>
        <li <c:if test="${paramVO.op3 eq '4'}">class='active'</c:if>>
            <a href="javascript:void(0);" onclick="goEvent('4')">
                <span>종료 이벤트</span>
            </a>
        </li>
    </ul>
</div>

<!--content-->
<div class="col-12 event_card_wrap">
    <div class="col-center mw-1280">
        <%--<c:if test="${resultCnt > 0}">
            <div class="col-12 calc_wrap19 swiper">
                <div class="swiper-wrapper">
                    <c:forEach var="result" items="${resultList}" varStatus="status">
                        <c:set value="${fileMap[result.atchFileId] }" var="fileList"/>
                        <c:url var="url" value="/edu/bbs/${paramVO.bbsId}/view.do?nttId=${result.nttId}${pageQueryString}"/>
                        <fmt:parseDate value="${result.ntceBgnde}" var="sdt" pattern="yyyy-MM-dd"/>
                        <fmt:parseNumber value="${sdt.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
                        <fmt:parseDate value="${result.ntceEndde}" var="edt" pattern="yyyy-MM-dd"/>
                        <fmt:parseNumber value="${edt.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
                        <c:set var="now" value="<%=new java.util.Date()%>"/>
                        <c:set var="nowDt"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></c:set>
                        <fmt:parseDate value="${nowDt}" var="ndt" pattern="yyyy-MM-dd"/>
                        <fmt:parseNumber value="${ndt.time / (1000*60*60*24)}" integerOnly="true" var="nowDate"></fmt:parseNumber>

                        <div class="col-6 col-sm-4 tc event_card_list go swiper-slide <c:if test='${(nowDate-strDate) > 0}'>e_end_box</c:if>">
                            <a href="<c:out value="${url }" escapeXml="false" />" class="col-12 show fn event_card">
                                <div class="col-12 img_box">
                                    <c:choose>
                                        <c:when test='${ fileList.size() > 0 }'>
                                            <c:forEach var="file" items="${fileList }">
                                                <c:choose>
                                                    <c:when test="${file.fileFieldName eq 'main_image' }">
                                                        <img alt="에듀코카 이벤트 이미지" src="/cmm/fms/getImage.do?atchFileId=<c:out value="${file.atchFileId}" />&amp;fileSn=<c:out value="${file.fileSn}" />" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img alt="No Image" src="/edu/images/bm/noimage.png"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <img alt="No Image" src="/edu/images/bm/noimage.png"/>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="col-12 text_box">
                                    <h5><c:out value="${result.nttSj }"/></h5>
                                    <c:choose>
                                        <c:when test='${ (nowDate-endDate) > 0 }'>
                                            <p class="date_tag_off">종료</p>
                                        </c:when>
                                        <c:when test='${ (nowDate-strDate) < 0 }'>
                                            <p class="date_tag_on">D${strDate-nowDate}</p>
                                        </c:when>
                                        <c:otherwise>
                                            <p class="date_tag_on">진행</p>
                                        </c:otherwise>
                                    </c:choose>
                                    <p class="event_date">
                                        기간 : <span class="show"><c:out value="${result.ntceBgnde }"/></span> ~
                                        <span class="show"><c:out value="${result.ntceEndde }"/></span>
                                    </p>
                                </div>
                            </a>

                            <c:if test='${(nowDate-endDate) > 0}'>
                                <div class="e_end_back_box">
                                    <a href="<c:out value="${url }" escapeXml="false" />"
                                       style="display: inline-block; width: 100%; height: 100%;"></a>
                                </div>
                            </c:if>
                        </div>
                    </c:forEach>
                </div>

                <div class="swiper-pagination"></div>
                <!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
                <div class="swiper_btn_box">
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>
            </div>
        </c:if>--%>

        <c:if test="${resultCnt > 0}">
        <div class="slider">
            <div class="inner">
                <div class="swiper-wrapper">
                    <c:forEach var="result" items="${resultList}" varStatus="status">
                    <c:set value="${fileMap[result.atchFileId] }" var="fileList"/>
                    <c:url var="url" value="/edu/bbs/${paramVO.bbsId}/view.do?nttId=${result.nttId}${pageQueryString}"/>
                    <fmt:parseDate value="${result.ntceBgnde}" var="sdt" pattern="yyyy-MM-dd"/>
                    <fmt:parseNumber value="${sdt.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
                    <fmt:parseDate value="${result.ntceEndde}" var="edt" pattern="yyyy-MM-dd"/>
                    <fmt:parseNumber value="${edt.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
                    <c:set var="now" value="<%=new java.util.Date()%>"/>
                    <c:set var="nowDt"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></c:set>
                    <fmt:parseDate value="${nowDt}" var="ndt" pattern="yyyy-MM-dd"/>
                    <fmt:parseNumber value="${ndt.time / (1000*60*60*24)}" integerOnly="true" var="nowDate"></fmt:parseNumber>
                    <div class="col-6 col-sm-4 tc event_card_list list go<c:if test='${(nowDate-strDate) > 0}'>e_end_box</c:if>">
                            <a href="<c:out value="${url }" escapeXml="false" />" class="col-12 show fn event_card">
                                <div class="col-12 img_box">
                                    <c:choose>
                                        <c:when test='${ fileList.size() > 0 }'>
                                            <c:forEach var="file" items="${fileList }">
                                                <c:choose>
                                                    <c:when test="${file.fileFieldName eq 'main_image' }">
                                                        <img alt="에듀코카 이벤트 이미지" src="/cmm/fms/getImage.do?atchFileId=<c:out value="${file.atchFileId}" />&amp;fileSn=<c:out value="${file.fileSn}" />" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img alt="No Image" src="/edu/images/bm/noimage.png"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <img alt="No Image" src="/edu/images/bm/noimage.png"/>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="col-12 text_box">
                                    <h5><c:out value="${result.nttSj }"/></h5>
                                    <c:choose>
                                        <c:when test='${ (nowDate-endDate) > 0 }'>
                                            <p class="date_tag_off">종료</p>
                                        </c:when>
                                        <c:when test='${ (nowDate-strDate) < 0 }'>
                                            <p class="date_tag_on">D${strDate-nowDate}</p>
                                        </c:when>
                                        <c:otherwise>
                                            <p class="date_tag_on">진행</p>
                                        </c:otherwise>
                                    </c:choose>
                                    <p class="event_date">
                                        기간 : <span class="show"><c:out value="${result.ntceBgnde }"/></span> ~
                                        <span class="show"><c:out value="${result.ntceEndde }"/></span>
                                    </p>
                                </div>
                            </a>

                            <c:if test='${(nowDate-endDate) > 0}'>
                                <div class="e_end_back_box">
                                    <a href="<c:out value="${url }" escapeXml="false" />"
                                       style="display: inline-block; width: 100%; height: 100%;"></a>
                                </div>
                            </c:if>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="swiper_btn_box">
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
        </c:if>
    </div>
    <c:if test="${resultCnt < 1}">
        <p class="not_search_list">검색 된 이벤트가 없습니다.</p>
    </c:if>
</div>
<style>
    .slider {position: relative;}
    .slider .swiper-slide {display:flex;flex-wrap:wrap;}

    @media (max-width: 1180px) {
        .event_card_wrap .col-sm-4{width: 48%; max-width: 48%; flex:0 0 47%;}


    }
</style>
<script>
    $(document).ready(function () { //모바일보다 클때만 이벤트 슬라이드 작동
        var windowWidth = $(window).width();
        if (windowWidth > 640) {
            slideAct();
        };
    })

    function slideAct(){
        var view = 0; //보이는 슬라이드 개수
        var realInx = 0; //현재 페이지
        var swiper = undefined;

        //디바이스 체크
        var winWChk = '';
        $(window).on('load resize', function (){
            var winW = window.innerWidth;
            if(winWChk != 'mo' && winW <= 768){ //모바일 버전으로 전환할 때
                slideList()
                winWChk = 'mo';
            }
            if(winWChk != 'pc' && winW >= 769){ //PC 버전으로 전환할 때
                slideList()
                winWChk = 'pc';
            }
        })

        function slideList(){
            //리스트 초기화
            if ($('.slider .list').parent().hasClass('swiper-slide')){
                $('.slider .swiper-slide-duplicate').remove();
                $('.slider .list').unwrap('swiper-slide');
            }

            //보이는 슬라이드 개수 설정
            if (window.innerWidth > 1180){ //PC 버전
                view = 6;
            }else if(window.innerWidth > 640){ //태블릿 버전
                view = 4;
            } else{
                view = 1; //mobile 버전
            }

            //리스트 그룹 생성 (swiper-slide element 추가)
            var num = 0;
            $('.slider').find('.list').each(function(i) {
                $(this).addClass('list'+(Math.floor((i+view)/view)));
                num = Math.floor((i+view)/view)
            }).promise().done(function(){
                for (var i = 1; i < num+1; i++) {
                    $('.slider').find('.list'+i+'').wrapAll('<div class="swiper-slide"></div>');
                    $('.slider').find('.list'+i+'').removeClass('list'+i+'');
                }
            });

            sliderStart()
        }

        //슬라이드 시작
        function sliderStart(){
            //슬라이드 초기화
            if(swiper != undefined) {
                swiper.destroy();
                swiper == undefined;
            }

            //슬라이드 실행
            var swiper3 = new Swiper('.slider .inner', {
                slidesPerView: 1,
                initialSlide :Math.floor(realInx/view),
                resistanceRatio : 0,
                navigation: {
                    nextEl: ".event_card_wrap .swiper-button-next",
                    prevEl: ".event_card_wrap .swiper-button-prev",
                },
                on: {
                    slideChange: function () {
                        realInx = this.realIndex*view
                    }
                },
            });
        }
    }


    /*$(function () {
        var windowWidth = $(window).width();
        if (windowWidth > 640) {

            //이벤트
            var swiper3 = new Swiper('.calc_wrap19.swiper', {
                slidesPerView: 3 // 한번에 보이는 슬라이드 갯수
                , grid: {
                    rows: 2,
                }
                , spaceBetween: 20
                /!*,centeredSlides: true*!/
                //신버전 swiper 방향표
                , navigation: {
                    nextEl: ".event_card_wrap .swiper-button-next",
                    prevEl: ".event_card_wrap .swiper-button-prev",
                }

                , breakpoints: {
                    100: {
                        slidesPerView: 1,
                    },
                    640: {
                        slidesPerView: 2,
                    },
                    1180: {
                        slidesPerView: 3,
                    },
                }
            });
        }
    });*/
</script>