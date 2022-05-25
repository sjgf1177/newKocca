<%
//**********************************************************
//  1. ��      ��: Notice Templet
//  2. ���α׷��� : za_NoticeTemplet_L.jsp
//  3. ��      ��: �������� ����Ʈ
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
<%@ page import = "com.credu.system.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box        = (RequestBox)request.getAttribute("requestbox");
    String  v_process     = box.getString("p_process");


    int    v_seq      = 0;              // �Ϸù�ȣ
    String v_title    = "";         // ����
    String v_indate   = "";         // �����
    String v_code = "";         // HTML ���

    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������

    ArrayList list      = (ArrayList)request.getAttribute("selectList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    // �󼼺���
    function view(seq) {
        document.form1.action = "/servlet/controller.infomation.HtmlManageAdminServlet";
        document.form1.p_seq.value = seq;
        document.form1.p_process.value = "selectView";
        document.form1.submit();
    }

    // ���
    function insert() {
        document.form1.action = "/servlet/controller.infomation.HtmlManageAdminServlet";
        document.form1.p_process.value = "insertPage";
        document.form1.submit();
    }

    // �˻�
    function search() {
        document.form1.action = "/servlet/controller.infomation.HtmlManageAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

    // �������̵�
    function go(index) {
        document.form1.target = "_self";
         document.form1.p_pageno.value = index;
         document.form1.action = '/servlet/controller.infomation.HtmlManageAdminServlet';
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }

    // �������̵�
    function goPage(pageNum) {
        document.form1.target = "_self";
         document.form1.p_pageno.value = pageNum;
         document.form1.action = '/servlet/controller.infomation.HtmlManageAdminServlet';
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }

//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
<input type = "hidden" name = "p_process"     value = "">
    <input type = "hidden" name = "p_seq"     value = "">


  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/portal/s.1_18.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->

        <br>

      <!----------------- ��ư ���� ----------------->
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="right" height="20"><a href='javascript:insert()'><img src="/images/admin/button/btn_add.gif" border="0"></a></td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- �������� ���� ----------------->

      <table class="table_out" cellspacing="1" cellpadding="5">
        <tr>
          <td colspan="7" class="table_top_line"></td>
        </tr>
        <tr>
          <td width="5%" height="25" class="table_title"><b>NO</b></td>
          <td class="table_title">����</td>
          <td width="10%" class="table_title">�ڵ�</td>
          <td width="10%" class="table_title">�����</td>
        </tr>
<%
            for(int i = 0; i < list.size(); i++) {
                DataBox dbox   = (DataBox)list.get(i);

                v_seq         = dbox.getInt("d_seq");
                v_title       = dbox.getString("d_title");
                v_indate      = dbox.getString("d_indate");
                v_code        = dbox.getString("d_code");

                v_indate      = FormatDate.getFormatDate(v_indate,"yyyy/MM/dd");
                v_dispnum     = dbox.getInt("d_dispnum");
%>

          <tr>
            <td class="table_01" height="29"><%=list.size() - i%></td>
            <td class="table_02_2"><a href="javascript:view('<%=v_seq%>')"><%=v_title%></a></td>
            <td class="table_02_1"><%=v_code%></td>
            <td class="table_02_1"><%=v_indate%></td>
          </tr>
<%
        }
%>
      </table>
        <!----------------- ����Ʈ ��ȸ �� ----------------->
        <br>
        <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="right" valign="absmiddle"> 
            </td>
          </tr>
        </table>
        <!----------------- total �� ----------------->
        <br>
      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>