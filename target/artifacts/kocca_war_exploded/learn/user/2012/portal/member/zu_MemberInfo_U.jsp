<%
//**********************************************************
//  1. ��      ��: ȸ������_ȸ������ ����
//  2. ���α׷��� :zu_MemberInfo_Ujsp
//  3. ��      ��: ȸ������_ȸ������ ����
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��
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
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    
    box.put("topmenu","1");
    box.put("submenu","4");
    
    String p_eventgubun = box.getString("p_eventgubun"); 

    DataBox dbox  = (DataBox)request.getAttribute("memberView");
    DataBox edbox = (DataBox)request.getAttribute("getEventCourse");  //�̺�Ʈ ���� ��������..

    String v_handphone 		= "";
    String v_resno1     	= "";
    String v_resno2     	= "";
	String v_userid	 		= "";
	String v_pwd	   		= "";
	String v_name   		= "";
	String v_eng_name  		= "";
	String v_sex     		= "";
	String v_post1   		= "";
	String v_post2	   		= "";
	String v_home_addr1		= "";
	String v_home_addr2		= "";
	String v_home_addr		= "";
	String v_email	   		= "";
	String v_hometel  		= "";
	String v_ismailing   	= "";
    String v_issms   	    = "";
    String v_workfieldcd	= "";
    String v_workfieldnm	= "";
    String v_memberyear   	= "";
    String v_membermonth	= "";
    String v_memberday	    = "";
    String v_jikup	        = "";
    String v_compnm  	    = "";
    String v_registerMotive = "";
    String v_registerRoute  = "";
    String v_eventCourse    = "";
    String v_eventseq		= "";
    String s_eventseq		= "";
    
    // ������� �÷��� �������� �ֹι�ȣ���� ��������� �����´�.
    String v_resno1_Year    = "";
    String v_resno1_Month   = "";
    String v_resno1_Day     = "";

    if (dbox != null ) {
        v_handphone 	 = dbox.get("d_handphone");
        v_resno1     	 = dbox.get("d_resno1");
        v_resno2     	 = dbox.get("d_resno2");
        v_userid	 	 = dbox.get("d_userid");
        v_pwd	   		 = dbox.get("d_pwd");
        v_name   		 = dbox.get("d_name");
        v_eng_name  	 = dbox.get("d_eng_name");
        v_sex       	 = dbox.get("d_sex");
        v_post1   		 = dbox.get("d_post1");
        v_post2	   		 = dbox.get("d_post2");
        v_home_addr1	 = dbox.get("d_addr");
        v_home_addr2	 = dbox.get("d_addr2");
        v_home_addr		 = dbox.get("d_addr").substring(0,2);
        v_email	   		 = dbox.get("d_email");
        v_hometel  		 = dbox.get("d_hometel");
        v_ismailing   	 = dbox.get("d_ismailing");
        v_issms   	     = dbox.get("d_ismailing");
        v_workfieldcd	 = dbox.get("d_workfieldcd");
        v_workfieldnm	 = dbox.get("d_workfieldnm");
        v_memberyear	 = dbox.get("d_memberyear");
        v_membermonth	 = dbox.get("d_membermonth");
        v_memberday	     = dbox.get("d_memberday");
        v_jikup	         = dbox.get("d_jikup");
        v_compnm	     = dbox.get("d_compnm");
        v_registerMotive = dbox.get("d_registerMotive");
        v_registerRoute	 = dbox.get("d_registerRoute");
        v_eventCourse	 = dbox.get("d_eventCourse");
        v_eventseq		 = dbox.get("d_eventseq");
        
        if(!v_resno1.equals("")){
        v_resno1_Year    = 19+v_resno1.substring(0, 2);
        v_resno1_Month   = v_resno1.substring(2, 4);
        v_resno1_Day     = v_resno1.substring(4, 6);
        }
        
    }
    
    //�̺�Ʈ ������ ��
    if(v_eventseq.equals("3")){
    	s_eventseq = "34";	
    }else if(v_eventseq.equals("")){
    	s_eventseq = "4";
    }

    
    //�̺�Ʈ ���� ��������..
    String v_subjnm = "";

    if (edbox != null ) {
        v_subjnm 	 = edbox.get("d_subjnm");
    }
    
	String[]handphone = new String[3];
	int index = 0;
	StringTokenizer st = new StringTokenizer(v_handphone, "-");
	while(st.hasMoreTokens()) {
		handphone[index++] = st.nextToken();
	}

	String[]hometel = new String[3];
	index = 0;
	st = new StringTokenizer(v_hometel, "-");
	while(st.hasMoreTokens()) {
		hometel[index++] = st.nextToken();
	}

	String[]email = new String[2];
	index = 0;
	st = new StringTokenizer(v_email, "@");
	while(st.hasMoreTokens()) {
		email[index++] = st.nextToken();
	}
	
	String[]home_addr = new String[2];
	index = 0;
	st = new StringTokenizer(v_home_addr, "@");
	while(st.hasMoreTokens()) {
		home_addr[index++] = st.nextToken();
	}
	
