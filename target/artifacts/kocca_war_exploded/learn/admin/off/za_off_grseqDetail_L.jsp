<%
//**********************************************************
//  1. ��	  ��: ���� - �б� ��ȸȭ��
//  2. ���α׷���: za_off_grseq_L.jsp
//  3. ��	  ��: ���� - �б� ��ȸȭ��
//  4. ȯ	  ��: JDK 1.5
//  5. ��	  ��: 1.0
//  6. ��	  ��: swchoi 2009.11.23
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
	String  ss_year = box.getString("s_year");	  //����
	String  ss_subj = box.getString("s_subjcode");	  		//����
	String  ss_grseq = box.getString("s_grseq");	  //����
	String  ss_subjyear = box.getString("s_subjyear");	  //�����⵵
	if( ss_year.equals("") ) {
		ss_year = Integer.toString((new java.util.Date().getYear()) + 1900);
	}
	String  ss_upperclass = box.getStringDefault("s_upperclass", "S01");	  //������з�
	String  ss_middleclass = box.getStringDefault("s_middleclass", "ALL");	//�����ߺз�
	String  ss_lowerclass = box.getStringDefault("s_lowerclass", "ALL");	  //�����Һз�
	String  ss_action	= box.getString("s_action");
	String s_subjsearchkey = box.getString("s_subjsearchkey");
    String v_gyear  = box.getStringDefault("p_gyear", FormatDate.getDate("yyyy"));
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
<title><%=v_gadmin%> ��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script> 
<SCRIPT LANGUAGE="JavaScript">
<!--
function fnInsert(subj, year, subjseq, totalterm) {
	$("#p_subj").val(subj);
	$("#u_year").val(year);
	$("#u_subjseq").val(subjseq);
	$("#u_totalterm").val(totalterm);
    window.self.name = "TermMain";
    open_window("termPopup","","30","30","600","400");
    document.form1.target = "termPopup";
    document.form1.action='/servlet/controller.off.OffGrseqAdminServlet';
    document.form1.p_process.value = 'detailInsertPage';
    document.form1.submit();

    document.form1.target = window.self.name;
}

// �˻�
function whenSelection(ss_action) {
	if (ss_action=="go")	{
		top.ftop.setPam();
	}
	if(checkNotNull($('#s_subjcode').val(), '����') || checkNotNull($('#s_subjseq').val(), '����')) {//<font color="red">��</font>
		return;
	}
		document.form1.s_action.value = ss_action;
		document.form1.p_process.value = 'detailListPage';
		document.form1.submit();

}
function subjSearch() {
	changes_subjcode($("#s_year").val(),$("#s_upperclass").val(),$("#s_middleclass").val(),$("#s_lowerclass").val());
}

//����
function whenOrder(column) {
	if (document.form1.p_orderType.value == " asc") {
		document.form1.p_orderType.value = " desc";
	} else {
		document.form1.p_orderType.value = " asc";
	}

	document.form1.s_action.value = "go";
	document.form1.p_process.value = 'detailListPage';	
	document.form1.p_orderColumn.value = column;
	
	document.form1.submit();
}
-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post" action="/servlet/controller.off.OffGrseqAdminServlet">
  <input type="hidden" name="p_process"  value="">
  <input type="hidden" name="isTerm"	 value="true">
  <input type="hidden" name="p_addSubjSeq" id="p_addSubjSeq" value="0">
  <input type="hidden" name="p_addSeq" id="p_addSeq" value="0">
  <input type="hidden" id="lastSubjSeq" name="lastSubjSeq"	 value="0">
  <input type="hidden" id="p_subj"	name="p_subj"	 value="">
  <input type="hidden" name="p_subjnm"	value="">
  <input type="hidden" name="s_action"  value="">
  <input type="hidden" name="p_orderColumn">
  <input type="hidden" name="p_orderType" value="<%=v_orderType%>">
  <input type="hidden" id="u_year" name="u_year"  value="">
  <input type="hidden" id="u_totalterm" name="u_totalterm"  value="">
  <input type="hidden" id="u_subjseq" name="u_subjseq"  value="">
