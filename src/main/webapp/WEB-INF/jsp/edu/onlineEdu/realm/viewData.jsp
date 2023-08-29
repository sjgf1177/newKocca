<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc"%>


<div class="over-hidden sub_contents_header">
	<div class="linemap_wrap"> <!-- fl class 삭제 -->
		<ul class="col-12 linemap_con">
			<li><a href="/edu/main/main.do"><span style="clip: rect(1px, 1px, 1px, 1px); position:absolute;">Home</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>로그인 후 수강</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>자료실</span></a></li>
		</ul>
	</div>
</div>

<div class="sub_title s_tit02">
	<div class="col-center mw-1280">자료실</div>
</div>


<div class="col-center mw-1280">
	<!-- step 영역 s -->
	<jsp:include page="/WEB-INF/jsp/edu/onlineEdu/realm/eduStep.jsp" flush="true" />
	<!-- step 영역 e -->


	<form id="frm" name="frm" action="/edu/onlineEdu/${paramVO.programId}/viewData.do?menuNo=<c:out value='${paramVO.menuNo }'/>" method="post" class="form-inline">

		<input type="hidden" name="pGubun1" id="pGubun1" value="${param.pGubun1 }" />
		<input type="hidden" name="pGubun2" id="pGubun2" value="${param.pGubun2 }" />
		<input type="hidden" name="pGubun3" id="pGubun3" value="${param.pGubun3 }" />

		<input type="hidden" name="p_subj" id="p_subj" value="${param.p_subj }" />
		<input type="hidden" name="p_subjnm" id="p_subjnm" value="${param.p_subjnm }" />
		<input type="hidden" name="p_isonoff" id="p_isonoff" value="${param.p_isonoff }" />
		<input type="hidden" name="p_scupperclass" id="p_scupperclass" value="${param.p_scupperclass }" />
		<input type="hidden" name="p_uclassnm" id="p_uclassnm" value="${param.p_uclassnm }" />
		<input type="hidden" name="p_year" id="p_year" value="${param.p_year }" />
		<input type="hidden" name="p_subjseq" id="p_subjseq" value="${param.p_subjseq }" />


		<input type="hidden" name="p_searchtext" id="p_searchtext" value="${param.p_searchtext }" />
		<input type="hidden" name="p_orders" id="p_orders" value="<c:out value="${param.p_orders }"/>" />
		<input type="hidden" name="p_ordersnm" id="p_ordersnm" value="<c:out value="${param.p_ordersnm }"/>" />

		<input type="hidden" name="p_tabselect" id="p_tabselect" value="<c:out value="${param.p_tabselect }"/>" />

		<input type="hidden" name="pDataSearch" id="pDataSearch" value="<c:out value='${param.pDataSearch }' />" />
		<input type="hidden" name="pDataSearchtext" id="pDataSearchtext" value="<c:out value='${param.pDataSearchtext }' />" />

		<!-- paging s -->
		<input type="hidden" name="gubun" id="gubun" value="<c:out value='${param.gubun }' />" />
		<input type="hidden" name="option1" id="option1" value="<c:out value='${param.option1 }' />" />
		<input type="hidden" name="option5" id="option5" value="<c:out value='${param.option5 }' />" />
		<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${param.pageIndex }' />" />
		<!-- paging e -->



		<!-- 학습하기 파라미터 s -->
		<input type="hidden" name="s_year" id="s_year" value="${param.s_year }" />
		<input type="hidden" name="s_cpsubj" id="s_cpsubj" value="${param.s_cpsubj }" />
		<input type="hidden" name="s_cpsubjseq" id="s_cpsubjseq" value="${param.s_cpsubjseq }" />
		<input type="hidden" name="s_company" id="s_company" value="${param.s_company }" />
		<input type="hidden" name="s_contenttype" id="s_contenttype" value="${param.s_contenttype }" />
		<input type="hidden" name="s_subj" id="s_subj" value="${param.s_subj }" />
		<input type="hidden" name="s_subjseq" id="s_subjseq" value="${param.s_subjseq }" />
		<input type="hidden" name="s_lesson" id="s_lesson" value="${param.s_lesson }" />
		<!-- 학습하기 파라미터 e -->

	</form>

	<!-- bdView -->
	<table class="col-12 mt30 board_type_0 detail notice">
		<caption>정규과정 자료실</caption>
		<colgroup>
			<col width="100%">
		</colgroup>
		<thead>
		<tr>
			<th>
				<span>${viewData.title }</span>
				<span class="writer_info">
					<span>
						hit.<c:out value="${viewData.cnt }" />
					</span>
					<span>
						<fmt:parseDate var="dateString" value="${viewData.indate}" pattern="yyyyMMddHHmmss" />
						<fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd" />
					</span>
				</span>
			</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td>
				<div class="table_info_header">
					<div class="upload_file">
						<c:set var="fileicn" value="" />

						<c:forEach var="fileVO" items="${listFileData}" varStatus="status">
							<c:set var="originalfilename" value="${fileVO.savefile }" />
							<c:set var="lowerfilename" value="${fn:toLowerCase(originalfilename)}" />

							<c:forTokens var="ext" items="${lowerfilename}" delims="." varStatus="status">
								<c:if test="${status.last}">
									<c:set var="fileicn" value="${ext }" />
								</c:if>
							</c:forTokens>
							<c:set var="url" value="https://edulms.kocca.kr/servlet/controller.library.DownloadServlet?p_savefile=${fileVO.savefile }&p_realfile=" />
							<c:set var="realfilename" value="${fileVO.realfile }" />

							<%
								String f_encode = URLEncoder.encode((String)pageContext.getAttribute("realfilename"), "euc-kr");
								String realfileconv = f_encode.replace("%5B", "[").replace("%5D", "]").replace("+", "%20");
							%>

							<a href="${url }<%= realfileconv %>" class="${fileicn}">
								<c:out value="${fileVO.realfile }"/><br />
							</a>
