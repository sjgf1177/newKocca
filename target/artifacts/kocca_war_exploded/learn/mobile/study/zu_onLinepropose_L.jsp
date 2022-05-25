<%@ page language = "java" contentType = "text/html; charset=euc-kr" pageEncoding = "euc-kr" %>
<%@ page errorPage = "/jsp/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<% 
	RequestBox box = (RequestBox)request.getAttribute("requestbox");

	//�����Ϸ� ���� ���
	ArrayList list = (ArrayList) request.getAttribute("_LIST_");
	if(list == null) list = new ArrayList();
	
	DataBox dbox = null;
	
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
</script>
</head>
<body class="other_sub">
<div id="sub_header">	
	<%@ include file="/learn/mobile/include/header.jsp" %>
</div>
<div id="kocca_subContent">	

	<form name="viewForm" method="post" action="/servlet/controller.mobile.course.CourseServlet">
		<input type="hidden" name="p_process" value="onLineProposeList" />
		<input type="hidden" name="p_cousegubun" value="ON" />
		<input type="hidden" name="p_menuid" value="<%=v_menuid%>" />
		<input type="hidden" name="p_subj" value="" />
		<input type="hidden" name="p_year" value="" />
		<input type="hidden" name="p_subjseq" value="" />	
	</form>
	
	<table class="onofftable_tab" cellpadding="0" cellspacing="0">
		<colgroup><col width="50%"><col width="*"></colgroup>
		<tr>
			<td class="tabmenu_on"><a title="�¶��ΰ���"><span>�¶��ΰ���</span></a></td>
			<%-- <td class="tabmenu_l"><a title="�������ΰ���" href="/servlet/controller.mobile.study.MyClassServlet?p_process=offLineProposeList&p_menuid=<%=v_menuid%>"><span>�������ΰ���</span></a></td> --%>
		</tr>
	</table>
	
	<!--�¶���/�������� �Ǹ޴�-->
	<%-- <nav class="onoff_tab_area">
		<div class="onoff_tab">
			<ul>
				<li class="tabmenu_on" style="width:49%;">
					<a title="�¶��ΰ���" href=""><span>�¶��ΰ���</span></a>
				</li>
				<li class="tabmenu_l" style="width:50.8%;">
					<a title="�������ΰ���" href="/servlet/controller.mobile.study.MyClassServlet?p_process=offLineProposeList&p_menuid=<%=v_menuid%>"><span>�������ΰ���</span></a>
				</li>
			</ul>
		</div>
	</nav> --%>
		
	<!-- 
	<div id="" class="field_area_06">
		<ul id="field_m" class="field_m">
			<li class="field_li field">
			�з�<span class="bar_line">|</span>
			</li>
			<li class="field_li field">
			������<span class="bar_line">|</span>
			</li>
			<li class="field_li field">
			�����Ⱓ<span class="bar_line">|</span>
			</li>
			<li class="field_li field">
			������û��<span class="bar_line">|</span>
			</li>
			<li class="field_li field">
			����<span class="bar_line">|</span>
			</li>
			<li class="field_li field">
			�������<span class="bar_line">|</span>
			</li>
			<li class="field_li field">
			���
			</li>			
		</ul>
	</div>
	 -->
	<div class="category_two">
	</div>

	<!--��������Ʈ-->
	<div class="list_area">
<% 
	String v_isoutsourcing = "";
	String v_eduurl = "";
	String v_subj = "";
	String v_year = "";
	String v_subjseq = "";
	String v_subjnm = "";
	
	String v_chkfirst = "";
	String v_chkfinal = "";
	String v_chkstatus = "";
	
	String v_tid = "";
	String v_refundyn = "";
	String v_paystatus = "";
	
	
	if(list.size() == 0)
	{
%>
		<div class="list_area_c">
			������û ���� ������ �����ϴ�.
		</div>
<%		
	}
	else
	{
		for(int i = 0, j = list.size(); i < j; i++)
		{
			dbox = (DataBox) list.get(i);
			
			
			v_tid			= dbox.getString("d_tid");
			v_subj          =  dbox.getString("d_subj");
			v_year          =  dbox.getString("d_year");
			v_subjseq          =  dbox.getString("d_subjseq");
			v_subjnm        =  dbox.getString("d_subjnm");
			
			v_chkfirst		= dbox.getString("d_chkfirst");
			v_chkfinal		= dbox.getString("d_chkfinal");
			
			
			if ("Y".equals(v_chkfirst) && "Y".equals(v_chkfinal)) 
			{
				v_chkstatus = "����";
			}
			if ("Y".equals(v_chkfirst) && "B".equals(v_chkfinal)) 
			{
				v_chkstatus = "���δ��";
			}
			if ("Y".equals(v_chkfirst) && "N".equals(v_chkfinal)) 
			{
				v_chkstatus = "�ݷ�";
			}
			
			/* v_refundyn		= dbox.getString("d_refundyn");
			if ("Y".equals(v_refundyn)) 
			{
                v_paystatus = "ȯ�ҿϷ�";
       		} 
			else 
			{
           		if (!v_chkfinal.equals("Y") && v_tid.equals("")) 
           		{
               		v_paystatus ="�̰���";
           		} 
           		else 
           		{
                	v_paystatus ="�����Ϸ�";                       
           		}
       		} */
			
%>			
		<div class="list_area_1">
			<div>[<%=dbox.getString("d_classname")%>]<%=StringManager.cutText(v_subjnm, 50, true)%></div>
				<p><span class="list_date color_red"><%=FormatDate.getFormatDate(dbox.getString("d_edustart"), "yyyy.MM.dd") + "~" + FormatDate.getFormatDate(dbox.getString("d_eduend"), "yyyy.MM.dd")%> </span>
				<span class="list_date"><%=FormatDate.getFormatDate(dbox.getString("d_appdate"), "yyyy.MM.dd")%></span>
				<span class=""><%=v_chkstatus%></span>
				<span class=""><%=v_paystatus%></span>
<% 
			if ("Y".equals(v_refundyn)) 
			{
%>
				<span class="list_date color_red">�����:<%=FormatDate.getFormatDate(dbox.getString("d_refunddate"), "yyyy.MM.dd")%></span>
<%				
			}
			else
			{
%>
				�Ⱓ����
<%				
			}

%>				
				</p>
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
</html>