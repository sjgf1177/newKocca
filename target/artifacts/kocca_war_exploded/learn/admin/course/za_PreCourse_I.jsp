<%
//**********************************************************
//  1. ��      ��: �������������Խ��� 
//  2. ���α׷��� : za_PreCourse_U.jsp
//  3. ��      ��: �������������Խ��� ����.
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.13 
//  7. ��      ��: 
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage   = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "com.credu.community.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box       = (RequestBox)request.getAttribute("requestbox");
    String  v_process    = box.getString("p_process");
    int		v_pageno     = box.getInt("p_pageno");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    String  v_redate     = box.getString("p_redate");

    String s_userid      = box.getSession("userid");
    String s_username    = box.getSession("name");
    String v_content     = "";

%>
<html>
<head>
<title> Untitled Document </title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script>
<script language = "javascript" src = "/script/hhi_lib.js"></script>
<script language = "VBScript" src = "/script/hhi_lib.vbs"></script>
<SCRIPT LANGUAGE = "JavaScript">
$(document).ready(function(){
	$("#p_redate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});

<!--
	// ���
 function insert() {
		
	<% Date date = new Date(); 
		int v_year	= date.getYear()+1900;
		int v_month	= date.getMonth()+1;
		int v_day	= date.getDate();
	%>
	 var v_currDate		= <%=v_year%><%=v_month%><%=v_day%>;
	 var v_if_redate	= make_date(document.form1.p_redate.value);

	 if(document.form1.p_redate.value ==''){
			alert('������������ �Է��Ͽ����մϴ�.');
			document.form1.p_redate.focus();
			return;
	 }
	 if(v_if_redate < v_currDate){
		alert('���������� '+v_currDate+' ���ķ� �����Ͽ��� �մϴ�');
		document.form1.p_redate.value="";
		document.form1.p_redate.focus();
		return;
	 }
    	document.form1.p_content.value = document.form1.Wec.MIMEValue;
		document.form1.p_content.value.replace("&","&amp;");
		
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

        document.form1.action = "/servlet/controller.course.HomePagePreCourseAdminServlet";
        document.form1.p_process.value = "insertData";                
        document.form1.submit();
    }

	// ��ȸȭ������ �̵��Ҷ�
function wf_listOK() {
    document.form1.action = "/servlet/controller.course.HomePagePreCourseAdminServlet";
    document.form1.p_process.value = "selectList";
    document.form1.submit();
}
//-->
</SCRIPT>


</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
	
<form name="form1" method="post" enctype = "multipart/form-data">
    <input type = "hidden" name = "p_process"    value = "<%=v_process %>">
    <input type = "hidden" name = "p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_search"     value = "<%=v_search %>">
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
    <input type = 'hidden' name = "p_content"    value = "<%=v_content%>">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="768">
  <tr>
      <td align="center" valign="top"> 
        <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
        <tr>
            <td><img src="/images/admin/homepage/tit_precourse.gif" border="0"></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->

      <br>
        <!----------------- FORM ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="6" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>�ۼ���</strong></td>
            <td width="35%" height="25" class="table_02_2"><%=s_username%></td>
			<td width="15%" height="25" class="table_title"><strong>�����</strong></td>
            <td height="25" class="table_02_2"><%= FormatDate.getDate("yyyy/MM/dd") %></td>
			<td width="15%" height="25" class="table_title"><strong>����������</strong></td>
            <td height="25" class="table_02_2"><input name="p_redate" id="p_redate" type="text" class="datepicker_input1" size="10" value="<%=v_redate%>"></td>
          </tr>
          <tr> 
            <td colspan="1" class="table_title"><strong>����</strong></td>
            <td colspan="5" height="25" class="table_02_2"><input type="text" name="p_title" size = 100 class="input"></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td colspan="5" height="25" class="table_02_2">
            	<!-- ���� Editor  -->
                <p align="left">
                <!-- ���� ��Ƽ�� ������  ���� -->
                <script language="javascript" src="/script/user_patch.js"></script>
                <script language="javascript" for="Wec" event="OnInitCompleted()">namoActiveInitCompleted("p_content");</script>
                <script language="javascript">object_namoActivepatch('684','500');</script>
                <!-- ���� ��Ƽ�� ������  ���� -->
                </p>
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
            <td align="left" class="ms"><a href="javascript:wf_listOK()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
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
