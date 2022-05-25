<%@ page import="com.credu.library.RequestBox" %>
<%@ page import="com.credu.library.DataBox" %>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false" %>

<script type="text/javascript">
	$(document).ready(function(){
		if('<c:out value="${ASP_Edit_Login.d_ismailing}" />' == 'Y'){
			$("[name='p_agreed_Yn']").attr("checked", true);
            $("[name='p_agreed']").val("Y");
		}else{
			$("[name='p_agreed_Yn']").attr("checked", false);
            $("[name='p_agreed']").val("N");
		}
		
		$(document).on("keyup", "#p_tel1, #p_tel2, #p_mobil1, #p_mobil2", function(){
			$(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		
		$("#p_pw1").on("keyup", function(){
			var newpw = $("#p_pw1").val();
			var id = "<c:out value='${ASP_Edit_Login.d_userid }'/>";
			
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
		
		$(document).on("click", "#btn_change_pwd", function(){
			var r=$.trim($("[name='p_usepw']").val());
	        var r1=$.trim($("[name='p_pw1']").val());
	        var r2=$.trim($("[name='p_pw2']").val());
	        
	        if(r==""){ alert("���� ��ȣ�� �Է��ϼ���."); $("[name='p_usepw']").focus(); return; }
	        if(r1.length<8){ alert("��ȣ�� �ּ� ���̴� 8�ڸ� �Դϴ�.�ٽ� �Է��ϼ���."); $("[name='p_pw1']").focus(); return; }
	        if(r1==""){ alert("���ο� ��ȣ�� �Է��ϼ���."); $("[name='p_pw1']").focus(); return; }
	        if(r2.length<8){ alert("��ȣ�� �ּ� ���̴� 8�ڸ� �Դϴ�.�ٽ� �Է��ϼ���."); $("[name='p_pw2']").focus(); return; }
	        if(r2==""){ alert("���ο� Ȯ�� ��ȣ�� �ٽ� �Է��ϼ���."); $("[name='p_pw2']").focus(); return; }
	        if(r1!=r2){ alert("��ȣ�� ���� ��ġ���� �ʽ��ϴ�."); $("[name='p_pw1']").val(""); $("[name='p_pw2']").val(""); $("[name='p_pw1']").focus(); return; }

	        $.ajax({
				url : '/servlet/controller.homepage.MainServlet',
				type : 'post',
				data : {p_usepw:r, p_pw1:r1, p_pw2:r2, p_process:"ASP_Login", menuid:"0", gubun:"100"},
				success:function(data){
					var r10=$.trim(data);
	        		if(r10=="0"){
	                    alert("��ȣ�� ��ġ���� �ʰų� ���� ����Ÿ �Դϴ�.");
	        			return;
	        		}else{
	                    alert("��ȣ�� ���������� ���� �Ǿ����ϴ�.");
	                    $("[name='p_usepw']").val('');
	                    $("[name='p_pw1']").val('');
	                    $("[name='p_pw2']").val('');
	                    return;
	        		}
				}
	        });
		});
		
		$(document).on("change", "input[name='p_agreed_Yn']", function(){
			if($("[name='p_agreed_Yn']").is(":checked")){
				$("[name='p_agreed']").val("Y");
			}else{
				$("[name='p_agreed']").val("N");
			}
		});
		
		$(document).on("click", "#btn_next", function(){
			/* if($(".companyName").length > 0 && $('.companyName').val() == ""){
				alert("ȸ����� �Է��Ͽ� �ֽʽÿ�.");
				$(".companyName").focus();
				return;
			} */
			
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
			
			document.form_modify.p_process.value = "ASP_Login_Update";
            document.form_modify.menuid.value = "0";
            document.form_modify.gubun.value = "";
            document.form_modify.action = "/servlet/controller.homepage.MainServlet";
            document.form_modify.submit();
		});
	});

</script>
<section>
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <jsp:include page="/learn/user/typeB/include_left/left_0.jsp">
                    	<jsp:param value="4" name="left_active"/>
                    </jsp:include>
                    <div class="subContainer">
                        <div class="sub_section">
                            <div class="sub_contents_header">
                                <span>�������� ����</span>
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
                                            <a href="#"><span>�������� ����</span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sub_contents_body">
                                <div class="sub_info_body join_box">
                                    <p class="sub_course_view_title">ȸ������</p>
                                    <div class="sub_course_view_wrap">
                                        <div class="info_box">
                                        	<form name="form_modify" id="form_modify" method="POST">
                                        		<input type="hidden" name="p_process" value="" />
                                        		<input type="hidden" name="menuid" value="0" />
                                        		<input type="hidden" name="gubun" value="4" />
                                        		
	                                            <table class="write_table th_align_left1">
	                                                <colgroup>
	                                                    <col width="30%">
	                                                    <col width="auto">
	                                                </colgroup>
	                                                <tbody>
	                                                	<c:choose>
	                                                    	<c:when test="${sessionScope.tem_grcode eq 'N000210'}">
	                                                    		<%-- <tr>
		                                                    		<th>
			                                                        	ȸ���
			                                                        </th>
			                                                        <td>
			                                                        	<input type="text" style="width:100%" name="p_deptnm" id="p_deptnm" title="ȸ���" value="<c:out value="${ASP_Edit_Login.d_deptnam }"/>">
			                                                        	<span>[�� ��Ȯ�� ȸ����� �Է����ּ���.]</span>
			                                                        </td>
		                                                        </tr> --%>
		                                                        <tr>
		                                                    		<th>
			                                                        	ȸ���
			                                                        </th>
			                                                        <td>
			                                                        	<input type="text" name="p_deptnm" id="p_deptnm" title="ȸ���" value="<c:out value="${ASP_Edit_Login.d_deptnam }"/>">
			                                                        </td>
		                                                        </tr>
		                                                        <tr>
			                                                        <th><span>*</span>����(�ѱ�)</th>
			                                                        <td><c:out value="${ASP_Edit_Login.d_name }" /> </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>���̵�</th>
			                                                        <td><c:out value="${ASP_Edit_Login.d_userid }" /></td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>���� ��й�ȣ</th>
			                                                        <td>
			                                                            <input type="password" name="p_usepw" id="p_usepw" title="���� ��й�ȣ" />
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>���ο� ��й�ȣ</th>
			                                                        <td>
			                                                            <input type="password" name="p_pw1" id="p_pw1" title="���ο� ��й�ȣ (8�� �̻��� ���� Ȥ�� �������� �Է����ּ���. ���ӵ� ����, ����, �ֹι�ȣ �� �˱⽬�� ���ڴ� �����ּ���.)">
			                                                            <div id="chkMsg" style="font-size:12px;"></div>
					                                                    <span>* ��й�ȣ�� 8 ~ 16�� �̾�� �ϸ�, ����/�빮��/�ҹ���/Ư�����ڸ� ��� �����ؾ� �մϴ�.</span>
					                                                    <span>* ID�� ������ ��й�ȣ, ���Ϲ���, ���ӹ��� ���� ����Ͻ� �� �����ϴ�.</span>
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>���ο� ��й�ȣ Ȯ��</th>
			                                                        <td>
			                                                            <input type="password" name="p_pw2" id="p_pw2" title="���ο� ��й�ȣ Ȯ��">
			                                                            <a href="javascript:void(0);" title="�����ȣ ����" id="btn_change_pwd">��й�ȣ ����</a>
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span><label for="p_tel0">��ȭ��ȣ</label></th>
			                                                        <td>
			                                                            <select class="phone1" name="p_tel0" id="p_tel0" title="��ȭ��ȣ ���ڸ� ����">
			                                                                <option value="02" title="02" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '02' }"> selected </c:if>>02</option>
			                                                                <option value="031" title="031" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '031' }"> selected </c:if>>031</option>
			                                                                <option value="032" title="032" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '032' }"> selected </c:if>>032</option>
			                                                                <option value="033" title="033" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '033' }"> selected </c:if>>033</option>
			                                                                <option value="041" title="041" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '041' }"> selected </c:if>>041</option>
			                                                                <option value="042" title="042" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '042' }"> selected </c:if>>042</option>
			                                                                <option value="043" title="043" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '043' }"> selected </c:if>>043</option>
			                                                                <option value="044" title="044" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '044' }"> selected </c:if>>044</option>
			                                                                <option value="051" title="051" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '051' }"> selected </c:if>>051</option>
			                                                                <option value="052" title="052" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '052' }"> selected </c:if>>052</option>
			                                                                <option value="053" title="053" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '053' }"> selected </c:if>>053</option>
			                                                                <option value="054" title="054" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '054' }"> selected </c:if>>054</option>
			                                                                <option value="055" title="055" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '055' }"> selected </c:if>>055</option>
			                                                                <option value="061" title="061" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '061' }"> selected </c:if>>061</option>
			                                                                <option value="062" title="062" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '062' }"> selected </c:if>>062</option>
			                                                                <option value="063" title="063" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '063' }"> selected </c:if>>063</option>
			                                                                <option value="064" title="064" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '064' }"> selected </c:if>>064</option>
			                                                                <option value="070" title="070" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '070' }"> selected </c:if>>070</option>
			                                                            </select>
			                                                            -
			                                                            <input type="text" class="phone2" name="p_tel1" id="p_tel1" maxlength="4" title="��ȭ��ȣ �߰��ڸ�" value="<c:out value="${fn:split(ASP_Edit_Login.d_hometel,'-')[1]}" />">
			                                                            -
			                                                            <input type="text" class="phone3" name="p_tel2" id="p_tel2" maxlength="4" title="��ȭ��ȣ ���ڸ�" value="<c:out value="${fn:split(ASP_Edit_Login.d_hometel,'-')[2]}" />">
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span><label for="p_mobil0">�޴���</label></th>
			                                                        <td>
			                                                        	<select class="phone1" name="p_mobil0" id="p_mobil0" title="�޴��� ���ڸ� ����">
			                                                                <option value="010" title="010" <c:if test="${fn:split(ASP_Edit_Login.d_handphone,'-')[0] eq '010' }"> selected </c:if>>010</option>
			                                                                <option value="011" title="011" <c:if test="${fn:split(ASP_Edit_Login.d_handphone,'-')[0] eq '011' }"> selected </c:if>>011</option>
			                                                                <option value="016" title="016" <c:if test="${fn:split(ASP_Edit_Login.d_handphone,'-')[0] eq '016' }"> selected </c:if>>016</option>
			                                                                <option value="017" title="017" <c:if test="${fn:split(ASP_Edit_Login.d_handphone,'-')[0] eq '017' }"> selected </c:if>>017</option>
			                                                                <option value="018" title="018" <c:if test="${fn:split(ASP_Edit_Login.d_handphone,'-')[0] eq '018' }"> selected </c:if>>018</option>
			                                                                <option value="019" title="019" <c:if test="${fn:split(ASP_Edit_Login.d_handphone,'-')[0] eq '019' }"> selected </c:if>>019</option>
			                                                            </select>
			                                                            -
			                                                            <input type="text" class="phone2" name="p_mobil1" id="pmobil1" maxlength="4" title="�޴��� �߰��ڸ�" value="<c:out value="${fn:split(ASP_Edit_Login.d_handphone,'-')[1]}" />">
			                                                            -
			                                                            <input type="text" class="phone3" name="p_mobil2" id="pmobil2" maxlength="4" title="�޴��� ���ڸ�" value="<c:out value="${fn:split(ASP_Edit_Login.d_handphone,'-')[2]}" />">
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>�̸���</th>
			                                                        <td>
			                                                        	<c:set var="email1" value="${fn:split(ASP_Edit_Login.d_email,'@')[0]}" /> 
			                                                        	<c:set var="email2" value="${fn:split(ASP_Edit_Login.d_email,'@')[1]}" />
			                                                            <c:choose>
			                                                            	<c:when test="${email1 ne '' || email1 ne null || email2 ne '' || email2 ne null}">
			                                                            		<input type="text" class="email1" name="p_email1" id="p_email1" value="${email1 }" title="�̸���  ���̵�">
			                                                            		@
			                                                            		<input type="text" class="email2" name="p_email2" id="p_email2" value="${email2 }" title="�̸���  �ּ�">
			                                                            	</c:when>
			                                                            	<c:otherwise>
			                                                            		�̸��� ����� ���ҽ� ��ڿ��� �����ٶ��ϴ�.(02-2161-0077)
			                                                            	</c:otherwise>
			                                                            </c:choose>
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th>�������� ����</th>
			                                                        <td>
			                                                        	<input type="hidden" name="p_agreed" id="p_agreed" title="�������� ���� ���۰�" />
			                                                            <input type="checkbox" name="p_agreed_Yn" id="p_agreed_Yn" title="�������� ���� (���� �� �̺�Ʈ �ҽ��� E-Mail Ȥ�� SMS���� ���� �ϰڽ��ϴ�.)" />
			                                                            <label for="p_agreed_Yn">���� �� �̺�Ʈ �ҽ��� E-Mail Ȥ�� SMS���� ���� �ϰڽ��ϴ�.</label>
			                                                        </td>
			                                                    </tr>
		                                                        
	                                                    	</c:when>
	                                                    	<c:otherwise>
	                                                    		<tr>
			                                                        <th><span>*</span>����(�ѱ�)</th>
			                                                        <td><c:out value="${ASP_Edit_Login.d_name }" /> </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>���̵�</th>
			                                                        <td><c:out value="${ASP_Edit_Login.d_userid }" /></td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>���� ��й�ȣ</th>
			                                                        <td>
			                                                            <input type="password" name="p_usepw" id="p_usepw" title="���� ��й�ȣ" />
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>���ο� ��й�ȣ</th>
			                                                        <td>
			                                                            <input type="password" name="p_pw1" id="p_pw1" title="���ο� ��й�ȣ (8�� �̻��� ���� Ȥ�� �������� �Է����ּ���. ���ӵ� ����, ����, �ֹι�ȣ �� �˱⽬�� ���ڴ� �����ּ���.)">
			                                                            <div id="chkMsg" style="font-size:12px;"></div>
					                                                    <span>* ��й�ȣ�� 8 ~ 16�� �̾�� �ϸ�, ����/�빮��/�ҹ���/Ư�����ڸ� ��� �����ؾ� �մϴ�.</span>
					                                                    <span>* ID�� ������ ��й�ȣ, ���Ϲ���, ���ӹ��� ���� ����Ͻ� �� �����ϴ�.</span>
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>���ο� ��й�ȣ Ȯ��</th>
			                                                        <td>
			                                                            <input type="password" name="p_pw2" id="p_pw2" title="���ο� ��й�ȣ Ȯ��">
			                                                            <a href="javascript:void(0);" title="�����ȣ ����" id="btn_change_pwd">��й�ȣ ����</a>
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span><label for="p_tel0">��ȭ��ȣ</label></th>
			                                                        <td>
			                                                            <select class="phone1" name="p_tel0" id="p_tel0" title="��ȭ��ȣ ���ڸ� ����">
			                                                                <option value="02" title="02" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '02' }"> selected </c:if>>02</option>
			                                                                <option value="031" title="031" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '031' }"> selected </c:if>>031</option>
			                                                                <option value="032" title="032" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '032' }"> selected </c:if>>032</option>
			                                                                <option value="033" title="033" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '033' }"> selected </c:if>>033</option>
			                                                                <option value="041" title="041" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '041' }"> selected </c:if>>041</option>
			                                                                <option value="042" title="042" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '042' }"> selected </c:if>>042</option>
			                                                                <option value="043" title="043" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '043' }"> selected </c:if>>043</option>
			                                                                <option value="044" title="044" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '044' }"> selected </c:if>>044</option>
			                                                                <option value="051" title="051" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '051' }"> selected </c:if>>051</option>
			                                                                <option value="052" title="052" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '052' }"> selected </c:if>>052</option>
			                                                                <option value="053" title="053" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '053' }"> selected </c:if>>053</option>
			                                                                <option value="054" title="054" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '054' }"> selected </c:if>>054</option>
			                                                                <option value="055" title="055" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '055' }"> selected </c:if>>055</option>
			                                                                <option value="061" title="061" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '061' }"> selected </c:if>>061</option>
			                                                                <option value="062" title="062" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '062' }"> selected </c:if>>062</option>
			                                                                <option value="063" title="063" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '063' }"> selected </c:if>>063</option>
			                                                                <option value="064" title="064" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '064' }"> selected </c:if>>064</option>
			                                                                <option value="070" title="070" <c:if test="${fn:split(ASP_Edit_Login.d_hometel,'-')[0] eq '070' }"> selected </c:if>>070</option>
			                                                            </select>
			                                                            -
			                                                            <input type="text" class="phone2" name="p_tel1" id="p_tel1" maxlength="4" title="��ȭ��ȣ �߰��ڸ�" value="<c:out value="${fn:split(ASP_Edit_Login.d_hometel,'-')[1]}" />">
			                                                            -
			                                                            <input type="text" class="phone3" name="p_tel2" id="p_tel2" maxlength="4" title="��ȭ��ȣ ���ڸ�" value="<c:out value="${fn:split(ASP_Edit_Login.d_hometel,'-')[2]}" />">
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span><label for="p_mobil0">�޴���</label></th>
			                                                        <td>
			                                                        	<select class="phone1" name="p_mobil0" id="p_mobil0" title="�޴��� ���ڸ� ����">
			                                                                <option value="010" title="010" <c:if test="${fn:split(ASP_Edit_Login.d_handphone,'-')[0] eq '010' }"> selected </c:if>>010</option>
			                                                                <option value="011" title="011" <c:if test="${fn:split(ASP_Edit_Login.d_handphone,'-')[0] eq '011' }"> selected </c:if>>011</option>
			                                                                <option value="016" title="016" <c:if test="${fn:split(ASP_Edit_Login.d_handphone,'-')[0] eq '016' }"> selected </c:if>>016</option>
			                                                                <option value="017" title="017" <c:if test="${fn:split(ASP_Edit_Login.d_handphone,'-')[0] eq '017' }"> selected </c:if>>017</option>
			                                                                <option value="018" title="018" <c:if test="${fn:split(ASP_Edit_Login.d_handphone,'-')[0] eq '018' }"> selected </c:if>>018</option>
			                                                                <option value="019" title="019" <c:if test="${fn:split(ASP_Edit_Login.d_handphone,'-')[0] eq '019' }"> selected </c:if>>019</option>
			                                                            </select>
			                                                            -
			                                                            <input type="text" class="phone2" name="p_mobil1" id="pmobil1" maxlength="4" title="�޴��� �߰��ڸ�" value="<c:out value="${fn:split(ASP_Edit_Login.d_handphone,'-')[1]}" />">
			                                                            -
			                                                            <input type="text" class="phone3" name="p_mobil2" id="pmobil2" maxlength="4" title="�޴��� ���ڸ�" value="<c:out value="${fn:split(ASP_Edit_Login.d_handphone,'-')[2]}" />">
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th><span>*</span>�̸���</th>
			                                                        <td>
			                                                        	<c:set var="email1" value="${fn:split(ASP_Edit_Login.d_email,'@')[0]}" /> 
			                                                        	<c:set var="email2" value="${fn:split(ASP_Edit_Login.d_email,'@')[1]}" />
			                                                            <c:choose>
			                                                            	<c:when test="${email1 ne '' || email1 ne null || email2 ne '' || email2 ne null}">
			                                                            		<input type="text" class="email1" name="p_email1" id="p_email1" value="${email1 }" title="�̸���  ���̵�">
			                                                            		@
			                                                            		<input type="text" class="email2" name="p_email2" id="p_email2" value="${email2 }" title="�̸���  �ּ�">
			                                                            	</c:when>
			                                                            	<c:otherwise>
			                                                            		�̸��� ����� ���ҽ� ��ڿ��� �����ٶ��ϴ�.(02-2161-0077)
			                                                            	</c:otherwise>
			                                                            </c:choose>
			                                                        </td>
			                                                    </tr>
			                                                    <tr>
			                                                        <th>�������� ����</th>
			                                                        <td>
			                                                        	<input type="hidden" name="p_agreed" id="p_agreed" title="�������� ���� ���۰�" />
			                                                            <input type="checkbox" name="p_agreed_Yn" id="p_agreed_Yn" title="�������� ���� (���� �� �̺�Ʈ �ҽ��� E-Mail Ȥ�� SMS���� ���� �ϰڽ��ϴ�.)" />
			                                                            <label for="p_agreed_Yn">���� �� �̺�Ʈ �ҽ��� E-Mail Ȥ�� SMS���� ���� �ϰڽ��ϴ�.</label>
			                                                        </td>
			                                                    </tr>
	                                                    		<tr>
		                                                    		<th>
			                                                        	�ҼӺμ�
			                                                        </th>
			                                                        <td><input type="text" style="width:100%" name="p_deptnm" id="p_deptnm" title="�ҼӺμ�" value="<c:out value="${ASP_Edit_Login.d_deptnam }"/>"></td>
		                                                       	</tr>
	                                                    	</c:otherwise>
                                                    	</c:choose>
	                                                </tbody>
	                                            </table>
	                                        </form>
                                            <div class="agree_btn_box">
                                                <a href="javascript:history.go(-1);" class="btn_cancel" id="btn_cancel" title="���">���</a>
                                                <a href="javascript:void(0);" class="btn_next" id="btn_next" title="����">����</a>
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