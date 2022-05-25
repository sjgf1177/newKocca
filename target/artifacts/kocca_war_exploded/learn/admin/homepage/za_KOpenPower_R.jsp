<%
//**********************************************************
//  1. ��      ��: �Ŀ����ͺ� �󼼺���
//  2. ���α׷��� : za_KOpenPower_R.jsp
//  3. ��      ��: Ȩ������ ���� �Ŀ����ͺ� �󼼺���
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: 
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

    int    v_cnt		= 0;            // ��ȸ��
    String v_title		= "";           // ����
    String v_content    = "";           // ����
    String v_date       = "";           // �����
    String v_name       = "";           // �����
    String v_userid     = "";           // userid
	String v_comptext   = "";	        // �Ҽ�
	String v_target     = "";
	String v_targetnm   = "";

    String v_useyn   	= "";			// �������
    String v_month		= "";			// �ش��
    
    String v_realfile	= "";
    String v_savefile	= "";
    
    DataBox dbox = (DataBox)request.getAttribute("selectView");
    
    if (dbox != null) {    
        v_cnt			= dbox.getInt("d_cnt");
        v_title			= dbox.getString("d_title"); 
		v_comptext		= dbox.getString("d_comptext"); 
        v_content		= dbox.getString("d_contents");
        v_date			= dbox.getString("d_indate");   
        v_name			= dbox.getString("d_lname");
		v_useyn   		= dbox.getString("d_useyn"); 	
		v_realfile		= dbox.getString("d_realfile");
        v_savefile		= dbox.getString("d_savefile");
        v_target        = dbox.getString("d_target");
        v_targetnm      = dbox.getString("d_targetnm");
		
        v_date     = FormatDate.getFormatDate(v_date, "yyyy/MM/dd");
     }  
            	
	String  s_gadmin    = box.getSession("gadmin");
    String v_gadmin ="";
    if(!s_gadmin.equals("")){
      v_gadmin = s_gadmin.substring(0,1);
    }
	
%>

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

    function modify_notice() {
        document.form1.action = "/servlet/controller.homepage.KOpenPowerAdminServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

    function delete_notice() {
        document.form1.p_searchtext.value = "";
        document.form1.p_search.value     = "";
        document.form1.action = "/servlet/controller.homepage.KOpenPowerAdminServlet";
        document.form1.p_process.value = "delete";
        document.form1.submit();
    }

    function list_notice() {
        document.form1.action = "/servlet/controller.homepage.KOpenPowerAdminServlet";
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
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
      <td align="center" valign="top"> 
        <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
          <tr> 
            <td><img src="/images/admin/homepage/tit_power.gif"></td>
            <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
          </tr>
        </table>
        <!----------------- title �� ----------------->

        <br>
        <br>
        <!----------------- �������� ���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="4" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>�ۼ���</strong></td>
            <td width="35%" height="25" class="table_02_2"><%= v_name %></td>
            <td width="15%" height="25" class="table_title" ><strong>�����</strong></td>
            <td width="35%" height="25" class="table_02_2"><%= v_date %></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>���ͺ���</strong></td>
            <td height="25" class="table_02_2"><%=v_targetnm  %></td>
            <td width="15%" class="table_title"><strong>�Ҽ�/�̸�</strong></td>
            <td height="25" class="table_02_2"><%= v_comptext %></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>�������</strong></td>
            <td colspan="3" height="25" class="table_02_2"><br><%= v_useyn %><br></td>
          </tr>
		  <tr>
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td colspan="3" height="25" class="table_02_2"><br><%= v_title %><br></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td colspan="3" height="50" class="table_02_2"><br><%=v_content%><br></td>
          </tr>
		  <tr>
			<td class = "table_title" align = "center">÷������</td>
			<td colspan="3" class = "table_02_2"  align = "left" >			
<%
			if(v_realfile != null && !v_realfile.equals("")) {  %>
				&nbsp;<a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'><%= v_realfile%></a><br>
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
          <%if(v_gadmin.equals("A") || ( s_userid.equals(v_userid) && (v_gadmin.equals("H") || v_gadmin.equals("K"))) ){%>
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

