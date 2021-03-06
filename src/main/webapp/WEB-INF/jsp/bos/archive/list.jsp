<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="kr.co.unp.archive.service.ArchiveBosService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="util" uri="http://www.unp.co.kr/util"%>
<ui:pagination paginationInfo="${paginationInfo}" type="adminImage" jsFunction="fn_egov_select"/>

<script type="text/javascript">
$(function() {
	
	$.datepicker.setDefaults($.datepicker.regional['ko']);
	$("#sdate").datepicker({showOn: 'button', buttonImage: '/bos/images/calendar.gif', buttonImageOnly: true, changeMonth: true, changeYear: true, showMonthAfterYear:false});
	$("#edate").datepicker({showOn: 'button', buttonImage: '/bos/images/calendar.gif', buttonImageOnly: true, changeMonth: true, changeYear: true, showMonthAfterYear:false});
	
	 $('#sdate').datepicker();
	    $('#sdate').datepicker("option", "maxDate", $("#edate").val());
	    $('#sdate').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#edate").datepicker( "option", "minDate", selectedDate );
	    });

	    $('#edate').datepicker();
	    $('#edate').datepicker("option", "minDate", $("#sdate").val());
	    $('#edate').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#sdate").datepicker( "option", "maxDate", selectedDate );
	    });
	
	
	$("#chkAll").click(function(){
		if(this.checked)
			$(":checkbox").attr("checked", true);
		else
			$(":checkbox").attr("checked", false);
	});
});


</script>

<form id="frm" name="frm" method="post" action="/bos/archive/list.do?menuNo=${param.menuNo}" class="form-inline">
 <input type="hidden" name="taskSeq" value="${param.taskSeq}"> 
 <input type="hidden" name="pageIndex"  id="pageIndex"  value="<c:out value='${param.pageIndex }' />" />
	<fieldset>
		<legend></legend>
		<div class="bdView mb0">
			<table class="table table-bordered">
				<caption></caption>
				<colgroup>
					<col span="3">
					<col>
				</colgroup>
				
				<tbody>
					<tr>
						<th><label for="year">??????</label></th>
					<td>
						<select id="year" name="year" title="??????" style="width:100px" class="required">
					    	<option value="" <c:if test="${result.year eq ''}">selected</c:if>>??????</option>
						    
						    <!-- ??????????????? ???????????? -->
						    <c:set var="today" value="<%=new java.util.Date()%>" />
						    <!-- ????????? : date to String -->
						    <fmt:formatDate value="${today}" pattern="yyyy" var="nowY"/> 
						    <!-- ????????????  -->
					        <c:set var="sYear" value="${nowY - 3}" />
					        <!-- ????????? ?????? -->
					        <c:set var="endNum" value="${nowY + 3 - sYear}" />
						   <!-- ????????? ???????????????. -->
						    <c:forEach var="i" begin="0" end="${endNum}">
						    	<c:set var="yearOption" value="${sYear + i}" />
						    	<option value="${yearOption}" <c:if test="${param.year eq yearOption}">selected</c:if>>${yearOption}</option>
							</c:forEach>
							
						</select>
						</td>
						
						<th><label for="division">????????????</label></th>
						<td>
						<select id="workField" name="workField" class="form-control input-sm">
								<option value="">??????</option>
								<option value='1' <c:if test="${param.workField == '1'}">selected="selected"</c:if>>??????????????????</option>
								<option value='2' <c:if test="${param.workField == '2'}">selected="selected"</c:if>>?????????????????????</option>
								<option value='3' <c:if test="${param.workField == '3'}">selected="selected"</c:if>>?????????????????????</option>
								<option value='4' <c:if test="${param.workField == '4'}">selected="selected"</c:if>>??????????????????</option>
								<option value='5' <c:if test="${param.workField == '5'}">selected="selected"</c:if>>AI?????????????????????</option>
						</select>
						</td>
						
						<th><label for="prgNm">???????????????</label></th>
						<td colspan="1"><input type="text" name="organNm"
							id="organNm" value="${param.organNm}"></td>
					</tr>
					<tr>
						<th><label for="taskNm">?????????</label></th>
						<td colspan="1"><input type="text" name="taskNm" id="taskNm"
							value="${param.taskNm}"></td>

						<th><label for="useAt">????????????</label></th>
						<td><select name="useAt" id="useAt" title="??????????????? ????????? ?????????.">
								<option value="">??????</option>
								<option value='Y' <c:if test="${param.useAt == 'Y'}">selected="selected"</c:if>>??????</option>
								<option value='N' <c:if test="${param.useAt == 'N'}">selected="selected"</c:if>>?????????</option>
						</select></td>
						<th>?????????</th>
						<td colspan="1"><input type="text" id="sdate" name="sdate" 
							value="${param.sdate}" style="width: 110px" title="???????????? ????????? ??????" />
							~ <input type="text" id="edate" name="edate" 
							value="${param.edate}" style="width: 110px" title="???????????? ????????? ??????" />
						</td>
					</tr>
				
				</tbody>
			</table>
		</div>
		
		<div class="btnSet">
			<input type="submit" class="btn btn-primary btnSet" value="??????" />
		</div>
	
	</fieldset>
