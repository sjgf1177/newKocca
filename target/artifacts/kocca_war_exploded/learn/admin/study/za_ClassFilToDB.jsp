<%
//**********************************************************
//  1. ��      ��: Ŭ������� FileToDB
//  2. ���α׷��� : za_ClassFileToDB.jsp
//  3. ��      ��: Ŭ������� FileToDB
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 0.1
//  6. ��      ��:
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.propose.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String  ss_grcode       = box.getString("s_grcode");           //�����׷�
    String  ss_gyear        = box.getString("s_gyear");            //�⵵
    String  ss_grseq        = box.getString("s_grseq");            //��������
    String  ss_grseqnm      = box.getString("s_grseqnm");          //����������
    String  ss_upperclass   = box.getString("s_upperclass");      //������з�
    String  ss_middleclass  = box.getString("s_middleclass");    //�����ߺз�
    String  ss_lowerclass   = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse   = box.getString("s_subjcourse");       //����&�ڽ�
    String  ss_subjseq      = box.getString("s_subjseq");          //���� ����

%>
<html>
<head>
<title></title>
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

// ���μ������� ó��
function action(p_process) {
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

    if (chkParam() == false) {
      return;
    }

  document.form1.s_subjnm.value = document.form1.s_subjcourse.options[document.form1.s_subjcourse.selectedIndex].text;
  document.form1.s_grcodenm.value = document.form1.s_grcode.options[document.form1.s_grcode.selectedIndex].text;
  document.form1.s_subjseqgrnm.value = document.form1.s_subjseq.options[document.form1.s_subjseq.selectedIndex].text;

  document.form1.target = "_self";
  document.form1.action = "/servlet/controller.study.ClassServlet";
  document.form1.p_process.value = p_process;                              //insertFileToDB,previewFileToDB
  document.form1.submit();
}

// �˻����� üũ
function chkParam() {
  if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
    alert("�����׷��� �����ϼ���.");
    return false;
  }
  if (document.form1.s_grseq.value == 'ALL' || document.form1.s_grseq.value == '----') {
    alert("���������� �����ϼ���.");
    return false;
  }
  if (document.form1.s_subjcourse.value != 'ALL' && document.form1.s_subjcourse.value != '----') {
      if (document.form1.s_subjseq.value == 'ALL' || document.form1.s_subjseq.value == '----') {
        alert("���������� �����ϼ���.");
        return false;
      }
  }
}

// �������� �� �����ڵ� ��������
function whenExcel() {

    window.self.name = "classTutor";
    open_window("openExcel","","100","100","700","400","yes","yes","yes","yes","yes");
    document.form1.target = "openExcel";
    document.form1.action='/servlet/controller.study.ClassServlet';
    document.form1.p_process.value = 'classStudentListExcel';
    document.form1.submit();

    document.form1.target = window.self.name;
}

// �˻�
function whenSelection(p_action) {
  document.form1.p_process.value = 'classFileToDBPage';
  document.form1.p_action.value = p_action;
  document.form1.submit();
}
//-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<form name="form1" method="post" action="/servlet/controller.study.ClassServlet" enctype="multipart/form-data">
    <input type="hidden" name="p_process" value="">
    <input type="hidden" name="p_action"  value="">

    <input type="hidden" name="s_subjnm"      value="">
    <input type="hidden" name="s_grcodenm"   value="">
    <input type="hidden" name="s_subjseqgrnm"   value="">

<table width="700" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
     <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/study/tit_class.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>

      <!----------------- SELECT ���� ----------------->
      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <tr>
          <td bgcolor="#C6C6C6" align="center">
            <table cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="center" valign="middle">
                  <table border="0" cellspacing="0" cellpadding="0" width="99%" class="form_table">
                    <tr>
                      <td width="40%" colspan="2" align="left" valign="middle">
                        <!------------------- ���ǰ˻� ���� ------------------------->
                        <font color="red">��</font> <%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
                      </td>
                      <td width="60%" colspan="2">
                        <font color="red">��</font> <%= SelectEduBean.getGyear(box, true)%><!-- getGyear(RequestBox, isChange)   �����⵵  -->
                        <font color="red">��</font> <%= SelectEduBean.getGrseq(box, true, false)%><!-- getGrseq(RequestBox, isChange, isALL)   ��������  -->
                        <!--input type= "hidden" name="s_grseq" value="0001"-->
                      </td>
                    </tr>
                    <tr>
                        <td height="5"></td>
                    </tr>

