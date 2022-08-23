<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script type="text/javascript">
    /* <![CDATA[ */

    /*  ]]> */
</script>

<script type="text/javascript" src="/js/miya_validator.js"></script>
<script type="text/javascript">
    //<![CDATA[

    var mberSe = "<c:out value='${user.mberSe}'/>";
    var codeIdVal = "<c:out value='${codeId0}'/>";

    $(function(){
        var title = document.title;
        document.title = "이용약관동의 < " + title;

        crtfcPopup = function(authSe) { // 이메일/휴대폰 인증 팝업창
            var val = "";
            var email = $("#email").val();
            var mbtlnum = $("#mbtlnum").val();
            var height = "343";
            var mode = "";

            if (authSe == "01") {
                if (!checkEmailFc()) {
                    $("#email").focus();
                    return;
                }
                $("#emailAuthAt").val("Y");
                $("#authEmailAt").val("Y");
                val = email;
                mode = "Y";
            }
            else {
                if (!checkMbtlnumFc()) {
                    $("#mbtlnum").focus();
                    return;
                }

                val = mbtlnum;
                height = "463";
                mode = "Y";
            }

            window.open("/edu/userMember/crtfcPopup.do?viewType=BODY&authSe="+authSe+"&val="+val+"&mode="+mode, "crtfcPopup", "top=300, left=600, width=568, height="+height+", status=yes, resizable=yes, scrollbars=no");
        };

        $("#mbtlnumAuthCmt").hide();
        $("#mbtlnumAuthDel").hide();

        authDel = function() { // 휴대폰 인증 삭제
            $("#mbtlnumAuthAt").val("");
            $("#mbtlnumAuth").show();
            $("#mbtlnumAuthCmt").hide();
            $("#mbtlnumAuthDel").hide();
            $("#mbtlnum").attr('disabled', false);
            $("#mbtlnum").val("");
        };

        parntsCrtfcPopup = function() { // 이메일/휴대폰 인증 팝업창
            var val = "";
            var parntsMbtlnum = $("#parntsMbtlnum").val();
            var mode = "";

            var form = $("#agreeForm")[0];
            var v = new MiyaValidator(form);

            v.add("parntsMbtlnum", {
                required : true,
                span : 1,
                glue : "",
                option : "handphone"
            });

            var result = v.validate();
            if (!result) {
                alert(v.getErrorMessage());
                v.getErrorElement().focus();
                return;
            }

            /*
            var flag = true;

            $.ajaxSetup({
                async: false
            });
            $.post(
                "/edu/member/checkDupMbtlnum.json",
                {mbtlnum : $("#parntsMbtlnum1").val()+"-"+$("#parntsMbtlnum2").val()+"-"+$("#parntsMbtlnum3").val()},
                function(data)
                {
                    if (data.resultCode == "success") {
                        if (data.mbtlnumCnt > 0) {
                            alert("사용 불가능한 핸드폰번호입니다.");
                            $("#mbtlnum1").val("");
                            $("#mbtlnum2").val("");
                            $("#mbtlnum3").val("");
                            flag = false;
                        }
                    }
                },"json"
            );

            if (!flag) {
                $("#parntsMbtlnum1").focus();
                return;
            }
            */

            val = parntsMbtlnum;
            height = "463";
            mode = "Y";

            window.open("/edu/userMember/parntsCrtfcPopup.do?viewType=BODY&authSe=02&val="+val+"&mode="+mode, "parntsCrtfcPopup", "top=300, left=600, width=568, height="+height+", status=yes, resizable=yes, scrollbars=no");
        };

        parntsAuthDel = function() { // 휴대폰 인증 삭제
            $("#parntsMbtlnumAuthAt").val("");
            $("#parntsMbtlnumAuth").show();
            $("#parntsMbtlnumAuthCmt").hide();
            $("#parntsMbtlnumAuthDel").hide();
            $("#parntsMbtlnum").attr('disabled', false);
            $("#parntsMbtlnum").val("");
        };

        $("#brthdy").blur(function() {
            var birthday  = $(this).val();
            if (birthday == "") return false;
            birthday = birthday.split("-");
            var d1 = new Date(birthday[0],birthday[1]-1,birthday[2]);
            var d2 = new Date();

            // 일수, 연령 계산
            var diff = d2.getTime() - d1.getTime();
            var daysPast = Math.floor(diff / (1000 * 60 * 60 * 24));
            var age = Math.floor(daysPast / 365.25);
            if (age < 14) {
                $("#childDiv").show();
                $("#parntsAgreAt").val("Y");
            }
            else {
                $("#childDiv").hide();
                $("#parntsAgreAt").val("");
            }
        });

        $("#parntsAuthSameBtn").click(function() {
            var val = $("#parntsMbtlnum1").val();
            $("#mbtlnum").val($("#parntsMbtlnum").val());

            if (checkMbtlnumFc()) {
                $("#mbtlnumAuthAt").val("Y");
                $("#mbtlnumAuth").hide();
                $("#mbtlnumAuthCmt").show();
                $("#mbtlnumAuthDel").show();
                $("#mbtlnum").attr('disabled', true);
                $("#mbtlnum").val(val);
                $("#parntsAuthSameBtn").hide();
            }
        });

        $("#checkbox-p-5").click(function() {
            if($("#checkbox-p-5").is(":checked")) {
                $("#checkbox-p-6").prop("checked", true);
                $("#checkbox-p-7").prop("checked", true);
                $("#checkbox-p-8").prop("checked", true);
                $("#agreAt2").val("Y");
            } else {
                $("#checkbox-p-6").prop("checked", false);
                $("#checkbox-p-7").prop("checked", false);
                $("#checkbox-p-8").prop("checked", false);
                $("#agreAt2").val("N");
            }
        });

        $("#checkbox-p-6, #checkbox-p-7, #checkbox-p-8").click(function() {
            if($("#checkbox-p-6").is(":checked") && $("#checkbox-p-7").is(":checked") && $("#checkbox-p-8").is(":checked")) {
                $("#checkbox-p-5").prop("checked", true);
            } else {
                $("#checkbox-p-5").prop("checked", false);
            }
        });

        $("#checkbox-p-1").click(function() {
            if($("#checkbox-p-1").is(":checked")) {
                $("#emailAt").val("Y");
            } else {
                $("#emailAt").val("N");
            }
        });

        $("#checkbox-p-2").click(function() {
            if($("#checkbox-p-2").is(":checked")) {
                $("#smsAt").val("Y");
            } else {
                $("#smsAt").val("N");
            }
        });

        $("#checkbox-p-8").click(function() {
            if($("#checkbox-p-8").is(":checked")) {
                $("#agreAt2").val("Y");
            } else {
                $("#agreAt2").val("N");
            }
        });

/*        $("#checkbox-p-3").click(function() {
            if($("#checkbox-p-3").is(":checked")) {
                $("#concertEmailAt").val("Y");
            } else {
                $("#concertEmailAt").val("N");
            }
        });*/

/*        $("#checkbox-p-4").click(function() {
            if($("#checkbox-p-4").is(":checked")) {
                $("#concertSmsAt").val("Y");
            } else {
                $("#concertSmsAt").val("N");
            }
        });*/

    });

    function checkId(value) {
        checkIdFc();
        return value;
    }

    function checkIdFc() {
        var flag = true;
        $.ajaxSetup({
            async: true
        });

        if (checkIdVal()) {
            //if (checkIdMix($("#userId").val())) {
            $.ajaxSetup({
                async: false
            });
            $.post(
                "/edu/member/checkDupId.json",
                {userId : $("#userId").val(), all : 'Y'},
                function(data) {
                    if (data.resultCode == "success") {
                        if (data.idCnt > 0) {
                            flag = false;
                        }
                        else {
                            flag = true;
                        }
                    }
                },"json"
            );
            if (flag == true) {
                $("#id-success").text("사용가능한 아이디입니다.");
                $("#id-danger").text("");
                return true;
            }
            else {
                $("#id-danger").text("이미 등록된 아이디입니다.");
                $("#id-success").text("");
                return false;
            }
        }
        else {
            $("#id-danger").text("사용 불가능한 아이디입니다.");
            $("#id-success").text("");
            flag = false;
        }
    }

    function checkIdVal() {
        var form = $("#agreeForm")[0];
        var v = new MiyaValidator(form);
        v.add("userId", {
            required: true,
            pattern: "^[a-z0-9]{6,30}$"
            //pattern: "^.*(?=.{6,16})(?=.*[0-9])(?=.*[a-z])(?=.*[!@#$%^*+=-]).*$"
        });
        var result = v.validate();
        if (!result) {
            v.getErrorElement().focus();
            return false;
        }
        return true;
    }

    function checkIdMix(str) {
        var chk_num = str.search(/[0-9]/g);
        var chk_eng = str.search(/[a-z]/ig);
        if (chk_num < 0 || chk_eng < 0) {
            return false;
        }
        return true;
    }

    function checkPwd(value) {
        checkPwdFc();
        return value;
    }

    function checkPwdFc() {
        var flag = true;
        var pwd = $("#password").val();

        if (!checkPwdVal()) {
            flag = false;
        }
        if (!ctnuCheck(pwd)) { //연속성체크
            flag = false;
        }
        if (!qwertyCheck(pwd)) { //키보드상 연속글자 체크
            flag = false;
        };

        if(pwd == $("#userId").val()){ // 아이디와 동일여부 체크
            flag = false;
        };

        if (flag == true) {
            $("#pwd-success").text("사용가능한 비밀번호입니다.");
            $("#pwd-danger").text("");
            return flag;
        }
        else {
            $("#pwd-danger").text("사용 불가능한 비밀번호입니다.");
            $("#pwd-success").text("");
            return flag;
        }
    }

    function checkPwdVal() {
        var form = $("#agreeForm")[0];
        var v = new MiyaValidator(form);
        v.add("password", {
            required: true,
            //pattern: "^([a-zA-Z!@#$%^&*()_+=<>?0-9]{6,16})$",
            pattern: "^.*(?=.{8,16})(?=.*[0-9!@#$%^&*()_+=<>?])(?=.*[a-zA-Z]).*$"
        });
        var result = v.validate();
        if (!result) {
            v.getErrorElement().focus();
            return false;
        }
        return true;
    }

    function ctnuCheck(pwdNew) {
        var SamePass_0 = 0; //동일문자 카운트
        var SamePass_1 = 0; //연속성(+) 카운트
        var SamePass_2 = 0; //연속성(-) 카운트

        var chr_pass_0;
        var chr_pass_1;
        var chr_pass_2;

        for (var i=0; i < pwdNew.length; i++) {
            chr_pass_0 = pwdNew.charAt(i);
            chr_pass_1 = pwdNew.charAt(i+1);
            //동일문자 카운트
            if (chr_pass_0 == chr_pass_1) {
                SamePass_0 = SamePass_0 + 1;
            }
            chr_pass_2 = pwdNew.charAt(i+2);
            //연속성(+) 카운드
            if (chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == 1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == 1) {
                SamePass_1 = SamePass_1 + 1;
            }
            //연속성(-) 카운드
            if (chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == -1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == -1) {
                SamePass_2 = SamePass_2 + 1;
            }
        }
        if (SamePass_0 > 1) {
            //alert("동일문자를 3번 이상 사용할 수 없습니다.");
            return false;
        }
        if (SamePass_1 > 1 || SamePass_2 > 1) {
            //alert("연속된 문자열(111 또는 aaa, 123 또는 abc 등)을\n 3자 이상 사용 할 수 없습니다.");
            return false;
        }
        return true;
    }

    function qwertyCheck(pw) {
        var qwerty = "90-=qwertyuiop[]\asdfghjkl;'zxcvbnm,./~!@#$%^&*()_+QWERTYUIOP{}|ASDFGHJKL:ZXCVBNM<>?";
        var start = 4-1; // 연속글자수 - 1
        var seq = "_" + pw.slice(0, start);

        for (i=start; i < pw.length; i++) {
            seq = seq.slice(1) + pw.charAt(i);
            if (qwerty.indexOf(seq) > -1) {
                //alert("키보드상에 나란히 있는 4개의 문자를 연속으로 비밀번호로 사용하실 수 없습니다.");
                return false;
            }
        }
        return true;
    }

    function checkPwd2(value) {
        checkPwd2Fc();
        return value;
    }

    function checkPwd2Fc() {
        var flag = true;

        if (!checkPwd2Val()) {
            flag = false;
        }

        if (flag == true) {
            $("#pwd2-success").text("비밀번호가 일치합니다.");
            $("#pwd2-danger").text("");
            return flag;
        }
        else {
            $("#pwd2-danger").text("비밀번호가 일치하지 않습니다.");
            $("#pwd2-success").text("");
            return flag;
        }
    }

    function checkPwd2Val(){
        var form = $("#agreeForm")[0];
        var v = new MiyaValidator(form);
        v.add("password2", {
            match: "password"
        });
        var result = v.validate();
        if (!result) {
            v.getErrorElement().focus();
            return false;
        }
        return true;
    }

    function checkEmailFc() {
        $.ajaxSetup({
            async: true
        });
        if (checkEmail()) {
            var flag = true;

            $.ajaxSetup({
                async: false
            });
            $.post(
                "/edu/member/checkDupEmail.json",
                {email : $("#email").val()},
                function(data)
                {
                    if (data.resultCode == "success") {
                        if (data.emailCnt > 0) {
                            alert("이미 가입한 이메일입니다.");
                            $("#email").val("");
                            flag = false;
                        }
                    }
                },"json"
            );
        }
        else {
            flag = false;
        }

        if (flag == true) {
            return flag;
        }
        else {
            return flag;
        }
    }

    function checkEmail() {
        var form = $("#agreeForm")[0];
        var v = new MiyaValidator(form);

        v.add("email", {
            required: true,
            span: 1,
            glue: "",
            option: "email"
        });

        var result = v.validate();
        if (!result) {
            alert(v.getErrorMessage());
            v.getErrorElement().focus();
            return false;
        }
        return true;
    }

    function checkMbtlnumFc() {
        $.ajaxSetup({
            async: true
        });

        if (checkMbtlnum()) {
            var flag = true;

            $.ajaxSetup({
                async: false
            });
            $.post(
                "/edu/member/checkDupMbtlnum.json",
                {mbtlnum : $("#mbtlnum").val()},
                function(data)
                {
                    if (data.resultCode == "success") {
                        if (data.mbtlnumCnt > 0) {
                            alert("이미 가입한 핸드폰번호입니다.");
                            $("#mbtlnum").val("");
                            flag = false;
                        }
                    }
                },"json"
            );
        }
        else {
            flag = false;
        }

        if (flag == true) {
            return flag;
        }
        else {
            return flag;
        }
    }

    function checkMbtlnum() {
        var form = $("#agreeForm")[0];
        var v = new MiyaValidator(form);

        v.add("mbtlnum", {
            required : true,
            span : 1,
            glue : "",
            option : "handphone"
        });

        var result = v.validate();
        if (!result) {
            alert(v.getErrorMessage());
            v.getErrorElement().focus();
            return false;
        }
        return true;
    }

    function checkParntsMbtlnum() {
        var form = $("#agreeForm")[0];
        var v = new MiyaValidator(form);

        v.add("parntsMbtlnum", {
            required : true,
            span : 3,
            glue : "-",
            option : "handphone"
        });

        var result = v.validate();
        if (!result) {
            alert(v.getErrorMessage());
            v.getErrorElement().focus();
            return false;
        }
        return true;
    }

    function checkForm() {
        var form = $("#agreeForm")[0];
        var v = new MiyaValidator(form);

        if (!checkIdFc()) {
            alert("사용 불가능한 아이디입니다.");
            $("#userId").focus();
            return;
        }

        if (!checkPwdFc()) {
            alert("사용 불가능한 비밀번호입니다.");
            $("#password").focus();
            return;
        }

        if (!checkPwd2Fc()) {
            alert("비밀번호가 일치하지 않습니다.");
            $("#password2").focus();
            return;
        }

        v.add("userNm", { required: true });
        v.add("sex",    { required: true });
        v.add("brthdy", { required: true });
        v.add("email",  { required: true });
        v.add("job",    { required: true });

        /*
        v.add("checkbox-p-1", { required: true });
        v.add("checkbox-p-2", { required: true });
        v.add("checkbox-p-3", { required: true });
        v.add("checkbox-p-4", { required: true });
        */

        v.add("checkbox-p-6", { required: true });
        v.add("checkbox-p-7", { required: true });

        var result = v.validate();

        if (!result) {
            alert(v.getErrorMessage());
            v.getErrorElement().focus();
            return;
        }

        if (mberSe == "01") {
            if ($("#emailAuthAt").val() == "" && $("#mbtlnumAuthAt").val() == "") {
                alert("이메일, 휴대폰 1개이상 인증해야 합니다.");
                return;
            }

            if (!checkEmailFc()) {
                $("#email").focus();
                return;
            }
        }

        if ($("#mbtlnumAuthAt").val() == "") { // 휴대폰인증 안했을시 체크(인증할때 자동체크)
            alert("휴대폰 인증을 진행해 주세요.");
            $("#mbtlnum").focus();
            return;
        }else{
            if (!checkMbtlnumFc()) {
                $("#mbtlnum").focus();
                return;
            }
        }

        if ($("#parntsAgreAt").val() == "Y") {
            v.add("parntsNm", { required: true });

            if ($("#parntsMbtlnumAuthAt").val() == "") {
                if (!checkParntsMbtlnum()) {
                    $("#parntsMbtlnum").focus();
                    return;
                }

                alert("보호자 휴대폰번호를 인증해야 합니다.");
                return;
            }
        }

        if (!confirm("등록하시겠습니까?")) {
            return;
        }

        form.submit();
    }

    function check_txt(value) {
        if (isNaN(value)) {
            alert("숫자로만 입력하셔야 합니다.");
            return "";
        }
        else {
            return value;
        }
    }

    window.onload = function(){
        $('#mbtlnum').keyup(function (event) {
            event = event || window.event;
            var _val = this.value.trim();
            this.value = autoHypenTel(_val);
        });

        $('#parntsMbtlnum').keyup(function (event) {
            event = event || window.event;
            var _val = this.value.trim();
            this.value = autoHypenTel(_val);
        });

        $('#brthdy').keyup(function (event) {
            event = event || window.event;
            var _val = this.value.trim();
            this.value = autoHypenBrthdy(_val);
        });
    };

    function autoHypenTel(str) {
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';

        if (str.substring(0, 2) == "02") {
            // 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
            if (str.length < 3) {
                return str;
            } else if (str.length < 6) {
                tmp += str.substr(0, 2);
                tmp += '-';
                tmp += str.substr(2);
                return tmp;
            } else if (str.length < 10) {
                tmp += str.substr(0, 2);
                tmp += '-';
                tmp += str.substr(2, 3);
                tmp += '-';
                tmp += str.substr(5);
                return tmp;
            } else {
                tmp += str.substr(0, 2);
                tmp += '-';
                tmp += str.substr(2, 4);
                tmp += '-';
                tmp += str.substr(6, 4);
                return tmp;
            }
        } else {
            // 핸드폰 및 다른 지역 전화번호 일 경우
            if (str.length < 4) {
                return str;
            } else if (str.length < 7) {
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3);
                return tmp;
            } else if (str.length < 11) {
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 3);
                tmp += '-';
                tmp += str.substr(6);
                return tmp;
            } else {
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 4);
                tmp += '-';
                tmp += str.substr(7);
                return tmp;
            }
        }

        return str;
    }

    function autoHypenBrthdy(str) {
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';

        if (str.length < 5) {
            return str;
        } else if (str.length < 7) {
            tmp += str.substr(0, 4);
            tmp += '-';
            tmp += str.substr(4);
            return tmp;
        } else if (str.length < 9) {
            tmp += str.substr(0, 4);
            tmp += '-';
            tmp += str.substr(4, 2);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        } else {
            tmp += str.substr(0, 4);
            tmp += '-';
            tmp += str.substr(4, 2);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        }

        return str;
    }
