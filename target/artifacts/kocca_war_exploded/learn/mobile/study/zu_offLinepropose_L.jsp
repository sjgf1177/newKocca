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
		<input type="hidden" name="p_process" value="offLineProposeList" />
		<input type="hidden" name="p_cousegubun" value="OFF" />
		<input type="hidden" name="p_menuid" value="<%=v_menuid%>" />
		<input type="hidden" name="p_subj" value="" />
		<input type="hidden" name="p_year" value="" />
		<input type="hidden" name="p_subjseq" value="" />	
	</form>
	
	<table class="onofftable_tab" cellpadding="0" cellspacing="0">
		<colgroup><col width="50%"><col width="*"></colgroup>
		<tr>
			<td class="tabmenu_on"><a title="�¶��ΰ���" href="/servlet/controller.mobile.study.MyClassServlet?p_process=onLineProposeList&p_menuid=<%=v_menuid%>"><span>�¶��ΰ���</span></a></td>
			<td class="tabmenu_l"><span>�������ΰ���</span></td>
		</tr>
	</table>
	
	<!--�¶���/�������� �Ǹ޴�-->
	<%-- <nav class="onoff_tab_area">
		<div class="onoff_tab">
			<ul>
				<li class="tabmenu_l" style="width:49%;">
					<a title="�¶��ΰ���" href="/servlet/controller.mobile.study.MyClassServlet?p_process=onLineProposeList&p_menuid=<%=v_menuid%>"><span>�¶��ΰ���</span></a>
				</li>
				<li class="tabmenu_on" style="width:50.8%;">
					<a title="�������ΰ���" href=""><span>�������ΰ���</span></a>
				</li>
			</ul>
		</div>
	</nav> --%>
	<!-- 
	<div id="" class="field_area">
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
	String v_accept_state = "";
	String v_tid = "";
	String v_refundyn  = "";
	String v_refundableyn = "";
	String v_cancelableyn = "";
	
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
			
			
			
			v_subj          =  dbox.getString("d_subj");
			v_year          =  dbox.getString("d_year");
			v_subjseq       =  dbox.getString("d_subjseq");
			v_subjnm        =  dbox.getString("d_subjnm");
			
			v_chkfirst		= dbox.getString("d_chkfirst");
			v_chkfinal		= dbox.getString("d_chkfinal");
			
			
			if ("U".equals(v_chkfirst) && "U".equals(v_chkfinal)) 
			{
				v_accept_state	= "��ó��";
			} 
			else if ("Y".equals(v_chkfirst) && "U".equals(v_chkfinal)) 
			{
				v_accept_state	= "1������";
			} 
			else if ("Y".equals(v_chkfirst) && "N".equals(v_chkfinal)) 
			{
				v_accept_state	= "�հ�ó�� �� ���հ�";
			} 
			else if ("Y".equals(v_chkfirst) && "Y".equals(v_chkfinal)) 
			{
				v_accept_state	= "��������";
			} 
			else if ("N".equals(v_chkfirst) && "U".equals(v_chkfinal)) 
			{	
				v_accept_state	= "�̽���";
			}
			
			v_refundyn		= dbox.getString("d_refundyn");
			v_tid			= dbox.getString("d_tid");
			v_refundableyn	= dbox.getString("d_refundableyn");
			v_cancelableyn	= dbox.getString("d_cancelableyn");
%>			
		<div class="list_area_l">
		<div>[<%=dbox.getString("d_classname")%>]<%=StringManager.cutText(v_subjnm, 50, true)%></div>
			<p><span class="list_date color_red"><%=FormatDate.getFormatDate(dbox.getString("d_edustart"), "yyyy.MM.dd") + "~" + FormatDate.getFormatDate(dbox.getString("d_eduend"), "yyyy.MM.dd")%> </span>
			<span class="list_date"><%=FormatDate.getFormatDate(dbox.getString("d_appdate"), "yyyy.MM.dd")%></span>
			<span class=""><%=v_accept_state%></span>
<%
			if ("".equals(v_tid) && "N".equals(v_refundyn) && "Y".equals(v_chkfirst) && "U".equals(v_chkfinal)) 
			{
				out.println("<span class=\" color_red\">�����ϱ�</span>");
			} 
			else if (!"".equals(v_tid) && "N".equals(v_refundyn)) 
			{
				out.println("<span class=\"\">�����Ϸ�</span>");
			} 
			else if ("Y".equals(v_refundyn)) 
			{
				out.println("<span class=\"\">ȯ�ҿϷ�</span>");
			}

			if (!"".equals(v_tid) && "N".equals(v_refundyn) && "Y".equals(v_refundableyn)) 
			{
				if (!"".equals(dbox.getString("d_canceldate"))) 
				{
%>
				<span class="list_date color_red">��ҿ�û��:<%=FormatDate.getFormatDate(dbox.getString("d_canceldate"), "yyyy.MM.dd")%></span>	
<%					
				}
				else
				{
					if ("Y".equals(v_cancelableyn)) 
					{
						out.println("<span class=\"color_red\">�������</span");
					}
					else
					{
						out.println("<span class=\"\">��ҿ�û</span");
					}	
				}
			}
			else if ("".equals(v_tid) && "N".equals(v_refundyn) && "Y".equals(v_refundableyn)) 
			{
				out.println("<span class=\"color_red\">�������</span");
			}
			else
			{
				if ("Y".equals(v_refundyn)) 
				{
%>
					<span class="list_date color_red">�����:<%=FormatDate.getFormatDate(dbox.getString("d_refunddate"), "yyyy.MM.dd")%></span>	
<%					
				}
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