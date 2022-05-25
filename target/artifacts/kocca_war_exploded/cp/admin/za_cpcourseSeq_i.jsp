<%
//**********************************************************
//  1. ��      ��: �������� ��ü���� ���
//  2. ���α׷���: za_cpcourseSeq_i.jsp
//  3. ��      ��: �������� ��ü���� ���ȭ��
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2004.12.26
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%//@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
RequestBox box = (RequestBox)request.getAttribute("requestbox");

int i = 0, v_dispnum = 0, v_totalpage = 0, v_rowcount = 0;
String v_subjnm = "", v_cpnm = "", v_cpsubjseq = "";
String v_propstart = "", v_propend = "", v_edustart = "", v_eduend = "";

CPSubjseqData da = (CPSubjseqData)request.getAttribute("selectCourseCPseq");   
    
//DataBox dbox = (DataBox)request.getAttribute("selectCourseCPseq");
   
String v_searchtext = box.getString("p_searchtext");
int v_pageno = box.getInt("p_pageno"); 
String v_gyear = box.getString("s_gyear");
String v_grcode = box.getString("s_grcode");
String v_cp = box.getString("p_cp");
String v_subj = box.getString("p_subj");
String v_year = box.getString("p_year");
String v_subjseq = box.getString("p_subjseq");
String v_subjseqgr = box.getString("p_subjseqgr");

//v_year   = dbox.getString("d_year");
//v_subj   = dbox.getString("d_subj");

v_subjnm   = da.getSubjnm();
v_cpsubjseq    = da.getCPsubjseq();


if(da.getPropstart().length() > 7) v_propstart    = StringManager.substring(da.getPropstart(),0,8);
if(da.getPropend().length() > 7) v_propend    = StringManager.substring(da.getPropend(),0,8);
if(da.getEdustart().length() > 7) v_edustart    = StringManager.substring(da.getEdustart(),0,8);
if(da.getEduend().length() > 7) v_eduend    = StringManager.substring(da.getEduend(),0,8);

//String s_userid = box.getSession("userid");
//String s_usernm = box.getSession("username");


%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language="javascript">
function listpage(){
	document.form1.action = "/servlet/controller.cp.CPCourseSeqServlet";
	document.form1.p_process.value = "";
	document.form1.p_action.value = "go";  
	document.form1.submit();
}

function insert(){
	var result;
	
	result = weightChk();
	
	if(!result){
		alert('�ٽ� �Է��Ͽ� �ֽʽÿ�.');
		return;
	}
	
	//if(document.form1.p_cpsubjseq.value.length > 0){
	
		document.form1.action = "/servlet/controller.cp.CPCourseSeqServlet";
		document.form1.p_process.value = "insert";
		document.form1.submit();
		
	//}
	//else{
	//	alert("��ü���������� �Է��ϼ���.");
	//	document.form1.p_cpsubjseq.focus();
	//	return;
	//}
}

