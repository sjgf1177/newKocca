<%
//**********************************************************
//  1. ��	  ��: ���� ��ȸȭ��
//  2. ���α׷���: za_Subject_L.jsp
//  3. ��	  ��: ���� ��ȸȭ��
//  4. ȯ	  ��: JDK 1.5
//  5. ��	  ��: 1.0
//  6. ��	  ��: swchoi 2009.11.12
//  7. ��	  ��: 
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %> 
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
	RequestBox box = null;
	box = (RequestBox)request.getAttribute("requestbox");

	//DEFINED in relation to select START
	String  ss_subjyear = box.getString("s_subjyear");	  //�����⵵
	if( ss_subjyear.equals("") ) {
		ss_subjyear = Integer.toString((new java.util.Date().getYear()) + 1900);
	}
	String  ss_upperclass = box.getStringDefault("s_upperclass", "S01");	  //������з�
	String  ss_middleclass = box.getString("s_middleclass");	//�����ߺз�
	String  ss_lowerclass = box.getString("s_lowerclass");	  //�����Һз�
	String  ss_action	= box.getString("s_action");
	String s_subjsearchkey = box.getString("s_subjsearchkey");
	//DEFINED in relation to select END
	ArrayList list	  = null;
	if(ss_action.equals("go")){	//go button ���ýø� list ���
		list = (ArrayList)request.getAttribute("resultList");
	}
    String s_gadmin = box.getSession("gadmin");
    String v_gadmin = StringManager.substring(s_gadmin, 0, 1);
    String isAll = !v_gadmin.equals("A") ? "false" : "true";

	String  v_orderType	= box.getStringDefault("p_orderType"," asc"); //���ļ���

%>
<html>
<head>
<title><%=v_gadmin%>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script> 
<SCRIPT LANGUAGE="JavaScript">
<!--
//���̹� ���� ��� ��������
function InsertSubjPage() {
	document.form1.p_process.value = 'insertPage';
	document.form1.submit();
}

//�������� ����
function UpdateSubjPage(subj) {
	document.form1.p_process.value = 'updatePage';
	document.form1.p_subj.value  = subj;
	document.form1.submit();
}

// ����Ʈ ������ �˻�
function whenSelection(ss_action) {
	if (ss_action=="go")	{
		top.ftop.setPam();
	}
		document.form1.s_action.value = ss_action;
		document.form1.p_process.value = 'listPage';
		document.form1.submit();

}

//����
function whenOrder(column) {
	if (document.form1.p_orderType.value == " asc") {
		document.form1.p_orderType.value = " desc";
	} else {
		document.form1.p_orderType.value = " asc";
	}

	document.form1.s_action.value = "go";
	document.form1.p_process.value = 'listPage';	
	document.form1.p_orderColumn.value = column;
	
	document.form1.submit();
}




