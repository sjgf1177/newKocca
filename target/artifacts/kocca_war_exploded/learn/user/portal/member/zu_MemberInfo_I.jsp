<%
//**********************************************************
//  1. ��      ��: ȸ������_ȸ������
//  2. ���α׷��� :zu_MemberInfo_I.jsp
//  3. ��      ��: ȸ������_ȸ������
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��:
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page language="java" import="Kisinfo.Check.IPINClient" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

	String v_username = box.getString("p_username");
    String v_resno    = box.getString("p_resno");
	String v_resno1   = box.getString("p_resno1");
    String v_resno2   = box.getString("p_resno2");
	String v_userid   = "";
	String v_check    = (String)request.getAttribute("check");
	String v_process  = box.getString("p_process");
    //pkh
	//String v_degree   = box.getString("d_degree");
	//String v_jikup    = box.getString("d_jikup");
	//String v_comptext = box.getSession("tem_grcode");
	String v_sex         = "";
	String v_memberyear  = "";
	String v_membermonth = "";
	String v_memberday   = "";
	
	//��ȣ�� ����
	String vv_username = box.getString("pp_username");
	String vv_email1 = box.getString("pp_email1");
	String vv_email2 = box.getString("pp_email2");
	
	//������ ����
	String i_sex         = box.getString("i_sex");
	String i_birthdate	 = box.getString("i_birthdate");
	String i_username	 = box.getString("i_username");	
	String i_dupinfo	 = box.getString("i_dupinfo").equals("")? box.getSession("p_dupinfo") : box.getString("i_dupinfo");
	String i_vnumber	 = box.getString("i_vnumber");
	String i_irtn		 = box.getString("i_irtn");	
	
	//�ȽɽǸ�����
	String nc_safeid = box.getString("nc_safeid");
	String nc_username = box.getString("nc_username");
	String nc_jumindate = box.getString("nc_jumindate");
	String nc_gender = box.getString("nc_gender");
	String nc_cert = box.getString("nc_cert");
	
	//������ ������ ��� ���� �� �־��ֱ�
	if(i_irtn.equals("1")){
		if(i_sex.equals("0")){
			v_sex = "2";
		}else if(i_sex.equals("1")){
			v_sex = "1";
		}
	}
	//������ ������ �ƴ� ��� ���� �� �־��ֱ�
	if(!box.getString("p_resno2").equals("")){
		v_sex = box.getString("p_resno2").substring(0,1);
		if(box.getString("p_resno2").substring(0,1).equals("3")){
			v_sex="1";
		}else if(box.getString("p_resno2").substring(0,1).equals("4")){
			v_sex="2";
		}
	}
	// �ȽɽǸ������� ��� ���� �� �־��ֱ�
	if(nc_cert.equals("Y")){
		if( nc_gender.equals("M") || nc_gender.equals("A") ){
			v_sex="1";
		}else if( nc_gender.equals("F") || nc_gender.equals("B") ){
			v_sex="2";
		}
	}	
	//������ ������ ��� ������� �־��ֱ�
	if(i_irtn.equals("1")){
		v_memberyear  = i_birthdate.substring(0,4);
		v_membermonth = i_birthdate.substring(4,6);
		v_memberday   = i_birthdate.substring(6,8); 
	}	
	//������ ������ �ƴ� ��� ������� �־��ֱ�
	if(!box.getString("p_resno1").equals("")){
		v_memberyear  = "19"+box.getString("p_resno1").substring(0,2); 
		v_membermonth = box.getString("p_resno1").substring(2,4);
		v_memberday   = box.getString("p_resno1").substring(4,6); 
	}
	//�ȽɽǸ��ϰ�� ������� �־��ֱ�
	if(nc_cert.equals("Y")){
		v_memberyear  = nc_jumindate.substring(0,4); 
		v_membermonth = nc_jumindate.substring(4,6);
		v_memberday   = nc_jumindate.substring(6,8);
	}
	
	
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<style type="text/css">
body {
	padding: 0px;
	}
h1 a {
	color: #000;
	}
input {
	border: 1px solid #999;
	margin: 0 5px;
	}
.password_strength {
	padding: 0 5px;
	display: inline-block;
	}
.password_strength_1 {
	background-color: #fcb6b1;
	}
.password_strength_2 {
	background-color: #fccab1;
	}
.password_strength_3 {
	background-color: #fcfbb1;
	}
.password_strength_4 {
	background-color: #dafcb1;
	}
.password_strength_5 {
	background-color: #bcfcb1;
	}
</style>

<!-- ��ũ��Ʈ���� -->
<script language="JavaScript" type="text/JavaScript">
<!--//
function checkId(){
	var userid = document.form1.p_userid.value;
	var p_userid_len = userid.length;

		if(p_userid_len > 0){
			if(p_userid_len > 5 && p_userid_len < 13){
                // ID �ߺ��˻�
                var url = "/servlet/controller.homepage.MainMemberJoinServlet?p_userid="+userid+"&p_process=CheckId";
                var v_win = window.open(url, "selfTest1"," left=20, top=20, width=394, height=312, menubar=no, scrollbars=no, resizable=yes");
			}else{
				alert("���̵� 6�� �̻� 12�� ���Ϸ� �ٽ� �Է����ּ���.");
				return;
			}
		}else{
			alert("���̵� �Է����ּ���.");
			return;
		}
	}


function IDText_Check () {
    var Str = document.form1.p_userid.value;
    var Chr="";
    var chkCnt=0;
    for (i=0; i<Str.length; i++) {
        Chr = Str.charAt(i);
        if ((Chr < "0" || Chr >"9" ) && (Chr <'a' || Chr >'z'))  {
        alert("�����ҹ���, ���� �Է¸� �����մϴ�.");
            document.form1.p_userid.value;
            document.form1.p_userid.focus();
            return false;
        }
    }
}

