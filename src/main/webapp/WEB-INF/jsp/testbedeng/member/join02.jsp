<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script type="text/javascript">
//<![CDATA[
      var title = document.title;
      document.title = "입력항목 작성 < " + title;
//]]>
</script>

<script type="text/javascript" src="/js/miya_validator.js"></script>
<script type="text/javascript">
//<![CDATA[

	var mberSe = "<c:out value='${user.mberSe}'/>";
	var codeIdVal = "<c:out value='${codeId0}'/>";
	var sidoVal = "<c:out value='${param.sido}'/>";
	var gugunVal = "<c:out value='${param.gugun}'/>";

	$(function(){

		$("#brthdy").mask("9999-99-99");

		if (sidoVal != "") getCodeList("gugun", codeIdVal, $("#sido").val(), 2, gugunVal);

		$("select[name=sido]").change(function(){
			var val = $(this).val();
			getCodeList("gugun", codeIdVal, val, 2);
		});

		$("#resdncOvsea").hide();
		$("input[name=resdncSe]").click(function(){
			var val = $(this).val();
			if (val == "02") {
				$("#sido").hide();
				$("#gugun").hide();
				$("#sido").val("");
				$("#gugun").val("");
				$("#resdncOvsea").show();
			}
			else {
				$("#sido").show();
				$("#gugun").show();
				$("#resdncOvsea").hide();
				$("#resdncOvsea").val("");
			}
		});

		crtfcPopup = function(authSe) { // 이메일/휴대폰 인증 팝업창
			var val = "";
			var email = $("#email1").val()+"@"+$("#email2").val();
			var mbtlnum = $("#mbtlnum1").val()+"-"+$("#mbtlnum2").val()+"-"+$("#mbtlnum3").val();
			var height = "343";
			var mode = "";

			if (authSe == "01") {
			 	if (!checkEmailFc()) {
					$("#email1").focus();
					return;
				}
				$("#emailAuthAt").val("Y");
				$("#authEmailAt").val("Y");
				val = email;
				mode = "Y";
			}
			else {
			 	if (!checkMbtlnumFc()) {
					$("#mbtlnum1").focus();
					return;
				}
				val = mbtlnum;
				height = "463";
				mode = "Y";
			}

			window.open("https://edu.kocca.kr/edu/userMember/crtfcPopup.do?viewType=BODY&authSe="+authSe+"&val="+val+"&mode="+mode, "crtfcPopup", "top=300, left=600, width=568, height="+height+", status=yes, resizable=yes, scrollbars=no");
		};

		$("#mbtlnumAuthCmt").hide();
		$("#mbtlnumAuthDel").hide();
		authDel = function() { // 휴대폰 인증 삭제
			$("#mbtlnumAuthAt").val("");
			$("#mbtlnumAuth").show();
			$("#mbtlnumAuthCmt").hide();
			$("#mbtlnumAuthDel").hide();
			$("#mbtlnum1").attr('disabled', false);
			$("#mbtlnum2").attr('disabled', false);
			$("#mbtlnum3").attr('disabled', false);
			$("#mbtlnum").val("");
		};



		parntsCrtfcPopup = function() { // 이메일/휴대폰 인증 팝업창
			var val = "";
			var parntsMbtlnum = $("#parntsMbtlnum1").val()+"-"+$("#parntsMbtlnum2").val()+"-"+$("#parntsMbtlnum3").val();
			var mode = "";

			var form = $("#agreeForm")[0];
			var v = new MiyaValidator(form);

			v.add("parntsMbtlnum1", {
				required : true,
				span : 3,
				glue : "-",
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


			window.open("https://edu.kocca.kr/edu/userMember/parntsCrtfcPopup.do?viewType=BODY&authSe=02&val="+val+"&mode="+mode, "parntsCrtfcPopup", "top=300, left=600, width=568, height="+height+", status=yes, resizable=yes, scrollbars=no");
		};


		parntsAuthDel = function() { // 휴대폰 인증 삭제
			$("#parntsMbtlnumAuthAt").val("");
			$("#parntsMbtlnumAuth").show();
			$("#parntsMbtlnumAuthCmt").hide();
			$("#parntsMbtlnumAuthDel").hide();
			$("#parntsMbtlnum1").attr('disabled', false);
			$("#parntsMbtlnum2").attr('disabled', false);
			$("#parntsMbtlnum3").attr('disabled', false);
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

			var val = $("#parntsMbtlnum1").val()+"-"+$("#parntsMbtlnum2").val()+"-"+$("#parntsMbtlnum3").val();
			$("#mbtlnum1").val($("#parntsMbtlnum1").val());
			$("#mbtlnum2").val($("#parntsMbtlnum2").val());
			$("#mbtlnum3").val($("#parntsMbtlnum3").val());
			if (checkMbtlnumFc()) {
				$("#mbtlnumAuthAt").val("Y");
				$("#mbtlnumAuth").hide();
				$("#mbtlnumAuthCmt").show();
				$("#mbtlnumAuthDel").show();
				$("#mbtlnum1").attr('disabled', true);
				$("#mbtlnum2").attr('disabled', true);
				$("#mbtlnum3").attr('disabled', true);
				$("#mbtlnum").val(val);
				$("#parntsAuthSameBtn").hide();
			}
		});
	});




	//공통 코드목록 화면처리
	function getCodeList(elemntId, codeId, upperCode, depth, code) {
		var $obj = $("#"+ elemntId);
		var url = "/cmmn/cmmncode/codeListJson.do";
		var params = {
			codeId : codeId,
			upperCode : upperCode
		};
		$.get(url, params, function(data) {
			if (data) {
				$obj.empty();
				$("<option>").text("분류 선택").attr("value","").appendTo($obj);
				$.each(data.list, function(key,item) {
					var $codeItem = $("<option>").attr("value", item.code).text(item.codeNm);
					if (code == item.code) $codeItem.attr("selected",true);
					$codeItem.appendTo($obj);
				});
				if ("gugun" == elemntId && "" == upperCode) {
					$("<option>").text("분류 선택").attr("value","").appendTo($("#gugun").empty());
				}
			}
		},"json");
	}

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
	        pattern: "^[a-z0-9]{6,16}$"
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
	    	pattern: "^.*(?=.{9,15})(?=.*[0-9!@#$%^&*()_+=<>?])(?=.*[a-zA-Z]).*$"
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
		var flag = true;
		
		if (checkEmail()) {
			flag = true;

			$.ajaxSetup({
				async: false
			});
			$.post(
				"/edu/member/checkDupEmail.json",
				{email : $("#email1").val()+"@"+$("#email2").val()},
				function(data)
				{
					if (data.resultCode == "success") {
						if (data.emailCnt > 0) {
							alert("이미 가입한 이메일입니다.");
							$("#email1").val("");
							$("#email2").val("");
							flag = false;
						}
					}
				},"json"
			);
		}
		else {
			flag = false;
		}

	    return flag;
	}

	function checkEmail() {
		var form = $("#agreeForm")[0];
		var v = new MiyaValidator(form);

		v.add("email1", {
   	        required: true,
			span: 2,
	       	glue: "@",
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
				{mbtlnum : $("#mbtlnum1").val()+"-"+$("#mbtlnum2").val()+"-"+$("#mbtlnum3").val()},
				function(data)
				{
					if (data.resultCode == "success") {
						if (data.mbtlnumCnt > 0) {
							alert("이미 가입한 핸드폰번호입니다.");
							$("#mbtlnum1").val("");
							$("#mbtlnum2").val("");
							$("#mbtlnum3").val("");
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

		v.add("mbtlnum1", {
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



	function checkParntsMbtlnum() {
		var form = $("#agreeForm")[0];
		var v = new MiyaValidator(form);

		v.add("parntsMbtlnum1", {
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

	    v.add("agreAt", {
	        required: true
	    });
	    v.add("userNm", {
	        required: true
	    });
	    v.add("brthdy", {
	        required: true
	    });
	    v.add("sex", {
	        required: true
	    });


	    if ($("#parntsAgreAt").val() == "Y") {

			v.add("parntsNm", {
		        required: true
		    });
		}


	    v.add("emailAt1", {
	        required: true
	    });
	    v.add("smsAt1", {
	        required: true
	    });
	    
	    //rsg20170922
	    v.add("concertEmailAt1", {
	        required: true
	    });
	    v.add("concertSmsAt1", {
	        required: true
	    });
	    


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

		if ($("#parntsAgreAt").val() == "Y") {

			if ($("#parntsMbtlnumAuthAt").val() == "") {
				if (!checkParntsMbtlnum()) {
					$("#parntsMbtlnum1").focus();
					return;
				}
			}
		}


		if (mberSe == "01") {
		 	if (!checkEmailFc()) {
				$("#email1").focus();
				return;
			}
		}

		if ($("#mbtlnumAuthAt").val() == "") { // 휴대폰인증 안했을시 체크(인증할때 자동체크)
		 	if (!checkMbtlnumFc()) {
				$("#mbtlnum1").focus();
				return;
			}
		}

	    v.add("emailAt1", {
	        required: true
	    });
	    v.add("smsAt1", {
	        required: true
	    });

	    if ($("#parntsAgreAt").val() == "Y") {
	    	if ($("#parntsMbtlnumAuthAt").val() == "") {
	    		alert("보호자 휴대폰번호를 인증해야 합니다.");
	    		return;
	    	}
	    }

		if (mberSe == "01") {
			if ($("#emailAuthAt").val() == "" && $("#mbtlnumAuthAt").val() == "") {
				alert("이메일, 휴대폰 1개이상 인증해야 합니다.");
				return;
			}
		}

		var result = v.validate();
		if (!result) {
			alert(v.getErrorMessage());
			v.getErrorElement().focus();
			return;
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
	
	//20170904
	window.onload = function(){

	    $("#joinNextStep3").on("click", function(){
	        if( $("input[name='agreAt']:checked").val() == 'Y' ){
	            $("#joinStep2").hide();
	            $("#joinStep3").show();
	        }else{
	            alert("개인정보 수집 및 이용 내용에 동의해주세요.");
	        }
	    });
	    
	    $("#joinPrevStep3").on("click", function(){//rsg20170904
	    	if ( confirm("이전 페이지로 돌아가시겠습니까?") ) {
	            $("#joinStep3").hide();
	            $("#joinStep2").show();
	    	}
	    });
	}

//]]>
</script>
<div class="memberStep1">
	<form name="agreeForm" id="agreeForm" action="/testbed/userMember/joinMember.do" method="post">
		<input type="hidden" name="menuNo" value="${paramVO.menuNo}" />
		<input type="hidden" name="snsAuthSe" value='<c:out value="${user.authSe}"/>' />
		<input type="hidden" name="mberSe" id="mberSe" value='<c:out value="${user.mberSe}"/>' />
		<div id="joinStep2">

			<div class="signup_step_bar">
				<div class="step_wrap">
					<p class="step_box">
						<span class="step_title">STEP1</span> 인증방식선택
					</p>
				</div>
				<div class="step_line_wrap">
					<div class="step_right_arrow"></div>
				</div>
				<div class="step_wrap active">
					<p class="step_box">
						<span class="step_title">STEP2</span> 이용약관동의
					</p>
				</div>
				<div class="step_line_wrap">
					<div class="step_right_arrow"></div>
				</div>
				<div class="step_wrap">
					<p class="step_box">
						<span class="step_title">STEP3</span> 입력항목작성
					</p>
				</div>
				<div class="step_line_wrap">
					<div class="step_right_arrow"></div>
				</div>
				<div class="step_wrap">
					<p class="step_box">
						<span class="step_title">STEP4</span> 가입완료
					</p>
				</div>
			</div>
		
			<div>
	            <p class="signup_agree_notice">회원가입을 진행하기 위해서 개인정보보호약관을 우선 주의 깊게 읽어 주십시오.</p>
	            <p class="signup_agree_notice last">개인정보보호약관을 읽고 내용에 동의해 주십시오. </p>
	            <div class="signup_agree_con">
	                <h3>개인정보 수집 및 이용 (필수)</h3>
	                <div tabindex="0" class="agreeScr" style="font-size: 1.45rem; line-height: 2.05rem;">
	                    <ul>
	                        <li>1. 수집 &middot; 이용 목적 : 에듀코카 회원가입을 위한 사용자 정보 수집 및 이용</li>
	                        <li>2. 개인정보 수집 항목 :
	                            <div class="m1">
	                                <dl>
	                                    <dt>[회원가입]</dt>
	                                    <dd>
	                                        필수항목 : 아이디, 비밀번호, 이름, 생년월일, 성별, 이메일, 휴대폰, 정보수신 여부 <span
	                                            class="db text-danger">14세 미만인 경우 보호자의 이름, 휴대폰 번호</span>
	
	                                    </dd>
	                                    <dd>선택항목 : 거주지, 직업</dd>
	                                </dl>
	                            </div>
	                        </li>
	                        <li>3. 개인정보 보유 및 이용기간 : 회원탈퇴시 까지, 3년 이상 홈페이지에 접속이 없는 경우</li>
	                        <li>4. 동의 거부 시 불이익에 관한 사항 : 수집 &middot; 이용에 관한 사항의 동의를 거부할 때에는
	                            서비스의 이용이 제한됩니다. 단, 선택정보 사항을 획득하지 못한 사유로 인하여 서비스 제공을 거부하지 않습니다.</li>
	                    </ul>
	
	                </div>
	                <div class="agreeScrBtm" style="line-height: 2.05rem; font-size: 1.45rem;">
	                    위 개인정보 수집 및 이용 내용에
	                    <span class="radio_box_con">
		                    <input type="radio" name="agreAt" value="Y" id="agreAt1" class="radio_style_0">
		                    <label for="agreAt1">동의합니다.</label>
	                    </span>
	                    <span class="radio_box_con">
		                    <input type="radio" name="agreAt" value="N" id="agreAt2" class="radio_style_0" checked="checked">
		                    <label for="agreAt2">동의하지 않습니다.</label>
	                    </span>
	                </div>
	            </div>
	        </div>
			
			<div class="fr board_util_btn_con">
                <a href="/testbed/member/join01.do?menuNo=700121" onclick="return confirm('취소하시겠습니까?');" class="btn_style_0 close white_color_btn">
                    취소
                </a>
                <a href="javascript:void(0);" class="btn_style_0 full right" id="joinNextStep3">
                    다음
                </a>
            </div>
		
		</div>

		<!--//2단계-->


		<!--/단계-->

		<div id="joinStep3" style="display: none;">
			<div class="signup_step_bar">
				<div class="step_wrap">
					<p class="step_box">
						<span class="step_title">STEP1</span> 인증방식선택
					</p>
				</div>
				<div class="step_line_wrap">
					<div class="step_right_arrow"></div>
				</div>
				<div class="step_wrap">
					<p class="step_box">
						<span class="step_title">STEP2</span> 이용약관동의
					</p>
				</div>
				<div class="step_line_wrap">
					<div class="step_right_arrow"></div>
				</div>
				<div class="step_wrap active">
					<p class="step_box">
						<span class="step_title">STEP3</span> 입력항목작성
					</p>
				</div>
				<div class="step_line_wrap">
					<div class="step_right_arrow"></div>
				</div>
				<div class="step_wrap">
					<p class="step_box">
						<span class="step_title">STEP4</span> 가입완료
					</p>
				</div>
			</div>
			<div class="signup_write_con">
				<!--기본정보-->
				<h5 class="line">기본정보</h5>
				<table class="table_style_0" summary="정보입력 게시판">
					<caption>기본정보 테이블 입니다</caption>
					<colgroup>
						<col width="auto" class="table_header_column">
						<col width="auto">
					</colgroup>
					<tbody>
					<tr>
						<th class="warning_text">
							<span>이름</span>
						</th>
						<td>
							<span class="board_type_1_input_con">
								<input type="text" id="user_name" class="input_style_0 size_40" name="userNm" id="userNm" value="" placeholder="홍길동">
								<label for="user_name"></label>
							</span>
						</td>
					</tr>
					<tr>
						<th class="warning_text">
							<span>생년월일 / 성별</span>
						</th>
						<td>
							<span class="board_type_1_input_con">
								<input type="text" id="brthdy" name="brthdy" class="sdate input_style_0 size_40" style="width:125px" value="" />
							</span>
							<hr class="calender_line">
							<span class="radio_box_con">
								<input type="radio" class="radio_style_0"  name="sex" value="M" id="sex1" <c:if test="${user.sex eq 'M'}">checked="checked" </c:if>>
								<label for="sex1">남자</label>
							</span>
							<span class="radio_box_con">
								<input type="radio" class="radio_style_0" name="sex" value="W" id="sex2" <c:if test="${user.sex eq 'W'}">checked="checked" </c:if>>
								<label for="sex2">여자</label>
							</span>
						</td>
					</tr>
					</tbody>
				</table>
				<!--//기본정보-->
	
				<!--로그인정보-->
				<h5 class="line">로그인 정보</h5>
				<table class="table_style_0" summary="정보입력 게시판">
					<caption>로그인 정보 테이블 입니다</caption>
					<colgroup>
						<col width="auto" class="table_header_column">
						<col width="auto">
					</colgroup>
					<tbody>
					<tr>
						<th class="warning_text">
							<span>아이디</span>
						</th>
						<td>
							<div class="input_wrap">
	
								<span class="board_type_1_input_con">
									<input type="text" name="userId" id="userId" value="" onkeyup="this.value=checkId(this.value)" style="margin-right:10px;">
									<label for="userId"></label>
									<span class="table_text on" id="id-success"></span>
									<span class="table_text off" id="id-danger"></span>
								</span>
							</div>
							<p>6~16자까지 영문자(소문자), 숫자 사용 가능합니다.</p>
						</td>
					</tr>
					<tr>
						<th class="warning_text">
							<span>비밀번호</span>
						</th>
						<td>
							<div class="input_wrap">
								<span class="board_type_1_input_con">
									<input type="password" class="input_style_0" name="password" id="password" value="" placeholder="******" onkeyup="this.value=checkPwd(this.value)">
									<label for="password"></label>
									<span class="table_text on" id="pwd-success"></span>
									<span class="table_text off" id="pwd-danger"></span>
								</span>
							</div>
							<p>9~15자까지 영문 대/소문자, 숫자, 특수문자중 3개 이상의 조합</p>
							<p>사용자 아이디와 동일한 비밀번호는 사용할 수 없습니다.</p>
							<p>동일문자, 연속문자는 사용할 수 없습니다. (예 aaa, abc 등)</p>
						</td>
					</tr>
					<tr>
						<th class="warning_text">
							<span>비밀번호 확인</span>
						</th>
						<td>
							<span class="board_type_1_input_con">
								<input type="password" class="input_style_0" name="password2" id="password2" value="" onkeyup="this.value=checkPwd2(this.value)">
								<label for="password2"></label>
								<span class="table_text on" id="pwd2-success"></span>
								<span class="table_text off" id="pwd2-danger"></span>
							</span>
						</td>
					</tr>
					</tbody>
				</table>
				<!--//로그인정보-->
	
				<!--필수항목-->
				<h5 class="line">필수항목</h5>
				<table class="table_style_0" summary="정보입력 게시판">
					<caption>필수항목 테이블 입니다</caption>
					<colgroup>
						<col width="auto" class="table_header_column">
						<col width="auto">
					</colgroup>
					<tbody>
					<tr>
						<th class="warning_text">
							<span>이메일</span>
						</th>
						<td>
							<div class="input_wrap">
								<c:choose>
									<c:when test="${user.mberSe eq '01' or user.mberSe eq '03'}">
									<span class="board_type_1_input_con">
										<input name="email1" id="email1" class="input_style_0 size_20" type="text" title="이메일 아이디" value="" />
										<label for="email1"></label>
									</span>
									<span class="table_text line">@</span>
									<span class="board_type_1_input_con">
										<input type="text" name="email2" id="email2" class="input_style_0 size_20" title="이메일 주소" value="" />
										<label for="email2"></label>
									</span>
									<span class="board_type_1_select_con">
										<select id="sr_email_more" class="select_style_1 arrow size_20 select_email_js" title="직접입력 선택시 자동활성화&amp;포커스 이동">
											<option selected="selected">메일주소선택</option>
											<option value="gmail.com">gmail.com</option>
											<option value="naver.com">naver.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="daum.net">daum.net</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="nate.com">nate.com</option>
											<option value="yahoo.co.kr">yahoo.co.kr</option>
											<option value="emaildomain_false">직접입력</option>
										</select>
										<label for="email_address_select"></label>
										<script type="text/javascript">
											//<![CDATA[
											jQuery(function(){
												$('#email2').attr('readonly',true);
												$('select.select_email_js').change(function() {
													if ($(this).val()=='emaildomain_false') {
														$('#email2').val('');
														$('#email2').attr('readonly',false).focus();
													}
													else {
														$('#email2').val('');
														$('#email2').val($(this).val());
														$('#email2').attr('readonly',true);
													}
												});
											});
											//]]>
										</script>
										<input type="hidden" name="authEmailAt" id="authEmailAt" value="N" />
										<input type="hidden" name="emailAuthAt" id="emailAuthAt"/> <!-- 스크립트체크 -->
	
									</span>
									<a href="javascript:crtfcPopup('01');" title="새창열림" class="btn btn-default btn-sm">인증하기</a>
									</c:when>
	
									<c:otherwise>
										<c:set var="data" value="${fn:split(user.email,'@')}" />
										<input type="hidden" name="email1" value="${data[0]}"/>
										<input type="hidden" name="email2" value="${data[1]}"/>
										<input type="hidden" name="authEmailAt" value="Y" />
										<input type="hidden" name="emailAuthAt" value="Y"/>
										<c:out value="${user.email}"/>
									</c:otherwise>
								</c:choose>
							</div>
							<p>이메일 인증은 회원 가입 완료 후 인증해주시기바랍니다. (가입 도중에 인증되지 않습니다.)</p>
						</td>
					</tr>
					<tr>
						<th class="warning_text">
							<span>휴대폰</span>
						</th>
						<td>
							<span class="board_type_1_select_con">
								<select class="select_style_1 arrow size_15" name="mbtlnum1" id="mbtlnum1" title="휴대폰 앞자리" >
									<option value="">선택</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
								<label for="mbtlnum1"></label>
							</span>
							<span class="table_text line">-</span>
							<span class="board_type_1_input_con">
								<input type="text" value="" id="mbtlnum2" name="mbtlnum2" class="input_style_0 size_15 phone" title="휴대폰 중간자리를 입력하세요." maxlength="4" onkeyup="this.value=check_txt(this.value)"/>
								<label for="mbtlnum2"></label>
							</span>
							<span class="board_type_1_input_con">
								<input type="text" class="input_style_0 size_15 phone" value="" id="mbtlnum3" name="mbtlnum3" class="w20p" title="휴대폰 끝자리를 입력하세요." maxlength="4" onkeyup="this.value=check_txt(this.value)"/>
								<label for="mbtlnum3"></label>
							</span>
							<input type="hidden" name="mbtlnum" id="mbtlnum" />
							<input type="hidden" name="mbtlnumAuthAt" id="mbtlnumAuthAt" />
							<a href="javascript:crtfcPopup('02');" title="새창열림" class="btn btn-default btn-sm" id="mbtlnumAuth">인증하기</a>
							<a href="#self" class="btn btn-success btn-sm" id="mbtlnumAuthCmt" style="display:none;">인증완료</a>
							<a href="#self" class="btn btn-default btn-sm" id="parntsAuthSameBtn" style="display:none;">보호자 휴대폰정보와 동일</a>
							<a href="javascript:authDel();" onclick="return confirm('인증삭제를 하시겠습니까?');" class="btn btn-danger btn-sm" id="mbtlnumAuthDel" style="display:none;">인증삭제</a>
						</td>
					</tr>
					<tr>
						<th class="warning_text">
							<span><b>인재캠퍼스</b> 정보수신 여부</span>
						</th>
						<td>
							<div class="input_wrap no_margin">
								<span class="radio_box_con">
									<input type="radio" class="radio_style_0" name="emailAt" value="Y" id="emailAt1">
									<label for="emailAt1">E-mail로 수신하겠습니다.</label>
								</span>
								<span class="radio_box_con">
									<input type="radio" class="radio_style_0" name="emailAt" value="N" id="emailAt2" checked="checked">
									<label for="emailAt2">E-mail로 수신하지 않겠습니다.</label>
								</span>
							</div>
							<div class="radio_wrap no_margin">
								<span class="radio_box_con">
									<input type="radio" class="radio_style_0" name="smsAt" value="Y" id="smsAt1">
									<label for="smsAt1">SNS로 수신하겠습니다.</label>
								</span>
								<span class="radio_box_con">
									<input type="radio" class="radio_style_0" name="smsAt" value="N" id="smsAt2" checked="checked">
									<label for="smsAt2">SNS로 수신하지 않겠습니다.</label>
								</span>
							</div>
							<p>수신을 거부하셔도 “가입완료”, “비밀번호 찾기”등의 메일은 자동 발송됩니다.</p>
						</td>
					</tr>
					<tr>
						<th class="warning_text">
							<span><b>콘텐츠문화광장</b> 정보수신 여부</span>
						</th>
						<td>
							<div class="input_wrap no_margin">
								<span class="radio_box_con">
									<input type="radio" class="radio_style_0" name="concertEmailAt" value="Y" id="concertEmailAt1">
									<label for="concertEmailAt1">E-mail로 수신하겠습니다.</label>
								</span>
								<span class="radio_box_con">
									<input type="radio" class="radio_style_0" name="concertEmailAt" value="N" id="concertEmailAt2" checked="checked">
									<label for="concertEmailAt2">E-mail로 수신하지 않겠습니다.</label>
								</span>
							</div>
							<div class="radio_wrap no_margin">
								<span class="radio_box_con">
									<input type="radio" class="radio_style_0" name="concertSmsAt" value="Y" id="concertSmsAt1">
									<label for="concertSmsAt1">SNS로 수신하겠습니다.</label>
								</span>
								<span class="radio_box_con">
									<input type="radio" class="radio_style_0" name="concertSmsAt" value="N" id="concertSmsAt2" checked="checked">
									<label for="concertSmsAt2">SNS로 수신하지 않겠습니다.</label>
								</span>
							</div>
							<p>콘텐츠문화광장 공연정보 및 관련정보를 Email, SMS로 수신받을 수 있습니다.</p>
						</td>
					</tr>
					</tbody>
				</table>
				<!--//필수항목-->
	
				<!--선택항목-->
				<h5 class="line">선택항목</h5>
				<table class="table_style_0" summary="정보입력 게시판">
					<caption>선택항목 테이블 입니다</caption>
					<colgroup>
						<col width="auto" class="table_header_column">
						<col width="auto">
					</colgroup>
					<tbody>
					<tr>
						<th>
							거주지
						</th>
						<td>
							<span class="radio_box_con">
								<input type="radio" class="radio_style_0"  name="resdncSe" value="01" id="resdncSe1" <c:if test="${empty result}">checked="checked"</c:if>>
								<label for="resdncSe1">국내</label>
							</span>
							<span class="radio_box_con">
								<input type="radio" class="radio_style_0" name="resdncSe" value="02" id="resdncSe2">
								<label for="resdncSe2">해외</label>
							</span>
							<span class="board_type_1_select_con">
								<select class="select_style_1 arrow" name="sido" id="sido" title="시도를 선택해 주세요.">
									<option value="">시도 선택</option>
									<c:forEach var="item" items="${COM063CodeList}">
										<option value="<c:out value="${item.code}" />" ><c:out value="${item.codeNm}" /></option>
									</c:forEach>
								</select>
								<label for="sido"></label>
							</span>
							<span class="board_type_1_select_con">
								<select class="select_style_1 arrow" name="gugun" id="gugun" title="구군을 선택해 주세요.">
									<option value="">구군 선택</option>
								</select>
								<input type="text" name="resdncOvsea" id="resdncOvsea" value="" title="해외인 경우 입력해주세요.">
								<label for="resdncOvsea"></label>
	
							</span>
						</td>
					</tr>
					<tr>
						<th>
							직업
						</th>
						<td>
							<span class="board_type_1_select_con">
								<select class="select_style_1 arrow" name="job" id="job" title="직업을 선택해 주세요.">
									<option value="">선택</option>
									<c:forEach var="code" items="${COM056CodeList}" varStatus="status">
										<option value="${code.code}" ><c:out value="${code.codeNm}"/></option>
									</c:forEach>
								</select>
								<label for="job"></label>
							</span>
						</td>
					</tr>
					</tbody>
				</table>
				<!--//선택항목-->
	
			</div>
			
			<div class="fl board_util_btn_con">
				<a href="#" class="btn_style_0 blue left" id="joinPrevStep3">
					이전
				</a>
			</div>
			<div class="fr board_util_btn_con">
				<a href="/testbed/member/join01.do?menuNo=700121" onclick="return confirm('취소하시겠습니까?');" class="btn_style_0 close white_color_btn">
					취소
				</a>
				<a class="btn_style_0 full check" href="javascript:checkForm();">
					저장
				</a>
			</div>
		</div>


		<!--
		<div id="childDiv" style="display:none;">
			<input type="hidden" name="parntsAgreAt" id="parntsAgreAt" value="" />
			<h3>14세미만 회원에 대한 보호자 동의</h3>
			<div class="tbrinfo text-danger clear"><span class="hide_star"><span class="sr-only">(필수입력)</span></span> 표시 항목은 필수 입력 항목입니다.</div>
			<div class="bdView">
				<table class="table table-bordered">
					<caption>14세미만 회원에 대한 보호자 동의 입력</caption>
					<colgroup>
					<col style="width:16%">
					<col>
					</colgroup>
					<tbody>

						<tr>
							<th><label for="parntsNm"><span class="hide_star"><span class="sr-only">(필수입력)</span></span> 보호자 이름</label></th>
							<td><input name="parntsNm" id="parntsNm" class="w20p" type="text" title="보호자 이름을 입력하세요." value="" />
							</td>
						</tr>

						<tr>
							<th scope="row"><span class="hide_star"><span class="sr-only">(필수입력)</span></span>보호자 휴대폰번호</th>
							<td>
								<input type="hidden" name="parntsMbtlnum" id="parntsMbtlnum" value="" />
								<select name="parntsMbtlnum1" id="parntsMbtlnum1" title="보호자 휴대폰번호 앞자리 선택" >
									<option value="">선택</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
								-
								<input type="text" value="" id="parntsMbtlnum2" name="parntsMbtlnum2" class="w20p" title="보호자 휴대폰번호 중간자리를 입력하세요." maxlength="4" onkeyup="this.value=check_txt(this.value)"/>
								-
								<input type="text" value="" id="parntsMbtlnum3" name="parntsMbtlnum3" class="w20p" title="보호자 휴대폰번호 끝자리를 입력하세요." maxlength="4" onkeyup="this.value=check_txt(this.value)"/>

								<input type="hidden" name="parntsMbtlnum" id="parntsMbtlnum" />
								<input type="hidden" name="parntsMbtlnumAuthAt" id="parntsMbtlnumAuthAt" />

								<a href="javascript:parntsCrtfcPopup('02');" title="새창열림" class="btn btn-default btn-sm" id="parntsMbtlnumAuth">인증하기</a>
								<a href="#self" class="btn btn-success btn-sm" id="parntsMbtlnumAuthCmt" style="display:none;">인증완료</a>
								<a href="javascript:parntsAuthDel();" onclick="return confirm('인증삭제를 하시겠습니까?');" class="btn btn-danger btn-sm" id="parntsMbtlnumAuthDel" style="display:none;">인증삭제</a>
								<p>보호자의 휴대폰번호로 발송되는 인증번호를 입력하시어 인증하시기 바랍니다.</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		--->

	</form>

	

</div>