-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
		<form name="form1" method="post" action="/servlet/controller.off.OffRecruitAdminServlet">
		  <input type="hidden" name="p_process"  value="">
		  <input type="hidden" name="p_subj"	 value="">
		  <input type="hidden" name="p_subjnm"	value="">
		  <input type="hidden" name="s_action"  value="">
		  <input type="hidden" name="p_orderColumn">
		  <input type="hidden" name="p_orderType" value="<%=v_orderType%>">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
	<td align="center" valign="top">
	  <!----------------- title ���� ----------------->
	  <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
		<tr> 
		  <td><img src="/images/admin/portal/s.1_off12.gif" ></td>
		  <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
		</tr>
	  </table>
	  <!----------------- title �� ----------------->
	  <br>
	  <!----------------- form ���� ----------------->
	  <table cellspacing="0" cellpadding="1" class="form_table_out">

		  
		<tr>
		  <td bgcolor="#C6C6C6" align="center">
			<table cellspacing="0" cellpadding="0" class="form_table_bg">
			  <tr>
				<td height="7" width="99%"></td>
			  </tr>
			  <tr>
				<td align="center" width="99%" valign="middle">
				  <table width="99%" cellspacing="0" cellpadding="0" class="form_table">
					<tr>
					  <td>
						<!------------------- ���ǰ˻� ���� ------------------------->
						 <table cellspacing="0" cellpadding="0" width="99%">
							<tr>
								<td>
									<table border="0" cellspacing="0" cellpadding="0" width="99%">
										<tr>
											<td>
												<!--input type= "hidden" name="s_grseq" value="0001"-->
												�����⵵ <kocca_select:select name="s_subjyear" sqlNum="off.year.subj"  param=" "
													onChange="" attr=" " selectedValue="<%= ss_subjyear %>" isLoad="true" all="true" />
												��з� <kocca_select:select name="s_upperclass" sqlNum="off.0002"  param=" "
													onChange="changes_middleclass(this.value);" attr=" " selectedValue="<%= ss_upperclass %>" isLoad="true" all="true" />
												�ߺз� <kocca_select:select name="s_middleclass" sqlNum="off.0003"  param="<%= ss_upperclass %>"
													onChange="changes_lowerclass(s_upperclass.value, this.value);" attr=" " selectedValue="<%= ss_middleclass %>" isLoad="true" all="true" />
												�Һз� <kocca_select:select name="s_lowerclass" sqlNum="off.0004"  param="<%= ss_upperclass %>"  param2="<%= ss_middleclass %>"
													onChange="whenSelection('go')" attr=" " selectedValue="<%=ss_lowerclass %>" isLoad="true" all="true" />
												�����˻� <input type="text" name="s_subjsearchkey" size="17" onkeypress="if(event.keyCode=='13') whenSelection('go');" value="<%=s_subjsearchkey%>">
												
											</td>
											<td  width="10%" align="right"><%@ include file="/learn/admin/include/za_GoButton.jsp" %><!-- whenSelection('go') --></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<!-------------------- ���ǰ˻� �� ---------------------------->
						</td>
					</tr>
				  </table>
				</td>
			  </tr>
			  <tr>
				<td height="7" width="99%"></td>
			  </tr>
			</table>
		  </td>
		</tr>
	  </table>
	  <br>
	  <!----------------- �߰� ��ư ���� ----------------->
	  <table cellpadding="0" cellspacing="0" class="table1">
		<tr>
		  <td align="right" height="20">
			<a href="javascript:InsertSubjPage()"><img src="/images/admin/button/btn_ziphabplus.gif" border="0"></a></td>
		</tr>
		<tr>
		  <td height="3"></td>
		</tr>
	  </table>
	  <!----------------- �߰� ��ư �� ----------------->
	  <!----------------- ���� ���� ���� ----------------->
	  <table cellspacing="1" cellpadding="5" class="table_out">
		<tr>
		  <td colspan="<%if (v_gadmin.equals("H")) out.print("9"); else out.print("12");%>" class="table_top_line"></td>
		</tr>
		<tr>
		  <td class="table_title" width="34"><b>NO</b></td>
		  <td class="table_title" width="34"><b>�⵵</b></td>
		  <td class="table_title" width="15%"><a href="javascript:whenOrder('subj')" class="e">�ڵ�</a></td>
		  <td width="40%" class="table_title"><a href="javascript:whenOrder('subjnm')" class="e">������</a></td>
		  <td class="table_title" width="15%">��米��</td>
		  <td class="table_title" ><a href="javascript:whenOrder('isintroduction')" class="e">������뿩��</a></td>
		</tr>
<%  if(ss_action.equals("go")){	//go button ���ýø� list ���

	DataBox data = null;
	for (int i=0; i<list.size(); i++) {
		data  = (DataBox)list.get(i); 

%>
		<tr>
		  <td class="table_01"><%=String.valueOf(i+1)%></td>
		  <td class="table_01"><%=data.get("d_subjyear")%></td>
		  <td class="table_02_1"><%=data.get("d_subj")%></td>
		  <td class="table_02_2" id="<%=data.get("d_subjnm")%>"><% if(data.get("d_area").length()>0) out.println("<b>[" + data.get("d_area") + "]</b>"); %><a href="javascript:UpdateSubjPage('<%=data.get("d_subj")%>')" class='b'><%=data.get("d_subjnm")%></a></td>
		  <td class="table_02_1"><%=data.get("d_name")%></td>
		  <td class="table_02_1"><%=data.get("d_isuse").equals("Y")?"���":"�̻��"%></td> 
		</tr> 
<%  } %>

	  <% if (list.size()==0) {%>
			<tr><td colspan=9 class="table_02_1">��ϵ� ������ �����ϴ�.</td></tr>  
		<% } %>
<%} %>
	  </table>
	  <!----------------- ���� ���� �� ----------------->
	  <br>
	</td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
</table>
</form>
</body>
</html>
