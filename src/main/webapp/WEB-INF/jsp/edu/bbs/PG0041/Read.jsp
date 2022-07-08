<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="kocca" uri="http://edu.kocca.kr/fn"%>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc" %>

<div class="over-hidden sub_contents_header">
	<div class="linemap_wrap"> <!-- fl class 삭제 -->
		<ul class="col-12 linemap_con">
			<li><a href="/edu/main/main.do"><span style="clip: rect(1px, 1px, 1px, 1px); position:absolute;">Home</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>마이페이지</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>나의 문의내역</span></a></li>
		</ul>
	</div>
</div>

<div class="sub_title s_tit02">
	<div class="col-center mw-1280">나의 문의내역</div>
</div>

<div class="col-center mw-1280">

	<table class="board_type_0 detail question">
	<caption>문의 게시판 질문</caption>
		<colgroup>
			<col width="auto">
			<col width="auto">
		</colgroup>
		<thead>
		<tr>
			<th colspan="2" style="padding-left:20px; padding-right: 20px;">
			<span>
			<c:out value="${result.nttSj}"/>
			</span>
				<span class="writer_info">
					<span>
					${kocca:maskingTag(result.ntcrNm)}
					</span>
					<span>
					<c:out value="${result.frstRegisterPnttm}"/>
					</span>
				</span>
			</th>
		</tr>
		</thead>
	<tbody>
	<tr>
		<td colspan="2" class="upload_file">
			<a href="javascript:void(0)">
			첨부파일 : <c:forEach var="fileVO" items="${fileList}" varStatus="status">
					<a href="/edu/cmm/fms/FileDown.do?atchFileId=${fileVO.atchFileId}&amp;fileSn=${fileVO.fileSn}&amp;bbsId=${param.bbsId}" class="${icn}">
					<c:out value="${fileVO.orignlFileNm}"/>&nbsp;[<c:out value="${fileVO.fileMg}"/>&nbsp;byte] <br />
					</a>
				</c:forEach>
					<c:if test="${fn:length(fileList) == 0}">등록된 첨부파일이 없습니다.</c:if>
			</a>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<span>
			<% pageContext.setAttribute("crlf","\r\n"); %>
			${fn:replace(fn:replace(fn:escapeXml(result.nttCn), crlf, '<br/>') , ' ', '&nbsp;')}
			</span>
		</td>
	</tr>
	</tbody>
	</table>

	<!-- 답변 -->
	<c:set var="reply" value="${replyList[0]}" />
	<c:if test="${masterVO.replyPosblAt eq 'Y' and result.parnts eq 0 and not empty reply}">
	<table class="board_type_0 detail answer">
	<caption>QnA 게시판 답변</caption>
		<colgroup>
			<col width="auto">
			<col width="auto">
		</colgroup>
		<thead>
		<tr>
			<th colspan="2">
			<span>
			답변
			</span>
			<span class="writer_info">
				<span>
				<c:out value="${reply.ntcrNm}"/>
				</span>
				<span>
				<c:out value="${reply.frstRegisterPnttm}"/>
				</span>
			</span>
			</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td colspan="2" class="upload_file">
				<a href="javascript:void(0)">
				첨부파일 : <c:forEach var="fileVO" items="${replyFileMap[reply.atchFileId] }" varStatus="status">
						<a href="/edu/cmm/fms/FileDown.do?atchFileId=${fileVO.atchFileId}&amp;fileSn=${fileVO.fileSn}&amp;bbsId=${param.bbsId}" class="${icn}">
						<c:out value="${fileVO.orignlFileNm}"/>&nbsp;[<c:out value="${fileVO.fileMg}"/>&nbsp;byte] <br />
						</a>
					</c:forEach>
						<c:if test="${fn:length(fileList) == 0}">등록된 첨부파일이 없습니다.</c:if>
				</a>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<span>
				${reply.nttCn}
				</span>
			</td>
		</tr>
		</tbody>
	</table>
	</c:if>

	<div class="board_util_btn_con">
		<a href="/edu/bbs/${paramVO.bbsId}/forUpdate.do?nttId=${result.nttId}&amp;myAt=${param.myAt}&amp;${pageQueryString}" class="btn_style_0 full edit">
			수정
		</a>
		<c:set var="list" value="list"/>
		<c:if test="${param.myAt eq 'Y'}"><c:set var="list" value="listMy"/></c:if>
		<a href="/edu/bbs/${paramVO.bbsId}/${list}.do?${pageQueryString}" class="btn_style_0 empty list">
			목록
		</a>
	</div>
</div>

