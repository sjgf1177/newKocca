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


<%@ include file="/learn/user/portal/include/top.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->



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
		document.form1.p_post1.value = post1;
		document.form1.p_post2.value = post2;
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

    /*
    if( (fm.p_kor_name.value) == ""){
        alert("�̸��� �Է��ϼ���");
        fm.p_kor_name.focus();return;
    }

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

    // ��й�ȣ ���� ����
    var p_pwd_len =  fm.p_pwd.value.length;
    var pass_old = fm.p_pwd_old.value;
    var p_pwd_len_old = pass_old.length;

    chk_num = fm.p_pwd.value.search(/[0-9]/g);
    chk_lower = fm.p_pwd.value.search(/[a-z]/ig);
    chk_upper = fm.p_pwd.value.search(/[A-Z]/ig);
    chk_special = fm.p_pwd.value.search(/[^a-zA-Z0-9]/g);

    if ((p_pwd_len <= 0) && (p_pwd_len_old <= 0)){
        alert("��й�ȣ�� �Է����ּ���.");
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
                alert("��й�ȣȮ���� �Է��ϼ���");
                fm.p_pwd_re.focus();return;
             }

            if(fm.p_pwd.value != fm.p_pwd_re.value){
                alert("��й�ȣ�� �ٸ��� �ԷµǾ����ϴ�.");
                fm.p_pwd.value;
                fm.p_pwd_re.value ="";
                fm.p_pwd_re.focus();
                return;
            }
        }
    }
    */
    
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
    /*var v_post = fm.p_post1.value + fm.p_post2.value;

    if( v_post == "" ){
        alert("�����ȣ�� �Է��ϼ���");
        fm.p_post1.focus();	return;
    }

    if( (fm.p_home_addr1.value) == "" ){
        alert("�ּҸ� �Է��ϼ���");
        fm.p_home_addr1.focus();	return;
    }else if( (fm.p_home_addr2.value) == "" ){
        alert("�ּҸ� �Է��ϼ���");
        fm.p_home_addr2.focus();	return;
    }*/
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

    if( fm.p_compnm.value == "" ){
		alert("�Ҽ��� �Է��ϼ���.");
		return;
    }
    /*

    if( fm.p_registerMotive.value == "" ){
		alert("���Ե��⸦ �����Ͻʽÿ�.");
		return;
    }

    if( fm.p_registerRoute.value == "" ){
		alert("���԰�θ� �����Ͻʽÿ�.");
		return;
    }*/

// �̺�Ʈ  ���� ���ð�

    //if( fm.p_eventCourse.value == "" ){
	//    if( !fm.p_gameCourse.value == "" ) document.form1.p_eventCourse.value    = fm.p_gameCourse.value;
	//    if( !fm.p_cultureCourse.value == "" ) document.form1.p_eventCourse.value = fm.p_cultureCourse.value;
	//    if( !fm.p_airCourse.value == "" ) document.form1.p_eventCourse.value     = fm.p_airCourse.value;
    //}

    // ����
    document.form1.target="_self";
    document.form1.action= https_host() + "/servlet/controller.homepage.MainMemberJoinServlet";
    document.form1.p_handphone.value = v_handphone;
    document.form1.p_hometel.value = v_hometel;
    document.form1.p_email.value = v_email;    
    document.form1.p_process.value="MemberInfoUpdateOk";
    document.form1.submit();
}

