
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc"%>
<%@ taglib uri="http://www.unp.co.kr/util" prefix="util" %>

<ccc:constantsMap className="kr.co.unp.bbs.vo.SearchVO" var="SearchVO" />

	<c:url value="/${paramVO.siteName }/bbs/${paramVO.bbsId}/list.do?menuNo=${param.menuNo }" var="searchUrl" />
	<!-- bdList -->

	<div class="tab_style_1_con">
		<ul class="tab_style_1">
			<li><a href="/edumobile/bbs/B0000074/list.do?menuNo=600165"><span>주요성과</span></a></li>
			<li class="active"><a href="/edumobile/bbs/B0000075/list.do?menuNo=600166"><span>현장영상</span></a></li>
		</ul>
	</div>

	<div class="col-12 mentoring_card_wrap">
		<div class="col-12 calc_wrap19">
	<c:forEach var="result" items="${resultList}" varStatus="status">
	<c:set value="${fileMap[result.atchFileId] }" var="fileList" />
	<c:forEach var="files" items="${fileList }">
		<c:if test="${files.fileFieldName eq 'main_image' }">
			<c:set  var="file" value="${files }"/>
		</c:if>
	</c:forEach>
	<c:url var="url" value="${result.option1 }"  />
			<div class="col-12 col-sm-4 tc mentoring_list">
				<a href="/${paramVO.siteName}/bbs/${paramVO.bbsId}/view.do?nttId=${result.nttId}&amp;${pageQueryString}"> 
				<div class="col-12 show fn mentoring_card">
					<div class="img_box">
							<c:if test="${not empty file }">
								<img class="db" src="/cmm/fms/getImage.do?atchFileId=${file.atchFileId}&amp;fileSn=${file.fileSn}" alt="<c:out value="${result.nttSj }"/>"  />
							</c:if>
							<c:if test="${empty file }">
								<img class="db" src="/edu/images/common/noimg_312x200.jpg" alt="이미지가 존재하지 않습니다" />
							</c:if>
					</div>
					<div class="text_box">
						<h5>
						<c:out value="${result.nttSj }" escapeXml="false" />
						</h5>
						<hr class="h_line5">
						<p class="h_date5">
						<c:out value="${result.frstRegisterPnttm }" />
						</p>
					</div>
				</div>
				</a>
			</div>
	<c:remove var="file"/>
	</c:forEach>
		</div>
	</div>

	<!-- board list end //-->
	<c:if test="${fn:length(resultList) > 0}">
		<div class="paging">${pageNav}</div>
		<!-- paging end //-->
	</c:if>
	<!-- //bdList -->



<style>
	.linemap_wrap .linemap_con li:nth-child(4) { display:none }
</style>