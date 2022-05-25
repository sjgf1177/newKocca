<%
//**********************************************************
//  1. ��      ��: �Һз��ڵ� �󼼺���
//  2. ���α׷��� : za_CodeSub_R.jsp
//  3. ��      ��: �Һз��ڵ� �󼼺���
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

    String v_searchtext  = box.getString("p_searchtext");
    String v_gubun    = box.getString("p_gubun");
    String v_gubunnm  = CodeAdminBean.getCodeName(v_gubun);
    String v_levels = box.getString("p_levels");
    String v_upper  = box.getString("p_upper");
    String v_parent = box.getString("p_parent");

    String v_code   = box.getString("p_code");
    String v_codenm = "";


    CodeData data = (CodeData)request.getAttribute("selectSubCode");

    v_codenm = data.getCodenm();


%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function modify_code() {
        document.form1.action = "/servlet/controller.system.CodeAdminServlet";
        document.form1.p_process.value = "updateSubPage";
        document.form1.submit();
    }

    function delete_code() {
        document.form1.p_searchtext.value = "";
        document.form1.action = "/servlet/controller.system.CodeAdminServlet";
        document.form1.p_process.value = "deleteSub";
        document.form1.submit();
    }

    function list_code() {
        document.form1.action = "/servlet/controller.system.CodeAdminServlet";
        document.form1.p_process.value = "selectSubList";
        document.form1.submit();
    }
//-->
</SCRIPT>
</head>




<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type = "hidden" name = "p_process" value = "<%= v_process %>">
    <input type = "hidden" name = "p_gubun"   value = "<%= v_gubun %>">
    <input type = "hidden" name = "p_levels"  value = "<%= v_levels %>">
    <input type = "hidden" name = "p_upper"   value = "<%=v_upper%>">
    <input type = "hidden" name = "p_parent"  value = "<%=v_parent%>">
    <input type = "hidden" name = "p_code"  value   = "<%=v_code%>">
    <input type = "hidden" name = "p_searchtext"  value = "<%=v_searchtext%>">

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
            <td width="15%" height="25" class="table_title"><strong>�Һз��ڵ�</strong></td>
            <td class="table_02_2"><%=v_code%></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>�Һз��ڵ��</strong></td>
            <td height="25" class="table_02_2"><%=v_codenm%></td>
          </tr>
        </table>

        <br>
        <table border="0" cellspacing="0" cellpadding="0">
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