function CourseChange(gubun){
	var fm=document.form1;
	var v_gubun = gubun;

	if ( v_gubun == "CG" ) {
	    if( !fm.p_gameCourse.value == ""){
	        if( !fm.p_cultureCourse.value == ""){
				alert("�ϳ��� ������ ���� �����մϴ�.");
				fm.p_gameCourse.value = ""
				return;            
	        }
	        if( !fm.p_airCourse.value == ""){
				alert("�ϳ��� ������ ���� �����մϴ�.");  
				fm.p_gameCourse.value = ""       
				return;   
	        }
	    }
	} else if ( v_gubun == "CK" ){
	    if( !fm.p_cultureCourse.value == ""){
	        if( !fm.p_gameCourse.value == ""){
				alert("�ϳ��� ������ ���� �����մϴ�.");  
				fm.p_cultureCourse.value = ""
				return;           
	        }
	        if( !fm.p_airCourse.value == ""){
				alert("�ϳ��� ������ ���� �����մϴ�.");     
				fm.p_cultureCourse.value = ""       
				return; 
		    }
	    }
	} else {
	    if( !fm.p_airCourse.value == ""){
	        if( !fm.p_cultureCourse.value == ""){
				alert("�ϳ��� ������ ���� �����մϴ�."); 
				fm.p_airCourse.value = ""
				return;            
	        }
	        if( !fm.p_gameCourse.value == ""){
				alert("�ϳ��� ������ ���� �����մϴ�.");  
				fm.p_airCourse.value = ""
				return;           
	        }
	    }
	}    
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

//�ӽ� ���� ���� ���
function testExcel(){
//     document.form1.target = "_self";
     document.form1.action='/servlet/controller.homepage.MainMemberJoinServlet';
     document.form1.p_process.value = 'temporarilyExcel';
     document.form1.submit();
}

//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- form ���� -->
<form name="form1"  action="" method="post">
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
    <input type="hidden"	name="p_pwd_old"	value="<%= v_pwd %>" />
    <input type="hidden"	name="p_eventseq"	value="<%= s_eventseq %>" />
     <input type="hidden"	name="p_eventgubun"   value="<%=p_eventgubun%>"/>
    
    
    
              <%if( box.getSession("tem_grcode").equals("N000001")) { %>
      
      <table>   
	      <tr>
	      	
	      	<td width="672" valign="top"><!--Ÿ��Ʋ�κ�-->
      <table width="672" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" colspan="2" class="h_road">&nbsp;</td>
        </tr>
        <tr>
          <td><img src="/images/portal/homepage_renewal/member/stitle_03.gif" alt="ȸ������" /></td>
          <td class="h_road">Home &gt; �̿�ȳ�  &gt; <strong>������������</strong></td>
        </tr>
        <tr>
          <td height="12" colspan="2"></td>
        </tr>
        <tr>
          <td height="1" colspan="2" bgcolor="E5E5E5"></td>
        </tr>
      </table>
      <!--Ÿ��Ʋ�κ�//-->
      <table width="672" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="15"></td>
        </tr>
        <tr>
          <td>
          </td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td id="s_stit"><img src="/images/portal/homepage_renewal/member/s_stitle_04.gif" alt="ȸ������" /></td>
        </tr>
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" id="join_form">
            <tr>
              <td class="tit_table01">����(�ѱ�)</td>
              <td class="tit_table02"><strong><%=v_name %></strong></td>
            </tr>
            <tr>
              <th>���̵� *</th>
              <td class="table_right"><strong><%=v_userid %></strong></td>
            </tr>
            <tr>
              <th>���� *</th>
              <td class="table_right"><input type="radio" name="p_sex" id="radio" class="checkbox" value="1" <%= v_sex.equals("1") ? "checked" : "" %> />
                ����
                <input type="radio" name="p_sex" id="radio2" class="checkbox" value="2"  <%= v_sex.equals("2") ? "checked" : "" %> />
                ���� </td>
            </tr>
            <tr>
              <th>������� *</th>
              <td class="table_right"><input type="text" name="p_memberyear"  value="<%=v_memberyear %>" id="textfield5" style="width:50px; height:20px;" />
                ��
                <input type="text" name="p_membermonth" id="p_membermonth" value="<%=v_membermonth %>" style="width:50px; height:20px;" />
                ��
  <input type="text" name="p_memberday" id="p_memberday"  value="<%=v_memberday %>"style="width:50px; height:20px;" />
                ��</td>
            </tr>
            <!-- <tr>
              <th>��й�ȣ *</th>
              <td height="65" class="table_right"><input type="text" name="textfield8" id="textfield8" style="width:130px; height:20px;" />
                  <p style="padding-top:3px">* ���� ��/�ҹ��ڿ� ���� �Ǵ� Ư�����ڸ� ȥ���Ͽ� 9-14�ڸ��� �Է��� �ּ���.<br />
                    *   ���ӵ� ����, ���Ϲ�ȣ, �ֹε�Ϲ�ȣ �� �˱� ���� ���ڴ� �����ּ���.</p></td>
            </tr>
            <tr>
              <th>��й�ȣ Ȯ�� *</th>
              <td class="table_right"><input type="text" name="textfield9" id="textfield9" style="width:130px; height:20px;" /></td>
            </tr> -->
            <tr>
              <th>��ȭ��ȣ *</th>
              <td class="table_right">
              <select name="p_hometel1" id="p_hometel1" value="<%= hometel[0]%>">
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
                -
  <input name="p_hometel2" type="text" class="inp_txt_01" id="p_hometel2" size="10" maxlength="4" value="<%= hometel[1]%>" style="width:70px; height:20px;" />
                -
  <input name="p_hometel3" type="text" class="inp_txt_01" id="p_hometel3" size="10" maxlength="4" value="<%= hometel[2]%>" style="width:70px; height:20px;" /></td>
            </tr>
            <tr>
              <th>�޴��� *</th>
              <td class="table_right">
              <select name="p_handphone1" id="p_handphone1">
                    <option value="010" <%= handphone[0].equals("010") ? "selected" : "" %>>010</option>
                    <option value="011" <%= handphone[0].equals("011") ? "selected" : "" %>>011</option>
                    <option value="016" <%= handphone[0].equals("016") ? "selected" : "" %>>016</option>
                    <option value="017" <%= handphone[0].equals("017") ? "selected" : "" %>>017</option>
                    <option value="018" <%= handphone[0].equals("018") ? "selected" : "" %>>018</option>
                    <option value="019" <%= handphone[0].equals("019") ? "selected" : "" %>>019</option>
                </select>
                -
  <input name="p_handphone2" type="text" class="inp_txt_01" id="p_handphone2" size="10" maxlength="4" value="<%= handphone[1]%>" style="width:70px; height:20px;" />
                -
  <input name="p_handphone3" type="text" class="inp_txt_01" id="p_handphone3" size="10" maxlength="4" value="<%= handphone[2]%>" style="width:70px; height:20px;" /></td>
            </tr>
            <tr>
              <th>�ּ�(��������) *</th>
              <td class="table_right">
              	<select name="p_home_addr1" id="p_home_addr1" style="height:20px">
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
              <th>�̸��� *</th>
              <td height="65" class="table_right">
              <input name="p_email1" type="text" class="inp_txt_01" id="p_email1" size="20" maxlength="20" value="<%= email[0]%>" style="width:130px; height:20px;" />
                @
                <input name="p_email2" type="text" class="inp_txt_01" id="p_email2" size="20"  maxlength="20" value="<%= email[1]%>" style="width:130px; height:20px;" />    
    			  <select name="p_email3" id="p_email3" onchange="emailChange();" style="height:20px">
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
              	<%=CodeConfigBean.getCodeGubunSelect ("0104","", 1,"p_jikup", v_jikup,"",3) %>
              </td>
            </tr>
            <tr>
              <th>����о� *</th>
              <td class="table_right">
              	<%=CodeConfigBean.getCodeGubunSelect ("0103","", 1,"p_workfieldcd",  v_workfieldcd, "onChange='javascript:workfieldChange()'",3) %>
                <div id="divWork"></div>
              </td>
            </tr>
             <tr>
              <th>�Ҽ� *</th>
              <td class="table_right"><span style="padding-top:2px;">
                <input type="text" name="p_compnm"  value="<%=v_compnm %>" style="width:250px; height:20px;" />                
              </span></td>
            </tr>
			<tr>
              <th>�������� ����</th>
              <td class="table_right">
                <input type="checkbox" name="p_ismailing" id="p_ismailing" onclick="checkYN();" value="<%= v_ismailing %>" <% if(v_ismailing.equals("Y")) out.println("checked='checked'"); %> />
                                 ���� �� �̺�Ʈ �ҽ��� E-Mail Ȥ�� SMS���� ���� �ϰڽ��ϴ�.              </td>
            </tr>
            

          </table></td>
        </tr>
        <tr>
          <td height="30">&nbsp;</td>
        </tr>
        <!--<tr>
          <td id="s_stit"><img src="/images/portal/homepage_renewal/member/s_stitle_08.gif" alt="�ΰ�����" /></td>
        </tr>
        <tr>
          <td id="s_stit">�̺�Ʈ �Ⱓ���� ���������� �����Ͻô� ȸ���е鿡 ���Ͽ� ���� ����� �����ǰ� �ִ� ������ ����� �����Ͻ� �� �ִ�<br />
          ��ȸ�� �帳�ϴ�. �ϴ��� �޴��� ���Ͽ� 1�� ������ �������ּ���.</td>
        </tr>
        <tr>
          <td>
          <%  if( v_eventCourse == "" ){ %>  
          <table width="100%" border="0" cellspacing="0" cellpadding="0" id="join_form">
              <tr>
                <td class="tit_table01">����
                </td>
                <td class="tit_table02">
                  <select name="p_gameCourse" id="p_gameCourse" onchange="CourseChange('CG');" style="height:20px">
                	<option value="">===����===</option>             	
                	<option value="CG10005">���� ��ȹ �� �׷��� �ǹ��ڸ� ���� ���ӱ�� ����</option>             	
                	<option value="CG10006">UDK Ȱ�� ���(��ũ��Ʈ)</option>             	
                	<option value="CG10007">UDK Ȱ�� ���(��)</option>             	
                	<option value="CG10008">������ �� �����е�� ���� ����(����)</option>             	
                	<option value="CG10009">������ �� �����е�� ���� ����(�ǹ�)</option>             	
                	<option value="CG10010">�ȵ���̵� ���� ����(����)</option>             	
                	<option value="CG10011">�ȵ���̵� ���� ����(�ǹ�)</option>             	
				</select>
                </td>
              </tr>
              <tr>
                <th>��ȭ������</th>
                <td class="table_right">
                <select name="p_cultureCourse" id="p_cultureCourse" onchange="CourseChange('CK');" style="height:20px">
                	<option value="">===����===</option>             	
                	<option value="CG10012">��ȭ�����������</option>             	
                	<option value="CK10071">11���� ��Ģ���� ������ ���丮�ڸ�</option>             	
                	<option value="CK10072">������ȹ�� ��ȭ������</option>             	
                	<option value="CK10073">����������������ȹ�� �ؿ�����</option>             	
                	<option value="CK10074">�оߺ��� ���� ������ ������</option>             	
                	<option value="CK10075">�����濵�� �ǹ�</option>             	
                	<option value="CK10076">��ʷ� �˾ƺ��� �Ҽȳ�Ʈ��ũ</option>             	
                	<option value="CK10077">�۷��ù�ȭ�������� ���ؿ� ���</option>             	
                	<option value="CK10078">���߹�ȭ�������� �����Ǹ�</option>             	
                	<option value="CK10079">���߹�ȭ�����ΰ� �α�</option>             	
                	<option value="CK10080">������ȹ�� ȫ�������� �ǹ�</option>             	
                	<option value="CK10081">����Ʈ���� ��ȭ</option>             	
                	<option value="CK10082">���� ���� ���ñ�ȹ</option>             	
				</select>
                </td>
              </tr>
              <tr>
                <th>���</th>
                <td class="table_right">
                <select name="p_airCourse" id="p_airCourse" onchange="CourseChange('CB');"  style="height:20px">
                	<option value="">===����===</option>             	
                	<option value="CB10015">After Effect CS5</option>             	
                	<option value="CB10016">Avid Media Composer Advanced</option>             	
                	<option value="CB10017">Adobe Premiere Pro CS5</option>             	
                	<option value="CB10019">Final cut Pro�� Motion ���� �ǹ�</option>             	
                	<option value="CB10020">������ ���� �� ����</option>             	
                	<option value="CB10021">Autodesk Maya�� �̿��� ��ü���� ����</option>             	
                	<option value="CB10023">3D ��ü����</option>             	
                	<option value="CB10024">3D ��ü�Կ��ǹ�</option>             	
                	<option value="CB10025">3D �������۰���</option>             	
                	<option value="CB10027">������ ���˰� ��ũ�÷ο�</option>             	
				</select>
                </td>
              </tr>
          </table>
          <%}else{ %>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" id="join_form">
            <tr>
              <td class="tit_table01">�̺�Ʈ ���� ����</td>
              <td class="tit_table02"><strong><%=v_subjnm %></strong></td>
            </tr>
            </table>      
          <%} %>
          </td>
        </tr>
        <tr>
          <td height="30">* �̺�Ʈ ������ 2012��2�� 1�� ������ �ڵ� �԰��˴ϴ�.(�н��Ⱓ : 2012.02.01 ~ 02.29)</td>
        </tr>
        <tr>
          <td height="30">&nbsp;</td>
        </tr>-->
        <tr>
        	<td id="btn"><a href="javascript:Submit_Check();"><img src="/images/portal/homepage_renewal/member/btn_confirm.gif" alt="Ȯ��" /></a> <a href="/servlet/controller.homepage.MainServlet"><img src="/images/portal/homepage_renewal/member/btn_cancle.gif" alt="���" /></a></td>
        </tr>
    </table></td>
    <td width="20">&nbsp;</td>
    
  </tr>
</table>
	      	
	      	<%}else{ %>
    


        <h2><img src="/images/portal/member/membership/h2_tit.gif" alt="������������" class="fl_l" /><p class="category">Home &gt; �̿�ȳ� &gt; <strong>������������</strong></p></h2>

        <p class="mg_t30"><img src="/images/portal/member/membership/stit_baseinfo.gif"  alt="�⺻����" /></p>
        <p class="mg_t15"></p>
        <!-- p class="mg_t15"><a href="javascript:testExcel()">�ӽ����</a></p -->

        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mg_t18">
        <tr>
         <td bgcolor="#d4d9ee" style="border-top:1px solid #96a5e1;"><table width="100%" border="0" cellspacing="1" cellpadding="0">
           <tr>
             <td width="125" class="chart001">����(�ѱ�)</td>
             <td class="chart002" colspan="3"><strong><%=v_name %></strong></td>
           </tr>
           
           <tr>
             <td width="125" class="chart001">���� *</td>
             <td width="125" class="chart002">
<%           if( v_sex.equals("1")){ %>
			 	<input name="p_sex" type="radio" value="1" id="p_sex" checked disabled />���� 
				<input name="p_sex" type="radio" value="2" id="p_sex" disabled />����
<%           }else if( v_sex.equals("2")){ %>
	 			<input name="p_sex" type="radio" value="1" id="p_sex" disabled />����
	 			<input name="p_sex" type="radio" value="2" id="p_sex" checked disabled />����
<%           } %>
			 </td>
             <td width="125" class="chart001">�������</td>
             <td width="200" class="chart002">
<%           if ( v_memberyear.equals("")){ %>
				 <input name="p_memberyear"  type="text" class="inp_txt_01" id="p_memberyear"  value="<%=v_resno1_Year %>"  size="5" maxlength="4" readonly />&nbsp;��&nbsp;&nbsp;
	 			 <input name="p_membermonth" type="text" class="inp_txt_01" id="p_membermonth" value="<%=v_resno1_Month %>" size="5" maxlength="2" readonly />&nbsp;��&nbsp;&nbsp;
	 			 <input name="p_memberday"   type="text" class="inp_txt_01" id="p_memberday"   value="<%=v_resno1_Day %>"   size="5" maxlength="2" readonly />&nbsp;��&nbsp;&nbsp;	
<%           } else { %>             
			     <input name="p_memberyear"  type="text" class="inp_txt_01" id="p_memberyear"  value="<%=v_memberyear %>"  size="5" maxlength="4" readonly />&nbsp;��&nbsp;&nbsp;
	 			 <input name="p_membermonth" type="text" class="inp_txt_01" id="p_membermonth" value="<%=v_membermonth %>" size="5" maxlength="2" readonly />&nbsp;��&nbsp;&nbsp;
	 			 <input name="p_memberday"   type="text" class="inp_txt_01" id="p_memberday"   value="<%=v_memberday %>"   size="5" maxlength="2" readonly />&nbsp;��&nbsp;&nbsp;	
<%           } %>
             </td>  
           </tr>
           
           
           
           
           <tr>
             <td width="125" class="chart001">���̵� *</td>
             <td class="chart002" colspan="3"><%=v_userid %></td>
           </tr>
            <%--
           <tr>
             <td width="125" class="chart001">��й�ȣ *</td>
             <td class="chart002">
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
                <td class="chart002">
                <input name="p_pwd_re" type="password" class="inp_txt_01" id="p_pwd_re" size="20" maxlength="" /></td>
           </tr>
           --%>
           <tr>
             <td width="125" class="chart001">��ȭ��ȣ *</td>
             <td class="chart002" colspan="3">
                 <select name="p_hometel1" id="p_hometel1" value="<%= hometel[0]%>">
                    <option value="02" <%= hometel[0].equals("02") ? "selected" : "" %>>02</option>
                    <option value="051" <%= hometel[0].equals("051") ? "selected" : "" %>>051</option>
                    <option value="053" <%= hometel[0].equals("053") ? "selected" : "" %>>053</option>
                    <option value="032" <%= hometel[0].equals("032") ? "selected" : "" %>>032</option>
                    <option value="062" <%= hometel[0].equals("062") ? "selected" : "" %>>062</option>
                    <option value="042" <%= hometel[0].equals("042") ? "selected" : "" %>>042</option>
                    <option value="052" <%= hometel[0].equals("052") ? "selected" : "" %>>052</option>
                    <option value="031" <%= hometel[0].equals("031") ? "selected" : "" %>>031</option>
                    <option value="033" <%= hometel[0].equals("033") ? "selected" : "" %>>033</option>
                    <option value="043" <%= hometel[0].equals("043") ? "selected" : "" %>>043</option>
                    <option value="041" <%= hometel[0].equals("041") ? "selected" : "" %>>041</option>
                    <option value="063" <%= hometel[0].equals("063") ? "selected" : "" %>>063</option>
                    <option value="061" <%= hometel[0].equals("061") ? "selected" : "" %>>061</option>
                    <option value="054" <%= hometel[0].equals("054") ? "selected" : "" %>>054</option>
                    <option value="055" <%= hometel[0].equals("055") ? "selected" : "" %>>055</option>
                    <option value="064" <%= hometel[0].equals("064") ? "selected" : "" %>>064</option>
                </select>
                -
                <input name="p_hometel2" type="text" class="inp_txt_01" id="p_hometel2" size="10" maxlength="4" value="<%= hometel[1]%>" />
                -
                <input name="p_hometel3" type="text" class="inp_txt_01" id="p_hometel3" size="10" maxlength="4" value="<%= hometel[2]%>" />
             </td>
           </tr>
           <tr>
                <td width="125" class="chart001">�޴��� * </td>
                <td class="chart002" colspan="3">
                <select name="p_handphone1" id="p_handphone1">
                    <option value="010" <%= handphone[0].equals("010") ? "selected" : "" %>>010</option>
                    <option value="011" <%= handphone[0].equals("011") ? "selected" : "" %>>011</option>
                    <option value="016" <%= handphone[0].equals("016") ? "selected" : "" %>>016</option>
                    <option value="017" <%= handphone[0].equals("017") ? "selected" : "" %>>017</option>
                    <option value="018" <%= handphone[0].equals("018") ? "selected" : "" %>>018</option>
                    <option value="019" <%= handphone[0].equals("019") ? "selected" : "" %>>019</option>
                </select>
                -
                <input name="p_handphone2" type="text" class="inp_txt_01" id="p_handphone2" size="10" maxlength="4" value="<%= handphone[1]%>" />
                -
                <input name="p_handphone3" type="text" class="inp_txt_01" id="p_handphone3" size="10" maxlength="4" value="<%= handphone[2]%>" />
                </td>
           </tr>
           <tr>
             <td width="125" class="chart001">�ּ� *</td>
             <td class="chart002" colspan="3">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="27">
                        <input name="p_post1" type="text" class="inp_txt_01" id="p_post1" size="10" readonly value="<%=v_post1%>" /> -
                        <input name="p_post2" type="text" class="inp_txt_01" id="p_post2" size="10" readonly value="<%=v_post2%>" />
                        <a href="javascript:searchPost(1);" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image24','','/images/portal/member/membership/btn_zip_o.gif',1)">
                            <img src="/images/portal/member/membership/btn_zip_a.gif" name="Image24" width="64" height="24" border="0" align="absmiddle" id="Image24" alt="�����ȣ"/></a></td>
                 </tr>
                 <tr>
                    <td><input name="p_home_addr1" type="text" class="inp_txt_01" id="p_home_addr1" size="40" readonly value="<%=v_home_addr1 %>" />
                      <input name="p_home_addr2" type="text" class="inp_txt_01" id="p_home_addr2" size="40" value="<%=v_home_addr2%>" maxlength="40" /></td>
                 </tr>
                </table></td>
           </tr>
           <tr>
             <td class="chart001">�̸��� *</td>
             <td class="chart002" colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0">
               <tr>
                 <td height="27"><input name="p_email1" type="text" class="inp_txt_01" id="p_email1" size="20" maxlength="20" value="<%= email[0]%>"/> @
                   <input name="p_email2" type="text" class="inp_txt_01" id="p_email2" size="20"  maxlength="20" value="<%= email[1]%>"/>
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
               <input type="checkbox" name="p_ismailing" id="p_ismailing" onclick="checkYN();" value="<%= v_ismailing %>" <% if(v_ismailing.equals("Y")) out.println("checked='checked'"); %> />
               <span class="lh_20 fs_11 ls">���� �� �̺�Ʈ �ҽ��� E-Mail Ȥ�� SMS���� ���� �ϰڽ��ϴ�.</span>
             </td>
           </tr>
           <tr>
             <td class="chart001">���� *</td>
             <td class="chart002" colspan="3">
                 <%=CodeConfigBean.getCodeGubunSelect ("0104","", 1,"p_jikup", v_jikup,"",3) %>
             </td>
           </tr>
           <tr>
             <td class="chart001">����о� *</td>
             <td class="chart002" colspan="3">
                 <%=CodeConfigBean.getCodeGubunSelect ("0103","", 1,"p_workfieldcd",  v_workfieldcd, "onChange='javascript:workfieldChange()'",3) %>
                <div id="divWork"></div>
             </td>
           </tr>
           <tr>
             <td class="chart001">�Ҽ� *</td>
             <td class="chart002" colspan="3">
             	<input type="text" name="p_compnm" id="" value="<%=v_compnm %>" size="50" maxlength="100" class="inp_txt_01" />
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
             	<%=CodeConfigBean.getCodeGubunSelect ("0106","", 1,"p_registerMotive", v_registerMotive,"",3) %>
             </td>
           </tr>
           <tr>
             <td width="125" class="chart001">���԰�� *</td>
             <td class="chart002" colspan="3">
             	<%=CodeConfigBean.getCodeGubunSelect ("0105","", 1,"p_registerRoute", v_registerRoute,"",3) %>
             </td>
           </tr></table>
         </td>
         </tr>
         </table>
         
        <!-- �������� ���� �̺�Ʈ ���� ���� --> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mg_t18">
          <tr>
            <td style="padding-top:20px;">
              <img src="/images/portal/member/membership/event_service.gif"  alt="�̺�Ʈ ����" />
            </td>
          </tr>
        </table> 
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mg_t18">
          <tr>
            <td>
              �̺�Ʈ �Ⱓ���� ���������� �����Ͻô� ȸ���е鿡 ���Ͽ� ���� ����� �����ǰ� �ִ� ������ ����� �����Ͻ� �� �ִ� ��ȸ�� �帳�ϴ�. �ϴ��� �޴��� ���Ͽ� 1�� ������ �������ּ���. 
            </td>
          </tr>
        </table> 

<%  if( v_eventCourse == "" ){ %>        
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mg_t18">
        <tr>
         <td bgcolor="#d4d9ee" style="border-top:1px solid #96a5e1;"><table width="100%" border="0" cellspacing="1" cellpadding="0">
           <tr>
             <td width="125" class="chart001">����</td>
             <td class="chart002" colspan="3">
			 	<select name="p_gameCourse" id="p_gameCourse" onchange="CourseChange('CG');">
                	<option value="">===����===</option>             	
                	<option value="CG10005">���� ��ȹ �� �׷��� �ǹ��ڸ� ���� ���ӱ�� ����</option>             	
                	<option value="CG10006">UDK Ȱ�� ���(��ũ��Ʈ)</option>             	
                	<option value="CG10007">UDK Ȱ�� ���(��)</option>             	
                	<option value="CG10008">������ �� �����е�� ���� ����(����)</option>             	
                	<option value="CG10009">������ �� �����е�� ���� ����(�ǹ�)</option>             	
                	<option value="CG10010">�ȵ���̵� ���� ����(����)</option>             	
                	<option value="CG10011">�ȵ���̵� ���� ����(�ǹ�)</option>             	
				</select>
             </td>
           </tr>
           <tr>
           <td width="125" class="chart001">��ȭ������</td>
             <td class="chart002" colspan="3">
			 	<select name="p_cultureCourse" id="p_cultureCourse" onchange="CourseChange('CK');">
                	<option value="">===����===</option>             	
                	<option value="CG10012">��ȭ�����������</option>             	
                	<option value="CK10071">11���� ��Ģ���� ������ ���丮�ڸ�</option>             	
                	<option value="CK10072">������ȹ�� ��ȭ������</option>             	
                	<option value="CK10073">����������������ȹ�� �ؿ�����</option>             	
                	<option value="CK10074">�оߺ��� ���� ������ ������</option>             	
                	<option value="CK10075">�����濵�� �ǹ�</option>             	
                	<option value="CK10076">��ʷ� �˾ƺ��� �Ҽȳ�Ʈ��ũ</option>             	
                	<option value="CK10077">�۷��ù�ȭ�������� ���ؿ� ���</option>             	
                	<option value="CK10078">���߹�ȭ�������� �����Ǹ�</option>             	
                	<option value="CK10079">���߹�ȭ�����ΰ� �α�</option>             	
                	<option value="CK10080">������ȹ�� ȫ�������� �ǹ�</option>             	
                	<option value="CK10081">����Ʈ���� ��ȭ</option>             	
                	<option value="CK10082">���� ���� ���ñ�ȹ</option>             	
				</select>
             </td>
           </tr>
           <tr>
             <td width="125" class="chart001">���</td>
             <td class="chart002" colspan="3">
			 	<select name="p_airCourse" id="p_airCourse" onchange="CourseChange('CB');">
                	<option value="">===����===</option>             	
                	<option value="CB10015">After Effect CS5</option>             	
                	<option value="CB10016">Avid Media Composer Advanced</option>             	
                	<option value="CB10017">Adobe Premiere Pro CS5</option>             	
                	<option value="CB10019">Final cut Pro�� Motion ���� �ǹ�</option>             	
                	<option value="CB10020">������ ���� �� ����</option>             	
                	<option value="CB10021">Autodesk Maya�� �̿��� ��ü���� ����</option>             	
                	<option value="CB10023">3D ��ü����</option>             	
                	<option value="CB10024">3D ��ü�Կ��ǹ�</option>             	
                	<option value="CB10025">3D �������۰���</option>             	
                	<option value="CB10027">������ ���˰� ��ũ�÷ο�</option>             	
				</select>
             </td>
           </tr></table>
         </td>
         </tr>
         </table>
<%} else { %>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mg_t18">
        <tr>
         <td bgcolor="#d4d9ee" style="border-top:1px solid #96a5e1;"><table width="100%" border="0" cellspacing="1" cellpadding="0">
           <tr>
             <td width="125" class="chart001">�̺�Ʈ ���� ����</td>
             <td class="chart002" colspan="3">
             <%=v_subjnm %>
             </td>
           </tr></table>
         </td>
         </tr>
         </table>
<%} %>        
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mg_t18">
          <tr>
            <td>
              * �̺�Ʈ ������ 2012��2�� 1�� ������ �ڵ� �԰��˴ϴ�.(�н��Ⱓ : 2012.02.01 ~ 02.29)
            </td>
          </tr>
        </table> 
      
        <!-- �������� ���� �̺�Ʈ ���� ���� -->
        
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
    $('#p_pwd').password_strength();
</script>

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->