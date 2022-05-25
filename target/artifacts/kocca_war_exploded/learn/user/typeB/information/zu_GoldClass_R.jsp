<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
	pageContext.setAttribute("CR", "\r");
	pageContext.setAttribute("LF", "\n");
	pageContext.setAttribute("CRLF", "\r\n");
	pageContext.setAttribute("SP", "&nbsp;");
	pageContext.setAttribute("BR", "<br/>");
%>
<jsp:include page="/learn/user/typeB/include/topMainAsp.jsp" />

<script type="text/javascript">
//����Ʈ�������� �̵�
function selectList() {
	var prePage = document.form1.p_prePage.value;

	if(prePage == "Main") {
        document.form1.action = "/servlet/controller.infomation.GoldClassHomePageServlet";
        document.form1.target="_self";
        document.form1.p_process.value = "mainPage";     
        document.form1.submit();
	} else {
	   	document.form1.action = "/servlet/controller.infomation.GoldClassHomePageServlet";
		document.form1.p_process.value = "selectPreGoldClassList";
		document.form1.target="_self";     
		document.form1.submit();
	}	
}      

function openGoldClass(seq,w,h){
    
    if (w.length>0) {
        window.open("", "ViewVod", "top=0, left=0, width="+w+", height="+h+", status=no, resizable=no");
    }else{
        window.open("", "ViewVod", "top=0, left=0, width=1008, height=570, status=no, resizable=no");
    }
    document.form1.action="/servlet/controller.infomation.GoldClassHomePageServlet";
    document.form1.p_process.value = "popUpVod";
    document.form1.p_seq.value = seq;
    document.form1.target="ViewVod";
    document.form1.submit();
    document.form1.target="_self";
}
</script>

<form name = "form1" method = "post">
	<input type = "hidden" name = "p_seq"         value = "<c:out value="${param.p_seq }" />">
	<input type = "hidden" name = "p_searchtext"  value = "<c:out value="${param.p_searchtext }" />">
	<input type = "hidden" name = "p_search"      value = "<c:out value="${param.p_search }" />">
	<input type = "hidden" name = "pageNo"      value = "<c:out value="${param.pageNo }" />">
	<input type = "hidden" name = "p_prePage"     value = "<c:out value="${param.p_prePage }" />">
	<input type = "hidden" name = "p_process"     value = "">
	<input type="hidden" name="gubun" value="${param.gubun }" />
    <input type="hidden" name="menuid" value="${param.menuid }" />
</form>
<section>
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <jsp:include page="/learn/user/typeB/include_left/left_5.jsp">
                    	<jsp:param value="${param.menuid }" name="left_active"/>
                    </jsp:include>
                    <div class="subContainer">
                        <div class="sub_section">
                            <div class="sub_contents_header">
                                <span>��������</span>
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
                                            <a href="#"><span>��������</span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sub_contents_body">
                                <div class="sub_board_header">
                                    <div class="list_title">
                                        <span><span>��</span>�������´� ����� �����Ǵ� �������·� ��̿� ���̰� �Բ� �����մϴ�.</span>
                                        <span><span>��</span>�Ǹ��� ����� ���¸� �������� �� ������, ������ ������ �� �ִ� ���� ���������Դϴ�.</span>
                                    </div>
                                </div>
                                <div class="sub_info_body">
                                    <div class="sub_course_alert_box">
                                        <p><c:out value="${selectOffExpert.d_lecnm }" /></p>
                                    </div>
                                    <div class="sub_course_view_wrap">
                                        <div class="info_box">
                                            <table class="tutor">
                                                <colgroup>
                                                    <col width="25%">
                                                    <col width="auto">
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <th>����Ұ�</th>
                                                        <td>
                                                            <img src="/servlet/controller.library.DownloadServlet?p_savefile=<c:out value="${selectOffExpert.d_tutorimg }" />" alt="����">
                                                            <span>�̸� : <c:out value="${selectOffExpert.d_tutornm }" /></span>
                                                            <span>
                                                            	���<br/>
                                                            	<c:set var="tutorcareer" value="${fn:replace(selectOffExpert.d_tutorcareer, CRLF, BR)}" />
																<c:set var="tutorcareer" value="${fn:replace(tutorcareer, LF, BR)}" />
																<c:set var="tutorcareer" value="${fn:replace(tutorcareer, CR, BR)}" />
																<c:out value="${tutorcareer }" escapeXml="false" />
                                                            </span>
                                                            <span></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>���¼Ұ� (���°���)</th>
                                                        <td>
                                                        	<c:set var="intro" value="${fn:replace(selectOffExpert.d_intro, CRLF, BR)}" />
															<c:set var="intro" value="${fn:replace(intro, LF, BR)}" />
															<c:set var="intro" value="${fn:replace(intro, CR, BR)}" />
															<c:out value="${intro }" escapeXml="false" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>���³���</th>
                                                        <td>
                                                        	<c:set var="contents" value="${fn:replace(selectOffExpert.d_contents, CRLF, BR)}" />
															<c:set var="contents" value="${fn:replace(contents, LF, BR)}" />
															<c:set var="contents" value="${fn:replace(contents, CR, BR)}" />
															<c:out value="${contents }" escapeXml="false" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div class="course_button">
                                                <a href="javascript:selectList();" class="list_btn">��ϰ���</a>
                                                <a href="javascript:openGoldClass('<c:out value="${param.p_seq }" />', '<c:out value="${selectOffExpert.d_width_s }" />','<c:out value="${selectOffExpert.d_height_s }" />');" class="apply_btn">���º���</a>
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