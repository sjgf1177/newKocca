<%
//**********************************************************
//  1. ��      ��: ������(�Ϲ�)
//  2. ���α׷��� : za_DicSubj_R.jsp
//  3. ��      ��: ������(�Ϲ�) �󼼺���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 8
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process        = box.getString("p_process");
    String  v_searchtext     = box.getString("p_searchtext");
    String  ss_upperclass    = box.getString("s_upperclass");    // �����з�
    String  ss_middleclass   = box.getString("s_middleclass");   // �����з�
    String  ss_lowerclass    = box.getString("s_lowerclass");    // �����з�
    String  ss_subj          = box.getString("s_subjcourse");    // �����ڵ�
    String  v_subj           = box.getString("p_subj");
    String  v_upperclassnm   = GetCodenm.get_subjattnm(ss_upperclass); 
    String  v_subjnm         = GetCodenm.get_subjnm(ss_subj); 

    int     v_seq        = 0;
    String  v_subjcode   = "";
    String  v_subjcodenm = "";
    String  v_words      = "";
    String  v_descs      = "";
    String  v_groups     = "";

    DicData data = (DicData)request.getAttribute("selectDic");

    v_seq        = data.getSeq();
    v_words      = data.getWords();
    v_descs      = data.getDescs();
    v_groups     = data.getGroups();
    v_subjcode   = data.getSubj();
    v_subjcodenm = data.getSubjnm();

    v_descs = StringManager.replace(v_descs,"\n","<br>");
%>
<html>
<head>
<title>eIBIs</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

    function modify_dic() {
        document.form1.action = "/servlet/controller.course.DicSubjAdminServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

    function delete_dic() {
        document.form1.p_searchtext.value = "";
        document.form1.action = "/servlet/controller.course.DicSubjAdminServlet";
        document.form1.p_process.value = "delete";
        document.form1.submit();
    }

    function list_dic() {
        document.form1.action = "/servlet/controller.course.DicSubjAdminServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
    }

//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type = "hidden" name = "p_process"     value = "<%= v_process %>">
    <input type = "hidden" name = "p_searchtext"  value = "<%= v_searchtext %>">
    <input type = "hidden" name = "p_seq"         value = "<%=v_seq%>">

    <input type = "hidden" name = "s_upperclass"  value = "<%= ss_upperclass %>">
    <input type = "hidden" name = "s_middleclass" value = "<%= ss_middleclass %>">
    <input type = "hidden" name = "s_lowerclass"  value = "<%= ss_lowerclass %>">
    <input type = "hidden" name = "s_subjcourse"  value = "<%= ss_subj %>">
    <input type = "hidden" name = "p_subj"        value = "<%= v_subj %>">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/co_title02.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	   <!----------------- title �� ----------------->
        <br>
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
		    <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
            <td class=sub_title><%= v_upperclassnm %> &gt; <%= v_subjnm %></td>
          </tr>
		  <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
        </table>
        <!----------------- ������(�Ϲ�) ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr>
            <td class="table_title" width="16%" height="25"><b>�����</b></td>
            <td class="table_02_2" width="81%"><%=v_subjcodenm%></td>
          </tr>
          <tr>
            <td class="table_title" width="16%" height="25"><b>�з�</b></td>
            <td class="table_02_2" width="81%"><%= v_groups %></td>
          </tr>
          <tr>
            <td class="table_title" width="16%" height="25"><b>���</b></td>
            <td class="table_02_2" width="81%"><%=v_words%></td>
          </tr>
          <tr>
            <td class="table_title" height="25" ><b>����</b></td>
            <td class="table_02_2" height="227" valign="top"><br><%=v_descs%><br></td>
          </tr>
        </table>
        <!----------------- ������(�Ϲ�) �� ----------------->

        <br>
        <!----------------- ����, ����, ����Ʈ ��ư ���� ----------------->
        <table border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td><a href="javascript:modify_dic()"><img src="/images/admin/button/btn_modify.gif" border="0"></a></td>
			<td width=8></td>
            <td><a href="javascript:delete_dic()"><img src="/images/admin/button/btn_del.gif" border="0"></a></td>
			<td width=8></td>
            <td><a href="javascript:list_dic()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
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
