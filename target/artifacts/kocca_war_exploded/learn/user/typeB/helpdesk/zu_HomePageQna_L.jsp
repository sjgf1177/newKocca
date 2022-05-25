<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/tags/KoccaPageUtilTaglib" prefix="pu" %>
<%@ page isELIgnored="false" %>
<jsp:include page="/learn/user/typeB/include/topMainAsp.jsp" />
<c:set var="pageno" value="${param.p_pageno eq null || param.p_pageno eq ''? 1 : param.p_pageno}" />
<c:set var="pagesize" value="${param.p_pagesize eq null || param.p_pagesize eq ''? 10 : param.p_pagesize}" />

<script type="text/javascript">
//������ �̵�
function goPage(pageNum) {
	document.form1.p_action.value = "go";
	document.form1.p_pageno.value = pageNum;
	document.form1.p_process.value = "REQUEST";
	document.form1.submit();
}

//�Է��������� �̵�
function insertPage() {
    document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
    document.form1.p_process.value = "insertPage";  
    document.form1.submit();
}

//��ȭ�� �������� �̵�
function select(seq, upfilecnt, userid, types) {
    document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
    document.form1.p_process.value   = "selectView";
    document.form1.p_seq.value       = seq;
    document.form1.p_userid.value    = userid;
    document.form1.p_types.value     = types;
    document.form1.p_upfilecnt.value = upfilecnt;
    document.form1.submit();
}

//�˻����뿡 �´� ����Ʈ �������� �̵�
function selectList() {
    document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
    document.form1.p_process.value = "";
    document.form1.submit();
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
                                <div class="sub_board_header">
                                    <div class="list_title">
                                        <span><span>��</span>���� ���� ������ ����Ͻø�, ����ڰ� �亯�ص帳�ϴ�.</span>
                                        <span><span>��</span>���� ���뿡 ���� ������ ������ �����ø� ������� �ۼ����ּ���</span>
                                    </div>
                                    <div class="board_search_box">
                                        <form name = "form1" method = "post" onsubmit="javascript:selectList();">
											<input type = "hidden" name = "p_process"     value = "">
											<input type = "hidden" name = "p_pageno"      value = "<c:out value="${param.p_pageno }" />">
											<input type = "hidden" name = "p_seq"         value = "">
											<input type = "hidden" name = "p_userid"      value = "">
											<input type = "hidden" name = "p_upfilecnt"   value = "">
											<input type = "hidden" name = "p_types"       value = "<c:out value="${param.p_types }" />">
											<input type="hidden" name="gubun" value="${param.gubun }" />
    										<input type="hidden" name="menuid" value="${param.menuid }" />
                                            <select id="p_search" name="p_search">
                                                <option value="TITL" <c:if test="${param.p_search eq 'TITL' }" > selected</c:if>>����</option>
                                                <option value="CONT" <c:if test="${param.p_search eq 'CONT' }" > selected</c:if>>����</option>
                                                <option value="NAME" <c:if test="${param.p_search eq 'NAME' }" > selected</c:if>>�ۼ���</option>
                                            </select>
                                            <input type="text" class="board_search" name="p_searchtext" id="p_searchtext" value="<c:out value="${param.p_searchtext }"/>" title="�˻�� �Է����ּ���">
                                            <input type="submit" class="btn_board_search" value="">
                                        </form>
                                    </div>
                                </div>
                                <div class="sub_boarder_body">
                                    <table>
                                        <colgroup>
                                            <col width="8%">
                                            <col width="15%">
                                            <col width="auto">
                                            <col width="15%">
                                            <col width="15%">
                                            <col width="15%">
                                            <col width="8%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>��ȣ</th>
                                                <th>�з�</th>
                                                <th>����</th>
                                                <th>�ۼ���</th>
                                                <th>�ۼ�����</th>
                                                <th>�亯����</th>
                                                <th>��ȸ��</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${selectList }" var="list" varStatus="status">
                                        		<tr>
	                                                <td><c:out value="${list.d_dispnum }" /></td>
	                                                <td><c:out value="${list.d_categorynm }" /></td>
	                                                <td>
	                                                	<c:choose>
	                                                		<c:when test="${list.d_isopen eq 'Y' && sessionScope.userid ne list.d_inuserid }">
	                                                			<a href="javascript:alert('��б��� �ۼ��ڸ� �� �� �ֽ��ϴ�.');"><c:out value="${list.d_title }" /></a>
	                                                		</c:when>
	                                                		<c:otherwise>
	                                                			<a href="javascript:select('<c:out value="${list.d_seq }" />','<c:out value="${list.d_upfilecnt }" />','<c:out value="${list.d_inuserid }" />','<c:out value="${list.d_types }" />');"><c:out value="${list.d_title }" /></a>
	                                                		</c:otherwise>
	                                                	</c:choose>
	                                                	
	                                                </td>
	                                                <td><c:out value="${list.d_name }" /></td>
	                                                <td>
	                                                	<fmt:parseDate value="${list.d_indate }" var="indate" pattern="yyyyMMddHHmmss" />
	                                                	<fmt:formatDate value="${indate }" pattern="yyyy.MM.dd"/>
	                                                </td>
	                                                <td>
	                                                	<c:choose>
	                                                		<c:when test="${list.d_okyn1 eq '3' }"><span class="point_blue">�亯�Ϸ�</span></c:when>
	                                                		<c:when test="${list.d_okyn1 eq '2' }"><span class="point_orange">�亯�غ���</span></c:when>
	                                                		<c:otherwise><span class="point_black">������</span></c:otherwise>
	                                                	</c:choose>
	                                                </td>
	                                                <td><c:out value="${list.d_cnt }" /></td>
	                                            </tr>
	                                            <c:set var="totalpage" value="${list.d_totalpage }" />
                                        	</c:forEach>
                                        	<c:if test="${fn:length(selectList) <= 0 }">
                                        		<tr>
	                                                <td colspan="7">��ϵ� ������ �����ϴ�.</td>
	                                            </tr>
	                                            <c:set var="totalpage" value="1" />
                                        	</c:if>
                                        </tbody>
                                    </table>
                                </div>
                                ${pu:typeB_printPageListDiv(totalpage, pageno, pagesize) }
                                <div class="sub_list_button">
                                    <a href="javascript:insertPage();" class="btn_write">�۾���</a>
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