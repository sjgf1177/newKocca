<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<jsp:include page="/learn/user/typeB/include/topMainAsp.jsp" />

<script type="text/javascript">
	//�����͸� �Է��Ѵ�.
	function insert() {
	
	    var frm = document.form1;
	
	    if (blankCheck(frm.p_title.value)) {
	        alert("������ �Է��ϼ���!");
	        frm.p_title.focus();
	        return;
	    }
	
	    if (realsize(frm.p_title.value) > 100) {
	        alert("������ �ѱ۱��� 50�ڸ� �ʰ����� ���մϴ�.");
	        frmp_title.focus();
	        return;
	    }
	
	    if (frm.p_categorycd.options[frm.p_categorycd.selectedIndex].value == "") {
	        alert("�з��� �����ϼ���!");
	        frm.p_categorycd.focus();
	        return;
	    }
	
	    if ( document.getElementById("p_content").value == "" ) {
	        alert("������ �Է��� �ּ���.");
	        document.getElementById("p_content").focus();
	        return;
	    }
	
	    frm.p_searchtext.value    = "";
	    frm.p_select.value        = "";
	    frm.p_selCategory.value   = "";
	    frm.p_pageno.value        =  1;
	
	    document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
	    document.form1.p_process.value = "insert";
	    document.form1.submit();
	}
	
	//�Է� ������ ������ üũ
	function blankCheck( msg ) {
	    var mleng = msg.length;
	    chk=0;
	
	    for (i=0; i<mleng; i++) {
	        if ( msg.substring(i,i+1)!=' ' && msg.substring(i,i+1)!='\n' && msg.substring(i,i+1)!='\r') chk++;
	    }
	    if ( chk == 0 ) return (true);
	
	    return (false);
	}
	function realsize( value ) {//���ڼ��� üũ
	    var len = 0;
	    if ( value == null ) return 0;
	    for(var i=0;i<value.length;i++){
	        var c = escape(value.charAt(i));
	        if ( c.length == 1 ) len ++;
	        else if ( c.indexOf("%u") != -1 ) len += 2;
	        else if ( c.indexOf("%") != -1 ) len += c.length/3;
	    }
	    return len;
	}
</script>
<section>
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <jsp:include page="/learn/user/typeB/include_left/left_4.jsp">
                    	<jsp:param value="${param.menuid }" name="left_active"/>
                    </jsp:include>
                    <div class="subContainer">
                        <div class="sub_section">
                            <div class="sub_contents_header">
                                <span>QNA</span>
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
                                            <a href="#"><span>�н���������</span></a>
                                        </li>
                                        <li>
                                            <a href="#"><span>QNA</span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sub_contents_body">
                                <div class="sub_info_body">
                                    <p class="sub_course_view_title">�����Ұ�</p>
                                    <div class="sub_course_view_wrap">
                                        <div class="info_box">
                                        	<form name="form1" enctype="multipart/form-data" method="post">
											    <input type="hidden" name="p_seq"           value="<c:out value="${param.p_seq }"/>">
											    <input type="hidden" name="p_searchtext"    value="<c:out value="${param.p_searchtext }"/>">
											    <input type="hidden" name="p_select"        value="<c:out value="${param.p_select }"/>">
											    <input type="hidden" name="p_selCategory"   value="<c:out value="${param.p_sselCategory }"/>">
											    <input type="hidden" name="p_pageno"        value="<c:out value="${param.p_pageno }"/>">
											    <input type="hidden" name="p_process"       value="">
											    <input type="hidden" name="gubun" value="${param.gubun }" />
    											<input type="hidden" name="menuid" value="${param.menuid }" />
	                                            <table class="write_table th_align_left1">
	                                                <colgroup>
	                                                    <col width="25%">
	                                                    <col width="auto">
	                                                </colgroup>
	                                                <tbody>
	                                                    <tr>
	                                                        <th><span>*</span>�ۼ���</th>
	                                                        <td><c:out value="${sessionScope.userid }" /></td>
	                                                    </tr>
	                                                    <tr>
	                                                        <th><span>*</span>��������</th>
	                                                        <td>
	                                                            <input type="radio" name="p_isopen" id="open_y" value="N" checked="checked">
	                                                            <label for="open_y">����</label>
	                                                            <input type="radio" name="p_isopen" id="open_n" value="Y">
	                                                            <label for="open_n">�����</label>
	                                                        </td>
	                                                    </tr>
	                                                    <tr>
	                                                        <th><span>*</span>�����з�</th>
	                                                        <td>
	                                                            <select name="p_categorycd" id="p_categorycd">
	                                                            	<option value="">����</option>
	                                                            	<c:forEach items="${categoryList }" var="list" varStatus="status">
	                                                                	<option value="<c:out value="${list.d_code }" />"><c:out value="${list.d_codenm }" /></option>
	                                                            	</c:forEach>
	                                                            </select>
	                                                        </td>
	                                                    </tr>
	                                                    <tr>
	                                                        <th><span>*</span>����</th>
	                                                        <td><input type="text" name="p_title" id="p_title" style="width:100%"></td>
	                                                    </tr>
	                                                    <tr>
	                                                        <th><span>*</span>����</th>
	                                                        <td><textarea name="p_content" id="p_content"></textarea></td>
	                                                    </tr>
	                                                    <tr>
	                                                        <th>÷������</th>
	                                                        <td>
	                                                        	<jsp:include page="/learn/user/typeB/include/multiAttach_include_QnA_I.jsp" />
	                                                        </td>
	                                                    </tr>
	                                                </tbody>
	                                            </table>
	                                        </form>
                                            <div class="course_button">
                                                <a href="javascript:history.back(-1);" class="list_btn">���</a>
                                                <a href="javascript:insert();" class="apply_btn">���</a>
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


<!-- footer -->
<jsp:include page="/learn/user/typeB/include/newFooterB.jsp" />
<!-- footer -->
</body>
</html>