<%
/**
 * file name : za_ClassifySubject_I.jsp
 * date	  : 2003/07/07
 * programmer:
 * function  : �����з��ڵ� ���ȭ��
 */
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
	RequestBox box = null;
	box = (RequestBox)request.getAttribute("requestbox");
	
	String  v_classtype   = box.getStringDefault("p_classtype",  "upper");
	String  v_upperclass  = box.getStringDefault("p_upperclass", "U001");
	String  v_middleclass = box.getStringDefault("p_middleclass","M001");
	String  v_classcode   = box.getString("p_classcode");
	String  v_classname   = box.getString("p_classname");
%>
<html>
<head><title>�����з����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language="javascript">
<!--
  function  whenInsert(){
	//��ȿ�� �˻�
	//�з��ڵ�� 3�ڸ��̾�� �ϸ� �ҹ��ڴ� �빮�ڷ� �����Ѵ�.
	if (document.form1.p_classcode.value=="") {
		alert("�з��ڵ带 �Է��ϼ���.");
		document.form1.p_classcode.focus();
		return;
	}
	
	if (document.form1.p_classcode.value.length!=3) {
		alert("�з��ڵ�� 3�ڸ��� �Է°����մϴ�.");
		document.form1.p_classcode.focus();
		return;
	}
	
	//����/���� üũ
	var v_pattern = /[^(a-zA-Z0-9)]/;
	if (v_pattern.test(document.form1.p_classcode.value)) {
		alert("�з��ڵ�� ������ ���ڸ� �Է°����մϴ�.");
		document.form1.p_classcode.focus();
		return;
	}
	
	if (document.form1.p_classname.value=="") {
		alert("�з���Ī�� �Է��ϼ���.");
		document.form1.p_classname.focus();
		return;
	}
	
	//�빮�ڷ� ����
	document.form1.p_classcode.value = document.form1.p_classcode.value.toUpperCase();
	document.form1.p_process.value = "insert";
	document.form1.submit();
  }
  



  function changeUpperclass() {
	document.form1.p_process.value = "insertPage";
	document.form1.submit();
  }
  
  function viewSubjectClass(p_upperlay, p_middlelay, p_type) {
		if (p_type == 'upper') {
			document.all[p_upperlay].style.visibility  = "hidden";
			document.all[p_middlelay].style.visibility = "hidden";
		} else if (p_type == 'middle') {
			document.all[p_upperlay].style.visibility  = "visible";
			document.all[p_middlelay].style.visibility = "hidden";
		} else if (p_type == 'lower') {
			document.all[p_upperlay].style.visibility  = "visible";
			document.all[p_middlelay].style.visibility = "visible";
		}
  }
-->
</script>
</head>
<body topmargin="0" leftmargin="0" bgcolor="#ffffff">
<form name="form1" method="post" action="/servlet/controller.off.OffClassifySubjectServlet">
			  <input type="hidden" name="p_process"	 value="">
