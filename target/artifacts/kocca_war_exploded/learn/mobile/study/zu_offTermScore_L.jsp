<%@ page language = "java" contentType = "text/html; charset=euc-kr" pageEncoding = "euc-kr" %>
<%@ page errorPage = "/jsp/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<% 
	RequestBox box = (RequestBox)request.getAttribute("requestbox");

	//�����Ϸ� ���� ���
	ArrayList list = (ArrayList) request.getAttribute("_LIST_");
	
	DataBox dbox = null;
	
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
	function goListPage()
	{
		var obj = document.listForm;
		
		obj.method = "post";
		obj.p_process.value = "offLineStudyendList";
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
	
	
	<form name="listForm" method="post" action="/servlet/controller.mobile.course.CourseServlet">
		<input type="hidden" name="p_process" value="offLineStudyendList" />
		<input type="hidden" name="p_menuid" value="<%=v_menuid%>" />
		<input type="hidden" name="p_pageno" value="<%=v_pageno%>" />
	<div class="mp_view_top">
		<button id="sub_searchSubmit" onclick="return goListPage();">
			<span>���</span>
		</button>
	</div>
	</form>			
		
	<div id="" class="field_area">
		<ul id="field_m" class="field_m">
			<li class="field_li field">
			�⵵<span class="bar_line">|</span>
			</li>
			<li class="field_li field">
			�б�<span class="bar_line">|</span>
			</li>
			<li class="field_li field">
			�����<span class="bar_line">|</span>
			</li>
			<li class="field_li field">
			�������<span class="bar_line">|</span>
			</li>
			<li class="field_li field">
			���
			</li>			
		</ul>
	</div>

	<div class="list_area">
<% 
	
	
	if(list.size() == 0)
	{
%>
		<div class="list_area_c">
			�б⺰ �������Ⱑ �����ϴ�.
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
		<div><%= dbox.getString("d_year") %></div>
			<p><span class="list_date"><%= dbox.getString("d_term") %> </span>
			<span class="list_date"><%= dbox.getString("d_lecturecnt") %> </span>
			<span class="list_date"><%= dbox.getString("d_score") %> </span>
			<span class="list_date"><%= dbox.getString("d_rank") %> </span></p>
		</div>
<% 

		}
	}
%>
	</div>
		
	<!--Footer-->
	<jsp:include page="/learn/mobile/include/footer.jsp" flush="true" />
	<!--Footer-->

</div>

</body>
</html>