<%--							<c:set var="realfilename" value="${fileVO.realfile }" />

							<c:set var="url" value="https://edulms.kocca.kr/servlet/controller.library.DownloadServlet?p_savefile=${fileVO.savefile }&p_realfile=" />
							&lt;%&ndash;<c:set var="url" value="http://localhost:8088/servlet/controller.library.DownloadServlet?p_savefile=${fileVO.savefile }&p_realfile=${fileVO.realfile }" />&ndash;%&gt;
							<%
								// [%BD%C7%BD%C0%C1%F6]%20%C0%A5%C5%F7%20%BF%F8%C0%DB%20%B5%E5%B6%F3%B8%B6%20%BD%BA%C5%E4%B8%AE%C5%DA%B8%B5.pptx
								// [%BD%C7%BD%C0%C1%F6]%20%C0%A5%C5%F7%20%BF%F8%C0%DB%20%B5%E5%B6%F3%B8%B6%20%BD%BA%C5%E4%B8%AE%C5%DA%B8%B5.pptx
								String aaa = URLEncoder.encode("[실습지] 웹툰 원작 드라마 스토리텔링.pptx", "UTF-8");
								String bbb = URLEncoder.encode((String)pageContext.getAttribute("realfilename"), "euc-kr");
								String ccc = URLEncoder.encode("[실습지] 웹툰 원작 드라마 스토리텔링.pptx", "euc-kr");
								String ddd = "https://edulms.kocca.kr/servlet/controller.library.DownloadServlet?p_savefile=" + (String)pageContext.getAttribute("originalfilename");
								String fff = bbb.replace("%5B", "[").replace("%5D", "]").replace("+", "%20");

								System.out.println("UTF1 : " + aaa);
								System.out.println("UTF2 : " + bbb.replace("%5B", "[").replace("%5D", "]").replace("+", "%20"));
								System.out.println("UTF3 : " + ccc);
							%>--%>

<%--							<c:url value="http://localhost:8088/servlet/controller.library.DownloadServlet?p_savefile=${fileVO.savefile }" var="url">
								<c:param name="p_realfile" value="${fileVO.realfile }" />
							</c:url>--%>

						</c:forEach>

						<c:if test="${empty listFileData }">
							<a href="javascript:void(0)">등록된 첨부파일이 없습니다.</a>
						</c:if>
					</div>
				</div>
				<div class="contents_view_area">
					<c:set var='content' value='${viewData.content}'/>
					<%
						String content = (String)pageContext.getAttribute("content") != null ? (String)pageContext.getAttribute("content") : "" ;
						content= content.replaceAll("(?i)<(/)?body(\\s[a-zA-Z0-9]*=[^>]*)?(\\s)*(/)?>", "").replaceAll("(?i)<(/)?head(\\s[a-zA-Z0-9]*=[^>]*)?(\\s)*(/)?>", "").replaceAll("(?i)<(/)?html(\\s[a-zA-Z0-9]*=[^>]*)?(\\s)*(/)?>", "").replaceAll("(?i)<(/)?meta(\\s[a-zA-Z0-9]*=[^>]*)?(\\s)*(/)?>", "").replaceAll("(?i)<(/)?title(\\s[a-zA-Z0-9]*=[^>]*)?(\\s)*(/)?>", "");
					%>
					<%= content %>
				</div>
			</td>
		</tr>
		</tbody>
	</table>
	<div class="board_util_btn_con">
		<a href="javascript:void(0);" onclick="fnCmdSearchList(); return false;" class="btn_style_0 full list">목록</a>
	</div>

	<!--
	<div class="dlListTable">
		<dl>
			<dt>다음글</dt>
			<dd>아프리카 인기 BJ와 함께하는 ‘MCN 크리에이터 커뮤니티’ 개최</dd>
		</dl>
		<dl>
			<dt>이전글</dt>
			<dd>아프리카 인기 BJ와 함께하는 ‘MCN 크리에이터 커뮤니티’ 개최</dd>
		</dl>
	</div>
	 -->
	<!-- //bdView -->
</div>

<script type="text/javascript">
//<![CDATA[

	$(document).ready(function(){
		
	});
	
	
	//자료 조회
	function fnCmdSearchList(){
		
		$("#frm").attr({
					action:"/edu/onlineEdu/realm/listData.do?menuNo=<c:out value='${paramVO.menuNo }'/>",
					method:"post",
					target:"_self"
					});
		$("#frm").submit();
	}
	
//]]>
</script>