<table width="552" height="337" border="0" cellpadding="0" cellspacing="10" bgcolor="#f7f7f7">
  <tr>
	<td height="251" valign=top>
	  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
		<tr>
		  <td align="center" bgcolor="#FFFFFF">
			<!----------------- title ���� ----------------->
	  <table width="95%" border="0" cellspacing="0" cellpadding="0" class=page_title>
		<tr> 
          <td><img src="/images/admin/portal/s.1_off11.gif" ></td>
		  <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
		</tr>
	  </table>
			<!----------------- title �� ----------------->
			<br>
			<!----------------- �����з� ��� ���� ----------------->
			<table cellspacing="1" cellpadding="5" class="table_out">
			  <tr>
				<td class="table_top_line"></td>
			  </tr>
			  <tr>
				<td width="8%" height="26" class="table_02_1">* ��� �ڵ�Ÿ��<br>
				  <input type="radio" name="p_classtype" value="upper" <%=(v_classtype.equals("upper") ? "checked" : "")%> onClick="viewSubjectClass('upperclasslay', 'middleclasslay', 'upper')">
				  ��з��ڵ�
				  <input type="radio" name="p_classtype" value="middle" <%=(v_classtype.equals("middle") ? "checked" : "")%> onClick="viewSubjectClass('upperclasslay', 'middleclasslay', 'middle')">
				  �ߺз��ڵ�
				  <input type="radio" name="p_classtype" value="lower" <%=(v_classtype.equals("lower") ? "checked" : "")%> onClick="viewSubjectClass('upperclasslay', 'middleclasslay', 'lower')">
				  �Һз��ڵ�</td>
			  </tr>
			  <tr>
				<td height="26" class="table_02_1">
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
					<SPAN ID="upperclasslay" style="visibility:<%=(v_classtype.equals("upper") ? "hidden" : "visible")%>;">
						* ��з� <kocca_select:select name="p_upperclass" sqlNum="off.0002"  param=" "
						onChange="changep_middleclass(this.value);" attr=" " selectedValue="<%= v_upperclass %>" isLoad="true" all="no" /></SPAN>
					<SPAN ID="middleclasslay" style="visibility:<%=(v_classtype.equals("lower") ? "visible" : "hidden")%>;">
				  		* �ߺз�<kocca_select:select name="p_middleclass" sqlNum="off.0003"  param="<%= v_upperclass %>"
						attr=" " selectedValue="<%= v_middleclass %>" isLoad="true" all="no" /> </span>
				</td>
			  </tr>
			  <tr>
				<td height="26" class="table_02_1">
				  <table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
					  <td>* �з��ڵ� : <input type="text" class="input" name="p_classcode" size=3 maxlength=3 value="<%=v_classcode%>"></td>
					</tr>
					<tr>
					  <td height="8"></td>
					</tr>
					<tr>
					  <td>* �з��ڵ�� : <input type="text" class="input" name="p_classname" size=20 maxlength=50 value="<%=v_classname%>"></td>
					</tr>
				  </table>
				</td>
			  </tr>
			</table>
			<!----------------- �����з� ��� �� ----------------->
			<!----------------- ���, �ݱ� ��ư ���� ----------------->
			<table width="95%" border="0" cellspacing="0" cellpadding="0">
			  <tr> 
				<td height=6 colspan="2"></td>
				<td width="304" height=6></td>
				<td height=6></td>
			  </tr>
			  <tr> 
				<td colspan="4" align="right"><a href="javascript:whenInsert()"><img src="/images/admin/button/btn_apply.gif" border="0"></a>&nbsp;&nbsp;<a href="javascript:window.close()"><img src="/images/admin/button/btn_close.gif" border="0"></a></td>
			  </tr>
			  <tr> 
				<td height="20" colspan="4" align="left"> <br> <b>[�з��ڵ� �������]</b> 
				</td>
			  </tr>
			  <tr> 
				<td width="84" height="20" align="left">��з�</td>
				<td height="20" colspan="3" align="left">�з��ڵ� ���̴� �� 3�ڸ��� ����+������ �������� ����.</td>
			  </tr>
			  <tr> 
				<td height="20" align="left">�ߺз�</td>
				<td height="20" colspan="3" align="left">���ڸ� �Ϸù�ȣ�� ����.</td>
			  </tr>
			  <tr> 
				<td height="20" align="left">�Һз�</td>
				<td height="20" colspan="3" align="left">���ڸ� �Ϸù�ȣ�� ����.</td>
			  </tr>
			  <tr> 
				<td height="20" align="left">&nbsp;</td>
				<td height="20" colspan="3" align="left">&nbsp;</td>
			  </tr>
			  <tr> 
				<td height="20" colspan="4" align="left"><b>��)</b></td>
			  </tr>
			  <tr> 
				<td height="20" align="left">��з�</td>
				<td height="20" colspan="3" align="left">K01 : ��ȭ������ , G01 : ���Ӿ�ī����</td>
			  </tr>
			  <tr> 
				<td height="20" align="left">�ߺз�</td>
				<td height="20" colspan="3" align="left">001,002,003,...,</td>
			  </tr>
			  <tr> 
				<td height="20" align="left">�Һз�</td>
				<td height="20" colspan="3" align="left">001,002,003,...,</td>
			  </tr>
			</table>
			<!----------------- ���, �ݱ� ��ư �� ----------------->
			<br>
		  </td>
		</tr>
	  </table>
	</td>
  </tr>

  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>	 

</table>
</form>
</body>
</html>