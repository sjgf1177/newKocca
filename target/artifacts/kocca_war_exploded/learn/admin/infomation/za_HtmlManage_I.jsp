<%
//**********************************************************
//  1. ��      ��: Notice Templet
//  2. ���α׷��� : za_NoticeTemplet_I.jsp
//  3. ��      ��: �������� ���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 13
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process  = box.getString("p_process");

    String s_username  = box.getSession("name");
    
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

    // ���
    function insert_check() {
        if (document.form1.p_title.value == "") {
            alert("������ �Է��ϼ���");
            document.form1.p_title.focus();
            return;
        }
        if (realsize(document.form1.p_title.value) > 200) {
            alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_title.focus();
            return;
        }

        if(document.form1.p_code.value == ""){
            alert("�ڵ带 �Է��ϼ���");
            document.form1.p_code.focus();
            return;
        }
        
        //document.form1.p_content.value = document.form1.Wec.MIMEValue;
        document.form1.p_content.value = document.form1.Wec.BodyValue;
        
        document.form1.p_content.value.replace("&","&amp;");
        
        if (document.form1.Wec.TextValue.length < 3) {
            alert("������ �Է��ϼ���");
            return;
        }

        document.form1.action = "/servlet/controller.infomation.HtmlManageAdminServlet";
        document.form1.p_process.value = "insert";

        document.form1.submit();
    }

    // ����Ʈ
    function list() {
        document.form1.action = "/servlet/controller.infomation.HtmlManageAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" >
<form name="form1" method="post">
    <input type = "hidden" name = "p_process"    value = "<%= v_process %>">
    <input type = "hidden" name = "p_content"   value = "">

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
      <br>

      <!----------------- ���� ----------------->
      <table class="table_out" cellspacing="1" cellpadding="5">
        <tr> 
          <td colspan="8" class="table_top_line"></td>
        </tr>
        <tr> 
          <td width="17%" class="table_title"><b>����</b></td>
          <td width="83%" height="25" colspan="7" class="table_02_2">
            <input type="text" name="p_title" size = "100" class="input">
          </td>
        </tr>
        <tr> 
          <td width="17%" class="table_title"><b>�ڵ�</b></td>
          <td width="83%" height="25" colspan="7" class="table_02_2">
            <input type="text" name="p_code" size = "100" class="input">
          </td>
        </tr>
        <tr> 
          <td align="center" class="table_title">����</td>
          <td colspan="7" class="table_02_2" >
                <!-- ���� ��Ƽ�� ������  ���� -->
                <script language="javascript" src="/script/user_patch.js"></script>
                <script language="javascript">object_namoActivepatch('100%','500');</script>
                <!-- ���� ��Ƽ�� ������  ���� --> 
          </td>
        </tr>
      </table>
      <!----------------- ��ư ���� ----------------->
      <br>
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td align="right" height="20">
            <a href="javascript:insert_check()"><img src="/images/admin/button/btn_add.gif" border="0"></a> 
            <a href="javascript:list()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a>
          </td>
        </tr>
        <tr> 
          <td height="3"></td>
        </tr>
      </table>

      
    </td>
  </tr>
</table>


<%@ include file = "/learn/library/getJspName.jsp" %> 
</form>
</body>
</html>