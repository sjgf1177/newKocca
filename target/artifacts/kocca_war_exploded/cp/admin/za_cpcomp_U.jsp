<%
//**********************************************************
//  1. ��      ��: ���־�ü ���� ����ȭ��
//  2. ���α׷���: zu_cpcomp_U.jsp
//  3. ��      ��: ���־�ü ���� ����ȭ��
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2004.12.16
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=MS949" %>
<%//@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.library.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
RequestBox box = (RequestBox)request.getAttribute("requestbox");

String v_cpseq = "", v_email = "", v_cpnm = "", v_cpresno = "", v_homesite = "", v_address = "", v_ldate = "", v_userid = "", v_name = "", v_comptel = "", v_pwd = "", v_compgubun="";
int i = 0, v_totalpage = 0, v_rowcount = 1, v_index1 = 0, v_index2 = 0;
String v_cpresno1 = "", v_cpresno2 = "", v_cpresno3 = "", v_str_tmp = "",v_comptel1 = "",v_comptel2 = "",v_comptel3 = "", v_handphone="", v_handphone1="",v_handphone2="",v_handphone3="";

String v_captinnm       = "";
String v_busicategory   = "";
int    v_employeetot    = 0;
int    v_employeeje     = 0;
int    v_employeebi     = 0;
String v_estabyear      = "";
String v_estabmon       = "";
String v_estabday       = "";
int    v_capital        = 0;
int    v_capitalplan    = 0;
int    v_capitalresult  = 0;
int    v_ownsubj        = 0;
int    v_goyonownsubj   = 0;
int    v_bigoyonownsubj = 0;
int    v_devsubj        = 0;
int    v_goyondevsubj   = 0;
int    v_bigoyondevsubj = 0;
int    v_devsystem      = 0;
String v_familysite     = "";
String v_vision         = "";
String v_mission        = "";
String v_mainbusi       = "";
String v_subbusi        = "";
String v_ownsolution    = "";
String v_prizerecord    = "";
String v_auth           = "";
String v_systemnm       = "";
String v_special        = "";
String v_bigo           = "";
String v_resno = "";



//out.println(box.getString("vflag"));

