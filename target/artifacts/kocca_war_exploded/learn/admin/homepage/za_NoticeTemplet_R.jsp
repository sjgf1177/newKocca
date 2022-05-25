<%
//**********************************************************
//  1. ��      ��: Notice Templet
//  2. ���α׷��� : za_NoticeTemplet_R.jsp
//  3. ��      ��: �������� �󼼺���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 13
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
    String  v_process  = box.getString("p_process");
    int     v_pageno   = box.getInt("p_pageno");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");

    int     v_seq          = box.getInt("p_seq");

    int    v_cnt         = 0;            // ��ȸ��
    String v_adtitle     = "";           // ����
    String v_templetfile = "";           // ���ø� ����
    String v_addate      = "";           // �����
    String v_adname      = "";           // �����
    String v_ldate       = "";           // ������
    String v_codenm      = "";

    String v_server = conf.getProperty("kocca.url.value");
    String v_path   = conf.getProperty("url.namo.template");  // ������ ����� ������ �����ϱ� ���� ���
	String v_url    = v_server + v_path;

    DataBox dbox = (DataBox)request.getAttribute("selectNotice");
    if (dbox != null) {
        v_adtitle     = dbox.getString("d_adtitle");
        v_templetfile = dbox.getString("d_templetfile");
        v_addate      = dbox.getString("d_addate");
        v_adname      = dbox.getString("d_adname");
        v_ldate       = dbox.getString("d_ldate");
        v_codenm      = dbox.getString("d_codenm");
        v_cnt         = dbox.getInt("d_cnt");

        v_addate     = FormatDate.getFormatDate(v_addate,"yyyy/MM/dd");
        v_ldate      = FormatDate.getFormatDate(v_ldate,"yyyy/MM/dd");
     }
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

    function modify_notice() {
        document.form1.action = "/servlet/controller.homepage.NoticeTempletServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

    function delete_notice() {
        document.form1.p_searchtext.value = "";
        document.form1.p_search.value     = "";
        document.form1.action = "/servlet/controller.homepage.NoticeTempletServlet";
        document.form1.p_process.value = "delete";
        document.form1.submit();
    }

    function list_notice() {
        document.form1.action = "/servlet/controller.homepage.NoticeTempletServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
    }

//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type = "hidden" name = "p_process"     value = "<%= v_process %>">
    <input type = "hidden" name = "p_pageno"      value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_search"      value = "<%=v_search %>">
    <input type = "hidden" name = "p_searchtext"  value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_seq"         value = "<%=v_seq %>">
	<input type = "hidden" name = "p_templetfile" value = "<%=v_templetfile %>">
	

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/homepage/tit_noticetem.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>

      <br>


      <!----------------- CENTER ���� ----------------->
      <table class="table_out" cellspacing="1" cellpadding="5">
        <tr>
          <td colspan="9" class="table_top_line"></td>
        </tr>
        <tr>
          <td class="table_title">�ۼ���</td>
          <td height="25"  class="table_02_2"><%=v_adname%></td>
          <td width="9%" height="25" class="table_title">������</td>
          <td width="18%" height="25" class="table_02_2"><%=v_ldate%></td>
          <td width="10%" height="25" class="table_title">�ۼ���</td>
          <td width="27%" height="25" class="table_02_2"><%=v_addate%></td>
        </tr>
        <tr>
          <td width="16%" class="table_title"><b>����</b></td>
          <td height="25" colspan="8" class="table_02_2"><%=v_adtitle%></td>
        </tr>
        <tr>
          <td width="16%" class="table_title"><b>�з�</b></td>
          <td height="25" colspan="8" class="table_02_2"><%=v_codenm%></td>
        </tr>
        <tr>
          <td align="center" class="table_title">����</td>
          <td colspan="8" class="table_02_2" >
          <iframe src="<%=v_url+v_templetfile%>" border="0" width="800" height="400" scrolling="yes" id="iamiframe" name="iamiframe"></iframe>
          </td>
        </tr>
      </table>
      <br>
      <!----------------- ��ư ���� ----------------->

      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="right" height="20">
            <a href="javascript:modify_notice()"><img src="/images/admin/button/btn_modify.gif" border="0"></a>
            <a href="javascript:delete_notice()"><img src="/images/admin/button/btn_del.gif" border="0"></a>
            <a href="javascript:list_notice()"><img src="/images/admin/button/btn_list.gif" border="0"></a>
          </td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- CENTER �� ----------------->
      </td>
  </tr>
</table>


<%@ include file = "/learn/library/getJspName.jsp" %>

</body>
</html>