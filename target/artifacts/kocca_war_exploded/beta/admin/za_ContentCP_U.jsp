<%
//**********************************************************
//  1. ��      ��: ��ü ����-����(��Ÿ�׽�Ʈ�ý���)
//  2. ���α׷��� : za_ContentCP_U.jsp
//  3. ��      ��: ��ü ����-����(��Ÿ�׽�Ʈ�ý���)
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 12. 26
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.beta.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%

    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    String  v_pageno    = box.getString("p_pageno");

    String v_searchtext = box.getString("p_searchtext");
    String v_search     = box.getString("p_search");
    
    String v_betaseq = "", v_userid = "", v_usernm = "", v_betacpno = "", v_betacpnm = "";
    String v_homesite = "", v_address = "", v_email = "", v_tel = "", v_passwd = "";
    String v_compno1 = "", v_compno2 = "", v_compno3 = "";

    DataBox dbox = (DataBox)request.getAttribute("selectManager");
        v_betaseq   = dbox.getString("d_betaseq");
        v_userid    = dbox.getString("d_userid");
        v_usernm    = dbox.getString("d_usernm");
        v_passwd    = dbox.getString("d_pwd");
        v_betacpno  = dbox.getString("d_betacpno");
        v_betacpnm  = dbox.getString("d_betacpnm");
        v_homesite  = dbox.getString("d_homesite");
        v_address   = dbox.getString("d_address");
        v_email     = dbox.getString("d_email");
        v_tel       = dbox.getString("d_tel");
        
        
v_compno1 = v_betacpno.substring(0,3);
v_compno2 = v_betacpno.substring(3,5);
v_compno3 = v_betacpno.substring(5,10);
%>
<html>
<head>
<title>::: �������ڵ��� ���ձ��������ý��� :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

    function update_check() {
    var ff = document.form1;
        
        if (blankCheck(ff.p_betacpnm.value)) {
            alert("ȸ����� �Է��Ͻʽÿ�.");
            ff.p_betacpnmnm.focus();
            return;
        }
        if (blankCheck(ff.p_usernm.value)) {
            alert("����ڼ����� �Է��Ͻʽÿ�.");
            ff.p_usernm.focus();
            return;
        }
        if (blankCheck(ff.p_passwd.value)) {
            alert("��й�ȣ�� �Է��Ͻʽÿ�.");
            ff.p_passwd.focus();
            return;
        } else if (blankCheck(ff.p_passwd1.value)) {
            alert("��й�ȣ Ȯ���� �Է��Ͻʽÿ�.");
            ff.p_passwd1.focus();
            return;
        }
        if (document.form1.p_passwd.value != document.form1.p_passwd1.value ) {
            alert("��й�ȣ�� ���� ��ġ���� �ʽ��ϴ�.");
            document.form1.p_passwd.focus();
	        return;
	    }
        
        
        document.form1.action = "/servlet/controller.beta.ContentCPServlet";
        document.form1.p_process.value = "update";
        document.form1.submit();
    }

    function list() {
        document.form1.action = "/servlet/controller.beta.ContentCPServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
    }
    
    
    function moveFocus(num,fromform,toform)
    {
        var str = fromform.value.length;
        if(str == num)
       toform.focus();
    }
// ���ڸ� ���� �����.
    function onlyNumber()
    {
        if(((event.keyCode<48)||(event.keyCode>57)))
        event.returnValue=false;
    }
//-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<div id=minical OnClick="this.style.display='none';" oncontextmenu='return false' ondragstart='return false' onselectstart='return false' style="background : buttonface; margin: 5; margin-top: 2;border-top: 1 solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1 solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index: 99"></div>

<form name="form1" method="post">
    <input type = "hidden" name = "p_process"    value = "<%=v_process %>">
    <input type = "hidden" name = "p_pageno"     value = "<%=v_pageno%>">
    <input type = "hidden" name = "p_betaseq"    value = "<%=v_betaseq%>">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="665">
  <tr>
    <td align="center" valign="top"> 

      <!----------------- title ���� ----------------->
     <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/beta/b_title06.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
      <!----------------- ��ü��� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr width="20%"> 
                <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr>
                <td class="table_title">����ڵ�Ϲ�ȣ</td>
                <td class="table_02_2"><%=v_compno1%> - <%=v_compno2%> - <%=v_compno3%></td>
          </tr>
          <tr>
                <td class="table_title">ȸ���</td>
                <td class="table_02_2"><input type="text" name="p_betacpnm"  value="<%=v_betacpnm%>" size="20" maxlength="20"></td>
          </tr>
          <tr>
                <td class="table_title">�����ID</td>
                <td class="table_02_2"><%=v_userid%></td>
          </tr>
          <tr>
                <td class="table_title">����ڼ���</td>
                <td class="table_02_2"><input type="text" name="p_usernm" value="<%=v_usernm%>" size="10" maxlength="10"></td>
          </tr>
          <tr>
                <td class="table_title">��й�ȣ</td>
                <td class="table_02_2"><input type="password" name="p_passwd" value="<%=v_passwd%>" size="10" maxlength="10"></td>
          </tr>
          <tr>
                <td class="table_title">��й�ȣȮ��</td>
                <td class="table_02_2"><input type="password" name="p_passwd1" value="<%=v_passwd%>" size="10" maxlength="10"></td>
          </tr>
          <tr>
                <td class="table_title">Ȩ������</td>
                <td class="table_02_2"><input type="text" name="p_homesite"  value="<%=v_homesite%>" size="50" maxlength="50"></td>
          </tr>
          <tr>
                <td class="table_title">�ּ�</td>
                <td class="table_02_2"><input type="text" name="p_address" value="<%=v_address%>" size="70" maxlength="70"></td>
          </tr>
          <tr>
                <td class="table_title">E-mail</td>
                <td class="table_02_2"><input type="text" name="p_email" value="<%=v_email%>" size="30" maxlength="30"></td>
          </tr>
          <tr>
                <td class="table_title">����ó</td>
                <td class="table_02_2"><input type="text" name="p_tel" value="<%=v_tel%>" size="12" maxlength="12" OnKeypress="onlyNumber();"></td>
          </tr>
	    </table>
        <!----------------- ��ü��� �� ----------------->
        <br>
        <!----------------- ����, ��� ��ư ���� ----------------->
        <table border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center"><a href='javascript:update_check()'><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
			<td width=8></td>
            <td align="center"><a href='javascript:list()'><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
          </tr>
        </table>
        <!----------------- ����, ��� ��ư �� ----------------->
    </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
