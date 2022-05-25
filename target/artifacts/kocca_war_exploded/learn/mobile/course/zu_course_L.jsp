<%@ page language = "java" contentType = "text/html; charset=euc-kr" pageEncoding = "euc-kr" %>
<%@ page errorPage = "/jsp/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<% 
	RequestBox box = (RequestBox)request.getAttribute("requestbox");

	//��з����
	ArrayList upperlist = (ArrayList) request.getAttribute("_UPPERLIST_");
	if(upperlist == null) upperlist = new ArrayList();

	//�ߺз����
	ArrayList middlelist = (ArrayList) request.getAttribute("_MIDDLELIST_");
	if(middlelist == null) middlelist = new ArrayList();
	
	//�������
	ArrayList list = (ArrayList) request.getAttribute("_LIST_");
	if(list == null) list = new ArrayList();
	
	DataBox dbox = null;
	
	/** ����¡ */
	int v_totalpage = 0;
	int v_rowcount = 1;
	
	int v_pageno = box.getInt("p_pageno");
	String v_upperclass = box.getString("p_upperclass");
	String v_middleclass = box.getString("p_middleclass");
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
		obj.p_process.value = "courseList";
		obj.action = "/servlet/controller.mobile.course.CourseServlet";
		obj.submit();
	}

	//�˻�
	function goSearch()
	{
		var obj = document.listForm;
		
		obj.method = "post";
		obj.p_pageno.value = 1;
		obj.p_process.value = "courseList";
		obj.action = "/servlet/controller.mobile.course.CourseServlet";
		obj.submit();
		
	}

	//�˻�
	function goTabSearch(v_upperclass, v_middleclass)
	{
		var obj = document.listForm;
		
		obj.p_upperclass.value = v_upperclass;
		obj.p_middleclass.value = v_middleclass;
		obj.p_pageno.value = 1;
		obj.p_process.value = "courseList";
		obj.method = "post";
		obj.action = "/servlet/controller.mobile.course.CourseServlet";
		obj.submit();
		
	}
	
	//�������� �̵�
	function goCouseDetail(v_cousegubun, v_subj, v_year, v_subjseq)
	{
		var obj = document.viewForm;
		obj.p_cousegubun.value = v_cousegubun;
		obj.p_subj.value = v_subj;
		obj.p_year.value = v_year;
		obj.p_subjseq.value = v_subjseq;
		obj.p_old_process.value = "courseList";
		obj.p_process.value = "courseView";
		obj.action = "/servlet/controller.mobile.course.CourseServlet";
		obj.submit();
	}

	//�̸�����
	function download(url)
	{
		if(f_is_trim(url) == "") 
		{
			alert("�غ����Դϴ�."); 
		}
		else
		{
			if(confirm("3G�� �̿�� ��Ż��� ������� ���� �̿����� �߻��� �� �ֽ��ϴ�. ��� �����Ͻðڽ��ϱ�?")){
				location.href=url;
			}
		}
	}


	//���ɰ��� ���
	function goInsertInterest(v_subj)
	{
		var obj = document.viewForm;

		if("<%=s_userid%>" == "")
		{
			alert("���ɰ������� �α��� �� �����մϴ�.");
			return false;
		}
		if(!confirm("���ɰ�����⿡ �����Ͻðڽ��ϳ�?"))
		{
			return false;
		}	
		obj.p_subj.value = v_subj;
		obj.p_old_process.value = "courseList";
		obj.p_process.value = "insertInterest";
		obj.action = "/servlet/controller.mobile.course.CourseServlet";
		obj.submit();
	}
</script>
</head>
<body class="other_sub">
<div id="sub_header">	
	<%@ include file="/learn/mobile/include/header.jsp" %>
