<%@ page language = "java" contentType = "text/html; charset=euc-kr" pageEncoding = "euc-kr" %>
<%@ page errorPage = "/jsp/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<% 
	RequestBox box = (RequestBox)request.getAttribute("requestbox");

	//������
	DataBox dbox = (DataBox) request.getAttribute("_VIEW_");
	if(dbox == null) dbox = new DataBox("");
	
	//���� ���ø��
	ArrayList list = (ArrayList) request.getAttribute("_LESSONLIST_");
	if(list == null) list = new ArrayList();
	
	//���� ���
	ArrayList tutorlist = (ArrayList) request.getAttribute("_TUTORLIST_");
	if(tutorlist == null) tutorlist = new ArrayList();
	
	DataBox listbox = null;
	
	/** ����¡ */
	int v_pageno = box.getInt("p_pageno");
	String v_upperclass = box.getString("p_upperclass");
	String v_middleclass = box.getString("p_middleclass");
	
	String v_cousegubun = box.getString("p_cousegubun");
	
	String v_subj = box.getString("p_subj");
	String v_year = box.getString("p_year");
	String v_subjseq = box.getString("p_subjseq");
	
	String  v_user_id   = box.getSession("userid");
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
	//��������� �̵�
	function goListPage()
	{
		var obj = document.listForm;

		obj.p_process.value = "<%=box.getStringDefault("p_old_process", "courseList")%>";
		obj.action = "/servlet/controller.mobile.course.CourseServlet";
		obj.submit();
	}
	
	function goPropose()
	{
		var obj = document.listForm;

		obj.p_process.value = "propose";
		obj.action = "/servlet/controller.mobile.course.CourseServlet";
		obj.submit();
	}
</script>
</head>
<body class="other_sub">
<div id="sub_header">	
	<!--header-->
	<%@ include file="/learn/mobile/include/header.jsp" %>
	<!--header-->
</div>
<div id="kocca_subContent">	
	<div class="h_area_corse">
		<h3 class="t">������</h3>
	</div>
	
	<form name="listForm" method="post" action="/servlet/controller.mobile.course.CourseServlet">
		<input type="hidden" name="p_process" value="courseList" />
		<input type="hidden" name="p_menuid" value="<%=v_menuid%>" />
		<input type="hidden" name="p_pageno" value="<%=v_pageno%>" />
		
		<input type="hidden" name="p_upperclass" value="<%=v_upperclass%>" />
		<input type="hidden" name="p_middleclass" value="<%=v_middleclass%>" />
		<input type="hidden" name="p_searchText" value="<%=box.getString("p_searchText")%>" />
		
		<input type="hidden" name="p_subj" value="<%=v_subj%>" />
		<input type="hidden" name="p_year" value="<%=v_year%>" />
		<input type="hidden" name="p_subjseq" value="<%=v_subjseq%>" />
	</form>
    
    <% if ((!v_user_id.equals("")) && v_menuid.equals("010001000000")) { %>		
	<button style="float:left;" id="sub_searchSubmit2" onclick="return goPropose();">
		<span>������û</span>
	</button>
	<% } %>
	<button style="float:left;" id="sub_searchSubmit" onclick="return goListPage();">
		<span>���</span>
	</button>
	
	

