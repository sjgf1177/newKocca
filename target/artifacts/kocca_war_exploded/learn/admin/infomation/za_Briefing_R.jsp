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

    String  v_date          = "";
    String  v_title         = "";
    String  v_content       = "";
    String  v_name          = "";
    String  v_flagYn        = "";
    String  v_position      = "";
    String  v_url           = "";
    DataBox dbox = (DataBox)request.getAttribute("selectView");
    
    if (dbox != null) {
        v_title     = dbox.getString("d_title"); 
        v_content   = dbox.getString("d_content");   
        v_date      = dbox.getString("d_ldate");      
        v_name      = dbox.getString("d_name");
        v_flagYn    = dbox.getString("d_flagyn");
        v_position  = dbox.getString("d_position");
        v_url       = dbox.getString("d_url");
     }  
%>
<html>
<head>
<title>::: ȫ�� ��� :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    
    //�������� ����
    function modify_gong() {
        document.form1.action = "/servlet/controller.infomation.BriefingAdminServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }
    
    //�������� ����
    function delete_gong() {
        document.form1.action = "/servlet/controller.infomation.BriefingAdminServlet";
        document.form1.p_process.value = "delete";
        document.form1.submit();
    }
    
    //�������� ����Ʈ
    function list_gong() {
        document.form1.action = "/servlet/controller.infomation.BriefingAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type="hidden" name="p_process"    value = "<%= v_process %>">
    <input type="hidden" name="p_tabseq"     value="<%=v_tabseq%>">
    <input type="hidden" name="p_seq"        value="<%=v_seq%>">
    <input type="hidden" name="p_pageno"     value = "<%=v_pageno %>">
    <input type="hidden" name="p_search"     value = "<%=v_search %>">
    <input type="hidden" name="p_searchtext" value = "<%=v_searchtext %>">
    <input type="hidden" name="p_tabseq"     value = "<%=v_tabseq %>">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 


      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/portal/s.1_12.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->

        <br>
        <!----------------- �������װ��� ���� ----------------->
        <table cellspacing="1" cellpadding="5" class="table_out">
         <tr>
           <td width="13%" class="table_title" class="table_title">�ۼ��� </td>
           <td width="37%"class="table_02_2"><%= v_name %></td>
           <td width="13%" height="25" class="table_title""><b> �����</b></td>
           <td width="37%" class="table_02_2"><%= FormatDate.getFormatDate(v_date, "yyyy/MM/dd") %></td>
       </tr>
       <!--tr>
           <td class="table_title"><strong>�Ҽ�/�̸�</strong></td>
           <td colspan="3" height="25" class="table_02_2"><%=v_position %></td> 
       </tr-->
       <!--tr>
           <td class="table_title" class="table_title">���ο��� </td>
           <td colspan="3" class="table_02_2" colspan="3"><%= v_flagYn.equals("Y") ? "YES" : "NO" %></td>

       </tr-->
       <tr>
           <td class="table_title" class="table_title">���� </td>
           <td class="table_02_2" colspan="3"><%= v_title %></td>
       </tr>
       <tr>
           <td class="table_title" class="table_title">���� </td>
           <td colspan="3" class="table_02_2" colspan="3"><%=v_content%></td>
       </tr>
       <tr>
           <td class="table_title" class="table_title">÷������ </td>
           <td colspan="3" class="table_02_2" colspan="3">
                  <%
                  Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
                  Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
                  %>
                  <%@ include file="/learn/admin/include/za_MultiAttach_R.jsp" %> 
           </td>
       </tr>
       <tr>
           <td class="table_title" class="table_title">����URL </td>
           <td class="table_02_2" colspan="3"><a href="<%= v_url %>" target="_blank"><%= v_url %></a></td>
       </tr>
       
     </table>
        <!----------------- �������װ��� �� ----------------->

        <br>
        <!----------------- ����, ����, ����Ʈ ��ư ���� ----------------->
        <table  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center"><a href="javascript:modify_gong()"><img src="/images/admin/button/btn_modify.gif" border="0"></a></td>
            <td width=4></td>
            <td align="center"><a href="javascript:delete_gong()"><img src="/images/admin/button/btn_del.gif" border="0"></a></td>
            <td width=4></td>
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
