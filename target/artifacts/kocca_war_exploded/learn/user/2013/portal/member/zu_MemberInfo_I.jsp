<%
//**********************************************************
// 1. ���ϸ� : zu_MemberInfo_I.jsp
// 2. ���α׷��� : ȸ������ �Է� ȭ��
// 3. ���� : Ȩ������ ȸ�� ���Խÿ� �ʿ��� ������ �Է��ϴ� ȭ���̴�.
// 4. ȯ��: JDK 1.5
// 5. ����: 1.0
// 6. �ۼ� : ?
// 7. ���� �̷� :
//          2015-03-02 : ������ ��û���� ȸ�� ���Խ� �ʿ��� ���� �Ϻθ� �����Ѵ�.
//                      ������ �׸��� �Ʒ��� ����. (���� ������ ���� �ʰ� �ּ�ó��)
//                          - ��ȭ��ȣ, ����, ����, ����о�, ���԰��, �����ڰ��� ����
//***********************************************************
%>

<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page errorPage="/learn/library/error.jsp" %>
<%@ page import="com.credu.library.RequestBox" %>
<%@ page import="com.credu.library.RequestManager" %>
<%@ page import="com.credu.system.CodeConfigBean" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />
<jsp:useBean id="getCodenm" class="com.credu.common.GetCodenm" scope="page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    String certiType = box.getString("certiType");

    if ( certiType.equals("") || !box.getSession("userid").equals("") ) {
%>
<!DOCTYPE html>
<html>
<title>�ѱ���������ī����</title>
<script type="text/javascript">
    alert("�߸��� �����Դϴ�.");
    location.href = "/";
</script>
<body>
</body>
</html>
<%
    } else {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        Date dt = new Date();
        String currentYear = sdf.format(dt);
        String mobileNo = box.getStringDefault("mobileNo", "");
        String email = box.getStringDefault("email", "");
        String userName = box.getStringDefault("userName", "");
        String birthDate = box.getStringDefault("birthDate", "");
        String gender = box.getStringDefault("gender", "");
        String nationalInfo = box.getStringDefault("nationalInfo", "");
        String dupInfo = box.getStringDefault("dupInfo", "");

        gender = gender.equals("0") ? "2" : gender;

        String memberYear = "";
        String memberMonth = "";
        String memberDay = "";

        String mobileExNo = "";
        String mobileMiddleNo = "";
        String mobileLastNo = "";

        String emailId = "";
        String emailDomain = "";

        if (certiType.toUpperCase().equals("MOBILE")) {
            memberYear = birthDate.substring(0, 4);
            memberMonth = birthDate.substring(4, 6);
            memberDay = birthDate.substring(6, 8);

            if ( mobileNo.length() == 11 ) {
                mobileExNo = mobileNo.substring(0, 3);
                mobileMiddleNo = mobileNo.substring(3, 7);
                mobileLastNo = mobileNo.substring(7, 11);
            } else if ( mobileNo.length() == 10 ) {
                mobileExNo = mobileNo.substring(0, 3);
                mobileMiddleNo = mobileNo.substring(3, 6);
                mobileLastNo = mobileNo.substring(6, 10);
            }
        }

        if ( certiType.toUpperCase().equals("EMAIL") ) {
            emailId = email.substring(0, email.lastIndexOf("@") );
            emailDomain = email.substring(email.lastIndexOf("@") + 1, email.length() );
        }

        box.put("title_str", "ȸ�������Է� - ȸ������ - �̿�ȳ� - �н�����");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<script type="text/javascript" src="/script/jquery.form.js"></script>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<!-- ��ũ��Ʈ���� -->
<script type="text/javascript">
<!--

    /**
     * ID ��� ���θ� üũ�Ѵ�.
     */
    function fnExistsId() {
        var regForm = document.form1;
        var userid = regForm.p_userid.value;

        if(userid == "") {
            alert("���̵� �Է��Ͽ� �ֽʽÿ�.");
            regForm.p_userid.focus();
            return;
        }

        if( userid.length < 6 || userid.length > 12) {
            alert("���̵�� �� 6~12�ڷθ� ������ �Ǿ�� �մϴ�.");
            $("#div_Area").css("color","#FF0000");  //   ID �� ����
            $("#div_Area").text("����Ҽ� ���� ���̵� �Դϴ�.");
            regForm.p_chk.value = "N";
            return;
        }

        var chk_num = userid.search(/[0-9]/g);
        var chk_lower = userid.search(/[a-z]/ig);

        //if (!/^[a-z0-9]{6,12}$/.test(fm.p_userid.value) ||  (chk_num < 0 || chk_lower< 0) ){

        if (!/^[a-z0-9]{6,12}$/.test( userid )){
            alert("���̵�� ���� �ҹ���, ���ڸ� ����Ͽ� 6-12�ڸ��� �Է��� �ּ���.");
            //alert("���̵�� ���� �ҹ���, ���ڸ� ȥ���Ͽ� 6-12�ڸ��� �Է��� �ּ���.");
            regForm.p_userid.focus();
            $("#div_Area").css("color","#FF0000");      //   ID �� ����
            $("#div_Area").text("����Ҽ� ���� ���̵��Դϴ�.");
            regForm.p_chk.value = "N";
            return;
        }

        regForm.p_process.value = "ASP_Login";
        regForm.menuid.value = "0";
        regForm.gubun.value = "20";

        $("[name='form1']").ajaxSubmit({
            url:'/servlet/controller.homepage.MainServlet',
            type:'post',
            data:{userId:userid},
            success: function(data){
               var r1 = $.trim(data);
               $("#div_Area").text("");
               idExists = false;

               if(r1 == "0") {
                   $("#div_Area").css("color","#FF0000");   // �� ��ϵ� ID �� ����
                   $("#div_Area").text("����Ҽ� ���� ���̵��Դϴ�.");
                   regForm.p_chk.value = "N";

               } else {
                   idExists=true;
                   $("#div_Area").css("color","#0000FF");   // �� ��ϵ� ID ����
                   $("#div_Area").text("����Ҽ� �ִ� ���̵��Դϴ�.");
                   regForm.p_chk.value = "Y";
               }
            }
        });
    }

    /**
     * ȸ�� ���� ���� ��ȿ���� Ȯ���� �� ȸ�� ����� �Ѵ�
     */
    function fnRegisterMember(){
        var regForm = document.form1;
        var v_email = regForm.p_email1.value + '@' + regForm.p_email2.value;

        var chk_num = "";
        var chk_lower = "";
        var chk_upper = "";
        var chk_special = "";

        var userId = regForm.p_userid.value;

        if( regForm.p_kor_name.value == "" ){
            alert("�̸��� �Է��Ͽ� �ֽʽÿ�.");
            regForm.p_kor_name.focus();
            return;
        }

        if( userId == "" ){
            alert("���̵� �Է��Ͽ� �ֽʽÿ�.");
            regForm.p_userid.focus();
            return;
        }

        chk_num = userId.search(/[0-9]/g);
        chk_lower = userId.search(/[a-z]/ig);

        //if (!/^[a-z0-9]{6,12}$/.test(userId) ||  (chk_num < 0 || chk_lower< 0) ){
        //    alert("���̵�� ���� �ҹ���, ���ڸ� ȥ���Ͽ� 6-12�ڸ��� �Է��� �ּ���.");
        if (!/^[a-z0-9]{6,12}$/.test(userId)){
            alert("���̵�� ���� �ҹ���, ���ڸ� ����Ͽ� 6-12�ڸ��� �Է��� �ֽʽÿ�.");
            regForm.p_userid.focus();
            return;
        }

        if(regForm.p_chk.value != "Y"){
            alert("���̵� �ߺ�üũ�� �Ͻʽÿ�.");
            return;
        }

        // ��й�ȣ ���� ����
        var p_pwd_len =  regForm.p_pwd.value.length;

        chk_num = regForm.p_pwd.value.search(/[0-9]/g);
        chk_lower = regForm.p_pwd.value.search(/[a-z]/ig);
        chk_upper = regForm.p_pwd.value.search(/[A-Z]/ig);
        chk_special = regForm.p_pwd.value.search(/[^a-zA-Z0-9]/g);

        if(p_pwd_len <= 0){
            alert("��й�ȣ�� �Է��� �ֽʽÿ�.");
            regForm.p_pwd.focus();
            return;
        } else {
            // if (!/^[a-zA-Z0-9]{9,14}$/.test(regForm.p_pwd.value) || (chk_num < 0 || chk_lower< 0 || chk_upper < 0)){
            // if ( p_pwd_len < 9 || p_pwd_len > 14 || chk_lower< 0 || chk_upper < 0 ||  (chk_num < 0 && chk_special< 0 ) ){
            // alert("��й�ȣ�� ���� ��/�ҹ��ڿ� ���� �Ǵ� Ư�����ڸ� ȥ���Ͽ� 9-14�ڸ��� �Է��� �ּ���.");

            if (chk_lower < 0 || chk_upper < 0 ||  (chk_num < 0 && chk_special < 0 ) ){
                alert("��й�ȣ�� ���� ��/�ҹ��ڿ� ���� �Ǵ� Ư�����ڸ� ȥ���Ͽ� �Է��� �ֽʽÿ�.");
                regForm.p_pwd.value = "";
                regForm.p_pwd.focus();
                return;
            }
        }

        if( regForm.p_pwd.value == userId){
            alert("���̵�� ������ ��й�ȣ�� ��� �Ͻ� �� �����ϴ�.");
            regForm.p_pwd.value = "";
            regForm.p_pwd.focus();
            return;
        }

        if( (regForm.p_pwd_re.value) == ""){
            alert("��й�ȣȮ���� �Է��� �ֽʽÿ�");
            regForm.p_pwd_re.focus();
            return;
        }

        if(regForm.p_pwd.value != regForm.p_pwd_re.value){
            alert("��й�ȣ�� �ٸ��� �ԷµǾ����ϴ�.");
            regForm.p_pwd_re.value ="";
            regForm.p_pwd.focus();
            return;
        }

        if (regForm.p_pwd.value.length < 8 ) {
            alert("��й�ȣ�� 8�ڸ� �̻� �Է��� �ֽʽÿ�.");
            regForm.p_pwd.focus();
            return;
        }

        if ( $("input:radio[name=p_sex]").length > 0 ) {
            if ( $("input:radio[name=p_sex]:checked").length == 0 ) {
                alert("������ �����Ͻʽÿ�.");
                $("input:radio[name=p_sex]").eq(0).focus();
                return;
            }
        }

        if( regForm.p_memberyear.value == "" ){
            alert("��������� �Է��� �ֽʽÿ�.");
            regForm.p_memberyear.focus();
            return;
        } else if( regForm.p_membermonth.value == "" ){
            alert("��������� �Է��� �ֽʽÿ�.");
            regForm.p_membermonth.focus();
            return;
        } else if( regForm.p_memberday.value == "" ){
            alert("��������� �Է��� �ֽʽÿ�.");
            regForm.p_memberday.focus();
            return;
        }

        /*
        if( regForm.p_hometel1.value == "" ){
            alert("��ȭ��ȣ�� �Է��� �ֽʽÿ�.");
            regForm.p_hometel1.focus();
            return;

        } else if( (regForm.p_hometel2.value) == "" || regForm.p_hometel2.length > 3 ) {
            alert("��ȭ��ȣ�� �ٸ��� �Է��� �ֽʽÿ�.");
            regForm.p_hometel2.focus();
            return;

        } else if( (regForm.p_hometel3.value) == "" || regForm.p_hometel3.length > 4 ) {
            alert("��ȭ��ȣ�� �ٸ��� �Է��� �ֽʽÿ�.");
            regForm.p_hometel3.focus();
            return;
        }
        */

        if( (regForm.p_handphone1.value) == "" ){
            alert("�ڵ��� ��ȣ�� �Է��� �ֽʽÿ�.");
            regForm.p_handphone1.focus();
            return;

        } else if( (regForm.p_handphone2.value) == "" || regForm.p_handphone2.length > 3 ) {
            alert("�ڵ��� ��ȣ�� �ٸ��� �Է��� �ֽʽÿ�.");
            regForm.p_handphone2.focus();
            return;

        } else if( (regForm.p_handphone3.value) == "" || regForm.p_handphone3.length > 4 ) {
            alert("�ڵ��� ��ȣ�� �ٸ��� �Է��� �ֽʽÿ�.");
            regForm.p_handphone3.focus();
            return;
        }

        /*
        if( (regForm.p_home_addr1.value) == "" ){
            alert("������ �����ϼ���.");
            regForm.p_home_addr1.focus();
            return;
        }
        */

        if (regForm.p_email1.value =="" || regForm.p_email2.value == ""){
            alert("Email �ּҸ� �ٸ��� �Է��� �ֽʽÿ�.");
            regForm.p_email1.focus();
            return;
        }

        // e-mail check
        if(fnCheckEmailValidation(v_email) == false) {
            alert("��Ȯ�� E-Mail�� �Է��� �ֽʽÿ�.");
            regForm.p_email1.focus();
            return;
        }

        /*
        if( regForm.p_jikup.value == "" ){
            alert("������ �����Ͻʽÿ�.");
            regForm.p_jikup.focus();
            return;
        }

        if( regForm.p_workfieldcd.value == "" ){
            alert("����о߸� �����Ͻʽÿ�.");
            regForm.p_workfieldcd.focus();
            return;
        }

        if( regForm.p_registerRoute.value == "" ){
            alert("���԰�θ� �����Ͻʽÿ�.");
            regForm.p_registerRoute.focus();
            return;
        }
        */

        if ( confirm("�Է��Ͻ� ������ ȸ�������� �Ͻðڽ��ϱ�?") ) {
            regForm.target = "_self";
            regForm.action =  https_host() + "/servlet/controller.member.MemberJoinCompleteServlet";
            // regForm.action =  https_host() + "/learn/user/2013/portal/member/zu_MemberRegister.jsp";
            regForm.p_handphone.value = regForm.p_handphone1.value + '-' + regForm.p_handphone2.value + '-' + regForm.p_handphone3.value;
            // regForm.p_hometel.value = regForm.p_hometel1.value + '-' + regForm.p_hometel2.value + '-' + regForm.p_hometel3.value;
            regForm.p_email.value = v_email;
            regForm.p_process.value = "JoinOk";
            regForm.submit();
        }
    }


    /**
     * �̸��� �� �̸������� ID�˻�
     */
    function fnCheckEmailValidation(strEmail) {
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

        if ( !regDoNot.test(strEmail) && regMust.test(strEmail) ) {
            return true;

        } else {
            return false;
        }
    }

    /**
     * �̸��� ����� �������� ��
     */
    function fnEmailChange() {
        var r=$("[name='p_email3']").val();
        $("[name='p_email2']").val(r);
        if(r == ""){
            $("[name='p_email2']").attr("readonly",false);
        }else{
            $("[name='p_email2']").attr("readonly",true);
        }
    }

    function workfieldChange() {
        if (document.form1.p_workfieldcd.value == "99") {
            document.getElementById('divWork').innerHTML = "<input name='p_workfieldnm' type='text' class='inp_txt_01' id='p_workfieldnm' size='30' maxlength='15' />";
            document.form1.p_workfieldnm.value="";
        } else {
            document.getElementById('divWork').innerHTML="";
        }
    }

    /**
     * ���� �� SMS ���ŵ��� ����
     */
    function fhCheckMailingYN() {
        var r = $("[name='p_ismailing']").val();
        if(r == "Y") {
            $("[name='p_ismailing']").val("N");
        } else {
            $("[name='p_ismailing']").val("Y");
        }
    }

    /**
     * ��й�ȣ ���� ����� üũ�Ѵ�.
     */
    function fnCheckPaswordLevel(password) {
        var desc = new Array();
        desc[0] = "<label style=\"color:#ff0000;\">�ſ� ����</label>"; // �ſ����
        desc[1] = "<label style=\"color:#ff0000;\">�ſ� ����</label>"; // ���ݺ���
        desc[2] = "<label style=\"color:#808080;\">����</label>"; // �������
        desc[3] = "<label style=\"color:#0000ff;\">����</label>"; // ��ȣ����
        desc[4] = "<label style=\"color:#808000;\">��ȣ</label>"; // �����ϴ�
        desc[5] = "<label style=\"color:#008000;\">�ſ� ��ȣ</label>"; // �ſ�����
        var score = 0;

        //if password length == 0, do nothing
        if (password.length == 0) return;
        //if password bigger than 8 give 1 point
        if (password.length > 7) score++;

        //if password has both lower and uppercase characters give 1 point
        if ( ( password.match(/[a-z]/) ) || ( password.match(/[A-Z]/) ) ) score++;
        //if password has at least one number give 1 point
        if (password.match(/\d+/)) score++;
        //if password has at least one special caracther give 1 point
        if ( password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/) ) score++;
        //if password bigger than 12 give another 1 point
        if (password.length > 12) score++;

        //document.getElementById("passwordDescription").innerHTML = desc[score];
        $("#oPwdLevelArea").html( desc[score] );
    }

    /**
     * ��й�ȣ�� ��й�ȣȮ�� ���� ���Ѵ�.
     */
    function fnCheckPasswordRe(rePassword) {
        var password = $("#f_pw2").val();
        if ( rePassword != "" ) {
            if (rePassword.length < password.length ) {
                $("#oPwdReArea").html("<label style=\"color:#fca500;\">���Էµ� ��й�ȣ�� �ʹ� ª��</label>");
            } else if ( password != rePassword ) {
                $("#oPwdReArea").html("<label style=\"color:#fca500;\">��й�ȣ�� ���� ����</label>");
            } else {
                $("#oPwdReArea").html("<label style=\"color:#008000;\">��й�ȣ Ȯ��</label>");
            }
        } else {
            $("#oPwdReArea").html("");
        }
    }

    function fnSetLastDay() {
        var lastDayArr = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
        var year = $("#oMemberYear").val();
        var month = $("#oMemberMonth").val();

        var monthIndex = -1;
        var newDaySize = 0;
        var currDaySize = 0;
        var dayIndex = -1;

        if ( year != "" && month != "") {
            if (( year%400 == 0 ) || (year%4 == 0 && year%100 != 0 ) ) {
               lastDayArr[1] = 29;
            }

            monthIndex = $("#oMemberMonth option").index($("#oMemberMonth option:selected"));
            dayIndex = $("#oMemberDay option").index($("#oMemberDay option:selected"));
            newDaySize = lastDayArr[monthIndex - 1];
            currDaySize = $("#oMemberDay option:first").nextAll().size();

            if ( newDaySize != currDaySize ) {
                $("#oMemberDay option:first").nextAll().remove();
                for( var k = 1 ; k <= newDaySize; k++ ) {
                    if ( k < 10 ) {
                        $("#oMemberDay").append("<option value=\"" + ("0" + k) + "\">" + ("0" + k) + "</option>");
                    } else {
                        $("#oMemberDay").append("<option value=\"" + k + "\">" + k + "</option>");
                    }
                }

                $("#oMemberDay option:eq(" + dayIndex + ")").attr("selected", "selected");
            }
        } else {
            return;
        }
    }
