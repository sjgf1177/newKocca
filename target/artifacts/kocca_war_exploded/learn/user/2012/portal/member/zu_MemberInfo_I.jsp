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
    
    box.put("topmenu","1");
	box.put("submenu","2");

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

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<script language="javascript" src="/script/jquery.form.js"></script>
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

function existsId()
{
    var r=$.trim($("[name='p_userid']").val());
    if(r=="")
    {
        alert("���̵� �Է��Ͽ� �ֽʽÿ�.");
        return;
    }

    if(r.length<6 || r.length>12)
    {
        alert("���̵�� �� 6~12�ڷθ� ������ �Ǿ�� �մϴ�.");
        return;
    }

    var fm=document.form1;
	var chk_num = fm.p_userid.value.search(/[0-9]/g);
    var chk_lower = fm.p_userid.value.search(/[a-z]/ig);
    if (!/^[a-z0-9]{6,12}$/.test(fm.p_userid.value) ||  (chk_num < 0 || chk_lower< 0) ){
        alert("���̵�� ���� �ҹ���, ���ڸ� ȥ���Ͽ� 6-12�ڸ��� �Է��� �ּ���.");
        fm.p_userid.value;
        fm.p_userid.focus();
        return;
    }

    document.form1.p_process.value = "ASP_Login";
    document.form1.menuid.value = "0";
    document.form1.gubun.value = "20";

    $("[name='form1']").ajaxSubmit({
        url:'/servlet/controller.homepage.MainServlet',
        type:'post',
        data:{userId:r},
        success: function(data){
           var r1=$.trim(data);
           $("#div_Area").text("");
           idExists=false;
           if(r1=="0")
           {
               $("#div_Area").css("color","#FF0000");      //   ID �� ����
               $("#div_Area").text("����Ҽ� ���� ���̵� �Դϴ�.");
           }
           else
           {
               idExists=true;
               $("#div_Area").css("color","#0000FF");      //   ID ����
               $("#div_Area").text("����Ҽ� �ִ� ���̵� �Դϴ�.");               
               document.form1.p_chk.value = "Y";
           }
        }
    });
}


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

    if( fm.p_registerRoute.value == "" ){
		alert("���԰�θ� �����Ͻʽÿ�.");
		return;
    }
    
    //alert( fm.p_sex.value. + '/' +  )

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
<form name="form1"  action="" method="post" action="">
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
	<input type="hidden"	name="gubun" />    
	<input type="hidden"	name="menuid" />
	<div class="content">
		<table class="rootinfo" cellpadding="0" cellspacing="0" summary="���� ������ �������� ��ġ�Դϴ�">
			<tr>
				<td class="pagetitle"><img src="/images/2012/sub/page0/title/member_join.gif" alt="ȸ������"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > <u>ȸ������</u></td>
			</tr>
		</table>
		<table class="joinform" cellpadding="0" cellspacing="0">
			<colgroup><col width="50%"><col width="*"></colgroup>
			<tr>
				<td>
					<img src="/images/2012/sub/page0/join_step03.gif" alt="�����Է�">
					<div class="persnaltip"><h6>ȸ�������� �������� ��޹�ħ�� ���� �����ϰ� ��ȣ�Ǹ�, ȸ������ ����� ���� ���� ���� �Ǵ� �� 3�ڿ��� �������� �ʽ��ϴ�. <a href="page0_persnal.html" tabindex="171" title="��������ó����ħ���� �̵��մϴ�"><u>��������ó����ħ</u></a></h6></div>
					<table class="required" cellpadding="0" cellspacing="0">
						<tr>
							<td class="alignL"><img src="/images/2012/sub/page0/subject_join_input01.gif" alt="�α��� �����Է�"></td>
							<td class="alignR"><img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է»���"> �ʼ��Է»���</td>
						</tr>
					</table>
					<div class="logininfobox">
						<table class="logininfo" cellpadding="0" cellspacing="0">
							<colgroup><col width="120"><col width="*"></colgroup>
							<%if(!vv_username.equals("")){ %>
	          	<tr>
	              <th>��ȣ�� ����</td>              
	              <td><%=vv_username %></td>             
	            </tr>
	            <tr>
	              <th>��ȣ�� �̸���</th>              
	              <td><%=vv_email1 %>@<%=vv_email2 %></td>             
	            </tr>
	            <tr>
	              <th>����</th>
	              <%if(!box.getString("p_username").equals("")){ %>
	              <td><%=v_username%></td>
	             <%}else if(i_irtn.equals("1")){ %>
	             <td><%=i_username%></td>
	             <%} %>
	            </tr>
	            <%}else{ %>
	            <tr>
	              <th>����</td>
	              <%if(!box.getString("p_username").equals("")){ %>
								<td><%=v_username%></td>
								<%}else if(i_irtn.equals("1")){//������ %>
								<td><%=i_username%></td>
								<%}else if(nc_cert.equals("Y")){//�ȽɽǸ� %>
								<td><%=nc_username%></td>
								<%} %>
	            </tr>
	            <%} %>
							<tr>
								<th><img src="/images/2012/common/icon_check.gif" align="absmiddle" alt="�ʼ��Է»���">���̵�</th>
								<td>
									<table class="idsearch" cellpadding="0" cellspacing="0">
										<colgroup><col width="180"><col width="*"></colgroup>
										<tr>
											<td><input type="text" tabindex="172" name="p_userid" id="txtfield1" onfocus="choicefield('1');" class="txt" title="���̵� �Է����ּ���"></td>
											<td><button type="button" tabindex="173" onclick="existsId();" class="checkbtn" title="���� �Է¶��� ����ϴ� ���̵� �Է� �� �� ��ư�� Ŭ�����ּ���">ID �ߺ�Ȯ��</button><span id="div_Area" style="width:200px;margin-left:10px"></span></p></td>
										</tr>
										<tr>
											<td colspan="2" class="idmsg"><h6>���̵�� <b>6~12���� ������ ����</b>���� ���� �� �ֽ��ϴ�.</h6></td>
										</tr>										
									</table>
								</td>
							</tr>
							<tr>
								<th><img src="/images/2012/common/icon_check.gif" align="absmiddle" alt="�ʼ��Է»���">��й�ȣ</th>
								<td>
									<input type="password" tabindex="174" name="p_pwd" id="txtfield2" onfocus="choicefield('2');" class="txt" title="�����Ͻ� ��й�ȣ�� �Է����ּ���">
									<div class="pointmsg">
										<h6>���� ��/�ҹ��ڿ� ���� �Ǵ� Ư�����ڸ� ȥ���Ͽ� 9-14�ڸ��� �Է��� �ּ���.</h6>
										<h6>���Ϲ�ȣ,�ֹε�Ϲ�ȣ �� �˱� ���� ���ڴ� �����ּ���.</h6>
									</div>
								</td>
							</tr>
							<tr>
								<th><img src="/images/2012/common/icon_check.gif" align="absmiddle" alt="�ʼ��Է»���">��й�ȣ Ȯ��</th>
								<td><input type="password" tabindex="175" name="p_pwd_re" id="txtfield3" onfocus="choicefield('3');" class="txt" title="�����Ͻ� ��й�ȣ�� �ѹ� �� �Է����ּ���"></td>
							</tr>
						</table>
						<br><br>
						<div class="rightinput">
						<table class="required" cellpadding="0" cellspacing="0">
							<tr>
								<td class="alignL"><img src="/images/2012/sub/page0/subject_join_input02.gif" alt="ȸ�� �������Է�"></td>
								<td class="alignR"><img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է»���"> �ʼ��Է»���</td>
							</tr>
						</table>
					</div>
					<div class="userdetailbox">
						<table class="userdetail" cellpadding="0" cellspacing="0">
							<colgroup><col width="120"><col width="*"></colgroup>
							<tr>
								<th><img src="/images/2012/common/icon_check.gif" align="absmiddle" alt="�ʼ��Է»���">����</th>
								<td>
									<table class="layoutdefault" cellpadding="0" cellspacing="0">
										<tr>
										<%
										if(!box.getString("p_resno2").equals("")){
											if(v_sex.equals("1")){ 
										%>
								   		<td><input type="radio" tabindex="176" id="male" name="p_sex" class="radio" title="����" value="1"  checked disabled><label for="male" class="label">����</label></td>
											<td style="width:20px;"></td>
											<td><input type="radio" tabindex="176" id="female" name="p_sex" class="radio" title="����" value="2"  disabled><label for="female" class="label">����</label></td>
										<%
											} else if( v_sex.equals("2")){ 
										%>
											<td><input type="radio" tabindex="176" id="male" name="p_sex" class="radio" title="����" value="1" disabled><label for="male" class="label">����</label></td>
											<td style="width:20px;"></td>
											<td><input type="radio" tabindex="176" id="female" name="p_sex" class="radio" title="����" value="2" checked disabled><label for="female" class="label">����</label></td>
										<% 
											} 
										} else if(i_irtn.equals("1")){
											if(i_sex.equals("1")){ %>
								   		<td><input type="radio" tabindex="176" id="male" name="p_sex" class="radio" title="����" value="1"  checked disabled><label for="male" class="label">����</label></td>
											<td style="width:20px;"></td>
											<td><input type="radio" tabindex="176" id="female" name="p_sex" class="radio" title="����" value="2"  disabled><label for="female" class="label">����</label></td>
										<%
											} else if(i_sex.equals("0")){ %>
											<td><input type="radio" tabindex="176" id="male" name="p_sex" class="radio" title="����" value="1" disabled><label for="male" class="label">����</label></td>
											<td style="width:20px;"></td>
											<td><input type="radio" tabindex="176" id="female" name="p_sex" class="radio" title="����" value="2" checked disabled><label for="female" class="label">����</label></td>
										<%
											}
										} else if(nc_cert.equals("Y"))  {
										 	if(nc_gender.equals("M")){%>
											<td><input type="radio" tabindex="176" id="male" name="p_sex" class="radio" title="����" value="1"  checked disabled><label for="male" class="label">����</label></td>
											<td style="width:20px;"></td>
											<td><input type="radio" tabindex="176" id="female" name="p_sex" class="radio" title="����" value="2"  disabled><label for="female" class="label">����</label></td>		
										<%
											} else if(nc_gender.equals("F")){ 
										%>
											<td><input type="radio" tabindex="176" id="male" name="p_sex" class="radio" title="����" value="1" disabled><label for="male" class="label">����</label></td>
											<td style="width:20px;"></td>
											<td><input type="radio" tabindex="176" id="female" name="p_sex" class="radio" title="����" value="2" checked disabled><label for="female" class="label">����</label></td>
										 		
										<% 
											} else if(nc_gender.equals("A")){
										%>
											<td><input type="radio" tabindex="176" id="male" name="p_sex" class="radio" title="����" value="1"  checked disabled><label for="male" class="label">����</label></td>
											<td style="width:20px;"></td>
											<td><input type="radio" tabindex="176" id="female" name="p_sex" class="radio" title="����" value="2"  disabled><label for="female" class="label">����</label></td>
										<%
											} else if(nc_gender.equals("B")){
										%>
											<td><input type="radio" tabindex="176" id="male" name="p_sex" class="radio" title="����" value="1" disabled><label for="male" class="label">����</label></td>
											<td style="width:20px;"></td>
											<td><input type="radio" tabindex="176" id="female" name="p_sex" class="radio" title="����" value="2" checked disabled><label for="female" class="label">����</label></td>
										<%
											} 
										} else {
										%>
											<td><input type="radio" tabindex="176" id="male" name="p_sex" class="radio" title="����" value="1"><label for="male" class="label">����</label></td>
											<td style="width:20px;"></td>
											<td><input type="radio" tabindex="176" id="female" name="p_sex" class="radio" title="����" value="2"><label for="female" class="label">����</label></td>
										<% } %>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<th><img src="/images/2012/common/icon_check.gif" align="absmiddle" alt="�ʼ��Է»���">����ó</th>
								<td>
									<table class="layoutdefault" cellpadding="0" cellspacing="0">
										<tr>
											<td>
												<input name="p_memberyear"  type="hidden" class="inp_txt_01" id="p_memberyear"  value="<%=v_memberyear %>"  size="5" maxlength="4" readonly />
								 			 	<input name="p_membermonth" type="hidden" class="inp_txt_01" id="p_membermonth" value="<%=v_membermonth %>" size="5" maxlength="2" readonly />
								 			 	<input name="p_memberday"   type="hidden" class="inp_txt_01" id="p_memberday"   value="<%=v_memberday %>"   size="5" maxlength="2" readonly />
												<select class="select" tabindex="177" name="p_hometel1" id="txtfield4" onfocus="choicefield('4');">
													<option>������ȣ ����</option>
													<option value="070">070</option>
													<option value="02">02</option>
													<option value="031">031</option>
													<option value="032">032</option>
													<option value="033">033</option>
													<option value="041">041</option>
													<option value="042">042</option>
													<option value="043">043</option>
													<option value="051">051</option>
													<option value="052">052</option>
													<option value="053">053</option>
													<option value="054">054</option>
													<option value="055">055</option>
													<option value="061">061</option>
													<option value="062">062</option>
													<option value="063">063</option>
													<option value="064">064</option>
												</select>
											</td>
											<td>&nbsp;-&nbsp;<input type="text" tabindex="178" name="p_hometel2" id="txtfield5" onfocus="choicefield('5');" class="txt" style="width:36px;" maxlength="4"></td>
											<td>&nbsp;-&nbsp;<input type="text" tabindex="179" name="p_hometel3" id="txtfield6" onfocus="choicefield('6');" class="txt" style="width:36px;" maxlength="4"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<th><img src="/images/2012/common/icon_check.gif" align="absmiddle" alt="�ʼ��Է»���">�����</th>
								<td>
									<table class="layoutdefault" cellpadding="0" cellspacing="0">
										<tr>
											<td>
												<select class="select" tabindex="180" name="p_handphone1" id="txtfield7" onfocus="choicefield('7');">
													<option>�̵���ȣ ����</option>
													<option value="010">010</option>
			                    <option value="011">011</option>
			                    <option value="016">016</option>
			                    <option value="017">017</option>
			                    <option value="018">018</option>
			                    <option value="019">019</option>
												</select>
											</td>
											<td>&nbsp;-&nbsp;<input type="text" tabindex="181" name="p_handphone2" id="txtfield8" onfocus="choicefield('8');" class="txt" style="width:36px;" maxlength="4"></td>
											<td>&nbsp;-&nbsp;<input type="text" tabindex="182" name="p_handphone3" id="txtfield9" onfocus="choicefield('9');" class="txt" style="width:36px;" maxlength="4"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<th><img src="/images/2012/common/icon_check.gif" align="absmiddle" alt="�ʼ��Է»���">����</th>
								<td>
									<select class="select" tabindex="183" name="p_home_addr1" id="txtfield10" onfocus="choicefield('10');">
										<option>�������� ����</option>
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
									</select>
								</td>
							</tr>
							
							<tr>
								<th><img src="/images/2012/common/icon_check.gif" align="absmiddle" alt="�ʼ��Է»���">�̸���</th>
								<td>
									<table class="layoutdefault" cellpadding="0" cellspacing="0">
										<tr>
											<td><input type="text" tabindex="184" name="p_email1" id="p_email1" onfocus="choicefield('11');" class="txt" style="width:150px;"></td>
											<td>@<input type="text" tabindex="185" name="p_email2" id="p_email2" onfocus="choicefield('12');" class="txt" style="width:200px;"></td>
											<td>&nbsp;
												<select class="select" tabindex="186" name="p_email3" id="p_email3" onfocus="choicefield('13');" onchange="emailChange();">
													<option>�����Է�</option>
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
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<th><img src="/images/2012/common/icon_check.gif" align="absmiddle" alt="�ʼ��Է»���">����</th>
								<td>
									<select class="select" tabindex="187" name="p_jikup" id="txtfield14" onfocus="choicefield('14');">										
										<option value="">���� ����</option>
										<option value="01">����л� ����</option>
										<option value="02">���л� (���п�)</option>
										<option value="03">������ (����)</option>
										<option value="04">�������</option>
										<option value="05">��������</option>
										<option value="06">���������</option>
										<option value="07">ȸ���</option>
										<option value="08">�ֺ�</option>
										<option value="09">����</option>
										<option value="10">������</option>
										<option value="11">�Ƿ���</option>
										<option value="12">������</option>
										<option value="13">�����</option>
										<option value="14">������</option>
										<option value="15">������</option>
										<option value="16">ü����</option>
										<option value="17">����</option>
										<option value="18">����</option>
										<option value="19">�ڿ���</option>
										<option value="99">��Ÿ</option> 
									</select>
								</td>
							</tr>
							<tr>
								<th><img src="/images/2012/common/icon_check.gif" align="absmiddle" alt="�ʼ��Է»���">����о�</th>
								<td>
									<select class="select" tabindex="188" name="p_workfieldcd" id="txtfield15" onfocus="choicefield('15');">
										<option value="">�о� ����</option>
										<option value="01">����</option>
										<option value="02">��ȭ</option>
										<option value="03">�����</option>
										<option value="04">���</option>
										<option value="05">�ִϸ��̼�</option>
										<option value="06">�������θ�Ʈ</option>
										<option value="07">��ȭ</option>
										<option value="08">����</option>
										<option value="09">ĳ����</option>
										<option value="10">����</option>
										<option value="11">�μ�</option>
										<option value="12">����</option>
										<option value="13">������</option>
										<option value="14">����</option>
										<option value="15">����</option>
										<option value="16">�̼�ǰ</option>
										<option value="17">����ǰ</option>
										<option value="18">�м�</option>
										<option value="19">����</option>
										<option value="20">����Ʈ����</option>
										<option value="21">�ϵ����</option>
										<option value="22">�Ź�</option>
										<option value="99">��Ÿ</option> 
									</select>
								</td>
							</tr>
							<tr>
								<th><img src="/images/2012/common/icon_check.gif" align="absmiddle" alt="�ʼ��Է»���">���԰��</th>
								<td>
									<select class="select" tabindex="189" name="p_registerRoute" id="txtfield17" onfocus="choicefield('17');">
										<option value="">���԰�� ����</option>
										<option value="01">�˻�����</option>
										<option value="09">�ڶ�ȸ</option>
										<option value="04">���</option>
										<option value="02">�Ź����</option>
										<!-- <option value="06">�������� �����</option>-->
										<option value="03">�̸��� ����</option>
										<option value="07">������õ</option>
										<option value="05">�б�/�系����</option>
										<option value="08">��Ÿ</option>
										
									</select> 
								</td>
								</tr>
							<tr>
								<th>�������� ����</th>
								<td><input type="checkbox" tabindex="190" name="p_ismailing" id="mailsms" class="radio" title="SMS" value="Y" onclick="checkYN();" checked><label for="mailsms" class="label">���� �� �̺�Ʈ �ҽ��� E-Mail Ȥ�� SMS���� ���� �ϰڽ��ϴ�.</label></td>
							</tr>
						</table>
					</div>
					<br><br>
					<div class="rightinput">
						<table class="required" cellpadding="0" cellspacing="0">
							<tr>
								<td class="alignL"><img src="/images/2012/sub/page0/subject_join_input03.gif" alt="�ΰ������Է�"></td>
								<td class="alignR"></td>
							</tr>
						</table>
					</div>
					<div class="userdetailbox">
						<table class="userdetail" cellpadding="0" cellspacing="0">
							<colgroup><col width="120"><col width="*"></colgroup>
							<tr>
								<th>���Ե���</th>
								<td>
									<select class="select" tabindex="191" name="p_registerMotive" id="txtfield16" onfocus="choicefield('16');">
										<option value="">���Ե��� ����</option>
										<option value="01">���</option>
										<option value="02">�����</option>
										<option value="03">�ڱⰳ��</option>
										<option value="04">â��</option>
										<option value="05">������ �米��</option>
										<option value="06">��Ÿ</option>
									</select> 
								</td>
							</tr>
							<tr>
								<th>��õ�� ���̵�</th>
								<td><input type="text" tabindex="192" name="p_recommendid" id="txtfield18" onfocus="choicefield('18');" class="txt" style="width:160px;"></td>
							</tr>
						</table>
					</div>
					<table class="joinfooter" cellspacing="0" cellpadding="0">
						<colgroup><col width="50%"><col width="*"></colgroup>
						<tr>
							<td class="alignR"><a href="javascript:Submit_Check();" tabindex="193" title="�� ���Զ��� �˸°� �����ϼ̴ٸ� �� ��ư�� �����ּ���."><img src="/images/2012/sub/page0/btn_join_confirm.gif" alt="Ȯ��" title="�Է��� ��� �ߴٸ� Ŭ���Ͽ� ������ �Ϸ��ϼ���"></a></td>
							<td class="alignL"><a href="/servlet/controller.homepage.MainServlet" tabindex="194" title="����ϰ� ���� ���� ȭ������ ���ư��ϴ�."><img src="/images/2012/sub/page0/btn_join_cancel.gif" alt="���"></a></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</form>
<!-- form �� -->

<script type='text/javascript' src='/script/jquery.password_strength.js'></script>
<script language="JavaScript" type="text/JavaScript">
    $('form1').attr('autocomplete', 'off');
    //$('#p_pwd').password_strength();
</script>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>