</form>

<div class="row mt10 mb5">
	<div class="col-md-12">
		??? : <strong class="text-danger"><c:out value="${resultCnt }" /></strong>???
		| <strong class="text-danger"><c:out
				value="${paramVO.pageIndex }" /> / <c:out value="${totalPage }" /></strong>
		Page
	</div>
</div>

<div class="bdList">
	<table class="table table-bordered">
		<caption></caption>
		<colgroup>
			<!-- ??????  -->
			<col style="width: 35px;">
			<!-- ??????  -->
			<col style="width: 40px;">
			<!-- ???????????? -->
			<col style="width: 110px;">
			<!-- ????????? -->
			<col style="width: 200px;">
			<!-- ????????? -->
			<col style="width: 170px;">
			<!-- ???????????? -->
			<col style="width: 70px;">
			<!-- ???????????? -->
			<col style="width: 70px;">
			<!-- ????????? -->
			<col style="width: 60px;">
			<!-- ????????? -->
			<col style="width: 95px;">
			<!-- ???????????? -->
			<col style="width: 60px;">
			<!-- ???????????? ?????? -->
			<col style="width: 60px;">
		</colgroup>
		<thead>
			<tr>
				<th>??????</th>
				<th>??????</th>
				<th>????????????</th>
				<th>?????????</th>
				<th>?????????</th>
				<th>????????????</th>
				<th>????????????</th>
				<th>?????????</th>
				<th>?????????</th>
				<th>????????????</th>
				<th>??????????????????</th>
			</tr>
		</thead>
		<tbody  style="text-align:center;">
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
					<td>${(resultCnt) - (paramVO.pageSize * (paramVO.pageIndex-1))}</td>
					
					<td>${result.year}</td>
						<c:choose>
							<c:when test="${result.workField eq 2}">
							<td>?????????????????????</td>
							</c:when>
							<c:when test="${result.workField eq 3}">
							<td>?????????????????????</td>
							</c:when>
							<c:when test="${result.workField eq 4}">
							<td>?????????????????? </td>
							</c:when>
							<c:when test="${result.workField eq 5}">
							<td>AI?????????????????????</td>
							</c:when>							
							<c:otherwise>
							<td>??????????????????</td>
							</c:otherwise>
						</c:choose>
					
					<td style="text-align:left;">${result.organNm}</td>
					<td style="text-align:left;">${result.taskNm}</td>
					<td>${result.projectCnt}</td>
					<td>${result.useAt eq 'N' ? '?????????' : '??????'}</td>
					<td>${result.userNm}</td>
				    <td><fmt:formatDate value="${result.frstRegistPnttm}" pattern="yyyy-MM-dd"/></td> 
					
					<td><c:url value='/bos/archive/forUpdate.do?taskSeq=${result.archiveTaskSeq}&menuNo=${param.menuNo}&projectCnt=${result.projectCnt }&pageIndex=${param.pageIndex}' var="read_url" />
						<a class="btn btn-primary btn-sm" href="${read_url}">??????</a></td>
					
					<td><a class="btn btn-primary btn-sm" href="/bos/archive/deptList.do?taskSeq=${result.archiveTaskSeq}&menuNo=${param.menuNo}"><span>??????</span></a></td>
				
				</tr>
				<c:set var="resultCnt" value="${resultCnt-1}" />
			</c:forEach>
			
			<c:if test="${fn:length(resultList) == 0}">
				<tr>
					<td colspan="11">???????????? ????????????.</td>
				</tr>
			</c:if>
		
		</tbody>
	</table>
</div>

<div class="btn_set">
	<a class="btn btn-primary" href="/bos/archive/forInsert.do?menuNo=${param.menuNo}"><span>?????? ??????</span></a>
</div>

<c:if test="${fn:length(resultList) > 0}">
	<div class="paging">
		<div class="paging_con">
			${pageNav}
		</div>
	</div>
</c:if>

