<%@ page language = "java" contentType = "text/html; charset=euc-kr" pageEncoding = "euc-kr" %>
<%@ page errorPage = "/jsp/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<% 
	RequestBox box = (RequestBox)request.getAttribute("requestbox");

	//���ǻ�㳻�����
	ArrayList list = (ArrayList) request.getAttribute("_LIST_");
	if(list == null) list = new ArrayList();
	
	DataBox dbox = null;
	
	/** ����¡ */
	int v_totalpage = 0;
	int v_rowcount = 1;
	
	int v_pageno = box.getInt("p_pageno");
%>
<%@ include file="/learn/mobile/include/common.jsp" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<meta name="format-detection" content="telephone=no"/>
<title><%=v_title.toString()%></title>
<link rel="stylesheet" type="text/css" href="/css/m_common.css" />
<script type="text/javascript" language="javascript" src="/js/common.js"></script>
<script type="text/javascript" language="javascript">
	function goWrite()
	{
		var obj = document.writeForm;

		if(f_nul_chk(obj.p_title, "[����]��")) return false;
		else if(f_byte_chk(obj.p_title, 100, "[����]��")) return false;
		else if(f_nul_chk(obj.p_content, "[����]��")) return false;

		if(!confirm("�����Ͻðڽ��ϱ�?"))
			return false;

		obj.p_process.value = "counselWrite";
		obj.action = "/servlet/controller.mobile.study.MyClassServlet";
		
	}
	//��������� �̵�
	function goListPage()
	{
		var obj = document.listForm;
		
		obj.p_process.value = "counselList";
		obj.action = "/servlet/controller.mobile.study.MyClassServlet";
		obj.submit();
	}
</script>
</head>
<body class="other_sub">
<div id="sub_header">	
	<%@ include file="/learn/mobile/include/header.jsp" %>
</div>
<div id="kocca_subContent">	
	<form name="listForm" method="post" action="/servlet/controller.mobile.study.MyClassServlet">
		<input type="hidden" name="p_process" value="counselList"/>
		<input type="hidden" name="p_menuid" value="<%=v_menuid%>"/>
		<input type="hidden" name="p_pageno" value="<%=v_pageno%>"/>
	</form>
	<div class="h_area_corse">
		<h3 class="t">�۾���</h3>
	</div>

	<div class="wr">
	<form id="writeForm" name="writeForm" action="/servlet/controller.mobile.study.MyClassServlet" onsubmit="return goWrite()">
		<input type="hidden" name="p_process" value="counselWrite" />
		<input type="hidden" name="p_menuid" value="<%=v_menuid%>" />
		<input type="hidden" name="p_pageno" value="<%=v_pageno%>" />
		<dl class="wr1">
			<dt>
			<label>����</label>
			</dt>
			<dd>
			<input id="w2" class="it it_v1" type="text" value="" name="p_title" maxlength="100">
			</dd>
		</dl>

		
		<dl class="wr2">
			<dt class="hc">
			<label>����</label>
			</dt>
			<dd>
			<textarea id="" class="ta" cols="30" rows="7" name="p_content"></textarea>
			</dd>
		</dl>

		<div id="" class="" style="text-align:center; padding-top:10px;">
			<input type="image" src="/images/mobile/btn_register.gif" />
			<a href="#none" onclick="return goListPage();"><img src="/images/mobile/btn_cancle.gif" /></a>
		</div>
	</form>
	</div>

	<!--Footer-->
	<jsp:include page="/learn/mobile/include/footer.jsp" flush="true" />
	<!--Footer-->

</div>
</body>
</html>