</script>

<div class="col-center mw-400" style="margin-top: 30px;">
    <div class="cb_inner new_join_box">
        <h1 class="fs36 tit_txt txt_ct">회원가입</h1>

        <div class="">
            <div class="login_form">
                <form id="agreeForm" name="agreeForm" action="/edu/userMember/joinMember.do" method="post" novalidate="novalidate">
                    <input type="hidden" name="menuNo" value="${paramVO.menuNo}" />
                    <input type="hidden" name="snsAuthSe" value='<c:out value="${user.authSe}"/>' />
                    <input type="hidden" name="mberSe" id="mberSe" value='<c:out value="${user.mberSe}"/>' />
                    <input type="hidden" name="agreAt2" id="agreAt2" value='N' />
                    <div class="">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="text" name="userId" id="userId"  value="" onkeyup="this.value=checkId(this.value)" class="form-control input_bline h45" placeholder="아이디" title="6~30자까지 영문자(소문자), 숫자 사용 가능합니다.">
                                <span class="table_text on" id="id-success"></span>
                                <span class="table_text off" id="id-danger"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="password" name="password" id="password" value="" class="form-control input_bline h45" placeholder="비밀번호"
                                       title="8~16자까지 영문 대/소문자, 숫자, 특수문자중 3개 이상의 조합.
                                            사용자 아이디와 동일한 비밀번호는 사용할 수 없습니다.
                                            동일문자, 연속문자는 사용할 수 없습니다. (예 aaa, abc 등)" onkeyup="this.value=checkPwd(this.value)">
                                <span class="table_text on" id="pwd-success"></span>
                                <span class="table_text off" id="pwd-danger"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="password" class="form-control input_bline h45" name="password2" id="password2" value="" onkeyup="this.value=checkPwd2(this.value)" title="비밀번호 확인" placeholder="비밀번호 확인">
                                <span class="table_text on" id="pwd2-success"></span>
                                <span class="table_text off" id="pwd2-danger"></span>
                            </div>
                        </div>
                        <div class="form-group h61" style="display: flex; justify-content: space-between;">
                            <div class="col-sm-12">
                                <input type="text" name="userNm" id="userNm" value="" placeholder="이름" class="form-control input_bline h45" title="이름">
                            </div>
                        </div>
                        <div class="form-group">
                            <div>
                                <span class="radio_box_con" style="padding-right: 10px;">
                                    <input type="radio" class="radio_style_0" name="sex" value="M" id="sex1" <c:if test="${user.sex eq 'M'}">checked="checked" </c:if> title="성별 라디오 선택 남자">
                                    <label for="sex1">남자</label>
                                </span>
                                <span class="radio_box_con">
                                    <input type="radio" class="radio_style_0" name="sex" value="W" id="sex2" <c:if test="${user.sex eq 'W'}">checked="checked" </c:if> title="성별 라디오 선택 여자">
                                    <label for="sex2">여자</label>
                                </span>
                            </div>
                        </div>
                        <div class="form-group h61">
                            <div class="col-sm-12">
                                <input type="text" name="brthdy" id="brthdy" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" maxlength="10" value="" class="form-control input_bline h45" placeholder="생년월일(8자리)" title="생년월일(8자리)">
                            </div>
                        </div>
                        <div class="form-group h61">
                            <div class="col-sm-12">
                                <input type="text" name="email" id="email" class="form-control input_bline h45" placeholder="Email" title="Email">
                                <input type="hidden" name="authEmailAt" id="authEmailAt" value="N" />
                                <input type="hidden" name="emailAuthAt" id="emailAuthAt"/>
                            </div>
                        </div>
                        <div class="form-group h61">
                            <div class="col-sm-12" style="display: flex; justify-content: space-between;">
                                <input type="text" class="form-control mob_no input_bline h45 col-sm-8" name="mbtlnum" id="mbtlnum" placeholder="휴대폰번호" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13">
                                <input type="hidden" name="mbtlnumAuthAt" id="mbtlnumAuthAt" />
                                <a href="javascript:crtfcPopup('02');" title="휴대폰 인증하기(새창열기)" class="btn btn-default btn-black" id="mbtlnumAuth" style="margin-right: 0; margin-bottom: 0;">인증하기</a>
                                <a href="#self" class="btn btn-success btn-black" id="mbtlnumAuthCmt" style="display:none background; margin-right: 0; margin-bottom: 0;">인증완료</a>
                                <a href="#self" class="btn btn-default btn-black" id="parntsAuthSameBtn" style="display:none; margin-right: 0; margin-bottom: 0;">보호자 휴대폰정보와 동일</a>
                            </div>
                        </div>
                        <div class="col-md-12 h61">
                            <div class="form-group">
                                <select class="form-control select_arrow" name="job" id="job" title="직업" style="padding-left: 5px;">
                                    <option value="" style="color:#fff;">직업선택</option>
                                    <c:forEach var="code" items="${COM056CodeList}" varStatus="status">
                                        <option value="${code.code}" title="<c:out value="${code.codeNm}"/>" ><c:out value="${code.codeNm}"/></option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-12 warning_box">
                            <div class="warning_text">
                                <span><span class="ally-hidden">필수입력</span><b>에듀코카</b> 정보수신 여부(선택)</span>
                            </div>
                            <div class="right_check_box">
                                <div class="input_wrap mb10">
                                    <span class="checkbox checkbox-primary d-inline">
                                        <input type="checkbox" name="checkbox-p-1" id="checkbox-p-1" title="에듀코카 정보수신 여부 체크- E-Mail로 수신하겠습니다.">
                                        <label for="checkbox-p-1" class="cr">E-mail로 수신하겠습니다.</label>
                                        <input type="hidden" name="emailAt" id="emailAt" value="N" >
                                    </span>
                                    <%--<span class="radio_box_con">
                                        <input type="radio" class="radio_style_0" name="emailAt" value="N" id="emailAt2" title="인재캠퍼스 정보수신 여부 라디오- E-Mail로 수신하지 않겠습니다.">
                                        <label for="emailAt2">E-mail로 수신하지 않겠습니다.</label>
                                    </span>--%>
                                </div>
                                <div class="input_wrap no_margin">
                                    <span class="checkbox checkbox-primary d-inline">
                                        <input type="checkbox" name="checkbox-p-2" id="checkbox-p-2"  title="에듀코카 정보수신 여부 체크- SMS로 수신하겠습니다.">
                                        <label for="checkbox-p-2" class="cr">SMS로 수신하겠습니다.</label>
                                        <input type="hidden" name="smsAt" id="smsAt" value="N" >
                                    </span>
                                    <%--<span class="radio_box_con">
                                        <input type="radio" class="radio_style_0" name="smsAt" value="N" id="smsAt2" title="인재캠퍼스 정보수신 여부 라디오- SMS로 수신하지 않겠습니다.">
                                        <label for="smsAt2">SMS로 수신하지 않겠습니다.</label>
                                    </span>--%>
                                </div>
                            </div>
                        </div>
