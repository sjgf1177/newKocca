<%
//**********************************************************
//  1. ��      ��: �н���ȣȸ ��������
//  2. ���α׷���: za_CommunityNotice_I.jsp
//  3. ��      ��: �������� ���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004.02.17
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.community.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

	String v_process  = box.getString("p_process");

    String s_userid		= box.getSession("userid");
    String s_username	= box.getSession("name");
	String v_grtype		= box.getString("p_grtype");

	ArrayList list	= (ArrayList)request.getAttribute("selectCommunityCategoryLevels");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function insert() {
        if (blankCheck(document.form1.p_codenm.value)) {
            alert("�ڵ���� �Է��ϼ���!");
            document.form1.p_title.focus();
            return;
        }
        if (realsize(document.form1.p_codenm.value) > 50) {
            alert("������ �ѱ۱��� 25�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_title.focus();
            return;
        }

        document.form1.action = "/servlet/controller.community.CommunityAdminCategoryServlet";
        document.form1.p_parent.value = document.form1.p_type_l.value;
        document.form1.p_process.value = "insert";
        document.form1.submit();
    }

   function cancel() {
        document.form1.action = "/servlet/controller.community.CommunityAdminCategoryServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
   }

//-->
</SCRIPT>

</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post" enctype = "multipart/form-data">
    <input type="hidden" name="p_parent" value='0'>
    <input type="hidden" name="p_process"	value="<%=v_process %>">
    <input type="hidden" name="p_grtype"	value="<%=v_grtype %>">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
      <td align="center" valign="top"> 
        <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
          <tr> 
            <td><img src="../../../images/admin/community/tit_comm_06.gif"></td>
            <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
          </tr>
        </table>
        <!----------------- title �� ----------------->
        <br>
        <br>

        <!----------------- �ڷ��� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="12%" height="25" class="table_title"><b>�ۼ���</b></td>
            <td class="table_02_2" width="88%"><%=s_username%></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>��з�</b></td>
            <td  class="table_02_2" >
					<select name="p_type_l">
<% 

			for(int i = 0; i < list.size(); i++) 
			{
				DataBox dbox = (DataBox)list.get(i);  

%>					<option value="<%=dbox.getString("d_code")%>" ><%=dbox.getString("d_codenm")%>
<%           } %>
                     </select>
				</td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>Category ��</b></td>
            <td class="table_02_2"> 
				<input type="text" name="p_codenm" class="input" size="60">  
            </td>
          </tr>
        </table>
        <!----------------- �ڷ��� �� ----------------->
        <br>

        <!----------------- ���, ��� ��ư ���� ----------------->
        <table width="11%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center">
            <a href="javascript:insert()"><img src="/images/admin/button/btn_add.gif"  border="0"></a>
            </td>
            <td align="center">
            <a href="javascript:cancel()"><img src="/images/admin/button/btn_cancel.gif"  border="0"></a>
            </td>
          </tr>
        </table>
        <!----------------- ���, ��� ��ư �� ----------------->
        <br>

      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