//if(!box.getString("vflag").equals("0")) {
	
	DataBox dbox = (DataBox)request.getAttribute("selectComp");
	
	v_cpseq     = dbox.getString("d_cpseq");
	v_cpnm      = dbox.getString("d_cpnm");
	v_cpresno   = dbox.getString("d_cpresno");
	v_homesite  = dbox.getString("d_homesite");
	v_address   = dbox.getString("d_address");
	v_ldate     = dbox.getString("d_ldate");
	v_userid    = dbox.getString("d_userid");
	v_pwd       = dbox.getString("d_pwd");
	v_name      = dbox.getString("d_name");
	v_resno     = dbox.getString("d_resno");
	v_email     = dbox.getString("d_email");
	v_comptel   = dbox.getString("d_comptel");
	v_handphone = dbox.getString("d_handphone");
	v_compgubun = dbox.getString("d_compgubun");
	
    v_captinnm       = dbox.getString("d_captinnm");
    v_busicategory   = dbox.getString("d_busicategory");
    v_employeetot    = dbox.getInt   ("d_employeetot");
    v_employeeje     = dbox.getInt   ("d_employeeje");
    v_employeebi     = dbox.getInt   ("d_employeebi");
    v_estabyear      = dbox.getString("d_estabyear");
    v_estabmon       = dbox.getString("d_estabmon");
    v_estabday       = dbox.getString("d_estabday");
    v_capital        = dbox.getInt   ("d_capital");
    v_capitalplan    = dbox.getInt   ("d_capitalplan");
    v_capitalresult  = dbox.getInt   ("d_capitalresult");
    v_ownsubj        = dbox.getInt   ("d_ownsubj");
    v_goyonownsubj   = dbox.getInt   ("d_goyonownsubj");
    v_bigoyonownsubj = dbox.getInt   ("d_bigoyonownsubj");
    v_devsubj        = dbox.getInt   ("d_devsubj");
    v_goyondevsubj   = dbox.getInt   ("d_goyondevsubj");
    v_bigoyondevsubj = dbox.getInt   ("d_bigoyondevsubj");
    v_devsystem      = dbox.getInt   ("d_devsystem");
    v_familysite     = dbox.getString("d_familysite");
    v_vision         = dbox.getString("d_vision");
    v_mission        = dbox.getString("d_mission");
    v_mainbusi       = dbox.getString("d_mainbusi");
    v_subbusi        = dbox.getString("d_subbusi");
    v_ownsolution    = dbox.getString("d_ownsolution");
    v_prizerecord    = dbox.getString("d_prizerecord");
    v_auth           = dbox.getString("d_auth");
    v_systemnm       = dbox.getString("d_systemnm");
    v_special        = dbox.getString("d_special");
    v_bigo           = dbox.getString("d_bigo");
	    
	//v_cpresno1 = v_cpresno.substring(1,3);
	//v_cpresno2 = v_cpresno.substring(5,6);
	//v_cpresno3 = v_cpresno.substring(8,12);
	
	//����ڵ�Ϲ�ȣ ������(-) ������ ��������
	if(v_cpresno.length() > 0){
		v_index1       =   v_cpresno.indexOf('-');
		v_cpresno1    =   v_cpresno.substring(0,v_index1);
		v_str_tmp     =   v_cpresno.substring(v_index1+1);
		v_index2       =   v_str_tmp.indexOf('-');
		v_cpresno2   =   v_str_tmp.substring(0,v_index2);
		v_cpresno3   =   v_str_tmp.substring(v_index2+1);
	}
	
	//��ȭ��ȣ ������(-) ������ ��������
	if(v_comptel.length() > 0){
		v_index1       =   v_comptel.indexOf('-');
		v_comptel1    =   v_comptel.substring(0,v_index1);
		v_str_tmp     =   v_comptel.substring(v_index1+1);
		v_index2       =   v_str_tmp.indexOf('-');
		v_comptel2   =   v_str_tmp.substring(0,v_index2);
		v_comptel3   =   v_str_tmp.substring(v_index2+1);
	}
	
	
	//��ȭ��ȣ ������(-) ������ ��������
	if(v_handphone.length() > 0){
		v_index1     = v_handphone.indexOf('-');
		v_handphone1 = v_handphone.substring(0,v_index1);
		v_str_tmp    = v_handphone.substring(v_index1+1);
		v_index2     = v_str_tmp.indexOf('-');
		v_handphone2 = v_str_tmp.substring(0,v_index2);
		v_handphone3 = v_str_tmp.substring(v_index2+1);
	}
	
	//int v_pageno = box.getInt("p_pageno"); 
	
	String s_userid = box.getSession("userid");
	String s_usernm = box.getSession("username");
     
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function checkForm(){
	var tf = document.form1;
	var cpresno = "";

	//if(tf.p_cpresno1.value.length == 0 || tf.p_cpresno2.value.length == 0 || tf.p_cpresno3.value.length == 0){

	for(i=1;i<4;i++){
		cpresno = eval('tf.p_cpresno'+i);
		//if(cpresno.value.length == 0){
		//	alert("����� ��Ϲ�ȣ�� �Է����ּ���.");
		//	cpresno.focus();
		//	return;
		//	break;
		//}
	}
	
	//alert(tf.p_compgubun.value);
	if(tf.p_cpnm.value.length == 0){
		alert("��ü���� �Է����ּ���.");
		tf.p_cpnm.focus();
		return;
	}
	if(tf.p_pwd.value.length == 0){
		alert("��й�ȣ�� �Է����ּ���.");
		tf.p_pwd.focus();
		return;
	}
	if(tf.p_pwd.value != tf.p_pwd2.value){
		alert("��й�ȣ Ȯ���� �ٽ� ���ּ���.");
		tf.p_pwd2.focus();
		return;		
	}
	if(tf.p_name.value.length == 0){
		alert("����ڸ��� �Է����ּ���.");
		tf.p_name.focus();
		return;
	}
	MoveLink(5);
}