<%--                        <div class="col-md-12 warning_box">
                            <div class="warning_text">
                                <span><span class="ally-hidden">필수입력</span><b>콘텐츠문화광장</b> 정보수신 여부</span>
                            </div>
                            <div class="right_check_box">
                                <div class="input_wrap mb10">
                                    <span class="checkbox checkbox-primary d-inline">
                                        <input type="checkbox" name="checkbox-p-3" id="checkbox-p-3" title="콘텐츠문화광장 정보수신 여부 체크- E-Mail로 수신하겠습니다.">
                                        <label for="checkbox-p-3" class="cr">E-mail로 수신하겠습니다.</label>
                                        <input type="hidden" name="concertEmailAt" id="concertEmailAt" value="N" >
                                    </span>--%>

                                    <%--<span class="radio_box_con">
                                        <input type="radio" class="radio_style_0" name="concertEmailAt" value="N" id="concertEmailAt2" title="콘텐츠문화광장 정보수신 여부 라디오 - E-Mail로 수신하지 않겠습니다.">
                                        <label for="concertEmailAt2">E-mail로 수신하지 않겠습니다.</label>
                                    </span>--%>
<%--                                </div>
                                <div class="input_wrap no_margin">
                                    <span class="checkbox checkbox-primary d-inline">
                                        <input type="checkbox" name="checkbox-p-4" id="checkbox-p-4"  title="콘텐츠문화광장 정보수신 여부 체크- SMS로 수신하겠습니다.">
                                        <label for="checkbox-p-4" class="cr">SMS로 수신하겠습니다.</label>
                                        <input type="hidden" name="concertSmsAt" id="concertSmsAt" value="N" >
                                    </span>--%>
                                    <%--<span class="radio_box_con">
                                        <input type="radio" class="radio_style_0" name="concertSmsAt" value="N" id="concertSmsAt2" title="콘텐츠문화광장 정보수신 여부 라디오 - SMS로 수신하지 않겠습니다.">
                                        <label for="concertSmsAt2">SMS로 수신하지 않겠습니다.</label>
                                    </span>--%>
 <%--                               </div>
                            </div>
                        </div>--%>

                    </div>
                    <div id="childDiv" style="display: none">
                        <input type="hidden" name="parntsAgreAt" id="parntsAgreAt" value="" />
                        <div class="form-group h61">
                            <div class="col-sm-12">
                                <input name="parntsNm" id="parntsNm" type="text" class="form-control input_bline h45" placeholder="보호자 이름">
                            </div>
                        </div>
                        <div class="form-group h61">
                            <div class="col-sm-12" style="display: flex; justify-content: space-between;">
                                <input type="text" class="form-control mob_no input_bline h45 col-sm-8" name="parntsMbtlnum" id="parntsMbtlnum" placeholder="보호자 휴대폰번호" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13">
                                <input type="hidden" name="parntsMbtlnumAuthAt" id="parntsMbtlnumAuthAt" />
                                <a href="javascript:parntsCrtfcPopup('02');" title="휴대폰 인증하기(새창열기)" class="btn btn-default btn-black" id="parntsMbtlnumAuth" style="margin-right: 0; margin-bottom: 0;">인증하기</a>
                                <a href="#self" class="btn btn-success btn-black" id="parntsMbtlnumAuthCmt" style="display:none; margin-right: 0; margin-bottom: 0;">인증완료</a>
                                <p>보호자의 휴대폰번호로 발송되는 인증번호를 입력하시어 인증하시기 바랍니다.</p>
                            </div>
                        </div>
                    </div>
                    <!-- 서비스 동의 -->
                    <div class="agree_new_box">
                        <h5>서비스 정책</h5>
                        <div class="bg_agree_box">
                            <!-- 전체동의 -->
                            <div class="input_wrap pb10 pt10" style="border-bottom: 1px solid #fff;">
                                <span class="checkbox checkbox-primary d-inline">
                                    <input type="checkbox" name="checkbox-p-5" id="checkbox-p-5" title="전체 동의">
                                    <label for="checkbox-p-5" class="cr">전체 동의</label>
                                </span>
                            </div>

                            <div class="input_wrap mb10">
                                <span class="checkbox checkbox-primary d-inline" style="padding: 0;">
                                    <input type="checkbox" name="checkbox-p-6" id="checkbox-p-6" title="이용약관 동의(필수)">
                                    <label for="checkbox-p-6" class="cr">이용약관 동의(필수)</label>
                                </span>
                                <button type="button" onclick="$('.layer_agree_wrap01').css({'display':'block'})">내용보기</button>
                            </div>
                            <div class="input_wrap mb10">
                                <span class="checkbox checkbox-primary d-inline" style="padding: 0;">
                                    <input type="checkbox" name="checkbox-p-7" id="checkbox-p-7" title="개인정보 수집 동의(필수)">
                                    <label for="checkbox-p-7" class="cr">개인정보 수집 동의(필수)</label>
                                </span>
                                <button type="button" onclick="$('.layer_agree_wrap02').css({'display':'block'})">내용보기</button>
                            </div>
                            <div class="input_wrap mb10">
                                <span class="checkbox checkbox-primary d-inline" style="padding: 0;">
                                    <input type="checkbox" name="checkbox-p-8" id="checkbox-p-8" title="개인정보 수집 동의(선택)">
                                    <label for="checkbox-p-8" class="cr">개인정보 수집 동의(선택)</label>
                                </span>
                                <button type="button" onclick="$('.layer_agree_wrap03').css({'display':'block'})">내용보기</button>
                            </div>
                        </div>

                        <!-- 회원가입 btn-->
                        <div class="join_btn_box"><a href="javascript:checkForm();" class="btn btn-default btn-black w100p h61">회원가입</a></div>

                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

