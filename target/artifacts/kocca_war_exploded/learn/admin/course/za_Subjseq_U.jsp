<%
//**********************************************************
//  1. ��	  ��: ������������ ȭ��
//  2. ���α׷���: za_Subjseq_U.jsp
//  3. ��	  ��: ������������ ȭ��
//  4. ȯ	  ��: JDK 1.4
//  5. ��	  ��: 1.0
//  6. ��	  ��: ���� 2004. 11. 16
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.propose.MasterWizardBean" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");

	String v_tem_grcode = box.getSession("tem_grcode");		//���� ���� �����׷��ڵ�
    String  v_grcode	= box.getString("p_grcode");		   //�����׷�  2010.10.13

	//DEFINED in relation to select START
	String  ss_grcode	= box.getString("s_grcode");		   //�����׷�
	String  ss_gyear	 = box.getString("s_gyear");			//�⵵
	String  ss_grseq	 = box.getString("s_grseq");			//�⵵
	String  ss_upperclass = box.getString("s_upperclass");	  //������з�
	String  ss_middleclass = box.getString("s_middleclass");	//�����ߺз�
	String  ss_subjcourse= box.getString("s_subjcourse");	   //����&�ڽ�
	String  ss_subjseq   = box.getString("s_subjseq");		  //���� ����
	//DEFINED in relation to select END

