<%
//**********************************************************
//  1. ��      ��: ȸ�� ���� ����
//  2. ���α׷���: za_SearchTutor.jsp
//  3. ��      ��: ȸ�� ����(�˾�)
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 9. 23
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    
    String v_receive_userid = box.getString("p_receive_userid");
    
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<SCRIPT LANGUAGE = "JAVASCRIPT" SRC = "/script/cresys_lib.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
<!--
function insertPoint() {
    document.form1.target = "_self";
    document.form1.action = "/servlet/controller.point.PointManageAdminServlet";
    document.form1.p_process.value = "insertPoint";
    document.form1.submit();
}
//-->
</SCRIPT>

</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
    <input type = "hidden" name = "p_process" value = "<%=v_process%>">
    <input type = "hidden" name = "p_receive_userid"  value = "<%=v_receive_userid %>">

<table width="400" border="0" cellpadding="0" cellspacing="10" bgcolor="#f7f7f7">
  <tr>
    <td><table width="400" height="180" border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
        <tr>
          <td align="center" valign='top' bgcolor="#FFFFFF">
          <!----------------- title ���� ----------------->
          <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
            <tr>
              <td><img src="/images/admin/tutor/tit_compeople.gif"></td>
              <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
            </tr>
          </table>
          <br>
            <table width="97%" class="table_out" cellspacing="1" cellpadding="0">
                <tr>
                  <td colspan="2" class="table_top_line"></td>
                </tr>
                <tr>
                  <td width="30%" class="table_title"><b>��������Ʈ</b></td>
                  <td width="70%" class="table_02_2">
                    <input type="text" name="p_receive_point" class="input" style="width:150;">
                  </td>
                </tr>
                <tr>
                  <td width="30%" class="table_title"><b>��������</b></td>
                  <td width="70%" class="table_02_2">
                    <input type="text" name="p_title" class="input" style="width:320;">
                  </td>
                </tr>
            </table>
            <br>
             <!----------------- ���, ��� ��ư ����----------------->                                                                         
 <table border="0" cellspacing="0" cellpadding="0">                                                                                 
   <tr>                                                                                                                             
     <td align="center" class="ms"><a href="javascript:insertPoint()"><img src="/images/admin/button/btn_apply.gif" border="0"></a></td> 
     <td width=8></td>                                                                                                              
     <td align="center" class="ms"><a href="javascript:self.close()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
   </tr>                                                                                                                            
 </table>                                                                                                                           
 <!----------------- ���, ��� ��ư ��----------------->                                                                           
            
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
