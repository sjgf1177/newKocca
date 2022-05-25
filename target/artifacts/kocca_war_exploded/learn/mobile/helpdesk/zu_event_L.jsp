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

	function viewPassContent(v_seq)
	{
		var obj = document.viewForm;

		obj.p_process.value = "eventPassView";
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

	<form name="viewForm" method="post" action="/servlet/controller.mobile.helpdesk.HelpDeskServlet">
		<input type="hidden" name="p_process" value="eventView" />
		<input type="hidden" name="p_menuid" value="<%=v_menuid%>" />
		<input type="hidden" name="p_pageno" value="<%=v_pageno%>" />
		<input type="hidden" name="p_seq" value="" />
	</form>
	<form name="listForm" method="post" action="/servlet/controller.mobile.helpdesk.HelpDeskServlet">
		<input type="hidden" name="p_process" value="eventList" />
		<input type="hidden" name="p_menuid" value="<%=v_menuid%>" />
		<input type="hidden" name="p_pageno" value="<%=v_pageno%>" />
	</form>
	<!--�ʵ��-->
<!-- 	
	<div class="field_area_06">
		<p> <span class="field">����<span class="bar_line">|</span></span>
		<span class="field"> �̺�Ʈ�Ⱓ<span class="bar_line">|</span></span>
		<span class="field"> ����Ⱓ<span class="bar_line">|</span></span>
		<span class="field"> ��÷�ڹ�ǥ</span>
		</p>
	</div>
 -->
 	<div class="category_two">
	</div>
	<!--��������Ʈ-->
	<div class="list_area">
<%
	String v_event_date = "";
	String v_winneryn = "";
	String v_status= "";
	
	if(list.size() == 0)
	{
%>
		<div class="list_area_l">
			<p><strong>��ϵ� ����Ÿ�� �����ϴ�.</strong></p>
		</div>
<%		
	}
	else
	{
		for(int i = 0, j = list.size(); i < j; i++)
		{
			dbox = (DataBox) list.get(i);
			
			v_event_date =  FormatDate.getFormatDate(dbox.getString("d_strdate"), "yyyy.MM.dd") + "~" + FormatDate.getFormatDate(dbox.getString("d_enddate"), "yyyy.MM.dd");
			
			v_winneryn  = dbox.getString("d_winneryn");
			if(v_winneryn.equals("C")){
		    	v_winneryn = "<button id=\"event_Submit\" type=\"submit\">�̹�ǥ</button>";
		    	v_status = "�Ϸ�";
		    } else if(v_winneryn.equals("Y")){
		        v_winneryn = "<button id=\"event_Submit\" type=\"submit\" onclick=\"viewPassContent('"+ dbox.getString("d_seq") + "');\">��÷��Ȯ��</button>";
		        v_status = "�Ϸ�";
		    } else if(v_winneryn.equals("N")){
		    	v_winneryn = "<button id=\"event_Submit\" type=\"submit\">�̹�ǥ</button>";
		    	v_status = "����";
		    } else if(v_winneryn.equals("A")){
		    	v_winneryn = "<button id=\"event_Submit\" type=\"submit\">�̹�ǥ</button>";
                v_status = "����";
            } 
		    else if(v_winneryn.equals("B")){
		    	v_winneryn = "<button id=\"event_Submit\" type=\"submit\">�̹�ǥ</button>";
                v_status = "����";
            } 
%>		
		<div class="list_area_l">
		<div><a href="javascript:goView('<%=dbox.getString("d_seq")%>');" class="list_a"><strong><%=StringManager.cutText(dbox.getString("d_title"), 30, true)%></strong></a><span class="if"><%=v_event_date%> | <%=v_status%></span></div>
			<p><span class="list_btn"><%=v_winneryn%></span></p>
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