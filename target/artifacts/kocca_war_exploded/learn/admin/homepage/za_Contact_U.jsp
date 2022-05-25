<%
//**********************************************************
//  1. ��      ��: ��ڿ��� ����Ʈ
//  2. ���α׷��� : za_Contact_U.jsp
//  3. ��      ��: ��ڿ��� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 8
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%

    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process     = box.getString("p_process");
    String  v_searchtext  = box.getString("p_searchtext");
    String  v_search      = box.getString("p_search");
    int  v_pageno         = box.getInt("p_pageno");

    int v_seq    = box.getInt("p_seq");

    String  v_addate     = "";
    String  v_queid      = "";
    String  v_quetitle   = "";
    String  v_quecontent = "";
    String  v_ansid      = "";
    String  v_anstitle   = "";
    String  v_anscontent = "";
    String  v_ismail     = "";

    String  v_cono       = "";
    String  v_name       = "";
    String  v_email      = "";
    String  v_jikwinm    = "";
    String  v_compnm     = "";

    ContactData data = (ContactData)request.getAttribute("selectContact");

    v_seq        = data.getSeq();
    v_addate     = data.getAddate();
    v_addate     = FormatDate.getFormatDate(v_addate,"yyyy/MM/dd HH")+"��";
    v_queid      = data.getQueid();
    v_quetitle   = data.getQuetitle();
    v_quecontent = data.getQuecontent();
    v_ansid      = data.getAnsid();
    v_anstitle   = data.getAnstitle();
    v_anscontent = data.getAnscontent();
    v_ismail     = data.getIsmail();

    v_cono       = data.getCono();
    v_name       = data.getName();
    v_email      = data.getEmail();
    v_jikwinm    = data.getJikwinm();
    v_compnm     = data.getCompnm();

    v_quecontent  = StringManager.replace(v_quecontent, "\n","<br>");
    v_anstitle    = StringManager.replace(v_anstitle,"`","'");

%>
<html>
<head>
<title>eIBIs</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function insert_check() {
        if (blankCheck(document.form1.p_anstitle.value)) {
            alert("������ �Է��ϼ���!");
            document.form1.p_anstitle.focus();
            return;
        }
        if (realsize(document.form1.p_anstitle.value) > 200) {
            alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_anstitle.focus();
            return;
        }
        if (blankCheck(document.form1.p_anscontent.value)) {
            alert("������ �Է��ϼ���!");
            document.form1.p_anscontent.focus();
            return;
        }
        document.form1.action = "/servlet/controller.homepage.ContactAdminServlet";
        document.form1.p_process.value = "update";
        document.form1.submit();
    }

    function list() {
        document.form1.action = "/servlet/controller.homepage.ContactAdminServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
    }

    function delete_contact() {
        document.form1.p_searchtext.value = "";
        document.form1.p_search.value     = "";
        document.form1.action = "/servlet/controller.homepage.ContactAdminServlet";
        document.form1.p_process.value = "delete";
        document.form1.submit();
    }

//-->
</SCRIPT>
</head>




<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type = "hidden" name = "p_process"    value = "<%= v_process %>">
    <input type = "hidden" name = "p_searchtext" value='<%=v_searchtext%>'>
    <input type = "hidden" name = "p_search"     value='<%=v_search%>'>
    <input type = "hidden" name = "p_pageno"     value='<%=v_pageno%>'>
    <input type = "hidden" name = "p_seq"        value='<%=v_seq%>'>

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="665">
  <tr>
      <td align="center" valign="top"> 
        <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
          <tr> 
            <td><img src="../../../images/admin/homepage/h_title03.gif"></td>
            <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
          </tr>
        </table>
        <!----------------- title �� ----------------->


        <br>
        <br>
        <!----------------- ��ڿ��� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="18%" height="25" class="table_title"><b>�Ҽ�</b></td>
            <td class="table_02_2" width="79%"><%=v_compnm%></td>
          </tr>
          <tr>
            <td class="table_title" height="25"><b>����</b></td>
            <td class="table_02_2"><%=v_jikwinm%></td>
          </tr>
          <tr>
            <td height="25" class="table_title"><b>ID</b></td>
            <td class="table_02_2"><%=v_queid%></td>
          </tr>
          <tr>
            <td class="table_title" height="25"><b>���</b></td>
            <td class="table_02_2"><%=v_cono%></td>
          </tr>
          <tr>
            <td height="25" class="table_title"><b>����</b></td>
            <td class="table_02_2"><%=v_name%></td>
          </tr>
          <tr>
            <td height="25" class="table_title"><b>�ۼ���</b></td>
            <td class="table_02_2"><%=v_addate%></td>
          </tr>
          <tr>
            <td height="25" class="table_title"><b>����</b></td>
            <td class="table_02_2"><%=v_quetitle%></td>
          </tr>
          <tr>
            <td height="25" class="table_title"><b>����</b></td>
            <td class="table_02_2"><%=v_quecontent%></td>
          </tr>
          <tr>
            <td height="25" class="table_title"><b>�亯 ����</b></td>
            <td class="table_02_2">
              <input name="p_anstitle" type="text" class="input" size="117" value=`<%=v_anstitle%>`>
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><b>�亯 ����</b></td>
            <td class="table_02_2">
              <textarea name="p_anscontent" cols="100" rows="15"><%=v_anscontent%></textarea>
            </td>
          </tr>
        </table>
        <!----------------- ��ڿ��� �� ----------------->

        <br>
        <!----------------- �亯, ����, ����Ʈ ���� ----------------->
        <table width="16%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><a href="javascript:insert_check()"><img src="/images/admin/homepage/reply1_butt.gif" width="37" height="18" border="0"></a></td>
            <td align="center"><a href="javascript:delete_contact()"><img src="/images/admin/homepage/del1_butt.gif" width="37" height="18" border="0"></a></td>
            <td align="center"><a href="javascript:list()"><img src="/images/admin/homepage/list1_butt.gif" width="48" height="18" border="0"></a></td>
          </tr>
        </table>
        <!----------------- �亯, ����, ����Ʈ �� ----------------->

        <br>
      </td>
  </tr>
</table>


<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