//-->
</script>
<!-- ��ũ��Ʈ�������� -->
<!-- container-new ���� //-->
<div id="container-new">


<!-- form ���� -->
<form id="oRegisterMemberForm" name="form1" action="" method="post">
    <input type="hidden" name="p_process" value="" />
    <input type="hidden" name="menuid" value="" />
    <input type="hidden" name="gubun" value="" />
    <input type="hidden" name="p_chk" value="" />
    <input type="hidden" name="p_handphone" value="" />
    <input type="hidden" name="p_hometel" value="" />
    <input type="hidden" name="p_email" value="" />
    <input type="hidden" name="certiType" value="<%= certiType %>" />
    <input type="hidden" name="p_dupinfo" value="<%= dupInfo %>" />

    <div id="mainMenu">
        <!-- �н����� -->
        <ul class="location">
            <li>Ȩ</li>
            <li>�̿�ȳ�</li>
            <li>
                ȸ������ <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin" class="active">ȸ������</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd">���̵�/�н����� ã��</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=PersonalNew">��������ó����ħ</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=UserAgree">�̿���</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&amp;p_code=FOOTER_EMAIL">�̸��Ϲ��ܼ����ź�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport">Ȩ������ �����ǰ�</a></li>
                </ul>
            </li>
            <!-- 2015-01-16 ���� ����

            <li>
                �̿�ȳ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">FAQ</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
                    <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List">��������</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome" class="active">�̿�ȳ�</a></li>
                </ul>
            </li>
            <li>
                ȸ������ <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SiteMap">����Ʈ��</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin" class="active">ȸ������</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd">���̵�/�н����� ã��</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=PersonalNew">��������ó����ħ</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=UserAgree">�̿���</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&amp;p_code=FOOTER_EMAIL">�̸��Ϲ��ܼ����ź�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport">Ȩ������ �����ǰ�</a></li>
                </ul>
            </li>

            //-->                    
        </ul>
        <!-- ������ο� -->
    </div>
    <!-- //#mainMenu -->


    <!-- ������ ���� ���� -->
    <div id="contents">
        <h2 class="subTit">ȸ������<!-- <img src="/images/2013/support/join_title.gif" alt="ȸ������" /> //--></h2>

        <div id="subCont">
            <div class="stepimgBox">
                <img src="/images/2013/support/private_img3.jpg" alt="ȸ�������� 4�ܰ� �������, ����Ȯ��, �����Է�, ���ԿϷ� �߿��� ���� 3�ܰ� �����Է� �ܰ��Դϴ�." />
            </div>
            <p class="stepSubtxt">ȸ�������� �������� ��޹�ħ�� ���� �����ϰ� ��ȣ�Ǹ�, ȸ������ ����� ���� ���� ���� �Ǵ� �� 3�ڿ��� �������� �ʽ��ϴ�. <a href="http://edu.kocca.or.kr/servlet/controller.homepage.MainMemberJoinServlet?p_process=Personal" target="_blank">��������ó����ħ</a></p>

            <div class="both">
                <h4 class="subTit"><img src="/images/2013/support/joininfo_title1.gif" alt="�α��� �����Է�" /></h4>
                <p class="sidetxt"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" />�ʼ� �Է� ����</p>
            </div>
            <div class="tableWrap space2">
                <table class="dataTable6" summary="�� ǥ�� �� �������� �⺻�������� ǥ�� ����(�ѱ�), ���̵�, ����, �������, ��ȭ��ȣ, ����Ϲ�ȣ, �ּ�(��������), �̸���, ����, ����о�, �Ҽ�, �������� ���� �������� ���� �Ǿ� �ֽ��ϴ�.">
                    <caption>�� �������� �⺻�������� ǥ</caption>
                    <colgroup>
                        <col width="18%"/>
                        <col width="*"/>
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="f_dName">����(�ѱ�)</label></th>
                        <td>