<!-- 이용약관 동의 -->
<div class="layer_agree_wrap01" style=" width: 100%; height: 100%; top:0; left:0; position: fixed; background-color: rgb(0,0,0,0.5); z-index: 9999;">
    <div class="layer_agree_inner">
        <div class="layer_top">
            <button type="button" onclick="$('.layer_agree_wrap01').css({'display':'none'})" style="background: transparent;">닫기</button>
        </div>
        <!-- 이용약관 -->
        <div class="layer_contents">
            <div class="signup_agree_con">
                <h3>이용약관</h3>
                <div tabindex="0" class="agreeScr" style="font-size: 1.4rem; line-height: 2.05rem;">

                    <p class="h_title5">제 1장 총칙</p><br><br>
                    <p class="h_subtitle5">제 1조 (목적)</p>
                    <ul class="list_style_4 color_gray">
                        <li>
                            이 약관은 "에듀코카 (이하 "에듀코카"이라 한다.)에서 운영하는 웹서비스의 이용조건 및 절차에 관한 사항을 명시합니다.
                        </li>
                        <li>
                            회원가입에 대한 내용을 충분히 숙지하신 후 가입하여 주시고, 이 약관은 본 에듀코카에서 운영하는 모든 웹 서비스를 이용하는
                            모든 회원에게 적용되며 이를 읽고 이해하는 것은 귀하의 책임입니다.
                        </li>
                    </ul>
                    <p class="h_subtitle5">제 2조 약관의 공지 및 효력</p>
                    <ul class="list_style_4 color_gray">
                        <li>
                            이 약관의 내용은 웹서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력을 발생합니다.
                        </li>
                        <li>
                            에듀코카는 이 약관을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지함으로써 효력을 발생합니다.
                        </li>
                        <li>
                            회원가입이란 에듀코카에서 제공하는 웹서비스에 가입하는 것으로 웹서비스의 조건과 규정에 합의함을 의미하며,
                            에듀코카는 웹서비스의 조건과 조항을 항시 통고와 함께 또는 통고 없이 전부 또는 일부를 바꿀 권리를 갖습니다.
                            이런 변화에 대해 빠른 회신을 못하거나, 고지 받지 못했다는 사유로 이의를 제기할 수 없으므로 추후에 착오 없으시길 당부 드립니다.
                        </li>
                    </ul>
                    <p class="h_subtitle5">제3조 약관 외 준칙</p>
                    <ul class="list_style_4 color_gray no_decimal">
                        <li>
                            이 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 전자거래 기본법, 전자서명법, 통신판매법 및 기타 관계법령의 규정에 의합니다.
                        </li>
                    </ul>
                    <p class="h_subtitle5">제4조 용어의 정의</p>
                    <ul class="list_style_4 no_decimal mb_short">
                        <li>
                            이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
                        </li>
                    </ul>
                    <ul class="list_style_4 color_gray">
                        <li>회원 : 에듀코카의 웹서비스 이용에 관한 계약을 체결한 자</li>
                        <li>아이디(ID) : 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 에듀코카가 승인하는 문자와 숫자의 조합</li>
                        <li>비밀번호 : 회원이 통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합</li>
                        <li>탈퇴 : 회원이 서비스 이용 이후 그 이용계약을 종료 시키는 의사표시</li>
                        <li>
                            휴면 계정 : 최근 3년동안 로그인 하지 않은 이용자로 가입한 회원을 정의 휴면계정에 해당하는 회원은  개인정보의 보호 및 관리를 위하여
                            개인정보 및 학습이력이 삭제될 수 있습니다.
                            (단, 휴면계정 일괄 삭제 후에는 기존에 사용하던 아이디로 에듀코카 사이트에 재가입할 수 없으니 이점 유의하시기 바랍니다.)
                        </li>
                    </ul>
                    <p class="h_title5">제 2장 서비스 이용계약</p><br><br>
                    <p class="h_subtitle5">제 1조 이용 계약의 성립</p>
                    <ul class="list_style_4 color_gray">
                        <li>서비스 가입 신청 시 본 약관을 읽고 "동의함" 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다.</li>
                        <li>이용계약은 회원 정보 입력 후 완료를 선택하게 되면 성립합니다.</li>
                        <li>회원에 가입하여 서비스를 이용하고자 하는 희망자는 에듀코카에서 요청하는 개인신상정보를 제공해야 합니다.</li>
                        <li>이용계약은 회원 1인당 1개의 ID로 체결하는 것을 원칙으로 합니다.</li>
                    </ul>
                    <p class="h_subtitle5">제2조 이용신청</p>
                    <ul class="list_style_4 color_gray no_decimal">
                        <li>이용신청은 온라인상의 가입신청 양식에 준합니다.</li>
                    </ul>
                    <p class="h_subtitle5">제3조 이용신청의 승낙</p>
                    <ul class="list_style_4 color_gray no_decimal">
                        <li>회원이 제2장 제2조에서 정한 모든 사항을 정확히 기재하여 이용신청을 하였을 때 승낙합니다.</li>
                    </ul>
                    <p class="h_subtitle5">제4조 이용신청의 불 승낙</p>
                    <ul class="list_style_4">
                        <li>
                            웹서비스는 다음에 해당하는 이용신청에 대하여 등록을 거부하거나 등록 후에라도 회원에게 고지하지 않고 회원정보를 수정 또는 삭제할 수 있습니다.
                            <ul class="list_style_4 color_gray no_decimal inner_list">
                                <li>1) 다른 사람의 명의를 사용하여 신청하였을 경우</li>
                                <li>2) 이용 신청 시 필요내용을 허위로 기재하여 신청하였을 경우</li>
                                <li>3) 사회의 안녕질서 및 미풍양속을 저해할 목적으로 신청하였을 경우</li>
                                <li>4) 신용정보의 이용과 보호에 관한 법률에 의거 신용불량자로 등록되어 있는 경우</li>
                                <li>5) 기타 이용신청자의 귀책사유로 이용승낙이 곤란한 경우</li>
                            </ul>
                        </li>
                        <li>
                            에듀코카는 다음에 해당하는 이용신청에 대하여 승낙 제한 사유가 해소될 때까지 승낙을 하지 않을 수 있습니다.
                            <ul class="list_style_4 color_gray no_decimal inner_list">
                                <li>1) 에듀코카가 설비의 여유가 없는 경우</li>
                                <li>2) 에듀코카의 기술상 지장이 있는 경우</li>
                                <li>3) 기타 에듀코카가 필요하다고 인정되는 경우</li>
                            </ul>
                        </li>
                        <li>
                            에듀코카는 이용신청이 불 승낙 되거나 승낙을 제한하는 경우에는 이를 이용신청자에게 알려야 합니다.
                        </li>
                    </ul>
                    <p class="h_subtitle5">제5조 계약사항의 변경</p>
                    <ul class="list_style_4 color_gray no_decimal">
                        <li>
                            회원은 이용 신청 시 기재한 사항이 변경되었을 경우에는 온라인 수정을 해야 합니다.
                        </li>
                    </ul>
                    <p class="h_subtitle5">제6조 회원정보의 공유</p>
                    <ul class="list_style_4 color_gray">
                        <li>
                            에듀코카가 더 좋은 서비스를 위하여 타 기관과 제휴, 인수, 분사, 합병 시 회원의 정보는 공유될 수 있다.
                        </li>
                        <li>
                            각종 경품이 제공되는 이벤트의 경우, 경품 협찬사와의 협의에 의해 당첨자 등록정보를 공유할 수 있습니다.
                        </li>
                        <li>
                            1항, 2항의 사유가 발생할 경우 에듀코카는 회원에게 해당 사실을 공지해야 합니다.
                        </li>
                    </ul>
                    <p class="h_subtitle5">제7조 추가적인 회원정보의 사용</p>
                    <ul class="list_style_4 color_gray no_decimal">
                        <li>
                            에듀코카는 회원이 커뮤니티 서비스 이용 시 제공하는 회원의 추가 정보를 관리용, 통계용의 정보로만 사용합니다.
                        </li>
                    </ul>
                    <p class="h_subtitle5">제8조 정보의 제공</p>
                    <ul class="list_style_4 color_gray no_decimal">
                        <li>
                            에듀코카는 회원이 서비스 이용 및 에듀코카의 각종 행사 또는 정보서비스에 대해서는
                            전자우편이나 서신우편 등의 방법으로 회원들에게 제공할 수 있습니다.
                        </li>
                    </ul>
                    <p class="h_subtitle5">제9조 개인정보의 보호</p>
                    <ul class="list_style_4 color_gray">
                        <li>
                            에듀코카는 이용자의 개인정보를 수집할 때 반드시 당해 이용자의 동의를 받습니다.
                        </li>
                        <li>
                            개인정보를 내부 관리용, 통계용 및 제2장 제6조 이외의 용도로 이용하거나 이용자의 동의 없는 제3자에게 제공, 분실, 도난, 유출,
                            변조시 그에 따른 이용자의 피해에 대한 모든 책임은 에듀코카가 집니다.
                        </li>
                    </ul>
                    <p class="h_title5">제 3장 서비스 이용</p><br><br>
                    <p class="h_subtitle5">제1조 서비스 이용</p>
                    <ul class="list_style_4 color_gray no_decimal">
                        <li>
                            서비스 이용은 에듀코카의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간을 원칙으로 합니다.
                            단, 정기점검 등 서비스 개선을 위하여 에듀코카가 필요하다고 인정되는 때에는 미리 공지한 후 서비스가 일시 중지될 수 있습니다.
                        </li>
                    </ul>
                    <p class="h_subtitle5">제2조 서비스 제공의 중지</p>
                    <ul class="list_style_4 no_decimal">
                        <li>
                            에듀코카는 다음 항에 해당하는 경우 서비스의 제공을 중지할 수 있습니다.
                            <ul class="list_style_4 color_gray inner_list upper_decimal">
                                <li>설비의 보수 등을 위하여 부득이한 경우</li>
                                <li>전기통신사업법에 규정된 기간통신사업자가 전기통신서비스를 중지하는 경우</li>
                                <li>기타 귀사가 서비스를 제공할 수 없는 사유가 발생한 경우</li>
                            </ul>
                        </li>
                    </ul>
                    <p class="h_subtitle5">제3조 파일정보의 소거 및 회원 권한의 삭제</p>
                    <ul class="list_style_4 color_gray">
                        <li>에듀코카는 서비스용 설비의 용량에 여유가 없다고 판단되면 필요에 따라 회원의 정보 및 신상정보를 삭제할 수 있습니다.</li>
                        <li>에듀코카는 서비스 운영상 또는 보안에 문제가 있다고 판단되는 회원의 정보 및 신상정보를 사전통지 없이 검색할 수 있습니다.</li>
                        <li>제1항의 경우에 에듀코카는 해당 사항을 사전에 서비스 또는 전자우편을 통하여 공지합니다.</li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</div>

