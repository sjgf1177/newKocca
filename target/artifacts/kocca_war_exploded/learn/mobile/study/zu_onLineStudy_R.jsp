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
	ArrayList list = (ArrayList) request.getAttribute("_LIST_");
	if(list == null) list = new ArrayList();
	
	//���� ���
	ArrayList tutorlist = (ArrayList) request.getAttribute("_TUTORLIST_");
	if(tutorlist == null) tutorlist = new ArrayList();
	
	DataBox listbox = null;
	
	/** ����¡ */
	int v_pageno = box.getInt("p_pageno");
	
	
	String v_cousegubun = box.getString("p_cousegubun");
	
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
<script type="text/javascript" src="/js/mdetect.js"></script>
<script type="text/javascript" language="javascript">
	//��������� �̵�
	function goListPage()
	{
		var obj = document.listForm;

		obj.p_process.value = "onLineStudyingList";
		obj.action = "/servlet/controller.mobile.study.MyClassServlet";
		obj.submit();
	}

	//�����󺸱�
	function download(v_lesson, url, v_progessyn)
	{
		var v_mobile_url = "";
		var obj = document.viewForm; 
		var v_subj = obj.p_subj.value;
		var v_year = obj.p_year.value;
		var v_subjseq = obj.p_subjseq.value;
		
		if(f_is_trim(url) == "") 
		{
			alert("�غ����Դϴ�."); 
		}
		else
		{
			if(confirm("3G�� �̿�� ��Ż��� ������� ���� �̿����� �߻��� �� �ֽ��ϴ�. ��� �����Ͻðڽ��ϱ�?")){

				v_mobile_url = v_subj + "@" + v_year + "@" + v_subjseq + "@" + v_lesson + "@" + url + "@<%=s_userid%>@" + v_progessyn;
				//v_mobile_url = v_subj + "@" + v_year + v_subjseq + "@" + v_lesson + "@" + url + "@<%=s_userid%>";
				
				if ( DetectAndroid() )
				{
					window.kocca.showLecture(v_mobile_url);
				}
				else if ( DetectIphoneOrIpod() || DetectIpad() )
				{
					document.location.href = "kocca://showLecture?" + v_mobile_url;
				}
			}
		}
	}
	
	//ePUb
	function downloadePub(v_url)
	{		
		document.location.href = v_url;		
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
	
	<form name="listForm" method="post" action="/servlet/controller.mobile.study.MyClassServlet">
		<input type="hidden" name="p_process" value="onLineStudyingList" />
		<input type="hidden" name="p_menuid" value="<%=v_menuid%>" />
		<input type="hidden" name="p_pageno" value="<%=v_pageno%>" />
	</form>
	
	<form name="viewForm" method="post" action="/servlet/controller.mobile.study.MyClassServlet">
		<input type="hidden" name="p_process" value="onLineStudyingList" />
		<input type="hidden" name="p_menuid" value="<%=v_menuid%>" />
		<input type="hidden" name="p_pageno" value="<%=v_pageno%>" />
		
		<input type="hidden" name="p_subj" value="<%=dbox.getString("d_subj")%>" />
		<input type="hidden" name="p_year" value="<%=dbox.getString("d_year")%>" />
		<input type="hidden" name="p_subjseq" value="<%=dbox.getString("d_subjseq")%>" />
	</form>
	<button id="sub_searchSubmit" onclick="return goListPage();">
		<span>���</span>
	</button>
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
		<%if (!dbox.getString("d_epub_file").equals("")) {%>
		<tr>
			<td class="td_left">EPub</td>
			<td class="td_right"><button id="test_Submit" onclick="return downloadePub('<%=dbox.getString("d_epub_file")%>');">ePub����</button></td>
		</tr>
		<% } %>
		<tr>
			<td class="td_left">�����Ⱓ</td>
			<td class="td_right"><%=FormatDate.getFormatDate(dbox.getString("d_edustart"), "yyyy/M/d") + " ~ " + FormatDate.getFormatDate(dbox.getString("d_eduend"), "yyyy/M/d")%></td>
		</tr>	
		</table>
	</div>

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
			<td class="td_center02">�����󺸱�</td>
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
			<td class="td_center02"><button id="test_Submit" onclick="return download('<%=listbox.getString("d_lesson")%>', '<%=listbox.getString("d_mobile_url")%>', '<%=listbox.getString("d_processyn")%>');">������</button></td>
			
		</tr>	
<%
			}
		}
%>	
		</table>
	</div>
			
	<!--footer-->
	<jsp:include page="/learn/mobile/include/footer.jsp" flush="true" />
	<!--footer-->

</div>
</body>
</html>