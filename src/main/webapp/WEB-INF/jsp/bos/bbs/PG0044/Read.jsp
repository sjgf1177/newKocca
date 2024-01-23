
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc" %>

<ccc:constantsMap className="kr.co.unp.bbs.vo.SearchVO" var="SearchVO"/>
<sec:authorize ifAnyGranted="ROLE_SUPER">
	<c:set var="roleSuper" value="Y" />
</sec:authorize>

<script type="text/javascript">
	function delPermanently(){
		var form = $("#board")[0];
		form.action = "/bos/bbs/${paramVO.bbsId}/delete.do";
		form.submit();
	}
</script>

<style>
	.bdView table th {
		vertical-align: middle;
	}
</style>

<title><c:out value='${masterVO.bbsNm}'/> - 게시글쓰기</title>

<div id="content">
	<form id="board" name="board" method="post" enctype="multipart/form-data" action="${action}">
		<input type="hidden" name="pageQueryString" value="${pageQueryString}"/>
		<input type="hidden" name="nttId" value="${empty result.nttId ? 0 : result.nttId }" />
		<input type="hidden" name="bbsId" value="${masterVO.bbsId}" />
		<input type="hidden" id="atchFileId0" name="atchFileId" value="${result.atchFileId}">

		<div class="bdView">
			<table summary="제목,요청내용,상세내용,첨부파일,<c:if test="${not empty result}">등록일,</c:if>완료여부 포함">
				<caption>${result.nttSj} (읽기)</caption>
				<colgroup>
					<col width="15%"/>
					<col width="85%"/>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">제목</th>
						<td>${result.nttSj}</td>
					</tr>
					<tr>
						<th scope="row">요청 내용</th>
						<td>
							<% pageContext.setAttribute("crlf", "\n"); %>
							${fn:replace(result.imgDescCn, crlf, "<br/>")}
						</td>
					</tr>

					<tr>
						<th scope="row">상세 내용</th>
						<td>
							<div class="outputEditor" id="dbdata">
								<c:choose>
									<c:when test="${result.htmlYn=='Y'}">${result.nttCn}</c:when>
									<c:otherwise>
										<% pageContext.setAttribute("crlf", "\n"); %>
										${fn:replace(result.nttCn, crlf, "<br/>")}
									</c:otherwise>
								</c:choose>
							</div>
						</td>
					</tr>

				 	<c:if test="${not empty result.atchFileId}">
						<tr>
							<th scope="row">첨부파일</th>
							<td>
								<c:if test="${fn:length(fileList) gt 0}">
									<ul style="list-style-type:none;">
									<c:forEach var="fileVO" items="${fileList}" varStatus="status">
										<c:if test="${fileVO.fileFieldName ne 'main_image'}">
											<li>
												<div id="realfile_${fileVO.fileSn}">
													<a href="/bos/cmm/fms/FileDown.do?atchFileId=${fileVO.atchFileId}&amp;fileSn=${fileVO.fileSn}&amp;bbsId=${param.bbsId}"  class="${icn}">
														<c:out value="${fileVO.orignlFileNm}"/>&nbsp;[<c:out value="${fileVO.fileMg}"/>&nbsp;byte]
													</a>

													<c:if test="${(paramVO.siteName ne 'portal' and fileVO.fileFieldName ne 'thumbImage') or param.updateFlag=='Y'}">
														<a href="#" onclick="javascript:delFile('${fileVO.atchFileId}', '${fileVO.fileSn}', '${param.bbsId}');">
															<img src="<c:url value='/bos/images/btn_X.jpg'/>" alt="<c:out value="${fileVO.orignlFileNm}"/> 삭제" class="btn btn-sm" />
														</a>
													</c:if>

													<c:set var="lFileExtsn" value="${fn:toLowerCase(fileVO.fileExtsn)}" />
													<c:if test="${lFileExtsn == 'doc' || lFileExtsn == 'docx' || lFileExtsn == 'hwp' || lFileExtsn == 'xls' || lFileExtsn == 'xlsx' || lFileExtsn == 'pdf' || lFileExtsn == 'ppt' || lFileExtsn == 'pptx'}">
													</c:if>
												</div>
											</li>
										</c:if>
									</c:forEach>
									</ul>
								</c:if>
							</td>
						</tr>
					</c:if>

					<c:if test="${not empty result}">
						<tr>
							<th scope="row">등록일</th>
							<td>${result.regDate} (${result.ntcrNm})</td>
						</tr>
					</c:if>

					<c:if test="${not empty result}">
						<tr>
							<th scope="row">최종수정일</th>
							<td>${result.uptDate}</td>
						</tr>
					</c:if>

					<c:if test="${not empty result}">
						<tr>
							<th scope="row">요청 처리</th>
							<td>
								<c:if test="${result.option2 eq 'A'}">접수</c:if>
								<c:if test="${result.option2 eq 'W'}">처리 중</c:if>
								<c:if test="${result.option2 ne 'Y' and result.option2 ne 'W'}">미완료</c:if>
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
	</form>

	<c:if test="${result.delcode eq '1'}">
		<div class="fl">
	<%--  		<a class="btn btn-danger" href="javascript:delPermanently();" onclick="return confirm('정말로 영구삭제하시겠습니까?');"><span>영구삭제</span></a> --%>
		</div>
	</c:if>

	<div class="btnSet">
		<div class="fl">
			<c:if test="${prevNextMap['PREV'].prevNttId > 0}">
				<a class="btn btn-default" href="/bos/bbs/${paramVO.bbsId}/view.do?nttId=${prevNextMap['PREV'].prevNttId}&${pageQueryString}"><span>이전글</span></a>
			</c:if>

			<c:if test="${prevNextMap['NEXT'].nextNttId > 0}">
				<a class="btn btn-default" href="/bos/bbs/${paramVO.bbsId}/view.do?nttId=${prevNextMap['NEXT'].nextNttId}&${pageQueryString}"><span>다음글</span></a>
			</c:if>
		</div>

		<div class="fr" >
			<a class="btn btn-primary" href="/bos/bbs/${paramVO.bbsId}/forUpdate.do?nttId=${result.nttId}&${pageQueryString}&${result.delcode}"><span>수정</span></a>

			<c:if test="${result.delcode eq '0' }" >
				<a class="btn btn-danger" href="javascript:delPermanently();" onclick="return confirm('정말로 삭제하시겠습니까?');"><span>삭제</span></a>
			</c:if>

			<c:if test="${result.delcode eq '1' }" >
				<a class="btn btn-inverse" href="javascript:restore();" onclick="return confirm('정말로 복구하시겠습니까?');"><span>원글복구</span></a>
			</c:if>

			<c:url var="url" value="/bos/bbs/${paramVO.bbsId}/list.do?${pageQueryString}"/>
			<a class="btn btn-primary" href="${url}"><span>목록</span></a>
		</div>
	</div>

	<c:if test="${masterVO.cmmntPosblAt eq 'Y' and not empty result}">
		<br/>
		<br/>
		<h3 class="tit_03">네티즌의견목록</h3>
		<!-- board list start -->
		<div>
			<table class="table table-bordered table-striped table-hover">
				<caption>게시판 목록</caption>
				<colgroup>
					<col width="8%" />
					<col width="10%" />
					<col width="*%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">관리자</th>
						<th scope="col">내용</th>
						<th scope="col" class="last">등록일</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="cmmnt" items="${cmmntList}" varStatus="status">
					<tr id="ftr_${cmmnt.cmmntId}" class="notice_on">
						<td >${fn:length(cmmntList) - status.count + 1}</td>
						<td >${cmmnt.name}</td>
						<td >${cmmnt.content}</td>
						<td ><span title="등록일">${cmmnt.regDate}</span></td>
					</tr>
				</c:forEach>
				<c:if test="${fn:length(cmmntList) == 0}"><tr><td colspan="7">데이터가 없습니다.</td></tr></c:if>
				</tbody>
			</table>
		</div>
	</c:if>
</div>
