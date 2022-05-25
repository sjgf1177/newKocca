<%
//**********************************************************
//  1. ��      �� : ������ Excel Upload
//  2. ���α׷��� : za_DicSubjInput_L.jsp
//  3. ��      �� : ������ Excel Upload
//  4. ȯ      �� : JDK 1.4
//  5. ��      �� : 1.0
//  6. ��      �� : 2004/02/02
//  7. ��      �� :
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.course.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
  RequestBox box = (RequestBox)request.getAttribute("requestbox");

	//2005.12.06_�ϰ��� : ���� -> �����׷����� ����
    //String  ss_subjcourse	= box.getString("s_subjcourse");       //����&�ڽ�
	String  ss_subjcourse	= box.getString("s_grcode");       //�����׷��ڵ�
    String  ss_upperclass	= box.getString("s_upperclass");       //��з�
    String  ss_middleclass	= box.getString("s_middleclass");       //�ߺз�
    String  ss_subjnm		= box.getString("s_subjnm");       //�ߺз�


%>
<html>
<head>
<title>������ EXCEL UPLOAD</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
// ���
function insert_check() {
  action("insertFileToDB");
}

// �̸�����
function preview() {
  action("previewFileToDB");
}

// ��ȸ
function action(p_process) {
  ff1 = document.form1;
  ff3 = document.form3;

  if(blankCheck(ff3.p_file.value)){
    alert("DB�� ������ ������ ������ �ּ���");
    return;
  }
  if (ff3.p_file.value.length > 0 ){
    var data = ff3.p_file.value;
    data = data.toUpperCase(data);
    if (data.indexOf(".XLS") < 0) {
      alert("DB�� �ԷµǴ� ���������� XLS ���ϸ� �����մϴ�.");
      return;
    }
  }

  

  ff3.action = "/servlet/controller.course.DicSubjAdminServlet";
  ff3.p_process.value = "ExcelUploadSave";
  ff3.p_mode.value = p_process;
  ff3.submit();
}

//-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="700" border="0" cellspacing="0" cellpadding="0">
	<tr>
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/co_title02.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	  <!----------------- title �� ----------------->
	<br>
  	<td align="center" valign="top"> 
      <!----------------- form ���� ----------------->
      <table class="form_table_out" cellspacing="0" cellpadding="1">
      <form name="form1" method="post" action="/servlet/controller.complete.FinishInputServlet">
        <input type="hidden" name="p_process" value="">
        <input type="hidden" name="p_action"  value="">
		
        <tr> 
          <td align="center"> 
            <table class="form_table_bg" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="7"></td>
              </tr>
              <tr> 
                <td align="center"> 
                  <table class="form_table" cellspacing="0" cellpadding="0" width="99%">
                    <tr> 
                      <td>
                      ������ : <%=ss_subjnm%>

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
      <form name="form3" method="post" action="/servlet/controller.complete.FinishInputServlet" enctype="multipart/form-data">
      
  		<input type="hidden" name="s_subjcourse"  value="<%=ss_subjcourse%>">
  		<input type="hidden" name="s_upperclass"  value="<%=ss_upperclass%>">
  		<input type="hidden" name="s_middleclass"  value="<%=ss_middleclass%>">
  		<input type="hidden" name="s_subjnm"  value="<%=ss_subjnm%>">
  		
  		
        <input type="hidden" name="p_process"    value="">
        <input type="hidden" name="p_mode"    value="">
        <input type="hidden" name="p_action"     value="">

		
        <tr> 
          <td align="center"> 
            <table width="21%" height="26" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td align="center"> 
                  <input name="p_file" type="FILE" class="input" size=70>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </form>  
      </table>
      <!----------------- ã�ƺ��� �� ----------------->
      <br>
      <!----------------- ���, �̸����� ��ư ���� ----------------->
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="930" height="20" align="right"><a href="javascript:insert_check()"><img src="/images/admin/button/btn_apply.gif"  border="0"></a></td>
		  <td width=8></td>
          <td align="right" width="32"><a href="javascript:preview()"><img src="/images/admin/button/btn_preview.gif" border="0"></a></td>
        </tr>
      </table>
      <!----------------- ���, �̸����� ��ư �� ----------------->
      <br>
      <br>
      <!----------------- ���ǻ��� ���� ----------------->
      <table cellspacing="0" cellpadding="0" class="heed_table">
        <tr> 
          <td class="text_02">(���ǻ���)</td>
        </tr>
        <tr> 
          <td height="8"></td>
        </tr>
        <tr> 
          <td class="heed_table">1. �������� ����� ���� �������� �����Ͽ� ����� ��</td>
        </tr>
        <tr> 
          <td class="heed_table">2. �������� �ۼ��� [<b><font color="#003AEA">���, ����, ����</font></b>]�� ������ 
            ���� ��.</td>
        </tr>
        <tr>
          <td class="heed_table">4. ���� ������ ������ ��. ( <a href = '/servlet/controller.library.DownloadServlet?p_savefile=Sample_DicSubj.xls&p_realfile=Sample_DicSubj.xls'><b>��������</b></a>)</td>
        </tr>
      </table>
      <!----------------- ���ǻ��� �� ----------------->
      <br>
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="/images/admin/course/DicSubj.gif" border="0"></td>
        </tr>
      </table>      
	  </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>      
</table>
</body>
</html>
