<%
//**********************************************************
//  1. ��      ��: ����ڷ��
//  2. ���α׷��� : za_TutorMessageAdmin_I.jsp
//  3. ��      ��: ����ڷ�� ���
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 1. 2
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
    RequestBox box       = (RequestBox)request.getAttribute("requestbox");
    String  v_process    = box.getString("p_process");
    String  ss_upperclass   = box.getString("s_upperclass");      //������з�
    String  ss_middleclass  = box.getString("s_middleclass");     //�����ߺз�
    String  ss_lowerclass   = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse   = box.getString("s_subjcourse");      //����&�ڽ�
    String  ss_action       = box.getString("s_action");
    int  v_pageno        = box.getInt("p_pageno");
    
	String s_username = box.getSession("name");
%>
<html>
<head>
<title>Notice</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/hhi_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function insert() { 
        if (blankCheck(document.form1.p_title.value)) {
            alert("������ �Է��ϼ���!");
            document.form1.p_title.focus();
            return;
        }                
        if (realsize(document.form1.p_title.value) > 200) {
            alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_title.focus();
            return;
        }

        document.form1.p_content.value = document.form1.Wec.MIMEValue;
        document.form1.p_content.value.replace("&","&amp;");
        
        if (document.form1.Wec.Value.length < 3) {
            alert("������ �Է��ϼ���!");
            return;
        }
        
        document.form1.action = "/servlet/controller.tutor.TutorMessageAdminServlet";
        document.form1.p_process.value = "insert";
        document.form1.submit();
    }

   function cancel() {
        document.form1.action = "/servlet/controller.tutor.TutorMessageAdminServlet";
        document.form1.p_process.value = "listPage";
        document.form1.submit();    
   }

//-->
</SCRIPT>

</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post" enctype = "multipart/form-data">
    <input type= "hidden" name="p_process"      value="<%=v_process %>">
    <input type= "hidden" name= "s_upperclass"  value= "<%=ss_upperclass %>">
    <input type= "hidden" name= "s_middleclass" value= "<%=ss_middleclass %>">
    <input type= "hidden" name= "s_lowerclass"  value= "<%=ss_lowerclass %>">
    <input type= "hidden" name= "s_subjcourse"  value= "<%=ss_subjcourse %>">
    <input type= "hidden" name= "s_action"      value= "<%=ss_action %>">
    <input type= "hidden" name= "p_pageno"      value= "<%=v_pageno %>">
    <input type= "hidden" name= "p_subjcourse"  value= "<%=ss_subjcourse%>">
    <input type= "hidden" name= "p_content"     value= "">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="768">
  <tr>
      <td align="center" valign="top"> 
        <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
          <tr> 
            <td><img src="/images/admin/tutor/tit_tutor_message.gif"></td>
            <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
          </tr>
        </table>
        <!----------------- title �� ----------------->

      <br>
        <!----------------- FORM ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>�ۼ���</strong></td>
            <td height="25" class="table_02_2"><%=s_username%></td>
          </tr>
          <tr > 
            <td height="25" class="table_title"><strong>�����</strong></td>
            <td height="25" class="table_02_2"><%= FormatDate.getDate("yyyy/MM/dd") %></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2"><input type="text" name="p_title" size = 100 class="input"></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2">
                <!-- ���� ��Ƽ�� ������  ���� -->
                <script language="javascript" src="/script/user_patch.js"></script>
                <script language="javascript">object_namoActivepatch('100%','500');</script>
                <!-- ���� ��Ƽ�� ������  ���� -->
            </td>
          </tr>
        </table>
        <!----------------- FORM �� ----------------->
        <!----------------- total ���� ----------------->
        <br>
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="right" class="ms"><a href="javascript:insert()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
            <td width="1%" align="center" class="ms">&nbsp;</td>
            <td align="left" class="ms"><a href="javascript:cancel()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
          </tr>
        </table>
        <br>
        <!----------------- total �� ----------------->
      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %> 

</form>
</body>
</html>
