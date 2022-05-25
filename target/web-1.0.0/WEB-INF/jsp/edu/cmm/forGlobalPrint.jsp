<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><spring:message code="cop.print" text="인쇄"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="robots" content="all" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>중앙선거관리위원회</title>
<link rel="stylesheet" type="text/css" href="/global/${param.lang}/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="/global/${param.lang}/css/layout.css"/>
<link rel="stylesheet" type="text/css" href="/global/${param.lang}/css/sub.css"/>

<script type="text/javascript" src="/bos/common/js/jquery-1.8.2.js"></script>
<style type="text/css">
	body{background-image: url(none);}
	#wrap{width: auto ;margin: 0 0 0 0;background-image:none;}
	#wraper{background-image: url(none);width: auto;}
	#container,
	#content{float:none;margin: 0;padding: 0;background-image:none;}
	.print_btn_set{text-align: center;}
	.spot_visual{position: relative;top:0;}
	#content {width:694px !important;}
	.btn_print {display:none;}
</style>
<script type="text/javascript">
//<![CDATA[
window.document.onkeydown=function() {
	return false;
}

window.document.onclick=function() {
	return false;
}

window.document.ondblclick=function() {
	return false;
}


window.document.oncontextmenu=function() {
	return false;
}


window.document.ondragstart=function() {
	return false;
}


window.document.onselectstart=function() {
	return false;
}
//]]>
</script>
</head>
<body>
<!--
<div id="btn_print" style="display:none;width:680px;height:30px;text-align:center;padding-top:10px;"><a href="#btn_print" onclick="window.print();return false;" onkeypress="this.onclick();"><img src="/kab/home/img/common/btn/btn_print.gif" alt="인쇄하기" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#btn_print" onclick="window.close();return false;" onkeypress="this.onclick();"><img src="/kab/home/img/common/btn/close.gif" alt="창닫기" /></a></div>
-->
<div class="btn_set tac">

	<!--a href="#btn_print" onclick="window.print();return false;" onkeypress="this.onclick();"><img src="../images/common/btn_print.gif" alt="인쇄하기" /></a> <a href="#btn_print" onclick="window.close();return false;" onkeypress="this.onclick();"><img src="../images/btn/btn_close.gif" alt="창닫기" class="mr10" /></a-->
	<a href="#btn_print" class="btn btn-info" onclick="window.print();return false;" onkeypress="this.onclick();"><spring:message code="cop.print" text="인쇄"/></a> <a href="#btn_print" class="btn btn-primary" onclick="window.close();return false;" onkeypress="this.onclick();"><spring:message code="button.close" text="닫기"/></a>
</div>
<script type="text/javascript">
	//var openerHtml = opener.printBody.innerHTML ;
	var contentObj = opener.document.getElementById("contents");


	if(contentObj)
	{
		var openerHtml = contentObj.innerHTML;
	//	var re1 = /<\s*a/gi
	//	var re2 = /<\/\s*a/gi
	//	openerHtml = openerHtml.replace(re1, "<span");
	//	openerHtml = openerHtml.replace(re2, "<\/span");

			var str = "<div id='content'>\n"
					+ openerHtml
					+ "<\/div>";
			document.write(str);
	}

</script>
<noscript>
	<p style="margin-bottom:5px;">자바스크립트가 작동 되지 않는 환경입니다. 현재 창을 닫으시고, 브라우저 메뉴의 인쇄기능을 이용하십시오.</p>
</noscript>
<script type="text/javascript">
	document.getElementById("btn_print").style.display = "";
</script>
<noscript>
	<p style="margin-bottom:5px;">자바스크립트가 작동 되지 않는 환경입니다. 현재 창을 닫으시고, 브라우저 메뉴의 인쇄기능을 이용하십시오.</p>
</noscript>
</body>
</html>