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
    document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
    document.form1.p_process.value = "";     
    document.form1.submit();    
}

//������������ �̵�
function updatePage() {
    document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
    document.form1.p_process.value = "updatePage";
    document.form1.submit();
}

//�� ȭ�� ����
function deleteAction() {
    if (confirm("������ �����Ͻðڽ��ϱ�?")) {
        
        document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
        document.form1.p_process.value = "delete";
        document.form1.submit();
    }
    else {
        return;
    }
}
</script>
<form name="form1" method="post">
	<input type="hidden" name="p_seq"         value="<c:out value="${param.p_seq }" />" />
	<input type="hidden" name="p_searchtext"  value="<c:out value="${param.p_searchtext }" />" />
	<input type="hidden" name="p_select"      value="<c:out value="${param.p_select }" />" />
	<input type="hidden" name="p_pageno"      value="<c:out value="${param.p_pageno }" />" />
	<input type="hidden" name="p_selCategory" value="<c:out value="${param.p_selCategory }" />" />
	<input type="hidden" name="p_process"     value="" />
	<input type="hidden" name="p_userid"      value="<c:out value="${sessionScope.userid }" />" />
	<input type="hidden" name="p_types"       value="<c:out value="${selectQna.d_types }" />" />
	<input type="hidden" name="gubun" value="${param.gubun }" />
    <input type="hidden" name="menuid" value="${param.menuid }" />
</form>
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
                                <div class="sub_board_header">
                                    <div class="list_title">
                                        <span><span>��</span>���� ���� ������ ����Ͻø�, ����ڰ� �亯�ص帳�ϴ�.</span>
                                        <span><span>��</span>���� ���뿡 ���� ������ ������ �����ø� ������� �ۼ����ּ���</span>
                                    </div>
                                </div>
                                <div class="sub_info_body">
                                    <div class="sub_course_view_wrap">
                                        <div class="info_box">
                                            <table>
                                                <colgroup>
                                                    <col width="10%">
                                                    <col width="auto">
                                                    <col width="10%">
                                                    <col width="auto">
                                                    <col width="10%">
                                                    <col width="auto">
                                                    <col width="10%">
                                                    <col width="8%">
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <th>����</th>
                                                        <td colspan="7"><c:out value="${selectQna.d_title }" /></td>
                                                    </tr>
                                                    <tr>
                                                        <th>�з�</th>
                                                        <td><c:out value="${selectQna.d_categorynm }" /></td>
                                                        <th>�ۼ���</th>
                                                        <td><c:out value="${selectQna.d_name }" /></td>
                                                        <th>�ۼ�����</th>
                                                        <td>
                                                        	<fmt:parseDate value="${selectQna.d_indate }" var="indate" pattern="yyyyMMddHHmmss" />
                                                        	<fmt:formatDate value="${indate }" pattern="yyyy.MM.dd"/>
                                                        </td>
                                                        <th>��ȸ</th>
                                                        <td><c:out value="${selectQna.d_cnt }" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="8">
                                                        	<c:set var="contents" value="${fn:replace(selectQna.d_contents, CRLF, BR)}" />
															<c:set var="contents" value="${fn:replace(contents, CR, BR)}" />
															<c:set var="contents" value="${fn:replace(contents, LF, BR)}" />
															<c:out value="${contents }" escapeXml="false" />
                                                        </td>
                                                    </tr>
                                                    <c:if test="${fn:length(selectQna.d_savefile) > 0 }">
                                                    <tr>
                                                    	<th>÷������</th>
                                                        <td colspan="7">
                                                        	<c:forEach items="${selectQna.d_realfile }" var="item" varStatus="status">
                                                        		<a href = '/servlet/controller.library.DownloadServlet?p_savefile=<c:out value="${selectQna.d_savefile[status.index] }" />&p_realfile=<c:out value="${selectQna.d_realfile[status.index] }" />'><c:out value="${selectQna.d_realfile[status.index] }" /></a><br/>
                                                        	</c:forEach>
                                                        </td>
                                                    </tr>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                            <c:if test="${selectQna.d_okyn1 eq '3' }">
                                            	<p class="sub_course_view_title" style="margin-top:50px;">���Ǵ亯</p>
	                                            <table>
	                                                <colgroup>
	                                                    <col width="20%">
	                                                    <col width="auto">
	                                                    <col width="20%">
	                                                    <col width="auto">
	                                                </colgroup>
	                                                <tbody>
	                                                	<c:if test="${fn:length(selectAns) <= 0 }">
		                                                    <tr>
		                                                        <td colspan="4">
		                                                        	�亯 �غ����Դϴ�.
		                                                        </td>
		                                                    </tr>
	                                                	</c:if>
	                                                	<c:forEach items="${selectAns }" var="list" varStatus="status">
	                                                		<tr>
		                                                        <th>����</th>
		                                                        <td><c:out value="${list.d_title }" /></td>
		                                                        <th>��¥</th>
		                                                        <td>
		                                                        	<fmt:parseDate value="${list.d_indate }" var="asindate" pattern="yyyyMMddHHmmss" />
                                                        			<fmt:formatDate value="${asindate }" pattern="yyyy.MM.dd"/>
                                                        		</td>
		                                                    </tr>
		                                                    <tr>
		                                                        <td colspan="4">
		                                                        	<c:out value="${list.d_contents }" escapeXml="false" />
		                                                        </td>
		                                                    </tr>
	                                                	</c:forEach>
	                                                </tbody>
	                                            </table>
	                                        </c:if>
                                            <div class="course_button">
                                            	<c:if test="${sessionScope.userid eq selectQna.d_inuserid && selectQna.d_okyn1 ne '3' }">
                                            		<a href="javascript:deleteAction();" class="delete_btn">����</a>
                                            	</c:if>
                                                <a href="javascript:selectList()" class="list_btn">��ϰ���</a>
                                                <c:if test="${sessionScope.userid eq selectQna.d_inuserid && selectQna.d_okyn1 ne '3' }">
                                            		<a href="javascript:updatePage();" class="apply_btn">����</a>
                                            	</c:if>
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