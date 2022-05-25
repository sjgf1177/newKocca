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
	
	String v_gugun = box.getStringDefault("p_gubun", "nowMonth");
	String v_genre = box.getString("p_genre");
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
		obj.p_process.value = "goldClassListPage";
		obj.action = "/servlet/controller.mobile.info.InfoServlet";
		obj.submit();
	}

	//Tab�̵� 
	function goTabMovePage(v_genre)
	{
		var obj = document.listForm;

		obj.p_pageno.value = "1";
		obj.p_genre.value = v_genre;
		obj.p_process.value = "goldClassListPage";
		obj.action = "/servlet/controller.mobile.info.InfoServlet";
		obj.submit();
	}
	//�������� �̵�
	function goViewPage(v_seq)
	{
		var obj = document.listForm;
		
		obj.p_seq.value = v_seq;
		obj.p_process.value = "goldClassViewPage";
		obj.action = "/servlet/controller.mobile.info.InfoServlet";
		obj.submit();
	}
</script>
</head>
<body class="other_sub">
<div id="sub_header">	
	<%@ include file="/learn/mobile/include/header.jsp" %>
</div>
<div id="kocca_subContent">	

	
	<!--�Ǹ޴�-->
	<form name="listForm" action="/servlet/controller.mobile.info.InfoServlet" method="post">
		<input type="hidden" name="p_process" value="goldClassListPage" />
		<input type="hidden" name="p_menuid" value="<%=v_menuid%>" />
		<input type="hidden" name="p_gubun" value="<%=v_gugun%>" />
		<input type="hidden" name="p_genre" value="<%=v_genre%>" />
		<input type="hidden" name="p_seq" value="" />
		<input type="hidden" name="p_pageno" value="<%=v_pageno%>" />

	
	<nav class="onoff_tab_area">
		<div class="onoff_tab">
			<ul>
				<li class="<%="".equals(v_genre)? "tabmenu_on":"tabmenu_l"%>" style="width:16%;">
					<a onclick="goTabMovePage('');" title="��ü" href="#none">��ü</a>
				</li>
				<li class="<%="G01".equals(v_genre)? "tabmenu_on":"tabmenu_l"%>" style="width:16%;">
					<a onclick="goTabMovePage('G01');" title="��ۿ���" href="#none">���</a>
				</li>
				<li class="<%="G02".equals(v_genre)? "tabmenu_on":"tabmenu_l"%>" style="width:16%;">
					<a onclick="goTabMovePage('G02');" title="��ȭ" href="#none">��ȭ</a>
				</li>
				<li class="<%="G03".equals(v_genre)? "tabmenu_on":"tabmenu_l"%>" style="width:16%;">
					<a onclick="goTabMovePage('G03');" title="��ȭ" href="#none">��ť</a>
				</li>
				<li class="<%="G04".equals(v_genre)? "tabmenu_on":"tabmenu_l"%>" style="width:16%;">
					<a onclick="goTabMovePage('G04');" title="��ȭ����" href="#none">��ȭ</a>
				</li>
				<li class="<%="G05".equals(v_genre)? "tabmenu_on":"tabmenu_l"%>" style="width:16%;">
					<a onclick="goTabMovePage('G05');" title="��Ÿ" href="#none">��Ÿ</a>
				</li>			
			</ul>
		</div>
	</nav>
	</form>
	<!--��������Ʈ-->
	<div class="category_two">
	</div>
	<div class="basics_tvcf">
		<ul>
<% 
	if(list.size() == 0)
	{
%>
			<li>
				��ϵ� �ڷᰡ �����ϴ�.
			</li>
<%		
	}
	else
	{
		for(int i = 0, j = list.size(); i< j; i++)
		{
			dbox = (DataBox) list.get(i);
%>
			<!--1��-->
			<li>
				<a href="javascript:goViewPage('<%=dbox.getString("d_seq")%>');">
				<span class="txte f_text_b"><span class="t_icon"></span><%=dbox.getString("d_lecnm")%></span>
				<span class="title f_text_g">- <%=dbox.getString("d_tutornm")%></span>
				</a>
			</li>
<%
			v_totalpage = dbox.getInt("d_totalpage");
			v_rowcount = dbox.getInt("d_rowcount"); 
		}
	}
%>	
		</ul>				
	</div>
	<!--������-->
	<div class="pg">
		<%= PageUtil.printPageMobileList(v_totalpage, v_pageno, v_rowcount, "") %>
	</div>
		
	<!--Footer-->
	<jsp:include page="/learn/mobile/include/footer.jsp" flush="true" />
	<!--Footer-->
	
</div>
</body>
</html>