
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc" %>

<ccc:constantsMap className="kr.co.unp.bbs.vo.SearchVO" var="SearchVO"/>

	<div class="over-hidden sub_contents_header">
		<div class="linemap_wrap"> <!-- fl class 삭제 -->
			<ul class="col-12 linemap_con">
				<li><a href="/edu/main/main.do"><span style="clip: rect(1px, 1px, 1px, 1px); position:absolute;">Home</span></a></li>
				<li><a href="javascript:void(0);" tabindex="-1"><span>공지사항</span></a></li>
			</ul>
		</div>
	</div>
	<div class="sub_title s_tit02">
		<div class="col-center mw-1280">공지사항</div>
	</div>

	<!-- bdList -->
	<div class="col-center mw-1280 table_search_box01">
		<div class="col-12 show-table sub_board_header control_board_header">
		<div class="mx_wid100 col-5 show-tablecell fn vm board_title">
			<h4>총 <span class="board_count"><c:out value="${resultCnt }" />개</span>의 게시글 등록</h4>
		</div>
		<div class="mx_wid100 col-7 show-tablecell fn vm tr board_sorting_con">
			<form action="/<c:out value="${paramVO.siteName }"/>/bbs/${paramVO.bbsId}/list.do" class="form-inline" method="post">
				<input type="hidden" name="nttId" value="${empty result.nttId ? 0 : result.nttId }" /> <input type="hidden" name="pageQueryString" value="<c:out value="${pageQueryString }" />" /> <input type="hidden" name="menuNo" value="<c:out value="${paramVO.menuNo }" />" />
				<fieldset>
					<legend></legend>
					<span class="relation_site">
						<select class="select_style_0" name="searchCnd" id="searchCnd" title="구분을 선택해 주세요.">
							<option value="1" <c:if test="${paramVO.searchCnd == '1'}">selected="selected"</c:if>>제목</option>
							<option value="2" <c:if test="${paramVO.searchCnd == '2'}">selected="selected"</c:if>>내용</option>
						</select>
						<!-- <label for="searchCnd"></label> -->
					</span>
					<span class="tl input_search_con">
						<input type="text" class="board_search" name="searchWrd" id="searchWrd" title="검색어를 입력해 주세요." value="${paramVO.searchWrd }" />
						<input type="submit" class="search_summit btn-primary nav_search_btn" id="input2" name="input2" value="" title="검색"/>
					</span>
					<c:if test="${not empty paramVO.searchWrd }">
						<a href="/edu/bbs/<c:out value="${paramVO.bbsId}" />/list.do?menuNo=<c:out value="${param.menuNo }"/>" class="btn btn-sm ml10">전체목록</a>
					</c:if>
				</fieldset>
			</form>
		</div>
	</div>
	</div>
	
	<div class="col-12 col-center mw-1280 table-responsive">
		<table class="table table-styling pc_table table-hover txt_ct">
			<caption>${masterVO.bbsNm} 목록</caption>
			<thead>
			<tr class="">
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성일</th>
					<th scope="col">조회</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="result" items="${resultList}" varStatus="status">
					<tr<c:if test="${result.nttType=='1'}"> class="notice_title"</c:if>>
						<td>
							<c:out value="${result.nttType=='1' ? ' ' : (resultCnt) - (paginationInfo.pageSize * (paramVO.pageIndex-1))}" />
						</td>
						<td class="tal">
							<c:url var="url" value="/${paramVO.siteName }/bbs/${paramVO.bbsId}/view.do?nttId=${result.nttId}${pageQueryString}" />
							<a href="<c:out value='${url}' escapeXml='false'/>">
								<c:if test="${result.nttType=='1'}"><span>[공지]</span></c:if>
								<c:choose>
								<c:when test="${result.delcode ne SearchVO.NON_DELETION}">
								<span class="del"><c:out value='${result.nttSj}' /></span>
								</c:when>
								<c:otherwise>
									<c:out value='${result.nttSj}' />
								</c:otherwise>
								</c:choose> ${result.newYn=='Y'?'[new]':''}
							</a>
						</td>
						<td>${result.frstRegisterPnttm}</td>
						<td class="brn">${result.inqireCo}</td>
					</tr>
					<c:set var="resultCnt" value="${resultCnt-1}" />
				</c:forEach>
				<c:if test="${fn:length(resultList) == 0}"><tr><td colspan="4">데이터가 없습니다.</td></tr></c:if>
			</tbody>

		</table>
		
		<!-- mobile table -->
		<ul class="board_type_0 mo_table">
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<li class="table_list _notice">
					<a href="<c:out value='${url}' escapeXml='false'/>" class="table_info_box">
						<div class="left_box">
							<c:out value="${result.nttType=='1' ? ' ' : (resultCnt) - (paginationInfo.pageSize * (paramVO.pageIndex-1))}" />
						</div>
						<div class="right_box">
							<c:url var="url" value="/${paramVO.siteName }/bbs/${paramVO.bbsId}/view.do?nttId=${result.nttId}${pageQueryString}" />
							<p class="title">
								<c:if test="${result.nttType=='1'}"><span>[공지]</span></c:if>
								<c:choose>
									<c:when test="${result.delcode ne SearchVO.NON_DELETION}">
										<span class="del"><c:out value='${result.nttSj}' /></span>
									</c:when>
									<c:otherwise>
										<c:out value='${result.nttSj}' />
									</c:otherwise>
								</c:choose> ${result.newYn=='Y'?'[new]':''}
							</p>
							<p class="date_view"><span>${result.frstRegisterPnttm}</span><span>조회 : ${result.inqireCo}</span></p>
						</div>
					</a>
				</li>
				<c:set var="resultCnt" value="${resultCnt-1}" />
			</c:forEach>
			<c:if test="${fn:length(resultList) == 0}"><tr><td colspan="4">데이터가 없습니다.</td></tr></c:if>
		</ul>

	</div>
	
	
	<!-- paging -->
	<c:if test="${fn:length(resultList) > 0}">
		<div class="paging">${pageNav}</div>
		<!-- paging end //-->
	</c:if>
	<!-- //paging -->
