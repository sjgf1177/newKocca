<%@ page import="com.credu.library.RequestBox" %>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<script type="text/javascript">
	var idExists = false;
	var emailExists = false;
	
	$(document).ready(function(){
		$(document).on("keyup", "input:text[name=p_kor_name]", function(){
			$(this).val($(this).val().replace(/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"\\]/g,""));
		});
		
		$(document).on("keyup", "input:text[name=p_id]", function(){
			$(this).val($(this).val().replace(/[^a-z0-9]/g,""));
			idExists = false;
		});
		
		$("#p_pw1").on("keyup", function(){
			var newpw = $("#p_pw1").val();
			var id = $("#p_id").val();
			
			var reg = /^.*(?=.{8,16})(?=.*[0-9!@#$%^&*()_+=<>?])(?=.*[a-zA-Z]).*$/;
			var msg = "";
			if(false === reg.test(newpw)) {
				msg = "����Ҽ� ���� ��й�ȣ �Դϴ�.";
				$("#chkMsg").css("color", "red");
				
			}else if(/(\w)\1\1/.test(newpw)){
				msg = "����Ҽ� ���� ��й�ȣ �Դϴ�.";
				$("#chkMsg").css("color", "red");
				
			}else if(newpw.search(id) > -1){
				msg = "����Ҽ� ���� ��й�ȣ �Դϴ�.";
				$("#chkMsg").css("color", "red");
				
			}else if(newpw.search(/\s/) != -1){
				msg = "����Ҽ� ���� ��й�ȣ �Դϴ�.";
				$("#chkMsg").css("color", "red");
				
			}else if(newpw.length > 16 ){
				msg = "����Ҽ� ���� ��й�ȣ �Դϴ�.";
				$("#chkMsg").css("color", "red");
				
			}else{
				msg = "����Ҽ� �ִ� ��й�ȣ �Դϴ�.";
				$("#chkMsg").css("color", "green");
				
			}
			$("#chkMsg").text(msg);
			
		});
		$(document).on("keyup", "#p_birth_year, #p_birth_month, #p_birth_day, #p_tel1, #p_tel2, #p_mobil1, #p_mobil2", function(){
			$(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		
		$(document).on("keyup", "input:text[name=p_email1], input:text[name=p_email2]", function(){
			emailExists = false;
		});
		
		$(document).on("keyup", ".companyName", function(){
			$(this).val($(this).val().replace(/\s/gi,""));
		});
		
		$(document).on("change", "#p_email20", function(){
	        $("#p_email2").val($("#p_email20").val());
	        emailExists = false;
		});
		
		$(document).on("click", "#btn_cancel", function(){
			location.href = '/';
		});
		
		$(document).on("click", "#btn_next", function(){
			/* �׸� ���� ���� */
			$("input:text[name='p_kor_name']").val($.trim($("input:text[name='p_kor_name']").val()));
			$("input:text[name='p_birth_year']").val($.trim($("input:text[name='p_birth_year']").val()));
			$("input:text[name='p_birth_month']").val(addZero($.trim($("input:text[name='p_birth_month']").val())));
			$("input:text[name='p_birth_day']").val(addZero($.trim($("input:text[name='p_birth_day']").val())));
			$("input:text[name='p_id']").val($.trim($("input:text[name='p_id']").val()));
			$("input:text[name='p_email1']").val($.trim($("input:text[name='p_email1']").val()));
			$("input:text[name='p_email2']").val($.trim($("input:text[name='p_email2']").val()));
			$(".companyName").val($.trim($(".companyName").val()));
			
			if($(".companyName").length > 0 && $('.companyName').val() == ""){
				alert("ȸ����� �Է��Ͽ� �ֽʽÿ�.");
				$(".companyName").focus();
				return;
			}
			
			if($("input:text[name='p_kor_name']").val() == ""){
				alert("�̸��� �Է��Ͽ� �ֽʽÿ�.");
				$("input:text[name=p_kor_name]").focus();
				return;
			}
			
			if($("input:text[name='p_birth_year']").val() == "" || $("input:text[name='p_birth_year']").val().length < 4){
				alert("������� �⵵ 4�ڸ��� �Է��Ͽ� �ֽʽÿ�.");
				$("input:text[name=p_birth_year]").focus();
				return;
			}
			
			if($("input:text[name='p_birth_month']").val() == ""){
				alert("������� ���� �Է��Ͽ� �ֽʽÿ�.");
				$("input:text[name=p_birth_month]").focus();
				return;
			}
			
			if($("input:text[name='p_birth_day']").val() == ""){
				alert("������� ���� �Է��Ͽ� �ֽʽÿ�.");
				$("input:text[name='p_birth_day']").focus();
				return;
			}
			
			
			if(!$("input:radio[name='p_sex']").is(':checked')){
				alert("������ �����Ͻʽÿ�.");
				$("input:radio[name='p_sex']").focus();
				return;
			}
			
			if($("input:text[name='p_id']").val() == ""){
				alert("���̵� �Է��Ͽ� �ֽʽÿ�.");
				$("input:text[name='p_id']").focus();
				return;
			}
			
			if(!idExists){
				alert("���̵� �ߺ�Ȯ���� �Ͻñ� �ٶ��ϴ�.");
				$("input:text[name='p_id']").focus();
	            return;
			}
			
			if($("input:password[name='p_pw1']").val() == ""){
				alert("��й�ȣ�� �Է��Ͽ� �ֽʽÿ�.");
				$("input:password[name='p_pw1']").focus();
				return;
			}
			
			if($("input:password[name='p_pw1']").val().length < 8){
				alert("��й�ȣ�� 8�ڸ� �̻��̾�� �մϴ�.");
				$("input:password[name='p_pw1']").focus();
				return;
			}
			
			if($("input:password[name='p_pw2']").val() == ""){
				alert("��й�ȣ Ȯ���� �Է��Ͽ� �ֽʽÿ�.");
				$("input:password[name='p_pw2']").focus();
				return;
			}
			
			if($("input:password[name='p_pw2']").val().length < 8){
				alert("��й�ȣ Ȯ���� 8�ڸ� �̻��̾�� �մϴ�.");
				$("input:password[name='p_pw2']").focus();
				return;
			}
			
			if($("input:password[name='p_pw1']").val() != $("input:password[name='p_pw2']").val()){
				alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
				$("input:password[name='p_pw1']").focus();
				return;
			}
			
			if($("select[name='p_tel0']").val() == ""){
				alert("��ȭ��ȣ ���ڸ��� �����Ͽ� �ֽʽÿ�.");
				$("select[name='p_tel0']").focus();
				return;
			}
			
			if($("input:text[name='p_tel1']").val() == ""){
				alert("��ȭ��ȣ �߰��ڸ��� �Է��Ͽ� �ֽʽÿ�.");
				$("input:text[name='p_tel1']").focus();
				return;
			}
			
			if($("input:text[name='p_tel2']").val() == ""){
				alert("��ȭ��ȣ ���ڸ��� �Է��Ͽ� �ֽʽÿ�.");
				$("input:text[name='p_tel2']").focus();
				return;
			}
			
			if($("select[name='p_mobil0']").val() == ""){
				alert("�޴��� ���ڸ��� �����Ͽ� �ֽʽÿ�.");
				$("select[name='p_mobil0']").focus();
				return;
			}
			
			if($("input:text[name='p_mobil1']").val() == ""){
				alert("�޴��� �߰��ڸ��� �Է��Ͽ� �ֽʽÿ�.");
				$("input:text[name='p_mobil1']").focus();
				return;
			}
			
			if($("input:text[name='p_mobil2']").val() == ""){
				alert("�޴��� ���ڸ��� �Է��Ͽ� �ֽʽÿ�.");
				$("input:text[name='p_mobil2']").focus();
				return;
			}
			
			if($("input:text[name='p_email1']").val() == ""){
				alert("�̸��� ���̵� �Է��Ͽ� �ֽʽÿ�.");
				$("input:text[name='p_email1']").focus();
				return;
			}
			
			if($("input:text[name='p_email2']").val() == ""){
				alert("�̸���  �ּҸ� �Է��Ͽ� �ֽʽÿ�.");
				$("input:text[name='p_email2']").focus();
				return;
			}
			
			if(!emailExists){
	            alert("�̸��� �ߺ�Ȯ���� �Ͻñ� �ٶ��ϴ�.");
	            $("input:text[name='p_email1']").focus();
	            return;
	        }
			
			if($("input:checkbox[name='p_agreed']").is(':checked')){
				$("input:checkbox[name='p_agreed']").val("Y");
			}else{
				$("input:checkbox[name='p_agreed']").val("N");
			}
			
			document.form_join.p_process.value = "ASP_Login_Insert";
            document.form_join.menuid.value = "0";
            document.form_join.gubun.value = "4";
            document.form_join.action = "/servlet/controller.homepage.MainServlet";
            document.form_join.submit();
		});
	});
	
	function addZero(num){
		return parseInt(num, 10) < 10 ? "0" + parseInt(num, 10) : num;
	}
	
	function existsId(){
		var id = $("#p_id").val();
		if(id == ""){
			alert("���̵� �Է��Ͽ� �ֽʽÿ�.");
			$("input:text[name='p_id']").focus();
			return;
		}
		
		if(id.length < 6 || id.length > 30){
			alert("���̵�� �� 6~30�ڷθ� ������ �Ǿ�� �մϴ�.");
			$("input:text[name='p_id']").focus();
			return;
		}
		
		$.ajax({
			url : '/servlet/controller.homepage.MainServlet',
			type : 'post',
			data : {userId:id, p_process:"ASP_Login", menuid:"0", gubun:"20"},
			success : function(data){
				var result = $.trim(data);
				$("#id_alter_area").text("");
				idExists=false;
				
				if(result == "1"){
					idExists = true;
					$("#id_alter_area").css("color","#0000FF");
					$("#id_alter_area").text("����Ҽ� �ִ� ���̵� �Դϴ�.");
					alert("����Ҽ� �ִ� ���̵� �Դϴ�.");
					return;
				}else{
					idExists = false;
					$("#id_alter_area").css("color","#FF0000");
					$("#id_alter_area").text("����Ҽ� ���� ���̵� �Դϴ�.");
					alert("����Ҽ� ���� ���̵� �Դϴ�.");
					return;
				}
			}
		});
	}
	
	function existsEmail(){
		var email1 = $.trim($("input:text[name='p_email1']").val());
		var email2 = $.trim($("input:text[name='p_email2']").val());
		if(email1 == "" || email2 == ""){
			alert("�̸����� �Է��Ͽ� �ֽʽÿ�.");
			if(email1 == ""){
				$("input:text[name='p_email1']").focus();
			}else{
				$("input:text[name='p_email2']").focus();
			}
			return;
		}
		
		$.ajax({
			url : '/servlet/controller.homepage.MainServlet',
			type : 'post',
			data : {userEmail:email1+"@"+email2, p_process:"ASP_Login", menuid:"0", gubun:"25"},
			success : function(data){
				var result = $.trim(data);
				$("#email_alter_area").text("");
				emailExists=false;
				
				if(result == "1"){
					emailExists = true;
					$("#email_alter_area").css("color","#0000FF");
					$("#email_alter_area").text("����Ҽ� �ִ� �̸��� �Դϴ�.");
					alert("����Ҽ� �ִ� �̸��� �Դϴ�.");
					return;
				}else{
					emailExists = false;
					$("#email_alter_area").css("color","#FF0000");
					$("#email_alter_area").text("����Ҽ� ���� �̸��� �Դϴ�.");
					alert("����Ҽ� ���� �̸��� �Դϴ�.");
					return;
				}
			}
		});
	}
</script>
<section>
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <jsp:include page="/learn/user/typeB/include_left/left_0.jsp">
                    	<jsp:param value="1" name="left_active"/>
                    </jsp:include>
                    <div class="subContainer">
                        <div class="sub_section">
                            <div class="sub_contents_header">
                                <span>ȸ������</span>
                                <div class="linemap_wrap">
                                    <ul>
                                        <li>
                                            <a href="#">
                                                <span>
                                                    <img src="/common/image/home_icon.png" alt="����">
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#"><span>ȸ��/�α���</span></a>
                                        </li>
                                        <li>
                                            <a href="#"><span>ȸ������</span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sub_contents_body">
                                <div class="sub_info_body join_box">
                                    <div class="signUp_step_bar">
                                        <div class="step_wrap">
                                            <p>
                                                <span>STEP1</span>�̿��� ����
                                            </p>
                                        </div>
                                        <div class="step_line_wrap">
                                            <div class="step_right_arrow"></div>
                                        </div>
                                        <div class="step_wrap active">
                                            <p>
                                                <span>STEP2</span>ȸ������ �Է�
                                            </p>
                                        </div>
                                        <div class="step_line_wrap">
                                            <div class="step_right_arrow"></div>
                                        </div>
                                        <div class="step_wrap">
                                            <p>
                                                <span>STEP3</span>���ԿϷ�
                                            </p>
                                        </div>
                                    </div>
                                    <p class="sub_course_view_title">ȸ������</p>
                                    <div class="sub_course_view_wrap">
                                        <div class="info_box">
                                        	<form name="form_join" id="form_join" method="POST">
                                        		<input type="hidden" name="p_process" value="" />
                                        		<input type="hidden" name="menuid" value="" />
                                        		<input type="hidden" name="gubun" value="" />
	                                            <table class="write_table th_align_left1">
	                                                <colgroup>
	                                                    <col width="30%">
	                                                    <col width="auto">
	                                                </colgroup>
	                                               	<tbody>
		                                                <c:choose>
	                                                    	<c:when test="${sessionScope.tem_grcode eq 'N000210'}">
	                                                    		<tr>
		                                                    		<th><span>*</span>ȸ���</th>
			                                                        <td>
			                                                        	<input type="text" style="width:100%" name="p_deptnm" id="p_deptnm" title="ȸ���" class="companyName">
			                                                        	<span>[�� ���� ���� ��Ȯ�� ȸ����� �Է����ּ���.]</span>
			                                                        </td>
			                                                    </tr>
		                                                        <tr>
			                                                        <th><span>*</span>����(�ѱ�)111</th>
			                                                        <td><input type="text" name="p_kor_name" id="p_kor_name" title="����(�ѱ�)"></td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>�������</th>
			                                                        <td>
			                                                            <input type="text" name="p_birth_year" id="p_birth_year" maxlength="4" class="year" title="������� (�⵵)">��
			                                                            <input type="text" name="p_birth_month" id="p_birth_month" maxlength="2" class="month" title="������� (��)">��
			                                                            <input type="text" name="p_birth_day" id="p_birth_day" maxlength="2" class="day" title="������� (��)">��
			                                                            <span>��(1972�� 01�� 01��)</span>
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>����</th>
			                                                        <td>
			                                                            <input type="radio" name="p_sex" value="2" id="gender2" title="����">
			                                                            <label for="gender2">����</label>
			                                                            <input type="radio" name="p_sex" value="1" id="gender1" title="����">
			                                                            <label for="gender1">����</label>
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>���̵�</th>
			                                                        <td>
			                                                            <input type="text" name="p_id" id="p_id" maxlength="16" title="���̵� 6~16���� ����, ���� ����" />
			                                                            <a href="javascript:existsId();">�ߺ�Ȯ��</a>
			                                                            <span id="id_alter_area"></span>
			                                                            <span>* ���̵�� 6~30���� �ҹ��� ����, ������ �������� ���� �� �ֽ��ϴ�.</span>
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>��й�ȣ</th>
			                                                        <td>
			                                                            <input type="password" name="p_pw1" id="p_pw1" title="��й�ȣ (8�� �̻��� ���� Ȥ�� �������� �Է����ּ���. ���ӵ� ����, ����, �ֹι�ȣ �� �˱⽬�� ���ڴ� �����ּ���.)" />
			                                                            <div id="chkMsg" style="font-size:12px;"></div>
					                                                    <span>* ��й�ȣ�� 8 ~ 16�� �̾�� �ϸ�, ����/�빮��/�ҹ���/Ư�����ڸ� ��� �����ؾ� �մϴ�.</span>
					                                                    <span>* ID�� ������ ��й�ȣ, ���Ϲ���, ���ӹ��� ���� ����Ͻ� �� �����ϴ�.</span>
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>��й�ȣ Ȯ��</th>
			                                                        <td>
			                                                            <input type="password" name="p_pw2" id="p_pw2" title="��й�ȣ Ȯ�� (��й�ȣ�� �����ϰ� �Է����ּ���.)">
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>��ȭ��ȣ</th>
			                                                        <td><label for="p_tel0"></label>
			                                                            <select class="phone1" name="p_tel0" id="p_tel0" title="��ȭ��ȣ ���ڸ� ����">
			                                                                <option value="02" title="02">02</option>
			                                                                <option value="031" title="031">031</option>
			                                                                <option value="032" title="032">032</option>
			                                                                <option value="033" title="033">033</option>
			                                                                <option value="041" title="041">041</option>
			                                                                <option value="042" title="042">042</option>
			                                                                <option value="043" title="043">043</option>
			                                                                <option value="044" title="044">044</option>
			                                                                <option value="051" title="051">051</option>
			                                                                <option value="052" title="052">052</option>
			                                                                <option value="053" title="053">053</option>
			                                                                <option value="054" title="054">054</option>
			                                                                <option value="055" title="055">055</option>
			                                                                <option value="061" title="061">061</option>
			                                                                <option value="062" title="062">062</option>
			                                                                <option value="063" title="063">063</option>
			                                                                <option value="064" title="064">064</option>
			                                                                <option value="070" title="070">070</option>
			                                                            </select>
			                                                            -
			                                                            <input type="text" class="phone2" name="p_tel1" id="p_tel1" maxlength="4" title="��ȭ��ȣ �߰��ڸ� �Է�">-
			                                                            <input type="text" class="phone3" name="p_tel2" id="p_tel2" maxlength="4" title="��ȭ��ȣ ���ڸ� �Է�">
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>�޴���</th>
			                                                        <td><label for="p_mobil0"></label>
			                                                            <select class="phone1" name="p_mobil0" id="p_mobil0" title="�޴��� ���ڸ� ����">
			                                                                <option value="010" title="010">010</option>
			                                                                <option value="011" title="011">011</option>
			                                                                <option value="016" title="016">016</option>
			                                                                <option value="017" title="017">017</option>
			                                                                <option value="018" title="018">018</option>
			                                                                <option value="019" title="019">019</option>
			                                                            </select>
			                                                            -
			                                                            <input type="text" class="phone2" name="p_mobil1" id="p_mobil1" maxlength="4" title="�޴��� �߰��ڸ� �Է�">-
			                                                            <input type="text" class="phone3" name="p_mobil2" id="p_mobil2" maxlength="4" title="�޴��� ���ڸ� �Է�">
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>�̸���</th>
			                                                        <td>
			                                                            <input type="text" class="email1" name="p_email1" id="p_email1" title="�̸���  ���̵�">@
			                                                            <input type="text" class="email2" name="p_email2" id="p_email2" title="�̸���  �ּ�">
			                                                            <label for="p_email20"></label>
			                                                            <select class="email3" name="p_email20" id="p_email20" title="�̸���  �ּ� ����">
			                                                                <option value="" title="�����Է�">�����Է�</option>
			                                                                <option value="naver.com" title="naver.com">naver.com</option>
			                                                                <option value="gmail.com" title="gmail.com">gmail.com</option>
			                                                                <option value="hanmail.net" title="hanmail.net">hanmail.net</option>
			                                                                <option value="nate.com" title="nate.com">nate.com</option>
			                                                            </select>
			                                                            <a href="javascript:existsEmail();" title="�̸��� �ߺ�Ȯ��">�ߺ�Ȯ��</a>
			                                                            <span id="email_alter_area"></span>
			                                                            <span>* �ѱ���������������� �����ϴ� ������ ��� ȸ������ ���������� �ʿ��� ������ �ַ� ����Ͻô� �̸��� �ּҸ� �Է��� �ּ���.</span>
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th>�������� ����</th>
			                                                        <td>
			                                                            <input type="checkbox" name="p_agreed" id="p_agreed" value="Y" title="�������� ���� (���� �� �̺�Ʈ �ҽ��� E-Mail Ȥ�� SMS���� ���� �ϰڽ��ϴ�.)">
			                                                            <label for="p_agreed">���� �� �̺�Ʈ �ҽ��� E-Mail Ȥ�� SMS���� ���� �ϰڽ��ϴ�.</label>
			                                                        </td>
			                                                    </tr>
	                                                    	</c:when>
	                                                    	<c:otherwise>
	                                                    		<tr>
			                                                        <th><span>*</span>����(�ѱ�)</th>
			                                                        <td><input type="text" name="p_kor_name" id="p_kor_name" title="����(�ѱ�)"></td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>�������</th>
			                                                        <td>
			                                                            <input type="text" name="p_birth_year" id="p_birth_year" maxlength="4" class="year" title="������� (�⵵)">��
			                                                            <input type="text" name="p_birth_month" id="p_birth_month" maxlength="2" class="month" title="������� (��)">��
			                                                            <input type="text" name="p_birth_day" id="p_birth_day" maxlength="2" class="day" title="������� (��)">��
			                                                            <span>��(1972�� 01�� 01��)</span>
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>����</th>
			                                                        <td>
			                                                            <input type="radio" name="p_sex" value="2" id="gender2" title="����">
			                                                            <label for="gender2">����</label>
			                                                            <input type="radio" name="p_sex" value="1" id="gender1" title="����">
			                                                            <label for="gender1">����</label>
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>���̵�</th>
			                                                        <td>
			                                                            <input type="text" name="p_id" id="p_id" maxlength="16" title="���̵� 6~16���� ����, ���� ����" />
			                                                            <a href="javascript:existsId();">�ߺ�Ȯ��</a>
			                                                            <span id="id_alter_area"></span>
			                                                            <span>* ���̵�� 6~30���� ����, ������ �������� ���� �� �ֽ��ϴ�.</span>
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>��й�ȣ</th>
			                                                        <td>
			                                                            <input type="password" name="p_pw1" id="p_pw1" title="��й�ȣ (8�� �̻��� ���� Ȥ�� �������� �Է����ּ���. ���ӵ� ����, ����, �ֹι�ȣ �� �˱⽬�� ���ڴ� �����ּ���.)" />
			                                                            <div id="chkMsg" style="font-size:12px;"></div>
					                                                    <span>* ��й�ȣ�� 8 ~ 16�� �̾�� �ϸ�, ����/�빮��/�ҹ���/Ư�����ڸ� ��� �����ؾ� �մϴ�.</span>
					                                                    <span>* ID�� ������ ��й�ȣ, ���Ϲ���, ���ӹ��� ���� ����Ͻ� �� �����ϴ�.</span>
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>��й�ȣ Ȯ��</th>
			                                                        <td>
			                                                            <input type="password" name="p_pw2" id="p_pw2" title="��й�ȣ Ȯ�� (��й�ȣ�� �����ϰ� �Է����ּ���.)">
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>��ȭ��ȣ</th>
			                                                        <td><label for="p_tel0"></label>
			                                                            <select class="phone1" name="p_tel0" id="p_tel0" title="��ȭ��ȣ ���ڸ� ����">
			                                                                <option value="02" title="02">02</option>
			                                                                <option value="031" title="031">031</option>
			                                                                <option value="032" title="032">032</option>
			                                                                <option value="033" title="033">033</option>
			                                                                <option value="041" title="041">041</option>
			                                                                <option value="042" title="042">042</option>
			                                                                <option value="043" title="043">043</option>
			                                                                <option value="044" title="044">044</option>
			                                                                <option value="051" title="051">051</option>
			                                                                <option value="052" title="052">052</option>
			                                                                <option value="053" title="053">053</option>
			                                                                <option value="054" title="054">054</option>
			                                                                <option value="055" title="055">055</option>
			                                                                <option value="061" title="061">061</option>
			                                                                <option value="062" title="062">062</option>
			                                                                <option value="063" title="063">063</option>
			                                                                <option value="064" title="064">064</option>
			                                                                <option value="070" title="070">070</option>
			                                                            </select>
			                                                            -
			                                                            <input type="text" class="phone2" name="p_tel1" id="p_tel1" maxlength="4" title="��ȭ��ȣ �߰��ڸ� �Է�">-
			                                                            <input type="text" class="phone3" name="p_tel2" id="p_tel2" maxlength="4" title="��ȭ��ȣ ���ڸ� �Է�">
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>�޴���</th>
			                                                        <td><label for="p_mobil0"></label>
			                                                            <select class="phone1" name="p_mobil0" id="p_mobil0" title="�޴��� ���ڸ� ����">
			                                                                <option value="010" title="010">010</option>
			                                                                <option value="011" title="011">011</option>
			                                                                <option value="016" title="016">016</option>
			                                                                <option value="017" title="017">017</option>
			                                                                <option value="018" title="018">018</option>
			                                                                <option value="019" title="019">019</option>
			                                                            </select>
			                                                            -
			                                                            <input type="text" class="phone2" name="p_mobil1" id="p_mobil1" maxlength="4" title="�޴��� �߰��ڸ� �Է�">-
			                                                            <input type="text" class="phone3" name="p_mobil2" id="p_mobil2" maxlength="4" title="�޴��� ���ڸ� �Է�">
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>�̸���</th>
			                                                        <td>
			                                                            <input type="text" class="email1" name="p_email1" id="p_email1" title="�̸���  ���̵�">@
			                                                            <input type="text" class="email2" name="p_email2" id="p_email2" title="�̸���  �ּ�">
			                                                            <label for="p_email20"></label>
			                                                            <select class="email3" name="p_email20" id="p_email20" title="�̸���  �ּ� ����">
			                                                                <option value="" title="�����Է�">�����Է�</option>
			                                                                <option value="naver.com" title="naver.com">naver.com</option>
			                                                                <option value="gmail.com" title="gmail.com">gmail.com</option>
			                                                                <option value="hanmail.net" title="hanmail.net">hanmail.net</option>
			                                                                <option value="nate.com" title="nate.com">nate.com</option>
			                                                            </select>
			                                                            <a href="javascript:existsEmail();" title="�̸��� �ߺ�Ȯ��">�ߺ�Ȯ��</a>
			                                                            <span id="email_alter_area"></span>
			                                                            <span>* �ѱ���������������� �����ϴ� ������ ��� ȸ������ ���������� �ʿ��� ������ �ַ� ����Ͻô� �̸��� �ּҸ� �Է��� �ּ���.</span>
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th>�������� ����</th>
			                                                        <td>
			                                                            <input type="checkbox" name="p_agreed" id="p_agreed" value="Y" title="�������� ���� (���� �� �̺�Ʈ �ҽ��� E-Mail Ȥ�� SMS���� ���� �ϰڽ��ϴ�.)">
			                                                            <label for="p_agreed">���� �� �̺�Ʈ �ҽ��� E-Mail Ȥ�� SMS���� ���� �ϰڽ��ϴ�.</label>
			                                                        </td>
			                                                    </tr>
		                                                    	<tr>
		                                                    		<th>
			                                                        	�ҼӺμ�
			                                                        </th>
			                                                        <td><input type="text" style="width:100%" name="p_deptnm" id="p_deptnm" title="�ҼӺμ�"></td>
			                                                    </tr>
	                                                    	</c:otherwise>
	                                                   	</c:choose>
                                                   	</tbody>
	                                            </table>
                                            </form>
                                            <div class="agree_btn_box">
                                                <a href="javascript:void(0);" title="���" class="btn_cancel" id="btn_cancel">���</a>
                                                <a href="javascript:void(0);" title="����" class="btn_next" id="btn_next">����</a>
                                            </div>
                                        </div>
                                    </div>
                                 </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>