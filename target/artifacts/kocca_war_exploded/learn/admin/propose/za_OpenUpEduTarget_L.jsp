<%
//**********************************************************
//  1. ��      ��: �԰� FileToDB
//  2. ���α׷��� : za_ProposeFileToDB.jsp
//  3. ��      ��: �԰� FileToDB
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 0.1
//  6. ��      ��:
//  7. ��      ��:
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
RequestBox box = null;
box = (RequestBox)request.getAttribute("requestbox");
if (box == null) {
    box = RequestManager.getBox(request);
}

ArrayList list      = null;

String v_userid     = "";
String v_resno      = "";
String v_name       = "";
String v_sex        = "";
String v_email      = "";
String v_cono       = "";
String v_comp       = "";
String v_ismailing  = "";
String v_jikun      = "";
String v_jikunnm    = "";
String v_jikup      = "";
String v_jikupnm    = "";
String v_jikwi      = "";
String v_jikwinm    = "";
String v_compnm     = "";
String v_companynm  = "";
String v_gpmnm      = "";
String v_resno1     = "";
String v_resno2     = "";
String v_isTarget   = "";


int     i           =  0;

String  ss_jikun     = box.getString("s_jikun");      //�˻��з��� �˻�����
String  ss_jikwi     = box.getString("s_jikwi");      //�˻��з��� �˻�����
String  ss_userid     = box.getString("p_userid");     //���
String  ss_name       = box.getString("p_name");       //�̸�
String  ss_compnm     = box.getString("p_compnm");     //�μ���
String  ss_action    = box.getString("p_action");
String  ss_fix_gubun  = box.getStringDefault("s_fix_gubun","direct");

String  ss_grcode     = box.getString("s_grcode");
String  ss_grseq      = box.getString("s_grseq");
String  ss_gyear      = box.getString("s_gyear");
String  ss_subjcourse = box.getString("s_subjcourse");
String  ss_mastercd   = box.getString("s_mastercd");
String  ss_masternm   = box.getString("s_masternm");
String  ss_subjseq    = box.getString("s_subjseq");
String  ss_company    = box.getString("s_company");
String  ss_subjnm     = box.getString("s_subjnm");
String  ss_grcodenm   = box.getString("s_grcodenm");
String  ss_gyearnm    = box.getString("s_gyearnm");

if (ss_action.equals("go")) {    //go button ���ýø� list ���
        list = (ArrayList)request.getAttribute("selectList");
}

int db_count = 0;
ProposeWizardBean probean = new ProposeWizardBean();
//ProposeWizardBean probean = null;
db_count = probean.edutargetCount(box);

String  v_file1     = box.getString("p_file");

%>

<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>

<script language="javascript">
<!--

function insert_check() {
  action("EduTargetinsertFileToDB");
}

function preview() {
  action("EduTargetpreviewFileToDB");
}

function action(p_process) {
  //alert(blankCheck(document.form1.p_file.value));
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
  // alert(document.form1.p_file.value);

  document.form1.action = "/servlet/controller.propose.ProposeWizardServlet";
  document.form1.p_process.value = p_process;
  document.form1.submit();
}


    function whenSelected(){
        //document.form1.p_action.value = p_action;
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.propose.ProposeWizardServlet';
        document.form1.p_process.value = 'memSearch';
        document.form1.submit();
    }
-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<center>

<form name="form1" method="post" action="/servlet/controller.propose.ProposeWizardServlet" enctype="multipart/form-data">
<input type="hidden" name="p_process"    value="">
<input type="hidden" name="s_grcode"     value="<%=ss_grcode%>">
<input type="hidden" name="s_grseq"     value="<%=ss_grseq%>">
<input type="hidden" name="s_gyear"       value="<%=ss_gyear%>">
<input type="hidden" name="s_subjcourse" value="<%=ss_subjcourse%>">
<input type="hidden" name="s_mastercd" value="<%=ss_mastercd%>">
<input type="hidden" name="s_masternm" value="<%=ss_masternm%>">
<input type="hidden" name="s_subjseq"     value="<%=ss_subjseq%>">
<input type="hidden" name="s_company"    value="<%=ss_company%>">
<input type="hidden" name="s_subjnm"    value="<%=ss_subjnm%>">
<input type="hidden" name="s_grcodenm"    value="<%=ss_grcodenm%>">
<input type="hidden" name="s_gyearnm"    value="<%=ss_gyearnm%>">
<input type="hidden" name="p_action"     value="<%=ss_action%>">
<input type="hidden" name="s_upperclass"     value="">
<input type="hidden" name="p_inputlevel" value="student">

