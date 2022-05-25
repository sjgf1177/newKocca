<%@ page import="com.credu.library.RequestBox" %>
<%@ page import="com.credu.library.DataBox" %>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#p_pw1").on("keyup", function(){
			var newpw = $("#p_pw1").val();
			var id = "<c:out value='${param.p_id}'/>";
			
			var reg = /^.*(?=.{8,16})(?=.*[0-9!@#$%^&*()_+=<>?])(?=.*[a-zA-Z]).*$/;
			var msg = "";
			if(false === reg.test(newpw)) {
				msg = "����Ҽ� ���� ��й�ȣ �Դϴ�.1";
				$("#chkMsg").css("color", "red");
				$("#chkPassVal").val("false");
			}else if(/(\w)\1\1/.test(newpw)){
				msg = "����Ҽ� ���� ��й�ȣ �Դϴ�.2";
				$("#chkMsg").css("color", "red");
				$("#chkPassVal").val("false");
			}else if(newpw.search(id) > -1){
				msg = "����Ҽ� ���� ��й�ȣ �Դϴ�.3";
				$("#chkMsg").css("color", "red");
				$("#chkPassVal").val("false");
			}else if(newpw.search(/\s/) != -1){
				msg = "����Ҽ� ���� ��й�ȣ �Դϴ�.4";
				$("#chkMsg").css("color", "red");
				$("#chkPassVal").val("false");
			}else if(newpw.length > 16 ){
				msg = "����Ҽ� ���� ��й�ȣ �Դϴ�.5";
				$("#chkMsg").css("color", "red");
				$("#chkPassVal").val("false");
			}else{
				msg = "����Ҽ� �ִ� ��й�ȣ �Դϴ�.6";
				$("#chkMsg").css("color", "green");
				$("#chkPassVal").val("true");
			}
			console.log(msg);
			$("#chkMsg").text(msg);
			
		});
	});
	
	function changePw(){
		var r=$.trim($("[name='p_usepw']").val());
        var r1=$.trim($("[name='p_pw1']").val());
        var r2=$.trim($("[name='p_pw2']").val());
        
        if(r==""){ alert("���� ��й�ȣ�� �Է��ϼ���."); $("[name='p_usepw']").focus(); return; }
        if(r1==""){ alert("�� ��й�ȣ�� �Է��ϼ���."); $("[name='p_pw1']").focus(); return; }
        if(r2==""){ alert("�� ��й�ȣ Ȯ���� �Է��ϼ���"); $("[name='p_pw2']").focus(); return; }
        if(r1!=r2){ alert("��ȣ�� ���� ��ġ���� �ʽ��ϴ�."); $("[name='p_pw1']").val(""); $("[name='p_pw2']").val(""); $("[name='p_pw1']").focus(); return; }
		if($("#chkPassVal").val() == "true"){
			document.form_passChange.p_process.value = "ASP_Login";
	        document.form_passChange.menuid.value = "0";
	        document.form_passChange.gubun.value = "100";
	        document.form_passChange.action = "/servlet/controller.homepage.MainServlet";
	        document.form_passChange.submit();
		} else {
			alert("����� �� ���� ��й�ȣ�� �Է��ϼ̽��ϴ�.");
			$("[name='p_pw1']").focus(); return;
		}
		
	}
	
	function nextChangePw(){
		document.form_passChange.target="_self";
	    document.form_passChange.action="/servlet/controller.homepage.MainServlet";
	    document.form_passChange.p_process.value="nextChange";
	    document.form_passChange.submit();
	}
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
                            	<span>��й�ȣ ����</span>
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
                                            <a href="#"><span>��й�ȣ ����</span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sub_contents_body">
								<div class="sub_info_body join_box">
                                	<div class="list_title" style="font-size:18px;padding:30px; text-align: center;">
                                        <p style="font-weight:600; ">"ȸ������ ������ ����������ȣ�� ���� ��й�ȣ�� �������ּ���"</p>
                                        <p>�ѱ���������ī���̿����� ȸ������ ����������ȣ�� ���� 3���� �̻� ��й�ȣ�� �������� ���� ��� ��й�ȣ ������ �ȳ��ϰ� �ֽ��ϴ�.</p>
                                        <p>���� ��, Ÿ���� �����ϱ� ���� ��й�ȣ�� �������輺�� ������, ����/����/Ư�����ڸ� �����Ͽ� �����ϰ� �������ֽñ� �ٶ��ϴ�.</p>
                                    </div>
                                    <div class="sub_course_view_wrap">
                                    	<div class="info_box">
                                    		<form name="form_passChange" id="form_passChange" method="POST">
                                    			<input type="hidden" name="chkPassVal" id="chkPassVal" value="" />
                                    			<input type="hidden" name="p_process" value="" />
                                        		<input type="hidden" name="menuid" value="" />
                                        		<input type="hidden" name="gubun" value="" />
                                    			<table class="write_table th_align_left1">
	                                                <colgroup>
	                                                    <col width="30%">
	                                                    <col width="auto">
	                                                </colgroup>
	                                                <tbody>
	                                                	<tr>
	                                                		<th>���� ��й�ȣ111</th>
	                                                		<td>
	                                                			<input type="password" name="p_usepw" id="p_usepw" title="���� ��й�ȣ" />
	                                                		</td>
	                                                	</tr>
	                                                	<tr>
	                                                		<th>�� ��й�ȣ</th>
	                                                		<td>
	                                                			<input type="password" name="p_pw1" id="p_pw1" title="���ο� ��й�ȣ (8�� �̻��� ���� Ȥ�� �������� �Է����ּ���. ���ӵ� ����, ����, �ֹι�ȣ �� �˱⽬�� ���ڴ� �����ּ���.)">
	                                                			<div id="chkMsg" style="font-size:12px;"></div>
			                                                    <span>* ��й�ȣ�� 8 ~ 16�� �̾�� �ϸ�, ����/�빮��/�ҹ���/Ư�����ڸ� ��� �����ؾ� �մϴ�.</span>
			                                                    <span>* ID�� ������ ��й�ȣ, ���Ϲ���, ���ӹ��� ���� ����Ͻ� �� �����ϴ�.</span>
			                                                </td>
	                                                	</tr>
	                                                	<tr>
	                                                		<th>�� ��й�ȣ Ȯ��</th>
	                                                		<td><input type="password" name="p_pw2" id="p_pw2" title="���ο� ��й�ȣ Ȯ��"></td>
	                                                	</tr>
	                                                </tbody>
												</table>

                                    		</form>
                                    	</div>
                                    	<div style="padding-top:20px; text-align: center;">
											<button onclick="changePw();" class="btn_small">��й�ȣ ����</button>
											<button onclick="nextChangePw();" class="btn_small">������ �����ϱ�</button>
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
<style>
	.btn_small{padding:10px; border:1px solid #eeeeee; font-size:14px;margin:5px;}
</style>