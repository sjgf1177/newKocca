<%
//**********************************************************
//  1. ��      ��: ���־�ü ���� ���ȭ��
//  2. ���α׷���: zu_cpcomp_I.jsp
//  3. ��      ��: ���־�ü ���� ���ȭ��
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2005.7.27
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

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<script language="javascript" src="/script/cresys_lib.js"></script>
<script language="VBScript"   src="/script/cresys_lib.vbs"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function checkForm(){
    var tf = document.form1;
	var cpresno = "";
	
	//if(tf.p_cpresno1.value.length == 0 || tf.p_cpresno2.value.length == 0 || tf.p_cpresno3.value.length == 0){
	
	//alert(tf.p_compgubunop.options[0].value);
	
	//var boxlength = tf.p_compgubunop.length;
	//var i ;
	
	//for(i = 0; i < boxlength ; i++){
	//  if(tf.p_compgubunop.options[i].selected){
	//    tf.p_compgubun.value = tf.p_compgubunop.options[i].value;
	//  }
	//}
	
	//alert(tf.p_compgubun.value);
	
	for(i=1;i<4;i++){
		cpresno = eval('tf.p_cpresno'+i);
		//alert(cpresno);
		//if(cpresno.value.length == 0){
		//	alert("����� ��Ϲ�ȣ�� �Է����ּ���.");
		//	cpresno.focus();
		//	return;
		//	break;
		//}
	}
	
	//return;
	if(tf.p_cpnm.value.length == 0){
		alert("��ü���� �Է����ּ���.");
		tf.p_cpnm.focus();
		return;
	}
	
	if(tf.p_compgubun.value == ""){
		alert("��ü������ �������ּ���.");
		tf.p_cpnm.focus();
		return;
	}	
	if(tf.p_isidchk.value == "N"){
		alert("�����ID �ߺ�üũ�� ���ּ���");
		tf.p_userid.focus();
		return;
	}
	if(tf.p_userid.value.length == 0){
		alert("����� ���̵� �Է����ּ���.");
		tf.p_userid.focus();
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
	
	//return;
	
    tf.p_process.value   = "insert";
    tf.target    = "_self";
    tf.action            = "/servlet/controller.cp.CPCompServlet";
    tf.submit();

	
	/*
	if(tf.p_ischk.value == 0){			
		tf.p_userid.focus();
		return;
	}
	else	
		MoveLink(4);
	*/
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
}

function CheckUserid(){
	var tf = document.form1;
	    
	if(tf.p_userid.value.length == 0){
		alert("���̵� �Է��ϼž� �մϴ�.");
		tf.p_userid.focus();
		return;
	}
	else{
	    //document.form1.p_process.value   = "usercheck";
	    //document.form1.action            = "/servlet/controller.cp.CPCompServlet";
	   	//document.form1.target            = "chk_frame";
	    //document.form1.submit();
	    //document.form1.target            = "";

	    window.self.name = "exituserchk";
	    //(name, url, left, top, width, height, toolbar, menubar, statusbar, scrollbar, resizable)
        open_window("userchk","","100","100","400","250","no","no","yes","no","no");
        document.form1.target = "userchk";
        document.form1.p_isidchk.value = "Y";
        document.form1.action='/servlet/controller.cp.CPCompServlet';
        document.form1.p_process.value = 'usercheck';
        document.form1.submit();
        
	}   
}       
function changechk(){
  document.form1.p_isidchk.value = "N";
  return;
}
//-->
</script>
</head>

<body topmargin=0 leftmargin=0>

<form name = "form1" method = "post">
<input type= "hidden" name= "p_process" value= "">
<input type= "hidden" name= "p_cpseq" value="">
<input type= "hidden" name= "p_ischk" value= "0">
<input type= "hidden" name= "p_isidchk" value= "N">
<input type= "hidden" name= "p_isoverlap" value= "N">
<!--input type= "hidden" name= "p_compgubun" value= ""-->

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
          <td class=sub_title>�������</td>
          
        </tr>
        <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table>  
      <table width="970"  border="0"  cellpadding="0" cellspacing="1" class="table_out">
	    <tr>
          <td colspan="3" class="table_top_line"></td>
        </tr>
        <tr> 
          <td class="table_title" width="4%" rowspan='10'>��<br><br>��<br><br>��</td>
          <td class="table_title" width="12%">��ü��</td>
          <td class="table_02_2"  width="84%"><input name="p_cpnm" type="text" class="input" style="width:200"></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%">��ü����</td>
          <td class="table_02_2"  width="84%">
          <input type="radio" name="p_compgubun" value="S" checked> CP &nbsp;
          <input type="radio" name="p_compgubun" value="T"> BP &nbsp;
          <input type="radio" name="p_compgubun" value="M"> CP + BP
          </td>
        </tr>
        <tr> 
          <td class="table_title">�����ID</td>
          <td class="table_02_2"><table border="0"><tr><td><input name="p_userid" type="text" onkeypress="javascript:changechk()" class="input" style="width:100">&nbsp;</td><td><a href="javascript:CheckUserid()"><img src="/images/admin/button/btn_addcheck.gif" border="0"></a></td><td> *�����ID�� �ѹ���������� ������ �Ұ��մϴ�.</td></tr></table></td>
        </tr>
        <tr> 
          <td class="table_title">��й�ȣ</td>
          <td class="table_02_2"><input name="p_pwd" type="password" class="input" style="width:100"></td>
        </tr>
        <tr>
          <td class="table_title">��й�ȣȮ��</td>
          <td class="table_02_2"><input name="p_pwd2" type="password" class="input" style="width:100"></td>
        </tr>
        <tr> 
          <td class="table_title">����ڸ�</td>
          <td class="table_02_2"><input name="p_name" type="text" class="input" style="width:100"></td>
        </tr>
        <tr> 
          <td class="table_title">�ֹε�Ϲ�ȣ</td>
          <td class="table_02_2"><input name="p_resno" type="text" class="input" size="20" maxlength="13" onkeyup="numeric_chk(this)">(- ����)</td>
        </tr>
        <tr> 
          <td class="table_title">E-Mail</td>
          <td class="table_02_2" style=padding-top:5;padding-bottom:5><input name="p_email" type="text" class="input" style="width:200"></td>
        </tr>
        <tr>
          <td class="table_title">ȸ����ȭ</td>
          <td class="table_02_2" style=padding-top:5;padding-bottom:5>
		  <input name="p_comtel1" type="text" class="input" maxlength="3" style="width:50">
            - 
            <input name="p_comtel2" type="text" class="input" maxlength="4" style="width:70">
            - 
            <input name="p_comtel3" type="text" class="input" maxlength="4" style="width:70">
			</td>
        </tr>
        <tr>
          <td class="table_title">�ڵ���</td>
          <td class="table_02_2" style=padding-top:5;padding-bottom:5>
		  <input name="p_handphone1" type="text" class="input" maxlength="3" style="width:50">
            - 
            <input name="p_handphone2" type="text" class="input" maxlength="4" style="width:70">
            - 
            <input name="p_handphone3" type="text" class="input" maxlength="4" style="width:70">
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
          <td class="table_02_2"  width="84%"><input name="p_homesite" type="text" class="input" style="width:600" value="http://"></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%" colspan='2'>FAMILYSITE</td>
          <td class="table_02_2"  width="84%"><textarea name="p_familysite" cols="80" rows="5"></textarea></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%" colspan='2'>��ǥ�̻�</td>
          <td class="table_02_2"  width="84%" ><input name="p_captinnm" type="text" class="input" style="width:600" value=""></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%" colspan='2'>����</td>
          <td class="table_02_2"  width="84%"><input name="p_busicategory" type="text" class="input" style="width:600" value=""></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%" colspan='2'>����ڵ�Ϲ�ȣ</td>
          <td class="table_02_2"  width="84%"><input name="p_cpresno1" type="text" class="input" maxlength="3" style="width:100" onkeyup="numeric_chk(this)">
            - 
            <input name="p_cpresno2" type="text" class="input" maxlength="2" style="width:60" onkeyup="numeric_chk(this)">
            - 
            <input name="p_cpresno3" type="text" class="input" maxlength="5" style="width:100" onkeyup="numeric_chk(this)"></td>
        </tr>
        <tr> 
          <td class="table_title" width="3%" rowspan='3'>��<br>��</td>
          <td class="table_title" width="12%">������(TOTAL)</td>
          <td class="table_02_2"  width="84%"><input name="p_employeetot" type="text" class="input" style="width:40" onkeyup="numeric_chk(this)">��</td>
        </tr>
        <tr> 
          <td class="table_title" width="12%">������</td>
          <td class="table_02_2"  width="84%"><input name="p_employeeje" type="text" class="input" style="width:40" onkeyup="numeric_chk(this)">��</td>
        </tr>
        <tr> 
          <td class="table_title" width="12%">��������</td>
          <td class="table_02_2"  width="84%"><input name="p_employeebi" type="text" class="input" style="width:40" onkeyup="numeric_chk(this)">��</td>
        </tr>
        <tr> 
          <td class="table_title" width="12%" colspan='2'>���������</td>
          <td class="table_02_2"  width="84%"><input name="p_estabyear" type="text" class="input" size="4" maxlength=4 onkeyup="numeric_chk(this)">��<input name="p_estabmon" type="text" class="input" size="4" maxlength=2 onkeyup="numeric_chk(this)">��<input name="p_estabday" type="text" class="input" size="4" maxlength=2 onkeyup="numeric_chk(this)">�� </td>
        </tr>
        <tr> 
          <td class="table_title" width="12%"  colspan='2'>�ּ�</td>
          <td class="table_02_2"  width="84%"><input name="p_address" type="text" class="input" style="width:600"></td>
        </tr>
        <!--*************************************************ȸ�簳�䳡*************************************************-->
        
        <!--*************************************************PR����*************************************************-->
        <tr> 
          <td class="table_title" width="4%" rowspan="4">P<br><br><br>R</td>
          <td class="table_title" width="12%" colspan='2'>Vision</td>
          <td class="table_02_2"  width="84%"><textarea name="p_vision" cols="80" rows="5"></textarea></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%"  colspan='2'>Mission</td>
          <td class="table_02_2"  width="84%"><textarea name="p_mission" cols="80" rows="5"></textarea></td>
        </tr>
        <tr> 
          <td class="table_title" width="3%" rowspan='2'>��<br>��<br>��<br>��<br>��<br>��</td>
          <td class="table_title" width="12%" >�ַ»��</td>
          <td class="table_02_2"  width="84%" height="120"><textarea name="p_mainbusi" cols="80" rows="5"></textarea></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%" >�űԻ��</td>
          <td class="table_02_2"  width="84%" height="120"><textarea name="p_subbusi" cols="80" rows="5"></textarea></td>
        </tr>
        <!--*************************************************PR��*************************************************-->
        
        <!--*************************************************IR����*************************************************-->
        <tr> 
          <td class="table_title" width="4%" rowspan="3">I<br><br><br>R</td>
          <td class="table_title" width="12%" colspan='2'>�ں���</td>
          <td class="table_02_2"  width="84%"><input name="p_capital" type="text" class="input" style="width:80" onkeyup="numeric_chk(this)">���
        </tr>
        <tr> 
          <td class="table_title" width="12%"  colspan='2'>�����ȹ</td>
          <td class="table_02_2"  width="84%"><input name="p_capitalplan" type="text" class="input" style="width:80" onkeyup="numeric_chk(this)">���</td>
        </tr>
        <tr> 
          <td class="table_title" width="12%"  colspan='2'>�������</td>
          <td class="table_02_2"  width="84%"><input name="p_capitalresult" type="text" class="input" style="width:80" onkeyup="numeric_chk(this)">���</td>
        </tr>
        <!--*************************************************IR ��*************************************************-->
        
        <!--*************************************************����1*************************************************-->
        <tr> 
          <td class="table_title" width="4%"  rowspan="2">��<br>��<br>1</td>
          <td class="table_title" width="12%" colspan='2'>������</td>
          <td class="table_02_2"  width="84%"><textarea name="p_prizerecord" cols="80" rows="5"></textarea></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%"  colspan='2'>����ȹ��</td>
          <td class="table_02_2"  width="84%"><textarea name="p_auth" cols="80" rows="5"></textarea></td>
        </tr>
        <!--*************************************************����1 ��*************************************************-->
        
        <!--*************************************************����2 ����*************************************************-->
        <tr> 
          <td class="table_title" width="4%" rowspan="6">��<br>��<br>2</td>
          <td class="table_title" width="12%" colspan='2'>��ü����������(total)</td>
          <td class="table_02_2"  width="84%"><input name="p_ownsubj" type="text" class="input" style="width:40"></td>
        </tr>
        <tr>
          <td class="table_title" width="3%" rowspan="2">&nbsp;</td>
          <td class="table_title" width="12%">��뺸������</td>
          <td class="table_02_2"  width="84%"><input name="p_goyonownsubj" type="text" class="input" style="width:40"></td>
        </tr>
        <tr>
          <td class="table_title" width="12%">��뺸�������</td>
          <td class="table_02_2"  width="84%"><input name="p_bigoyonownsubj" type="text" class="input" style="width:40"></td>
        </tr>
        <tr>
          <td class="table_title" width="12%" colspan=2>����/��ǰ ������(total)</td>
          <td class="table_02_2"  width="84%"><input name="p_devsubj" type="text" class="input" style="width:40"></td>
        </tr>
        <tr>
          <td class="table_title" width="3%" rowspan="2">&nbsp;</td>
          <td class="table_title" width="12%">��뺸������</td>
          <td class="table_02_2"  width="84%"><input name="p_goyondevsubj" type="text" class="input" style="width:40"></td>
        </tr>
        <tr>
          <td class="table_title" width="12%">��뺸�������</td>
          <td class="table_02_2"  width="84%"><input name="p_bigoyondevsubj" type="text" class="input" style="width:40"></td>
        </tr>
        <!--*************************************************����2 ��*************************************************-->
        
        <!--*************************************************����3 ����*************************************************-->
        <tr> 
          <td class="table_title" width="4%" rowspan="3">��<br>��<br>3</td>
          <td class="table_title" width="12%" colspan='2'>�����ַ��</td>
          <td class="table_02_2"  width="84%"><textarea name="p_ownsolution" cols="80" rows="5"></textarea></td>
        </tr>
        <tr>
          <td class="table_title" width="12%" colspan=2>���߳�ǰ�ý��ۼ�</td>
          <td class="table_02_2"  width="84%"><input name="p_devsystem" type="text" class="input" style="width:40"></td>
        </tr>
        <tr>
          <td class="table_title" width="12%" colspan=2>�ý��۸�</td>
          <td class="table_02_2"  width="84%"><textarea name="p_systemnm" cols="80" rows="5"></textarea></td>
        </tr>
        <!--*************************************************����3 ��*************************************************-->
        
        <!--*************************************************Ư¡/���*************************************************-->
        <tr> 
          <td class="table_title" width="16%" colspan='3'>Ư¡</td>
          <td class="table_02_2"  width="84%"><textarea name="p_special" cols="80" rows="5"></textarea></td>
        </tr>
        <tr>
          <td class="table_title" width="16%" colspan=3>���</td>
          <td class="table_02_2"  width="84%"><textarea name="p_bigo" cols="80" rows="5"></textarea></td>
        </tr>
        <!--*************************************************����3 ��*************************************************-->
      </table>
      <!--****************************************************************�߰����� ����****************************************************************-->
      
      <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height=6></td>
          <td align="right" height=6></td>
          <td width="11" height=6></td>
          <td width="32" height=6 align="right"></td>
        </tr>
        <tr> 
          <td width="895" align="right" ></td>
          <td width="32" align="right"><a href="JavaScript:checkForm()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
          <td width="11">&nbsp;</td>
          <td width="32" align="right"><a href="JavaScript:MoveLink(1)"><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
        </tr>
      </table></td>
  </tr>
  <%@ include file = "/learn/library/getJspName.jsp" %>
</table>
</form>

<div id=minical OnClick="this.style.display='none';" oncontextmenu='return false' 
ondragstart='return false' onselectstart='return false' 
style="background : buttonface; margin: 5; margin-top: 2;border-top: 1 
solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1 
solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index: 99">
</div>
</body>
</html>
