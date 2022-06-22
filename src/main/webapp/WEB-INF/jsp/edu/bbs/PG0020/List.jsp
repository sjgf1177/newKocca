
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc"%>
<%@ taglib uri="http://www.unp.co.kr/util" prefix="util" %>
<ccc:constantsMap className="kr.co.unp.bbs.vo.SearchVO" var="SearchVO" />
<jsp:useBean id="todayNow" class="java.util.Date"  />
<fmt:formatDate value="${todayNow}" var="today" pattern="yyyy-MM-dd" />
	<c:url value="/${paramVO.siteName }/bbs/${paramVO.bbsId}/list.do?menuNo=${param.menuNo }" var="searchUrl" />
	<!-- bdList -->
<div class="over-hidden sub_contents_header">
	<div class="linemap_wrap"> <!-- fl class 삭제 -->
		<ul class="col-12 linemap_con">
			<li><a href="/edu/main/main.do"><span style="clip: rect(1px, 1px, 1px, 1px); position:absolute;">Home</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>이벤트</span></a></li>
		</ul>
	</div>
</div>

<div class="sub_title s_tit02">
	<div class="col-center mw-1280">이벤트</div>
</div>

<div class="tab_style_1_con"> 
	<ul class="tab_style_1 two_tab">
		<li class="active">
			<a href="/edu/bbs/B0000048/list.do?menuNo=500205" title="현재탭">
				<span>이벤트</span>
			</a>
		</li>
		<li>
			<a href="">
				<span>추천콘텐츠</span>
			</a>
		</li>
		<li>
			<a href="">
				<span>창의인재동반</span>
			</a>
		</li>
		<li>
			<a href="">
				<span>AI콘텐츠창작</span>
			</a>
		</li>
		<li>
			<a href="">
				<span>콘텐츠임팩트</span>
			</a>
		</li>
		<li>
			<a href="">
				<span>콘텐츠인사이트</span>
			</a>
		</li>
		<li>
			<a href="">
				<span>콘텐츠스텝업</span>
			</a>
		</li>
	</ul>
