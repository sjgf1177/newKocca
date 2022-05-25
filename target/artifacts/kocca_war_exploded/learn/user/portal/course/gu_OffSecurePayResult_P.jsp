<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
//**********************************************************
//  1. ��      ��: �������� ���� ���
//  2. ���α׷���: gu_OffPayCheck_P.jsp
//  3. ��      ��: �������� ���� ���
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2010.01.19
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process = box.getString("p_process");

    String v_tid         = "";
    String v_cardnumber  = "";
    String v_pgauthdate  = "";
    String v_pgauthtime  = "";
    String v_paymethod   = "";
    String v_authcode    = "";
    
    ArrayList list = (ArrayList)request.getAttribute("offsecurepayInfo");

    if (list.size() > 0) {
        DataBox dbox   = (DataBox)list.get(0);
        v_tid          = dbox.getString("d_tid");
        v_pgauthdate   = dbox.getString("d_pgauthdate");
        v_pgauthdate   = FormatDate.getFormatDate(v_pgauthdate,"yyyy.MM.dd");
        v_pgauthtime   = dbox.getString("d_pgauthtime");
        v_pgauthtime   = FormatDate.getFormatTime(v_pgauthtime,"HH:mm");
        v_cardnumber   = dbox.getString("d_cardnumber");
        v_paymethod    = dbox.getString("d_paymethod");
        v_authcode     = dbox.getString("d_authcode");
    }
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>�����Ϸ�</title>
<link rel="stylesheet" type="text/css" href="/css/portal/base.css" />
<script type="text/javascript" src="/script/portal/common.js"></script>
</head>
<body id="popup"><!-- popup size : 752* -->
	<div id="pop_header">
		<h1><img src="/images/portal/popup/myclass_h1_tit2.gif" alt="�����Ϸ�" /></h1>
	</div>
	<div id="pop_container">
		<div id="contentwrap" class="message_top">
			<ul class="basket_tab">
				<li><img src="/images/portal/myclass/basket_off_tab1_off.gif" alt="��������Ȯ��" /></li>
				<li><img src="/images/portal/myclass/basket_off_tab2_on.gif" alt="�����Ϸ�" /></li>
			</ul>
			
			<div class="message_wrap bo_bn pd_t45 pd_bn">
				<img src="/images/portal/myclass/basket_message2.gif" alt="������ ������û�� �����Ǿ����ϴ�." />
				<p class="message_comment"><img src="/images/portal/ico/ico_comment_arrow.gif" alt="" />������û�Ͻ� ������ <strong>���� ���ǽ� > ������ûȮ��/���</strong>���� Ȯ���Ͻ� �� �ֽ��ϴ�.</p>
			</div>
			
			<h3><img src="/images/portal/myclass/stit_basket7.gif" alt="��������" /></h3>
			<table class="view_myclass">
			<colgroup><col width="18%" /><col width="82%" /></colgroup>
			<tr>
				<th>�������</th>
				<td class="txt end">�ſ�ī��  </td>
			</tr>
			<tr>
				<th>�ſ�ī���ȣ</th>
				<td class="txt end"><%= v_cardnumber %></td>
			</tr>
			<tr>
				<th>���γ�¥</th>
				<td class="txt end"><%= v_pgauthdate %></td>
			</tr>
			<tr>
				<th>���νð�</th>
				<td class="txt end"><%= v_pgauthtime %></td>
			</tr>
			<tr>
				<th>���ι�ȣ</th>
				<td class="txt end"><%= v_authcode %></td>
			</tr>
			</table>
 
			<div class="message_comment_list">
				<p class="tit">�ſ�ī�� �����ȳ�</p>
				<p class="message_comment"><img src="/images/portal/ico/ico_comment_arrow.gif" alt="" />�ſ�ī�� û������ "�̴Ͻý�(inicis.com)"���� ǥ��˴ϴ�.</p>
				<p class="message_comment"><img src="/images/portal/ico/ico_comment_arrow.gif" alt="" />LGī�� �� BCī���� ��� "�̴Ͻý�(�̿� ������)"���� ǥ��ǰ�, �Ｚī���� ��� "�̴Ͻý�(�̿���� URL)"�� ǥ��˴ϴ�.</p>
			</div>
 
			<div class="message_comment_list">
				<p class="tit">������ü �����ȳ�</p>
				<p class="message_comment"><img src="/images/portal/ico/ico_comment_arrow.gif" alt="" />������ ���忡�� "�̴Ͻý�"�� ǥ��˴ϴ�.</p>
			</div>
		</div>
	</div>
	<div id="pop_footer">
		<p class="f_btn"><a href="javascript:top.window.close()" class="btn_gr"><span>�ݱ�</span></a></p>
	</div>
<form name="form1" method="post">
	<input type="hidden" name="p_process" value="MyOffClassBillListPage"/>
</form>

<script language = "javascript">
<!--
	top.window.opener.location.reload(top.window.opener.location.href);
	//document.form1.target = top.window.opener.name;
	//document.form1.action = "/servlet/controller.study.MyClassBillServlet"; 
	//document.form1.submit();
//-->
</script>
</body>
</html>