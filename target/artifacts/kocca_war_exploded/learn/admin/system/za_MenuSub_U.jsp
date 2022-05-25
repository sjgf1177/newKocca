<%
//**********************************************************
//  1. ��      ��: ��� ����Ʈ
//  2. ���α׷��� : za_MenuSub_U.jsp
//  3. ��      ��: ��� ����
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
    RequestBox box          = (RequestBox)request.getAttribute("requestbox");
    String  v_process       = box.getString("p_process");

    String  v_searchtext    = box.getString("p_searchtext");
    String v_grcode         = CodeConfigBean.getConfigValue("cur_nrm_grcode");
    String v_menu           = box.getString("p_menu");
    String v_menunm         = MenuAdminBean.getMenuName(v_grcode, v_menu);
    String v_systemgubun    = box.getString("p_systemgubun");
    int    v_seq            = box.getInt("p_seq");

    String v_servlet  = "";
    String v_modulenm = "";

    MenuSubData data = (MenuSubData)request.getAttribute("selectMenuSub");

    v_servlet  = data.getServlet();
    v_modulenm = data.getModulenm();

    ArrayList list = (ArrayList)request.getAttribute("selectList");

    ArrayList list2 = (ArrayList)request.getAttribute("selectMenuAuth");
    String v_gadmin   = "";
    String v_gadminnm = "";
    String v_control  = "";
	String v_rchecked = "";
	String v_wchecked = "";
	String v_systemnm = "";
	
//	if (v_systemgubun.equals("1")) v_systemnm = "���νý���";
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

    function insert_check() {
        if (document.form1.p_servlet.value == "") {
            alert("������ �Է��ϼ���");
            document.form1.p_servlet.focus();
            return;
        }
        if (realsize(document.form1.p_servlet.value) > 50) {
            alert("������ 50�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_servlet.focus();
            return;
        }

        if (document.form1.p_modulenm.value == "") {
            alert("������ �Է��ϼ���");
            document.form1.p_modulenm.focus();
            return;
        }
        if (realsize(document.form1.p_modulenm.value) > 50) {
            alert("������ �ѱ۱��� 25�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_modulenm.focus();
            return;
        }

/*
for(i=0;i<document.form1.length;i++) {
    if (document.form1.elements[i].type=="checkbox") {
      if (document.form1.elements[i].checked==true) {
        document.form1.elements[i].value = 'Y';
      } else {
        document.form1.elements[i].value = 'N';
      }
      alert("test="+document.form1.elements[i].value);
    }
}
*/

        document.form1.action = "/servlet/controller.system.MenuSubAdminServlet";
        document.form1.p_process.value = "update";
        document.form1.submit();
    }
    function list() {
        document.form1.action = "/servlet/controller.system.MenuSubAdminServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
    }
//-->
</SCRIPT>
</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type = "hidden" name = "p_process"     value = "<%= v_process %>">
    <input type = "hidden" name = "p_searchtext"  value = "<%=v_searchtext%>">
    <input type = "hidden" name = "p_grcode"      value = "<%=v_grcode%>">
    <input type = "hidden" name = "p_menu"        value = "<%=v_menu%>">
    <input type = "hidden" name = "p_seq"         value = "<%=v_seq%>">
    <input type = "hidden" name = "p_systemgubun" value = "<%=v_systemgubun%>">

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
            <td height="26" class="table_title">����</td>
            <td height="25" class="table_02_2"><input name="p_servlet" type="text" class="input" size="60" value="<%=v_servlet%>"></td>
          </tr>
          <tr> 
            <td width="15%" height="26" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2"><input name="p_modulenm" type="text" class="input" size="60" value="<%=v_modulenm%>"></td>
          </tr>
          <tr> 
            <td width="15%" height="26" class="table_title" colspan='2'><strong>����</strong></td>
          </tr>
<%

            for(int i = 0; i < list2.size(); i++) {
                MenuAuthData data2  = (MenuAuthData)list2.get(i);
                v_gadmin   = data2.getGadmin();
                v_gadminnm = data2.getGadminnm();
                v_control  = StringManager.chkNull(data2.getControl());

                if (v_control.equals("r") || v_control.equals("rw") ) v_rchecked = "checked";
                else v_rchecked = "";
                if (v_control.equals("w") || v_control.equals("rw") ) v_wchecked = "checked";
                else v_wchecked = "";
%>
          <tr class="table_02_2"> 
            <td height="26" class="table_title" ><strong><%=v_gadminnm%></strong></td>
            <td height="25" class="table_02_2">
               <input type = "hidden"   name = "p_gadmin<%=i%>"  value = "<%=v_gadmin%>">
               <input type = "checkbox" name = "p_controlR<%=i%>"  value = "r" <%=v_rchecked%>> R
               <input type = "checkbox" name = "p_controlW<%=i%>"  value = "w" <%=v_wchecked%>> W
			</td>
          </tr>
<%
            }
%>
        </table>

        <br>
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="right" class="ms"><a href="javascript:insert_check()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
            <td width="1%" align="center" class="ms">&nbsp;</td>
            <td align="left" class="ms"><a href="javascript:list()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
          </tr>
        </table> 
        <br>

        <!----------------- List Title ���� ----------------->
        <table width="97%" height="25" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td valign="absmiddle" style="padding-top=25;padding-bottom=5">&nbsp;<img src="/images/admin/system/icon2.gif" width="12" height="8" border="0"><b><font color="#107AAD">���μ����ڵ�</font></b></td>
          </tr>
        </table>
        <!----------------- List Title �� ----------------->

        <!----------------- List ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="4" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="15%" height="25" class="table_title"><b>�޴��ڵ�</b></td>
            <td width="10%" class="table_title"><b>��ȣ</b></td>
            <td width="30%" class="table_title"><b>����</b></td>
            <td width="30%" class="table_title"><b>����̸�</b></td>
          </tr>

<%
            for(int i = 0; i < list.size(); i++) {

                MenuSubData data1  = (MenuSubData)list.get(i);
                v_menu      = data1.getMenu();
                v_servlet   = data1.getServlet();
                v_seq       = data1.getSeq();
                v_modulenm  = data1.getModulenm();

%>
          <tr> 
            <td height="25" class="table_02_5"> <%=v_menu%> </td>
            <td class="table_02_5"><%=v_seq%></td>
            <td class="table_02_5"><%=v_servlet%></td>
            <td class="table_02_5"><%=v_modulenm%></td>
          </tr>
<%
        }
%>

        </table>
        <!----------------- List �� ----------------->
    </td>
  </tr>
</table>


<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
