<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<%
    RequestBox box		= (RequestBox)request.getAttribute("requestbox");
	String p_link		= box.getStringDefault("p_link","H");
	
	String p_gubunnm	= "";
	
%>
<!DOCTYPE HTML>
<html>
<head>
<title>���̹���������ī���� ���� ��������</title>
<link href="/css/2012/research_style.css" type="text/css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script> 
<script type="text/javascript">
	function next(){
		var f = document.form1;
		//var t = $("input[name=gubun]:checked").val();
		var t = "A";
		$("input[name='p_gubun']").val(t);
		f.submit();
	}

</script>
</head>
<BODY>
<form name="form1" id="form1" method="post" action="/servlet/controller.homepage.MainServlet">
<input type="hidden" name="p_link" value="<%=p_link %>"/>
<input type="hidden" name="p_process" value="research"/>
<input type="hidden" name="p_gubun" />

<div id="wrap">
	<!-- header -->
	<div id="header">
		<h1><img src="/images/2012/main/research/logo.gif" /></h1>
	</div>
	<!-- //header -->

	<!-- content -->
	<div id="con">
		<div class="box_header">
		<img class="header_tit" src="/images/2012/main/research/startpagetitle.gif"/>
			<div class="box">
			<span style="text-align: center;padding: 15px;margin-bottom: 20px;"><img src="/images/2012/main/research/startpagenotice.gif"/></span>
			<span>&nbsp;</span><span>&nbsp;</span>
<!--				<div class="question" id="question_1">-->
<!--					<p class="question_tit">-->
<!--						<span>�ѱ�������������� ���̹���������ī����(http://edu.kocca.or.kr)�� ���� ���, ����, ��ȭ ���� ������ �پ��� ���԰���, �������� �������� ����� �����ϰ� �ֽ��ϴ�.<br/><br/> �����ڴԲ����� ���̹���������ī���̸� �̿��Ͽ� �н��Ͻ� ���� �ֽ��ϱ�?</span> -->
<!--					</p>-->
<!--					<ul>-->
<!--						<li class="wf"><input name="gubun" type="radio" value="S" checked /> ��</li>-->
<!--						<li class="wf"><input name="gubun" type="radio" value="H" /> �ƴϿ�</li>-->
<!--					</ul>-->
<!--				</div>-->
			</div>
		</div>
	</div>
	<div id="footer">
	<a href="javascript:next();"><img src="/images/2012/main/research/startbutton.gif"/></a>
</div>
</div>
<!-- //content -->

</form>
</BODY>
</HTML>