// �����ȣ�˻�
function searchPost(gubun) {
	window.self.name = "PersonalSelect";
	open_window("openPost","","100","100","417","400","","","","yes","");
	document.form1.target = "openPost";
	document.form1.action='/servlet/controller.library.PostSearchServlet';
	document.form1.p_postgubun.value = gubun;
	document.form1.p_process.value = 'SearchPostOpenPage';
	document.form1.submit();
	document.form1.target = window.self.name;
}

function delAddr(no){
	if( no == 1 ){
		document.form1.p_home_addr2.value = ""
    }
}

function receivePost(post1, post2, addr, postgubun){
	if( postgubun == "1" ){
		//document.form1.p_post1.value = post1;
		//document.form1.p_post2.value = post2;
		document.form1.p_home_addr1.value = addr;
		document.form1.p_home_addr2.focus();
    }
}

function Submit_Check(){
    var fm=document.form1;
    var v_hometel = fm.p_hometel1.value+'-'+fm.p_hometel2.value+'-'+fm.p_hometel3.value;
    var v_handphone = fm.p_handphone1.value+'-'+fm.p_handphone2.value+'-'+fm.p_handphone3.value;
    var v_email = fm.p_email1.value+'@'+fm.p_email2.value;
    
    var chk_num = "";
    var chk_lower = "";
    var chk_upper = "";
    var chk_special = "";

    //if( (fm.p_kor_name.value) == ""){
    //    alert("�̸��� �Է��ϼ���");
    //    fm.p_kor_name.focus();return;
    //}

    if( (fm.p_userid.value) == "" ){
        alert("���̵� �ٸ��� �Է��ϼ���");
        fm.p_userid.focus();return;
    }

    chk_num = fm.p_userid.value.search(/[0-9]/g);
    chk_lower = fm.p_userid.value.search(/[a-z]/ig);

    if (!/^[a-z0-9]{6,12}$/.test(fm.p_userid.value) ||  (chk_num < 0 || chk_lower< 0) ){
        alert("���̵�� ���� �ҹ���, ���ڸ� ȥ���Ͽ� 6-12�ڸ��� �Է��� �ּ���.");
        fm.p_userid.value;
        fm.p_userid.focus();
        return;
    }

    if(fm.p_chk.value != "Y"){
        alert("���̵� �ߺ�üũ�� �ϼ���"); return;
    }
	/*
	if( fm.p_sex[0].checked == false && fm.p_sex[1].checked == false ) {
		alert("������ �����Ͻʽÿ�.");
		return;
	}
	*/
	//if( fm.p_memberyear.value == "" ){
	//	alert("��������� �Է��� �ּ���.");
	//	return;
	//}
	//if( fm.p_membermonth.value == "" ){
	//	alert("��������� �Է��� �ּ���.");
	//	return;
	//}
	//if( fm.p_memberday.value == "" ){
	//	alert("��������� �Է��� �ּ���.");
	//	return;
	//}

    // ��й�ȣ ���� ����
    var p_pwd_len =  fm.p_pwd.value.length;

    chk_num = fm.p_pwd.value.search(/[0-9]/g);
    chk_lower = fm.p_pwd.value.search(/[a-z]/ig);
    chk_upper = fm.p_pwd.value.search(/[A-Z]/ig);
    chk_special = fm.p_pwd.value.search(/[^a-zA-Z0-9]/g);

    if(p_pwd_len <= 0){
        alert("��й�ȣ�� �Է����ּ���.");
        fm.p_pwd.focus();         
        return;
    }else{
        //if (!/^[a-zA-Z0-9]{9,14}$/.test(fm.p_pwd.value) || (chk_num < 0 || chk_lower< 0 || chk_upper < 0)){
        if ( p_pwd_len < 9 || p_pwd_len > 14 || chk_lower< 0 || chk_upper < 0 ||  (chk_num < 0 && chk_special< 0 ) ){
            alert("��й�ȣ�� ���� ��/�ҹ��ڿ� ���� �Ǵ� Ư�����ڸ� ȥ���Ͽ� 9-14�ڸ��� �Է��� �ּ���.");
            fm.p_pwd.value="";
            fm.p_pwd.focus();
            return;
        }
    }

    if( fm.p_pwd.value == fm.p_userid.value){
        alert("���̵�� ������ ��й�ȣ�� ��� �Ͻ� �� �����ϴ�.");
        fm.p_pwd.value="";
        fm.p_pwd.focus();return;
    }

    if( (fm.p_pwd_re.value) == ""){
        alert("��й�ȣȮ���� �Է��ϼ���");
        fm.p_pwd_re.focus();return;
    }

    if(fm.p_pwd.value != fm.p_pwd_re.value){
        alert("��й�ȣ�� �ٸ��� �ԷµǾ����ϴ�.");
        fm.p_pwd.value;
        fm.p_pwd_re.value ="";
        fm.p_pwd.focus();
        return;
    }

   if( (fm.p_hometel1.value) == "" ){
        alert("��ȭ��ȣ�� �Է��ϼ���");
        fm.p_hometel1.focus(); return;
    }else if( (fm.p_hometel2.value) == "" || fm.p_hometel2.length > 4 ){
        alert("��ȭ��ȣ�� �ٸ��� �Է��ϼ���");
        fm.p_hometel2.focus(); return;
    }else if( (fm.p_hometel3.value) == "" || fm.p_hometel3.length > 4 ){
        alert("��ȭ��ȣ�� �ٸ��� �Է��ϼ���");
        fm.p_hometel3.focus(); return;
    }

    if( (fm.p_handphone1.value) == "" ){
        alert("�ڵ��� ��ȣ�� �Է��ϼ���");
        fm.p_handphone1.focus(); return;
    }else if( (fm.p_handphone2.value) == "" || fm.p_handphone2.length > 4 ){
        alert("�ڵ��� ��ȣ�� �ٸ��� �Է��ϼ���");
        fm.p_handphone2.focus(); return;
    }else if( (fm.p_handphone3.value) == "" || fm.p_handphone3.length > 4 ){
        alert("�ڵ��� ��ȣ�� �ٸ��� �Է��ϼ���");
        fm.p_handphone3.focus(); return;
    }

    // �ּ� (�����ϳ��� �Է�)
    //var v_post = fm.p_post1.value + fm.p_post2.value;

    //if( v_post == "" ){
    //    alert("�����ȣ�� �Է��ϼ���");
    //    fm.p_post1.focus();	return;
    //}

    if( (fm.p_home_addr1.value) == "" ){
        alert("�ּҸ� �Է��ϼ���");
        fm.p_home_addr1.focus();	return;
    }//else if( (fm.p_home_addr2.value) == "" ){
     //   alert("�ּҸ� �Է��ϼ���");
     //   fm.p_home_addr2.focus();	return;
    //}
    // -->

    if (fm.p_email1.value =="" || fm.p_email2.value == ""){
        alert("Email �ּҸ� �ٸ��� �Է��ϼ���");
        fm.p_email1.focus();return;
    }

    /*
   // �̸���
    if(isValInput(fm.p_email, "�̸���", 50, "U") == false)
    {
        return false;
    }
    */

    // e-mail check
    if(is_mail(v_email) == false)
    {
        alert("��Ȯ�� E-Mail�� �Է��Ͻʽÿ�.");
        fm.p_email1.focus();
        return;
    }

    if( fm.p_jikup.value == "" ){
		alert("������ �����Ͻʽÿ�.");
		return;
    }

    if( fm.p_workfieldcd.value == "" ){
		alert("����о߸� �����Ͻʽÿ�.");
		return;
    }

    //if( fm.p_compnm.value == "" ){
	//	alert("�Ҽ��� �Է��ϼ���.");
	//	return;
    //}

    //if( fm.p_registerMotive.value == "" ){
	//	alert("���Ե��⸦ �����Ͻʽÿ�.");
	//	return;
    //}

    //if( fm.p_registerRoute.value == "" ){
	//	alert("���԰�θ� �����Ͻʽÿ�.");
	//	return;
    //}

    // ����
    document.form1.target="_self";
    document.form1.action= https_host() + "/servlet/controller.homepage.MainMemberJoinServlet";
    document.form1.p_handphone.value = v_handphone;
    document.form1.p_hometel.value = v_hometel;
    document.form1.p_email.value = v_email;
    document.form1.p_process.value="JoinOk";
    document.form1.submit();
}

