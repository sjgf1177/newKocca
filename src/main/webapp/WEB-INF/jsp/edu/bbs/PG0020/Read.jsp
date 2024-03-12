
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc" %>
<ccc:constantsMap className="kr.co.unp.bbs.vo.SearchVO" var="SearchVO"/>
<style>
	.table_info_header{text-align: right; font-size: 15px;}
	.upload_file a{margin-bottom: 5px;}

	@media screen and (max-width: 640px){
		.table_info_header{margin-bottom: 10px;}
	}
</style>

<c:set var="tmp1" value=""/>
<c:set var="tmp2" value=""/>
<c:set var="tmp3" value=""/>
<c:set var="tmp4" value=""/>

<c:choose>
	<c:when test="${result.option3 eq '1'}">
		<c:set var="tmp1" value="에듀코카 이벤트"/>
		<c:set var="tmp2" value="참여 기간"/>
		<c:set var="tmp3" value="지금 참여하시겠습니까?"/>
		<c:set var="tmp4" value="이벤트 참여하기"/>
	</c:when>
	<c:when test="${result.option3 eq '2'}">
		<c:set var="tmp1" value="교육신청"/>
		<c:set var="tmp2" value="신청 기간"/>
		<c:set var="tmp3" value="지금 신청하시겠습니까?"/>
		<c:set var="tmp4" value="교육 신청하기"/>
	</c:when>
	<c:when test="${result.option3 eq '3'}">
		<c:set var="tmp1" value="구인/공모"/>
		<c:set var="tmp2" value="모집 기간"/>
		<c:set var="tmp3" value="공고 세부 내용을 보시겠습니까?"/>
		<c:set var="tmp4" value="공고 바로가기"/>
	</c:when>
	<c:otherwise>
		<c:set var="tmp1" value="이벤트"/>
		<c:set var="tmp2" value="이벤트 기간"/>
		<c:set var="tmp3" value="지금 참여하시겠습니까?"/>
		<c:set var="tmp4" value="이벤트 참여하기"/>
	</c:otherwise>
</c:choose>


<div class="over-hidden sub_contents_header">
	<div class="linemap_wrap"> <!-- fl class 삭제 -->
		<ul class="col-12 linemap_con">
			<li><a href="/edu/main/main.do"><span style="clip: rect(1px, 1px, 1px, 1px); position:absolute;">Home</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>참여마당</span></a></li>
			<li>
				<a href="javascript:void(0);" tabindex="-1">
					<span>${tmp1}</span>
				</a>
			</li>
		</ul>
	</div>
</div>
<div class="sub_title s_tit02">
	<div class="col-center mw-1280">${tmp1}</div>
</div>

<!-- bdView -->
<div class="evt_top_box">
	<div class="col-center mw-1280">
		<div class="evt_info_box">
			<h2><c:out  value="${result.nttSj }" escapeXml="false"/></h2>
			<%--<p class="date_tag_on">D-10</p>--%>
			<p class="data"><c:if test="${result.nttId ne '75371'}"><span>${tmp2} : <c:out value="${result.ntceBgnde}" />~<c:out value="${result.ntceEndde}" /></span></c:if></p>
		</div>
		<div class="evt_btn_box">
			<p>${tmp3}</p>
			<c:if test="${not empty result.option1 and result.option1 ne '' }">
				<c:if test="${result.nttId ne '75375' and result.nttId ne '75378' and result.nttId ne '75405'}">
					<a href="<c:out value="http://${result.option1 }" />"  <c:if test="${result.option2 eq 'Y' }"> title="새창열기" target="_blank" </c:if>>${tmp4}</a>
				</c:if>
				<c:if test="${result.nttId eq '75375'}">
					<a href="javascript:alert('아래 이메일로 지원해 주시기 바랍니다.\nkoccaedu@gmail.com');">${tmp4}</a>
				</c:if>
				<c:if test="${result.nttId eq '75378'}">
                    <a href="javascript:alert('[이벤트 참여] 버튼 우측 하단 첨부파일 다운로드 후\n아래 이메일로 지원해 주시기 바랍니다.\nesg23esg@gmail.com');">${tmp4}</a>
				</c:if>
				<c:if test="${result.nttId eq '75405'}">
					<a href="javascript:alert('[이벤트 참여] 버튼 우측 하단 첨부파일 다운로드 후\n아래 이메일로 지원해 주시기 바랍니다.\nkoccaedu@gmail.com');">${tmp4}</a>
				</c:if>
			</c:if>
		</div>
	</div>
</div>
<div class="contents_view_area">
	<div class="col-center mw-1280 txt_ct">
		<div class="table_info_header">
			<div class="upload_file">
				<c:forEach var="fileVO" items="${fileList}" varStatus="status">
					<c:if test="${fileVO.fileFieldName ne 'main_image'}">
						<a href="/edu/cmm/fms/FileDown.do?atchFileId=${fileVO.atchFileId}&amp;fileSn=${fileVO.fileSn}&amp;bbsId=${param.bbsId}">
							첨부파일 : <c:out value="${fileVO.orignlFileNm}"/>&nbsp;[<c:out value="${fileVO.fileMg}"/>&nbsp;byte]
						</a><br />
					</c:if>
				</c:forEach>
			</div>
		</div>
	<c:choose>
		<c:when test="${result.htmlYn=='Y'}">${result.nttCn}</c:when>
		<c:otherwise>
			<% pageContext.setAttribute("crlf", "\n"); %>
			${fn:replace(result.nttCn, crlf, "<br/>")}
		</c:otherwise>
	</c:choose>

	<!-- 본문이미지 대체텍스트 -->
	<!-- <div class="hidden">${result.imgDescCn}</div> -->
	</div>
</div>


<div class="paging view_paging">
	<ul class="pagination">
		<c:if test="${prevNextMap['PREV'].prevNttId > 0}">
			<li class="btn_singlePage prev">
				<a href="/<c:out value="${paramVO.siteName }"/>/bbs/<c:out value='${paramVO.bbsId}'/>/view.do?nttId=<c:out value="${prevNextMap['PREV'].prevNttId}" />&amp;<c:out value="${pageQueryString}" escapeXml="false" />"> <c:out value="${prevNextMap['PREV'].nttSj }" />
					${prevNextMap['PREV'].nttSj }
				</a>
			</li>
		</c:if>
		<c:if test="${prevNextMap['NEXT'].nextNttId > 0}">
			<li class="btn_singlePage next">
				<a href="/<c:out value="${paramVO.siteName }"/>/bbs/<c:out value='${paramVO.bbsId}'/>/view.do?nttId=<c:out value="${prevNextMap['NEXT'].nextNttId}" />&amp;<c:out value="${pageQueryString}" escapeXml="false" />"> <c:out value="${prevNextMap['NEXT'].nttSj }" />
					${prevNextMap['NEXT'].nttSj }
				</a>
			</li>
		</c:if>
	</ul>
</div>
<div class="board_util_btn_con">
	<div class="col-center mw-1280">
		<c:url var="url" value="/edu/bbs/${paramVO.bbsId}/list.do?${pageQueryString}&op3=${paramVO.opt}" />
		<a class="btn_style_0 full list" href="<c:out value='${url}' escapeXml='false'/>">목록</a>
	</div>
</div>

