<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc"%>


<div class="sub_title s_tit02">
	<div class="">
		<div class="col-12 mb30 alert big_box" style="background-color: #222222;">
			<!-- 수업진도율 -->
			<div class="lectProgressSet">
				<div class="lecProgress"></div>
				<div class="lectProBar mt5">
					<div class="progress-bar progress-bar-success" style="width:<fmt:parseNumber integerOnly="true" value="${myProgress }" type="number" />%" title="<fmt:parseNumber integerOnly="true" value="${myProgress }" type="number" />% 진도율">
						<%--<span class="icon progressInfo"><fmt:parseNumber integerOnly="true" value="${myProgress }" type="number" /><span class="sr-only">% 진도율</span></span>--%>
					</div>
					<%--<c:choose>
                        <c:when test="${p_subj eq 'CK20010'}">
                            <div class="progress-bar progressIng" style="width: 100%;" title="수료기준 진도100%">
                                <span class="sr-only">수료기준 진도100%</span>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="progress-bar progressIng" style="width: 70%;" title="수료기준 진도70%">
                                <span class="sr-only">수료기준 진도70%</span>
                            </div>
                        </c:otherwise>
                    </c:choose>--%>

				</div>
				<p class="point" align="left"><strong>진도율 : <fmt:parseNumber integerOnly="true" value="${myProgress }" type="number" />%</strong></p>
				<%--<c:choose>
                    <c:when test="${p_subj eq 'CK20010'}">
                        <div class="row">
                            <div class="col-md-6">수료기준 진도 100%</div>
                            <c:if test="${myProgress ge 100.0 }">
                                <div class="col-md-6 tar"><span class="icon icoSm lectCheck"></span> 수료함</div>
                            </c:if>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="row">
                            <div class="col-md-6">수료기준 진도 70%</div>
                            <c:if test="${myProgress ge 70.0 }">
                                <div class="col-md-6 tar"><span class="icon icoSm lectCheck"></span> 수료함</div>
                            </c:if>
                        </div>
                    </c:otherwise>
                </c:choose>--%>
			</div>
			<!-- //수업진도율 -->
			<%--<p class="alert_title" style="margin-bottom:0;">${view.subjnm }</p>--%>
			<%-- <c:set var="arrayofedumans" value="${fn:split(view.edumans,'-')}"/>
            <c:forEach var="i" begin="0" end="${fn:length(arrayofedumans)-1 }" varStatus="status">
                - ${arrayofedumans[i] } <c:if test="${not status.last }"> <br /></c:if>
            </c:forEach> --%>
			<a href="javascript:void(0);" onclick="fnCmdSubjList('${paramVO.menuNo }', '${param.pGubun1 }', '${param.pGubun2 }', '${param.pGubun3 }'); return false;" class="return_list_box gnb_close">
				<img src="/edu/img/gnb_close.png" alt="GNB 메뉴 닫기" style="padding: 0px; display: inline-block;">
				<%--<input type="image" src="/edu/img/gnb_close.png" class="gnb_close" alt="GNB 메뉴 닫기" style="padding: 0px; display: inline-block;">--%>
			</a>
		</div>
	</div>
</div>

<!-- step 영역 s -->
<jsp:include page="/WEB-INF/jsp/edu/onlineEdu/realm/eduStep.jsp" flush="true" />
<!-- step 영역 e -->

