<%
//**********************************************************
//  1. ��      ��: ������������������
//  2. ���α׷��� : za_SubjGong_R.jsp
//  3. ��      ��: ������������������ ���ð���󼼺���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 8. 18
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process        = box.getString("p_process");
    
    int     v_pageno        = box.getInt("p_pageno");
    
    String  v_searchtext    = box.getString("p_searchtext");
    String  v_search        = box.getString("p_search");

    String	v_seq					= "";
    String	v_gubun					= "";
	String	v_content				= "";
	String	v_smsyn					= "";
	String	v_indate				= "";
	String	v_processing			= "";
	String	v_processingdate		= "";
	String	v_processingcontent		= "";
	String	v_title					= "";
	String	v_email					= "";
    
    DataBox dbox = (DataBox)request.getAttribute("selectView");
    
    if (dbox != null) {
    	v_seq					= dbox.getString("d_seq");
    	v_gubun					= dbox.getString("d_gubun");
        v_content				= dbox.getString("d_content");
        v_smsyn					= dbox.getString("d_smsyn");
        v_indate				= dbox.getString("d_indate");
        v_processing			= dbox.getString("d_processing");
        v_processingdate		= dbox.getString("d_processingdate");
        v_processingcontent		= dbox.getString("d_processingcontent");
        v_title   				= dbox.getString("d_title");
        v_email					= dbox.getString("d_email");
     }
    
%>
<html>
<head>
<title>::: WebReport :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    
    // ����Ʈ
    function list_gong() {
        document.form1.action = "/servlet/controller.infomation.ContactUsAdminServlet";
        document.form1.p_process.value = "selectListWebReport";
        document.form1.submit();
    }

//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type="hidden" name="p_process"    value = "<%= v_process %>">
    <input type="hidden" name="p_seq"        value="<%=v_seq%>">
    <input type="hidden" name="p_pageno"     value = "<%=v_pageno %>">
    <input type="hidden" name="p_search"     value = "<%=v_search %>">
    <input type="hidden" name="p_searchtext" value = "<%=v_searchtext %>">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 


      <!----------------- title ���� ----------------->
      <!-- table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/portal/s.3.2.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table-->
        <!----------------- title �� ----------------->

        <br>
        <!-----------------������Ű� �������� ���� ----------------->
		<table cellspacing="1" cellpadding="5" class="table_out">
			<tr>
				<td class="table_title"><strong>����</strong></td>
				<td colspan="3" height="25" class="table_02_2"><%=v_title %></td> 
			</tr>
			<tr>
				<td class="table_title" class="table_title">���� </td>
				<td colspan="3" class="table_02_2" colspan="3"><%=v_content.replace("\n","<BR>")%></td>
			</tr>
			<tr>
				<td width="13%" class="table_title" class="table_title">�̸���</td>
				<td width="*"class="table_02_2"><%=v_email %></td>
				<td width="13%" class="table_title" class="table_title">����� </td>
				<td width="37%" class="table_02_2"><%= FormatDate.getFormatDate(v_indate, "yyyy/MM/dd") %></td>
			</tr>      
		</table>
        <!----------------- ������Ű� �������� �� ----------------->
        
        <br>
        <!-----------------������Ű� ó������ ���� ----------------->
		<table cellspacing="1" cellpadding="5" class="table_out">
			<tr>
				<td width="13%" class="table_title" class="table_title">ó������</td>
				<td width="*"class="table_02_2"><%=v_processing %></td>
				<td width="13%" class="table_title" class="table_title">ó���� </td>
				<td width="37%" class="table_02_2"><%= FormatDate.getFormatDate(v_processingdate, "yyyy/MM/dd") %></td>
			</tr>
			<tr>
				<td class="table_title" class="table_title">ó������ </td>
				<td colspan="3" class="table_02_2" colspan="3"><%=v_processingcontent.replace("\n","<BR>")%></td>
			</tr>
		</table>
        <!----------------- ������Ű� ó������ �� ----------------->

        <br>
        <!----------------- ����, ����, ����Ʈ ��ư ���� ----------------->
        <table  border="0" cellspacing="0" cellpadding="0">
          <tr> 
           
            <td align="center"><a href="javascript:list_gong()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
          </tr>
        </table>
        <!----------------- ����, ����, ����Ʈ ��ư �� ----------------->

        <br>
      </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