System.out.println("//"+ss_grcode);
	String  v_process = box.getString("p_process");
	String v_subj	 = box.getString("p_subj");
	String v_year	 = box.getString("p_year");
	String v_subjseq  = box.getString("p_subjseq");
	String v_isonoff  = box.getString("p_isonoff");

	GrseqBean grseqbean= new GrseqBean();
	SubjseqData da = (SubjseqData)request.getAttribute("SubjseqData");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script>
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language="JavaScript">
$(document).ready(function(){
	$("#p_propstart1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_propend1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_edustart1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_eduend1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_startcanceldate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_endcanceldate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});


	// ����
	function whenSubmit(){
		var result;
		result = dateChk();
		result = weightChk();


		if(!result){
			//alert('�ٽ� �Է��Ͽ� �ֽʽÿ�.');
			return;
		}
		document.form1.action='/servlet/controller.course.GrseqServlet';
		document.form1.p_process.value = 'updateSubjseq';
		document.form1.target = "_self";
		document.form1.submit();
	}

	// �������ĺ�ȯ
	function dateChk(){
		ff = document.form1;

		if(ff.p_propstart1.value != null){
			ff.p_propstart.value=make_date(ff.p_propstart1.value)+ff.p_propstart2.options[ff.p_propstart2.selectedIndex].value;
		}
		if(ff.p_propend1.value != null){
			ff.p_propend.value=make_date(ff.p_propend1.value)+ff.p_propend2.options[ff.p_propend2.selectedIndex].value;
		}

		if(ff.p_edustart1.value != null){
			ff.p_edustart.value=make_date(ff.p_edustart1.value)+ff.p_edustart2.options[ff.p_edustart2.selectedIndex].value;
		}
		if(ff.p_eduend1.value != null){
			ff.p_eduend.value=make_date(ff.p_eduend1.value)+ff.p_eduend2.options[ff.p_eduend2.selectedIndex].value;
		}


		return true;
	}

	// �Է°� üũ
	function weightChk(){
		var sum = 0;
		ff = document.form1;

		if (ff.p_propstart1.value=="") {
			alert("������û �������� �Է��ϼ���.");
			return false;
		}
		if (ff.p_propend1.value=="") {
			alert("������û �������� �Է��ϼ���.");
			return false;
		}
		if (ff.p_edustart1.value=="") {
			alert("�н� �������� �Է��ϼ���.");
			return false;
		}
		if (ff.p_eduend1.value=="") {
			alert("�н� �������� �Է��ϼ���.");
			return false;
		}


		if (ff.p_propstart.value > ff.p_propend.value) {
			alert("������û �������� ������û ������ �����̾�� �մϴ�.");
			return false;
		}
/*
		if (ff.p_propend.value > ff.p_edustart.value) {
			alert("������û �������� �н������� �����̾�� �մϴ�.");
			return false;
		}
*/
		if (ff.p_edustart.value > ff.p_eduend.value) {
			alert("�н��������� �н������� �����̾�� �մϴ�.");
			return false;
		}


		if (!number_chk_noalert(ff.p_point.value)) {
		  alert('�̼������� �߸��ԷµǾ����ϴ�.');
		  return false;
		}
		if (!number_chk_noalert(ff.p_studentlimit.value)) {
		  alert('������ �߸��ԷµǾ����ϴ�.');
		  return false;
		}

		if (!number_chk_noalert(ff.p_biyong.value)) {
		  alert('�����ᰡ �߸��ԷµǾ����ϴ�.');
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

		<% if (v_isonoff.equals("ON")) { %>
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
		<% } else { %>
		if (!number_chk_noalert(ff.p_gradexam.value)) {
		  alert('�̼�����-�򰡰� �߸��ԷµǾ����ϴ�.');
		  return false;
		}
		<% } %>

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

		<% if (v_isonoff.equals("ON")) { %>
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

		<% } else { %>
		if (ff.p_gradexam.value > 100) {
			alert('�̼�����-�򰡰� 100 �̻��Դϴ�.');
			return false;
		}
		<% } %>

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
		if (!number_chk_noalert(ff.p_edulimit.value)) {
		  alert('1���ִ��н����� �߸��ԷµǾ����ϴ�.');
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
		var weight =  parseFloat(ff.p_wstep.value,10) + parseFloat(ff.p_wmtest.value,10) + parseFloat(ff.p_wftest.value,10) + parseFloat(ff.p_whtest.value,10)+ parseFloat(ff.p_wreport.value,10) + parseFloat(ff.p_wact.value,10) + parseFloat(ff.p_wetc1.value,10) + parseFloat(ff.p_wetc2.value,10);

		<% if (v_isonoff.equals("ON")) { %>
		if (weight < 100) {
		  alert('����ġ�� 100% ���� �����ϴ�');
			return false;
		}
		<% } else { %>
		if (weight < 0) {
		  alert('����ġ�� 0% ���� �����ϴ�');
			return false;
		}
		<% } %>

		if (weight > 100) {
		  alert('����ġ�� 100% ���� �����ϴ�.');
			return false;
		}

		//���� üũ
		if(ff.p_sulpaper.value != '' && ff.p_sulpaper2.value != '') {
			if(ff.p_sulpaper.value == ff.p_sulpaper2.value) {
				alert("���������� ���ļ����� �����մϴ�.");
				return false;
			}
		}

		return true;
	}

	// ���µ��
	function whenLectureInsert() {
		window.self.name = "subjsequpdate";
		open_window("openLecture","","100","100","600","250");
		document.form1.target = "openLecture";
		document.form1.action='/servlet/controller.course.GrseqServlet';
		document.form1.p_process.value = 'lectureInsertPage';
		document.form1.submit();
		document.form1.target = window.self.name;
	}

	//���¼���
	function whenLectureUpdate(lecture) {
		window.self.name = "subjsequpdate";
		open_window("openLecture","","100","100","600","250");
		document.form1.target = "openLecture";
		document.form1.action='/servlet/controller.course.GrseqServlet';
		document.form1.p_process.value = 'lectureUpdatePage';
		document.form1.p_lecture.value = lecture;
		document.form1.submit();
		document.form1.target = window.self.name;
	}

	//���� �Է��� ����
	function whenclick(caldate) {
		caldate.value = "";
	}



//��¥ �Է� üũ
function TxtCheck(key, CtlName, TextMask){
	if((key > 47&&key < 58)||(key > 95 && key <106)) {
		if(CtlName.value.length < TextMask.length) {
		var aa = CtlName.value + String.fromCharCode(key);

		if(key > 47 && key < 58) var zz = aa.charAt(aa.length-1);
		else if(key > 95 && key < 106){

			switch(key){
				case 96: zz = '0'; break; case 97: zz = '1'; break;
				case 98: zz = '2'; break; case 99: zz = '3'; break;
				case 100: zz = '4'; break; case 101: zz = '5'; break;
				case 102: zz = '6'; break; case 103: zz = '7'; break;
				case 104: zz = '8'; break; case 105: zz = '9'; break;
			}
		}

		if(TextMask.charAt(aa.length-1) == '#') CtlName.value = CtlName.value + zz;
		else CtlName.value = CtlName.value + TextMask.charAt(aa.length-1) +zz;
		return false;
		}
	}
	else if(key == 8 || key == 9 || key == 13) return ; else return false;

}
</script>
</head>



<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post" action="/servlet/controller.course.GrseqServlet">
	<input type="hidden" name="s_grcode"		value="<%=ss_grcode%>">	 <!--in relation to select-->
	<input type="hidden" name="s_gyear"		 value="<%=ss_gyear%>">	  <!--in relation to select-->
	<input type="hidden" name="s_grseq"		 value="<%=ss_grseq%>">	  <!--in relation to select-->
	<input type="hidden" name="s_upperclass"	value="<%=ss_upperclass%>"> <!--in relation to select-->
	<input type="hidden" name="s_middleclass"   value="<%=ss_middleclass%>"><!--in relation to select-->
	<input type="hidden" name="s_subjcourse"	value="<%=ss_subjcourse%>"> <!--in relation to select-->
	<input type="hidden" name="s_subjseq"	   value="<%=ss_subjseq%>">	<!--in relation to select-->

	<input type="hidden" name="p_process"   value="updateSubjseq">
	<input type="hidden" name="p_subj"	  value="<%=v_subj%>">
	<input type="hidden" name="p_year"	  value="<%=v_year%>">
	<input type="hidden" name="p_subjseq"   value="<%=v_subjseq%>">
	<input type="hidden" name="p_isonoff"   value="<%=v_isonoff%>">
	<input type="hidden" name="p_grcode"	value="<%=da.getGrcode()%>">
	<input type="hidden" name="p_gyear"	 value="<%=da.getGyear()%>">
	<input type="hidden" name="p_grseq" value="<%=da.getGrseq()%>">

	<input type="hidden" name="p_mgrseq" value="<%=da.getGrseq()%>">
	<input type="hidden" name="p_lecture">


<table width="97%" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
	<td align="center" valign="top">
	  <!----------------- title ���� ----------------->
	  <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
		<tr>
		  <td><img src="/images/admin/course/c_title02.gif" ></td>
		  <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
		</tr>
	  </table>		<!----------------- title �� ----------------->

		<br>

	  <!----------------- ������������ ���� ----------------->
		<table class="table_out" cellspacing="1" cellpadding="6">
		  <tr>
			<td colspan="4" class="table_top_line"></td>
		  </tr>
		  <tr>
			<td class="table_title" rowspan="4"><b>��������</b></td>
			<td colspan="2" align="center" class="table_01">������û�����Ͻ�</td>
			<td class="table_02_2"> <%//��û�� ������ ����Ұ�%> <% if(da.getPropstart().length() == 10){ %> <input name="p_propstart1" id="p_propstart1" type="text" class="datepicker_input1" size="10" value="<%=FormatDate.getFormatDate(StringManager.substring(da.getPropstart(),0,8),"yyyy-MM-dd")%>">
			  ��&nbsp;
			  <!--a href="javascript:MiniCal(p_propstart1);"><img src="/images/admin/portal/b_calender.gif" border=0></a-->
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <select name="p_propstart2">
				<%=FormatDate.getDateOptions(0,23,Integer.parseInt(StringManager.substring(da.getPropstart(),8,10)) )%>
			  </select>
			  ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
			  <a href="javascript:whenclick(document.form1.p_propstart1)"> <img src="/images/admin/button/b_delete.gif" align="absmiddle" border="0"></a>
			  <% }else{ %> <input name="p_propstart1" id="p_propstart1" type="text" class="datepicker_input1" size="10" value="">
			  ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <select name="p_propstart2">
				<%=FormatDate.getDateOptions(0,23,0)%>
			  </select>
			  ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <a href="javascript:whenclick(document.form1.p_propstart1)"> <img src="/images/admin/button/b_delete.gif" align="absmiddle" border="0"></a>
			  <% } %>
				<input type=hidden name=p_propstart value="<%=da.getPropstart()%>">
			</td>
		  </tr>
		  <tr>
			<td colspan="2" align="center" class="table_01">������û�����Ͻ�</td>
			<td class="table_02_2"> <%//��û�� ������ ����Ұ�%> <% if(da.getPropend().length() == 10){ %> <input name="p_propend1" id="p_propend1" type="text" class="datepicker_input1" size="10" value="<%=FormatDate.getFormatDate(StringManager.substring(da.getPropend(),0,8),"yyyy-MM-dd")%>">
			  ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <select name="p_propend2">
				<%=FormatDate.getDateOptions(0,23,Integer.parseInt(StringManager.substring(da.getPropend(),8,10)) )%>
			  </select>
			  ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <a href="javascript:whenclick(document.form1.p_propend1)"> <img src="/images/admin/button/b_delete.gif" align="absmiddle" border="0"></a>
			  <% }else{ %> <input name="p_propend1" id="p_propend1" type="text" class="datepicker_input1" size="10" value="">
			  ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <select name="p_propend2">
				<%=FormatDate.getDateOptions(0,23,23)%>
			  </select>
			  ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <a href="javascript:whenclick(document.form1.p_propend1)"> <img src="/images/admin/button/b_delete.gif" align="absmiddle" border="0"></a>
			  <% } %>
			  <input type=hidden name=p_propend  value="<%=da.getPropend()%>">
			</td>
		  </tr>
		  <tr>
			<td colspan="2" align="center" class="table_01">�н� �����Ͻ�</td>
			<td class="table_02_2"> <%//��û�� ������ ����Ұ�%> <% if(da.getEdustart().length() == 10){ %> <input name="p_edustart1" id="p_edustart1" type="text" class="datepicker_input1" size="10" value="<%=FormatDate.getFormatDate(StringManager.substring(da.getEdustart(),0,8),"yyyy-MM-dd")%>">
			  ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <select name="p_edustart2">
				<%=FormatDate.getDateOptions(0,23,Integer.parseInt(StringManager.substring(da.getEdustart(),8,10)) )%>
			  </select>
			  ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <a href="javascript:whenclick(document.form1.p_edustart1)"> <img src="/images/admin/button/b_delete.gif" align="absmiddle" border="0"></a>
			  <% }else{ %> <input name="p_edustart1" id="p_edustart1" type="text" class="datepicker_input1" size="10" value="">
			  ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <select name="p_edustart2">
				<%=FormatDate.getDateOptions(0,23,0)%>
			  </select>
			  ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <a href="javascript:whenclick(document.form1.p_edustart1)"> <img src="/images/admin/button/b_delete.gif" align="absmiddle" border="0"></a>
			  <% } %>
			  <input type=hidden name=p_edustart  value="<%=da.getEdustart()%>">
			</td>
		  </tr>
		  <tr>
			<td colspan="2" align="center" class="table_01">�н� �����Ͻ�</td>
			<td class="table_02_2"> <%//��û�� ������ ����Ұ�%> <% if(da.getEduend().length() == 10){ %> <input name="p_eduend1" id="p_eduend1" type="text" class="datepicker_input1" size="10" value="<%=FormatDate.getFormatDate(StringManager.substring(da.getEduend(),0,8),"yyyy-MM-dd")%>">
			  ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <select name="p_eduend2">
				<%=FormatDate.getDateOptions(0,23,Integer.parseInt(StringManager.substring(da.getEduend(),8,10)) )%>
			  </select>
			  ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <a href="javascript:whenclick(document.form1.p_eduend1)"> <img src="/images/admin/button/b_delete.gif" align="absmiddle" border="0"></a>
			  <% }else{ %> <input name="p_eduend1" id="p_eduend1" type="text" class="datepicker_input1" size="10" value="">
			  ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <select name="p_eduend2">
				<%=FormatDate.getDateOptions(0,23,23)%>
			  </select>
			  ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <a href="javascript:whenclick(document.form1.p_eduend1)"> <img src="/images/admin/button/b_delete.gif" align="absmiddle" border="0"></a>
			  <% } %>
			  <input type=hidden name=p_eduend value="<%=da.getEduend()%>">
			</td>
		  </tr>
		  <tr>
			<td rowspan="<% if (v_isonoff.equals("OFF")) out.print("18"); else out.print("20");%>" width="13%" class="table_title"><b>�⺻����</b></td>
			<td colspan="2" align="center" class="table_01"> �����׷�</td>
			<td class="table_02_2" width="67%"><%=da.getGrcodenm()%> [<%=da.getGrcode()%>]</td>
		  </tr>
		  <tr>
			<td colspan="2" align="center" class="table_01">������</td>
			<td class="table_02_2"><%=da.getSubjnm()%> [<%=da.getSubj()%>]</td>
		  </tr>
		  <tr>
			<td colspan="2" align="center" class="table_01">�⵵</td>
			<td class="table_02_2"><%=da.getYear()%></td>
		  </tr>
		  <tr>
			<td colspan="2" align="center" class="table_01">��������</td>
			<td class="table_02_2"><%=StringManager.cutZero(da.getSubjseqgr())%> <input name="p_subjnm" type="hidden" value="<%=da.getSubjnm()%>"></td>
		  </tr>
<!--
		  <tr>
			<td colspan="2" align="center" class="table_01">������û���</td>
			<td class="table_02_2">
			  <%
/*
			  MasterWizardBean mwbean = new MasterWizardBean();
			  if(mwbean.getMasterPropType(v_subj,v_year,v_subjseq).equals("")){
				out.println("����(�����Ͱ������� ������û����� �����Ҽ� �ֽ��ϴ�.)");
			  }else{
				out.println(mwbean.getMasterPropType(v_subj,v_year,v_subjseq));
			  }
*/
			%> </td>
		  </tr>
-->

		  <tr>
			<td colspan="2" align="center" class="table_01">������û��ұⰣ</td>
			<td class="table_02_2">
			   <input name="p_startcanceldate" id="p_startcanceldate" type="text" class="datepicker_input1" size="10" value="<%=da.getStartcanceldate() %>" onMouseover="if(this.value=='') this.value=p_propstart1.value"> ��
				- <input name="p_endcanceldate" id="p_endcanceldate" type="text" class="datepicker_input1" size="10" value="<%=da.getEndcanceldate() %>" onMouseover="if(this.value=='') this.value=p_propend1.value"> ��
<!-- 			�н������Ϸκ��� <input type="text" name="p_canceldays" value="<%=da.getCanceldays() %>" size="5" class="input"> �� -->
			</td>
		  </tr>

		  <tr>
			<td colspan="2" align="center" class="table_01">�н��ڿ��� �����ֱ�</td>
			<td class="table_02_2"><select name="p_isvisible"  class="inputpsearch">
				<option value='Y' <%if (da.getIsvisible().equals("Y")) out.print("selected"); %>>Y</option>
				<option value='N' <%if (da.getIsvisible().equals("N")) out.print("selected"); %>>N</option>
			  </select></td>
		  </tr>
		  <tr>
			<td colspan="2" align="center" class="table_01">������</td>
			<td class="table_02_2"><input name="p_biyong" type="text" class="input" size=8 maxlength=8 value="<%=da.getBiyong()%>">
			  ��</td>
		  </tr>
<% if (v_isonoff.equals("OFF")) { %>
		  <tr>
			<td colspan="2" class="table_01">�������</td>
			<td class="table_02_2"><input type="text" class="input" name="p_place" size="38" maxlength="100" value="<%=da.getPlace()%>" ></td>
		  </tr>
		  <tr>
			<td colspan="2" class="table_01">�������</td>
			<td class="table_02_2"><input type="text" class="input" name="p_placejh" size="38" maxlength="100" value="<%=da.getPlacejh()%>" ></td>
		  </tr>
<% }							  %>
		  <tr>
			<td colspan="2" align="center" class="table_01">����</td>
			<td class="table_02_2"><input name="p_studentlimit" type="text" class="input" size=4 maxlength=5 value="<%=da.getStudentlimit()%>"></td>
		  </tr>
		  <tr>
			<td colspan="2" align="center" class="table_01">��뺸�迩��</td>
			<td class="table_02_2">
			  <select name="p_isgoyong">
				<option value="Y" <%if(da.getIsgoyong().equals("Y")){%>selected<%}%> >Y</option>
				<option value="N" <%if(da.getIsgoyong().equals("N")){%>selected<%}%> >N</option>
			  </select>
			</td>
		  </tr>
          <tr>
			<td colspan="2" class="table_01">�ش�о�</td>
			<td class="table_02_2">
                <select name="p_filedapply">
				    <option value="Y" <%if(da.getIsgoyong().equals("Y")){%>selected<%}%> >Y</option>
				    <option value="N" <%if(da.getIsgoyong().equals("N")){%>selected<%}%> >N</option>
			    </select>
            </td>
		  </tr>
          <tr>
			<td colspan="2" class="table_01">�����ð�</td>
			<td class="table_02_2"><input type="text" class="input" name="p_edu_sumtime" size="10" maxlength="4" value="<%=da.getEdu_sumtime()%>" ></td>
		  </tr>
          <tr>
			<td colspan="2" class="table_01">��Ը���ȯ�ޱ�</td>
			<td class="table_02_2"><input type="text" class="input" name="p_bigcoin" size="10"  maxlength="8" value="<%=da.getBigcoin()%>" >��</td>
		  </tr>
          <tr>
			<td colspan="2" class="table_01">�켱�������ȯ�ޱ�</td>
			<td class="table_02_2"><input type="text" class="input" name="p_prioritycoin" size="10"  maxlength="8" value="<%=da.getPrioritycoin()%>" >��</td>
		  </tr>
		  <tr>
			<td colspan="2" align="center" class="table_01">���/����</td>
			<td class="table_02_2">
			  <select name="p_isordinary">
				<option value="Y" <%if(da.getIsordinary().equals("Y")){%>selected<%}%>>���</option>
				<option value="N" <%if(da.getIsordinary().equals("N")){%>selected<%}%>>����</option>
			  </select> &nbsp; &nbsp; &nbsp;
			  �ڵ����ο���<input type="radio" name="p_autoconfirm" value="Y"  <%= "Y".equals(da.getAutoconfirm()) ? "checked" : ""%>/>�� &nbsp; &nbsp;<input type="radio" name="p_autoconfirm" value="N" <%= !"Y".equals(da.getAutoconfirm()) ? "checked" : ""%> />�ƴϿ�
			</td>
		  </tr>
		  <tr>
			<td colspan="2" align="center" class="table_01">��ũ��</td>
			<td class="table_02_2">
			  <select name="p_isworkshop">
				<option value="Y" <%if(da.getIsworkshop().equals("Y")){%>selected<%}%>>Y</option>
				<option value="N" <%if(da.getIsworkshop().equals("N")){%>selected<%}%>>N</option>
			  </select>
			</td>
		  </tr>
		  <tr>
			<td colspan="2" align="center" class="table_01">������������</td>
			<td class="table_02_2">
			  <select name="p_isunit">
				<option value="Y" <%if(da.getIsunit().equals("Y")){%>selected<%}%>>Y</option>
				<option value="N" <%if(da.getIsunit().equals("N") || da.getIsunit().equals("")){%>selected<%}%>>N</option>
			  </select>
			</td>
		  </tr>
		  <% if (v_isonoff.equals("ON")) { %>
		  <tr>
			<td colspan="2" align="center" class="table_01">�������ɿ���</td>
			<td class="table_02_2"><select name="p_isablereview"  class="inputpsearch">
				<option value='Y' <% if(da.getIsablereview().equals("Y") || da.getIsablereview().equals("")) out.println(" selected");%>>Y</option>
				<option value='N' <% if(da.getIsablereview().equals("N")) out.println(" selected");%>>N</option>
			  </select>
			  / �����Ⱓ : <input type="text" class="input" name="p_reviewdays" size="3" maxlength="3" value="<%=da.getReviewdays()%>" tabindex=53>
			  			   <select name="p_reviewtype"  class="inputpsearch" tabindex=51>
			  					<option value="D" <% if (da.getReviewtype().equals("D")) out.println(" selected"); %>>��</option>
			  					<option value="W" <% if (da.getReviewtype().equals("W")) out.println(" selected"); %>>��</option>
			  					<option value="M" <% if (da.getReviewtype().equals("M")) out.println(" selected"); %>>����</option>
			  					<option value="Y" <% if (da.getReviewtype().equals("Y")) out.println(" selected"); %>>��</option>
			  			   </select>
			</td>
		  </tr>
			<td colspan="2" align="center" class="table_01">���翩��</td>
			<td class="table_02_2">
			  <select name="p_usebook"  class="inputpsearch" onChange="whenUsebook()" tabindex=35>
				<option value='Y' >Y</option>
				<option value='N' selected>N</option>
			  </select>
			</td>
		  </tr>
		  </tr>
			<td colspan="2" align="center" class="table_01">�����</td>
			<td class="table_02_2"><input type="text" class="input" name="p_bookname" size="38" maxlength="100" value="<%=da.getBookname()%>" disabled tabindex=36></td>
		  </tr>
		  </tr>
			<td colspan="2" align="center" class="table_01">�����</td>
			<td class="table_02_2"><input type="text" class="input" name="p_bookprice" size="10" maxlength="5" value="<%=String.valueOf(da.getBookprice())%>" disabled tabindex=38>��</td>
		  </tr>
		  <% } %>
		  <tr>
			<td rowspan="16" class="table_title"><b>��Ÿ����</b></td>
			<% if (v_isonoff.equals("ON")) { %>
			<td colspan="2" width="15%" class="table_01">��������</td>
			<td class="table_02_2" width="67%" >
				<input type="text" class="input" name="p_gradscore" size="5" maxlength="5" value="<%=da.getGradscore()%>"> �� �̻�
				<font color="red">(���������� �� �׸� [�̼����� * ����ġ] ��)</font>
			  	<input name="p_point" type="hidden" value="100"></td>
		  </tr>
		  <tr>
		  	<td rowspan="6" align="center" class="table_01">��<br/>��<br/>��<br/>�� </td>
			<td class="table_01">������</td>
			<td class="table_02_2" width="67%" ><input type="text" class="input" name="p_gradstep" size="5" maxlength="5" value="<%=da.getGradstep()%>"> �� �̻�</td>
		  </tr>
		  <tr>
			<td class="table_01">�߰���</td>
			<td class="table_02_2" width="67%" ><input type="text" class="input" name="p_gradexam" size="5" maxlength="5" value="<%=da.getGradexam()%>"> �� �̻�</td>
		  </tr>
		  <tr>
			<td class="table_01">������</td>
			<td class="table_02_2" width="67%" ><input type="text" class="input" name="p_gradftest" size="5" maxlength="5" value="<%=da.getGradftest()%>"> �� �̻�</td>
		  </tr>
		  <tr>
			<td class="table_01">������</td>
			<td class="table_02_2" width="67%" ><input type="text" class="input" name="p_gradhtest" size="5" maxlength="5" value="<%=da.getGradhtest()%>"> �� �̻�</td>
		  </tr>
		  <tr>
			<td class="table_01">����Ʈ</td>
			<td class="table_02_2" width="67%" ><input type="text" class="input" name="p_gradreport" size="5" maxlength="5" value="<%=da.getGradreport()%>"> �� �̻�</td>
		  </tr>
		  <tr>
			<td class="table_01">������</td>
			<td class="table_02_2" width="67%" ><input type="text" class="input" name="p_gradetc1" size="5" maxlength="5" value="<%=da.getGradetc1()%>"> �� �̻�</td>
		  </tr>
		  <% } else { %>
		  <td rowspan="4" align="center" class="table_01">��<br>
			��<br>
			��<br>
			�� </td>
		  <td width="15%" class="table_01">�� ��</td>
		  <td class="table_02_2" width="67%" > <input type="text" class="input" name="p_gradscore" size="10" maxlength="5" value="<%=da.getGradscore()%>">
			<input name="p_point" type="hidden" value="100"></td>
		  </tr>
		  <tr>
			<td class="table_01">�⼮��</td>
			<td class="table_02_2" width="67%" ><input type="text" class="input" name="p_gradstep" size="10" maxlength="5" value="<%=da.getGradstep()%>"></td>
		  </tr>
		  <tr>
			<td class="table_01">�� ��</td>
			<td class="table_02_2" width="67%" ><input type="text" class="input" name="p_gradexam" size="10" maxlength="5" value="<%=da.getGradexam()%>"></td>
		  </tr>
		  <tr>
			<td class="table_01">����Ʈ</td>
			<td class="table_02_2" width="67%" ><input type="text" class="input" name="p_gradreport" size="10" maxlength="5" value="<%=da.getGradreport()%>"></td>
		  </tr>
		  <% } %>
		  <% if(v_isonoff.equals("ON")){ //���̹������� ���  %>
		  <tr>
			<td rowspan="6" align="center" class="table_01">��<br>��<br>ġ<br>(%) </td>
			<td height="27" align="center" class="table_01">������</td>
			<td class="table_02_2"><input name="p_wstep" type="text" class="input" size="5" value="<%=da.getWstep()%>"> %
			</td>
		  </tr>
		  <tr>
			<td align="center" class="table_01">�߰���</td>
			<td class="table_02_2"><input name="p_wmtest" type="text" class="input" size="5" value="<%=da.getWmtest()%>"> %
			</td>
		  </tr>
		  <tr>
			<td align="center" class="table_01">������</td>
			<td class="table_02_2"><input name="p_wftest" type="text" class="input" size="5" value="<%=da.getWftest()%>"> %
			</td>
		  </tr>
		  <tr>
			<td align="center" class="table_01">������</td>
			<td class="table_02_2"><input name="p_whtest" type="text" class="input" size="5" value="<%=da.getWhtest()%>"> %</td>
		  </tr>
		  <tr>
			<td align="center" class="table_01">����Ʈ</td>
			<td class="table_02_2"><input name="p_wreport" type="text" class="input" size="5" value="<%=da.getWreport()%>"> %
			  <input name="p_wact" type="hidden" value="<%=da.getWact()%>">
			</td>
		  </tr>
		  <tr>
			<td align="center" class="table_01">������</td>
			<td class="table_02_2"><input name="p_wetc1" type="text" class="input" size="5" value="<%=da.getWetc1()%>"> %
			<input name="p_wetc2" type="hidden" class="input" size="4" value="<%=da.getWetc2()%>"></td>
		  </tr>

<!--
		  <tr>
			<td align="center" class="table_01">��Ÿ</td>
			<td class="table_02_2"></td>
		  </tr>

		  <tr>
			<td colspan="2" align="center" class="table_01">1�� �ִ��н���</td>
			<td class="table_02_2"> <input name="p_edulimit" type="text" class="input" size="3" maxlength="3" value="<%=da.getEdulimit()%>">
			  %</td>
		  </tr>
-->
<input name="p_edulimit" type="hidden" value="<%=da.getEdulimit()%>">
		  <tr>
			<td colspan="2" align="center" class="table_01">��������</td>
			<td class="table_02_2">
			  <%=grseqbean.selectSulPaper("p_sulpaper",v_grcode, String.valueOf(da.getSulpapernum()),1)%>
			  <br><br>
			  �����Ⱓ : <input type="text" name="p_sulstartdate1" class="input" size="10" value="<%=da.getSulStartDate1()%>" maxlength="10"> ��
			  ~ <input type="text" name="p_sulenddate1" class="input" size="10" value="<%=da.getSulEndDate1()%>" maxlength="10"> �� (YYYY-MM-DD ����)
			</td>
		  </tr>

		  <tr>
			<td colspan="2" align="center" class="table_01">���ļ���</td>
			<td class="table_02_2">
			  <%=grseqbean.selectSulPaper("p_sulpaper2",v_grcode, String.valueOf(da.getSulpapernum2()),1)%>
			  <br><br>
			  �����Ⱓ : <input type="text" name="p_sulstartdate2" class="input" size="10" value="<%=da.getSulStartDate2()%>" maxlength="10"> ��
			  ~ <input type="text" name="p_sulenddate2" class="input" size="10" value="<%=da.getSulEndDate2()%>" maxlength="10"> �� (YYYY-MM-DD ����)
			</td>
		  </tr>
          <tr>
            <td colspan="2" align="center" class="table_01">����</td>
            <td class="table_02_2">
				<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
				<kocca_select:select name="p_charger" sqlNum="adminList"  param=" "
				onChange="" attr=" " selectedValue="<%= da.getCharger()%>" isLoad="true" all="false" />
            </td>
          </tr>

		  <% } else { // ���հ����� ���%>
		  <tr>
			<td rowspan="4" align="center" class="table_01">��<br>
			  ��<br>
			  ġ<br>
			  (%) </td>
			<td height="33" align="center" class="table_01">�⼮��</td>
			<td class="table_02_2"> <input name="p_wstep" type="text" class="input" size="4" value="<%=da.getWstep()%>">
			</td>
		  </tr>
		  <tr>
			<td align="center" class="table_01">��</td>
			<td class="table_02_2"><input name="p_wftest" type="text" class="input" size="4" value="<%=da.getWftest()%>">
			</td>
		  </tr>
		  <tr>
			<td align="center" class="table_01">����Ʈ</td>
			<td class="table_02_2"><input name="p_wreport" type="text" class="input" size="4" value="<%=da.getWreport()%>">
			</td>
		  </tr>
		  <tr>
			<td align="center" class="table_01">��Ÿ(��������)</td>
			<td class="table_02_2"><input name="p_wetc1" type="text" class="input" size="4" value="<%=da.getWetc1()%>">
			  <input name="p_wmtest" type="hidden" class="input" value="0"> <input name="p_whtest" type="hidden" class="input" value="0">
			  <input name="p_gradftest" type="hidden" class="input" value="0">
			  <input name="p_gradhtest" type="hidden" class="input" value="0">
			  <input name="p_wact" type="hidden" class="input" value="0"> <input name="p_edulimit" type="hidden" class="input" value="0">
			  <input name="p_wetc2" type="hidden" class="input" value="0"> </td>
		  </tr>
		  <% }			  %>
		</table>
	  <!----------------- ������������ �� ----------------->


	  <br>

<% if(v_isonoff.equals("OFF")){ //���հ����� ��� ���¸���Ʈ

	String v_lecture	= "";
	String v_sdesc	  = "";
	String v_lectdate   = "";
	String v_lectsttime = "";
	String v_tutorid	= "";
	String v_tutorname  = "";
	int	 i			= 0;
	ArrayList list1	 = (ArrayList)request.getAttribute("LectureList");
%>
		<!----------------- ������ ���� ----------------->
		<table width="97%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td valign="bottom">&nbsp;<img src="/images/admin/course/icon1.gif" width="12" height="7" border="0"><b><font color="#107AAD" face="����" size="2.5">��������</font></b></td>
			<td align="right" valign="top">
			<a href="javascript:whenLectureInsert()"><img src="/images/admin/button/btn_add.gif" border="0"></a>
			</td>
		  </tr>
		  <tr>
			<td height="3"></td>
		  </tr>
		</table>
		<!----------------- ������ �� ----------------->



		<!----------------- ����... ���� ----------------->
		<table class="table_out" cellspacing="1" cellpadding="5">
		  <tr>
			<td colspan="5" class="table_top_line"></td>
		  </tr>
		  <tr>
			<td width="5%" height="25" class="table_title"><b>NO</b></td>
			<td class="table_title"><b>���� �� �ð�</b></td>
			<td class="table_title"><b>���¸�</b></td>
			<td class="table_title"><b>��簭��</b></td>
		  </tr>
<%
		for(i = 0; i < list1.size(); i++) {
			OffSubjLectureData data  = (OffSubjLectureData)list1.get(i);
			v_lecture		= data.getLecture();
			v_sdesc		  = data.getSdesc();
			v_lectdate	   = data.getLectdate();
			v_lectsttime	 = data.getLectsttime();
			v_tutorid		= data.getTutorid();
			v_tutorname	  = data.getTutorname();
			v_lectdate	   = FormatDate.getFormatDate(v_lectdate,"yyyy/MM/dd");
			v_lectsttime	 = FormatDate.getFormatTime(v_lectsttime,"HH:mm");
%>
		  <tr>
			<td align="center" class="table_01" height="25"><%= list1.size() - i %></td>
			<td class="table_02_2" align="center"><%=v_lectdate%> <%=v_lectsttime%></td>
			<td class="table_02_2"><a href="javascript:whenLectureUpdate('<%=v_lecture%>')"><%=v_sdesc%></a></td>
			<td class="table_02_2" align="center"><%=v_tutorname%></td>
		  </tr>
<%	   }


		if(i == 0){%>
		  <tr>
			<td align="center" class="table_02_1" colspan="4">��ϵ� ������ �����ϴ�</td>
		  </tr>
		<%	 } %>

		</table>
		<!----------------- ����... �� ----------------->

		<br>

<% } %>
		<!----------------- ����, ��� ��ư ���� ----------------->
		<table  border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td align="center">
			<% //if (da.getIsclosed().equals("Y")) { %>
			<!--
				<a href="javascript:alert('����ó���Ǿ� ������ �� �����ϴ�.');"><img src="/images/admin/button/btn_save.gif" align="absmiddle" border="0"></a>
			-->
			<% //} else { %>
				<a href="javascript:whenSubmit()"><img src="/images/admin/button/btn_save.gif" align="absmiddle" border="0"></a>
			<% //} %>

			</td>
			<td width=8></td>
			<td align="center"><a href="javascript:window.close()"><img src="/images/admin/button/btn_close.gif" align="absmiddle" border="0"></a></td>
		  </tr>
		</table>
		<!----------------- ����, ��� ��ư �� ----------------->
	  <br>

	  </td>
  </tr>
</table>
  <%@ include file = "/learn/library/getJspName.jsp" %>
</form>

</body>
</html>


