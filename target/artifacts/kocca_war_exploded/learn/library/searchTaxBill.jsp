<%
//**********************************************************
//  1. ��	  ��: ��꼭 �˻� ����Ʈ
//  2. ���α׷��� : searchUser.jsp
//  3. ��	  ��: ��꼭 �˻� ����Ʈ(�˾�)
//  4. ȯ	  ��: JDK 1.5
//  5. ��	  ��: 1.0
//  6. ��	  ��: swchoi
//  7. ��	  ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>


<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
	String  v_process   = box.getString("p_process");

	ArrayList list = (ArrayList)request.getAttribute("selectList");

%>
<html>
<head>
<title>�� ��꼭 �˻� ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<SCRIPT LANGUAGE = "JAVASCRIPT" SRC = "/script/cresys_lib.js"></SCRIPT>
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function init() {
//		this.moveTo(0,0);
//		this.resizeTo(575,485);
	}

	function selectTaxBill(data) {
		opener.returnTaxBill(data);
		self.close();
	}

	function enter(e) {
		if (e.keyCode =='13'){
			search();
		}
	}

	function whenSelection() {
		search();
	}
	function search() {
		 document.form1.action = "/servlet/controller.library.SearchServlet";
		 document.form1.p_process.value = "taxBill";
		 document.form1.submit();
	}
//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" onLoad='init();'>

	  
<form name = "form1" method = "post">
	<input type = "hidden" name = "p_process" value = "<%= v_process %>">

<table width="532" border="0" cellpadding="0" cellspacing="10" bgcolor="#f7f7f7">


  <tr>
	<td><table width="530" height="435" border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
		<tr>
		  <td align="center" valign='top' bgcolor="#FFFFFF">
		  <!----------------- title ���� ----------------->
	  <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
		<tr> 
			
		  <td><img src="../../images/admin/course/tit_memsearch.gif"></td>
		  <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
		</tr>
	  </table>
	  <br>
			<table width="510" height="26" border="0" cellpadding="0" cellspacing="0">
			  <tr>
				<td height="10"></td>
			  </tr>
			  <tr>
				<td>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
				  <script type="text/javascript">
					var startup = 0;
					function Main_s_subjseq(){
						if (startup > 0)
							changes_grseq($("#s_grcode").val(), $("#s_gyear").val());
						startup++;
					}
					</script>
					<!------------------- ���ǰ˻� ���� ------------------------->
					&nbsp;<font color="red">��</font>
						 �����׷� <kocca_select:select name="s_grcode" sqlNum="course.0001"  param=" "
					onChange="changes_gyear(this.value);" attr=" " selectedValue='<%= box.getString("s_grcode") %>' isLoad="true" all="false" />
					</td>
					<td>����</td>
					<td><kocca_select:select name="s_gyear" sqlNum="course.year"  param='<%= box.getString("s_grcode") %>'
							onChange="changes_grseq(s_grcode.value, this.value);" afterScript="Main_s_subjseq" attr=" " selectedValue='<%= box.getString("s_gyear") %>' isLoad="true" all="none" />	</td>
					<td>��������</td><td><kocca_select:select name="s_grseq" sqlNum="course.subjseq"
							param='<%= box.getString("s_grcode") %>' param2='<%= box.getString("s_gyear") %>'
							attr=" style='width:130px;'" onChange="search()" selectedValue='<%= box.getString("s_grseq") %>' isLoad="true" all="true" />
					</td></tr><tr>
					<td>&nbsp;&nbsp;<b>������</b><input type="text" name="p_searchtext" value="<%= box.getString("p_searchtext") %>"/><a href="javascript:search()"><img src="/images/admin/button/search3_butt.gif" border="0"></a></td>
				</tr>
			</table>
			<table width="510" border="0" cellspacing="1" cellpadding="0">
			  <tr>
				<td colspan="7" class="table_top_line"></td>
			  </tr>
			  <tr>
				<td width="5%" height="26" class="table_title">&nbsp;</td>
				<td width="5%" class="table_title"><b>NO</b></td>
				<td width="18%" class="table_title"><b>ID</b></td>
				<td width="18%" class="table_title"><b>����</b></td>
				<td width="31%" class="table_title"><b>email</b></td>
				<td width="23%" class="table_title"><b>��ȭ��ȣ</b></td>
			  </tr>
<%
		 int i = 0;;

			for(i = 0; i < list.size(); i++) {

				DataBox data = (DataBox) list.get(i);

%>
			  <tr>
				<td height="26" class="table_01"> <input type="radio" name="no" value="<%=data.getFromDBTypeString("tid")%>" onClick='javascipt:selectTaxBill(<%=data.getAll()%>)'></td>
				<td class="table_02_1"><%=(i+1)%></td>
				<td class="table_02_1"><%=data.getFromDBTypeString("GRSEQNM")%></td>
				<td class="table_02_1"><%=data.getFromDBTypeString("GOODNAME")%></td>
				<td class="table_02_1"><%=data.getFromDBTypeString("PRICE")%></td>
				<td class="table_02_1"><%=data.getFromDBTypeString("USERNM")%></td>
			  </tr>
<%
		  }
%>
			<% if(i == 0){ %>
			  <tr>
				<td height='40' colspan="7" class="table_02_1">�˻��� ��꼭�� �����ϴ�</td>
			  </tr>
			<% } %>
			</table>

			<table width="510" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td align="right" style="padding-top=10"><a href='javascript:self.close()'><img src="/images/admin/button/btn_close.gif"  border=0></a></td>
			  </tr>
			</table>
		  </td>
		</tr>
	  </table>
</td>
</tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
