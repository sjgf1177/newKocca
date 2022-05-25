$(document).ready( function() {
    // alert(navigator.userAgent);
});
    
    /**
     * ��й�ȣ��й�ȣ ���ȵ�� üũ
     * http://ysksoft.com
     */
    function fnGetPasswordLevel( pwdValue ) {
        // var elNewPasswd = document.getElementById( pwdObj.id );
        // var elPasswordLevel = document.getElementById("password_level");
        var result_level = checkPassword.main( pwdValue );

        return result_level["code"];

        /*
        var level_color = "";
        var level_txt = "";
        switch (result_level["code"]) {
            case 1:
                level_color = "#00D200";
                level_txt = "����";
                break;
            case 2:
                level_colorlevel_color = "#FF7837";
                level_txt = "����";
                break;
            case 3:
                level_color = "#FF0000"; "#FF0000";
                level_txt = "����";
                break;
            case 1000:
            case 2000:
            case 3000:
            case 4000:
                elPasswordLevel.innerHTML = "<font color=\"red\">" + result_level["msg"] + "</font>";
                return false;
                break;
            default:
                return false;
                break;
        }
        elPasswordLevel.innerHTML = "���ȵ�� : <font color="" + level_color + "" style=\"font-weight:bold\">" + level_txt + "</font>";
        */
    }

    var checkPassword = {
        aResultSecure: [],
        sPassword: "",
        sCheckRegexp1: /^[a-zA-Z]/,
        sCheckRegexp2: /[a-zA-Z0-9\`\~\!\@\#\$\%\^\&\*\(\)\-\_\+\{\}\[\]\,\.]/,
        sRegexp1: /[a-z]/,
        sRegexp2: /[A-Z]/,
        sRegexp3: /[0-9]/,
        sRegexp4: /[\`\~\!\@\#\$\%\^\&\*\(\)\-\_\+\{\}\[\]\,\.]/,

        main: function (sPassword) {

            this.aResultSecure["code"] = 0;
            this.aResultSecure["msg"] = false;
            this.sPassword = sPassword;
            this.sResultRegexp = this.checkRegexp();

            // �⺻ �˻�
            // if (this.checkDefaultPassword() == true) {

                this.checkPasswordLevel1();

                // ���� �ܰ� ��й�ȣ �˻�
                // ���ڱ׷� �߿��� 2������ �����Ͽ� 8�ڸ�~9�ڸ�
                // return 1
                this.checkPasswordLevel2();

                // �߰� �ܰ�ܰ� ��й�ȣ �˻�
                // ���ڱ׷� �߿����߿��� 2������ �����Ͽ� 10�ڸ�~13�ڸ�
                // ���ڱ׷칮�ڱ׷� �߿��� �����빮��/�����ҹ���/���� �����Ͽ� 8�ڸ� �̻�
                // return 2
                this.checkPasswordLevel3();

                // ���� �ܰ� ��й�ȣ �˻�˻�
                // ���ڱ׷� �߿��� 2������ �����Ͽ������Ͽ� 14�ڸ� �̻�
                // ���ڱ׷� �߿����߿��� �����빮��/�����ҹ���/���� �����Ͽ� 9�ڸ� �̻�
                // ���ڱ׷� �߿��� Ư������ ���� 3���� �̻� �����Ͽ� 8�ڸ� �̻�
                // return 3
                this.checkPasswordLevel4();

                if (this.aResultSecure["code"] == 0) {
                    this.aResultSecure["code"] = 1000;
                    this.aResultSecure["msg"] = "����+����, Ȥ�� ����+Ư������ �� ��й�ȣ�� �����Ͽ� �Է��� �ּ���.";
                }
            // }
            return this.aResultSecure;
        },

        checkRegexp: function () {
            var rStr = "";
            if (this.sRegexp1.test(this.sPassword)) {   // ���� �ҹ���
                rStr += "1";
            }
            if (this.sRegexp2.test(this.sPassword)) {   // ���� �빮��
                rStr += "2";
            }
            if (this.sRegexp3.test(this.sPassword)) {   // ����
                rStr += "3";
            }
            if (this.sRegexp4.test(this.sPassword)) {   // ���� Ư������
                rStr += "4";
            }
            return rStr;
        },

        checkPasswordLevel1: function () {
            var sTemp = "";
            for (var x = 0; x < this.sPassword.length; x++) {
                sTemp = this.sPassword.substr((x * 1), 1);
                if (!this.sCheckRegexp2.test(sTemp)) {
                    this.aResultSecure["code"] = 1;
                    this.aResultSecure["msg"] = "[" + sTemp + "]�� ��� �Ұ����� Ư�������Դϴ�.";
                    break;
                }
            }
        },

        checkPasswordLevel2: function () {
            if (this.sPassword.length >= 8 && this.sPassword.length <= 9) {
                if (this.sResultRegexp.length == 2) {
                    this.aResultSecure["code"] = 2;
                    this.aResultSecure["msg"] = "2���� �����̸� ���̰� 8�ڿ��� 9�� �����Դϴ�.";
                }
            }
        },

        checkPasswordLevel3: function () {
            if (this.sPassword.length >= 10 && this.sPassword.length <= 13) {
                if (this.sResultRegexp.length == 2) {
                    this.aResultSecure["code"] = 3;
                }
            }
            if (this.sPassword.length >= 8) {
                if (this.sResultRegexp == "123") {
                    this.aResultSecure["code"] = 3;
                }
            }
        },

        checkPasswordLevel4: function () {
            if (this.sPassword.length >= 14) {
                if (this.sResultRegexp.length == 2) if (this.sResultRegexp.length == 2) {
                    this.aResultSecure["code"] = 4;
                }
            }
            if (this.sPassword.length >= 9) {
                if (this.sResultRegexp == "123") {
                    this.aResultSecure["code"] = 4;
                }
            }
            if (this.sPassword.length >= 8) {
                if (this.sResultRegexp.length >= 2 && this.sResultRegexp.indexOf("4") > -1) {
                    this.aResultSecure["code"] = 4;
                }
            }
        },

        checkPasswordLevel5: function () {
            if (this.sPassword.length >= 14) {
                if (this.sResultRegexp.length == 2) if (this.sResultRegexp.length == 2) {
                    this.aResultSecure["code"] = 4;
                }
            }
            if (this.sPassword.length >= 9) {
                if (this.sResultRegexp == "123") {
                    this.aResultSecure["code"] = 4;
                }
            }
            if (this.sPassword.length >= 8) {
                if (this.sResultRegexp.length >= 2 && this.sResultRegexp.indexOf("4") > -1) {
                    this.aResultSecure["code"] = 4;
                }
            }
        }

    }

    /**
     * ��й�ȣ �����ϱ�
     */
    function Submit_PWDCheck(){
        var pwdForm = document.passwordForm;

        var oldPwd = pwdForm.p_pwd_old.value;
        var newPwd = pwdForm.p_pwd.value;
        var newPwdRe = pwdForm.p_pwd_re.value;

        var chk_num = "";
        var chk_lower = "";
        var chk_upper = "";
        var chk_special = "";

        // ��й�ȣ ���� ����

        var p_pwd_len =  pwdForm.p_pwd.value.length;
        var pass_old = pwdForm.p_pwd_old.value;
        var p_pwd_len_old = pass_old.length;

        chk_num = pwdForm.p_pwd.value.search(/[0-9]/g);
        chk_lower = pwdForm.p_pwd.value.search(/[a-z]/ig);
        chk_upper = pwdForm.p_pwd.value.search(/[A-Z]/ig);
        chk_special = pwdForm.p_pwd.value.search(/[^a-zA-Z0-9]/g);

        if ( oldPwd.length <= 0){
            alert("���� ��й�ȣ�� �Է����ּ���.");
            pwdForm.p_pwd_old.focus();
            return;
        } else if (p_pwd_len <= 0){
            alert("�� ��й�ȣ�� �Է����ּ���.");
            pwdForm.p_pwd.focus();
            return;
        } else {
            if (pwdForm.p_pwd.value != "") {
                //if (!/^[a-zA-Z0-9]{9,14}$/.test(pwdForm.p_pwd.value) || (chk_num < 0 || chk_lower< 0 || chk_upper < 0)){
                if ( p_pwd_len < 9 || p_pwd_len > 14 || chk_lower< 0 || chk_upper < 0 ||  (chk_num < 0 && chk_special< 0 ) ){
                    alert("��й�ȣ�� ���� ��/�ҹ��ڿ� ���� �Ǵ� Ư�����ڸ� ȥ���Ͽ� 9-14�ڸ��� �Է��� �ּ���.");
                    pwdForm.p_pwd.value="";
                    pwdForm.p_pwd.focus();
                    return;
                }

                if( pwdForm.p_pwd.value == pwdForm.p_userid.value){
                    alert("���̵�� ������ ��й�ȣ�� ��� �Ͻ� �� �����ϴ�.");
                    pwdForm.p_pwd.value="";
                    pwdForm.p_pwd.focus();return;
                }

                if( (pwdForm.p_pwd_re.value) == ""){
                    alert("�� ��й�ȣȮ���� �Է��ϼ���");
                    pwdForm.p_pwd_re.focus();return;
                 }

                if(pwdForm.p_pwd.value != pwdForm.p_pwd_re.value){
                    alert("�� ��й�ȣ�� �ٸ��� �ԷµǾ����ϴ�.");
                    pwdForm.p_pwd.value;
                    pwdForm.p_pwd_re.value = "";
                    pwdForm.p_pwd_re.focus();
                    return;
                }
            }
        }

        // ��й�ȣ ����
        pwdForm.target = "_self";
        pwdForm.action = https_host() + "/servlet/controller.homepage.MainMemberJoinServlet";
        pwdForm.p_process.value = "ChangePwdOk";
        pwdForm.submit();
    }

    var gPasswordLevel = "";

    /**
     * ���ȵ�� �ȳ� ���� toggle �Լ�
     */
    function fnToggleDiv( isShow ) {
        if ( isShow ) {
            $(".secure_info").css( {"display" : "inline-block"} );
        } else {
            $(".secure_info").css( {"display" : "none"} );
        }
    }

    function fnCheckPasswordLevel() {
        var pwd = $("#oNewPwd").val();
        gPasswordLevel = fnGetPasswordLevel(pwd);

        var msg = "��Ȯ��";
        if ( gPasswordLevel == 1) {
            msg = "<font style='color:#ff0000;'>�Ұ�</font>";
        } else if ( gPasswordLevel == 2) {
            msg = "<font style='color:#ff8000;'>����</font>";
        } else if ( gPasswordLevel == 3) {
            msg = "<font style='color:#80ff80;'>����</font>";
        } else if ( gPasswordLevel == 4) {
            msg = "<font style='color:#0000ff;'>����</font>";
        }


        $("#oLevelMessage").html(msg);
    }

    function fnUpdateUserPassword() {
        var docForm = document.form1;
        var oldPwd = docForm.p_pwd_old.value;
        var newPwd = docForm.p_pwd.value;
        var newPwdRe = docForm.p_pwd_re.value;

        var secureLevel = "";

        if (oldPwd.length == 0) {
            alert("���� ��й�ȣ�� �Է��ϼ���.");
            docForm.p_pwd_old.focus();
            return;
        } else if (newPwd.length == 0) {
            alert("���ο� ��й�ȣ�� �Է��ϼ���.");
            docForm.p_pwd.focus();
            return;
        } else {
            alert(secureLevel);
        }
    }