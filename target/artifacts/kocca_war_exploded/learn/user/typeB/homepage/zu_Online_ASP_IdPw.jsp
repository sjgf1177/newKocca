<%@ page import="com.credu.library.RequestBox"%>
<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page errorPage="/learn/library/error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<script type="text/javascript">

	$(document).ready(function(){
		$(document).on("click", "#btn_find_id", function(){
			if($.trim($("input:text[name='p_email_id']").val()) == ""){
				alert("�̸����� �Է� �Ͽ� �ֽʽÿ�.");
				$("input:text[name='p_email_id']").focus();
				return;
			}
			ajaxFind('40', $("input:text[name='p_email_id']").val());
		});
		
		$(document).on("click", "#btn_find_pw", function(){
			
			if($.trim($("input:text[name='p_email_pw']").val()) == ""){
				alert("�̸����� �Է� �Ͽ� �ֽʽÿ�.");
				$("input:text[name='p_email_pw']").focus();
				return;
			}
			console.log($("input:text[name='p_email_pw']").val());
			ajaxFind('50', $("input:text[name='p_email_pw']").val());
		});
	});
	
	function ajaxFind(gubun, email){
		$.ajax({
			url : '/servlet/controller.homepage.MainServlet',
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type : 'post',
			data : {p_email:email, p_process:"ASP_Find_Idpw", menuid:"0", gubun:gubun},
			success : function(data){
				var r1 = $.trim(data);
                var r2 = r1.split(":");
				console.log(data);
                if(r1!="" && r2[0]=="true")
                	alert(r2[1]+"(��)�� ������ �߼۵Ǿ����ϴ�.");
                else if(r2[0]=="false")
                	alert("ȸ������ ������ �������� �ʽ��ϴ�.");
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
                    	<jsp:param value="2" name="left_active"/>
                    </jsp:include>
                    <div class="subContainer">
                        <div class="sub_section">
                            <div class="sub_contents_header">
                                <span>���̵�/�н����� ã��</span>
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
                                            <a href="#"><span>���̵�/�н����� ã��</span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sub_contents_body">
                                <div class="sub_info_body">
                                    <p class="sub_course_view_title">���̵� ã��</p>
                                    <div class="sub_course_view_wrap">
                                        <div class="info_box">
                                            <table class="write_table th_align_left1">
                                                <colgroup>
                                                    <col width="20%">
                                                    <col width="auto">
                                                    <col width="20%">
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <th><span>*</span>�̸���</th>
                                                        <td><input type="text" name="p_email_id" id="p_email_id" title="���̵� ã�� �̸��� �Է� (ȸ�����Խ� �ۼ��Ͻ� �̸����ּҸ� �Է����ּ���.)"></td>
                                                        <td><a href="javascript:void(0);" class="btn_findId" id="btn_find_id">Ȯ��</a></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                 </div>
                                 
                                 <div class="sub_info_body" style="margin-top:50px;">
                                    <p class="sub_course_view_title">��й�ȣ ã��</p>
                                    <div class="sub_course_view_wrap">
                                        <div class="info_box">
                                            <table class="write_table th_align_left1">
                                                <colgroup>
                                                    <col width="20%">
                                                    <col width="auto">
                                                    <col width="20%">
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <th><span>*</span>�̸���</th>
                                                        <td><input type="text" name="p_email_pw" id="p_email_pw" title="��й�ȣ ã�� �̸��� �Է� (ȸ�����Խ� �ۼ��Ͻ� �̸����ּҸ� �Է����ּ���.)"></td>
                                                        <td><a href="javascript:void(0);" class="btn_findId" id="btn_find_pw">Ȯ��</a></td>
                                                    </tr>
                                                </tbody>
                                            </table>
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