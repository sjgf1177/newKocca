<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge, chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<meta name="robots" content="all" />
<meta name="keywords" content="<spring:message code='site.korName' text=''/>" />
<meta name="description" content="<spring:message code='site.korName' text=''/>" />
<meta name="author" content="<spring:message code='site.korName' text=''/>" />
<link rel="stylesheet" type="text/css" href="/bos/css/ui-lightness/jquery-ui-1.9.1.custom.min.css">
<link rel="stylesheet" type="text/css" href="/js/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="/bos/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/bos/css/sub.css" />
<link rel="stylesheet" type="text/css" href="/bos/css/common.css" />

<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="/bos/js/jquery-ui-1.9.1.custom.min.js"></script>
<script type="text/javascript" src="/bos/js/jquery.ui.core.js"></script>
<script type="text/javascript" src="/bos/js/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialogCallee.js'/>" ></script>
<script type="text/javascript">
	$(function() {
		$("#chkAll").click(function(){
			if(this.checked)
				$(":checkbox").attr("checked", true);
			else
				$(":checkbox").attr("checked", false);
		});
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		$("#sdate").datepicker({showOn: 'button', buttonImage: '/bos/images/calendar.gif', buttonImageOnly: true, changeMonth: true, changeYear: true, showMonthAfterYear:false});
		$("#edate").datepicker({showOn: 'button', buttonImage: '/bos/images/calendar.gif', buttonImageOnly: true, changeMonth: true, changeYear: true, showMonthAfterYear:false});
	});

	function selectMember(deptId, userId, userName){
		var retVal   = new Object();
		retVal.deptId = deptId;
		retVal.userId = userId;
		retVal.userName = userName;

		opener.showModalDialogDeptAuthorCallback(retVal);
		//setReturnValue(retVal);
		//parent.window.returnValue = retVal;
		parent.window.close();
	}

	function search(){
		var f = document.frm2;
		f.action = "/bos/member/listMpmPop.do";
		f.submit();
	}
</script>

<title>????????? ??????</title>
</head>
<body>
	<div id="content" class="ml25">
		<div class="hgroup">
			<h3>????????? ??????</h3>
		</div>

<form name="frm2" method="post" action="/bos/member/listMpmPop.do">
		<!-- ????????? ??????????????? start -->
		<div class="sh">
			<fieldset>
			<legend>????????? ???????????????</legend>
				<input type="text" id="sdate" name="sdate" value="${param.sdate}" size="10" /> ~
			    <input type="text" id="edate" name="edate" value="${param.edate}" size="10" />

				<label for="stributary" class="blind">????????????</label>
				<select id="stributary" name="searchCnd" title="????????????">
				   <option value="1" <c:if test="${paramVO.searchCnd == '1'}">selected="selected"</c:if> >?????????</option>
				   <option value="4" <c:if test="${paramVO.searchCnd == '4'}">selected="selected"</c:if> >??????</option>
				</select>
						<input id="input1" type="text" title="???????????????" style="width:130px" name="searchWrd" value="${paramVO.searchWrd}" />
						<input id="input2" type="submit" class="btn" value="??????" />

			</fieldset>
		</div>
		<!-- ????????? ??????????????? end -->


<!-- board list start -->
	<div>
		<table class="table table-bordered table-striped table-hover">
			<caption>????????? ??????</caption>
			<colgroup>
				<col width="10%" />
				<col width="10%" />
				<col width="15%" />
				<col width="*" />
				<col width="15%" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col" class="fir">??????</th>
					<th scope="col">?????????</th>
					<th scope="col">?????????</th>
					<th scope="col">????????????</th>
					<th scope="col">?????????</th>
					<th scope="col">??????</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="result" items="${resultList}" varStatus="status">
					<c:url var="url" value="javascript:selectMember('', '${result.userId}', '${result.userNm}');" />
				<tr>
					<td>${(resultCnt) - (paramVO.pageSize * (paramVO.pageIndex-1))}</td>
					<td><a href="${url}">${result.userId}</a></td>
					<td><a href="${url}">${result.deptName}</a></td>
					<td><a href="${url}">${result.userNm}</a></td>
					<td>${result.regDate}</td>
					<td>
						<c:choose>
							<c:when test="${result.status eq 'N'}">??????</c:when>
							<c:when test="${result.status eq 'H'}">??????</c:when>
						</c:choose>
					</td>
				</tr>
					<c:set var="resultCnt" value="${resultCnt-1}" />
				</c:forEach>
				<c:if test="${fn:length(resultList) == 0}" >
				<tr><td colspan="8">????????????????????????.</td></tr>
				</c:if>
			</tbody>
		</table>
	</div>
<!-- board list end //-->
</form>
	<c:if test="${fn:length(resultList) > 0}">
	<div class="paging">
		<div class="paging_con">
			${pageNav}
		</div>
	</div><!-- paging end //-->
	</c:if>


	<!--
	<div class="row">
		<div class="span6 tar">
			<a class="btn btn-primary" href="javascript:selectMember();"><span>??????</span></a>
		</div>
	</div>
	 -->

</div>

</form>
</body>
</html>

<br/>
<font color="red">*${pageContext.request.requestURI}</font>