<table id="listForm" width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
	<td align="center" valign="top">
	  <!----------------- title ���� ----------------->
	  <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
		<tr> 
		  <td><img src="/images/admin/portal/s.1_off02.gif" ></td>
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
											<script type="text/javascript">
											var isFirst = 0;
											function fnSearchBox() {
												if(isFirst>1) 
												changes_subjcode(
														$("#s_year").val(),
														$("#s_upperclass").val(),
														$("#s_middleclass").val(),
														$("#s_lowerclass").val(),
														$("#s_year").val()
														);
												isFirst++;
											}
											function fnSearchBoxs_middleclass() {
												if(isFirst>1) 
												changes_lowerclass($("#s_upperclass").val(), $("#s_middleclass").val());
												isFirst++;
											}
											</script>
												<font color="red">��</font>���� <kocca_select:select name="s_year" sqlNum="off.year"  param=" "
													onChange="fnSearchBox();" attr=" " selectedValue="<%= ss_year %>" isLoad="true" all="none" />
												��з� <kocca_select:select name="s_upperclass" sqlNum="off.0002"  param=" "
													onChange="changes_middleclass(this.value);" attr=" " selectedValue="<%= ss_upperclass %>" isLoad="true" all="true" />
												�ߺз� <kocca_select:select name="s_middleclass" sqlNum="off.0003"  param="<%= ss_upperclass %>"
													onChange="changes_lowerclass(s_upperclass.value, this.value);"
													afterScript="fnSearchBoxs_middleclass"
													attr=" " selectedValue="<%= ss_middleclass %>" isLoad="true" all="true" />
												�Һз� <kocca_select:select name="s_lowerclass" sqlNum="off.0004"  param="<%= ss_upperclass %>"  param2="<%= ss_middleclass %>"
													afterScript="fnSearchBox"
													onChange="fnSearchBox()" attr=" " selectedValue="<%=ss_lowerclass %>" isLoad="true" all="true" />
											</td>
											<td rowspan=2 width="10%" align="right"><%@ include file="/learn/admin/include/za_GoButton.jsp" %><!-- whenSelection('go') --></td>
										</tr>
										<tr>
											<td>
												<%--�����⵵ <kocca_select:select name="s_subjyear" sqlNum="off.year.subj"  param=" "--%>
													<%--onChange="fnSearchBox()" attr=" " selectedValue="<%= ss_subjyear %>" isLoad="true" all="true" />--%>
												<font color="red">��</font>������ <kocca_select:select name="s_subjcode" sqlNum="off.subj.terms"
													param="<%= ss_year %>"  param2="<%= ss_upperclass %>"  param3="<%= ss_middleclass %>"  param4="<%= ss_lowerclass %>" param5="<%= ss_year %>"
													onChange="changes_subjseq($('#s_year').val(),this.value);setTimeout('change_subjseq()', 400);" attr=" " selectedValue="<%= ss_subj %>" isLoad="true" all="no" />
												���� <kocca_select:select name="s_subjseq" sqlNum="off.subjseq" param="<%= ss_year %>"  param2="<%= ss_subj %>"
													onChange="" attr=" " selectedValue="<%= ss_upperclass %>" isLoad="true" all="true" />
												�����˻� <input type="text" name="s_subjsearchkey" size="17" onkeypress="if(event.keyCode=='13') Main_subjcourse();" value="<%=s_subjsearchkey%>">
											</td>
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
	  <table id="insertButton" cellpadding="0" cellspacing="0" class="table1" <%= ss_subj.trim().length()>0?"":"style=\"display='none'\"" %>>
		<tr>
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
		  <td class="table_title"><a href="javascript:whenOrder('subjnm')" class="e">������</a></td>
		  <td class="table_title" width="34">����</td>
		  <td class="table_title"><a href="javascript:whenOrder('p_eduend')" class="e">�����Ⱓ</a></td>
		  <td class="table_title">�б�</td>
		</tr>
<%  if(ss_action.equals("go") && list!= null){	//go button ���ýø� list ���

	DataBox data = null;
	for (int i=0; i<list.size(); i++) {
		data  = (DataBox)list.get(i); 

%>
		<tr id="<%=data.get("d_subjnm")%>">
		  <td class="table_01"><%=String.valueOf(i+1)%></td>
		  <td class="table_01" ><%=data.get("d_subjnm")%></td>
		  <td class="table_02_1"><%=data.get("d_subjseq")%></td>
		  <td class="table_02_1"><%=data.getDate("d_edustart")%>~<%=data.getDate("d_eduend")%></td>
		  <td class="table_02_1"><a href="javascript:fnInsert('<%=data.get("d_subj")%>','<%=data.get("d_year")%>','<%=data.get("d_subjseq")%>','<%=data.get("d_totalterm")%>');" class='b'><%=data.get("d_termtotal")%></a></td>
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
