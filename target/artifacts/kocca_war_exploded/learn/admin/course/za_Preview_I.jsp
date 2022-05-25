<%
//**********************************************************
//  1. ��      ��: ���������� ���
//  2. ���α׷���: za_Preview_I.jsp
//  3. ��      ��: ���������� ���
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 18
//  7. ��      ��: 
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/jsp/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

	String v_grcode   = box.getString("p_grcode");
    String v_subj     = box.getString("p_subj");
    String v_subjnm   = box.getString("p_subjnm");
    
    String  ss_grcode    = box.getString("s_grcode");           //�����׷�
    String  ss_upperclass = box.getString("s_upperclass");      //������з�
    String  ss_middleclass = box.getString("s_middleclass");    //�����ߺз�
%>
<html>
<head>
<title>������������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
function goPreviewListPage() {
  document.form2.p_process.value = 'previewPage';
  document.form2.submit();
}
function InsertPreview() {
	if(!chkData()) {
	  return;
	}
  document.form2.p_process.value = 'previewInsert';
  document.form2.submit();
}

function chkData() {

  if (blankCheck(document.form2.p_edumans.value)) {
    alert('��������� �Է��Ͻʽÿ�.');
    document.form2.p_edumans.focus();
    return false;
  }

  if (blankCheck(document.form2.p_intro.value)) {
    alert('���������� �Է��Ͻʽÿ�.');
    document.form2.p_intro.focus();
    return false;
  }

  if (blankCheck(document.form2.p_explain.value)) {
    alert('�������� �Է��Ͻʽÿ�.');
    document.form2.p_explain.focus();
    return false;
  }

  return true;
}
-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form2" method="post" action="/servlet/controller.course.SubjectServlet">
  <input type="hidden" name="p_process"  value="">
    <input type="hidden" name="s_upperclass"       value="<%=ss_upperclass%>">
    <input type="hidden" name="s_middleclass"       value="<%=ss_middleclass%>">
    <input type="hidden" name="s_grcode"           value="<%=ss_grcode%>">
    
  <input type="hidden" name="p_subj"     value="<%=v_subj%>">
  <input type="hidden" name="p_subjnm"   value="<%=v_subjnm%>">
  <input type="hidden" name="p_grcode"   value="<%=v_grcode%>">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
      <td align="center" valign="top"> 
        <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
          <tr> 
            <td><img src="../../../images/admin/course/tit_courseguide.gif"></td>
            <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
          </tr>
        </table>
        <!----------------- title �� ----------------->
      <br>
      <!----------------- ������ ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
		  <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>������ : [<%=v_subj%>] <%=v_subjnm%></td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- ������ �� ----------------->
      <!----------------- ���������� ��� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr>
          <td colspan="2" class="table_top_line"></td>
        </tr>
        <tr>
          <td width="16%" class="table_title"><b>�������</b></td>
          <td width="81%" class="table_02_2">
            <input name="p_edumans" type="text" class="input" size="118" maxlength="100">
          </td>
        </tr>
        <tr>
          <td class="table_title"><b>��������</b></td>
          <td class="table_02_2">
            <textarea name="p_intro" cols="100" rows="3"></textarea>
          </td>
        </tr>
        <tr>
          <td class="table_title"><b>��������</b></td>
          <td class="table_02_2">
            <textarea name="p_explain" cols="100" rows="15"></textarea>
          </td>
        </tr>
        <tr>
          <td class="table_title"><b>���Ǳ��� �� ������</b></td>
          <td class="table_02_2">
            <textarea name="p_memo" cols="100" rows="5" tabindex=67></textarea>
          </td>
        </tr>
      </table>
      <!----------------- ���������� ��� �� ----------------->
      <br>
      <!----------------- ���, ����Ʈ ��ư ���� ----------------->
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center"><a href="javascript:InsertPreview()"><img src="/images/admin/button/btn_add.gif" border="0"></a></td>
		  <td width=8></td>
          <td align="center"><a href="javascript:goPreviewListPage()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
        </tr>
      </table>
      <!----------------- ���, ����Ʈ ��ư �� ----------------->
      <br>
    </td>
  </tr>
</table>
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