//-------------------------------------------------------
// �̸��� �� �̸������� ID�˻�
//-------------------------------------------------------
function is_mail(strEmail)
{
    /** ��������
     - @�� 2���̻�
     - .�� �پ ������ ���
     -  @.��  .@�� �����ϴ� ���
     - ��ó����.�� ��� **/
    var regDoNot = /(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/;

    /** �ʼ�����
     - @������ �ϳ��̻��� ���ڰ� �־�� ��
     - @�� �ϳ��־�� ��
     - Domain�� .�� �ϳ� �̻� �־�� ��
     - Domain���� ������ ���ڴ� ������ 2~4���̾�� �� **/
    var regMust = /^[a-zA-Z0-9\-\.\_]+\@[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4})$/;

    if ( !regDoNot.test(strEmail) && regMust.test(strEmail) )
    {
        return true;
    }
    else
    {
        return false;
    }
}

function emailChange() {
    var r=$("[name='p_email3']").val();
    $("[name='p_email2']").val(r);
}

function workfieldChange() {
    if (document.form1.p_workfieldcd.value == "99") {
        document.getElementById('divWork').innerHTML = "<input name='p_workfieldnm' type='text' class='inp_txt_01' id='p_workfieldnm' size='30' maxlength='15' />";
        document.form1.p_workfieldnm.value="";
    } else {
        document.getElementById('divWork').innerHTML="";
    }
}

function checkYN()
{
    var r=$("[name='p_ismailing']").val();
    if(r=="Y")
        $("[name='p_ismailing']").val("N");
    else
        $("[name='p_ismailing']").val("Y");
}