<% 
	if("ON".equals(v_cousegubun))
	{
%>
	<div class="h_area">
	<h3 class="h">�����Ұ�</h3>
	</div>			

	<div class="board-view">
	<table cellpadding="0" cellspacing="0">
	<colgroup>
		<col width="25%" />
		<col width="%" />
	</colgroup>
	<tr>
		<td class="td_left">������</td>
		<td class="td_right">&lt;<%=dbox.getString("d_areanm")%>&gt; <%=dbox.getString("d_subjnm")%></td>
	</tr>
	<!-- 
	<tr>
		<td class="td_left">�з�</td>
		<td class="td_right"><%=dbox.getString("d_classname")%></td>
	</tr>	
	<tr>
		<td class="td_left">�о�</td>
		<td class="td_right"><%=dbox.getString("d_middlename")%></td>
	</tr>	
	 
	<tr>
		<td class="td_left">��������</td>
		<td class="td_right"><%=dbox.getString("d_subjtypenm")%></td>
	</tr>
-->	
	<tr>
		<td class="td_left">�������</td>
		<td class="td_right"><%= dbox.getHtmlString("d_edumans") %></td>
	</tr>	
	<tr>
		<td class="td_left">��������</td>
		<td class="td_right"><%= dbox.getHtmlString("d_intro") %></td>
	</tr>	
	<%-- <tr>
		<td class="td_left">���Ǳ���/����</td>
		<td class="td_right"><%= dbox.getHtmlString("d_memo") %></td>
	</tr>	 --%>
	</table>
	</div>
<% 
	}
	else
	{
%>
	<div class="h_area">
		<h3 class="h">�����Ұ�</h3>
	</div>			

	<div class="board-view">
		<table cellpadding="0" cellspacing="0">
		<colgroup>
			<col width="25%" />
			<col width="%" />
		</colgroup>
		<tr>
			<td class="td_left">������</td>
			<td class="td_right"><%=dbox.getString("d_areanm")%>&gt; <%=dbox.getString("d_subjnm")%></td>
		</tr>	
		<tr>
			<td class="td_left">�������</td>
			<td class="td_right"><%= dbox.getHtmlString("d_subjtarget") %></td>
		</tr>		
		<tr>
			<td class="td_left">��������</td>
			<td class="td_right"><%= dbox.getHtmlString("d_intro") %></td>
		</tr>		
		</table>
	</div>
<%		
		
	}
%>
	<div class="h_area">
	<h3 class="h">��������</h3>
	</div>
	<div class="h_Contents">
	<ul>
		<%=dbox.getString("d_explain") %>
	</ul>
	</div>
<% 
	if("ON".equals(v_cousegubun))
	{
%>
	<div class="h_area">
		<h3 class="h">��������</h3>
		</div>			
	
		<div class="board-view01">
		<table cellpadding="0" cellspacing="0">
		<colgroup>
			<col width="25%" />
			<col width="%" />
			<col width="25%" />
		</colgroup>
		<tr>
			<td class="td_center01">����</td>
			<td class="td_center02">��������</td>
			<!-- <td class="td_center02">����</td> -->
		</tr>
<% 
		if(list.size() == 0)
		{
%>
		<tr>
			<td class="td_center01" colspan="3">���������� �����ϴ�.</td>
		</tr>	
<%		
		}
		else
		{
			for(int i = 0, j = list.size(); i < j; i++)
			{
				listbox = (DataBox) list.get(i);
%>		
		<tr>
			<td class="td_center01"><%=listbox.getString("d_lesson")%></td>
			<td class="td_left"><%=listbox.getString("d_sdesc")%></td>
			<%-- <td class="td_center02"><%=listbox.getString("d_name")%></td> --%>
		</tr>	
<%
			}
		}
%>	
		</table>
	</div>
<% 
	}
%>
	<div class="h_area">
	<h3 class="h">�����ȳ�</h3>
	</div>			

	<div class="board-view">
	<table cellpadding="0" cellspacing="0">
	<colgroup>
		<col width="25%" />
		<col width="%" />
		<col width="25%" />
		<col width="%" />
	</colgroup>
	<tr>
		<td class="td_left">������û������</td>
		<td class="td_right"><%=FormatDate.getFormatDate(dbox.getString("d_propstart"), "yyyy/M/d")%></td>
		<td class="td_left01">������û������</td>
		<td class="td_right"><%=FormatDate.getFormatDate(dbox.getString("d_propend"), "yyyy/M/d")%></td>
	</tr>	
	<tr>
		<td class="td_left">����������</td>
		<td class="td_right"><%=FormatDate.getFormatDate(dbox.getString("d_edustart"), "yyyy/M/d")%></td>
		<td class="td_left01">����������</td>
		<td class="td_right"><%=FormatDate.getFormatDate(dbox.getString("d_eduend"), "yyyy/M/d")%></td>
	</tr>
	<tr>
		<td class="td_left">��������</td>
		<td class="td_right"><%=(dbox.getInt("d_tseat") > 0)? NumberManager.getIntFormat(dbox.getInt("d_tseat")) + "��":"���Ѿ���"%></td>
		<td class="td_left01">������</td>
		<td class="td_right"><%=(dbox.getInt("d_biyong") > 0)? NumberManager.getlongFormat(dbox.getInt("d_biyong")) + "��":"����"%></td>
	</tr>