function weightChk(){
	var sum = 0;
	ff = document.form1;
	if (!number_chk_noalert(ff.p_point.value)) {
		alert('�̼������� �߸��ԷµǾ����ϴ�.');
		return false;
	}
	if (!number_chk_noalert(ff.p_gradscore.value)) {
		alert('�̼�����-������ �߸��ԷµǾ����ϴ�.');
		return false;
	}
	if (!number_chk_noalert(ff.p_gradstep.value)) {
		alert('�̼�����-�������� �߸��ԷµǾ����ϴ�.');
		return false;
	}
	if (!number_chk_noalert(ff.p_gradexam.value)) {
		alert('�̼�����-�߰��򰡰� �߸��ԷµǾ����ϴ�.');
		return false;
	}
	if (!number_chk_noalert(ff.p_gradftest.value)) {
		alert('�̼�����-�����򰡰� �߸��ԷµǾ����ϴ�.');
		return false;
	}
	if (!number_chk_noalert(ff.p_gradhtest.value)) {
		alert('�̼�����-�����򰡰� �߸��ԷµǾ����ϴ�.');
		return false;
	}
		
	if (!number_chk_noalert(ff.p_gradreport.value)) {
		alert('�̼�����-����Ʈ�� �߸��ԷµǾ����ϴ�.');
		return false;
	}
	if (ff.p_gradscore.value > 100) {
		alert('�̼�����-������ 100 �̻��Դϴ�.');
		return false;
	}
	if (ff.p_gradstep.value > 100) {
		alert('�̼�����-�������� 100 �̻��Դϴ�.');
		return false;
	}
	if (ff.p_gradexam.value > 100) {
		alert('�̼�����-�߰��򰡰� 100 �̻��Դϴ�.');
		return false;
	}
	if (ff.p_gradftest.value > 100) {
		alert('�̼�����-�����򰡰� 100 �̻��Դϴ�.');
		return false;
	}
	if (ff.p_gradhtest.value > 100) {
		alert('�̼�����-�����򰡰� 100 �̻��Դϴ�.');
		return false;
	}
	if (ff.p_gradreport.value > 100) {
		alert('�̼�����-����Ʈ�� 100 �̻��Դϴ�.');
		return false;
	}	
	
	
	if (!number_chk_noalert(ff.p_wstep.value)) {
	  alert('����ġ-������(%)�� �߸��ԷµǾ����ϴ�.');
	  return false;
	}
	if (!number_chk_noalert(ff.p_wmtest.value)) {
	  alert('����ġ-�߰���(%)�� �߸��ԷµǾ����ϴ�.');
	  return false;
	}
	if (!number_chk_noalert(ff.p_wftest.value)) {
	  alert('����ġ-������(%)�� �߸��ԷµǾ����ϴ�.');
	  return false;
	}
	if (!number_chk_noalert(ff.p_wreport.value)) {
	  alert('����ġ-����Ʈ(%)�� �߸��ԷµǾ����ϴ�.');
	  return false;
	}
	if (!number_chk_noalert(ff.p_wetc1.value)) {
	  alert('����ġ-��Ÿ1(%)�� �߸��ԷµǾ����ϴ�.');
	  return false;
	}
	if (!number_chk_noalert(ff.p_wetc2.value)) {
	  alert('����ġ-��Ÿ2(%)�� �߸��ԷµǾ����ϴ�.');
	  return false;
	}
	
  var weight =  parseFloat(ff.p_wstep.value,10) +  parseFloat(ff.p_wmtest.value,10) + parseFloat(ff.p_wftest.value,10) + parseFloat(ff.p_whtest.value,10) + parseFloat(ff.p_wreport.value,10) +  parseFloat(ff.p_wact.value,10) + parseFloat(ff.p_wetc1.value,10) + parseFloat(ff.p_wetc2.value,10);
  if (weight < 100) {
    alert('����ġ�� 100% ���� �����ϴ�');
    return false;
  } else if (weight > 100) {
    alert('����ġ�� 100% ���� �����ϴ�.');
    return false;
  }
  
	/*
	var weight =  parseFloat(ff.p_wstep.value,10) + parseFloat(ff.p_wmtest.value,10) + parseFloat(ff.p_wftest.value,10) + parseFloat(ff.p_whtest.value,10)+ parseFloat(ff.p_wreport.value,10) + parseFloat(ff.p_wact.value,10) + parseFloat(ff.p_wetc1.value,10) + parseFloat(ff.p_wetc2.value,10);
	if (weight < 100) {
	  alert('����ġ�� 100% ���� �����ϴ�');
		return false;
	} else if (weight > 100) {
	  alert('����ġ�� 100% ���� �����ϴ�.');
		return false;
	}
	*/
	return true;
}
</script>
</head>

<body topmargin=0 leftmargin=0>	
<form name="form1" action="" method="post">
<input type="hidden" name="p_process" value="">
<input type="hidden" name="p_action" value="">
<input type="hidden" name="p_year" value="<%=v_year%>">
<input type="hidden" name="p_subj" value="<%=v_subj%>">
<input type="hidden" name="p_subjseq" value="<%=v_subjseq%>">
<input type="hidden" name="p_subjseqgr" value="<%=v_subjseqgr%>">
<input type="hidden" name="p_searchtext" value="<%=v_searchtext%>">
<input type="hidden" name="p_pageno" value="<%=v_pageno%>">
<input type="hidden" name="s_grcode" value="<%=v_grcode%>">
<input type="hidden" name="s_gyear" value="<%=v_gyear%>">
<input type="hidden" name="p_cp" value="<%=v_cp%>">
<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
	
	<table width="970" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
            <td><img src="/images/admin/cp/cp_tit_cha.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	   
      <br>
      <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>�������� ��������</td>
        </tr>
        <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table>  
	  <table width="970"  border="0"  cellpadding="0" cellspacing="1" class="table_out">
        <tr> 
          <td colspan="2" class="table_top_line"></td>
        </tr>
        <tr> 
          <td class="table_title" width="22%">�����</td>
          <td class="table_02_2"  width="78%"><%=v_gyear%></td>
        </tr>
        <tr> 
          <td class="table_title" width="22%">������</td>
          <td class="table_02_2"  width="78%"><%=v_subjnm%></td>
        </tr>
        <tr> 
          <td class="table_title" width="22%">����</td>
          <td class="table_02_2"  width="78%"><%=StringManager.toInt(v_subjseqgr)%></td>
        </tr>
        <tr> 
          <td class="table_title" width="22%">��ü��������</td>
          <td class="table_02_2"  width="78%"><input name="p_cpsubjseq" type="text" class="input" style="width:50" value="<%=v_cpsubjseq%>"></td>
        </tr>
        <tr> 
          <td class="table_title">������û�Ⱓ</td>
          <td class="table_02_2"><%=FormatDate.getFormatDate(v_propstart,"yyyy/MM/dd")%> - <%=FormatDate.getFormatDate(v_propend,"yyyy/MM/dd")%></td>
        </tr>
        <tr>
          <td class="table_title">�н��Ⱓ</td>
          <td class="table_02_2"><%=FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd")%> - <%=FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd")%></td>
        </tr>
      </table>
