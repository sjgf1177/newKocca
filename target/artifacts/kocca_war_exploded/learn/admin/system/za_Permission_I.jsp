<%
//**********************************************************
//  1. ��      ��: ���� ����
//  2. ���α׷��� : za_Permission_I.jsp
//  3. ��      ��: ���Ѱ��� ���
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 11. 10
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%

    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    String  v_pageno    = box.getString("p_pageno");

    String v_searchtext = box.getString("p_searchtext");
    String v_search     = box.getString("p_search");
    String ss_gadmin    = box.getStringDefault("s_gadmin","ALL");       //gadmin

%>

<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

    function insert_check() {

        if (document.form1.p_gadminnm.value == "" ) {
            alert("�߰����Ѹ��� �Է��ϼ���");
            return;
        }

        document.form1.action = "/servlet/controller.system.PermissionServlet";
        document.form1.p_process.value = "insert";
        document.form1.submit();
    }

    function list() {
        document.form1.action = "/servlet/controller.system.PermissionServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
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
    <input type = "hidden" name = "p_process"    value = "<%= v_process %>">
    <input type = "hidden" name = "p_pageno"     value = "<%=v_pageno%>">
    <input type = "hidden" name = "s_gadmin"     value = "<%=ss_gadmin%>">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="665">
  <tr>
    <td align="center" valign="top"> 

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/system/unite_title03.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
      <!----------------- ���ѵ�� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="4" class="table_top_line"></td>
          </tr>
          <!------------------------  ���Ѻз� ���� ---------------------->
          <tr>
            <td class="table_title"><strong>����(�⺻)</strong></td>
            <td height="25" class="table_02_2" colspan="3">
               <%= GadminAdminBean.getGadminSelectTop("p_gadminsel","") %>
            </td>
          </tr>
          <!------------------------  ���Ѻз� ��   ---------------------->
          <tr> 
            <td width="15%" class="table_title"><strong>�߰� ���Ѹ�</strong></td>
            <td width="45%" height="25" class="table_02_2"><input type="text" name="p_gadminnm" size="50" maxlength="50"></td>
            <td width="15%" class="table_title"><strong>���� ����</strong></td>
            <td width="25%" class="table_02_2"><input type="text" name="p_gadminseq" size="2" maxlength="2" OnKeypress="onlyNumber();">
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>���� ��� �뵵</strong></td>
            <td height="25" class="table_02_2" colspan="3"><input type="text" name="p_comments" size="100" maxlength="100"></td>
          </tr>
	       </table>
        <!----------------- ���ѵ�� �� ----------------->
        <br>
        <!----------------- ����, ��� ��ư ���� ----------------->
        <table border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center"><a href='javascript:insert_check()'><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
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
