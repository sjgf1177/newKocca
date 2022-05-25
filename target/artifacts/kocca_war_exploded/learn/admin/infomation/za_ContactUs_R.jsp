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
    
    int     v_tabseq        = box.getInt("p_tabseq");
    int     v_seq           = box.getInt("p_seq");
    int     v_pageno        = box.getInt("p_pageno");
    
    String  v_searchtext    = box.getString("p_searchtext");
    String  v_search        = box.getString("p_search");

    String  v_company      	= "";
    String  v_addr         	= "";
    String  v_com_dept     	= "";
    String  v_com_name     	= "";
    String  v_tel        	= "";
    String  v_mobile   		= "";
    String  v_email         = "";
    String  v_homepage     	= "";
    String  v_category     	= "";
    String  v_edustart     	= "";
    String  v_eduend     	= "";
    String  v_edustartday  	= "";
    String  v_eduperiod   	= "";
    String  v_edustudent    = "";    
    String  v_edusubjcnt    = "";
    String  v_apply_gubun   = "";
    String  v_apply_subj    = "";
    String  v_etc     		= "";
    String  v_domain  		= "";
    String  v_savefile_l   	= "";
    String  v_date   		= "";
    
    DataBox dbox = (DataBox)request.getAttribute("selectView");
    
    if (dbox != null) {
        v_company		= dbox.getString("d_company"); 
        v_addr   		= dbox.getString("d_addr");   
        v_com_dept      = dbox.getString("d_com_dept");      
        v_com_name      = dbox.getString("d_com_name");
        v_tel    		= dbox.getString("d_tel");
        v_mobile  		= dbox.getString("d_mobile");
        v_email       	= dbox.getString("d_email");        
        v_homepage   	= dbox.getString("d_homepage");   
        v_category      = dbox.getString("d_category");      
        v_edustart      = dbox.getString("d_edustart");
        v_eduend   		= dbox.getString("d_eduend");
        v_edustartday	= dbox.getString("d_edustartday");
        v_eduperiod    	= dbox.getString("d_eduperiod");
        v_edustudent	= dbox.getString("d_edustudent");
        v_edusubjcnt	= dbox.getString("d_edusubjcnt");
        v_apply_gubun  	= dbox.getString("d_apply_gubun");        
        v_apply_subj  	= dbox.getString("d_apply_subj");   
        v_etc      		= dbox.getString("d_etc");      
        v_domain	    = dbox.getString("d_domain");
        v_savefile_l	= dbox.getString("d_savefile_l");
        v_date	    	= dbox.getString("d_ldate");
		
     }  
%>
<html>
<head>
<title>::: ContactUS :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    
    // ����Ʈ
    function list_gong() {
        document.form1.action = "/servlet/controller.infomation.ContactUsAdminServlet";
        document.form1.p_process.value = "selectList";
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
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/portal/s.3.1.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->

        <br>
        <!----------------- �������װ��� ���� ----------------->
        <table cellspacing="1" cellpadding="5" class="table_out">
         <tr>
           <td width="13%" class="table_title" class="table_title">ȸ�� </td>
           <td width="37%"class="table_02_2"><%= v_company %></td>
           <td width="13%" height="25" class="table_title""><b> �����</b></td>
           <td width="37%" class="table_02_2"><%= FormatDate.getFormatDate(v_date, "yyyy/MM/dd") %></td>
       </tr>
       <tr>
           <td class="table_title"><strong>�ּ�</strong></td>
           <td colspan="3" height="25" class="table_02_2"><%=v_addr %></td> 
       </tr>
       
       <tr>
           <td class="table_title"><strong>�̸�/�Ҽ�</strong></td>
           <td colspan="3" height="25" class="table_02_2"><%=v_com_name %> / <%=v_com_dept %></td> 
       </tr>
       <tr>
           <td width="13%" class="table_title" class="table_title">��ȭ </td>
           <td width="37%"class="table_02_2"><%= v_tel %></td>
           <td width="13%" height="25" class="table_title""><b> �ڵ���</b></td>
           <td width="37%" class="table_02_2"><%= v_mobile  %></td>
       </tr>
       
        <tr>
           <td width="13%" class="table_title" class="table_title">�̸��� </td>
           <td width="37%"class="table_02_2"><%= v_email %></td>
           <td width="13%" height="25" class="table_title""><b> Ȩ������</b></td>
           <td width="37%" class="table_02_2"><%= v_homepage  %></td>
       </tr>
       
        <tr>
           <td class="table_title"><strong>ī�װ�</strong></td>
           <td colspan="3" height="25" class="table_02_2"><%=v_category %></td> 
       </tr>
       
       <tr>
           <td width="13%" class="table_title" class="table_title">������û�Ⱓ </td>
           <td width="37%"class="table_02_2">[<%= v_edustart %>] - [<%= v_eduend  %>]</td>
           <td width="13%" height="25" class="table_title""><b> ����������</b></td>
           <td width="37%" class="table_02_2"><%= v_edustartday %></td>
       </tr>
       
       <tr>
           <td width="13%" class="table_title" class="table_title">�����Ⱓ </td>
           <td width="37%"class="table_02_2"><%= v_eduperiod %></td>
           <td width="13%" height="25" class="table_title""><b> �����л���</b></td>
           <td width="37%" class="table_02_2"><%= v_edustudent  %></td>
       </tr>
       
        <tr>
           <td width="13%" class="table_title" class="table_title">����� </td>
           <td width="37%"class="table_02_2"><%= v_edusubjcnt %></td>
           <td width="13%" height="25" class="table_title""><b> ��û������</b></td>
           <td width="37%" class="table_02_2"><%= v_domain  %></td>
       </tr>
       
       <tr>
           <td class="table_title"><strong>�о�</strong></td>
           <td colspan="3" height="25" class="table_02_2"><%=v_apply_gubun %></td> 
       </tr>
       
       <tr>
           <td class="table_title"><strong>����</strong></td>
           <td colspan="3" height="25" class="table_02_2"><%=v_apply_subj %></td> 
       </tr>
       
       <tr>
           <td class="table_title" class="table_title">���� </td>
           <td colspan="3" class="table_02_2" colspan="3"><%=v_etc%></td>
       </tr>
       <% if (!v_savefile_l.equals("")) { %>
       <tr>
           <td class="table_title" class="table_title">�ΰ� </td>
           <td colspan="3" class="table_02_2" colspan="3"><img src="<%=v_savefile_l%>"></td>
       </tr>
       <% } %>
    
     </table>
        <!----------------- �������װ��� �� ----------------->

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