function MoveLink(act,cpseq) {
	if(act == "1"){
		//����Ʈ ��������
		document.form1.p_process.value   = "";
	    document.form1.action            = "/servlet/controller.cp.CPCompServlet";
	    document.form1.submit();	
	}
	else if(act == "2"){
		//�󼼺��� ��������
		document.form1.p_process.value   = "select";
		document.form1.p_cpseq.value   	 = cpseq;	
	    document.form1.action            = "/servlet/controller.cp.CPCompServlet";
	    document.form1.submit();
	}
	else if(act == "3"){
		//�����������
	    document.form1.p_process.value   = "insertPage";
	    document.form1.action            = "/servlet/controller.cp.CPCompServlet";
	    document.form1.submit();
	}
	else if(act == "4"){
		//���ó�� ��������
	    document.form1.p_process.value   = "insert";
	    document.form1.action            = "/servlet/controller.cp.CPCompServlet";
	    document.form1.submit();
	}
	else if(act == "5"){
		//�������ó�� ��������
	    document.form1.p_process.value   = "update";
	    document.form1.action            = "/servlet/controller.cp.CPCompServlet";
	    document.form1.submit();
	}
}

//-->
</script>
</head>

<%
	//���־�ü ����ڶ�� �Ϻ��׸��� ������ �� ������.
%>
<body topmargin=0 leftmargin=0>
<form name = "form1" method = "post">
<input type="hidden" name="p_process" value="">
<input type="hidden" name="p_cpseq" value="<%=v_cpseq%>">
<input type="hidden" name="p_userid" value="<%=v_userid%>">
<input type="hidden" name="p_sourcecomp" value="<%=v_compgubun%>">