//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- form ���� -->
<form name="form1"  action="" method="post">
	<input type="hidden"	name="p_process"	value="" />
	<input type="hidden"	name="p_resno1"	value="<%=v_resno1 %>" />
    <input type="hidden"	name="p_resno2"	value="<%=v_resno2 %>" />
    <input type="hidden"	name="p_resno"	value="<%=v_resno %>" />
    <input type="hidden"	name="p_sex"	value="<%=v_sex %>"/>
	<input type="hidden"	name="p_handphone" />
    <input type="hidden"	name="p_hometel" />
    <input type="hidden"	name="p_email" />
	<input type="hidden"	name="p_postgubun" value=""/>
	<input type="hidden"	name="p_chk" />
	<input type="hidden"	name="p_dupinfo" value="<%=box.getSession("dupinfo")%>" />
	<input type="hidden"	name="p_conninfo" value="<%=box.getSession("conninfo")%>" />
	<%if(!box.getString("p_username").equals("")){ %>
    <input type="hidden"	name="p_kor_name" value="<%=v_username%>" />
    <%}else if(i_irtn.equals("1")){ %>
    <input type="hidden"	name="p_kor_name" value="<%=i_username%>" />
    <%}else if(nc_cert.equals("Y")){ %>
    <input type="hidden"	name="p_kor_name" value="<%=nc_username%>" />
    <%}
	if(i_irtn.equals("1")){ %>    
    <input type="hidden"	name="p_vnumber" value="<%=i_vnumber%>" />
    <%}%>
    <input type="hidden"	name="pp_username" value="<%=vv_username%>" />
    <input type="hidden"	name="pp_email" value="<%=vv_email1%>@<%=vv_email2 %>" />
    
    <input type="hidden"	name="p_safeid" value="<%=nc_safeid%>" />
    
	
	<%if( box.getSession("tem_grcode").equals("N000001")) { %>
      
      <table>   
	      <tr>
	      	<td>
	      	
	      	<!--Ÿ��Ʋ�κ�//-->
      <table width="672" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="15"></td>
        </tr>
        <tr>
          <td><!--process-->
            <table width="672" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="34"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td><img src="/images/portal/homepage_renewal/member/step_03.gif" alt="" /></td>
                    </tr>
                  </table></td>
              </tr>
            </table>
            <!--process//-->
          </td>
        </tr>
        <tr>
          <td height="15"></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td id="s_stit"><img src="/images/portal/homepage_renewal/member/s_stitle_04.gif" alt="ȸ������" /></td>
					<td align="right" valign="bottom">* �ʼ� �Է� ���� �Դϴ�.</td>
				</tr>
			</table>
			</td>
        </tr>
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" id="join_form">
          	<%if(!vv_username.equals("")){ %>
          	<tr>
              <td class="tit_table01">��ȣ�� ����</td>              
             <td class="tit_table02" colspan="3"><strong><%=vv_username %></strong></td>             
            </tr>
            <tr>
              <th>��ȣ�� �̸���</th>              
             <td class="table_right" colspan="3"><strong><%=vv_email1 %>@<%=vv_email2 %></strong></td>             
            </tr>
            <tr>
              <th>����</th>
              <%if(!box.getString("p_username").equals("")){ %>
             <td class="table_right" colspan="3"><strong><%=v_username%></strong></td>
             <%}else if(i_irtn.equals("1")){ %>
             <td class="table_right" colspan="3"><strong><%=i_username%></strong></td>
             <%} %>
            </tr>
            <%}else{ %>
            <tr>
              <td class="tit_table01">����</td>
              <%if(!box.getString("p_username").equals("")){ %>
             <td class="tit_table02" colspan="3"><strong><%=v_username%></strong></td>
             <%}else if(i_irtn.equals("1")){//������ %>
             <td class="tit_table02" colspan="3"><strong><%=i_username%></strong></td>
             <%}else if(nc_cert.equals("Y")){//�ȽɽǸ� %>
             <td class="tit_table02" colspan="3"><strong><%=nc_username%></strong></td>
             <%} %>
            </tr>
            <%} %>
            <tr>
              <th>���̵� *</th>
              <td height="50" class="table_right"><input type="text" name="p_userid" id="p_userid" style="width:130px; height:20px;" />
                  <a href="javascript:checkId();"><img src="/images/portal/homepage_renewal/member/btn_id_chk.gif" alt="�ߺ�Ȯ��" align="middle"/></a>
                  <p>* ���̵�� 6-12���� ������, ������ �������� ���� �� �ֽ��ϴ�.</p></td>
            </tr>
            <!--<tr>
              <th>������� *</th>
              <td class="table_right"><input type="text" name="textfield5" id="textfield5" style="width:50px; height:20px;" />
                ��
                <input type="text" name="textfield6" id="textfield6" style="width:50px; height:20px;" />
                ��
  <input type="text" name="textfield7" id="textfield7" style="width:50px; height:20px;" />
                ��</td>
            </tr> -->
            <tr>
              <th>��й�ȣ *</th>
              <td height="65" class="table_right"><input type="password" name="p_pwd" id="p_pwd" style="width:130px; height:20px;" />
                  <p style="padding-top:3px">* ���� ��/�ҹ��ڿ� ���� �Ǵ� Ư�����ڸ� ȥ���Ͽ� 9-14�ڸ��� �Է��� �ּ���.<br />
                    *   ���ӵ� ����, ���Ϲ�ȣ, �ֹε�Ϲ�ȣ �� �˱� ���� ���ڴ� �����ּ���.</p></td>
            </tr>
            <tr>
              <th>��й�ȣ Ȯ�� *</th>
              <td class="table_right"><input type="password" name="p_pwd_re" id="p_pwd_re" style="width:130px; height:20px;" /></td>
            </tr>
			<tr>
              <th>���� *</th>
              <td class="table_right">
<%           if(!box.getString("p_resno2").equals("")){
			 	if(v_sex.equals("1")){ %>
   					 <input name="p_sex" type="radio" value="1" id="p_sex" checked disabled />���� 
					 <input name="p_sex" type="radio" value="2" id="p_sex" disabled />����
<%              }else if( v_sex.equals("2")){ %>
		 			 <input name="p_sex" type="radio" value="1" id="p_sex" disabled />����
		 			 <input name="p_sex" type="radio" value="2" id="p_sex" checked disabled />����
<%              } 
			 }else if(i_irtn.equals("1")){
			 	if(i_sex.equals("1")){ %>
   					 <input name="p_sex" type="radio" value="1" id="p_sex" checked disabled />���� 
					 <input name="p_sex" type="radio" value="0" id="p_sex" disabled />����
<%              }else if(i_sex.equals("0")){ %>
					 <input name="p_sex" type="radio" value="1" id="p_sex" disabled />����
		 			 <input name="p_sex" type="radio" value="2" id="p_sex" checked disabled />����
<%				}
			 }else if(nc_cert.equals("Y"))  {
			 	if(nc_gender.equals("M")){%>
			 		<input name="p_sex" type="radio" value="1" id="p_sex" checked disabled />���� 
					<input name="p_sex" type="radio" value="0" id="p_sex" disabled />����
				<%}else if(nc_gender.equals("F")){ %>
					 <input name="p_sex" type="radio" value="1" id="p_sex" disabled />����
		 			 <input name="p_sex" type="radio" value="2" id="p_sex" checked disabled />����
		 		<%}else if(nc_gender.equals("A")){%>
		 			 <input name="p_sex" type="radio" value="1" id="p_sex" checked disabled />���� 
					 <input name="p_sex" type="radio" value="0" id="p_sex" disabled />����
				<%}else if(nc_gender.equals("B")){ %>
					 <input name="p_sex" type="radio" value="1" id="p_sex" disabled />����
			 		 <input name="p_sex" type="radio" value="2" id="p_sex" checked disabled />����
		 		<%} %>
<%           } else  {%>
			 <input name="p_sex" type="radio" value="1" id="p_sex" />����
			 <input name="p_sex" type="radio" value="2" id="p_sex" />����
<%           } %>
<%          //������� %>    
			 <input name="p_memberyear"  type="hidden" class="inp_txt_01" id="p_memberyear"  value="<%=v_memberyear %>"  size="5" maxlength="4" readonly />
 			 <input name="p_membermonth" type="hidden" class="inp_txt_01" id="p_membermonth" value="<%=v_membermonth %>" size="5" maxlength="2" readonly />
 			 <input name="p_memberday"   type="hidden" class="inp_txt_01" id="p_memberday"   value="<%=v_memberday %>"   size="5" maxlength="2" readonly />
              </td>
            </tr>
            <tr>
              <th>��ȭ��ȣ *</th>
              <td class="table_right"><select name="p_hometel1" id="p_hometel1" style="height:20px">
                  <option value="02">02</option>
                  <option value="031">031</option>
                  <option value="032">032</option>
                  <option value="033">033</option>
                  <option value="041">041</option>
                  <option value="042">042</option>
                  <option value="043">043</option>
                  <option value="044">044</option>
                  <option value="051">051</option>
                  <option value="052">052</option>
                  <option value="053">053</option>  
                  <option value="054">054</option>
                  <option value="055">055</option>  
                  <option value="061">061</option>  
                  <option value="062">062</option>
                  <option value="063">063</option>  
                  <option value="064">064</option>
                  <option value="070">070</option>  
               </select>
                -
  <input type="text" name="p_hometel2" id="p_hometel2" style="width:70px; height:20px;" />
                -
  <input type="text" name="p_hometel3" id="p_hometel3" style="width:70px; height:20px;" /></td>
            </tr>
            <tr>
              <th>�޴��� *</th>
              <td class="table_right"><select name="p_handphone1" id="p_handphone1" style="height:20px">
                  <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="016">016</option>
                    <option value="017">017</option>
                    <option value="018">018</option>
                    <option value="019">019</option>
                </select>
                -
  <input type="text" name="p_handphone2" id="p_handphone2" style="width:70px; height:20px;" />
                -
  <input type="text" name="p_handphone3" id="p_handphone3" style="width:70px; height:20px;" /></td>
            </tr>
            <tr>
              <th>���� *</th>
              <td class="table_right"><select name="p_home_addr1" id="p_home_addr1" style="height:20px">
                  <option value="����">����</option>
                  <option value="���">���</option>
                  <option value="�泲">�泲</option>
                  <option value="���">���</option>
				  <option value="����">����</option>
				  <option value="�뱸">�뱸</option>
				  <option value="����">����</option>
				  <option value="�λ�">�λ�</option>
				  <option selected value="����">����</option>
				  <option value="���">���</option>
				  <option value="��õ">��õ</option>
				  <option value="����">����</option>
				  <option value="����">����</option>
				  <option value="����">����</option>
				  <option value="�泲">�泲</option>
				  <option value="���">���</option>
                </select></td>
            </tr>
            <tr>
              <th>�̸��� *</th>
              <td height="65" class="table_right"><input type="text" name="p_email1" id="p_email1" style="width:130px; height:20px;" />
                @
                <input type="text" name="p_email2" id="p_email2" style="width:130px; height:20px;" />
    <select name="p_email3" id="p_email3" onchange="emailChange();">
                       <option value="">�����Է�</option>
                       <option value="naver.com" >naver.com</option>
                       <option value="chol.com" >chol.com</option>
                       <option value="dreamwiz.com" >dreamwiz.com</option>
                       <option value="empal.com" >empal.com</option>
                       <option value="freechal.com" >freechal.com</option>
                       <option value="gmail.com" >gmail.com</option>
                       <option value="hanafos.com" >hanafos.com</option>
                       <option value="hanmail.net" >hanmail.net</option>
                       <option value="hanmir.com" >hanmir.com</option>
                       <option value="hitel.net" >hitel.net</option>
                       <option value="hotmail.com" >hotmail.com</option>
                       <option value="korea.com" >korea.com</option>
                       <option value="lycos.co.kr" >lycos.co.kr</option>
                       <option value="nate.com" >nate.com</option>
                       <option value="netian.com" >netian.com</option>
                       <option value="paran.com" >paran.com</option>
                       <option value="yahoo.com" >yahoo.com</option>
                       <option value="yahoo.co.kr" >yahoo.co.kr</option>
                   </select>
    <p style="padding-top:3px">* �ѱ���������ī���̿��� �����ϴ� ������ ��� ȸ������ �������� �ʿ��� ������<br />
      �ַ� ����Ͻô� �̸��� �ּҸ� �Է����ּ���.</p></td>
            </tr>
            <tr>
              <th>���� *</th>
              <td class="table_right">
              	<%=CodeConfigBean.getCodeGubunSelect ("0104","", 1,"p_jikup","","",3) %>
              </td>
            </tr>
            <tr>
              <th>����о� *</th>
              <td class="table_right">
              	<%=CodeConfigBean.getCodeGubunSelect ("0103","", 1,"p_workfieldcd","","onChange='javascript:workfieldChange()'",3) %>
                <div id="divWork"></div>
              </td>
            </tr>
			<tr>
              <th>�������� ����</th>
              <td class="table_right">
                <input type="checkbox" name="p_ismailing" id="p_ismailing" value="N" onclick="checkYN();" />
                                 ���� �� �̺�Ʈ �ҽ��� E-Mail Ȥ�� SMS���� ���� �ϰڽ��ϴ�.              
              </td>
            </tr>
<!--             <tr>
              <th>�Ҽ� *</th>
              <td class="table_right"><span style="padding-top:2px;">
                <input type="text" name="textfield17" id="textfield19" style="width:250px; height:20px;" />
              </span></td>
            </tr>
 -->
          </table></td>
        </tr>
        <tr>
        	<td height="30"></td>
        </tr>
        <tr>
          <td id="s_stit"><img src="/images/portal/homepage_renewal/member/s_stitle_05.gif" alt="�ΰ�����" /></td>
        </tr>
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" id="join_form">
            <tr>
              <td class="tit_table01">���Ե���</td>
              <td class="tit_table02">
                <%=CodeConfigBean.getCodeGubunSelect ("0106","", 1,"p_registerMotive","","",3) %>
              </td>
            </tr>
            <tr>
              <th>���԰��</th>
              <td class="table_right">
              	<%=CodeConfigBean.getCodeGubunSelect ("0105","", 1,"p_registerRoute","","",3) %>
              </td>
            </tr>
            <tr>
              <th>��õ�� ���̵�</th>
              <td class="table_right"><span style="padding-top:2px;">
                <input type="text" name="p_recommendid" id="p_recommendid" value="" size="30" maxlength="30" class="inp_txt_01" />
              </span></td>
            </tr>

          </table></td>
        </tr>
        <tr>
          <td height="30">&nbsp;</td>
        </tr>
        <tr>
        	<td id="btn"><a href="javascript:Submit_Check();"><img src="/images/portal/homepage_renewal/member/btn_confirm.gif" /></a> <a href="/servlet/controller.homepage.MainServlet"><img src="/images/portal/homepage_renewal/member/btn_cancle.gif" /></a></td>
        </tr>
      </table></td>
    <td width="20">&nbsp;</td>
    
  </tr>
</table>
	      	
	      	<%}else{ %>
	
        <h2><img src="/images/portal/member/membership/h1_tit.gif" alt="ȸ������" class="fl_l" /><p class="category">Home &gt; �̿�ȳ� &gt; <strong>ȸ������</strong></p></h2>

        <p><img src="/images/portal/member/membership/member_info_3.gif" alt="�����Է�" /></p>
        <p class="mg_t30"><img src="/images/portal/member/membership/stit_m4.gif"  alt="ȸ������" /></p>
        <p class="mg_t15"></p>

        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mg_t18">
        <tr>
         <td bgcolor="#d4d9ee" style="border-top:1px solid #96a5e1;"><table width="100%" border="0" cellspacing="1" cellpadding="0">
           <tr>
             <td width="125" class="chart001">����(�ѱ�)</td>
             <%if(!box.getString("p_username").equals("")){ %>
             <td class="chart002" colspan="3"><strong><%=v_username%></strong></td>
             <%}else if(i_irtn.equals("1")){ %>
             <td class="chart002" colspan="3"><strong><%=i_username%></strong></td>
             <%} %>
           </tr>
           <tr>
             <td width="125" class="chart001">���̵� *</td>
             <td class="chart002" colspan="3">
               <input name="p_userid" type="text" class="inp_txt_01" id="p_userid" size="20" maxlength="12"/>
               <a href="javascript:checkId()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image23','','/images/portal/member/membership/btn_check_o.gif',1)">
                   <img src="/images/portal/member/membership/btn_check_a.gif" name="Image23" width="64" height="24" border="0" align="absmiddle" id="Image23" alt="�ߺ�Ȯ��"/></a><br/>
               <span class="lh_20 fs_11 ls">* ���̵�� 6-12���� ������, ������ �������� ���� �� �ֽ��ϴ�.</span></td>
           </tr>
           <tr>
             <td width="125" class="chart001">���� *</td>
             <td width="125" class="chart002">
<%           if(!box.getString("p_resno2").equals("")){
			 	if(v_sex.equals("1")){ %>
   					 <input name="p_sex" type="radio" value="1" id="p_sex" checked disabled />���� 
					 <input name="p_sex" type="radio" value="2" id="p_sex" disabled />����
<%              }else if( v_sex.equals("2")){ %>
		 			 <input name="p_sex" type="radio" value="1" id="p_sex" disabled />����
		 			 <input name="p_sex" type="radio" value="2" id="p_sex" checked disabled />����
<%              } 
			 }else if(i_irtn.equals("1")){
			 	if(i_sex.equals("1")){ %>
   					 <input name="p_sex" type="radio" value="1" id="p_sex" checked disabled />���� 
					 <input name="p_sex" type="radio" value="0" id="p_sex" disabled />����
<%              }else if(i_sex.equals("0")){ %>
					 <input name="p_sex" type="radio" value="1" id="p_sex" disabled />����
		 			 <input name="p_sex" type="radio" value="2" id="p_sex" checked disabled />����
<%				}
			 }else {%>
			 <input name="p_sex" type="radio" value="1" id="p_sex" />����
			 <input name="p_sex" type="radio" value="2" id="p_sex" />����
<%           } %>			 			   	                                     
             </td>
             <td width="125" class="chart001">�������</td>
             <td width="200" class="chart002">
<%           if(!box.getString("p_resno1").equals("")){%>     
			 <input name="p_memberyear"  type="text" class="inp_txt_01" id="p_memberyear"  value="<%=v_memberyear %>"  size="5" maxlength="4" readonly />&nbsp;��&nbsp;&nbsp;
 			 <input name="p_membermonth" type="text" class="inp_txt_01" id="p_membermonth" value="<%=v_membermonth %>" size="5" maxlength="2" readonly />&nbsp;��&nbsp;&nbsp;
 			 <input name="p_memberday"   type="text" class="inp_txt_01" id="p_memberday"   value="<%=v_memberday %>"   size="5" maxlength="2" readonly />&nbsp;��&nbsp;&nbsp;
<%			 }else { %>
			 <input name="p_memberyear"  type="text" class="inp_txt_01" id="p_memberyear"  size="5" maxlength="4"/>&nbsp;��&nbsp;&nbsp;
 			 <input name="p_membermonth" type="text" class="inp_txt_01" id="p_membermonth" size="5" maxlength="2"/>&nbsp;��&nbsp;&nbsp;
 			 <input name="p_memberday"   type="text" class="inp_txt_01" id="p_memberday"   size="5" maxlength="2"/>&nbsp;��&nbsp;&nbsp;	
<%           } %>
             </td>  
           </tr>
           <tr>
             <td width="125" class="chart001">��й�ȣ *</td>
             <td class="chart002" colspan="3">
               <table width="100%" border="0" cellspacing="0" cellpadding="0">
                 <tr>
                   <td height="27"><input name="p_pwd" type="password" class="inp_txt_01" id="p_pwd" size="20" maxlength="" /></td>
                 </tr>
                 <tr>
                   <td><span class="lh_20 fs_11 ls">* ���� ��/�ҹ��ڿ� ���� �Ǵ� Ư�����ڸ� ȥ���Ͽ� 9-14�ڸ��� �Է��� �ּ���.<br />
                    * ���ӵ� ����, ���Ϲ�ȣ, �ֹε�Ϲ�ȣ �� �˱� ���� ���ڴ� �����ּ���.</span></td>
                 </tr>
               </table> </td>
           </tr>
           <tr>
                <td width="125" class="chart001">��й�ȣ Ȯ�� *</td>
                <td class="chart002" colspan="3">
                <input name="p_pwd_re" type="password" class="inp_txt_01" id="p_pwd_re" size="20" maxlength="" /></td>
           </tr>
           <tr>
             <td width="125" class="chart001">��ȭ��ȣ *</td>
             <td class="chart002" colspan="3">
                 <select name="p_hometel1" id="p_hometel1">
                    <option value="02">02</option>
                    <option value="051">051</option>
                    <option value="053">053</option>
                    <option value="032">032</option>
                    <option value="062">062</option>
                    <option value="042">042</option>
                    <option value="052">052</option>
                    <option value="031">031</option>
                    <option value="033">033</option>
                    <option value="043">043</option>
                    <option value="041">041</option>
                    <option value="063">063</option>
                    <option value="061">061</option>
                    <option value="054">054</option>
                    <option value="055">055</option>
                    <option value="064">064</option>
                </select>
                -
                <input name="p_hometel2" type="text" class="inp_txt_01" id="p_hometel2" size="10" maxlength="4" />
                -
                <input name="p_hometel3" type="text" class="inp_txt_01" id="p_hometel3" size="10" maxlength="4" />
             </td>
           </tr>
           <tr>
                <td width="125" class="chart001">�޴��� * </td>
                <td class="chart002" colspan="3"><select name="p_handphone1" id="p_handphone1">
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="016">016</option>
                    <option value="017">017</option>
                    <option value="018">018</option>
                    <option value="019">019</option>
                </select>
                -
                <input name="p_handphone2" type="text" class="inp_txt_01" id="p_handphone2" size="10" maxlength="4" />
                -
                <input name="p_handphone3" type="text" class="inp_txt_01" id="p_handphone3" size="10" maxlength="4" />
                </td>
           </tr>
           <tr>
             <td width="125" class="chart001">�ּ� *</td>
             <td class="chart002" colspan="3">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="27">
                        <input name="p_post1" type="text" class="inp_txt_01" id="p_post1" size="10" readonly value="" /> -
                        <input name="p_post2" type="text" class="inp_txt_01" id="p_post2" size="10" readonly value="" />
                        <a href="javascript:searchPost(1);" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image24','','/images/portal/member/membership/btn_zip_o.gif',1)">
                            <img src="/images/portal/member/membership/btn_zip_a.gif" name="Image24" width="64" height="24" border="0" align="absmiddle" id="Image24" alt="�����ȣ"/></a></td>
                 </tr>
                 <tr>
                    <td><input name="p_home_addr1" type="text" class="inp_txt_01" id="p_home_addr1" size="40" readonly value="" />
                      <input name="p_home_addr2" type="text" class="inp_txt_01" id="p_home_addr2" size="40" value="" maxlength="40" /></td>
                 </tr>
                </table></td>
           </tr>
           <tr>
             <td class="chart001">�̸��� *</td>
             <td class="chart002" colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0">
               <tr>
                 <td height="27"><input name="p_email1" type="text" class="inp_txt_01" id="p_email1" size="20" maxlength="20" /> @
                   <input name="p_email2" type="text" class="inp_txt_01" id="p_email2" size="20"  maxlength="20" />
                   <select name="p_email3" id="p_email3" onchange="emailChange();">
                       <option value="">�����Է�</option>
                       <option value="naver.com" >naver.com</option>
                       <option value="chol.com" >chol.com</option>
                       <option value="dreamwiz.com" >dreamwiz.com</option>
                       <option value="empal.com" >empal.com</option>
                       <option value="freechal.com" >freechal.com</option>
                       <option value="gmail.com" >gmail.com</option>
                       <option value="hanafos.com" >hanafos.com</option>
                       <option value="hanmail.net" >hanmail.net</option>
                       <option value="hanmir.com" >hanmir.com</option>
                       <option value="hitel.net" >hitel.net</option>
                       <option value="hotmail.com" >hotmail.com</option>
                       <option value="korea.com" >korea.com</option>
                       <option value="lycos.co.kr" >lycos.co.kr</option>
                       <option value="nate.com" >nate.com</option>
                       <option value="netian.com" >netian.com</option>
                       <option value="paran.com" >paran.com</option>
                       <option value="yahoo.com" >yahoo.com</option>
                       <option value="yahoo.co.kr" >yahoo.co.kr</option>
                   </select></td>
               </tr>
               <tr>
                 <td><span class="lh_20 fs_11 ls">* �ѱ���������ī���̿��� �����ϴ� ������ ��� ȸ������ �������� �ʿ��� ������<br />
                   �ַ� ����Ͻô� �̸��� �ּҸ� �Է����ּ���.</span></td>
               </tr>
             </table></td>
           </tr>
           <tr>
             <td class="chart001">�������� ���� *</td>
             <td class="chart002" colspan="3">
               <input type="checkbox" name="p_ismailing" id="p_ismailing" value="N" onclick="checkYN();" />
               <span class="lh_20 fs_11 ls">���� �� �̺�Ʈ �ҽ��� E-Mail Ȥ�� SMS���� ���� �ϰڽ��ϴ�.</span>
             </td>
           </tr>
           <tr>
             <td class="chart001">���� *</td>
             <td class="chart002" colspan="3">
                 <%=CodeConfigBean.getCodeGubunSelect ("0104","", 1,"p_jikup","","",3) %>
             </td>
           </tr>
           <tr>
             <td class="chart001">����о� *</td>
             <td class="chart002" colspan="3">
                 <%=CodeConfigBean.getCodeGubunSelect ("0103","", 1,"p_workfieldcd","","onChange='javascript:workfieldChange()'",3) %>
                <div id="divWork"></div>
             </td>
           </tr>
           <tr>
             <td class="chart001">�Ҽ� *</td>
             <td class="chart002" colspan="3">
             	<input type="text" name="p_compnm" id="p_compnm" value="" size="50" maxlength="100" class="inp_txt_01" />
             </td>
           </tr>
         </table>
           </td>
        </tr>
        </table>
        
        <!-- �ΰ����� �Է� -->
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mg_t18">
          <tr>
            <td style="padding-top:20px;">
              <img src="/images/portal/member/membership/addinfo.gif"  alt="�ΰ�����" />
            </td>
          </tr>
        </table> 
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mg_t18">
        <tr>
         <td bgcolor="#d4d9ee" style="border-top:1px solid #96a5e1;"><table width="100%" border="0" cellspacing="1" cellpadding="0">
           <tr>
             <td width="125" class="chart001">���Ե��� *</td>
             <td class="chart002" colspan="3">
             	<%=CodeConfigBean.getCodeGubunSelect ("0106","", 1,"p_registerMotive","","",3) %>
             </td>
           </tr>
           <tr>
             <td width="125" class="chart001">���԰�� *</td>
             <td class="chart002" colspan="3">
             	<%=CodeConfigBean.getCodeGubunSelect ("0105","", 1,"p_registerRoute","","",3) %>
             </td>
           </tr>
           <tr>
             <td width="125" class="chart001">��õ�� ���̵�</td>
             <td class="chart002" colspan="3">
             	<input type="text" name="p_recommendid" id="p_recommendid" value="" size="30" maxlength="30" class="inp_txt_01" />
             </td>
           </tr></table>
         </td>
         </tr>
         </table>
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mg_t18">
        <tr>
         <td height="50" align="center">
             <a href="javascript:Submit_Check();"><img src="/images/portal/member/membership/btn_ok.gif" width="85" height="29" alt="Ȯ��" /></a>
             <a href="/servlet/controller.homepage.MainServlet"><img src="/images/portal/member/membership/btn_cancel.gif" width="85" height="29" alt="���" /></a>
         </td>
        </tr>
        </table>
        
        <%} %>
        
</form>
<!-- form �� -->

<script type='text/javascript' src='/script/jquery.password_strength.js'></script>
<script language="JavaScript" type="text/JavaScript">
    $('form1').attr('autocomplete', 'off');
    //$('#p_pwd').password_strength();
</script>

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->