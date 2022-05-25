<%
//**********************************************************
//  1. ��      ��: �Һз��ڵ� ���
//  2. ���α׷��� : za_CodeSub_I.jsp
//  3. ��      ��: �Һз��ڵ� ���
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

    String v_searchtext = box.getString("p_searchtext");
    String v_gubun    = box.getString("p_gubun");
    int    v_levels = box.getInt("p_levels");
    String v_upper  = box.getString("p_upper");
    String v_parent = box.getString("p_parent");
    
    String v_uppernm = CodeAdminBean.getCodeName(v_gubun, v_upper, v_levels-1);
    
    String v_gubunnm  = CodeAdminBean.getCodeName(v_gubun);
    String v_issystem = CodeAdminBean.getCodeIssystem(v_gubun);

    String v_code   = "";
    String v_codenm = "";

    ArrayList list = (ArrayList)request.getAttribute("selectSubList");

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
<%   if (v_issystem.equals("Y")) {                                %>
        if (document.form1.p_code.value == "") {
            alert("�Һз��ڵ���� �Է��ϼ���");
            document.form1.p_code.focus();
            return;
        }
        if (realsize(document.form1.p_code.value) > 20) {
            alert("�Һз��ڵ���� �ѱ۱��� 10�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_code.focus();
            return;
        }
<%   }                                                            %>
        if (document.form1.p_codenm.value == "") {
            alert("�Һз��ڵ���� �Է��ϼ���");
            document.form1.p_codenm.focus();
            return;
        }
        if (realsize(document.form1.p_codenm.value) > 100) {
            alert("�Һз��ڵ���� �ѱ۱��� 50�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_codenm.focus();
            return;
        }
        document.form1.p_searchtext.value = "";
        document.form1.action = "/servlet/controller.system.CodeAdminServlet";
        document.form1.p_process.value = "insertSub";
        document.form1.submit();
    }

    function list() {
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
    <input type = "hidden" name = "p_searchtext"  value = "<%=v_searchtext%>">
    <input type = "hidden" name = "p_issystem"    value = "<%=v_issystem%>">

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
          <% if ( v_levels > 1) { %>
          <tr> 
            <td width="15%" class="table_title"><strong>�����ڵ�</strong></td>
            <td height="25" class="table_02_2"><%=v_upper%></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>�����ڵ��</strong></td>
            <td height="25" class="table_02_2"><%=v_uppernm%></td>
          </tr>
          <% } %>
          <tr> 
            <td width="15%" height="25" class="table_title"><strong>�Һз��ڵ�</strong></td>
<%          if (v_issystem.equals("Y")) {                                %>
            <td align='left' bgcolor='#F7F7F7'><input name="p_code" type="text" size="110" maxlength="20" class="input"></td>
<%          } else {                                                     %>
            <td align='left' bgcolor='#F7F7F7'>* �ý��� �ڵ��ο�</td>
<%          }                                                            %>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>�Һз��ڵ��</strong></td>
            <td height="25" class="table_02_2">
              <input name="p_codenm"   type="text" size="110" maxlength="50" class="input">
            </td>
          </tr>
        </table>

        <br>
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="right" class="ms"><a href="javascript:insert_check()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
            <td width="1%" align="center" class="ms">&nbsp;</td>
            <td align="left" class="ms"><a href="javascript:list()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
          </tr>
        </table> 
        <!----------------- form �� ----------------->

        <!----------------- List Title ���� ----------------->
        <table width="97%" height="25" border="0" cellpadding="0" cellspacing="0">
          <tr>
		    <td width="1%"><img src="/images/admin/common/icon.gif" ></td> 
            <td class=sub_title>�Һз��ڵ�</td>
          </tr>
        </table>
        <!----------------- List Title �� ----------------->

        <!----------------- List ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="30%" height="25" class="table_title"><b>�Һз��ڵ�</b></td>
            <td width="70%" class="table_title"><b>�Һз��ڵ��</b><b></b></td>
          </tr>

<%
            for(int i = 0; i < list.size(); i++) {

                CodeData data  = (CodeData)list.get(i);
                v_code       = data.getCode();
                v_codenm     = data.getCodenm();
                v_upper      = data.getUpper();
                v_parent     = data.getParent();

%>
          <tr> 
            <td height="25" class="table_01"><%=v_code%></td>
            <td class="table_02_2"><a href="javascript:view('<%=v_code%>')"><%=v_codenm%></a></td>
          </tr>
<%
        }
%>

        </table>
        <!----------------- List �� ----------------->

        <br>
        <br>
      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %> 
</form>
</body>
</html>