</div>
<div id="kocca_subContent">	
	
	<form name="viewForm" method="post" action="/servlet/controller.mobile.course.CourseServlet">
		<input type="hidden" name="p_process" value="courseList" />
		<input type="hidden" name="p_old_process" value="" />
		<input type="hidden" name="p_menuid" value="<%=v_menuid%>" />
		<input type="hidden" name="p_pageno" value="<%=v_pageno%>" />
		
		<input type="hidden" name="p_upperclass" value="<%=v_upperclass%>" />
		<input type="hidden" name="p_middleclass" value="<%=v_middleclass%>" />
		<input type="hidden" name="p_cousegubun" value="" />
		<input type="hidden" name="p_subj" value="" />
		<input type="hidden" name="p_year" value="" />
		<input type="hidden" name="p_subjseq" value="" />
		<input type="hidden" name="p_searchText" value="<%=box.getString("p_searchText")%>" />
	</form>
	
	<form name="listForm" method="post" action="/servlet/controller.mobile.course.CourseServlet">
		<input type="hidden" name="p_process" value="courseList" />
		<input type="hidden" name="p_menuid" value="<%=v_menuid%>" />
		<input type="hidden" name="p_pageno" value="<%=v_pageno%>" />
		
		<input type="hidden" name="p_upperclass" value="<%=v_upperclass%>" />
		<input type="hidden" name="p_middleclass" value="<%=v_middleclass%>" />
	<div class="sub_search_outwrap">
		<input id="sub_q" name="p_searchText" type="text" value="<%=box.getString("p_searchText")%>" />
	</div>
	
	<button id="sub_searchSubmit" onclick="return goSearch();">
		<span>�˻�</span>
	</button>
	</form>
 <% 
	if((upperlist.size() > 0) && (!v_menuid.equals("010001000000")))
	{

%>		
		<div class="category_one">
			<p>
			<span class="c_first">�з�</span>
<% 
		for(int i = 0, j = upperlist.size(); i < j; i++)
		{
			dbox = (DataBox) upperlist.get(i);
%>			
			<a href="javascript:goTabSearch('<%=dbox.getString("d_upperclass")%>', '');"><em<%=(v_upperclass.equals(dbox.getString("d_upperclass")))? " class=\"c_num_on\"":""%>><%=dbox.getString("d_classname")%></em></a><%=((j - 1) != i)? "<span class=\"bar_line\">|</span>":""%>
<% 
		}
%>
			</p>
		</div>
<% 
	}
%>
<%-- 
<% 
	if(middlelist.size() > 0)
	{

%>		
		<div class="category_two">
			<p>
				<span class="c_first">2nd</span>
<% 
		for(int i = 0, j = middlelist.size(); i < j; i++)
		{
			dbox = (DataBox) middlelist.get(i);
%>			
				<a href="javascript:goTabSearch('<%=dbox.getString("d_upperclass")%>', '<%=dbox.getString("d_middleclass")%>');"><em<%=(v_middleclass.equals(dbox.getString("d_middleclass")))? " class=\"c_num_on\"":""%>><%=dbox.getString("d_classname")%></em></a><%=((j - 1) != i)? "<span class=\"bar_line\">|</span>":""%>
<% 
		}
%>
			</p>
		</div>
<% 
	}
%>  --%>
<!-- 
	<div class="field_area_06">
		<ul class="field_m">
			<li class="field_li field">
			������<span class="bar_line">|</span>
			</li>
			<li class="field_li field">
			�����Ⱓ(������û�Ⱓ)<span class="bar_line"></span>
			</li>
			
		</ul>
	</div>
 -->	

	
	<div class="list_area">
<% 
	

	if(list.size() == 0)
	{
%>
		<div class="list_area_c">
			��ϵ� ������ �����ϴ�.
		</div>
<%		
	}
	else
	{
		for(int i = 0, j = list.size(); i < j; i++)
		{
			dbox = (DataBox) list.get(i);
%>
		<div class="list_area_l">
			<div><a href="javascript:goCouseDetail('<%=dbox.getString("d_cousegubun")%>', '<%=dbox.getString("d_subj")%>', '<%=dbox.getString("d_year")%>', '<%=dbox.getString("d_subjseq")%>');" class="list_a"><span class="<%="OFF".equals(dbox.getString("d_cousegubun"))? "off_icon":"on_icon"%>">&nbsp;&nbsp;&nbsp;</span><%=StringManager.cutText(dbox.getString("d_subjnm"), 55, true)%></a></div>
			<p><span class="list_date"><span class="color_red"><%=FormatDate.getFormatDate(dbox.getString("d_edustart"), "yyyy.MM.dd") + "~" + FormatDate.getFormatDate(dbox.getString("d_eduend"), "yyyy.MM.dd")%></span><span class="color_green">(<%=FormatDate.getFormatDate(dbox.getString("d_propstart"), "yyyy.MM.dd") + "~" + FormatDate.getFormatDate(dbox.getString("d_propend"), "yyyy.MM.dd")%>)</span></span></p>
		</div>
	
<%
			v_totalpage = dbox.getInt("d_totalpage");
			v_rowcount = dbox.getInt("d_rowcount"); 

		}	
	}
%>
	</div>
	<!--������-->
	<div class="pg">
		<%= PageUtil.printPageMobileList(v_totalpage, v_pageno, v_rowcount, "") %>
	</div>
	
	<!-- footer -->
	<jsp:include page="/learn/mobile/include/footer.jsp" flush="true" />
	<!-- footer-->
	
</div>
</body>
</html>