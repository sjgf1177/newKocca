<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
//**********************************************************
//  1. ��      ��: ������û ��� ��û
//  2. ���α׷���: gu_ProposeCancelApply_I.jsp
//  3. ��      ��: ������û ��� ��û
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.12.15
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.research.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

	String v_tid		= box.getString("p_tid");
	String v_paymethod	= box.getString("p_paymethod");

    String	v_subj		= "";
    String	v_subjnm	= "";
    String	v_subjnms	= "";

    String v_userid = box.getSession("userid");
    
    ArrayList list1     = null;
    list1 = (ArrayList)request.getAttribute("SubjnmList");
    
	for(int i = 0; i < list1.size(); i++)
	{
		DataBox dbox = (DataBox)list1.get(i);
	   
		v_subjnm	= dbox.getString("d_subjnm");

		v_subjnms	+= v_subjnm;
		
		if (i != list1.size() - 1) {
			v_subjnms += " ,";
		}

	}
	
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>������û ��ҿ�û</title>
<link rel="stylesheet" type="text/css" href="/css/portal/base.css" />
<script type="text/javascript" src="/script/portal/common.js"></script>
<script type="text/javascript" src="/script/cresys_lib.js"></script>
</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
function cancelApply() {

	<% if ( "FreePay|BankBook|VCard|Card".indexOf(v_paymethod) < 0 ) { %>
    if (blankCheck(document.all.p_refundbank.value)) {
        alert("������� �Է��ϼ���!");
        document.all.p_refundbank.focus();
        return;
    }                
    if (blankCheck(document.all.p_refundaccount.value)) {
        alert("���¹�ȣ�� �Է��ϼ���!");
        document.all.p_refundaccount.focus();
        return;
    }                
    if (blankCheck(document.all.p_refundname.value)) {
        alert("�����ָ� �Է��ϼ���!");
        document.all.p_refundname.focus();
        return;
    }
    <% } %>
    if (blankCheck(document.all.p_cancelreason.value)) {
        alert("��һ����� �Է��ϼ���!");
        document.all.p_cancelreason.focus();
        return;
    }                
	
	if(confirm('������û�� ��� �Ͻðڽ��ϱ�?')){
	    document.form2.action = "/servlet/controller.study.MyClassServlet";
		document.form2.p_process.value = "ProposeCancelApply";
		document.form2.submit();
	}
}
-->
</SCRIPT>
<body id="popup"><!-- popup size : 550* -->
<form name="form2" method="post" action="/servlet/controller.research.SulmunCommonUserServlet">
    <input type="hidden" name="p_tid"    	value="<%= v_tid %>">
    <input type="hidden" name="p_process"  	value="ProposeCancelApply">
	<div id="pop_header">
		<h1><img src="/images/portal/myclass/pop_h1_tit3.gif" alt="������û ��ҿ�û" /></h1>
	</div>
	<div id="pop_container">
		<div id="contentwrap" class="message_top">
			<p class="pop_txt_q"><span class="ac"><%= v_subjnms %> </span> ������ <strong>������û ��ҿ�û</strong> �Ͻðڽ��ϱ�? <br />ȯ�Ұ��� �� ��һ����� �Է����ּ���</p>
			<table class="view">
			<colgroup><col width="25%" /><col width="75%" /></colgroup>
			<% if ( "FreePay|BankBook|VCard|Card".indexOf(v_paymethod) < 0 )  { %>
			<tr>
				<th>�����</th>
				<td class="end"><input type="text" name="p_refundbank" class="inbox" style="width:99%;" /></td>
			</tr>
			<tr>
				<th>���¹�ȣ</th>
				<td class="end"><input type="text" name="p_refundaccount" class="inbox" style="width:99%;" /></td>
			</tr>
			<tr>
				<th>������</th>
				<td class="end"><input type="text" name="p_refundname" class="inbox" style="width:99%;" /></td>
			</tr>
			<% } else { %>
				<input type="hidden" name="p_refundbank" value="" />
				<input type="hidden" name="p_refundaccount" value="" />
				<input type="hidden" name="p_refundname" value="" />
			<% } %>
			<tr>
				<th class="va_t">��һ���</th>
				<td class="in end"><textarea name="p_cancelreason" style="width:99%; height:60px;"></textarea></td>
			</tr>
			</table>
		</div>
	</div>
	<div id="pop_footer">
		<p class="f_btn"><a href="javascript:cancelApply()" class="btn_gr"><span>Ȯ��</span></a><a href="javascript:window.close()" class="btn_gr"><span>���</span></a></p>
	</div>
</form>
</body>
</html>