<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
	
	<table width="970" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/cp/cp_title01.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	   
      <br>
      <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>��������</td>
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
          <td class="table_title" width="16%">��ü��</td>
          <td class="table_02_2"  width="84%">
          <%if(box.getSession("gadmin").equals("S1") || box.getSession("gadmin").equals("M1") || box.getSession("gadmin").equals("T1")){%>
            <%=v_cpnm%><input type="hidden" name="p_cpnm" value="<%=v_cpnm%>">
          <%}else{%>
            <input name="p_cpnm" type="text" class="input" style="width:200" value="<%=v_cpnm%>">
          <%}%>
          </td>
        </tr>
        <%if(box.getSession("gadmin").equals("S1") || box.getSession("gadmin").equals("M1") || box.getSession("gadmin").equals("T1")){%>
          <input type="hidden" name="p_compgubun" value="<%=v_compgubun%>">
        <%}else{%>
        <tr> 
          <td class="table_title" width="16%">��ü����</td>
          <td class="table_02_2"  width="84%">
          <input type="radio" name="p_compgubun" value="S" <%if(v_compgubun.equals("S")){out.println("checked");}%>> CP &nbsp;
          <input type="radio" name="p_compgubun" value="T" <%if(v_compgubun.equals("T")){out.println("checked");}%>> BP &nbsp;
          <input type="radio" name="p_compgubun" value="M" <%if(v_compgubun.equals("M")){out.println("checked");}%>> CP + BP
          </td>
        </tr>        
        <%}%>
        <tr> 
          <td class="table_title">�����ID</td>
          <td class="table_02_2"><%=v_userid%></td>
        </tr>
        <tr> 
          <td class="table_title">��й�ȣ</td>
          <td class="table_02_2"><input name="p_pwd" type="password" class="input" style="width:100" maxlength="20" value="<%=v_pwd%>"></td>
        </tr>
        <tr> 
          <td class="table_title">��й�ȣȮ��</td>
          <td class="table_02_2"><input name="p_pwd2" type="password" class="input" style="width:100" maxlength="20" value="<%=v_pwd%>"></td>
        </tr>
        <tr> 
          <td class="table_title">����ڸ�</td>
          <td class="table_02_2">
          <%if(box.getSession("gadmin").equals("S1") || box.getSession("gadmin").equals("M1") || box.getSession("gadmin").equals("T1")){%>
            <%=v_name%><input type="hidden" name="p_name" value="<%=v_name%>">
          <%}else{%>
            <input name="p_name" type="text" class="input" style="width:100" value="<%=v_name%>">
          <%}%>
          </td>
        </tr>
        <tr> 
          <td class="table_title">�ֹε�Ϲ�ȣ</td>
          <td class="table_02_2"><input name="p_resno" type="text" class="input" size="20" maxlength="13" onkeyup="numeric_chk(this)" value="<%=v_resno%>">(- ����)</td>
        </tr>
        <tr> 
          <td class="table_title">E-Mail</td>
          <td class="table_02_2" style=padding-top:5;padding-bottom:5><input name="p_email" type="text" class="input" style="width:200" value="<%=v_email%>"></td>
        </tr>
        <tr>
          <td class="table_title">ȸ����ȭ</td>
          <td class="table_02_2" style=padding-top:5;padding-bottom:5>
		  <input name="p_comtel1" type="text" class="input" style="width:50" maxlength="3" value="<%=v_comptel1%>">
            - 
            <input name="p_comtel2" type="text" class="input" style="width:70" maxlength="4" value="<%=v_comptel2%>">
            - 
            <input name="p_comtel3" type="text" class="input" style="width:70" maxlength="4" value="<%=v_comptel3%>">
			</td>
        </tr>
        <tr>
          <td class="table_title">�ڵ���</td>
          <td class="table_02_2" style=padding-top:5;padding-bottom:5>
		  <input name="p_handphone1" type="text" class="input" style="width:50" maxlength="3" value="<%=v_handphone1%>">
            - 
            <input name="p_handphone2" type="text" class="input" style="width:70" maxlength="4" value="<%=v_handphone2%>">
            - 
            <input name="p_handphone3" type="text" class="input" style="width:70" maxlength="4" value="<%=v_handphone3%>">
			</td>
        </tr>
      </table>
      
            
      <!--****************************************************************�߰����� ����****************************************************************-->
      <BR>
      <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>�߰�����</td>
        </tr>
        <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table>  
      <table width="970"  border="0"  cellpadding="0" cellspacing="1" class="table_out">
	    <tr>
          <td colspan="4" class="table_top_line"></td>
        </tr>
        <!--*************************************************ȸ�簳�����*************************************************-->
        <tr> 
          <td class="table_title" width="4%" rowspan="10">ȸ<br>��<br>��<br>��</td>
          <td class="table_title" width="12%" colspan='2'>Ȩ������</td>
          <td class="table_02_2"  width="84%"><input name="p_homesite" type="text" class="input" style="width:600" value="<%=v_homesite%>"></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%" colspan='2'>FAMILYSITE</td>
          <td class="table_02_2"  width="84%"><textarea name="p_familysite" cols="80" rows="5"><%=v_familysite%></textarea></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%" colspan='2'>��ǥ�̻�</td>
          <td class="table_02_2"  width="84%" ><input name="p_captinnm" type="text" class="input" style="width:600" value="<%=v_captinnm%>"></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%" colspan='2'>����</td>
          <td class="table_02_2"  width="84%"><input name="p_busicategory" type="text" class="input" style="width:600" value="<%=v_busicategory%>"></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%" colspan='2'>����ڵ�Ϲ�ȣ</td>
          <td class="table_02_2"  width="84%"><input name="p_cpresno1" type="text" class="input" maxlength="3" style="width:100" value="<%=v_cpresno1%>">
            - 
            <input name="p_cpresno2" type="text" class="input" maxlength="2" style="width:60" value="<%=v_cpresno2%>">
            - 
            <input name="p_cpresno3" type="text" class="input" maxlength="5" style="width:100" value="<%=v_cpresno3%>"></td>
        </tr>
        <tr> 
          <td class="table_title" width="3%" rowspan='3'>��<br>��</td>
          <td class="table_title" width="12%">������(TOTAL)</td>
          <td class="table_02_2"  width="84%"><input name="p_employeetot" type="text" class="input" style="width:40" value="<%=v_employeetot%>">��</td>
        </tr>
        <tr> 
          <td class="table_title" width="12%">������</td>
          <td class="table_02_2"  width="84%"><input name="p_employeeje" type="text" class="input" style="width:40" value="<%=v_employeeje%>">��</td>
        </tr>
        <tr> 
          <td class="table_title" width="12%">��������</td>
          <td class="table_02_2"  width="84%"><input name="p_employeebi" type="text" class="input" style="width:40" value="<%=v_employeebi%>">��</td>
        </tr>
        <tr> 
          <td class="table_title" width="12%" colspan='2'>���������</td>
          <td class="table_02_2"  width="84%"><input name="p_estabyear" type="text" class="input" size="4" maxlength=4 value="<%=v_estabyear%>">��<input name="p_estabmon" type="text" class="input" size="4" maxlength=2 value="<%=v_estabmon%>">��<input name="p_estabday" type="text" class="input" size="4" maxlength=2 value="<%=v_estabday%>">��</td>
        </tr>
        <tr> 
          <td class="table_title" width="12%"  colspan='2'>�ּ�</td>
          <td class="table_02_2"  width="84%"><input name="p_address" type="text" class="input" style="width:600" value="<%=v_address%>"></td>
        </tr>
        <!--*************************************************ȸ�簳�䳡*************************************************-->
        
        <!--*************************************************PR����*************************************************-->
        <tr> 
          <td class="table_title" width="4%" rowspan="4">P<br><br><br>R</td>
          <td class="table_title" width="12%" colspan='2'>Vision</td>
          <td class="table_02_2"  width="84%"><textarea name="p_vision" cols="80" rows="5"><%=v_vision%></textarea></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%"  colspan='2'>Mission</td>
          <td class="table_02_2"  width="84%"><textarea name="p_mission" cols="80" rows="5"><%=v_mission%></textarea></td>
        </tr>
        <tr> 
          <td class="table_title" width="3%" rowspan='2'>��<br>��<br>��<br>��<br>��<br>��</td>
          <td class="table_title" width="12%" >�ַ»��</td>
          <td class="table_02_2"  width="84%" height="120"><textarea name="p_mainbusi" cols="80" rows="5"><%=v_mainbusi%></textarea></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%" >�űԻ��</td>
          <td class="table_02_2"  width="84%" height="120"><textarea name="p_subbusi" cols="80" rows="5"><%=v_subbusi%></textarea></td>
        </tr>
        <!--*************************************************PR��*************************************************-->
        
        <!--*************************************************IR����*************************************************-->
        <tr> 
          <td class="table_title" width="4%" rowspan="3">I<br><br><br>R</td>
          <td class="table_title" width="12%" colspan='2'>�ں���</td>
          <td class="table_02_2"  width="84%"><input name="p_capital" type="text" class="input" style="width:80" value="<%=v_capital%>">
        </tr>
        <tr> 
          <td class="table_title" width="12%"  colspan='2'>�����ȹ</td>
          <td class="table_02_2"  width="84%"><input name="p_capitalplan" type="text" class="input" style="width:80" value="<%=v_capitalplan%>"></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%"  colspan='2'>�������</td>
          <td class="table_02_2"  width="84%"><input name="p_capitalresult" type="text" class="input" style="width:80" value="<%=v_capitalresult%>"></td>
        </tr>
        <!--*************************************************IR ��*************************************************-->
        
        <!--*************************************************����1*************************************************-->
        <tr> 
          <td class="table_title" width="4%"  rowspan="2">��<br>��<br>1</td>
          <td class="table_title" width="12%" colspan='2'>������</td>
          <td class="table_02_2"  width="84%"><textarea name="p_prizerecord" cols="80" rows="5"><%=v_prizerecord%></textarea></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%"  colspan='2'>����ȹ��</td>
          <td class="table_02_2"  width="84%"><textarea name="p_auth" cols="80" rows="5"><%=v_auth%></textarea></td>
        </tr>
        <!--*************************************************����1 ��*************************************************-->
        
        <!--*************************************************����2 ����*************************************************-->
        <tr>
          <td class="table_title" width="4%" rowspan="6">��<br>��<br>2</td>
          <td class="table_title" width="12%" colspan='2'>��ü����������(total)</td>
          <td class="table_02_2"  width="84%"><input name="p_ownsubj" type="text" class="input" style="width:40" value="<%=v_ownsubj%>"></td>
        </tr>
        <tr>
          <td class="table_title" width="3%" rowspan="2">&nbsp;</td>
          <td class="table_title" width="12%">��뺸������</td>
          <td class="table_02_2"  width="84%"><input name="p_goyonownsubj" type="text" class="input" style="width:40" value="<%=v_goyonownsubj%>"></td>
        </tr>
        <tr>
          <td class="table_title" width="12%">��뺸�������</td>
          <td class="table_02_2"  width="84%"><input name="p_bigoyonownsubj" type="text" class="input" style="width:40" value="<%=v_bigoyonownsubj%>"></td>
        </tr>
        <tr>
          <td class="table_title" width="12%" colspan=2>����/��ǰ ������(total)</td>
          <td class="table_02_2"  width="84%"><input name="p_devsubj" type="text" class="input" style="width:40" value="<%=v_devsubj%>"></td>
        </tr>
        <tr>
          <td class="table_title" width="3%" rowspan="2">&nbsp;</td>
          <td class="table_title" width="12%">��뺸������</td>
          <td class="table_02_2"  width="84%"><input name="p_goyondevsubj" type="text" class="input" style="width:40" value="<%=v_goyondevsubj%>"></td>
        </tr>
        <tr>
          <td class="table_title" width="12%">��뺸�������</td>
          <td class="table_02_2"  width="84%"><input name="p_bigoyondevsubj" type="text" class="input" style="width:40" value="<%=v_bigoyondevsubj%>"></td>
        </tr>
        <!--*************************************************����2 ��*************************************************-->
        
        <!--*************************************************����3 ����*************************************************-->
        <tr> 
          <td class="table_title" width="4%" rowspan="3">��<br>��<br>3</td>
          <td class="table_title" width="12%" colspan='2'>�����ַ��</td>
          <td class="table_02_2"  width="84%"><textarea name="p_ownsolution" cols="80" rows="5"><%=v_ownsolution%></textarea></td>
        </tr>
        <tr>
          <td class="table_title" width="12%" colspan=2>���߳�ǰ�ý��ۼ�</td>
          <td class="table_02_2"  width="84%"><input name="p_devsystem" type="text" class="input" style="width:40" value="<%=v_devsystem%>"></td>
        </tr>
        <tr>
          <td class="table_title" width="12%" colspan=2>�ý��۸�</td>
          <td class="table_02_2"  width="84%"><textarea name="p_systemnm" cols="80" rows="5"><%=v_systemnm%></textarea></td>
        </tr>
        <!--*************************************************����3 ��*************************************************-->
        
        <!--*************************************************Ư¡/���*************************************************-->
        <tr> 
          <td class="table_title" width="16%" colspan='3'>Ư¡</td>
          <td class="table_02_2"  width="84%"><textarea name="p_special" cols="80" rows="5"><%=v_special%></textarea></td>
        </tr>
        <tr>
          <td class="table_title" width="16%" colspan=3>���</td>
          <td class="table_02_2"  width="84%"><textarea name="p_bigo" cols="80" rows="5"><%=v_bigo%></textarea></td>
        </tr>
        <!--*************************************************����3 ��*************************************************-->
      </table>
      <!--****************************************************************�߰����� ��****************************************************************-->
      
      <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height=6></td>
          <td align="right" height=6></td>
          <td width="11" height=6></td>
        </tr>
        <tr> 
          <td width="895" align="right" ></td>
          <td align="right" valign="top"><a href="JavaScript:checkForm()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
          <td width="11">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr height="100">
    <td>
      <%@ include file = "/learn/library/getJspName.jsp" %> 
    </td>
  </tr>
</table>
</form>
</body>
</html>