
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
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<c:set value="${fileMap[result.atchFileId] }" var="fileList" />
			<c:url var="url" value="/edu/bbs/${paramVO.bbsId}/view.do?nttId=${result.nttId}${pageQueryString}" />
			<fmt:parseDate value="${result.ntceBgnde}" var="sdt" pattern="yyyy-MM-dd"/>
			<fmt:parseNumber value="${sdt.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
			<c:set var="now" value="<%=new java.util.Date()%>" />
			<c:set var="nowDt"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
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
											<%--<img alt="에듀코카 이벤트 이미지" src="/cmm/fms/getImage.do?atchFileId=<c:out value="${file.atchFileId}" />&amp;fileSn=<c:out value="${file.fileSn}" />" style="width: 336px;height: 216px" />--%>
											<img alt="에듀코카 이벤트 이미지" src="${fn:replace(file.fileStreCours, 'data2', 'edu/images')}/${file.streFileNm}" />
										</c:when>
										<c:otherwise>
											<img alt="No Image" src="/edu/images/bm/noimage.png" />
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<img alt="No Image" src="/edu/images/bm/noimage.png" />
							</c:otherwise>
						</c:choose>
					</div>
					<div class="col-12 text_box">
							<%--<p class="event_num">${(resultCnt) - (paramVO.pageSize * (paramVO.pageIndex-1))}</p>--%>
						<h5><c:out value="${result.nttSj }" /></h5>
						<c:choose>
							<c:when test='${ (nowDate-strDate) > 0 }'>
								<p class="date_tag_off">종료</p>
							</c:when>
							<c:when test='${ (nowDate-strDate) < 0 }'>
								<p class="date_tag_on">D${strDate-nowDate}</p>
							</c:when>
							<c:otherwise>
								<p class="date_tag_on">D-Day</p>
							</c:otherwise>
						</c:choose>
						<p class="event_date">기간 : <span class="show"><c:out value="${result.ntceBgnde }" /></span> ~ <span class="show"><c:out value="${result.ntceEndde }" /></span></p>
					</div>
				</a>

				<c:if test='${(nowDate-strDate) > 0}'><div class="e_end_back_box"></div></c:if>
			</div>
			<c:set var="resultCnt" value="${resultCnt-1}" />
			</c:forEach>
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
<%--<c:if test="${fn:length(resultList) > 0}">
	<div class="paging">${pageNav}</div>
	<!-- paging end //-->
</c:if>--%>
<!-- //paging -->