</div>
<!--content-->
<div class="col-12 event_card_wrap">
	<div class="col-12 col-center mw-1280 calc_wrap19 swiper"> <!-- col-center mw-1280 추가-->
		<div class="swiper-wrapper">
			<div class="col-6 col-sm-4 tc event_card_list go swiper-slide">
				<a href="/edu/bbs/B0000048/view.do?nttId=74943&amp;delCode=0&amp;menuNo=500205&amp;pageIndex=1" class="col-12 show fn event_card">
					<div class="col-12 img_box">
						<img alt="에듀코카 이벤트 이미지" src="/edu/images/renew2022/NoPath_01.png">
						<!--<span class="event_text end">마감</span>-->
					</div>
					<div class="col-12 text_box">
						<!--<p class="event_num">19</p>-->
						<h5>1번</h5>
						<p class="date_tag_on">D-10</p>
						<p class="event_date">기간 : <span class="show">2021-11-03</span> ~ <span class="show">2021-11-21</span></p>
					</div>
				</a>
			</div>
			<div class="col-6 col-sm-4 tc event_card_list go swiper-slide e_end_box">
				<a href="/edu/bbs/B0000048/view.do?nttId=74943&amp;delCode=0&amp;menuNo=500205&amp;pageIndex=1" class="col-12 show fn event_card">
					<div class="col-12 img_box">
						<img alt="에듀코카 이벤트 이미지" src="/edu/images/renew2022/NoPath_01.png">
						<!--<span class="event_text end">마감</span>-->
					</div>
					<div class="col-12 text_box">
						<!--<p class="event_num">19</p>-->
						<h5>2번</h5>
						<p class="date_tag_off">종료</p>
						<p class="event_date">기간 : <span class="show">2021-11-03</span> ~ <span class="show">2021-11-21</span></p>
					</div>
				</a>
				<!--종료된 이벤트 어둡게-->
				<div class="e_end_back_box"></div>
			</div>
			<div class="col-6 col-sm-4 tc event_card_list go swiper-slide">
				<a href="/edu/bbs/B0000048/view.do?nttId=74943&amp;delCode=0&amp;menuNo=500205&amp;pageIndex=1" class="col-12 show fn event_card">
					<div class="col-12 img_box">
						<img alt="에듀코카 이벤트 이미지" src="/edu/images/renew2022/NoPath_01.png">
						<!--<span class="event_text end">마감</span>-->
					</div>
					<div class="col-12 text_box">
						<!--<p class="event_num">19</p>-->
						<h5>3번</h5>
						<p class="date_tag_on">D-10</p>
						<p class="event_date">기간 : <span class="show">2021-11-03</span> ~ <span class="show">2021-11-21</span></p>
					</div>
				</a>
			</div>
			<div class="col-6 col-sm-4 tc event_card_list go swiper-slide">
				<a href="/edu/bbs/B0000048/view.do?nttId=74943&amp;delCode=0&amp;menuNo=500205&amp;pageIndex=1" class="col-12 show fn event_card">
					<div class="col-12 img_box">
						<img alt="에듀코카 이벤트 이미지" src="/edu/images/renew2022/NoPath_01.png">
						<!--<span class="event_text end">마감</span>-->
					</div>
					<div class="col-12 text_box">
						<!--<p class="event_num">19</p>-->
						<h5>4번</h5>
						<p class="date_tag_on">D-10</p>
						<p class="event_date">기간 : <span class="show">2021-11-03</span> ~ <span class="show">2021-11-21</span></p>
					</div>
				</a>
			</div>
			<div class="col-6 col-sm-4 tc event_card_list go swiper-slide e_end_box">
				<a href="/edu/bbs/B0000048/view.do?nttId=74943&amp;delCode=0&amp;menuNo=500205&amp;pageIndex=1" class="col-12 show fn event_card">
					<div class="col-12 img_box">
						<img alt="에듀코카 이벤트 이미지" src="/edu/images/renew2022/NoPath_01.png">
						<!--<span class="event_text end">마감</span>-->
					</div>
					<div class="col-12 text_box">
						<!--<p class="event_num">19</p>-->
						<h5>5번</h5>
						<p class="date_tag_off">종료</p>
						<p class="event_date">기간 : <span class="show">2021-11-03</span> ~ <span class="show">2021-11-21</span></p>
					</div>
				</a>
				<!--종료된 이벤트 어둡게-->
				<div class="e_end_back_box"></div>
			</div>
			<div class="col-6 col-sm-4 tc event_card_list go swiper-slide e_end_box">
				<a href="/edu/bbs/B0000048/view.do?nttId=74943&amp;delCode=0&amp;menuNo=500205&amp;pageIndex=1" class="col-12 show fn event_card">
					<div class="col-12 img_box">
						<img alt="에듀코카 이벤트 이미지" src="/edu/images/renew2022/NoPath_01.png">
						<!--<span class="event_text end">마감</span>-->
					</div>
					<div class="col-12 text_box">
						<!--<p class="event_num">19</p>-->
						<h5>6번</h5>
						<p class="date_tag_off">종료</p>
						<p class="event_date">기간 : <span class="show">2021-11-03</span> ~ <span class="show">2021-11-21</span></p>
					</div>
				</a>
				<!--종료된 이벤트 어둡게-->
				<div class="e_end_back_box"></div>
			</div>

			<div class="col-6 col-sm-4 tc event_card_list go swiper-slide">
				<a href="/edu/bbs/B0000048/view.do?nttId=74943&amp;delCode=0&amp;menuNo=500205&amp;pageIndex=1" class="col-12 show fn event_card">
					<div class="col-12 img_box">
						<img alt="에듀코카 이벤트 이미지" src="/edu/images/renew2022/NoPath_01.png">
						<!--<span class="event_text end">마감</span>-->
					</div>
					<div class="col-12 text_box">
						<!--<p class="event_num">19</p>-->
						<h5>7번</h5>
						<p class="date_tag_on">D-10</p>
						<p class="event_date">기간 : <span class="show">2021-11-03</span> ~ <span class="show">2021-11-21</span></p>
					</div>
				</a>
			</div>

			<div class="col-6 col-sm-4 tc event_card_list go swiper-slide">
				<a href="/edu/bbs/B0000048/view.do?nttId=74943&amp;delCode=0&amp;menuNo=500205&amp;pageIndex=1" class="col-12 show fn event_card">
					<div class="col-12 img_box">
						<img alt="에듀코카 이벤트 이미지" src="/edu/images/renew2022/NoPath_01.png">
						<!--<span class="event_text end">마감</span>-->
					</div>
					<div class="col-12 text_box">
						<!--<p class="event_num">19</p>-->
						<h5>8번</h5>
						<p class="date_tag_on">D-10</p>
						<p class="event_date">기간 : <span class="show">2021-11-03</span> ~ <span class="show">2021-11-21</span></p>
					</div>
				</a>
			</div>
		</div>

		<div class="swiper-pagination"></div>
		<!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
		<div class="swiper_btn_box">
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>
	</div>


</div>

<!-- paging -->
<c:if test="${fn:length(resultList) > 0}">
	<div class="paging">${pageNav}</div>
	<!-- paging end //-->
</c:if>
<!-- //paging -->