<%
        if ( certiType.equals("MOBILE") ) {
%>
                                <%= userName %>
                            <input type="hidden" id="oKorName" name="p_kor_name" value="<%= userName %>" />
<%
        } else {
%>
                            <input type="text" id="oKorName" name="p_kor_name" value="" class="inputText" size="30" />
<%
        }
%>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="f_identity">���̵�</label></th>
                        <td>
                            <input type="text" name="p_userid" id="f_identity" class="inputText" size="30" />
                            <a href="javascript:fnExistsId();"><img src="/images/2013/btn/btn_doubleid.gif" width="90" height="22" alt="id �ߺ�Ȯ��" /></a>
                            <span id="div_Area" style="width:200px;margin-left:10px"></span><br />
                            <span class="rd0">���̵�� <strong>6~12���� ������ ����</strong>���� ���� �� �ֽ��ϴ�.</span>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="f_pw2">��й�ȣ</label></th>
                        <td>
                            <input type="password" name="p_pwd" id="f_pw2" class="inputPw" maxlength="30" size="30" onkeyup="fnCheckPaswordLevel(this.value);" onblur="fnCheckPasswordRe(document.form1.p_pwd_re.value);"/>
                            <span id="oPwdLevelArea" style="width:200px;margin-left:10px; font-weight:bold;"></span>
                            <span class="rd3">
                                ��й�ȣ�� 8~30���� ���� ��ҹ���/����/Ư������ ȥ�� ����� �����մϴ�.<br/>
                                2���� ������ ��� 10�ڸ� �̻�, 3���� ������ ��� 8�ڸ� �̻��� �����մϴ�.<br/>
                                ���� ��/�ҹ��ڿ� ���� �Ǵ� Ư�����ڸ� ȥ���Ͽ� ����Ͻð�,<br />
                                ���Ϲ�ȣ, �ֹε�Ϲ�ȣ �� �˱� ���� ���ڴ� �����ֽʽÿ�.
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="f_pw3">��й�ȣ Ȯ��</label></th>
                        <td>
                            <input type="password" name="p_pwd_re" id="f_pw3" class="inputPw" maxlength="30" size="30" onkeyup="fnCheckPasswordRe(this.value);" />
                            <span id="oPwdReArea" style="width:200px;margin-left:10px; font-weight:bold;"></span>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <!-- //tableWrap -->

            <!-- 0925 ���� -->
            <div class="both">
                <h4 class="subTit"><img src="/images/2013/support/joininfo_title2.gif" alt="ȸ�� ������ �Է�" /></h4>
                <p class="sidetxt"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" />�ʼ� �Է� ����</p>
            </div>
            <!-- //0925 ���� -->
            <div class="tableWrap space2">
                <table class="dataTable6" summary="�� ǥ�� �� �������� �⺻�������� ǥ�� ����(�ѱ�),���̵�,����,�������,��ȭ��ȣ,����Ϲ�ȣ,�ּ�(��������),�̸���,����,����о�,�Ҽ�,�������� ���� �������� ���� �Ǿ� �ֽ��ϴ�.">
                    <caption>�� �������� �⺻�������� ǥ</caption>
                    <colgroup>
                        <col width="18%"/>
                        <col width="*"/>
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" />����</th>
                        <td>
