<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>민원통계</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge, chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<meta name="robots" content="all" />


<link rel="stylesheet" type="text/css" href="/js/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="/bos/css/common.css" />


<link rel="stylesheet" type="text/css" href="/js/jquery-ui/jquery-ui.css">

<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/bootstrap/bootstrap.js"></script>
<script type="text/javascript" src="/js/jquery-ui/jquery-ui.js"></script>
<script type="text/javascript" src="/js/miya_validator.js"></script>

<script type="text/javascript">
$(function() {
    var loading = $('<img alt="loading" src="/bos/images/viewLoading.gif" />')
    .appendTo(document.body).hide();
    $(window).ajaxStart(loading.show);
    $(window).ajaxStop(loading.hide);

	$.datepicker.setDefaults($.datepicker.regional['ko']);
	$("#sdate").datepicker({showOn: 'button', buttonImage: '/bos/images/calendar.gif', buttonImageOnly: true, changeMonth: true, changeYear: true, showMonthAfterYear:false});
	$("#edate").datepicker({showOn: 'button', buttonImage: '/bos/images/calendar.gif', buttonImageOnly: true, changeMonth: true, changeYear: true, showMonthAfterYear:false});
});

function search() {
	var form = $("#frm")[0];
	var v = new MiyaValidator(form);
    v.add("sdate", {
        required: true
    });
    v.add("edate", {
        required: true
    });

	var result = v.validate();
	if (!result) {
		alert(v.getErrorMessage());
		v.getErrorElement().focus();
		return;
	}

	form.action = "/bos/ps/ps.do";
	form.submit();
}

function excel() {
	var form = $("#frm")[0];
	var v = new MiyaValidator(form);
    v.add("sdate", {
        required: true
    });
    v.add("edate", {
        required: true
    });

	var result = v.validate();
	if (!result) {
		alert(v.getErrorMessage());
		v.getErrorElement().focus();
		return;
	}

	form.action = "/bos/ps/excel.do";
	form.submit();
}

function init(){

	var form = $("#frm")[0];
	var v = new MiyaValidator(form);
    v.add("sdate", {
        required: true
    });
    v.add("edate", {
        required: true
    });
	var result = v.validate();
	if (!result) {
		alert(v.getErrorMessage());
		v.getErrorElement().focus();
		return;
	}

	if( !confirm("임시테이블에 있는 데이터 삭제후 재등록됩니다. 초기화 하겠습니까?") ){
		return;
	}
	var val = $("#frm").serialize();
	val += "&viewType=JSON";

	$.ajax({
		type: "POST",
		url: "/bos/ps/init.do",
		data: val,
		success: function(data)
		{
			var resultMsg = data.msg;
			alert(resultMsg);
		},
		error: function() {
			alert("호출에 실패했습니다.");
		}
	});
}


</script>

</head>
<body>
	<div id="content">
		<div class="hgroup">
			<h3>민원통계</h3>
		</div>

<form id="frm" name="frm" action ="/bos/ps/ps.do" method="post">
	<input type="hidden" id="bbsId" name="bbsId" value="${param.bbsId}" />
<div id="content">

<ul class="tab_list">
	<!--현재 페이지일 경우 class="on" -->
	<li <c:if test="${param.bbsId == 'B0000003'}">class="on"</c:if>><a href="/bos/ps/ps.do?bbsId=B0000003&sdate=${param.sdate}&edate=${param.edate}"><span>자유게시판</span></a></li>
	<li <c:if test="${param.bbsId == 'B0000079'}">class="on"</c:if>><a href="/bos/ps/ps.do?bbsId=B0000079&sdate=${param.sdate}&edate=${param.edate}"><span>국관과의대화</span></a></li>
	<li <c:if test="${empty param.bbsId}">class="on"</c:if>><a href="/bos/ps/ps.do?sdate=${param.sdate}&edate=${param.edate}"><span>자유게시판 +국관과의대화</span></a></li>
