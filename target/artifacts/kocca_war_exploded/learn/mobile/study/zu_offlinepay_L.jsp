<%@ page language = "java" contentType = "text/html; charset=euc-kr" pageEncoding = "euc-kr" %>
<%@ page errorPage = "/jsp/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<% 
	RequestBox box = (RequestBox)request.getAttribute("requestbox");

	//��������� ��ȸ ���
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
		var obj = document.viewForm;
		
		obj.method = "post";
		obj.p_pageno.value = v_pageno;
		obj.p_process.value = "offlinePayList";
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

	<!--�¶���/�������� �Ǹ޴�-->
	<form name="viewForm" method="post" action="/servlet/controller.mobile.course.CourseServlet">
		<input type="hidden" name="p_process" value="offlinePayList" />
		<input type="hidden" name="p_menuid" value="<%=v_menuid%>" />
		<input type="hidden" name="p_pageno" value="<%=v_pageno%>" />
		<input type="hidden" name="p_subj" value="" />
		<input type="hidden" name="p_year" value="" />
		<input type="hidden" name="p_subjseq" value="" />	
	</form>
	<nav class="onoff_tab_area">
		<div class="onoff_tab">
			<ul>
				<li class="tabmenu_l" style="width:49%;">
					<a title="�¶��ΰ���" href="/servlet/controller.mobile.study.MyClassServlet?p_process=onlinePayList&p_menuid=<%=v_menuid%>"><span>�¶��ΰ���</span></a>
				</li>
				<li class="tabmenu_on" style="width:50.8%;">
					<a title="�������ΰ���" href=""><span>�������ΰ���</span></a>
				</li>
			</ul>
		</div>
	</nav>
<!-- 
	<div class="field_area_04">
		<ul id="field_m" class="field_m">
			<li class="field_li field">
			������<span class="bar_line">|</span>
			</li>
			<li class="field_li field">
			������û��<span class="bar_line">|</span>
			</li>
			<li class="field_li field">
			������<span class="bar_line">|</span>
			</li>
			<li class="field_li field">
			�ǰ�����<span class="bar_line">|</span>
			</li>
			<li class="field_li field">
			��������<span class="bar_line">|</span>
			</li>
			<li class="field_li field">
			�������<span class="bar_line">|</span>
			</li>
			<li class="field_li field">
			��������<span class="bar_line">|</span>
			</li>
			<li class="field_li field">
			��ҿϷ���
			</li>
		</ul>
	</div>
 -->
 	<div class="category_two">
	</div>
	<!--��������Ʈ-->
	<div class="list_area">
<% 
	int v_biyong = 0;
	int v_price = 0;
	String v_cancelyn = "";
	String v_paymethod = "";
	String v_canceldate = "";
	if(list.size() == 0)
	{
%>
		<div class="list_area_c">
			���系���� �����ϴ�.
		</div>
<%		
	}
	else
	{
		for(int i = 0, j = list.size(); i < j; i++)
		{
			dbox = (DataBox) list.get(i);
			
			v_biyong = dbox.getInt("d_biyong");
			v_price = dbox.getInt("d_price");
			v_cancelyn = dbox.getString("d_cancelyn");
			v_canceldate = dbox.getString("d_canceldate");
			
			v_paymethod	= dbox.getString("d_paymethod");
			if ("BankBook".equals(v_paymethod)) {
				v_paymethod = "������";
			} else if ("Card".equals(v_paymethod)) {
				v_paymethod = "�ſ�ī��(ISP)";
			} else if ("DirectBank".equals(v_paymethod)) {
				v_paymethod = "�ǽð�������ü";
			} else if ("TaxBill".equals(v_paymethod)) {
				v_paymethod = "��꼭";
			} else if ("VBank".equals(v_paymethod)) {
				v_paymethod = "������(�������)";
			} else if ("VCard".equals(v_paymethod)) {
				v_paymethod = "�ſ�ī��(�Ƚ�Ŭ��)";
			} else if ("FreePay".equals(v_paymethod)) {
				v_paymethod = "�������";
			}
			
			v_canceldate = dbox.getString("d_canceldate");
%>		
		<!--1��-->
		<div class="list_area_l">
		<div><%=dbox.getString("d_goodname")%></div>
			<ul class="field_m">
				<li class="field_li"><span class="list_date01"><%=FormatDate.getFormatDate(dbox.getString("d_inputdate"), "yyyy.MM.dd")%> <%=NumberManager.getIntFormat(v_biyong)%>��</span><span class="color_blue">(<%=NumberManager.getIntFormat(v_price)%>��)</span></li>
				<li class="field_li"><span id="payment_Submit"><%= "Y".equals(v_cancelyn) ? "ȯ�ҿϷ�" : "�����Ϸ�" %></span><span id="card_Submit"><%=v_paymethod%></span></li>
				<li class="field_li"><span class="color_red"><%=FormatDate.getFormatDate(dbox.getString("d_inputdate"), "yyyy.MM.dd")%></span> <span class="color_green"><%=FormatDate.getFormatDate(v_canceldate, "yyyy.MM.dd")%></span></li>
			</ul>
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
</body>
</html>