<%
            if ( certiType.equals("MOBILE") ) {
%>
                            <span class="rd0"><%= gender.equals("1") ? "����" : "����" %></span>
                            <input type="hidden" name="p_sex" id="oSex" value="<%= gender %>" />
                            <input type="hidden" name="p_memberyear" id="oMemberyear" value="<%= memberYear %>" />
                            <input type="hidden" name="p_membermonth" id="oMembermonth" value="<%= memberMonth %>" />
                            <input type="hidden" name="p_memberday" id="oMemberday" value="<%= memberDay %>" />
<%
            } else {
%>
                            <span class="rd0"><label><input type="radio" name="p_sex" value="1" id="male" /> ����</label></span>
                            <span class="rd1"><label><input type="radio" name="p_sex" value="2" id="female" /> ����</label></span>
<%
            }
%>
                        </td>
                    </tr>
<%
            if ( certiType.toUpperCase().equals("EMAIL") ) {
%>
                    <tr>
                        <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="oMobileExNo">�������</label></th>
                        <td>
                            <select class="select" name="p_memberyear" id="oMemberYear" onchange="fnSetLastDay();" style="width:55px;">
                                <option value="">����</option>
<%
                for ( int i = Integer.parseInt(currentYear) ; i > 1919 ; i-- ) {
                    out.println("\t\t\t\t<option value=\"" + i + "\">" + i + "</option>");
                }
%>
                            </select>
                            -
                            <select class="select" name="p_membermonth" id="oMemberMonth" onchange="fnSetLastDay();" style="width:55px;">
                                <option value="">����</option>
<%
                for ( int i = 1 ; i < 13 ; i++ ) {
                    if( i < 10 ) {
                        out.println("\t\t\t\t<option value=\"" + ("0" + i) + "\">" + ("0" + i) + "</option>");
                    } else {
                        out.println("\t\t\t\t<option value=\"" + i + "\">" + i + "</option>");
                    }
                }
%>
                            </select>
                            -
                            <select class="select" name="p_memberday" id="oMemberDay" style="width:55px;">
                                <option value="">����</option>
<%
                for ( int i = 1 ; i < 32 ; i++ ) {
                    if( i < 10 ) {
                        out.println("\t\t\t\t<option value=\"" + ("0" + i) + "\">" + ("0" + i) + "</option>");
                    } else {
                        out.println("\t\t\t\t<option value=\"" + i + "\">" + i + "</option>");
                    }
                }
%>
                            </select>
                        </td>
                    </tr>
<%
            }
