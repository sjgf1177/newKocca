<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "com.credu.library.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:include page="/learn/user/typeB/include/topMainAsp.jsp" />

<script language="JavaScript" type="text/JavaScript">
	$(document).ready(function(){
		$("#p_id").focus();
		
		$(document).on("keydown", "#p_pw", function(e){
			if (e.keyCode == 13){
				ASP_login();
			}
		});
	});

    // �α���
    function ASP_login() {
    	if($("#p_id").val() == null || $("#p_id").val() == ""){
    		alert("���̵� �Է����ּ���.");
    		$("#p_id").focus();
    		return;
    	}
    	
		if($("#p_pw").val() == null || $("#p_pw").val() == ""){
			alert("��й�ȣ�� �Է����ּ���.");
			$("#p_pw").focus();
			return;
    	}
		
       	mainmenu("5");
    }
</script>

<section>
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <jsp:include page="/learn/user/typeB/include_left/left_0.jsp">
                    	<jsp:param value="990" name="left_active"/>
                    </jsp:include>
                    <div class="subContainer">
                        <div class="sub_section">
                            <div class="sub_contents_header">
                                <span>�α���</span>
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
                                            <a href="#"><span>�α���</span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sub_contents_body">
                                <div class="sub_boarder_body login_box">
                                    <form name="form1" id="form1" method="POST">
                                    	<input type="hidden" name="p_process" value="" />
                                    	<input type="hidden" name="gubun" value="" />
                                    	<input type="hidden" name="menuid" value="" />
                                        <input type="text" name="p_id" id="p_id" title="���̵��Է�" placeholder="���̵��Է�111" />
                                        <input type="password" name="p_pw" id="p_pw" title="��й�ȣ�Է�" placeholder="��й�ȣ�Է�" />
                                        <input type="button" value="�α���" class="btn_login" onclick="javascript:ASP_login();" title="�α���"/>
                                    </form>
                                    <ul>
                                        <li><a href="javascript:mainmenu('1');">ȸ������</a></li>
                                        <li><a href="javascript:mainmenu('2');">���̵� / ��й�ȣ ã��</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- footer -->
<jsp:include page="/learn/user/typeB/include/newFooterB.jsp" />
<!-- footer -->
</body>
</html>
