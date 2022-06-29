<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="kr.co.ckl.progrm.service.ProgrmMasterService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="util" uri="http://www.unp.co.kr/util" %>

<c:set var="WAITING" value="<%=ProgrmMasterService.Status.WAITING.getValue()%>"/>
<c:set var="PROGRESS" value="<%=ProgrmMasterService.Status.PROGRESS.getValue()%>"/>
<c:set var="FINISH_PSNCPA" value="<%=ProgrmMasterService.Status.FINISH_PSNCPA.getValue()%>"/>
<c:set var="FINISH" value="<%=ProgrmMasterService.Status.FINISH.getValue()%>"/>

<script type="text/javascript">

$(function() {
	//rsg 20170614
	// 테이블의 내용 th 제거  
	//<div class="descriptionThTagNotVisible" style="display: none;"></div>
	var selFlagNotDesc = ".descriptionThTagNotVisible";
	if ( $( selFlagNotDesc ).length > 0 ){
		var $div = $($( selFlagNotDesc )[0]);
		var $td = $div.closest("td");
		var $th = $td.siblings("th");
		if ( $th.text() == "내용" ){
			$th.remove();
		}
	}
});

</script>

<div class="over-hidden sub_contents_header">
	<div class="linemap_wrap"> <!-- fl class 삭제 -->
		<ul class="col-12 linemap_con">
			<li><a href="/edu/main/main.do"><span style="clip: rect(1px, 1px, 1px, 1px); position:absolute;">Home</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>사업안내</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>콘텐츠인사이트</span></a></li>
		</ul>
	</div>
</div>

<div class="sub_title s_tit02">
	<div class="col-center mw-1280">콘텐츠인사이트</div>
</div>

<div class="col-center mw-1280">
	<table class="contents_insight_view">
		<caption>오프라인 콘텐츠 뷰 페이지</caption>
		<colgroup>
			<col width="20%">
			<col width="auto">
			<col width="20%">
			<col width="auto">
		</colgroup>
		<tbody>
			<tr>
				<th>구분 / 분류</th>
				<td colspan="3"><c:out value="${result.prgSeNm}"/> / <c:out value="${result.prgClNm}"/></td>
			</tr>
			<tr>
				<th>프로그램명</th>
				<td colspan="3"><c:out value="${result.prgNm}"/></td>
			</tr>
			<tr>
				<th>담당부서</th>
				<td><c:out value="${result.deptNmKor}"/></td>
				<c:choose>
					<c:when test="${result.prgCl eq 17 }">
						<th>일정</th>
						<td><c:out value="${result.beginDt}"/></td>
					</c:when>
					<c:otherwise>
						<th>교육기간</th>
						<td><fmt:formatDate value="${result.prgBgnde}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${result.prgEndde}" pattern="yyyy-MM-dd"/></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<c:if test="${result.prgCl ne 17 }">
				<tr>
					<th>신청방식</th>
					<td><c:out value="${result.reqstMthdNm}"/> <c:if test="${result.reqstMthd eq '01'}">(<c:out value="${result.psncpa}"/>명)</c:if></td>
					<th>신청기간</th>
					<td><c:out value="${result.beginDt}"/> ~ <c:out value="${result.rcritComptAt eq 'Y' ? '모집완료시' : result.endDt}"/></td>
				</tr>
				<tr>
					<th>진행상태</th>
					<td colspan="3">
						<c:choose>
							<c:when test="${progrsSttus eq WAITING}">대기</c:when>
							<c:when test="${progrsSttus eq PROGRESS}">진행</c:when>
							<c:when test="${progrsSttus eq FINISH_PSNCPA}">진행(선착순마감)</c:when>
							<c:when test="${progrsSttus eq FINISH}">마감</c:when>
						</c:choose>
					</td>
				</tr>
			</c:if>
			<tr>
				<th>첨부파일</th>
				<td colspan="3">
					<c:forEach var="fileVO" items="${fileList}" varStatus="status">
						<c:if test="${fileVO.fileFieldName ne 'mainImg'}">
							<a class="download_text ${icn}" href="/edu/cmm/fms/FileDown.do?atchFileId=${fileVO.atchFileId}&amp;fileSn=${fileVO.fileSn}&amp;bbsId=${param.bbsId}">
							<span><c:out value="${fileVO.orignlFileNm}"/>&nbsp;[<c:out value="${fileVO.fileMg}"/>&nbsp;byte]</span>
							</a>
						</c:if>
					</c:forEach>
					<c:if test="${fn:length(fileList) == 0}">등록된 첨부파일이 없습니다.</c:if>
				</td>
			</tr>
		</tbody>
	</table>

	<!--내용-->
	<div class="insight_view_contents" style="text-align: center;">
		<c:out value="${result.prgCn}" escapeXml="false" />

		<!-- 본문이미지 대체텍스트 -->
		<div class="hidden"><c:out value="${result.imgDescCn}"/> </div>
	</div>
	<!--//내용-->

	<hr class="contents_insight_line">
	<div class="board_util_btn_con">
		<c:choose>
			<c:when test="${result.prgCl ne 17 }">
				<c:if test="${progrsSttus eq PROGRESS}">
					<a href="/edu/progrm/applcnt/reg01.do?prgSn=<c:out value='${result.prgSn}'/>&amp;sttus=02&amp;${pageQueryString}" onclick="return confirm('신청하시겠습니까?');" class="btn_style_0 full list btn-primary">신청하기</a>
				</c:if>
				<c:if test="${progrsSttus eq FINISH_PSNCPA}">
					<a href="/edu/progrm/applcnt/reg01.do?prgSn=<c:out value='${result.prgSn}'/>&amp;sttus=01&amp;${pageQueryString}" onclick="return confirm('대기접수하시겠습니까?');" class="btn_style_0 full list btn-primary">대기접수하기</a>
				</c:if>
			</c:when>
		</c:choose>
		<a href="/edu/progrm/master/list.do?${pageQueryString}" class="btn_style_0 full list btn-primary">목록 </a>
	</div>
</div>


