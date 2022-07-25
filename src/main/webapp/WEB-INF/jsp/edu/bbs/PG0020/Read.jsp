
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

<!-- bdView -->
<div class="evt_top_box">
	<div class="col-center mw-1280">
		<div class="evt_info_box">
			<h2><c:out  value="${result.nttSj }" escapeXml="false"/></h2>
			<%--<p class="date_tag_on">D-10</p>--%>
			<p class="data">이벤트기간 : <span><c:out value="${result.ntceBgnde}" />~<c:out value="${result.ntceEndde}" /></span></p>
		</div>
		<div class="evt_btn_box">
			<p>지금 참여하시겠습니까?</p>
			<c:if test="${not empty result.option1 and result.option1 ne '' }">
				<a href="<c:out value="http://${result.option1 }" />"  <c:if test="${result.option2 eq 'Y' }"> title="새창열기" target="_blank" </c:if> >이벤트 참여</a>
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
		<c:url var="url" value="/edu/bbs/${paramVO.bbsId}/list.do?${pageQueryString}" />
		<a class="btn_style_0 full list" href="<c:out value='${url}' escapeXml='false'/>">
			목록
		</a>
	</div>
</div>