%>
                    <!--
                    <tr>
                        <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="f_tel">��ȭ��ȣ</label></th>
                        <td>
                            <select class="select" name="p_hometel1" id="f_tel" style="width:55px;">
                                <option value="">����</option>
                                <option value="070">070</option>
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
                            </select>
                            - <input type="text" name="p_hometel2" maxlength="4" class="inputText" size="6" title="���� �Է�" />
                            - <input type="text" name="p_hometel3" maxlength="4" class="inputText" size="6" title="�� 4�ڸ��Է�" />
                        </td>
                    </tr>
                    //-->
                    <tr>
                        <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="oMobileExNo">�޴���ȭ��ȣ</label></th>
                        <td>
<%
            if ( certiType.equals("MOBILE") ) {
%>
                            <%= mobileExNo + "-" + mobileMiddleNo + "-" + mobileLastNo %>
                            <input type="hidden" name="p_handphone1" id="oMobileExNo"  value="<%= mobileExNo %>" />
                            <input type="hidden" name="p_handphone2" id="oMobileMiddleNo" value="<%= mobileMiddleNo %>" />
                            <input type="hidden" name="p_handphone3" id="oMobileLastNo" value="<%= mobileLastNo %>" />
<%
            } else {
%>
                            <select class="select" name="p_handphone1" id="oMobileExNo" style="width:55px;">
                                <option value="">����</option>
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                            </select>
                            - <input type="text" name="p_handphone2" maxlength="4" class="inputText" size="6" title="��� �ڸ� �Է�" />
                            - <input type="text" name="p_handphone3" maxlength="4" class="inputText" size="6" title="�� 4�ڸ��Է�" />
<%
            }
