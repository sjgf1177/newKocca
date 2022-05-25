<%
//**********************************************************
//  1. ��      ��: �н����-����Ʈ
//  2. ���α׷���: za_EduOperationMap_R.jsp
//  3. ��      ��: �н���� ����Ʈ
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: S.W.Kang
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box  = (RequestBox)request.getAttribute("requestbox");
    String  v_userid    = "";
    String  v_name      = "";
    int     i           = 0;
    String s_userid     = box.getSession("userid");
    String s_username   = box.getSession("name");
    
    ArrayList list = (ArrayList)request.getAttribute("EduOperationMap");

    String  v_subj       = box.getString("p_subj");       //����&�ڽ�
    String  v_subjnm     = box.getString("p_subjnm");
    String  v_comp       = box.getString("p_comp");
    String  ss_action    = box.getString("s_action");   
    
    String v_oid = "", v_sdesc = "", v_ldate = "";
    String v_touch  = "", v_ismail  = "", v_title = "", v_sdesc = "", v_isok = "", v_reason = "", v_ismailopen = "";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<SCRIPT LANGUAGE = "JAVASCRIPT" SRC = "/script/cresys_lib.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
<!--
function EduOperationMap() {
        document.form1.action = "/servlet/controller.course.EduOperationMapServlet";
        document.form1.p_process.value = "EduOperationMap";
        document.form1.p_pageno.value = "1";
        document.form1.submit();
}
//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
   <form name="form1" method="post" action="">
    <input type= "hidden" name="p_process">
    <input type= "hidden" name="s_action"    value="<%=ss_action%>">     <!--in relation to select-->
	<input type= "hidden" name="p_subj"      value="<%=v_subj%>"> <!--in relation to select-->
    <input type= "hidden" name="p_subjnm"    value="<%=v_subjnm %>">
    <input type= "hidden" name="p_userid"    value="">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/beta/b_title05.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" >�н����</td>
        </tr>
      </table>      
	  <!----------------- title �� ----------------->
        <br>
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td><img src="/images/admin/study/icon1.gif" width="14" height="10" border="0">������ : <%=v_subjnm%></td>
            <td><img src="/images/admin/study/icon1.gif" width="14" height="10" border="0">������ȸ�� : <%=v_comp%></td>
            <td align="right"><a href="javascript:studyOpen('<%=v_subj%>')"><img src="/images/admin/button/btn_jindotest.gif" border=0></a></td>
          </tr>
        </table>
        <br>
        <!----------------- ���������н�_���������� �����丮 ����Ʈ ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="5" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="5%" height="25" class="table_title"><b>NO</b></td>
            <td width="40%" class="table_title"><b>������</b></td>
            <td width="10%" class="table_title"><b>�����⵵</b></td>
            <td width="10%" class="table_title"><b>��������</b></td>
            <td width="10%" class="table_title"><b>ID</b></td>
            <td width="10%" class="table_title"><b>touch</b></td>
            <td width="15%" class="table_title"><b>email</b></td>
          </tr>

<%  if(list.size() == 0){   %>    
          <tr> 
              <td class="table_02_1" colspan="6">��ϵ� ������ �����ϴ�.</td>
          </tr>    
<%    } 
          for (i = 0 ; i < list.size() ; i++) {
          DataBox dbox = (DataBox)list.get(i);
          
          v_oid     = dbox.getString("d_oid");
          v_sdesc   = dbox.getString("d_sdesc");
          v_ldate   = dbox.getString("d_ldate");
          v_touch   = dbox.getString("d_touch");
          v_ismail  = dbox.getString("d_ismail");
          v_title   = dbox.getString("d_title");
          v_sdesc   = dbox.getString("d_sdesc");
          v_isok    = dbox.getString("d_isok");
          v_reason  = dbox.getString("d_reason");
          v_ismailopen  = dbox.getString("d_ismailopen");

%>
        <tr>
            <td class="table_01"><%=i+1%></td>
            <td class="table_02_1"></td>
            <td class="table_02_1"><%=v_year%></td>
            <td class="table_02_1"><%=v_subjseq%></td>
            <td class="table_02_1"><%=v_userid%></td>
            <td class="table_02_1"><%=v_touch%></td>
            <td class="table_02_1"><%=v_email%></td>
        </tr>
<%
          }
%>
        </table>
        <!----------------- ������ �����丮 ����Ʈ �� ----------------->
        <br>
        <br>
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="930" align="right"><a href="javascript:first()"><img src="/images/admin/button/btn_firstsangshin.gif" border=0></a></td>
			<td width=10>&nbsp;</td>
            <td width="32" align="right"><a href="javascript:final()"><img src="/images/admin/button/btn_finishsangshin.gif" border=0></a></td>            
          </tr>
        </table>
      </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