<% 
	if("ON".equals(v_cousegubun))
	{
%>
	<tr>
		<td class="td_left">��������</td>
		<td colspan="3" class="td_right">�¶��� ���� � �����:
<% 
		if (dbox.getString("d_area").equals("B0")) 
			out.println(" <a href=\"tel:02-2161-0077\">02)2161-0077</a>");
		else if(dbox.getString("d_area").equals("G0")) 
			out.println(" <a href=\"tel:02-3219-5720\">02)3219-5720</a>");
		else if(dbox.getString("d_area").equals("K0")) 
			out.println(" <a href=\"tel:02-2161-0077\">02)2161-0077</a>");
		else 
		{
			out.println(dbox.getString("d_mastername"));
			if (!"".equals(dbox.getString("d_mastercomptel")))
				out.println("<br/><a href=\"tel:" + dbox.getString("d_mastercomptel") +"\">" + dbox.getString("d_mastercomptel") + "</a>");
			if (!"".equals(dbox.getString("d_masteremail")))
				out.println("<br/>" + dbox.getString("d_masteremail"));
			
		}
%>		
		
		</td>
	</tr>
<% 
	}
%>	
	</table>
	</div>
<% 
	if("ON".equals(v_cousegubun))
	{
%>
	<div class="h_area">
		<h3 class="h">����</h3>
	</div>
	
	<div class="board-view01">
		<table cellpadding="0" cellspacing="0">
		<colgroup>
			<col width="25%" />
			<col width="%" />
			<col width="25%" />
		</colgroup>
		<tr>
			<td class="td_center01">�������</td>
			<td class="td_center02">����</td>
			<td class="td_center02">������</td>
		</tr>	
		<tr>
			<td class="td_center01">����</td>
			<td class="td_center02"><%=NumberManager.getIntFormat(dbox.getInt("d_gradscore"))%></td>
			<td class="td_center02"><%=dbox.getString("d_wstep_name")%></td>
		</tr>		
		</table>
	</div>
	
	<div class="h_area">
		<h3 class="h">��</h3>
	</div>


	<div class="board-view01">
		<table cellpadding="0" cellspacing="0">
		<colgroup>
			<col width="%" />
			<col width="14%" />
			<col width="14%" />
			<col width="14%" />
			<col width="14%" />
			<col width="14%" />
			<col width="14%" />
		</colgroup>
		<tr>
			<td class="td_center01">�򰡱���</td>	
			<td class="td_center02">������</td>
			<td class="td_center02">�߰���</td>
			<td class="td_center02">������</td>
			<td class="td_center02">����Ʈ</td>
			<td class="td_center02">������</td>
			<td class="td_center02">��Ÿ</td>
		</tr>	
		<tr>
			<td class="td_center01">����ġ(%)</td>
			<td class="td_center02"><%=dbox.getString("d_wstep_name")%></td>
			<td class="td_center02"><%=dbox.getString("d_wmtest_name")%></td>
			<td class="td_center02"><%=dbox.getString("d_wftest_name")%></td>
			<td class="td_center02"><%=dbox.getString("d_wreport_name")%></td>
			<td class="td_center02"><%=dbox.getString("d_wetc1_name")%></td>
			<td class="td_center02"><%=dbox.getString("d_wetc2_name")%></td>
		</tr>		
		</table>
	</div>
<% 
	}
	if(tutorlist.size() > 0)
	{
%>
	<div class="h_area">
		<h3 class="h">��������</h3>
	</div>
	<div class="h_Contents">
		<ul>
<% 
		for(int i = 0, j = tutorlist.size(); i < j; i++)
		{
			listbox = (DataBox) tutorlist.get(i);
%>
		<li>- <%=listbox.getString("d_name")%>.</li>
<% 
		}
%>
		</ul>
	</div>
<% 
	}
%>	
	<!--footer-->
	<jsp:include page="/learn/mobile/include/footer.jsp" flush="true" />
	<!--footer-->

</div>
</body>
</html>