</ul>

		<table class="t_result_search">
 			<colgroup>
				<col width="13%" />
				<col width="*" />
				<col width="20%" />
				<col width="13%" />
				<col width="13%" />
				<col width="14%" />
			</colgroup>
			<tr>
				<th class="th_freak01">검색조건</th>
				<td colspan="5" class="th_freak02">
					<input type="text" id="sdate" name="sdate" value="${param.sdate}" size="10" /> ~
				    <input type="text" id="edate" name="edate" value="${param.edate}" size="10" />
					<a href="javascript:search();" class="btn btn-seach">검색</a>
				</td>
			</tr>
		</table>

		<!-- 게시판 게시물검색 end -->
<c:if test="${not empty param.bbsId}">
	<div class="btn_set">
		<a class="btn btn-primary" href="javascript:init();"><span>임시테이블 데이터초기화</span></a>
	</div>
</c:if>

<div>
	<table class="table table-bordered table-striped table-hover">
		<caption>게시판 목록</caption>
		<colgroup>
			<col width="26" />
			<col width="144" />
			<col width="68" />
			<col width="68" />
			<col width="68" />
			<col width="68" />
			<col width="68" />
			<col width="68" />
			<col width="68" />
			<col width="68" />
			<col width="68" />
			<col width="68" />
			<col width="68" />
			<col width="68" />
			<col width="68" />
			<col width="68" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col" colspan="2">구분</th>
				<th scope="col">계</th>
				<th scope="col">기획<br />조정</th>
				<th scope="col">경무<br />인사기획</th>
				<th scope="col">생활<br />안전</th>
				<th scope="col">수사</th>
				<th scope="col">경비</th>
				<th scope="col">정보</th>
				<th scope="col">보안</th>
				<th scope="col">외사</th>
				<th scope="col">대변인</th>
				<th scope="col">감사</th>
				<th scope="col">정보화<br />장비정책</th>
				<th scope="col">교통</th>
				<th scope="col">교육</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td rowspan="2" class="bold">질의</td>
				<td class="bold">민원</td>
				<td>${petitionMap['total']}</td>
				<td>${petitionMap['assistantMinister']}</td>
				<td>${petitionMap['policeAffairs']}</td>
				<td>${petitionMap['lifeSafety']}</td>
				<td>${petitionMap['investigation']}</td>
				<td>${petitionMap['guard']}</td>
				<td>${petitionMap['infomation']}</td>
				<td>${petitionMap['security']}</td>
				<td>${petitionMap['externalAffairs']}</td>
				<td>${petitionMap['spokesperson']}</td>
				<td>${petitionMap['inspection']}</td>
				<td>${petitionMap['infoCommunication']}</td>
				<td>${petitionMap['traffic']}</td>
				<td>${petitionMap['education']}</td>
			</tr>
			<tr class="bg_color">
				<td class="bold">답변(%)</td>
				<td class="bg_color">${answerMap['total'].cnt}(<fmt:formatNumber pattern="#.##" value="${answerMap['total'].ratio}" />)</td>
				<td>${answerMap['assistantMinister'].cnt}(<fmt:formatNumber pattern="#.##" value="${answerMap['assistantMinister'].ratio}" />)</td>
				<td>${answerMap['policeAffairs'].cnt}(<fmt:formatNumber pattern="#.##" value="${answerMap['policeAffairs'].ratio}" />)</td>
				<td>${answerMap['lifeSafety'].cnt}(<fmt:formatNumber pattern="#.##" value="${answerMap['lifeSafety'].ratio}" />)</td>
				<td>${answerMap['investigation'].cnt}(<fmt:formatNumber pattern="#.##" value="${answerMap['investigation'].ratio}" />)</td>
				<td>${answerMap['guard'].cnt}(<fmt:formatNumber pattern="#.##" value="${answerMap['guard'].ratio}" />)</td>
				<td>${answerMap['infomation'].cnt}(<fmt:formatNumber pattern="#.##" value="${answerMap['infomation'].ratio}" />)</td>
				<td>${answerMap['security'].cnt}(<fmt:formatNumber pattern="#.##" value="${answerMap['security'].ratio}" />)</td>
				<td>${answerMap['externalAffairs'].cnt}(<fmt:formatNumber pattern="#.##" value="${answerMap['externalAffairs'].ratio}" />)</td>
				<td>${answerMap['spokesperson'].cnt}(<fmt:formatNumber pattern="#.##" value="${answerMap['spokesperson'].ratio}" />)</td>
				<td>${answerMap['inspection'].cnt}(<fmt:formatNumber pattern="#.##" value="${answerMap['inspection'].ratio}" />)</td>
				<td>${answerMap['infoCommunication'].cnt}(<fmt:formatNumber pattern="#.##" value="${answerMap['infoCommunication'].ratio}" />)</td>
				<td>${answerMap['traffic'].cnt}(<fmt:formatNumber pattern="#.##" value="${answerMap['traffic'].ratio}" />)</td>
				<td>${answerMap['education'].cnt}(<fmt:formatNumber pattern="#.##" value="${answerMap['education'].ratio}" />)</td>
			</tr>
			<tr>
				<td rowspan="7" class="bold bottom_line">만족도</td>
				<td class="bold">소계</td>
				<td>${pointMap['TOTAL'].total}</td>
				<td>${pointMap['TOTAL'].assistantMinister}</td>
				<td>${pointMap['TOTAL'].policeAffairs}</td>
				<td>${pointMap['TOTAL'].lifeSafety}</td>
				<td>${pointMap['TOTAL'].investigation}</td>
				<td>${pointMap['TOTAL'].guard}</td>
				<td>${pointMap['TOTAL'].infomation}</td>
				<td>${pointMap['TOTAL'].security}</td>
				<td>${pointMap['TOTAL'].externalAffairs}</td>
				<td>${pointMap['TOTAL'].spokesperson}</td>
				<td>${pointMap['TOTAL'].inspection}</td>
				<td>${pointMap['TOTAL'].infoCommunication}</td>
				<td>${pointMap['TOTAL'].traffic}</td>
				<td>${pointMap['TOTAL'].education}</td>
			</tr>
			<tr>
				<td><span class="ad_color1">★★★★★</span> (100점)</td>
				<td>${pointMap['POINT_5'].total}</td>
				<td>${pointMap['POINT_5'].assistantMinister}</td>
				<td>${pointMap['POINT_5'].policeAffairs}</td>
				<td>${pointMap['POINT_5'].lifeSafety}</td>
				<td>${pointMap['POINT_5'].investigation}</td>
				<td>${pointMap['POINT_5'].guard}</td>
				<td>${pointMap['POINT_5'].infomation}</td>
				<td>${pointMap['POINT_5'].security}</td>
				<td>${pointMap['POINT_5'].externalAffairs}</td>
				<td>${pointMap['POINT_5'].spokesperson}</td>
				<td>${pointMap['POINT_5'].inspection}</td>
				<td>${pointMap['POINT_5'].infoCommunication}</td>
				<td>${pointMap['POINT_5'].traffic}</td>
				<td>${pointMap['POINT_5'].education}</td>
			</tr>
			<tr>
				<td><span class="ad_color1">★★★★</span><span class="ad_color2">★</span> (90점)</td>
				<td>${pointMap['POINT_4'].total}</td>
				<td>${pointMap['POINT_4'].assistantMinister}</td>
				<td>${pointMap['POINT_4'].policeAffairs}</td>
				<td>${pointMap['POINT_4'].lifeSafety}</td>
				<td>${pointMap['POINT_4'].investigation}</td>
				<td>${pointMap['POINT_4'].guard}</td>
				<td>${pointMap['POINT_4'].infomation}</td>
				<td>${pointMap['POINT_4'].security}</td>
				<td>${pointMap['POINT_4'].externalAffairs}</td>
				<td>${pointMap['POINT_4'].spokesperson}</td>
				<td>${pointMap['POINT_4'].inspection}</td>
				<td>${pointMap['POINT_4'].infoCommunication}</td>
				<td>${pointMap['POINT_4'].traffic}</td>
				<td>${pointMap['POINT_4'].education}</td>
			</tr>
			<tr>
				<td><span class="ad_color1">★★★</span><span class="ad_color2">★★</span> (80점)</td>
				<td>${pointMap['POINT_3'].total}</td>
				<td>${pointMap['POINT_3'].assistantMinister}</td>
				<td>${pointMap['POINT_3'].policeAffairs}</td>
				<td>${pointMap['POINT_3'].lifeSafety}</td>
				<td>${pointMap['POINT_3'].investigation}</td>
				<td>${pointMap['POINT_3'].guard}</td>
				<td>${pointMap['POINT_3'].infomation}</td>
				<td>${pointMap['POINT_3'].security}</td>
				<td>${pointMap['POINT_3'].externalAffairs}</td>
				<td>${pointMap['POINT_3'].spokesperson}</td>
				<td>${pointMap['POINT_3'].inspection}</td>
				<td>${pointMap['POINT_3'].infoCommunication}</td>
				<td>${pointMap['POINT_3'].traffic}</td>
				<td>${pointMap['POINT_3'].education}</td>
			</tr>
			<tr>
				<td><span class="ad_color1">★★</span><span class="ad_color2">★★★</span> (70점)</td>
				<td>${pointMap['POINT_2'].total}</td>
				<td>${pointMap['POINT_2'].assistantMinister}</td>
				<td>${pointMap['POINT_2'].policeAffairs}</td>
				<td>${pointMap['POINT_2'].lifeSafety}</td>
				<td>${pointMap['POINT_2'].investigation}</td>
				<td>${pointMap['POINT_2'].guard}</td>
				<td>${pointMap['POINT_2'].infomation}</td>
				<td>${pointMap['POINT_2'].security}</td>
				<td>${pointMap['POINT_2'].externalAffairs}</td>
				<td>${pointMap['POINT_2'].spokesperson}</td>
				<td>${pointMap['POINT_2'].inspection}</td>
				<td>${pointMap['POINT_2'].infoCommunication}</td>
				<td>${pointMap['POINT_2'].traffic}</td>
				<td>${pointMap['POINT_2'].education}</td>
			</tr>
			<tr>
				<td><span class="ad_color1">★</span><span class="ad_color2">★★★★</span> (60점)</td>
				<td>${pointMap['POINT_1'].total}</td>
				<td>${pointMap['POINT_1'].assistantMinister}</td>
				<td>${pointMap['POINT_1'].policeAffairs}</td>
				<td>${pointMap['POINT_1'].lifeSafety}</td>
				<td>${pointMap['POINT_1'].investigation}</td>
				<td>${pointMap['POINT_1'].guard}</td>
				<td>${pointMap['POINT_1'].infomation}</td>
				<td>${pointMap['POINT_1'].security}</td>
				<td>${pointMap['POINT_1'].externalAffairs}</td>
				<td>${pointMap['POINT_1'].spokesperson}</td>
				<td>${pointMap['POINT_1'].inspection}</td>
				<td>${pointMap['POINT_1'].infoCommunication}</td>
				<td>${pointMap['POINT_1'].traffic}</td>
				<td>${pointMap['POINT_1'].education}</td>
			</tr>
			<tr class="bg_color">
				<td class="bold bottom_line">평균값</td>
				<td><fmt:formatNumber value="${pointMap['AVR'].total}" pattern="#.##" /></td>
				<td><fmt:formatNumber value="${pointMap['AVR'].assistantMinister}" pattern="#.##" /></td>
				<td><fmt:formatNumber value="${pointMap['AVR'].policeAffairs}" pattern="#.##" /></td>
				<td><fmt:formatNumber value="${pointMap['AVR'].lifeSafety}" pattern="#.##" /></td>
				<td><fmt:formatNumber value="${pointMap['AVR'].investigation}" pattern="#.##" /></td>
				<td><fmt:formatNumber value="${pointMap['AVR'].guard}" pattern="#.##" /></td>
				<td><fmt:formatNumber value="${pointMap['AVR'].infomation}" pattern="#.##" /></td>
				<td><fmt:formatNumber value="${pointMap['AVR'].security}" pattern="#.##" /></td>
				<td><fmt:formatNumber value="${pointMap['AVR'].externalAffairs}" pattern="#.##" /></td>
				<td><fmt:formatNumber value="${pointMap['AVR'].spokesperson}" pattern="#.##" /></td>
				<td><fmt:formatNumber value="${pointMap['AVR'].inspection}" pattern="#.##" /></td>
				<td><fmt:formatNumber value="${pointMap['AVR'].infoCommunication}" pattern="#.##" /></td>
				<td><fmt:formatNumber value="${pointMap['AVR'].traffic}" pattern="#.##" /></td>
				<td><fmt:formatNumber value="${pointMap['AVR'].education}" pattern="#.##" /></td>
			</tr>
			<tr class="bg_color">
				<td colspan="2" class="bold bottom_line">신속성평균값</td>
				<td class="bottom_line"><fmt:formatNumber value="${sinsokVal.total}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${sinsokVal.assistantMinister}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${sinsokVal.policeAffairs}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${sinsokVal.lifeSafety}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${sinsokVal.investigation}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${sinsokVal.guard}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${sinsokVal.infomation}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${sinsokVal.security}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${sinsokVal.externalAffairs}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${sinsokVal.spokesperson}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${sinsokVal.inspection}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${sinsokVal.infoCommunication}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${sinsokVal.traffic}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${sinsokVal.education}" pattern="#.##" /></td>
			</tr>
			<tr class="bg_color">
				<td colspan="2" class="bold bottom_line">해당부서답변비율</td>
				<td class="bottom_line"><fmt:formatNumber value="${answerRatioVal.total}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${answerRatioVal.assistantMinister}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${answerRatioVal.policeAffairs}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${answerRatioVal.lifeSafety}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${answerRatioVal.investigation}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${answerRatioVal.guard}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${answerRatioVal.infomation}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${answerRatioVal.security}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${answerRatioVal.externalAffairs}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${answerRatioVal.spokesperson}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${answerRatioVal.inspection}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${answerRatioVal.infoCommunication}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${answerRatioVal.traffic}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${answerRatioVal.education}" pattern="#.##" /></td>
			</tr>
			<tr>
				<td colspan="2" class="bold bottom_line">총점</td>
				<td class="bottom_line"><fmt:formatNumber value="${totalPointVal.total}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${totalPointVal.assistantMinister}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${totalPointVal.policeAffairs}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${totalPointVal.lifeSafety}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${totalPointVal.investigation}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${totalPointVal.guard}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${totalPointVal.infomation}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${totalPointVal.security}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${totalPointVal.externalAffairs}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${totalPointVal.spokesperson}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${totalPointVal.inspection}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${totalPointVal.infoCommunication}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${totalPointVal.traffic}" pattern="#.##" /></td>
				<td class="bottom_line"><fmt:formatNumber value="${totalPointVal.education}" pattern="#.##" /></td>
			</tr>
			<tr>
				<td colspan="2" class="bold">순위</td>
				<td>-</td>
				<td>${orderVal.assistantMinister}</td>
				<td>${orderVal.policeAffairs}</td>
				<td>${orderVal.lifeSafety}</td>
				<td>${orderVal.investigation}</td>
				<td>${orderVal.guard}</td>
				<td>${orderVal.infomation}</td>
				<td>${orderVal.security}</td>
				<td>${orderVal.externalAffairs}</td>
				<td>${orderVal.spokesperson}</td>
				<td>${orderVal.inspection}</td>
				<td>${orderVal.infoCommunication}</td>
				<td>${orderVal.traffic}</td>
				<td>${orderVal.education}</td>
			</tr>
		</tbody>
	</table>
</div>

	<div class="btn_set">
		<a class="btn btn-success" href="javascript:excel();"><span>엑셀</span></a>
	</div>
</div>

</form>

<c:catch var="catchException">
	<jsp:include page="/WEB-INF/jsp/bos/share/printPath.jsp" flush="true" />
</c:catch>
</body>
</html>
