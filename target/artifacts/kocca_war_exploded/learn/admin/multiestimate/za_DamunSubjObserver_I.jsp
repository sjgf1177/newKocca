<%
/**
 * file name : za_DamunSubjObserver_I.jsp
 * date      : 2003/09/03
 * programmer:
 * function  : ���������ϵ��
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.exam.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String  v_subjnm    = box.getString("p_subjnm");
    
    String  v_subj= box.getString("p_subj");

 //   DataBox dbox = (DataBox)request.getAttribute("ETestMasterData");
    
%>
<html>
<head>
<title>������ ���ϵ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function insert_check(process) {
    if(blankCheck(document.form1.p_file.value)){
        alert("DB�� ������ ������ ������ �ּ���");
        return;
    }
    if (document.form1.p_file.value.length > 0 ){
        var data = document.form1.p_file.value;
        data = data.toUpperCase(data);

        if (data.indexOf(".XLS") < 0) {
            alert("DB�� �ԷµǴ� ���������� XLS ���ϸ� �����մϴ�.");
            return;
        }
    }

    document.form1.action = "/servlet/controller.exam.ExamQuestionServlet";
    document.form1.p_process.value = process;
    document.form1.submit();
}


function whenSelection(p_action) {
  document.form1.p_process.value = 'ExamQuestionFileToDB';
  document.form1.p_action.value  = p_action;
  document.form1.action = "/servlet/controller.exam.ExamQuestionServlet";
  document.form1.submit();
}
//-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<!----------------- form ���� ----------------->
<form name="form1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="p_process" value="">
        <input type="hidden" name="p_action"  value="">
        <input type="hidden" name="s_subj"       value="<%=v_subj%>">

<table width="770" border="0" cellspacing="0" cellpadding="0" height="580">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><font size=4><b>���������ϵ��</b></font></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
        <br>
		        <!-------------������ ����-------------------------->
 <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>�ϰ����</td>
        </tr>
        <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table> 
        <!--------------������ ��---------------------------->
        <!----------------- ã�ƺ��� ���� ----------------->
        <table width="97%" border="1" cellspacing="0" cellpadding="0">
                    <tr>
                      <td bgcolor="#C6C6C6" align="center">
                        <table cellspacing="0" cellpadding="0" class="form_table_bg">
                          <tr>
                            <td height="7"></td>
                          </tr>
                          <tr>
                            <td align="center">
                              <table width="99%" cellspacing="0" cellpadding="0" class="form_table">
                                <tr>
                                  <td><input type="radio" name="p_select" value="1" checked>�����Է�&nbsp;<input type="radio" name="p_select" value="2">�����Է�</td>
                                  <td align="center" colspan="2"><input name="p_file" type="FILE" class="input"></td>
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

        </table>
        <!----------------- ã�ƺ��� �� ----------------->

        <br>
        <!----------------- ���, �̸����� ��ư ���� ----------------->
        <table width="97%" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="929" align="right" ><a href="javascript:insert_check('insertFileToDB')"><img src="/images/admin/button/btn_apply.gif" border="0"></a></td>
			<td width=9></td>
            <td width="32" align="right" ><a href="javascript:insert_check('previewFileToDB')"><img src="/images/admin/button/btn_preview.gif" border="0"></a></td>
          </tr>
        </table>
        <!----------------- ���, �̸����� ��ư �� ----------------->

        <br>
        <br>
        <!----------------- ���ǻ��� ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class=dir_txt ><b><font size="3">(���ǻ���)</font></b></td>
        </tr>
        <tr>
          <td height="8"></td>
        </tr>
        <tr>
          <td height="20" class=dir_txt >1. �������� ����� ���� �������� �����Ͽ� ����� ��</td>
        </tr>
        <tr>
          <td height="20" class=dir_txt >2. �������� �ۼ��� <font color="#A661D7">[<b>���� ����</b>]�� [<b>�������� ����</b>]</font>�� ������ ���� ��.</td>
        </tr>
        <tr>
          <td height="20" class=dir_txt >3. <font color="#E60873">���� ��� ���� �����ҽ� ġ������ ������ �߻��մϴ�.</font></td>
        </tr>
        <tr>
          <td height="20" class=dir_txt >4. ���� ������ ������ ��. ( <a href = '/servlet/controller.library.DownloadServlet?p_savefile=Sample_ExamQuestion.xls&p_realfile=Sample_ExamQuestion.xls'><b>���� ��������</b></a>)</td>
        </tr>
      </table>
      <!----------------- ���ǻ��� �� ----------------->
      <br>
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="/images/admin/exam/Sample_ExamQuestion.gif" border="0"></td>
        </tr>
      </table>
      <br>
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="20" class=dir_txt >&nbsp;&nbsp;5. ���� ������ ������ ��. ( <a href = '/servlet/controller.library.DownloadServlet?p_savefile=Sample_ExamQuestionSel.xls&p_realfile=Sample_ExamQuestionSel.xls'><b>�������� ��������</b></a>)</td>
        </tr>
		<br>
		<tr>
          <td><img src="/images/admin/exam/Sample_ExamQuestionSel.gif" border="0"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</form>
<!----------------- form �� ----------------->
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
