<%
//**********************************************************
//  1. ��      ��: ��з��ڵ� ���
//  2. ���α׷��� : za_Code_I.jsp
//  3. ��      ��: ��з��ڵ� ���
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


    String  v_gubun         = "";
    String  v_gubunnm       = "";
    int     v_maxlevel      = 0;
    String  v_issystem      = "";
    String  v_issystem_view = "";

    ArrayList list = (ArrayList)request.getAttribute("selectList");

%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
		//�ڵ� ��Ͻ�
    function insert_check() {
        if (document.form1.p_gubunnm.value == "") {
            alert("��з��ڵ���� �Է��ϼ���");
            document.form1.p_gubunnm.focus();
            return;
        }
        if (realsize(document.form1.p_gubunnm.value) > 100) {
            alert("��з��ڵ���� �ѱ۱��� 50�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_gubunnm.focus();
            return;
        }
        document.form1.action = "/servlet/controller.system.CodeAdminServlet";
        document.form1.p_process.value = "insert";
        document.form1.submit();
    }
		
		//����Ʈ ȭ�� �̵�
    function list() {
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
            <td class="table_02_2">* �ý��� �ڵ��ο�</td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>��з��ڵ��</strong></td>
            <td height="25" class="table_02_2">
              <input name="p_gubunnm"   type="text" size="110" maxlength="50" class="input">
              <input name="p_maxlevel" type="hidden" value="1">
            </td>
          </tr>
          <tr> 
            <td width="15%" height="25" class="table_title"><strong>�ڵ��ڵ���Ͽ���</strong></td>
            <td class="table_02_2">
              <select name = 'p_issystem'>
                <option value='N'>�ڵ����</option>
                <option value='Y'>�������</option>
              </select>
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
            <td class=sub_title>��з��ڵ�</td>
          </tr>
        </table>
        <!----------------- List Title �� ----------------->

        <!----------------- List ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="3" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="30%" height="25" class="table_title"><b>��з��ڵ�</b></td>
            <td width="55%" class="table_title"><b>��з��ڵ��</b></td>
            <td width="15%" class="table_title"><b>�ڵ��ڵ���Ͽ���</b></td>
          </tr>
<%
            for(int i = 0; i < list.size(); i++) {

                CodeData data  = (CodeData)list.get(i);
                v_gubun       = data.getGubun();
                v_gubunnm     = data.getGubunnm();
                v_maxlevel    = data.getMaxlevel();
                v_issystem    = data.getIssystem();
                if (v_issystem.equals("Y")) v_issystem_view = "�������";
                else v_issystem_view = "�ڵ����";

%>
          <tr>
            <td height="25" class="table_01"><%=v_gubun%></td>
            <td class="table_02_2"><%=v_gubunnm%></td>
            <td class="table_02_1"><%=v_issystem_view%></td>
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
