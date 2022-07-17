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
            } else {
                $("#checkbox-p-6").prop("checked", false);
                $("#checkbox-p-7").prop("checked", false);
            }
        });

        $("#checkbox-p-6").click(function() {
            if($("#checkbox-p-6").is(":checked") && $("#checkbox-p-7").is(":checked")) {
                $("#checkbox-p-5").prop("checked", true);
            } else {
                $("#checkbox-p-5").prop("checked", false);
            }
        });

        $("#checkbox-p-7").click(function() {
            if($("#checkbox-p-6").is(":checked") && $("#checkbox-p-7").is(":checked")) {
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

        $("#checkbox-p-3").click(function() {
            if($("#checkbox-p-3").is(":checked")) {
                $("#concertEmailAt").val("Y");
            } else {
                $("#concertEmailAt").val("N");
            }
        });

        $("#checkbox-p-4").click(function() {
            if($("#checkbox-p-4").is(":checked")) {
                $("#concertSmsAt").val("Y");
            } else {
                $("#concertSmsAt").val("N");
            }
        });

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
                                <span><span class="ally-hidden">필수입력</span><b>인재캠퍼스</b> 정보수신 여부</span>
                            </div>
                            <div class="right_check_box">
                                <div class="input_wrap mb10">
                                    <span class="checkbox checkbox-primary d-inline">
                                        <input type="checkbox" name="checkbox-p-1" id="checkbox-p-1" title="인재캠퍼스 정보수신 여부 체크- E-Mail로 수신하겠습니다.">
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
                                        <input type="checkbox" name="checkbox-p-2" id="checkbox-p-2"  title="인재캠퍼스 정보수신 여부 체크- SMS로 수신하겠습니다.">
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
                        <div class="col-md-12 warning_box">
                            <div class="warning_text">
                                <span><span class="ally-hidden">필수입력</span><b>콘텐츠문화광장</b> 정보수신 여부</span>
                            </div>
                            <div class="right_check_box">
                                <div class="input_wrap mb10">
                                    <span class="checkbox checkbox-primary d-inline">
                                        <input type="checkbox" name="checkbox-p-3" id="checkbox-p-3" title="콘텐츠문화광장 정보수신 여부 체크- E-Mail로 수신하겠습니다.">
                                        <label for="checkbox-p-3" class="cr">E-mail로 수신하겠습니다.</label>
                                        <input type="hidden" name="concertEmailAt" id="concertEmailAt" value="N" >
                                    </span>

                                    <%--<span class="radio_box_con">
                                        <input type="radio" class="radio_style_0" name="concertEmailAt" value="N" id="concertEmailAt2" title="콘텐츠문화광장 정보수신 여부 라디오 - E-Mail로 수신하지 않겠습니다.">
                                        <label for="concertEmailAt2">E-mail로 수신하지 않겠습니다.</label>
                                    </span>--%>
                                </div>
                                <div class="input_wrap no_margin">
                                    <span class="checkbox checkbox-primary d-inline">
                                        <input type="checkbox" name="checkbox-p-4" id="checkbox-p-4"  title="콘텐츠문화광장 정보수신 여부 체크- SMS로 수신하겠습니다.">
                                        <label for="checkbox-p-4" class="cr">SMS로 수신하겠습니다.</label>
                                        <input type="hidden" name="concertSmsAt" id="concertSmsAt" value="N" >
                                    </span>
                                    <%--<span class="radio_box_con">
                                        <input type="radio" class="radio_style_0" name="concertSmsAt" value="N" id="concertSmsAt2" title="콘텐츠문화광장 정보수신 여부 라디오 - SMS로 수신하지 않겠습니다.">
                                        <label for="concertSmsAt2">SMS로 수신하지 않겠습니다.</label>
                                    </span>--%>
                                </div>
                            </div>
                        </div>

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

<!-- 개인정보 수집 동의 -->
<div class="layer_agree_wrap02" style=" width: 100%; height: 100%; top:0; left:0; position: fixed; background-color: rgb(0,0,0,0.5); z-index: 9999;">
    <div class="layer_agree_inner">
        <div class="layer_top">
            <button type="button" onclick="$('.layer_agree_wrap02').css({'display':'none'})" style="background: transparent;">닫기</button>
        </div>
        <!-- 개인정보 -->
        <div class="layer_contents">
            <div class="signup_agree_con">
                <h3>개인정보 수집 및 이용동의</h3>
                <div tabindex="0" class="agreeScr" style="font-size: 1.4rem; line-height: 2.05rem;">

                    <div class="personal">
                        <div class="indent01">
                            <p>한국콘텐츠진흥원(이하 콘진원)는 개인정보 보호법 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을 수립․공개합니다.</p>
                            <br><br>
                            <h5>제1조(개인정보의 처리목적 및 보유기간)</h5>
                            <ul class="li_style02">
                                <li><span class="dot">① 콘진원은 대국민 서비스 제공 및 민원처리, 소관업무 수행 등의 목적으로 필요에 의한 최소한으로 개인정보를 처리하고 있습니다.</span></li>
                                <li><span class="dot">② 콘진원에서 처리하는 개인정보는 수집·이용 목적으로 명시한 범위 내에서 처리하며, 개인정보보호법 및 관련 법령에서 정하는 보유기간을 준용하여 이행하고 있습니다.</span></li>
                                <li><span class="dot">③ 콘진원이 등록·공개하는 개인정보파일의 처리목적 및 보유기간은 다음과 같습니다.</span></li>
                            </ul>
                            <div class="conTable_wrap scroll">
                                <table class="conTable tdCenter">
                                    <caption>개인정보파일의 처리목적 및 보유기간 | 개인정보파일명, 처리목적, 보유기간, 부서, 홈페이지 주소로 구분되는 표</caption>
                                    <colgroup>
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th scope="col">개인정보파일명</th>
                                        <th scope="col">처리목적</th>
                                        <th scope="col">보유기간</th>
                                        <th scope="col">부서</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>홈페이지 회원 명부</td>
                                        <td>홈페이지 회원 관리</td>
                                        <td>2년</td>
                                        <td>정보보안팀</td>
                                    </tr>
                                    <tr>
                                        <td>대표 홈페이지 신청‧상담 명부</td>
                                        <td>신청‧상담 정보 관리</td>
                                        <td>3년</td>
                                        <td>정보보안팀</td>
                                    </tr>
                                    <tr>
                                        <td>게임국가기술자격검정 회원/합격 명부</td>
                                        <td>국가기술자격검정 시험 운영</td>
                                        <td>준영구</td>
                                        <td>게임기반조성팀</td>
                                    </tr>
                                    <tr>
                                        <td>연구개발정보관리시스템 회원</td>
                                        <td>연구개발정보관리시스템 운영</td>
                                        <td>준영구</td>
                                        <td>연구개발기획단</td>
                                    </tr>
                                    <tr>
                                        <td>한국콘텐츠아카데미 회원</td>
                                        <td>홈페이지 회원 관리</td>
                                        <td>3년</td>
                                        <td>교육운영팀</td>
                                    </tr>
                                    <tr>
                                        <td>온라인 상담 및 조정신청 명부</td>
                                        <td>분쟁조정 신청‧상담 정보 관리</td>
                                        <td>5년</td>
                                        <td>사회적가치추진단</td>
                                    </tr>
                                    <tr>
                                        <td>대중문화예술종합정보시스템 회원</td>
                                        <td>홈페이지 회원 관리</td>
                                        <td>3년</td>
                                        <td>사회적가치추진단</td>
                                    </tr>
                                    <tr>
                                        <td>대중문화예술기획업 종사경력 증명서류 발급</td>
                                        <td>대중문화예술기획업 종사경력 증명서 발급</td>
                                        <td>준영구</td>
                                        <td>사회적가치추진단</td>
                                    </tr>
                                    <tr>
                                        <td>대중문화예술종합정보시스템 법률자문 신청명부</td>
                                        <td>법률자문신청 정보 관리</td>
                                        <td>3년</td>
                                        <td>사회적가치추진단</td>
                                    </tr>
                                    <tr>
                                        <td>대중문화예술종합정보시스템 심리상담 신청명부</td>
                                        <td>심리상담신청 정보 관리</td>
                                        <td>3년</td>
                                        <td>사회적가치추진단</td>
                                    </tr>
                                    <tr>
                                        <td>대중문화예술 분야 온라인 암표신고 신청 명부</td>
                                        <td>온라인암표신고 정보 관리</td>
                                        <td>3년</td>
                                        <td>사회적가치추진단</td>
                                    </tr>
                                    <tr>
                                        <td>콘텐츠수출마케팅플랫폼 회원</td>
                                        <td>콘텐츠수출마케팅플랫폼 회원</td>
                                        <td>회원탈퇴후 즉시</td>
                                        <td>해외사업지원단</td>
                                    </tr>
                                    <tr>
                                        <td>스토리움 홈페이지 회원</td>
                                        <td>스토리움 홈페이지 회원</td>
                                        <td>3년</td>
                                        <td>만화스토리산업팀</td>
                                    </tr>
                                    <tr>
                                        <td>콘텐츠도서관 회원명부</td>
                                        <td>도서관 회원 관리</td>
                                        <td>준영구</td>
                                        <td>정보분석팀</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <p>※ 콘진원의 개인정보파일 등록사항은 개인정보보호위원회 개인정보보호 종합지원 포털(www.privacy.go.kr) → 개인정보민원 → 개인정보열람등 요구 → 개인정보파일 기관명에 “한국콘텐츠진흥원” 입력하여도 조회가 가능합니다.</p>
                            <br><br>

                            <h5>제2조(개인정보의 제3자 제공)</h5>
                            <ul class="li_style02">
                                <li><span class="dot">① 콘진원은 원칙적으로 정보주체의 개인정보를 수집·이용 목적으로 명시한 범위 내에서 처리하며, 다음의 경우를 제외하고는 정보주체의 사전 동의 없이는 본래의 목적 범위를 초과하여 처리하거나 제3자에게 제공하지 않습니다.</span></li>
                                <li>1. 정보주체로부터 별도의 동의를 받는 경우</li>
                                <li>2. 다른 법률에 특별한 규정이 있는 경우</li>
                                <li>3. 정보주체 또는 그 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소불명 등으로 사전 동의를 받을 수 없는 경우로서 명백히 정보주체 또는 제3자의 급박한 생명, 신체,<br>&nbsp;&nbsp;&nbsp;&nbsp;
                                    재산의 이익을 위하여 필요하다고 인정되는 경우</li>
                                <li>4. 통계작성 및 학술연구 등의 목적을 위하여 필요한 경우로서 특정 개인을 알아볼 수 없는 형태로 개인정보를 제공하는 경우</li>
                                <li>5. 개인정보를 목적 외의 용도로 이용하거나 이를 제3자에게 제공하지 아니하면 다른 법률에서 정하는 소관 업무를 수행할 수 없는 경우로서 보호위원회의 심의·의결을 거친 경우</li>
                                <li>6. 조약, 그 밖의 국제협정의 이행을 위하여 외국정부 또는 국제 기구에 제공하기 위하여 필요한 경우</li>
                                <li>7. 범죄의 수사와 공소의 제기 및 유지를 위하여 필요한 경우</li>
                                <li>8. 법원의 재판업무 수행을 위하여 필요한 경우</li>
                                <li>9. 형 및 감호, 보호처분의 집행을 위하여 필요한 경우</li>
                                <li><span class="dot">② 콘진원은 등록된 개인정보파일에 대하여 제1항 각호의 경우를 제외하고 제3자에게 제공하고 있지 않습니다.</span></li>
                                <li><span class="dot">③ 콘진원은 제1항 각호의 경우에 해당하여 제3자 제공이 이루어지면 법령에서 허용하는 범위 내에서 제공 사실을 공지 또는 통보하겠습니다.</span></li>
                                <li><span class="dot">④ 콘진원에서 현재 제3자에게 제공하는 내용은 다음과 같습니다.</span></li>
                            </ul>
                            <div class="conTable_wrap scroll">
                                <table class="conTable tdCenter">
                                    <caption>개인정보의 제3자 제공 | 개인정보파일명, 제공 받는 자, 이용목적, 제공하는 개인정보 항목, 제공기간(제공일자)로 구분되는 표
                                    </caption>
                                    <colgroup>
                                        <col width="16%">
                                        <col>
                                        <col>
                                        <col>
                                        <col width="10%">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th scope="col">개인정보파일명</th>
                                        <th scope="col">제공 받는 자</th>
                                        <th scope="col">이용목적</th>
                                        <th scope="col">제공하는 개인정보 항목</th>
                                        <th scope="col">제공기간<br> (제공일자)</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>게임국가기술자격검정 회원/합격 명부</td>
                                        <td>국가기술자격 종목별 주무부처, 시/도 행정기관</td>
                                        <td>해당 종목에 대한 분기별 국가기술자격 취득자 정보 제공</td>
                                        <td class="alignleft">이름, 주민등록번호, 주소, 자격증번호, 합격일자</td>
                                        <td>1년 마다<br>
                                            갱신</td>
                                    </tr>
                                    <tr>
                                        <td>게임국가기술자격검정 회원/합격 명부</td>
                                        <td>병무청</td>
                                        <td>군복무와 관련된 국가기술자격 취득자 정보 제공</td>
                                        <td class="alignleft">이름, 주민등록번호, 주소, 자격증번호, 합격일자</td>
                                        <td>1년 마다<br>
                                            갱신</td>
                                    </tr>
                                    <tr>
                                        <td>연구개발정보관리시스템 회원</td>
                                        <td>과학기술정보통신부 및 한국과학기술정보연구원(KISTI)</td>
                                        <td>국가과학기술지식정보서비스(NTIS) 연계를 통한 R&amp;D사업 관리</td>
                                        <td class="alignleft">이름, 성별, 생년월일, 국가연구자번호, 과제별 참여율, 주소, 유선 및 휴대전화번호, 이메일, 소속기관/업체명, 학력 및 경력사항</td>
                                        <td>1년 마다<br>
                                            갱신</td>
                                    </tr>
                                    <tr>
                                        <td>연구개발정보관리시스템 회원</td>
                                        <td>통합 Ezbaro</td>
                                        <td>연구비 협약관리부터<br>집행,정산에 관련한 국가연구비 통합관리</td>
                                        <td class="alignleft">이름, 성별, 생년월일, 국가연구자번호,<br>
                                            소속, 직위, 전화번호, 유선 및 휴대전화번호, 이메일 등</td>
                                        <td>1년 마다<br>
                                            갱신</td>
                                    </tr>
                                    <tr>
                                        <td>콘텐츠분쟁조정위원회 온라인신청‧상담 명부</td>
                                        <td>피신청인 (당해 사건의 상대방 혹은 상대기업)</td>
                                        <td>조정사건처리를 위한 답변서 요청 또는 자료제출 요청</td>
                                        <td class="alignleft">이름, 휴대전화번호, 전자우편, 조정 신청 내용</td>
                                        <td>조정사건<br>
                                            발생 시</td>
                                    </tr>
                                    <tr>
                                        <td>대중문화예술기획업 종사경력 증명서류 발급</td>
                                        <td>대중문화예술기획업 종사경력 심의위원회</td>
                                        <td>대중문화예술기획업 종사경력 심의</td>
                                        <td class="alignleft">성명, 생년월일, 휴대폰 번호, 전화번호, 주소, 이메일, 사진 등</td>
                                        <td>3년 마다<br>
                                            갱신</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <br><br>

                            <h5>제3조(개인정보처리의 위탁)</h5>
                            <ul class="li_style02">
                                <li><span class="dot">① 콘진원은 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.</span></li>
                                <div class="conTable_wrap scroll">
                                    <table class="conTable tdCenter">
                                        <caption>개인정보처리의 위탁 | 구분, 위탁 받는 자(수탁자), 위탁하는 업무의 내용, 위탁기간, 수탁자연락처로 구분되는 표</caption>
                                        <colgroup>
                                            <col width="22%">
                                            <col width="16%">
                                            <col>
                                            <col width="14%">
                                            <col width="16%">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th scope="col">구분</th>
                                            <th scope="col">위탁 받는 자 (수탁자)</th>
                                            <th scope="col">위탁하는 업무의 내용</th>
                                            <th scope="col">위탁기간</th>
                                            <th scope="col">수탁자연락처</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>대표 홈페이지</td>
                                            <td rowspan="5">(주)오픈베이스</td>
                                            <td class="alignleft" rowspan="5">정보전산처리 및 유지관리, 웹사이트 운영, 불만처리 등 민원처리, 고지사항 전달</td>
                                            <td rowspan="5">계약 종료시까지</td>
                                            <td rowspan="5">061-900-6090</td>
                                        </tr>
                                        <tr>
                                            <td>게임국가기술자격검정</td>
                                        </tr>
                                        <tr>
                                            <td>연구개발정보관리시스템</td>
                                        </tr>
                                        <tr>
                                            <td>스토리움</td>
                                        </tr>
                                        <tr>
                                            <td>대중문화예술종합정보시스템</td>
                                        </tr>
                                        <tr>
                                            <td>한국콘텐츠아카데미</td>
                                            <td>(주)스톰미디어</td>
                                            <td class="alignleft">홈페이지 회원 및 튜터, 강사관리, 웹사이트 운영, 불만처리 등 민원처리, 고지사항 전달</td>
                                            <td>계약 종료시까지</td>
                                            <td>02-6674-1759</td>
                                        </tr>
                                        <tr>
                                            <td>콘텐츠분쟁조정위원회</td>
                                            <td>㈜에스엔비플러스</td>
                                            <td class="alignleft">정보전산처리 및 유지관리, 웹사이트 운영, 불만처리 등 민원처리, 고지사항 전달</td>
                                            <td>계약 종료시까지</td>
                                            <td>02-6952-1462</td>
                                        </tr>
                                        <tr>
                                            <td>콘텐츠수출마케팅플랫폼</td>
                                            <td>이씨플라자(주)</td>
                                            <td class="alignleft">정보전산처리 및 유지관리, 웹사이트 운영</td>
                                            <td>계약 종료시까지</td>
                                            <td>02-476-1143</td>
                                        </tr>
                                        <tr>
                                            <td>콘텐츠도서관</td>
                                            <td>두드림시스템</td>
                                            <td class="alignleft">홈페이지 유지관리, 웹사이트 운영</td>
                                            <td>계약 종료시까지</td>
                                            <td>02-2279-9336</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <li><span class="dot">② 콘진원은 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.</span></li>
                                <li><span class="dot">③ 위탁위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.</span></li>
                            </ul>
                            <br><br>
                            <h5>제4조(정보주체와 법정대리인의 권리·의무 및 행사방법)</h5>
                            <ul class="li_style02">
                                <li><span class="dot">① 정보주체(만 14세 미만인 경우에는 법정대리인을 말함)는 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.</span></li>
                                <ul>
                                    <li>1. 개인정보 열람요구 </li>
                                    <li>2. 오류 등이 있을 경우 정정 요구</li>
                                    <li>3. 삭제요구 </li>
                                    <li>4. 처리정지 요구</li>
                                    <li><span class="dot">②제1항에 따른 권리 행사는 개인정보 처리방법에 관한 고시 별지 제8호 서식에 따라 작성 후 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며, 이에 대해 지체 없이 조치하겠습니다.
                                            <br><a title="다운로드" href="https://www.kocca.kr/cop/privacy/privacy_2022_8_v1.hwp" class="btn_download">[개인정보 처리방법에 관한 고시 별지 제8호] 개인정보 열람 요구서</a></span></li>
                                    <li><span class="dot">③ 정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.</span></li>
                                    <li><span class="dot">④ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 처리방법에 관한 고시 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.
                                            <br><a title="다운로드" href="https://www.kocca.kr/cop/privacy/privacy_2022_11_v1.hwp" class="btn_download">[개인정보 처리방법에 관한 고시 별지 제11호] 위임장</a></span></li>
                                    <li><span class="dot">⑤ 개인정보 열람 및 처리정지 요구는 개인정보보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.</span></li>
                                    <li><span class="dot">⑥ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.</span></li>
                                    <li><span class="dot">⑦ 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.</span></li>
                                </ul>
                                <br><br>

                                <h5>제5조(처리하는 개인정보 항목)</h5>
                                <p>콘진원은 다음의 개인정보 항목을 처리하고 있습니다. <strong style="text-decoration: underline;">자세한 내용은 개인정보파일명을 클릭해서 확인하실 수 있습니다.</strong></p>
                                <div>
                                    <div class="conTable_wrap scroll">
                                        <table class="conTable tdCenter">
                                            <caption>처리하는 개인정보 항목 위탁 | 개인정보파일명, 개인정보처리시스템명, 부서로 구분되는 표</caption>
                                            <colgroup>
                                                <col>
                                                <col>
                                                <col>
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th scope="col">개인정보파일명</th>
                                                <th scope="col">개인정보처리시스템명</th>
                                                <th scope="col">부서</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td> <a href="javascript:void(0)" class="cont_layer_open">홈페이지 회원 명부</a>
                                                    <div class="cont_layer_pop pop_style01">
                                                        <div class="inner">
                                                            <div class="layer_title">홈페이지 회원 명부</div>
                                                            <div class="cont"> <strong>[일반회원]</strong><br>
                                                                &nbsp;&nbsp; (필수)이름, 아이디, 비밀번호, 생년월일, 휴대폰번호, 이메일주소,아이핀, 법정대리인 14세미만 보호자
                                                                이름, 집연락처, 핸드폰, 전화번호<br>
                                                                &nbsp;&nbsp; (선택) 주소<br>
                                                                <strong>[기업회원]</strong><br>
                                                                &nbsp;&nbsp; (필수)아이디, 비밀번호, 대표자이름, 대표자이름(영문), 대표자전화번호, 대표자휴대번호, 대표자이메일,
                                                                담당자이메일, 담당자휴대전화<br>
                                                                &nbsp;&nbsp; (선택)회사주소
                                                                <div class="btn_layer_close"><a href="javascript:void(0);" class="btn_case01 btn_mini">닫기</a></div>
                                                            </div> <a href="javascript:void(0);" class="cont_layer_close">레이어팝업닫기</a>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>한국콘텐츠진흥원 홈페이지</td>
                                                <td>정보보안팀</td>
                                            </tr>
                                            <tr>
                                                <td> <a href="javascript:void(0)" class="cont_layer_open">대표 홈페이지 신청‧상담 명부</a>
                                                    <!-- 대표 홈페이지 신청‧상담 명부// -->
                                                    <div class="cont_layer_pop pop_style01">
                                                        <div class="inner">
                                                            <div class="layer_title">대표 홈페이지 신청‧상담 명부</div>
                                                            <div class="cont"> <strong>[1:1문의, 클린신고센터, 고객제안, 온라인신청,
                                                                근로시간단축의견]</strong><br>
                                                                &nbsp;&nbsp; (필수)작성자명, 이메일, 상담내용<br>
                                                                &nbsp;&nbsp; (선택)연락처<br>
                                                                <strong>[견적공고 접수]</strong><br>
                                                                &nbsp;&nbsp; (필수)대표자명, 연락처, 이메일<br>
                                                                <strong>[시설예약]</strong><br>
                                                                &nbsp;&nbsp; (필수)대표자, 주소, 담당자(PD명), 휴대폰, 담당자명, 이메일, 신청자명<br>
                                                                &nbsp;&nbsp; (선택)전화번호<br>
                                                                <strong>[실적증명서]</strong><br>
                                                                &nbsp;&nbsp; (필수)업체명, 신청자명, 연락처, 이메일<br>
                                                                <strong>[이달의우수게임]</strong><br>
                                                                &nbsp;&nbsp; (필수)대표자명, 담당자명, 전화번호, 휴대폰번호, 이메일, 주소<br>
                                                                <strong>[게임이용자가진단]</strong><br>
                                                                &nbsp;&nbsp; (필수)연령, 학년, 이메일<br>
                                                                &nbsp;&nbsp; (선택)성별<br>
                                                                <strong>[기능성게임정보포털]</strong><br>
                                                                &nbsp;&nbsp; (필수)대표자명, 담당자이메일<br>
                                                                <strong>[메일링신청]</strong><br>
                                                                &nbsp;&nbsp; (필수)이메일<br>
                                                                <strong>[콘텐츠성평등센터 상담]</strong><br>
                                                                &nbsp;&nbsp; (필수)성명, 생년월일, 성별, 휴대폰, 상담내용<br>
                                                                &nbsp;&nbsp; (선택)이메일, 주소<br>
                                                                <strong>[콘텐츠성평등센터 교육]</strong><br>
                                                                &nbsp;&nbsp; (필수)담당자성명, 담당자연락처, 담당자이메일, 주소<br>
                                                                <strong>[우리동네캐릭터]</strong><br>
                                                                &nbsp;&nbsp; (필수)작성자명<br>
                                                                &nbsp;&nbsp; (선택)이메일
                                                                <div class="btn_layer_close"><a href="javascript:void(0);" class="btn_case01 btn_mini">닫기</a></div>
                                                            </div> <a href="javascript:void(0);" class="cont_layer_close">레이어팝업닫기</a>
                                                        </div>
                                                    </div><!-- //대표 홈페이지 신청‧상담 명부 -->
                                                </td>
                                                <td>한국콘텐츠진흥원 홈페이지</td>
                                                <td>정보보안팀</td>
                                            </tr>
                                            <tr>
                                                <td> <a href="javascript:void(0)" class="cont_layer_open">게임국가기술자격검정 회원/합격 명부</a>
                                                    <!-- 게임국가기술자격검정 회원/합격 명부// -->
                                                    <div class="cont_layer_pop pop_style01">
                                                        <div class="inner">
                                                            <div class="layer_title">게임국가기술자격검정 회원/합격 명부</div>
                                                            <div class="cont"> <strong>[회원정보]</strong><br>
                                                                &nbsp;&nbsp; (필수)성명, 생년월일, 성별, 이메일, 휴대전화, 주소, 아이핀<br>
                                                                &nbsp;&nbsp; (선택)일반전화<br>
                                                                <strong>[인적사항변경]</strong><br>
                                                                &nbsp;&nbsp; (필수)주민등록번호<br>
                                                                &nbsp;&nbsp; (선택)성명, 주소, 연락처, 이메일<br>
                                                                <strong>[원서접수]</strong><br>
                                                                &nbsp;&nbsp; (필수)성명, 주민번호, 이메일, 주소, 이동전화, 환불계좌, 환불예금주, 무통장입금시 계좌번호,
                                                                증명사진<br>
                                                                &nbsp;&nbsp; (선택)유선전화<br>
                                                                <strong>[필기합격/최종합격]</strong><br>
                                                                &nbsp;&nbsp; (필수)성명, 주민번호
                                                                <div class="btn_layer_close"><a href="javascript:void(0);" class="btn_case01 btn_mini">닫기</a></div>
                                                            </div> <a href="javascript:void(0);" class="cont_layer_close">레이어팝업닫기</a>
                                                        </div>
                                                    </div><!-- //게임국가기술자격검정 회원/합격 명부 -->
                                                </td>
                                                <td>게임국가기술자격검정 홈페이지</td>
                                                <td>게임기반조성팀</td>
                                            </tr>
                                            <tr>
                                                <td> <a href="javascript:void(0)" class="cont_layer_open">연구개발정보관리시스템 회원</a>
                                                    <!-- 게임국가기술자격검정 회원/합격 명부// -->
                                                    <div class="cont_layer_pop pop_style01">
                                                        <div class="inner">
                                                            <div class="layer_title">연구개발정보관리시스템 회원</div>
                                                            <div class="cont"> <strong>[회원가입]</strong><br>
                                                                &nbsp;&nbsp; (필수)이름(한글), 이름(영문), 국가연구자번호, 생년월일, 아이디, 비밀번호, 자택주소, 전화번호, 휴대폰번호, 이메일, 소속기관, 부서, 직위, 직급, 입사년월<br>
                                                                &nbsp;&nbsp; (선택)소속기관(겸직기관), 이메일수신동의여부, SMS수신동의여부, 회원구분
                                                                <div class="btn_layer_close"><a href="javascript:void(0);" class="btn_case01 btn_mini">닫기</a></div>
                                                            </div> <a href="javascript:void(0);" class="cont_layer_close">레이어팝업닫기</a>
                                                        </div>
                                                    </div><!-- //게임국가기술자격검정 회원/합격 명부 -->
                                                </td>
                                                <td>연구개발정보관리시스템</td>
                                                <td>연구개발기획단</td>
                                            </tr>
                                            <tr>
                                                <td> <a href="javascript:void(0)" class="cont_layer_open">한국콘텐츠아카데미 회원</a>
                                                    <!-- 한국콘텐츠아카데미 회원// -->
                                                    <div class="cont_layer_pop pop_style01">
                                                        <div class="inner">
                                                            <div class="layer_title">한국콘텐츠아카데미 회원</div>
                                                            <div class="cont"> <strong>[개인회원]</strong><br>
                                                                &nbsp;&nbsp; (필수)이름, 생년월일, 성별, 아이디, 비밀번호, 이메일, 휴대폰, 인재캠퍼스 정보수신 여부,
                                                                콘텐츠문화광장 정보수신 여부, 직업, 거주지역, 소속, 14세 미만인 경우 보호자의 이름,<br>
                                                                <span style="margin-left: 55px;">휴대폰 번호</span><br>
                                                                &nbsp;&nbsp; (선택)거주지<br>
                                                                <strong>[기업회원]</strong><br>
                                                                &nbsp;&nbsp; (필수)성명, 생년월일, 성별, 아이디, 비밀번호, 전화번호, 휴대폰, 이메일, 정보수신 여부<br>
                                                                &nbsp;&nbsp; (선택)소속부서<br>
                                                                <strong>[온라인교육 수강정보]</strong><br>
                                                                &nbsp;&nbsp; (필수)아이디, 성명, 휴대폰, 이메일, 수강과목정보<br>
                                                                <strong>[문의하기]</strong><br>
                                                                &nbsp;&nbsp; (필수)아이디, 성명, 휴대폰, 이메일<br>
                                                                <strong>[오프라인교육 신청]</strong><br>
                                                                &nbsp;&nbsp; (필수)아이디, 이름, 생년월일, 성별, 이메일, 자택 전화번호, 휴대폰번호, 회사 전화번호, 주소,
                                                                거주지역, 직업, 소속<br>
                                                                &nbsp;&nbsp; (선택)전문분야, 직위, 경력, 학력 등 교육프로그램에 따라 다르며 정보주체로부터 별도의 동의를 얻어 수집
                                                                및 처리합니다.<br>
                                                                <strong>[시설예약 신청]</strong><br>
                                                                &nbsp;&nbsp; (필수) 이름, 휴대폰, 이메일, 사용인원, 사용목적, 예약정보수신방법<br>
                                                                &nbsp;&nbsp; (선택)시설예약신청에 따라 다르며 정보주체로부터 별도의 동의를 얻어 수집 및 처리합니다.
                                                                <div class="btn_layer_close"><a href="javascript:void(0);" class="btn_case01 btn_mini">닫기</a></div>
                                                            </div> <a href="javascript:void(0);" class="cont_layer_close">레이어팝업닫기</a>
                                                        </div>
                                                    </div><!-- //한국콘텐츠아카데미 회원 -->
                                                </td>
                                                <td>한국콘텐츠아카데미</td>
                                                <td>교육운영팀</td>
                                            </tr>
                                            <tr>
                                                <td> <a href="javascript:void(0)" class="cont_layer_open">온라인 상담 및 조정신청 명부</a>
                                                    <!-- 콘텐츠분쟁조정위원회 온라인신청‧상담 명부// -->
                                                    <div class="cont_layer_pop pop_style01">
                                                        <div class="inner">
                                                            <div class="layer_title">온라인 상담 및 조정신청 명부</div>
                                                            <div class="cont"> <strong>[조정신청]</strong><br>
                                                                &nbsp;&nbsp; (필수)신청인의 성명, 연락처, 주소, 전자우편, 피신청인의 성명, 주소, 연락처, 게임아이디(게임사건의
                                                                경우), 신청취지 및 신청내용<br>
                                                                &nbsp;&nbsp; (선택)대리인 인적사항(성명, 연락처, 주소, 전자우편)<br>
                                                                <strong>[상담신청]</strong><br>
                                                                &nbsp;&nbsp; (필수)작성자 성명, 연락처, 전자우편, 상담신청내용<br>
                                                                &nbsp;&nbsp; (선택)없음
                                                                <div class="btn_layer_close"><a href="javascript:void(0);" class="btn_case01 btn_mini">닫기</a></div>
                                                            </div> <a href="javascript:void(0);" class="cont_layer_close">레이어팝업닫기</a>
                                                        </div>
                                                    </div><!-- //콘텐츠분쟁조정위원회 온라인신청‧상담 명부 -->
                                                </td>
                                                <td>콘텐츠분쟁조정위원회 홈페이지</td>
                                                <td>사회적가치추진단</td>
                                            </tr>
                                            <tr>
                                                <td> <a href="javascript:void(0)" class="cont_layer_open">대중문화예술종합정보시스템 회원</a>
                                                    <!-- 대중문화예술종합정보시스템 회원// -->
                                                    <div class="cont_layer_pop pop_style01">
                                                        <div class="inner">
                                                            <div class="layer_title">대중문화예술종합정보시스템 회원</div>
                                                            <div class="cont"> <strong>[일반회원]</strong><br>
                                                                &nbsp;&nbsp; (필수)성명, 휴대폰번호, 이메일, 주소,개 인식별정보<br>
                                                                &nbsp;&nbsp; (선택)전화번호, 정보수신여부<br>
                                                                <strong>[기업회원]</strong><br>
                                                                &nbsp;&nbsp; (필수)사업자등록번호, 대표자이름, 대표자이름(영문), 표자전화번호, 대표자휴대전화, 대표자주소,
                                                                담당자이메일, 담당자휴대전화<br>
                                                                &nbsp;&nbsp; (선택)대표자이메일
                                                                <div class="btn_layer_close"><a href="javascript:void(0);" class="btn_case01 btn_mini">닫기</a></div>
                                                            </div> <a href="javascript:void(0);" class="cont_layer_close">레이어팝업닫기</a>
                                                        </div>
                                                    </div><!-- //대중문화예술종합정보시스템 회원 -->
                                                </td>
                                                <td>대중문화예술종합정보시스템</td>
                                                <td>사회적가치추진단</td>
                                            </tr>
                                            <tr>
                                                <td> <a href="javascript:void(0)" class="cont_layer_open">대중문화예술기획업 종사경력 증명서류 발급</a>
                                                    <!-- 대중문화예술기획업 종사경력 증명서 발급 명부// -->
                                                    <div class="cont_layer_pop pop_style01">
                                                        <div class="inner">
                                                            <div class="layer_title">대중문화예술기획업 종사경력 증명서류 발급</div>
                                                            <div class="cont"> <strong>[일반회원]</strong><br>
                                                                &nbsp;&nbsp; (필수)아이디, 비밀번호, DI(중복가입확인정보), 성명, 생년월일, 휴대폰 번호, 성별정보<br>
                                                                &nbsp;&nbsp; (선택)전화번호, sms수신여부, 이메일 수신여부
                                                                <div class="btn_layer_close"><a href="javascript:void(0);" class="btn_case01 btn_mini">닫기</a></div>
                                                            </div> <a href="javascript:void(0);" class="cont_layer_close">레이어팝업닫기</a>
                                                        </div>
                                                    </div><!-- //대중문화예술기획업 종사경력 증명서 발급 명부 -->
                                                </td>
                                                <td>대중문화예술종합정보시스템</td>
                                                <td>사회적가치추진단</td>
                                            </tr>
                                            <tr>
                                                <td> <a href="javascript:void(0)" class="cont_layer_open">대중문화예술종합정보시스템 법률자문 신청명부</a>
                                                    <!-- 대중문화예술종합정보시스템 법률자문신청 명부// -->
                                                    <div class="cont_layer_pop pop_style01">
                                                        <div class="inner">
                                                            <div class="layer_title">대중문화예술종합정보시스템 법률자문 신청명부</div>
                                                            <div class="cont"> <strong>[법률자문 신청명부]</strong><br>
                                                                &nbsp;&nbsp; (필수)성명, 휴대폰 번호, 이메일<br>
                                                                &nbsp;&nbsp; (선택)없음
                                                                <div class="btn_layer_close"><a href="javascript:void(0);" class="btn_case01 btn_mini">닫기</a></div>
                                                            </div> <a href="javascript:void(0);" class="cont_layer_close">레이어팝업닫기</a>
                                                        </div>
                                                    </div><!-- //대중문화예술종합정보시스템 법률자문신청 명부 -->
                                                </td>
                                                <td>대중문화예술종합정보시스템</td>
                                                <td>사회적가치추진단</td>
                                            </tr>
                                            <tr>
                                                <td> <a href="javascript:void(0)" class="cont_layer_open">대중문화예술종합정보시스템 심리상담 신청명부</a>
                                                    <!-- 대중문화예술종합정보시스템 심리상담 신청명부// -->
                                                    <div class="cont_layer_pop pop_style01">
                                                        <div class="inner">
                                                            <div class="layer_title">대중문화예술종합정보시스템 심리상담 신청명부</div>
                                                            <div class="cont"> <strong>[심리상담 신청명부]</strong><br>
                                                                &nbsp;&nbsp; (필수)성명, 휴대폰 번호, 이메일<br>
                                                                &nbsp;&nbsp; (선택)없음
                                                                <div class="btn_layer_close"><a href="javascript:void(0);" class="btn_case01 btn_mini">닫기</a></div>
                                                            </div> <a href="javascript:void(0);" class="cont_layer_close">레이어팝업닫기</a>
                                                        </div>
                                                    </div><!-- //대중문화예술종합정보시스템 심리상담 신청명부 -->
                                                </td>
                                                <td>대중문화예술종합정보시스템</td>
                                                <td>사회적가치추진단</td>
                                            </tr>
                                            <tr>
                                                <td> <a href="javascript:void(0)" class="cont_layer_open">대중문화예술 분야 온라인 암표신고 신청 명부</a>
                                                    <!-- 대중문화예술 분야 온라인 암표신고 신청 명부// -->
                                                    <div class="cont_layer_pop pop_style01">
                                                        <div class="inner">
                                                            <div class="layer_title">대중문화예술 분야 온라인 암표신고 신청 명부</div>
                                                            <div class="cont"> <strong>[암표신고 신청 명부]</strong><br>
                                                                &nbsp;&nbsp; (필수)성명, 휴대폰 번호, 이메일<br>
                                                                &nbsp;&nbsp; (선택)없음
                                                                <div class="btn_layer_close"><a href="javascript:void(0);" class="btn_case01 btn_mini">닫기</a></div>
                                                            </div> <a href="javascript:void(0);" class="cont_layer_close">레이어팝업닫기</a>
                                                        </div>
                                                    </div><!-- //대중문화예술 분야 온라인 암표신고 신청 명부 -->
                                                </td>
                                                <td>대중문화예술종합정보시스템</td>
                                                <td>사회적가치추진단</td>
                                            </tr>
                                            <tr>
                                                <td> <a href="javascript:void(0)" class="cont_layer_open">콘텐츠수출마케팅플랫폼 회원</a>
                                                    <!-- 콘텐츠수출마케팅플랫폼 회원// -->
                                                    <div class="cont_layer_pop pop_style01">
                                                        <div class="inner">
                                                            <div class="layer_title">콘텐츠수출마케팅플랫폼 회원</div>
                                                            <div class="cont"> <strong>[전문가회원]</strong><br>
                                                                &nbsp;&nbsp; (필수)이름, 이메일, 핸드폰, 회사명, 부서/직책, 사무실전화<br>
                                                                <strong>[기업회원]</strong><br>
                                                                &nbsp;&nbsp; (필수)회사명, 사업자번호, 대표자, 주소, 대표전화, 이름, 핸드폰, 이메일, 부서 및 직책,
                                                                사무실전화<br>
                                                                &nbsp;&nbsp; (선택)팩스번호<br>
                                                                <strong>[개인회원]</strong><br>
                                                                &nbsp;&nbsp; (필수)이름, 주소, 핸드폰, 이메일<br>
                                                                &nbsp;&nbsp; (선택)팩스번호
                                                                <div class="btn_layer_close"><a href="javascript:void(0);" class="btn_case01 btn_mini">닫기</a></div>
                                                            </div> <a href="javascript:void(0);" class="cont_layer_close">레이어팝업닫기</a>
                                                        </div>
                                                    </div><!-- //콘텐츠수출마케팅플랫폼 회원 -->
                                                </td>
                                                <td>콘텐츠수출마케팅플랫폼 홈페이지</td>
                                                <td>해외사업지원단</td>
                                            </tr>
                                            <tr>
                                                <td> <a href="javascript:void(0)" class="cont_layer_open">스토리움 회원</a> <!-- 스토리움// -->
                                                    <div class="cont_layer_pop pop_style01">
                                                        <div class="inner">
                                                            <div class="layer_title">스토리움 회원</div>
                                                            <div class="cont"> <strong>[창작자회원가입]</strong><br>
                                                                &nbsp;&nbsp; (필수)아이디, 비밀번호, 이름, 이메일, 휴대전화, 일반전화, 주소, 필명, 생년월일, 성별<br>
                                                                &nbsp;&nbsp; (선택)프로필이미지, 대표작, 수상내역, 주요작품<br>
                                                                <strong>[이용자회원가입]</strong><br>
                                                                &nbsp;&nbsp; (필수)아이디, 비밀번호, 이름, 이메일, 휴대전화, 일반전화, 주소, 분야, 직종, 소속(회사),
                                                                생년월일, 성별, 직위,필명, 주요경력<br>
                                                                &nbsp;&nbsp; (선택)주소(회사), 부서명, 담당업무, 프로필이미지, 대표작, 수상내역, 주요작품
                                                                <div class="btn_layer_close"><a href="javascript:void(0);" class="btn_case01 btn_mini">닫기</a></div>
                                                            </div> <a href="javascript:void(0);" class="cont_layer_close">레이어팝업닫기</a>
                                                        </div>
                                                    </div><!-- //스토리움 -->
                                                </td>
                                                <td>스토리움 홈페이지</td>
                                                <td>만화스토리산업팀</td>
                                            </tr>
                                            <tr>
                                                <td> <a href="javascript:void(0)" class="cont_layer_open">콘텐츠도서관 회원명부</a>
                                                    <!-- 스토리움// -->
                                                    <div class="cont_layer_pop pop_style01">
                                                        <div class="inner">
                                                            <div class="layer_title">콘텐츠도서관 회원명부</div>
                                                            <div class="cont"> <strong>[콘텐츠도서관 회원명부]</strong><br>
                                                                &nbsp;&nbsp; (필수)아이디, 비밀번호, 성명, 이메일 주소, 휴대전화번호<br>
                                                                &nbsp;&nbsp; (선택)생년월일, 전화번호, 주소
                                                                <div class="btn_layer_close"><a href="javascript:void(0);" class="btn_case01 btn_mini">닫기</a></div>
                                                            </div> <a href="javascript:void(0);" class="cont_layer_close">레이어팝업닫기</a>
                                                        </div>
                                                    </div><!-- //스토리움 -->
                                                </td>
                                                <td>콘텐츠도서관 시스템</td>
                                                <td>정보분석팀</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <ul class="li_style02">
                                        <li>인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다.
                                            <ul>
                                                <li>IP주소, 쿠키, MAC주소, 서비스 이용기록, 방문기록, 불량 이용기록 등</li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <br><br>

                                <h5>제6조(개인정보의 파기절차 및 방법)</h5>
                                <ul class="li_style02">
                                    <li><span class="dot">① 콘진원은 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.</span></li>
                                </ul>
                                <ul class="li_style01">
                                    <li>파기절차
                                        <ul class="li_style01_01">
                                            <li>불필요한 개인정보 및 개인정보파일은 개인정보책임자의 책임 하에 내부방침 절차에 따라 다음과 같이 처리하고 있습니다.
                                                <ul class="li_style01_01_01">
                                                    <li>개인정보의 파기 : 보유기간이 경과한 개인정보는 종료일로부터 지체 없이 파기합니다.</li>
                                                    <li>개인정보파일의 파기 : 개인정보파일의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보파일이 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 지체 없이 그 개인정보파일을 파기합니다.</li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>파기방법
                                        <ul class="li_style01_01">
                                            <li>전자적 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다.</li>
                                            <li>종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.</li>
                                        </ul>
                                    </li>
                                </ul>
                                <ul>
                                    <li><span class="dot">② 콘진원은 각 부서에서 운영하는 소관 홈페이지를 통해 개인정보파일 파기 현황을 안내하고 있습니다.</span></li>
                                </ul>
                                <br><br>

                                <h5>제7조(개인정보의 안전성 확보조치)</h5>
                                <ul class="li_style02">
                                    <li><span class="dot">① 콘진원은 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.</span></li>
                                    <li>1. 개인정보 취급직원의 최소화 및 교육<br>개인정보를 취급하는 직원은 반드시 필요한 인원에 한하여 지정·관리하고 있으며 취급직원을 대상으로 안전한 관리를 위한 교육을 실시하고 있습니다.</li>
                                    <li>2. 개인정보에 대한 접근 제한<br>개인정보를 처리하는 개인정보처리시스템에 대한 접근권한의 부여·변경·말소를 통하여 개인정보에 대한 접근통제를 위한 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.</li>
                                    <li>3. 접속기록의 보관 <br>개인정보처리시스템에 접속한 기록을 1년 이상 보관·관리하고 있습니다.</li>
                                    <li>4. 개인정보의 암호화<br>개인정보는 암호화 등을 통해 안전하게 저장 및 관리되고 있습니다. 또한, 중요한 데이터는 저장 및 전송 시 암호화하여 사용하는 등의 별도 보안기능을 사용하고 있습니다.</li>
                                    <li>5. 보안프로그램 설치 및 주기적 점검·갱신<br>해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적으로 갱신·점검하고 있습니다.</li>
                                    <li>6. 비인가자에 대한 출입 통제<br>개인정보를 보관하고 있는 개인정보처리시스템의 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립·운영하고 있습니다.</li>
                                </ul>
                                <br><br>

                                <h5>제8조(개인정보 자동 수집 장치의 설치‧운영 및 거부에 관한 사항)</h5>
                                <ul class="li_style02">
                                    <li><span class="dot">① 콘진원은 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠기(cookie)’를 사용할 수 있습니다.</span></li>
                                    <li><span class="dot">② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.</span></li>
                                </ul>
                                <ul class="li_style01">
                                    <li>쿠키의 사용목적: 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.</li>
                                    <li>쿠키의 설치‧운영 및 거부 : 웹브라우저 상단의 도구&gt;인터넷 옵션&gt;개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.</li>
                                    <li>쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.</li>
                                </ul>
                                <br><br>

                                <h5>제9조(개인정보 보호책임자)</h5>
                                <ul class="li_style02">
                                    <li><span class="dot">① 콘진원은 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.</span></li>
                                </ul>
                                <ul>
                                    <li>▶ 개인정보 보호책임자
                                        <ul>
                                            <li>- 성명 : 정경미</li>
                                            <li>- 직책 : 부원장</li>
                                            <li>- 연락처 : 061-900-6124, privacy@kocca.kr<br>
                                                &nbsp;&nbsp;&nbsp; <span class="f14px">※ 개인정보 보호 담당부서로 연결됩니다.</span></li>
                                        </ul>
                                    </li>
                                    <li>▶ 개인정보 보호 담당부서
                                        <ul>
                                            <li>- 부서명 : 정보보안팀</li>
                                            <li>- 담당자 : 박상수</li>
                                            <li>- 연락처 : 061-900-6124, ps2@kocca.kr</li>
                                        </ul>
                                    </li>
                                    <li><span class="dot">② 부서별 개인정보보호담당자는 아래와 같습니다.</span>
                                </ul>
                                <div class="conTable_wrap scroll">
                                    <table class="conTable tdCenter">
                                        <caption>홈페이지별 담당자 | 개인정보파일명, 담당부서, 담당자, 연락처로 구분되는 표</caption>
                                        <colgroup>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th scope="col">개인정보파일명</th>
                                            <th scope="col">담당부서</th>
                                            <th scope="col">담당자</th>
                                            <th scope="col">연락처</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>홈페이지 회원 명부</td>
                                            <td>정보보안팀</td>
                                            <td>이창윤 대리</td>
                                            <td>061-900-6121</td>
                                        </tr>
                                        <tr>
                                            <td>대표 홈페이지 신청‧상담 명부</td>
                                            <td>정보보안팀</td>
                                            <td>이창윤 대리</td>
                                            <td>061-900-6121</td>
                                        </tr>
                                        <tr>
                                            <td>게임국가기술자격검정 회원/합격 명부</td>
                                            <td>게임기반조성팀</td>
                                            <td>김성은 주임</td>
                                            <td>031-759-2025</td>
                                        </tr>
                                        <tr>
                                            <td>연구개발정보관리시스템 회원</td>
                                            <td>연구개발기획단</td>
                                            <td>윤요한 과장</td>
                                            <td>042-330-6624</td>
                                        </tr>
                                        <tr>
                                            <td>한국콘텐츠아카데미 회원</td>
                                            <td>교육운영팀</td>
                                            <td>이연지 대리</td>
                                            <td>02-6310-0628</td>
                                        </tr>
                                        <tr>
                                            <td>온라인 상담 및 조정신청 명부</td>
                                            <td>사회적가치추진단</td>
                                            <td>김경환 차장</td>
                                            <td>02-2016-4141</td>
                                        </tr>
                                        <tr>
                                            <td>대중문화예술종합정보시스템 회원</td>
                                            <td>사회적가치추진단</td>
                                            <td>최한별 주임</td>
                                            <td>061-900-6535</td>
                                        </tr>
                                        <tr>
                                            <td>대중문화예술기획업 종사경력 증명서류 발급</td>
                                            <td>사회적가치추진단</td>
                                            <td>최한별 주임</td>
                                            <td>061-900-6535</td>
                                        </tr>
                                        <tr>
                                            <td>대중문화예술종합정보시스템 법률자문 신청명부</td>
                                            <td>사회적가치추진단</td>
                                            <td>최한별 주임</td>
                                            <td>061-900-6535</td>
                                        </tr>
                                        <tr>
                                            <td>대중문화예술종합정보시스템 심리상담 신청명부</td>
                                            <td>사회적가치추진단</td>
                                            <td>최한별 주임</td>
                                            <td>061-900-6535</td>
                                        </tr>
                                        <tr>
                                            <td>대중문화예술 분야 온라인 암표신고 신청 명부</td>
                                            <td>사회적가치추진단</td>
                                            <td>최한별 주임</td>
                                            <td>061-900-6535</td>
                                        </tr>
                                        <tr>
                                            <td>콘텐츠수출마케팅플랫폼 회원</td>
                                            <td>해외사업지원단</td>
                                            <td>박영일 부장</td>
                                            <td>061-900-6021</td>
                                        </tr>
                                        <tr>
                                            <td>스토리움 홈페이지 회원</td>
                                            <td>만화스토리산업팀</td>
                                            <td>허재은 대리</td>
                                            <td>061-900-6435</td>
                                        </tr>
                                        <tr>
                                            <td>콘텐츠도서관 회원명부</td>
                                            <td>정보분석팀</td>
                                            <td>김승호 사서</td>
                                            <td>061-900-6137</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <ul>
                                    <li><span class="dot">③ 정보주체께서는 콘진원의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 콘진원은 정보주체의 문의에 대해 지체없이 답변 및 처리해드릴 것입니다.</span></li>
                                </ul>
                                <br><br>

                                <h5>제10조(개인정보 열람청구)</h5>
                                <ul class="li_style02">
                                    <li><span class="dot">① 정보주체는 개인정보 보호법 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다. 콘진원은 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다.</span></li>
                                    <li>▶ 개인정보 열람청구 접수․처리 부서
                                        <ul>
                                            <li>- 부서명 : 정보보안팀</li>
                                            <li>- 담당자 : 박상수</li>
                                            <li>- 연락처 : 061-900-6124, ps2@kocca.kr</li>
                                        </ul>
                                    </li>
                                    <li><span class="dot">② 정보주체께서는 제1항의 열람청구 접수ㆍ처리부서 이외에, 개인정보보호위원회의 ‘개인정보보호 종합지원 포털’ 웹사이트(www.privacy.go.kr)를 통하여서도 개인정보 열람청구를 하실 수 있습니다.</span></li>
                                    <li>▶ 개인정보보호위원회 개인정보보호 종합지원 포털 → 개인정보 민원 → 개인정보 열람등 요구 (공공아이핀을 통한 실명인증 필요)</li>
                                </ul>
                                <br><br>

                                <h5>제11조(개인정보의 추가적인 이용·제공의 기준)</h5>
                                <p>해당없음</p>
                                <br><br>

                                <h5>제12조(권익침해 구제방법)</h5>
                                <ul>
                                    <li>정보주체는 아래의 기관에 대해 개인정보 침해에 대한 피해구제, 상담 등을 문의하실 수 있습니다.</li>
                                    <li>&lt;아래의 기관은 콘진원과는 별개의 기관으로서, 콘진원의 자체적인 개인정보 불만처리, 피해구제 결과에 만족하지 못하시거나 보다 자세한 도움이 필요하시면 문의하여 주시기 바랍니다&gt;
                                        <ul class="li_style01 MAL10">
                                            <li>개인정보 분쟁조정위원회 : 1388-6972 (www.kopico.go.kr)</li>
                                            <li>개인정보 침해신고센터 : (국번없이) 118 (privacy.kisa.or.kr)</li>
                                            <li>대검찰청 사이버범죄수사과 : (국번없이) 1301 (www.spo.go.kr)</li>
                                            <li>경찰청 사이버수사국 : (국번없이) 182 (ecrm.cyber.go.kr)</li>
                                        </ul>
                                    </li>
                                    <li>또한, 개인정보의 열람, 정정·삭제, 처리정지 등에 대한 정보주체자의 요구에 대하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익을 침해 받은 자는 행정심판법이 정하는 바에 따라 행정심판을 청구할 수 있습니다.</li>
                                    <li>중앙행정심판위원회(www.simpan.go.kr)의 전화번호 안내 참조</li>
                                </ul>
                                <br><br>

                                <h5>제13조(개인정보 처리방침 변경)</h5>
                                <ul class="li_style02">
                                    <li><span class="dot">① 이 개인정보 처리방침은 2021. 6. 1부터 적용됩니다.</span></li>
                                    <li><span class="dot">② 이전의 개인정보 처리방침은 아래에서 확인하실 수 있습니다.</span></li>
                                </ul>
                                <div> <a href="javascript:void(0);" class="btn_open" title="이전 개인정보처리방침 리스트 여닫기">- 이전 개인정보처리방침 보기</a> </div>
                                <div class="board_search_check" style="">
                                    <div class="privacyBox1" style="position: relative; margin: 10px 0px; padding: 15px; border: 1px solid rgb(204, 204, 204);">
                                        <ul>
                                            <li>2021년 6월 1일 이전 내용 [<a title="새창열림" class="uline" href="http://www.kocca.kr/html/contents/privacy(20210621).pdf" target="_blank">보기</a>] </li>
                                            <li>2020년 2월 1일 이전 내용 [<a title="새창열림" class="uline" href="http://www.kocca.kr/html/contents/privacy(20200301).pdf" target="_blank">보기</a>] </li>
                                            <li>2019년 10월 2일 이전 내용 [<a title="새창열림" class="uline" href="http://www.kocca.kr/html/contents/privacy(20191002).pdf" target="_blank">보기</a>] </li>
                                            <li>2019년 4월 3일 이전 내용 [<a title="새창열림" class="uline" href="http://www.kocca.kr/html/contents/privacy(20190403).pdf" target="_blank">보기</a>] </li>
                                            <li>2019년 2월 8일 이전 내용 [<a title="새창열림" class="uline" href="http://www.kocca.kr/html/contents/privacy(20190208).pdf" target="_blank">보기</a>] </li>
                                            <li>2018년 12월 17일 이전 내용 [<a title="새창열림" class="uline" href="http://www.kocca.kr/html/contents/privacy(20181218).pdf" target="_blank">보기</a>] </li>
                                            <li>2018년 10월 1일 이전 내용 [<a title="새창열림" class="uline" href="http://www.kocca.kr/html/contents/privacy(20181001).pdf" target="_blank">보기</a>] </li>
                                            <li>2018년 7월 25일 이전 내용 [<a title="새창열림" class="uline" href="http://www.kocca.kr/html/contents/privacy(20180725).pdf" target="_blank">보기</a>] </li>
                                            <li>2018년 3월 29일 이전 내용 [<a title="새창열림" class="uline" href="http://www.kocca.kr/html/contents/privacy(20180329).pdf" target="_blank">보기</a>] </li>
                                            <li>2018년 3월 12일 이전 내용 [<a title="새창열림" class="uline" href="http://www.kocca.kr/html/contents/privacy(20180309).pdf" target="_blank">보기</a>] </li>
                                            <li>2017년 10월 26일 이전 내용 [<a title="새창열림" class="uline" href="http://www.kocca.kr/html/contents/privacy(20171019).pdf" target="_blank">보기</a>] </li>
                                            <li>2017년 4월 24일 이전 내용 [<a title="새창열림" class="uline" href="http://www.kocca.kr/html/contents/privacy(20131206).pdf" target="_blank">보기</a>] </li>
                                            <li>2013년 12월 6일 이전 내용 [<a title="새창열림" class="uline" href="http://www.kocca.kr/html/contents/privacy(20130625).pdf" target="_blank">보기</a>] </li>
                                            <li>2013년 6월 25일 이전 내용 [<a title="새창열림" class="uline" href="http://www.kocca.kr/html/contents/privacy(20120807_old).pdf" target="_blank">보기</a>] </li>
                                            <li>2012년 8월 7일 이전 내용 [<a title="새창열림" class="uline" href="http://www.kocca.kr/html/contents/privacy(20120807).pdf" target="_blank">보기</a>]</li>
                                        </ul>
                                    </div>
                                </div>
                                <script>

                                    $('.btn_open').on('click', function () {
                                        $('.board_search_check').slideToggle();
                                    });

                                    $('.openers').on('click', function () {
                                        $('.board_search_check').slideToggle();
                                        $(this).find('span').toggleClass('close');
                                        if ($(this).find('span').hasClass('close')) {
                                            $(this).find('span').text('닫기')
                                        } else {
                                            $(this).find('span').text('열기')
                                        }
                                        return false;
                                    });

                                </script>
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