<br>

	<!----------------- ������������ ���� ----------------->
	<table class="table_out" cellspacing="1" cellpadding="6">	
	  <tr> 
		    <td colspan="2" align="center" class="table_01" width="10%">�� �� �� ��</td>
		    <td colspan="2" align="center" class="table_01" width="10%">�� �� ġ (%)</td>
	  </tr>
	  <tr> 
            <td class="table_01" width="15%">������</td>
            <td class="table_02_2" width="25%"><%=String.valueOf(da.getGradstep())%><input type="hidden" class="input" name="p_gradstep" size="10" maxlength="5" value="<%=String.valueOf(da.getGradstep())%>"></td>
			<td height="27" align="center" class="table_01" width="15%">������</td>
			<td class="table_02_2" width="25%"><%=da.getWstep()%><input name="p_wstep" type="hidden" class="input" size="4" value="<%=da.getWstep()%>"> 
	  </tr>
	  <tr> 
            <td class="table_01">�߰���</td>
            <td class="table_02_2"><%=String.valueOf(da.getGradexam())%><input type="hidden" class="input" name="p_gradexam" size="10" maxlength="5" value="<%=String.valueOf(da.getGradexam())%>"></td>
		    <td align="center" class="table_01">�߰���</td>
		    <td class="table_02_2"><%=da.getWmtest()%><input name="p_wmtest" type="hidden" class="input" size="4" value="<%=da.getWmtest()%>"> 
			</td>
	  </tr>
	  <tr> 
            <td class="table_01">������</td>
            <td class="table_02_2"><%=String.valueOf(da.getGradftest())%><input type="hidden" class="input" name="p_gradftest" size="10" maxlength="5" value="<%=String.valueOf(da.getGradftest())%>"></td>
		    <td align="center" class="table_01">������</td>
		    <td class="table_02_2"><%=da.getWftest()%><input name="p_wftest" type="hidden" class="input" size="4" value="<%=da.getWftest()%>"> 
		    </td>
	  </tr>
	  <tr> 
            <td class="table_01">������</td>
            <td class="table_02_2"><%=String.valueOf(da.getGradhtest())%><input type="hidden" class="input" name="p_gradhtest" size="10" maxlength="5" value="<%=String.valueOf(da.getGradhtest())%>"></td>
			<td align="center" class="table_01">������</td>
			<td class="table_02_2"><%=da.getWhtest()%><input name="p_whtest" type="hidden" class="input" size="4" value="<%=da.getWhtest()%>"></td>
	  </tr>
	  <tr>
            <td class="table_01">����Ʈ</td>
            <td class="table_02_2" ><%=String.valueOf(da.getGradreport())%><input type="hidden" class="input" name="p_gradreport" size="10" maxlength="5" value="<%=String.valueOf(da.getGradreport())%>"></td>
			<td align="center" class="table_01">����Ʈ</td>
			<td class="table_02_2"><%=da.getWreport()%><input name="p_wreport" type="hidden" class="input" size="4" value="<%=da.getWreport()%>"> 
			</td>
      </tr>
	  <tr>
            <td class="table_01">����<input type="hidden" name="p_point" value="100"></td>
            <td class="table_02_2"><%=String.valueOf(da.getGradscore())%><input type="hidden" class="input" name="p_gradscore" size="10" maxlength="5" value="<%=String.valueOf(da.getGradscore())%>"></td>
		    <td align="center" class="table_01">������</td>
		    <td class="table_02_2"><%=da.getWetc1()%><input name="p_wetc1" type="hidden" class="input" size="4" value="<%=da.getWetc1()%>">
			</td>
      </tr>
	  <tr> 
			<td align="center" class="table_01" colspan="2"></td>
			<td align="center" class="table_01">��Ÿ</td>
			<td class="table_02_2"><%=da.getWetc2()%><input name="p_wetc2" type="hidden" class="input" size="4" value="<%=da.getWetc2()%>">
			</td>
	  </tr>
	  <input name="p_wact" type="hidden" value="0">
	</table>
	<!----------------- ������������ �� ----------------->
	
      <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height=6></td>
          <td align="right" height=6></td>
          <td width="10" height=6></td>
          <td align="right" height=6></td>
        </tr>
        <tr> 
          <td width="896" align="right" ></td>
          <td width="32" align="right"><a href="javascript:insert()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
          <td width="10">&nbsp;</td>
          <td width="32" align="right"><a href="javascript:listpage()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
        </tr>
      </table>
    </td>
  </tr>
    <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>      
</table>


<br>
</form>
</body>
</html>