%>


<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<!-- ��ũ��Ʈ���� -->
<script language="JavaScript" type="text/JavaScript">
<!--//


function Submit_PWDCheck(){
    var fm=document.form1;

    var chk_num = "";  
    var chk_lower = "";
    var chk_upper = "";
    var chk_special = "";

    // ��й�ȣ ���� ����
   
    var p_pwd_len =  fm.p_pwd.value.length;
    var pass_old = fm.p_pwd_old.value;
    var p_pwd_len_old = pass_old.length;

    chk_num = fm.p_pwd.value.search(/[0-9]/g);
    chk_lower = fm.p_pwd.value.search(/[a-z]/ig);
    chk_upper = fm.p_pwd.value.search(/[A-Z]/ig);
    chk_special = fm.p_pwd.value.search(/[^a-zA-Z0-9]/g);

    if (p_pwd_len_old <= 0){
        alert("���� ��й�ȣ�� �Է����ּ���.");
        fm.p_pwd_old.focus();
        return;
    } else if (p_pwd_len <= 0){
        alert("�� ��й�ȣ�� �Է����ּ���.");
        fm.p_pwd.focus(); 
        return;
    }else{
        if (fm.p_pwd.value != "") {
            //if (!/^[a-zA-Z0-9]{9,14}$/.test(fm.p_pwd.value) || (chk_num < 0 || chk_lower< 0 || chk_upper < 0)){
            if ( p_pwd_len < 9 || p_pwd_len > 14 || chk_lower< 0 || chk_upper < 0 ||  (chk_num < 0 && chk_special< 0 ) ){
                alert("��й�ȣ�� ���� ��/�ҹ��ڿ� ���� �Ǵ� Ư�����ڸ� ȥ���Ͽ� 9-14�ڸ��� �Է��� �ּ���.");
                fm.p_pwd.value="";
                fm.p_pwd.focus();
                return;
            }

            if( fm.p_pwd.value == fm.p_userid.value){
                alert("���̵�� ������ ��й�ȣ�� ��� �Ͻ� �� �����ϴ�.");
                fm.p_pwd.value="";
                fm.p_pwd.focus();return;
            }
            
            if( (fm.p_pwd_re.value) == ""){
                alert("�� ��й�ȣȮ���� �Է��ϼ���");
                fm.p_pwd_re.focus();return;
             }

            if(fm.p_pwd.value != fm.p_pwd_re.value){
                alert("�� ��й�ȣ�� �ٸ��� �ԷµǾ����ϴ�.");
                fm.p_pwd.value;
                fm.p_pwd_re.value ="";
                fm.p_pwd_re.focus();
                return;
            }
        }
    }

    // ��й�ȣ ����
    document.form1.target="_self";
    document.form1.action= https_host() + "/servlet/controller.homepage.MainMemberJoinServlet";
    document.form1.p_process.value="ChangePwdOk";
    document.form1.submit();
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

    if (fm.p_email1.value =="" || fm.p_email2.value == ""){
        alert("Email �ּҸ� �ٸ��� �Է��ϼ���");
        fm.p_email1.focus();return;
    }

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

    if( fm.p_compnm.value == "" ){
		alert("�Ҽ��� �Է��ϼ���.");
		return;
    }
   
    // ����
    document.form1.target="_self";
    document.form1.action= https_host() + "/servlet/controller.homepage.MainMemberJoinServlet";
    document.form1.p_handphone.value = v_handphone;
    document.form1.p_hometel.value = v_hometel;
    document.form1.p_email.value = v_email;    
    document.form1.p_process.value="MemberInfoUpdateOk";
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
        document.getElementById('divWork').innerHTML = "<input name='p_workfieldnm' type='text' class='inp_txt_01' id='p_workfieldnm' size='30' maxlength='15' value='<%= v_workfieldnm %>'>";
       // document.form1.p_workfieldnm.value="";
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
<form name="form1"  action="/" method="post" action="">
	<input type="hidden"	name="p_process"	value="" />
	<input type="hidden"	name="p_handphone" />
  <input type="hidden"	name="p_hometel" />
  <input type="hidden"	name="p_email" />
	<input type="hidden"	name="p_postgubun" value=""/>
	<input type="hidden"	name="p_chk" />
	<input type="hidden"	name="p_eventCourse" value="<%=v_eventCourse %>"/ >
	<!-- input type="hidden"	name="p_gameCourse" value=""/>
	<input type="hidden"	name="p_cultureCourse" value=""/>
	<input type="hidden"	name="p_airCourse" value=""/ -->
  <input type="hidden"	name="p_kor_name" value="<%=v_name%>" />
  <input type="hidden"	name="p_userid"	value="<%= v_userid %>" />
  <input type="hidden"	name="p_eventseq"	value="<%= s_eventseq %>" />
	<input type="hidden"	name="p_eventgubun"   value="<%=p_eventgubun%>"/>
	<div class="content">
		<table class="rootinfo" cellpadding="0" cellspacing="0" summary="���� ������ �������� ��ġ�Դϴ�">
			<tr>
				<td class="pagetitle"><img src="/images/2012/sub/page0/title/member_modify.gif" alt="ȸ����������"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > <u>ȸ����������</u></td>
			</tr>
		</table>
		<div class="membermodify">
			<table class="persnaltip" cellpadding="0" cellspacing="0">
				<tr>
					<td>ȸ�������� �������� ��޹�ħ�� ���� �����ϰ� ��ȣ�Ǹ�, ȸ������ ����� ���� ���� ���� �Ǵ� �� 3�ڿ��� �������� �ʽ��ϴ�. <a href="javascript:menuForward('90','06');" tabindex="170" title="��������ó����ħ���� �̵��մϴ�.">��������ó����ħ</a></td>
					<td class="checks"><img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է»���"> �ʼ��Է»���</td>
				</tr>
			</table>
			<ul class="layout">
				<li class="leftspace">
					<table class="password" cellpadding="0" cellspacing="0">
						<colgroup><col width="160"><col width="*"></colgroup>
						<tr>
							<th><img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է»���">���� ��й�ȣ Ȯ��</th>
							<td><input type="password" name="p_pwd_old" id="txtfield1" onfocus="choicefield('1');" class="password" tabindex="171" title="���� ����Ͻô� ��й�ȣ�� �Է����ּ���."></td>
						</tr>
						<tr>
							<th><img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է»���">�� ��й�ȣ</th>
							<td>
								<input type="password" name="p_pwd" id="txtfield2" onfocus="choicefield('2');" class="password" tabindex="172" title="���� ������ ��й�ȣ�� �Է����ּ���.">
							</td>
						</tr>
						<tr>
							<th><img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է»���">�� ��й�ȣ Ȯ��</th>
							<td><input type="password" name="p_pwd_re" id="txtfield3" onfocus="choicefield('3');" class="password" tabindex="173" title="���� ������ ��й�ȣ�� �ٽ� �ѹ� �Է����ּ���."></td>
						</tr>
					</table>
					<p class="passwordtip">
						* ���� ��/�ҹ��ڿ� ���� �Ǵ� Ư�����ڸ� ȥ���Ͽ� 9-14�ڸ��� �Է��� �ּ���.<br>
						* ���ӵ� ����, ���Ϲ�ȣ, �ֹε�Ϲ�ȣ �� �˱� ���� ���ڴ� �����ּ���.
					</p>
					<div class="footer"><a href="javascript:Submit_PWDCheck();" tabindex="174" title="������ ��й�ȣ�� ���� �Է��� ���ο� ��й�ȣ�� �����մϴ�"><image src="/images/2012/sub/page0/btn_password_confirm.gif" alt="�����ȣ�� �����մϴ�"></a></div>
				</li>
				<li class="rightspace">
					<table class="about" cellpadding="0" cellspacing="0">
						<colgroup><col width="120"><col width="*"></colgroup>
						<tr>
							<th>����(�ѱ�)</th>
							<td><%=v_name %></td>
						</tr>
						<tr>
							<th><img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է»���">���̵�</th>
							<td><%=v_userid %></td>
						</tr>
						<tr>
							<th><img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է»���">����</th>
							<td>
								<table class="layoutdefault" cellpadding="0" cellspacing="0">
									<tr>
										<td><input type="radio" class="radio" id="male" name="p_sex" value="1"  <%= v_sex.equals("1") ? "checked" : "" %> tabindex="181" title="����Ű ��.�츦 �̿��Ͽ� ������ �������ּ���(���� ����)"><label for="male" class="label">����</label></td>
										<td style="width:20px;"></td>
										<td><input type="radio" class="radio" id="female" name="p_sex" value="2"  <%= v_sex.equals("2") ? "checked" : "" %> tabindex="181" title="����Ű ��.�츦 �̿��Ͽ� ������ �������ּ���(���� ����)"><label for="female" class="label">����</label></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<th><img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է»���">�������</th>
							<td>
								<table class="layoutdefault" cellpadding="0" cellspacing="0">
									<tr>
										<td><input type="text" name="p_memberyear" id="txtfield4" onfocus="choicefield('4');" value="<%=v_memberyear %>" class="txt" style="width:36px;" maxlength="4" tabindex="182" title="�¾�� �⵵�� �Է����ּ���">��</td>
										<td><input type="text" name="p_membermonth" id="txtfield5" onfocus="choicefield('5');" value="<%=v_membermonth %>" class="txt" style="width:20px;" maxlength="2" tabindex="183" title="��������� ���� �Է����ּ���">��</td>
										<td><input type="text" name="p_memberday" id="txtfield6" onfocus="choicefield('6');" value="<%=v_memberday %>" class="txt" style="width:20px;" maxlength="2" tabindex="184" title="��������� ���ڸ� �Է����ּ���">��</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<th><img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է»���">��ȭ��ȣ</th>
							<td>
								<table class="layoutdefault" cellpadding="0" cellspacing="0">
									<tr>
										<td>
											<select class="select" name="p_hometel1" value="<%= hometel[0]%> id="txtfield7" onfocus="choicefield('7');" tabindex="185" title="������ȣ�� �������ּ���">
												<option value="02" <%= hometel[0].equals("02") ? "selected" : "" %>>02</option>
							                    <option value="031" <%= hometel[0].equals("031") ? "selected" : "" %>>031</option>
							                    <option value="032" <%= hometel[0].equals("032") ? "selected" : "" %>>032</option>
							                    <option value="033" <%= hometel[0].equals("033") ? "selected" : "" %>>033</option>
							                    <option value="041" <%= hometel[0].equals("041") ? "selected" : "" %>>041</option>
							                    <option value="042" <%= hometel[0].equals("042") ? "selected" : "" %>>042</option>
							                    <option value="043" <%= hometel[0].equals("043") ? "selected" : "" %>>043</option>
							                    <option value="044" <%= hometel[0].equals("044") ? "selected" : "" %>>044</option>
							                    <option value="051" <%= hometel[0].equals("051") ? "selected" : "" %>>051</option>
							                    <option value="052" <%= hometel[0].equals("052") ? "selected" : "" %>>052</option>
							                    <option value="053" <%= hometel[0].equals("053") ? "selected" : "" %>>053</option>
							                    <option value="054" <%= hometel[0].equals("054") ? "selected" : "" %>>054</option>
							                    <option value="055" <%= hometel[0].equals("055") ? "selected" : "" %>>055</option>                    
							                    <option value="061" <%= hometel[0].equals("061") ? "selected" : "" %>>061</option>
							                    <option value="062" <%= hometel[0].equals("062") ? "selected" : "" %>>062</option>
							                    <option value="063" <%= hometel[0].equals("063") ? "selected" : "" %>>063</option>
							                    <option value="064" <%= hometel[0].equals("064") ? "selected" : "" %>>064</option>
							                    <option value="070" <%= hometel[0].equals("070") ? "selected" : "" %>>070</option>     
											</select>
										</td>
										<td>&nbsp;-&nbsp;<input type="text" name="p_hometel2" value="<%= hometel[1]%>" id="txtfield8" onfocus="choicefield('8');" class="txt" style="width:36px;" maxlength="4" tabindex="186" title="������ȣ �� 3~4�ڸ��� �Է����ּ���"></td>
										<td>&nbsp;-&nbsp;<input type="text" name="p_hometel3" value="<%= hometel[2]%>" id="txtfield9" onfocus="choicefield('9');" class="txt" style="width:36px;" maxlength="4" tabindex="187" title="������ȣ �� 4�ڸ��� �Է����ּ���"></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<th><img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է»���">����Ϲ�ȣ</th>
							<td>
								<table class="layoutdefault" cellpadding="0" cellspacing="0">
									<tr>
										<td>
											<select class="select" name="p_handphone1" id="txtfield10" onfocus="choicefield('10');" tabindex="188" title="�̵���Ź�ȣ�� �Է����ּ���">
												<option value="010" <%= handphone[0].equals("010") ? "selected" : "" %>>010</option>
		                    <option value="011" <%= handphone[0].equals("011") ? "selected" : "" %>>011</option>
		                    <option value="016" <%= handphone[0].equals("016") ? "selected" : "" %>>016</option>
		                    <option value="017" <%= handphone[0].equals("017") ? "selected" : "" %>>017</option>
		                    <option value="018" <%= handphone[0].equals("018") ? "selected" : "" %>>018</option>
		                    <option value="019" <%= handphone[0].equals("019") ? "selected" : "" %>>019</option>
											</select>
										</td>
										<td>&nbsp;-&nbsp;<input type="text" name="p_handphone2" value="<%= handphone[1]%>" id="txtfield11" onfocus="choicefield('11');" class="txt" style="width:36px;" maxlength="4" tabindex="189" title="����� ��3~4�ڸ��� �Է����ּ���"></td>
										<td>&nbsp;-&nbsp;<input type="text" name="p_handphone3" value="<%= handphone[2]%>" id="txtfield12" onfocus="choicefield('12');" class="txt" style="width:36px;" maxlength="4" tabindex="190" title="����� ��4�ڸ��� �Է����ּ���"></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<th><img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է»���">�ּ�(��������)</th>
							<td>
								<select class="select" name="p_home_addr1" id="txtfield13" onfocus="choicefield('13');" tabindex="191" title="���������� �������ּ���">
								  <option value="����" <%= home_addr[0].equals("����") ? "selected" : "" %>>����</option>
                  <option value="���" <%= home_addr[0].equals("���") ? "selected" : "" %>>���</option>
                  <option value="�泲" <%= home_addr[0].equals("�泲") ? "selected" : "" %>>�泲</option>
                  <option value="���" <%= home_addr[0].equals("���") ? "selected" : "" %>>���</option>
								  <option value="����" <%= home_addr[0].equals("����") ? "selected" : "" %>>����</option>
								  <option value="�뱸" <%= home_addr[0].equals("�뱸") ? "selected" : "" %>>�뱸</option>
								  <option value="����" <%= home_addr[0].equals("����") ? "selected" : "" %>>����</option>
								  <option value="�λ�" <%= home_addr[0].equals("�λ�") ? "selected" : "" %>>�λ�</option>
								  <option value="����" <%= home_addr[0].equals("����") ? "selected" : "" %>>����</option>
								  <option value="���" <%= home_addr[0].equals("���") ? "selected" : "" %>>���</option>
								  <option value="��õ" <%= home_addr[0].equals("��õ") ? "selected" : "" %>>��õ</option>
								  <option value="����" <%= home_addr[0].equals("����") ? "selected" : "" %>>����</option>
								  <option value="����" <%= home_addr[0].equals("����") ? "selected" : "" %>>����</option>
								  <option value="����" <%= home_addr[0].equals("����") ? "selected" : "" %>>����</option>
								  <option value="�泲" <%= home_addr[0].equals("�泲") ? "selected" : "" %>>�泲</option>
								  <option value="���" <%= home_addr[0].equals("���") ? "selected" : "" %>>���</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է»���">�̸���</th>
							<td>
								<table class="layoutdefault" cellpadding="0" cellspacing="0">
									<tr>
										<td><input type="text" name="p_email1"  value="<%= email[0]%>" id="txtfield14" onfocus="choicefield('14');" class="txt" style="width:90px;" tabindex="192" title="���� ���̵� �Է����ּ���"></td>
										<td>@<input type="text" name="p_email2" value="<%= email[1]%>" id="txtfield15" onfocus="choicefield('15');" class="txt" style="width:90px;" tabindex="193" title="���� ������ �Է����ּ���"></td>
										<td>
											<select class="select" name="p_email3" onchange="emailChange();" id="txtfield16" onfocus="choicefield('16');" tabindex="194" title="���ϼ����� �������ּ���">
											   <option value="" >�����Է�</option>
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
							<th><img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է»���">����</th>
							<td>
								<select class="select" name="p_jikup" id="txtfield17" onfocus="choicefield('17');" tabindex="195" title="������ �������ּ���">
									<option value="01" <%=v_jikup.equals("01") ? "selected" : ""%> >����л� ����</option>
									<option value="02" <%=v_jikup.equals("02") ? "selected" : ""%>>���л� (���п�)</option>
									<option value="03" <%=v_jikup.equals("03") ? "selected" : ""%>>������ (����)</option>
									<option value="04" <%=v_jikup.equals("04") ? "selected" : ""%>>�������</option>
									<option value="05" <%=v_jikup.equals("05") ? "selected" : ""%>>��������</option>
									<option value="06" <%=v_jikup.equals("06") ? "selected" : ""%>>���������</option>
									<option value="07" <%=v_jikup.equals("07") ? "selected" : ""%>>ȸ���</option>
									<option value="08" <%=v_jikup.equals("08") ? "selected" : ""%>>�ֺ�</option>
									<option value="09" <%=v_jikup.equals("09") ? "selected" : ""%>>����</option>
									<option value="10" <%=v_jikup.equals("10") ? "selected" : ""%>>������</option>
									<option value="11" <%=v_jikup.equals("11") ? "selected" : ""%>>�Ƿ���</option>
									<option value="12" <%=v_jikup.equals("12") ? "selected" : ""%>>������</option>
									<option value="13" <%=v_jikup.equals("13") ? "selected" : ""%>>�����</option>
									<option value="14" <%=v_jikup.equals("14") ? "selected" : ""%>>������</option>
									<option value="15" <%=v_jikup.equals("15") ? "selected" : ""%>>������</option>
									<option value="16" <%=v_jikup.equals("16") ? "selected" : ""%>>ü����</option>
									<option value="17" <%=v_jikup.equals("17") ? "selected" : ""%>>����</option>
									<option value="18" <%=v_jikup.equals("18") ? "selected" : ""%>>����</option>
									<option value="19" <%=v_jikup.equals("19") ? "selected" : ""%>>�ڿ���</option>
									<option value="99" <%=v_jikup.equals("99") ? "selected" : ""%>>��Ÿ</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է»���">����о�</th>
							<td>
								<select class="select" name="p_workfieldcd"  id="txtfield18" onfocus="choicefield('18');" tabindex="196" title="����о߸� �������ּ���">
									 <option value=01 <%=v_workfieldcd.equals("01") ? "selected" : ""%>>����</option> 
									 <option value=02 <%=v_workfieldcd.equals("02") ? "selected" : ""%>>��ȭ</option> 
									 <option value=03 <%=v_workfieldcd.equals("03") ? "selected" : ""%>>�����</option> 
									 <option value=04 <%=v_workfieldcd.equals("04") ? "selected" : ""%>>���</option> 
									 <option value=05 <%=v_workfieldcd.equals("05") ? "selected" : ""%>>�ִϸ��̼�</option> 
									 <option value=06 <%=v_workfieldcd.equals("06") ? "selected" : ""%>>�������θ�Ʈ</option> 
									 <option value=07 <%=v_workfieldcd.equals("07") ? "selected" : ""%>>��ȭ</option> 
									 <option value=08 <%=v_workfieldcd.equals("08") ? "selected" : ""%>>����</option> 
									 <option value=09 <%=v_workfieldcd.equals("09") ? "selected" : ""%>>ĳ����</option> 
									 <option value=10 <%=v_workfieldcd.equals("10") ? "selected" : ""%>>����</option> 
									 <option value=11 <%=v_workfieldcd.equals("11") ? "selected" : ""%>>�μ�</option> 
									 <option value=12 <%=v_workfieldcd.equals("12") ? "selected" : ""%>>����</option> 
									 <option value=13 <%=v_workfieldcd.equals("13") ? "selected" : ""%>>������</option> 
									 <option value=14 <%=v_workfieldcd.equals("14") ? "selected" : ""%>>����</option> 
									 <option value=15 <%=v_workfieldcd.equals("15") ? "selected" : ""%>>����</option> 
									 <option value=16 <%=v_workfieldcd.equals("16") ? "selected" : ""%>>�̼�ǰ</option> 
									 <option value=17 <%=v_workfieldcd.equals("17") ? "selected" : ""%>>����ǰ</option> 
									 <option value=18 <%=v_workfieldcd.equals("18") ? "selected" : ""%>>�м�</option> 
									 <option value=19 <%=v_workfieldcd.equals("19") ? "selected" : ""%>>����</option> 
									 <option value=20 <%=v_workfieldcd.equals("20") ? "selected" : ""%>>SW</option> 
									 <option value=21 <%=v_workfieldcd.equals("21") ? "selected" : ""%>>HW</option> 
									 <option value=22 <%=v_workfieldcd.equals("22") ? "selected" : ""%>>�Ź�</option> 
									 <option value=99 <%=v_workfieldcd.equals("99") ? "selected" : ""%>>��Ÿ</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է»���">�Ҽ�</th>
							<td><input type="text" name="p_compnm"  value="<%=v_compnm %>" id="txtfield19" onfocus="choicefield('19');" class="txt" style="width:160px;" tabindex="197" title="�Ҽ��� �Է����ּ���"></td>
						</tr>
						<tr>
							<th>�������� ����</th>
							<td><input type="checkbox" name="p_ismailing" onclick="checkYN();" value="<%= v_ismailing %>" <% if(v_ismailing.equals("Y")) out.println("checked='checked'");%>  class="checkbox" id="mailsms" tabindex="198" title="���� �� �̺�Ʈ �ҽ��� E-mail Ȥ�� SMS�� ���ſ� �����Ͻ� �ٸ� üũ���ּ���"><label for="mailsms" class="label">���� �� �̺�Ʈ �ҽ��� E-Mail Ȥ�� SMS����<br>&nbsp;&nbsp;&nbsp; ���� �ϰڽ��ϴ�. </label></td>
						</tr>
					</table>
					<table class="footer" cellspacing="0" cellpadding="0">
						<tr>
							<td class="alignR"><a href="javascript:Submit_Check();" tabindex="199" title="���� �Է��� �������� ȸ�������� �����մϴ�"><img src="/images/2012/sub/page0/btn_modify_confirm.gif" alt="ȸ�������� �����մϴ�"></a></td>
							<td class="alignL"><a href="javascript:history.go(-1);" tabindex="200" title="ȸ������ ������ ����մϴ�" tabindex="75"><img src="/images/2012/sub/page0/btn_modify_cancel.gif" alt="ȸ������ ������ ����մϴ�"></a></td>
						</tr>
					</table> 
				</li>
			</ul>
			<div class="clearL"></div>
		</div>
	</div>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