<!-- bdList -->
<div class="col-center mw-1280">
	<div class="col-12">

	<form id="frm" name="frm" action="/edu/onlineEdu/${paramVO.programId}/listData.do?menuNo=<c:out value='${paramVO.menuNo }'/>" method="post" class="form-inline">

		<input type="hidden" name="pageQueryString" value='<c:out value="${pageQueryString }" escapeXml="false"/>' >

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
		<input type="hidden" name="pTabseq" id="pTabseq" value="<c:out value="${param.pTabseq }"/>" />
		<input type="hidden" name="pSeq" id="pSeq" value="" />

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


		<div class="table_search_box01 w100p">
			<div class="col-12 show-table sub_board_header control_board_header">
				<div class="mx_wid100 col-5 show-tablecell fn vm board_title">
					<h4>총 <span class="board_count"><c:out value="${resultCnt }" /></span>개의 게시글 등록<%--  | <strong class="text-danger"><c:out value="${paramVO.pageIndex }" /> / <c:out value="${paginationInfo.totalPageCount }" /></strong> Page --%></h4>
				</div>
				<div class="mx_wid100 col-7 show-tablecell fn vm tr board_sorting_con">
						<fieldset>
							<legend></legend>
							<span class="relation_site">
								<select class="select_style_0" name="pDataSearch" id="pDataSearch" title="구분을 선택해 주세요.">
									<option value="1" <c:if test="${paramVO.searchCnd == '1'}">selected="selected"</c:if>>제목</option>
									<option value="2" <c:if test="${paramVO.searchCnd == '2'}">selected="selected"</c:if>>내용</option>
								</select>
										<!-- <label for="searchCnd"></label> -->
							</span>
							<span class="tl input_search_con">
						<input class="board_search" type="text" name="pDataSearchtext" id="pDataSearchtext" title="검색어를 입력해 주세요." value="${param.pDataSearchtext }" />
						<a href="javascript:void(0);" onclick="fnCmdSearchList(); return false;" class="search_summit btn-primary nav_search_btn">검색</a>
						<%--<input type="submit" class="search_summit btn-primary nav_search_btn" id="input2" name="input2" value="" title="검색"/>--%>
					</span>
							<c:if test="${not empty paramVO.searchWrd }">
								<a href="/edu/bbs/<c:out value="${paramVO.bbsId}" />/list.do?menuNo=<c:out value="${param.menuNo }"/>" class="btn btn-sm ml10">전체목록</a>
							</c:if>
						</fieldset>
					</form>
				</div>
			</div>
		</div>


	</form>
	</div>


<div class="col-12 col-center mw-1280 table-responsive">
	<table class="table table-styling pc_table table-hover txt_ct">
		<caption>자료실 목록</caption>
		<colgroup>
			<col style="width:8%;" />
			<col  />
			<col style="width:10%;" />
			<col style="width:10%;" />
			<col style="width:10%;" />
			<col style="width:8%;" />
		</colgroup>
		<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">제목</th>
			<th scope="col">작성자</th>
			<th scope="col">작성일</th>
			<th scope="col">첨부파일</th>
			<th scope="col">조회수</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${resultList }" var="item" varStatus="status">
			<tr>
				<td>${(resultCnt) - (paginationInfo.pageSize * (paramVO.pageIndex-1))}</td>
				<td class="tal">
					<a href="javascript:void(0);" onclick="fnCmdDataViewPage('${item.tabseq}', '${item.seq }'); return false;"><c:out value="${item.title }" /></a>
				</td>
				<td><c:out value="${item.name }" /></td>
				<td>
					<fmt:parseDate var="dateString" value="${item.indate}" pattern="yyyyMMddHHmmss" />
					<fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd" />
				</td>
				<td>
					<div class="table_info_header">
						<span class="table_upload_file_icon"></span>
					</div>
				</td>
				<td><c:out value="${item.cnt }" /></td>
			</tr>
			<c:set var="resultCnt" value="${resultCnt-1}" />
		</c:forEach>

		<c:if test="${empty resultList }">
			<tr><td colspan="6">해당 목록이 없습니다</td></tr>
		</c:if>
		</tbody>

	</table>

	<!-- mobile table -->
	<!-- 모바일 테이블 자료실 작업필요 -->

</div>

	<c:if test="${fn:length(resultList) > 0}">
	<div class="paging">${pageNav}</div>
	<!-- paging end //-->
	</c:if>
</div>

<script type="text/javascript">
//<![CDATA[

	$(document).ready(function(){
		
		//자료 조회 enter key
		$("#pSearchtext").keydown(function(e) {
		    if (e.keyCode == 13) fnCmdSearchList();
		    
		});

		$('header').remove();

		$('.wrapper, .bg_gray_slide_box, .sub_title.s_tit02').css('padding-top','0');
	});
	
	
	//자료 조회
	function fnCmdSearchList(tabseq, seq){
		
		$("#pageIndex").val("1");
		$("#frm").attr({
					action:"/edu/onlineEdu/realm/listData.do?menuNo=<c:out value='${paramVO.menuNo }'/>",
					method:"post",
					target:"_self"
					});
		$("#frm").submit();
	}
	
	
	//상세화면
	function fnCmdDataViewPage(tabseq, seq){
		
		$("#pTabseq").val(tabseq);
		$("#pSeq").val(seq);
		$("#frm").attr({
					action:"/edu/onlineEdu/realm/viewData.do?menuNo=<c:out value='${paramVO.menuNo }'/>",
					method:"post",
					target:"_self"
					});
		$("#frm").submit();
	}
	
//]]>
</script>