<!--input type="hidden" name="s_total"     value=""-->
<table width="97%" border="0" cellspacing="0" cellpadding="0" height="550">
  <tr>
    <td align="center" valign="top">
      <!----------------- �������� �˻� title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/propose/p_title03.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	  <!-------------------Ÿ��Ʋ ��-------------------------->
      <br><br>
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <select name="s_fix_gubun" class="input" align="left" onChange="whenSelected()">
              <option value='direct' <%if(ss_fix_gubun.equals("direct")){out.print("selected");}%>>�����Է�</option>
              <option value='upfile' <%if(ss_fix_gubun.equals("upfile")){out.print("selected");}%>>���Ͼ��ε�</option>
            </select>
          </td>
        </tr>
      </table>
      <br>
      <!----------------- ��������� ���� ��� ��----------------->

      <!--------------------  �����Ͱ������� ------------------------>
      <table cellspacing="0" cellpadding="3" class="form_table_out">
      <tr>
          <td bgcolor="#C6C6C6" align="center">
            <table cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="center" valign="middle">

                  <table width="97%" border="0" cellpadding="0" cellspacing="0" class="form_table">
                  <tr>
                    <td>
                       <b>�����׷�</b> : <%=ss_grcodenm%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>����</b> : <%=ss_gyearnm%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <b>�����Ͱ�����</b> : <%=ss_masternm%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>������������ο�</b> : <%=db_count%>
                    </td>
                  </tr>
                  </table>
                  <table width="90%" border="0" cellspacing="0" cellpadding="0">
                    <tr><td></td></tr>
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
      <br><br>
      <!--------------------  �����Ͱ��������� ------------------------>

      <!----------------- ���̺� ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center">
            <table width="21%" height="26" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td align="center">
                  <input name="p_file" type="FILE" class="input" size="90">
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <!----------------- ���̺� �� ----------------->
      <br>
      <!----------------- �̸�����, Ȯ��, ��� ��ư ���� ----------------->
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="right" height="20"><a href="javascript:insert_check()"><img src="/images/admin/button/btn_apply.gif" border="0"></a></td>
          <td width="6"></td>
          <td align="right" width="65"><a href="javascript:preview()"><img src="/images/admin/button/btn_preview.gif" border="0"></a></td>
        </tr>
      </table>
      <!----------------- �̸�����, Ȯ��, ��� ��ư �� ----------------->
      <br>
      <br>
      <!----------------- ���ǻ��� ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center"><b><font size="3">(���ǻ���)</font></b></td>
        </tr>
        <tr>
          <td height="8"></td>
        </tr>
        <tr>
          <td height="20">1. �������� ����� ���� �������� �����Ͽ� ����� ��</td>
        </tr>
        <tr>
          <td height="20">2. �������� �ۼ��� [<b><font color="#003AEA">�н���ID, ����</font></b>]�� ������ ���� ��.</td>
        </tr>
        <tr>
          <td height="20">3. <font color="red">���� ��� ���� �����ҽ� ġ������ ������ �߻��մϴ�.</font></td>
        </tr>
        <tr>
          <td height="20">4. ���� ������ ������ ��. ( <a href = '/servlet/controller.library.DownloadServlet?p_savefile=Edutarget.xls&p_realfile=Edutarget.xls'><b>��������</b></a>)</td>
        </tr>
      </table>
      <!----------------- ���ǻ��� �� ----------------->
      <!----------------- �ݱ� ��ư ���� ----------------->
      <table cellpadding="0" cellspacing="0" class="table1">
        <tr>
          <td align="center" height="20"><a href="javascript:window.close();"><img src="/images/admin/button/btn_close.gif" border="0"></a></td>
        </tr>
      </table>
      <!----------------- �ݱ� ��ư �� ----------------->
      <br>
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="/images/admin/propose/EduExcel.gif" border="0"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>

</center>
</body>
</html>