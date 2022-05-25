<%
//**********************************************************
//  1. ��      ��: HomePageSuperiorityMember
//  2. ���α׷��� : za_HomePageSuperiorityMember_R.jsp
//  3. ��      ��: ���� ���ȸ������ �󼼺���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: �ϰ��� 2005.12.14
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
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process  = box.getString("p_process");
    
    String  s_userid = box.getSession("userid");
    int     v_pageno   = box.getInt("p_pageno");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");

    int v_seq        = box.getInt("p_seq");

    int    v_cnt       = 0;            // ��ȸ��
    String v_gubun     = "";           // ��ü����
    String v_adtitle   = "";           // ����
    String v_singleword   = "";        // �Ѹ���
    String v_adcontent = "";           // ����
    String v_addate    = "";           // �����
    String v_adname    = "";           // �����
    String v_aduserid  = "";           // userid

    String v_useyn   	= "";			// �������
    String v_month		= "";			// �ش��
    
    String v_realfile	= "";
    String v_savefile	= "";
    
    DataBox dbox = (DataBox)request.getAttribute("selectHomePageSuperiorityMember");
    
    if (dbox != null) {    
        v_cnt       = dbox.getInt("d_cnt");
        v_singleword  = dbox.getString("d_singleword"); 
        v_adtitle   = dbox.getString("d_title"); 
        v_adcontent = dbox.getString("d_contents");
        v_addate    = dbox.getString("d_ldate");   
        v_adname    = dbox.getString("d_lname");
		v_useyn   	= dbox.getString("d_useyn"); 	
        v_gubun		= dbox.getString("d_gubun");	
        v_month		= dbox.getString("d_lmonth");

		v_realfile    = dbox.getString("d_realfile");
        v_savefile    = dbox.getString("d_savefile");
		
        v_addate     = FormatDate.getFormatDate(v_addate, "yyyy/MM/dd");
        //v_adcontent  = StringManager.replace(data.getAdcontent(),"\n","<br>");
     }  
         
    
    if(v_useyn.equals("Y")) v_useyn = "���";
    else if(v_useyn.equals("N")) v_useyn = "������";
     	
	String  s_gadmin    = box.getSession("gadmin");
    String v_gadmin ="";
    if(!s_gadmin.equals("")){
      v_gadmin = s_gadmin.substring(0,1);
    }
	
%>

<html>
<head>
<title>eIBIs</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

    function modify_notice() {
        document.form1.action = "/servlet/controller.homepage.HomePageAdminSuperiorityMemberServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

    function delete_notice() {
        document.form1.p_searchtext.value = "";
        document.form1.p_search.value     = "";
        document.form1.action = "/servlet/controller.homepage.HomePageAdminSuperiorityMemberServlet";
        document.form1.p_process.value = "delete";
        document.form1.submit();
    }

    function list_notice() {
        document.form1.action = "/servlet/controller.homepage.HomePageAdminSuperiorityMemberServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type = "hidden" name = "p_process"    value = "<%= v_process %>">
    <input type = "hidden" name = "p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_search"     value = "<%=v_search %>">
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_seq"        value = "<%=v_seq %>">
    <input type = "hidden" name = "p_gubun"     value = "<%=v_gubun%>">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
      <td align="center" valign="top"> 
        <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
          <tr> 
            <td><img src="../../../images/admin/homepage/tit_monthlist.gif"></td>
            <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
          </tr>
        </table>
        <!----------------- title �� ----------------->

        <br>
        <br>
        <!----------------- �������� ���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>�ۼ���</strong></td>
            <td height="25" class="table_02_2"><%= v_adname %></td>
          </tr>
          <tr class="table_02_2">
            <td height="25" class="table_title" ><strong>�����</strong></td>
            <td height="25" class="table_02_2"><%= v_addate %></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>�������</strong></td>
            <td height="25" class="table_02_2"><%=v_useyn%></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>�����</strong></td>
            <td height="25" class="table_02_2"><%= v_adtitle %></td>
          </tr>
		  <tr>
            <td width="15%" class="table_title"><strong>�Ѹ���</strong></td>
            <td height="50" class="table_02_2"><br><%= v_singleword %><br></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="50" class="table_02_2"><br><%=v_adcontent%><br></td>
          </tr>
		  <tr>
			<td class = "table_title" align = "center">÷������</td>
			<td class = "table_02_2"  align = "left" >			
<%
			if(v_realfile != null && !v_realfile.equals("")) {  %>
				&nbsp;<img src="<%= conf.getProperty("dir.upload.default")%><%=v_savefile%>" >&nbsp;<a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'><%= v_realfile%></a><br>
				<input type="hidden" name="p_savefile" value="<%=v_savefile%>">
<%		     } 
%>
			</td>
		  </tr>
        </table>
        <!----------------- �������� ���� �� ----------------->

        <br>
        <!----------------- ����, ����, ����Ʈ ��ư ���� ----------------->
        <table width="16%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
          <%if(v_gadmin.equals("A") || ( s_userid.equals(v_aduserid) && (v_gadmin.equals("H") || v_gadmin.equals("K"))) ){%>
            <td align="center"><a href="javascript:modify_notice()"><img src="/images/admin/button/btn_modify.gif" border="0"></a>&nbsp;</td>
            <td align="center"><a href="javascript:delete_notice()"><img src="/images/admin/button/btn_del.gif" border="0"></a>&nbsp;</td>
          <%}%>
            <td align="center"><a href="javascript:list_notice()"><img src="/images/admin/button/btn_list.gif" border="0"></a>&nbsp;</td>
          </tr>
        </table>
        <!----------------- ����, ����, ����Ʈ ��ư �� ----------------->


      </td>
  </tr>
</table>


<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
