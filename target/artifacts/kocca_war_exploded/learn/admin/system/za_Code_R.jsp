<%
//**********************************************************
//  1. ��      ��: ��з��ڵ� �󼼺���
//  2. ���α׷��� : za_Code_R.jsp
//  3. ��      ��: ��з��ڵ� �󼼺���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 8
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
    String  v_gubun     = box.getString("p_gubun");

    String  v_gubunnm  = "";
    int     v_maxlevel = 0;
    String  v_issystem      = "";
    String  v_issystem_view = "";

    CodeData data = (CodeData)request.getAttribute("selectCode");

    v_gubunnm  = data.getGubunnm();
    v_maxlevel = data.getMaxlevel();
    v_issystem = data.getIssystem();
    if (v_issystem.equals("Y")) v_issystem_view = "�������";
    else v_issystem_view = "�ڵ����";

%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<SCRIPT LANGUAGE="JavaScript">
<!--
    function modify_code() {
        document.form1.action = "/servlet/controller.system.CodeAdminServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

    function delete_code() {
        document.form1.action = "/servlet/controller.system.CodeAdminServlet";
        document.form1.p_process.value = "delete";
        document.form1.submit();
    }

    function list_code() {
        document.form1.action = "/servlet/controller.system.CodeAdminServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
    }
//-->
</SCRIPT>
</head>




<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type = "hidden" name = "p_process" value = "<%= v_process %>">
    <input type = "hidden" name = "p_gubun" value = "<%= v_gubun %>">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="665">
  <tr>
    <td align="center" valign="top"> 
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/system/unite_title07.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->

      <br>
        <!----------------- form ���� ----------------->
        <br>
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="15%" height="25" class="table_title"><strong>��з��ڵ�</strong></td>
            <td class="table_02_2"><%=v_gubun%></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>��з��ڵ��</strong></td>
            <td height="25" class="table_02_2"><%=v_gubunnm%></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>�ڵ��ڵ���Ͽ���</strong></td>
            <td height="25" class="table_02_2"><%=v_issystem_view%></td>
          </tr>
        </table>

        <br>
        <table  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td><a href="javascript:modify_code()"><img src="/images/admin/button/btn_modify.gif" border="0"></a></td>
            <td width="8"></td>
            <td><a href="javascript:delete_code()"><img src="/images/admin/button/btn_del.gif" border="0"></a></td>
            <td width="8"></td>
            <td><a href="javascript:list_code()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
          </tr>
        </table> 
        <!----------------- form �� ----------------->

        <br>
        <br>
      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %> 
</form>
</body>
</html>
