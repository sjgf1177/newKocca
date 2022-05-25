<%
/**
 * file name : za_SulmunTargetMemberFileToDB.jsp
 * date      : 2003/09/03
 * programmer:
 * function  : ����� ���� ����� �ϰ�ó��
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.research.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String  v_subjnm    = box.getString("p_subjnm");
    
    String  ss_upperclass= box.getString("s_upperclass");
    String  ss_subj      = box.getString("s_subj");
    String  ss_grcode       = box.getString("s_grcode");
    String  ss_year       = box.getString("s_gyear");
    String  ss_subjseq    = box.getString("s_subjseq");
    String  v_sulpapernum = box.getString("s_sulpapernum");
    String  v_action     = box.getString("p_action");
    String  v_process = box.getString("p_process");

 //   DataBox dbox = (DataBox)request.getAttribute("ETestMasterData");
    
%>
<html>
<head>
<title>����� ���� �ϰ� ���</title>
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

    document.form1.action = "/servlet/controller.research.SulmunTargetMemberServlet";
    document.form1.p_process.value = process;
    document.form1.submit();
}


function whenSelection(p_action) {
  document.form1.p_process.value = 'SulmunMemberFileToDB';
  document.form1.p_action.value  = p_action;
  document.form1.action = "/servlet/controller.research.SulmunTargetMemberServlet";
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
        <input type="hidden" name="s_subj"       value="TARGET">
        <input type="hidden" name="s_grcode"       value="<%=ss_grcode%>">
        <input type="hidden" name="s_sulpapernum"       value="<%=v_sulpapernum%>">
        <input type="hidden" name="s_gyear"       value="<%=ss_year%>">

<table width="770" border="0" cellspacing="0" cellpadding="0" height="580">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/research/r_title03.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
        <br>
        <!----------------- ã�ƺ��� ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center"> 
              <table width="21%" height="26" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td align="center"> 
                    <input name="p_file" type="FILE" size=80 class="input">
                  </td>
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
            <td width="931" height="20" align="right"><a href="javascript:insert_check('insertFileToDB')"><img src="/images/admin/button/btn_apply.gif" border="0"></a></td>
			<td width=7></td>
            <td align="right" width="32"><a href="javascript:insert_check('previewFileToDB')"><img src="/images/admin/button/btn_preview.gif" border="0"></a></td>
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
          <td height="20" class=dir_txt >2. �������� �ۼ��� <font color="#A661D7">[<b>ID</b>]</font>�� ������ ���� ��.</td>
        </tr>
        <tr>
          <td height="20" class=dir_txt >3. <font color="#E60873">���� ��� ���� �����ҽ� ġ������ ������ �߻��մϴ�.</font></td>
        </tr>
        <tr>
          <td height="20" class=dir_txt >4. ���� ������ ������ ��. 
          ( <a href = '/servlet/controller.library.DownloadServlet?p_savefile=Sample_SulmunMember.xls&p_realfile=Sample_SulmunMember.xls'><b>��������</b></a>)
          </td>
        </tr>
      </table>
      <!----------------- ���ǻ��� �� ----------------->
      <br>
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="/images/admin/research/Sample_SulmunMember.gif" border="0"></td>
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
