
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc"%>

<!-- Tab -->
<div class="over-hidden sub_contents_header">
	<div class="linemap_wrap"> <!-- fl class 삭제 -->
		<ul class="col-12 linemap_con">
			<li><a href="/edu/main/main.do"><span style="clip: rect(1px, 1px, 1px, 1px); position:absolute;">Home</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>수료증 출력</span></a></li>
		</ul>
	</div>
</div>
<div class="sub_title s_tit02">
	<div class="col-center mw-1280">수료증 출력</div>
</div>
<!-- //Tab -->

<div class="col-center mw-1280 table_search_box01">
	<div class="col-12 show-table sub_board_header control_board_header">
		<div class="mx_wid100 col-5 show-tablecell fn vm board_title">
			<h4></h4>
		</div>
		<div class="mx_wid100 col-7 show-tablecell fn vm tr board_sorting_con">
			<form id="frm" name="frm" action ="/edu/onlineEdu/mylctrum/listLessonHistory.do?menuNo=${paramVO.menuNo}" method="post" class="form-inline">
				<input type="hidden" name="p_subj" id="p_subj" value="" />
				<input type="hidden" name="p_year" id="p_year" value="" />
				<input type="hidden" name="p_subjseq" id="p_subjseq" value="" />
				<input type="hidden" name="p_userid" id="p_userid" value="" />
				<input type="hidden" name="p_kind" id="p_kind" value="" />
				<input type="hidden" name="p_grcode" id="p_grcode" value="" />
				<input type="hidden" name="p_serno" id="p_serno" value="" />
				<fieldset>
					<legend></legend>
					<span class="relation_site">
						<select class="select_style_0 txt_ct" name="searchCnd" id="searchCnd" title="구분을 선택해 주세요.">
							<option value="1" <c:if test="${paramVO.searchCnd == '1'}">selected="selected"</c:if> >년도</option>
					   		<option value="2" <c:if test="${paramVO.searchCnd == '2'}">selected="selected"</c:if> >과정명</option>
						</select>
						<!-- <label for="searchCnd"></label> -->
					</span>
					<span class="tl input_search_con">
						<input type="text" class="board_search" name="searchWrd" id="searchWrd" title="검색어를 입력해 주세요." value="${paramVO.searchWrd }" />
						<input type="submit" class="search_summit btn-primary nav_search_btn" id="input2" name="input2" value="" title="검색"/>
					</span>
				</fieldset>
			</form>
		</div>
	</div>
</div>




<%-- <div class="row mt10 mb5">
	<div class="col-md-12"> 총 : <strong class="text-danger"><c:out value="${resultCnt }" /></strong>건 | <strong class="text-danger"><c:out value="${paramVO.pageIndex }" /> / <c:out value="${totalPage }" /></strong> Page </div>
</div> --%>
<div class="col-center mw-1280 table-responsive">

	<table class="table table-styling pc_table table-hover txt_ct">
		<caption>수료증 출력</caption>
		<colgroup>
		<col style="width:8%;" />
		<col style="width:44%;" />
		<col style="width:18%;" />
		<col style="width:8%;" />
		<col style="width:10%;" />

		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>과정명</th>
				<th>학습기간</th>
				<th>학습회차</th>
				<th>수료증출력</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="result" items="${lessonHistoryList}" varStatus="status">
			<c:url var="url" value="/edu/bbs/${paramVO.bbsId}/view.do?nttId=${result.nttId}&amp;myAt=Y&${pageQueryString}" />
				<tr>
					<td>${result.num}</td>
					<td><c:out value="${result.subjnm}"/></td>
					<td><c:out value="${result.edustart}"/>~<c:out value="${result.eduend}"/></td>
					<td><c:out value="${result.lessonCnt}"/></td>
					<td class="brn">
						<c:if test="${result.subj ne '' and result.isgraduated eq 'Y'}">
							<div class="board_util_btn_con center">
								<a href="javascript:void(0);" onclick="fnCmdCtfhv('${result.subj}', '${result.year}', '${result.subjseq}', '${result.userid}', '1', '${grcode}', '${result.serno}'); return false;" class="btn_style_0 full small" title="새창열림">수료증</a>
							</div>
						</c:if>
					</td>
				</tr>
<c:set var="resultCnt" value="${resultCnt-1}" />
			</c:forEach>
			<c:if test="${fn:length(lessonHistoryList) == 0}"><tr><td colspan="6">데이터가 없습니다.</td></tr></c:if>
		</tbody>
	</table>

	<!-- mobile table -->
	<ul class="board_type_0 mo_table">
		<c:forEach var="result" items="${lessonHistoryList}" varStatus="status">
		<c:url var="url" value="/edu/bbs/${paramVO.bbsId}/view.do?nttId=${result.nttId}&amp;myAt=Y&${pageQueryString}" />
			<li class="table_list _notice">
				<a href="javascript:void(0);" class="table_info_box">
					<div class="left_box">
							${result.num}
					</div>
					<div class="right_box">
						<c:url var="url" value="/${paramVO.siteName }/bbs/${paramVO.bbsId}/view.do?nttId=${result.nttId}${pageQueryString}" />
						<p class="title">
							<c:out value="${result.subjnm}"/>
						</p>
						<p class="date_view">
							<span><c:out value="${result.edustart}"/>~<c:out value="${result.eduend}"/></span>
							<span>
								<c:if test="${result.subj ne '' and result.isgraduated eq 'Y'}">
									<a href="javascript:void(0);" onclick="fnCmdCtfhv('${result.subj}', '${result.year}', '${result.subjseq}', '${result.userid}', '1', '${grcode}', '${result.serno}'); return false;" class="btn_style_0 full small" title="새창열림">수료증</a>
								</c:if>
							</span>
						</p>
					</div>
				</a>
			</li>
		<c:set var="resultCnt" value="${resultCnt-1}" />
		</c:forEach>
		<c:if test="${fn:length(resultList) == 0}"><div>데이터가 없습니다.</div></c:if>
	</ul>

	<!-- paging -->
	<c:if test="${fn:length(resultList) > 0}">
		<div class="paging">
			${pageNav}
		</div>
	</c:if>
</div>

<style>
	@media screen and (max-width:640px){
		.date_view{
			display: flex;
			align-items: center;
		}
		.date_view .btn_style_0{
			font-size: 15px;
			background-color: #3b85ff;
			padding: 5px 10px;
			color: #fff;
		}
	}
</style>

<script type="text/javascript">
//<![CDATA[
           
           
	$(document).ready(function(){
					
		
	});

	
	//수료증 출력
	function fnCmdCtfhv(subj, year, subjSeq, userid, kind, subjgrcode, serno){
		
		$("#p_subj").val(subj);
		$("#p_year").val(year);
		$("#p_subjseq").val(subjSeq);
		$("#p_userid").val(userid);
		$("#p_kind").val(kind);
		$("#p_grcode").val(subjgrcode);
		$("#p_serno").val(serno);
		
		window.open("","openSuryoJeungPrint","scrollbars=no, width=830, height=800, scrollbars=yes, resizable=NO");
		
		$("#frm").attr({
					action:"/edu/onlineEdu/mylctrum/viewCtfhv.do?menuNo=<c:out value='${paramVO.menuNo }'/>&viewType=CONTBODY",
					method:"post",
					target:"openSuryoJeungPrint"
					});
		$("#frm").submit();
		
	}
	//]]>
</script>
	