<!--
                    <tr>
                      <td align="left" colspan="3">
                        <%= SelectSubjBean.getUpperClass(box, true, true, true)%>< !-- getUpperclass(RequestBox, isChange, isALL, isStatisticalPage)    ������з�  -- >
                        <%= SelectSubjBean.getMiddleClass(box, true, true, true)%>< !-- getMiddleclass(RequestBox, isChange, isALL, isStatisticalPage)    �����ߺз�  -- >
                        <%= SelectSubjBean.getLowerClass(box, true, true, true)%>< !-- getLowerclass(RequestBox, isChange, isALL, isStatisticalPage)    �����Һз�  -- >
                        </td>
                     </tr>
                    <tr>
                        <td height="5"></td>
                    </tr>
-->
                    <tr>
                      <td align="left" colspan="3">
                        <%= SelectSubjBean.getSubj(box, true, true)%><!-- getSubj(RequestBox, isChange, isALL)    ����  -->
                        <%= SelectSubjBean.getSubjseq(box, true, true)%><!-- getSubjseq(RequestBox, isChange, isALL)    ��������  -->
                        <!-------------------- ���ǰ˻� �� ---------------------------->
                        </td>
                     </tr>
                    <tr>

                  </table>
                </td>
              </tr>
			  <td align="right">
				 <a href="javascript:whenExcel()"><img src="/images/admin/button/btn_coursecode_excell.gif" border="0"></a>
				</td>
			 </tr>
              <tr>
                <td height="7"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <!----------------- SELECT �� ----------------->
      <br>
      <!----------------- ã�ƺ��� ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0">

        <tr>
          <td align="center">
            <table width="21%" height="26" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td align="center">
                  <input name="p_file" type="FILE" class="input" size="100">
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
          <td width="928" height="20" align="right"><a href="javascript:insert_check()"><img src="/images/admin/button/btn_add.gif"  border="0"></a></td>
          <td width=10></td>
          <td align="right" width="32"><a href="javascript:preview()"><img src="/images/admin/button/btn_preview.gif" border="0"></a></td>
        </tr>
      </table>

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
          <td height="20" class=dir_txt >1. <font color="#E60873">������ ���������� ���ε�ÿ��� Ŭ����,�н���ID,����ID �ʵ常 �Է��Ұ�.(��������+��������)</font>( <a href = '/servlet/controller.library.DownloadServlet?p_savefile=ClassExcel1.xls&p_realfile=ClassExcel1.xls'><b>��������1</b></a>)</td>
        </tr>
        <tr>
          <td height="20" class=dir_txt >2. <font color="#E60873">���� ALL������ ���ε�ÿ��� ���������ۼ��� ����ĭ/����ĭ�� �ݵ�� �Է��Ұ�.(����ALL + ����ALL)</font>( <a href = '/servlet/controller.library.DownloadServlet?p_savefile=ClassExcel2.xls&p_realfile=ClassExcel2.xls'><b>��������2</b></a>)</td>
        </tr>
        <tr>
        <tr>
          <td height="20" class=dir_txt >3. �������� ����� ���� �������� �����Ͽ� ����� ��</td>
        </tr>
        <tr>
          <td height="20" class=dir_txt >4. �������� �ۼ��� <font color="#A661D7">[<b>Ŭ����, �н���ID, ����ID, ( ���� ), ( ���� ) </b>]</font>�� ������ ���� ��.</td>
        </tr>
      </table>
      <!----------------- ���ǻ��� �� ----------------->
      <br>
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align='left'>��������1</td>
        </tr>
        <tr>
          <td><img src="/images/admin/propose/ClassExcel1.gif" border="0"></td>
        </tr>
      </table>
      <br>
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align='left'>��������2</td>
        </tr>
        <tr>
          <td><img src="/images/admin/propose/ClassExcel2.gif" border="0"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