%>
                        </td>
                    </tr>

                    <!--
                    <tr>
                        <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="f_area">����</label></th>
                        <td>
                            <select class="select" name="p_home_addr1" id="f_area">
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
                    //-->
                    <tr>
                        <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="f_dEmail">�̸���</label></th>
                        <td>
<%
            if ( certiType.equals("EMAIL") ) {
%>
                                <%= email %>
                                <input type="hidden" id="oEmailId" name="p_email1" value="<%= emailId %>" />
                                <input type="hidden" id="oEmailDomain" name="p_email2" value="<%= emailDomain %>" />
<%
            } else {
%>
                            <input type="text" name="p_email1" id="f_dEmail" class="inputText" size="17" title="�̸��� ���̵� �Է�"/> @
                            <input type="text" name="p_email2" class="inputText" size="30" title="�̸��� ������ �Է�"/>
                            <select class="select" name="p_email3" title="�̸����ּ� ����" onchange="fnEmailChange();">
                                <option value="">�����Է�</option>
                                <option value="gmail.com" >gmail.com</option>
                                <option value="hanmail.net">hanmail.net</option>
                                <option value="daum.net">daum.net</option>
                                <option value="hotmail.com">hotmail.com</option>
                                <option value="nate.com">nate.com</option>
                                <option value="naver.com">naver.com</option>
                                <!--
                                <option value="chol.com" >chol.com</option>
                                <option value="dreamwiz.com" >dreamwiz.com</option>
                                <option value="empal.com" >empal.com</option>
                                <option value="freechal.com" >freechal.com</option>
                                <option value="hanafos.com" >hanafos.com</option>
                                <option value="hanmir.com" >hanmir.com</option>
                                <option value="hitel.net" >hitel.net</option>
                                <option value="korea.com" >korea.com</option>
                                <option value="lycos.co.kr" >lycos.co.kr</option>
                                <option value="netian.com" >netian.com</option>
                                <option value="paran.com" >paran.com</option>
                                <option value="yahoo.com" >yahoo.com</option>
                                <option value="yahoo.co.kr" >yahoo.co.kr</option>
                                //-->
                            </select>
  <%
            }
