<%
//**********************************************************
//  1. ��	��: �԰� FileToDB
//  2. ���α׷��� : za_BatchFileToDB_P.jsp
//  3. ��	��: �԰� FileToDB ���
//  4. ȯ	��: JDK 1.3
//  5. ��	��: 0.1
//  6. ��	��: ��â�� 2004.11.20
//  7. ��	��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "jxl.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.complete.FinishBean" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");

%>
<html>
<head>
<title>�԰�FileToDB</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
function golistPage() {
  document.form1.action = "/servlet/controller.propose.AcceptServlet";
  document.form1.p_process.value = "proposeFileToDB";
  document.form1.submit();
}
//-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post" >
  <input type="hidden" name="p_process" value="">
  <input type="hidden" name="s_year"  value="<%=box.get("s_year")%>">
  <input type="hidden" name="s_upperclass"  value="<%=box.get("s_upperclass")%>">
  <input type="hidden" name="s_middleclass"  value="<%=box.get("s_middleclass")%>">
  <input type="hidden" name="s_lowerclass"  value="<%=box.get("s_lowerclass")%>">
  <input type="hidden" name="s_subjcode"  value="<%=box.get("s_subjcode")%>">
  <input type="hidden" name="s_subjseq"  value="<%=box.get("s_subjseq")%>">
</form>
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
	<td align="center" valign="top">
			<!----------------- title ����----------------->
		<table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
		<tr>
		<td><img src="/images/admin/propose/p_title06.gif" ></td>
		<td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
		</tr>
	</table>
	<!----------------- title �� ----------------->
	<br>
	<br>

	<!----------------- ������������ ----------------->
	<table cellspacing="0" cellpadding="1" class="form_table_out">
		<tr>
		<td bgcolor="#C6C6C6" align="center">
			<table cellspacing="0" cellpadding="0" class="form_table_bg" >
			<tr>
				<td height="15"></td>
			</tr>
			<tr>
				<td align="center" valign="middle">
				<table cellspacing="0" cellpadding="0" width="99%" class="form_table">
					<tr>
					<td>
						<b><font size="3">
							&nbsp;&nbsp;�⵵:<%=box.get("s_year")%>
							&nbsp;&nbsp;&nbsp;&nbsp;����:<%=box.get("s_subjnm")%>
							&nbsp;&nbsp;&nbsp;&nbsp;����:<%=box.get("s_subjseq")%>
							</font></b>
					</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td height="15"></td>
			</tr>
			</table>
		</td>
		</tr>
	</table>
	<br><br>
	<br>
	<!---------------------------------------------------------------------------->

<%

%>

	<!----------------- ������� ���� ----------------->

	<table>
		<tr>
		<td>
			<font color=red>ERROR�Ǽ��� 1���̻� �߻��ϸ� �ϰ�ó���� �ڵ���ҵ˴ϴ�.</font>
		</td>
		</tr>
	</table>

	<table cellspacing="1" cellpadding="5" class="table_out">
		<tr>
			<td colspan="15" class="table_top_line"></td>
		</tr>
		<tr>
			<td class="table_title" colspan="8">ERROR : <%=errcnt%>��</td>
		</tr>
		<tr>
			<td class="table_title" width="10%">�ٹ�ȣ</td>
			<td class="table_title" width="20%">���</td>
			<td class="table_title" width="15%">�Է�����</td>
			<td class="table_title" >MESSAGE</td>
		</tr>
		<%
			if(errcnt != 0){
			out.print(v_errString);
			}else{
		%>
			<tr>
			<td class="table_02_1" colspan="8">�˻��� Error�� �����ϴ�.</td>
		</tr>
			<%}%>
		</tr>
	</table>
	<!----------------- ��� ���� ��� �� ----------------->
	<BR><BR>
	<!----------------- ������� ���� ----------------->
	<table cellspacing="1" cellpadding="5" class="table_out">
		<tr>
			<td colspan="15" class="table_top_line"></td>
		</tr>
		<tr>
			<td class="table_title" colspan="8">�����Է�</td>
		</tr>
		<tr>
			<td class="table_title" width="10%">�ٹ�ȣ</td>
			<td class="table_title" width="20%">���</td>
			<td class="table_title" width="15%">�Է�����</td>
			<td class="table_title" >MESSAGE</td>
		</tr>
		<%=v_okString%>
	</table>
	<!----------------- ��� ���� ��� �� ----------------->
	<br>
	<br>
	<!----------------- �����޼��� ���� ----------------->
	<table>
		<tr>
		<td>
			<font color=blue><b>(������� Error)<b></font>
		</td>
		</tr>
		<tr>
		<td>
			<font color=red>1. ���� ALL������ ������ �Է����� ������� Erroró�� �˴ϴ�.</font><br>
		</td>
		</tr>
		<tr>
		<td>
			<font color=red>&nbsp;&nbsp;-->�����Է��� �ٽ� �õ��Ͽ� �ֽʽÿ�.</font><br>
		</td>
		</tr>
		<tr>
		<td>
			<font color=red>2. ������Ŀ� ������ �ʴ� ���ڳ� ��ȣ�� �� ���� �� �ֽ��ϴ�.</font><br>
		</td>
		</tr>
		<tr>
		<td>
			<font color=red>&nbsp;&nbsp;--> �Է��� ����<b>(���,����,����)</b>�� �����ϰ� ����<b>[Ctrl+C]</b>�� ������������ ���� �ٿ��ֱ�<b>[Ctrl+V]</b>�� �Ͽ� <br>
							&nbsp;&nbsp;&nbsp;&nbsp;���̸����� �������� �ٽýõ� �Ͽ� �ֽʽÿ�.</font><br>
		</td>
		</tr>
	</table>
	<br>
	<!----------------- ���, �̸����� ��ư ���� ----------------->
	<table width="97%" border="0" cellpadding="0" cellspacing="0">
		<tr>
		<td align="center" ><a href="javascript:golistPage()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
		</tr>
	</table>
	<!----------------- ���, �̸����� ��ư �� ----------------->
	<br>
	<br>
	</td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>