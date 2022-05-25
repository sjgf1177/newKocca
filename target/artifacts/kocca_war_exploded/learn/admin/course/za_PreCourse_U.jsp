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
<%@ page import = "com.dunet.common.util.*" %>   

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />


<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process    = box.getString("p_process");
    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");

    int     v_seq        = box.getInt("p_seq");
    String  v_searchtext = box.getString("p_searchtext");
    String  v_select     = box.getString("p_select");
    int     v_pageno     = box.getInt("p_pageno");

    String  v_content      = "";
	String  v_redate     = "";
	String  v_name		 = "";
	String  v_indate	 = "";
    String  v_title      = "";

    //String  width = "630";
   // String  height = "200";

	DataBox dbox         = (DataBox)request.getAttribute("list");

    if (dbox != null) {

    v_title      = dbox.getString("d_title");
    v_content    = dbox.getString("d_content");
    v_redate     = dbox.getString("d_redate");
	v_name		 = dbox.getString("d_name");
	v_indate	 = dbox.getString("d_indate");

	v_redate   = FormatDate.getFormatDate(v_redate,"yyyy/MM/dd");
	 }

%>  


<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script>
<script src="/script/cresys_lib.js" language="javascript"></script>
<script language = "VBScript" src = "/script/hhi_lib.vbs"></script>
<SCRIPT language = "javascript">
$(document).ready(function(){
	$("#p_redate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
<!--

function uf_updateOK() {
		
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

     if(blankCheck(document.form1.p_title.value)){
         alert("������ �Է��ϼ���");
         document.form1.p_title.focus();
         return;
     }
         
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
    document.form1.p_content.value = document.form1.Wec.MIMEValue;
    document.form1.p_content.value.replace("&","&amp;");
     
     if (document.form1.Wec.TextValue.length < 3) {
       alert("������ �Է��ϼ���");
         return;
     }

    document.form1.action = "/servlet/controller.course.HomePagePreCourseAdminServlet";
    document.form1.p_process.value = "updateData";
    document.form1.submit();
}
function wf_listOK() {
    document.form1.action = "/servlet/controller.course.HomePagePreCourseAdminServlet";
    document.form1.p_process.value = "selectList";
    document.form1.submit();
}



    
//-->
</SCRIPT>
</head>
<body topmargin=0 leftmargin=0  --onload="initPage()">

<form name = "form1"     enctype = "multipart/form-data"   method = "post">
<input type = "hidden" name = "p_process"		value="">
<input type = "hidden" name = "p_pageno"		value = "<%=v_pageno%>">
<input type = "hidden" name = "p_searchtext"    value = "<%=v_searchtext%>">
<input type = "hidden" name = "p_select"		value = "<%=v_select%>">
<input type = "hidden" name = "p_seq"			value = "<%=v_seq%>">
<input type = "hidden" name = "p_content"		value=  "<%=StringUtil.convertHtmlchars(v_content)%>">

<table width="1000" border="0" cellspacing="0" cellpadding="0">
 <tr>
  <td align="center"> 
   <!----------------- title ���� ----------------->
   <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
    <tr> 
     <td><img src="/images/admin/homepage/tit_precourse.gif"></td>
     <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
    </tr>
   </table>
   <br>

   <table width="970"  border="0"  cellpadding="0" cellspacing="1" class="table_out">
    <tr> 
     <td class="table_title" width="18%">�ۼ���</td>
     <td class="table_02_2"  width="82%"><%=v_name%></td>
     <td class="table_title" width="15%">����������</td>
     <td class="table_02_2"  width="20%"><input name="p_redate" id="p_redate" type="text" class="datepicker_input1" size="10" value="<%=v_redate%>"></td>
    </tr>
    
    <tr> 
     <td class="table_title" width="15%">����</td>
     <td colspan="3" class="table_02_2"  width="50%"><input name="p_title" type="text" class="input" size="75" value="<%=v_title%>"></td>
   	 
    </tr>

     <tr>
      <td class="table_title">����</td>
      <td colspan="3" class="table_02_2" style=padding-top:5;padding-bottom:5>
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
    <br>
    <table width="970" border="0" cellspacing="0" cellpadding="0">
     <tr align="center"> 
      <td><a href="javascript:uf_updateOK();" onfocus=this.blur()><img src="/images/admin/button/btn_save.gif" border = "0">
					<a href="javascript:wf_listOK();" onfocus=this.blur()><img src="/images/admin/button/btn_cancel.gif" border = "0"></td>
     </tr>
    </table></td>
  </tr>
</table>
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