%>
                        </td>
                    </tr>
                    <!--
                    <tr>
                        <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="f_dJob">����</label></th>
                        <td>
                            <%-- = CodeConfigBean.getCodeGubunSelect ("0104","", 1,"p_jikup","","class='select' id='f_dJob'",3) --%>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="f_dJobpart">����о�</label></th>
                        <td>
                            <%-- = CodeConfigBean.getCodeGubunSelect ("0103","", 1,"p_workfieldcd","","class='select' id='f_dJobpart''",3) --%>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="f_route">���԰��</label></th>
                        <td>
                            <%-- = CodeConfigBean.getCodeGubunSelect ("0105","", 1,"p_registerRoute","","class='select' id='f_route'",3) --%>
                        </td>
                    </tr>
                    //-->
                    <tr>
                        <th scope="row">�������� ����</th>
                        <td>
                            <span class="rd0"><label><input type="checkbox" name="p_ismailing" value="Y" onclick="fhCheckMailingYN();" checked />&nbsp;&nbsp;���� �� �̺�Ʈ �ҽ��� E-Mail Ȥ�� SMS���� �����ϰڽ��ϴ�.</label></span>
                        </td>
                    </tr>
                    <!--
                    <tr>
                        <th scope="row"><label for="f_gamelicyn">�����ڰ���</label></th>
                        <td>
                            <select class="select" name="p_gamelicyn" id="f_gamelicyn">
                                <option value="Y">����</option>
                                <option selected value="N">�̺���</option>
                            </select>
                        </td>
                    </tr>
                    //-->
                    </tbody>
                </table>
            </div>
            <!-- //tableWrap -->

            <!--h4 class="subTit"><img src="/images/2013/support/joininfo_title3.gif" alt="�ΰ����� �Է�" /></h4>
            <div class="tableWrap space2">
                <table class="dataTable6" summary="�� ǥ�� �� �������� �⺻�������� ǥ�� ����(�ѱ�),���̵�,����,�������,��ȭ��ȣ,����Ϲ�ȣ,�ּ�(��������),�̸���,����,����о�,�Ҽ�,�������� ���� �������� ���� �Ǿ� �ֽ��ϴ�.">
                    <caption>�� �������� �⺻�������� ǥ</caption>
                    <colgroup>
                        <col width="18%"/>
                        <col width="*"/>
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row"><label for="f_motivation">���Ե���</label></th>
                        <td>
                            <select class="select" name="p_registerMotive" id="f_motivation">
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
                        <th scope="row"><label for="f_nominators">��õ�� ���̵�</label></th>
                        <td>
                            <input type="text" name="p_recommendid" id="f_nominators" class="inputText" size="27" >
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div-->
            <!-- //tableWrap -->

            <div class="btnArea wd3">
                <button type="button" class="btnText" onclick="javascript:fnRegisterMember();"><span>Ȯ��</span></button>
                <a href="/servlet/controller.homepage.MainServlet" class="btnText2" title="ȸ�������� ����ϰ� Ȩ������ ù ȭ������ �̵��մϴ�."><span>���</span></a>
            </div>
        </div>
        <!-- //#subCont -->
    </div>
</form>

</div>
<!--  //container-new �� //-->
<!-- form �� -->
<script type='text/javascript' src='/script/jquery.password_strength.js'></script>
<script language="JavaScript" type="text/JavaScript">
    $('form1').attr('autocomplete', 'off');
</script>

<%@ include file="/learn/user/2013/portal/include/footer.html"%>

<%
    }
%>
