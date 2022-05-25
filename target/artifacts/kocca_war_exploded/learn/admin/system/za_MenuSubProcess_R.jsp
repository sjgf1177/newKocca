<%
//**********************************************************
//  1. ��      ��: ���μ��� ����
//  2. ���α׷��� : za_MenuSubProcess_I.jsp
//  3. ��      ��: ���μ��� �󼼺���
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

    String v_searchtext   = box.getString("p_searchtext");
    String v_grcode       = CodeConfigBean.getConfigValue("cur_nrm_grcode");
    String v_menu         = box.getString("p_menu");
    String v_menunm       = MenuAdminBean.getMenuName(v_grcode, v_menu);
    int v_seq             = box.getInt("p_seq");
    String v_modulenm     = box.getString("p_modulenm");
    String v_processvalue = box.getString("p_processvalue");

    String v_servlettype     = "";
    String v_method          = "";
	String v_servlettypeview = "";

    MenuSubProcessData data = (MenuSubProcessData)request.getAttribute("selectMenuSubProcess");

    v_servlettype = data.getServlettype();
    v_method      = data.getMethod();
	if (v_servlettype.equals("1"))      v_servlettypeview = "��ȸ";
	else if (v_servlettype.equals("2")) v_servlettypeview = "��ȸ(����׼�����)";
	else if (v_servlettype.equals("4")) v_servlettypeview = "����׼�";

%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function modify_menusubprocess() {
        document.form1.action = "/servlet/controller.system.MenuSubProcessAdminServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

    function delete_menusubprocess() {
        document.form1.p_searchtext.value = "";
        document.form1.action = "/servlet/controller.system.MenuSubProcessAdminServlet";
        document.form1.p_process.value = "delete";
        document.form1.submit();
    }

    function list_menusubprocess() {
        document.form1.action = "/servlet/controller.system.MenuSubProcessAdminServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
    }
//-->
</SCRIPT>
</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type = "hidden" name = "p_process"      value = "<%= v_process %>">
    <input type = "hidden" name = "p_searchtext"   value = "<%=v_searchtext%>">
    <input type = "hidden" name = "p_grcode"       value = "<%=v_grcode%>">
    <input type = "hidden" name = "p_menu"         value = "<%=v_menu%>">
    <input type = "hidden" name = "p_seq"          value = "<%=v_seq%>">
    <input type = "hidden" name = "p_modulenm"     value = "<%=v_modulenm%>">
    <input type = "hidden" name = "p_processvalue" value = "<%=v_processvalue%>">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="665">
  <tr>
    <td align="center" valign="top"> 

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/system/unite_title02.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	  <!----------------- title �� ----------------->


      <br>
        <!----------------- form ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr class="table_02_2"> 
            <td height="26" class="table_title" ><strong>�޴��ڵ�</strong></td>
            <td height="25" class="table_02_2"><%=v_menu%></td>
          </tr>
          <tr> 
            <td width="15%" height="26" class="table_title"><strong>�޴��ڵ��</strong></td>
            <td height="25" class="table_02_2"><%=v_menunm%></td>
          </tr>
          <tr class="table_02_2"> 
            <td height="26" class="table_title" ><strong>����ȣ</strong></td>
            <td height="25" class="table_02_2"><%=v_seq%></td>
          </tr>
          <tr> 
            <td width="15%" height="26" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2"><%=v_modulenm%></td>
          </tr>
          <tr> 
            <td height="26" class="table_title">���μ���</td>
            <td height="25" class="table_02_2"><%=v_processvalue%></td>
          </tr>
          <tr> 
            <td height="26" class="table_title"><strong>����Ÿ��</strong></td>
            <td height="25" class="table_02_2"><%=v_servlettype%></td>
          </tr>
          <tr> 
            <td width="15%" height="26" class="table_title"><strong>�Լ���</strong></td>
            <td height="25" class="table_02_2"><%=v_method%></td>
          </tr>
        </table>

        <br>
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="right" class="ms"><a href="javascript:modify_menusubprocess()"><img src="/images/admin/button/btn_modify.gif" border="0"></a></td>
            <td width="1%" align="center" class="ms">&nbsp;</td>
            <td width="50" align="center" class="ms"><a href="javascript:delete_menusubprocess()"><img src="/images/admin/button/btn_del.gif"  border="0"></a></td>
            <td width="1%" align="center" class="ms">&nbsp;</td>
            <td align="left" class="ms"><a href="javascript:list_menusubprocess()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
          </tr>
        </table> 
        <!----------------- form �� ----------------->
        <br>
    </td>
  </tr>
</table>


<%@ include file = "/learn/library/getJspName.jsp" %> 
</form>
</body>
</html>