<!-- 개인정보 수집 동의(필수) -->
<div class="layer_agree_wrap02" style=" width: 100%; height: 100%; top:0; left:0; position: fixed; background-color: rgb(0,0,0,0.5); z-index: 9999;">
    <div class="layer_agree_inner">
        <div class="layer_top">
            <button type="button" onclick="$('.layer_agree_wrap02').css({'display':'none'})" style="background: transparent;">닫기</button>
        </div>
        <!-- 개인정보 -->
        <div class="layer_contents">
            <div class="signup_agree_con">
                <h3>(필수) 개인정보 수집 및 이용동의</h3>
                <div tabindex="0" class="agreeScr" style="font-size: 1.4rem; line-height: 2.05rem;">
                    <div class="personal">
                        <div class="indent01">
                            <p>한국콘텐츠진흥원 에듀코카(EDUKOCCA)는 회원가입, 원활한 고객 상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 필수정보를 수집합니다.</p>
                            <br><br>
                            <h5>개인정보보호를 위한 이용자 동의사항</h5>
                            <ul class="li_style02">
                                <li><span class="dot">1. 수집•이용 목적 : 회원제 서비스 제공 및 고객 맞춤형 서비스 목적</span></li>
                                <li><span class="dot">2. 개인정보 수집 항목</span></li>
                                <li><span class="dot">- 필수항목 : 아이디, 비밀번호, 이름, 성별, 생년월일, E-mail, 휴대폰번호, 직업</span></li>
                                <li>
                                    <span class="dot" style="color: red; text-decoration: underline; text-decoration-color:red; font-weight: 600;"">
                                        3. 개인정보 보유 및 이용기간 : 3년 혹은 회원 탈퇴 후 즉시 삭제
                                    </span>
                                </li>
                                <li><span class="dot">4. 자동 수집 정보 : 인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다. IP주소, 쿠키, MAC주소, 서비스 이용기록, 방문기록, 불량 이용기록 등</span></li>
                                <li><span class="dot">5. 동의거부권 및 불이익 : 개인정보 수집 및 이용에 대해 동의를 거부할 권리가 있습니다. 단, 동의 거부 시에는 회원가입 서비스의 이용이 제한됩니다.</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 개인정보 수집 동의(선택) -->
