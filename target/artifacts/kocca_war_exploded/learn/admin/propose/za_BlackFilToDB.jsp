<%
//**********************************************************
//  1. ��      ��: ������û ���� ����� FileToDB
//  2. ���α׷��� : za_BlackFileToDB.jsp
//  3. ��      ��: ������û ���� ����� FileToDB
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 0.1
//  6. ��      ��:
//  7. ��      ��: ������ 2005.07.19
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.propose.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
  RequestBox box = (RequestBox)request.getAttribute("requestbox");


String  s_grcode	= box.getString("grcode");
String  s_gryear	= box.getString("gryear");
String  s_grseq		= box.getString("grseq");
String  s_conditioncode    = box.getString("conditioncode");

String  v_file1     = box.getString("p_file");


%>
<html>
<head>
<title>�������� ����� �������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
function insert_check() {
  action("insertFileToDB");
}
function preview() {
  action("previewFileToDB");
}
function action(p_process) {                
  

  if(blankCheck(document.form3.p_file.value)){
    alert("DB�� ������ ������ ������ �ּ���");
    return;
  }

  if (document.form3.p_file.value.length > 0 ){
    var data = document.form3.p_file.value;
    data = data.toUpperCase(data);
    if (data.indexOf(".XLS") < 0) {
      alert("DB�� �ԷµǴ� ���������� XLS ���ϸ� �����մϴ�.");
      return;
    }
  }
  document.form3.action = "/servlet/controller.propose.AcceptFileToDBServlet";
  document.form3.p_process.value = p_process;                              
  document.form3.submit();

}

//-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
            <td><img src="/images/admin/system/tit_new_cancelapply.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
      <!----------------- form ���� ----------------->
      <table cellspacing="0" cellpadding="1" class="form_table_out">
      <form name="form1" method="post" action="/servlet/controller.propose.AcceptServlet">
        <input type="hidden" name="p_process" value="">
        <input type="hidden" name="p_action"  value="">

		<tr>
          <td bgcolor="#C6C6C6" align="center">
            <table cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="center" valign="middle">
                  <table cellspacing="0" cellpadding="0" width="99%" class="form_table">
                    <tr>
                      <td>
				     �����׷� : <b>[<%=GetCodenm.get_grcodenm(s_grcode)%>]</b> �������� : <b>[<%=GetCodenm.get_grseqnm(s_grcode, s_gryear, s_grseq)%>]</b> �������౸�� :  <b>[<%=CodeConfigBean.getCodeName("0050",s_conditioncode)%>]</b>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="7"></td>
              </tr>
            </table>
          </td>
        </tr>
      </form>
      </table>
      <!----------------- form �� ----------------->
      <br>
      <!----------------- ã�ƺ��� ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
      <form name="form3" method="post" action="/servlet/controller.propose.AcceptServlet" enctype="multipart/form-data">
        <input type="hidden" name="p_process"   value="">
        <input type="hidden" name="p_action"    value="">
        <input type="hidden" name="p_grcode"	value="<%=s_grcode%>">
        <input type="hidden" name="p_gryear"	value="<%=s_gryear%>">
        <input type="hidden" name="p_grseq"		value="<%=s_grseq%>">
        <input type="hidden" name="p_conditioncode"  value="<%=s_conditioncode%>">

        <tr>
          <td align="center">
            <table width="21%" height="26" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td align="center">
                  <input name="p_file" type="FILE" class="input" size="145">
                </td>
              </tr>
              
            </table>
          </td>
        </tr>
      </table>
      <!----------------- ã�ƺ��� �� ----------------->
      <br>
      <!----------------- �̸�����, Ȯ��, ��� ��ư ���� ----------------->
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="928" height="20" align="right"><a href="javascript:insert_check()"><img src="/images/admin/button/btn_apply.gif"  border="0"></a></td>
		  <td width=10></td>
          <td align="right" width="32"><a href="javascript:preview()"><img src="/images/admin/button/btn_preview.gif" border="0"></a></td>
        </tr>
      </table>


      </form>
      <!----------------- �̸�����, Ȯ��, ��� ��ư �� ----------------->
      <br>
      <br>
      <br>
      <!----------------- ���ǻ��� ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class=dir_txt ><b><font size="3">(���ǻ��� - �ʵ�)</font></b></td>
        </tr>
        <tr>
          <td height="8"></td>
        </tr>
        
        <tr>
          <td height="20" class=dir_txt >1. �������� ����� ���� �������� �����Ͽ� ����� ��</td>
        </tr>
        <tr>
          <td height="20" class=dir_txt >2. �������� �ۼ��� <font color="#A661D7">[<b>���</b>]</font>, <font color="#A661D7">[<b>����(W),����(L) ����</b>]</font>�� ������ ���� ��.</td>
        </tr>
        <tr>
          <td height="20" class=dir_txt >3. ���� ������ ������ ��. ( <a href = '/servlet/controller.library.DownloadServlet?p_savefile=sugangjeyak.xls&p_realfile=sugangjeyak.xls'><b>��������</b></a>)</td>
        </tr>
      </table>
      <!----------------- ���ǻ��� �� ----------------->
      <br>
      
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align='left'>��������</td>
        </tr>
        <tr>
          <td><img src="/images/admin/propose/blacklistExcel.jpg" border="0"></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
</table>
</body>
</html>
