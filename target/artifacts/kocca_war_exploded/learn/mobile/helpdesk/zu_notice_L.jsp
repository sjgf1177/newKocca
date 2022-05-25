<%@ page language = "java" contentType = "text/html; charset=euc-kr" pageEncoding = "euc-kr" %>
<%@ page errorPage = "/jsp/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<% 
	RequestBox box = (RequestBox)request.getAttribute("requestbox");

	//�������� ���
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
	//������ �̵�
	function goPage(v_pageno)
	{
		var obj = document.listForm;
		
		obj.method = "post";
		obj.p_pageno.value = v_pageno;
		obj.action = "/servlet/controller.mobile.helpdesk.HelpDeskServlet";
		obj.submit();
	}
	
	//�������� �̵�
	function goView(v_seq)
	{
		var obj = document.viewForm;

		obj.p_seq.value = v_seq;
		obj.action = "/servlet/controller.mobile.helpdesk.HelpDeskServlet";
		obj.submit();
	}
</script>
</head>
<body class="other_sub">
<div id="sub_header">	
	<%@ include file="/learn/mobile/include/header.jsp" %>
</div>
<div id="kocca_subContent">	

	<!--�¶���/�������� �Ǹ޴�-->
	<div class="h_area_corse_list">
		<h3 class="t">���</h3>
	</div>


	<!--�ʵ��-->
<!-- 
	<div class="field_area_06">
		<p class="field">
			<span>����</span><span class="bar_line">|</span>
			<span>�ۼ�����</span>
		</p>
	</div>
 -->
 	<div class="category_two">
	</div>
	<form name="viewForm" method="post" action="/imba/servlet/controller.mobile.helpdesk.HelpDeskServlet">
		<input type="hidden" name="p_process" value="noticeView" />
		<input type="hidden" name="p_menuid" value="<%=v_menuid%>" />
		<input type="hidden" name="p_pageno" value="<%=v_pageno%>" />
		<input type="hidden" name="p_seq" value="" />
	</form>
	<form name="listForm" method="post" action="/imba/servlet/controller.mobile.helpdesk.HelpDeskServlet">
		<input type="hidden" name="p_process" value="noticeList" />
		<input type="hidden" name="p_menuid" value="<%=v_menuid%>" />
		<input type="hidden" name="p_pageno" value="<%=v_pageno%>" />
		
	</form>
	<!--��������Ʈ-->
	<div class="list_area">
<% 
	if(list.size() == 0)
	{
%>
		<div class="list_area_c">
			<p><strong>��ϵ� ����Ÿ�� �����ϴ�.</strong></p>
		</div>	
<%		
	}
	else
	{
		for(int i = 0, j = list.size(); i < j; i++)
		{
			dbox = (DataBox) list.get(i);
%>		
		<!--1��-->
		<div class="list_area_l">
		<a class="ct" onclick="" href="javascript:goView('<%=dbox.getString("d_seq")%>');">		
			<p><strong><%=dbox.getString("d_gubunnm")%> <%=StringManager.cutText(dbox.getString("d_adtitle"), 40, true)%></strong></p>
			<span class="ic2">
				<img alt="New" src="http://cafeimgs.naver.net/mobile/img/cafe/im/bl.gif">
				<span class="hc">New</span>
			</span>
			<span class="list_btn if"><%=FormatDate.getFormatDate(dbox.getString("d_addate"), "yyyy.MM.dd")%></span></p>
		</a>
		</div>
<%
		v_totalpage = dbox.getInt("d_totalpage");
		v_rowcount = dbox.getInt("d_rowcount"); 

		}
	}
%>
		<!--������-->
		<div class="pg">
			<%= PageUtil.printPageMobileList(v_totalpage, v_pageno, v_rowcount, "") %>
		</div>
	</div>
	 <!--Footer-->
	<jsp:include page="/learn/mobile/include/footer.jsp" flush="true" />
	 <!--Footer-->
</div>
</html>
</body>
</html>