<div class="layer_agree_wrap03" style=" width: 100%; height: 100%; top:0; left:0; position: fixed; background-color: rgb(0,0,0,0.5); z-index: 9999;">
    <div class="layer_agree_inner">
        <div class="layer_top">
            <button type="button" onclick="$('.layer_agree_wrap03').css({'display':'none'})" style="background: transparent;">닫기</button>
        </div>
        <!-- 개인정보 -->
        <div class="layer_contents">
            <div class="signup_agree_con">
                <h3>(선택) 개인정보 수집 및 이용동의</h3>
                <div tabindex="0" class="agreeScr" style="font-size: 1.4rem; line-height: 2.05rem;">
                    <div class="personal">
                        <div class="indent01">
                            <p>한국콘텐츠진흥원은 회원가입, 원활한 고객 상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 선택정보를 수집합니다.</p>
                            <br><br>
                            <h5>개인정보보호를 위한 이용자 동의사항</h5>
                            <ul class="li_style02">
                                <li><span class="dot">1. 수집•이용 목적 : 회원제 서비스 제공 및 고객 맞춤형 서비스 목적</span></li>
                                <li><span class="dot">2. 개인정보 수집 항목</span></li>
                                <li><span class="dot">- 선택항목 : 에듀코카 정보수신 여부</span></li>
                                <li>
                                    <span class="dot" style="color: red; text-decoration: underline; text-decoration-color:red; font-weight: 600;">
                                        3. 개인정보 보유 및 이용기간 : 3년 혹은 회원 탈퇴 후 즉시 삭제
                                    </span>
                                </li>
                                <li><span class="dot">4. 동의거부권 및 불이익 : 개인정보 수집 및 이용에 대해 동의를 거부할 권리가 있습니다. 단 선택정보 사항을 동의하지 않더라도 서비스 이용이 가능합니다.</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .sub_section .sub_contents_body .warning_text > span{background-image: none; padding-left: 0;}
    .radio_box_con{padding-right: 0;}
    .form-group input[type="text"], .form-group input[type="password"], .form-group input[type="email"], .form-group .form-control
    {border-color:transparent; border-bottom-color: #707070 !important; height: 45px !important; background-color: transparent;}
    .sub_section .sub_contents_body input[type="checkbox"]:checked + label{ background-image: none;}
    .sub_section .sub_contents_body input[type="checkbox"] + label{background: none;}
    .right_check_box{padding: 20px 0;}
    .h61{height: 61px;}


    .select_arrow{position: relative;}
    .select_arrow{background: url("/edu/images/bm/select_style_2_arrow.png") no-repeat right 21px center !important;}

    @media all and (max-width:640px) {
        .sub_section .sub_contents_body .warning_text{text-align: left;}
        .warning_text b{display: block;}
    }

</style>
