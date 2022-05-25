<%@ page language = "java" contentType = "text/html; charset=euc-kr" pageEncoding = "euc-kr" %>
<%@ page errorPage = "/jsp/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<% 
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
	
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
		obj.p_process.value = "searchCourseList";
		obj.action = "/servlet/controller.mobile.course.CourseServlet";
		obj.submit();
	}

	//�˻�
	function goSearch()
	{
		var obj = document.listForm;
		
		obj.method = "post";
		obj.p_pageno.value = 1;
		obj.p_process.value = "searchCourseList";
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
		obj.p_process.value = "searchCourseList";
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
		obj.p_old_process.value = "searchCourseList";
		obj.p_process.value = "courseView";
		obj.action = "/servlet/controller.mobile.course.CourseServlet";
		obj.submit();
	}

	//�̸�����
	function download(url)
	{
		if(f_is_trim(url) == "") 
		{
			alert("�����Ⱑ �����ϴ�."); 
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
		obj.p_old_process.value = "searchCourseList";
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
		<input type="hidden" name="p_process" value="searchCourseList" />
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
		<input type="hidden" name="p_process" value="searchCourseList" />
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
<!-- 
	<div id="" class="field_area_06">
		<ul id="field_m" class="field_m">
			<li class="field_li field">
			������<span class="bar_line">|</span>
			</li>
			<li class="field_li field">
			�����Ⱓ(������û�Ⱓ)<span class="bar_line"></span>
			</li>
				
		</ul>
	</div>
 -->
	<div class="category_two">
	</div>
	
	<div class="list_area">
<% 
	if(list.size() == 0)
	{
%>
		<div class="list_area_l">
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
			<div><a href="javascript:goCouseDetail('<%=dbox.getString("d_cousegubun")%>', '<%=dbox.getString("d_subj")%>', '<%=dbox.getString("d_year")%>', '<%=dbox.getString("d_subjseq")%>');" class="list_a"><span class="on_icon">&nbsp;&nbsp;&nbsp;</span>&lt;<%=dbox.getString("d_areanm")%>&gt;<%=StringManager.cutText(dbox.getString("d_subjnm"), 50, true)%></a></div>
			<p><span class="list_date"><%=FormatDate.getFormatDate(dbox.getString("d_edustart"), "yyyy.MM.dd") + "~" + FormatDate.getFormatDate(dbox.getString("d_eduend"), "yyyy.MM.dd")%><span class="color_blue">(<%=FormatDate.getFormatDate(dbox.getString("d_propstart"), "yyyy.MM.dd") + "~" + FormatDate.getFormatDate(dbox.getString("d_propend"), "yyyy.MM.dd")%>)</span></span></p>
<!-- 			<p><span class="list_btn">
<% 
			if(!"".equals(dbox.getString("d_mobile_preurl")))
			{
%>				
				<button id="test_Submit" onclick="return download('<%=dbox.getString("d_mobile_preurl")%>');">������</button>
<% 
			}
%>				
				<button id="add_Submit" onclick="return goInsertInterest('<%=dbox.getString("d_subj")%>');">���</button>
			</span></p>
 -->
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


</html>
</body>
</html>