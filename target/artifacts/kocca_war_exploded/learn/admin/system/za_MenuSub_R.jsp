<%
//**********************************************************
//  1. ��      ��: ��� ����
//  2. ���α׷��� : za_MenuSub_R.jsp
//  3. ��      ��: ��� �󼼺���
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 12. 16
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
    String v_process        = box.getString("p_process");

    String v_searchtext     = box.getString("p_searchtext");
    String v_grcode         = CodeConfigBean.getConfigValue("cur_nrm_grcode");
    String v_menu           = box.getString("p_menu");
    String v_menunm         = MenuAdminBean.getMenuName(v_grcode, v_menu);
    String v_systemgubun    = box.getString("p_systemgubun");
    int    v_seq            = box.getInt("p_seq");

    String v_servlet     = "";
    String v_modulenm    = "";

    MenuSubData data = (MenuSubData)request.getAttribute("selectMenuSub");

    v_servlet  = data.getServlet();
    v_modulenm = data.getModulenm();

    ArrayList list = (ArrayList)request.getAttribute("selectMenuAuth");
    String v_gadmin   = "";
    String v_gadminnm = "";
    String v_control  = "";
	String v_rchecked = "";
	String v_wchecked = "";
	String v_systemnm = "";
    
//    if (v_systemgubun.equals("1")) v_systemnm = "���νý���";
//    else if(v_systemgubun.equals("2")) v_systemnm= "����Ʈ�ý���";
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function modify_menusub() {
        document.form1.action = "/servlet/controller.system.MenuSubAdminServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

    function delete_menusub() {
        document.form1.p_searchtext.value = "";
        document.form1.action = "/servlet/controller.system.MenuSubAdminServlet";
        document.form1.p_process.value = "delete";
        document.form1.submit();
    }

    function list_menusub() {
        document.form1.action = "/servlet/controller.system.MenuSubAdminServlet";
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
    <input type = "hidden" name = "p_systemgubun"  value = "<%=v_systemgubun%>">

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
            <td height="26" class="table_title">����</td>
            <td height="25" class="table_02_2"><%=v_servlet%></td>
          </tr>
          <tr> 
            <td width="15%" height="26" class="table_title" colspan='2'><strong>����</strong></td>
          </tr>
<%

            for(int i = 0; i < list.size(); i++) {
                MenuAuthData data2  = (MenuAuthData)list.get(i);
                v_gadmin   = data2.getGadmin();
                v_gadminnm = data2.getGadminnm();
                v_control  = StringManager.chkNull(data2.getControl());

                if (v_control.equals("r") || v_control.equals("rw") ) v_rchecked = "�б�";
                else v_rchecked = "";
                if (v_control.equals("w") || v_control.equals("rw") ) v_wchecked = "����";
                else v_wchecked = "";
%>
          <tr class="table_02_2"> 
            <td height="26" class="table_title" ><strong><%=v_gadminnm%></strong></td>
            <td height="25" class="table_02_2"><%=v_rchecked%> &nbsp; <%=v_wchecked%></td>
          </tr>
<%
            }
%>

        </table>

        <br>
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="463" align="right" class="ms"><a href="javascript:modify_menusub()"><img src="/images/admin/button/btn_modify.gif" border="0"></a></td>
            <td width="9"></td>
            <td width="34" align="center" class="ms"><a href="javascript:delete_menusub()"><img src="/images/admin/button/btn_del.gif" border="0"></a></td>
            <td width="9"></td>
            <td width="455" align="left" class="ms"><a href="javascript:list_menusub()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
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
