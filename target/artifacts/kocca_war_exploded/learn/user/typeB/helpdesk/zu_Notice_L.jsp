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
	function go(index) {
	    document.nform1.p_pageno.value = index;
	    document.nform1.action = "/servlet/controller.homepage.HomeNoticeServlet";
	    document.nform1.p_process.value = "List";
	    document.nform1.submit();
	}
	
	//������ ����
	function goPage(pageNum) {
	    document.nform1.p_pageno.value = pageNum;
	    document.nform1.action = "/servlet/controller.homepage.HomeNoticeServlet";
	    document.nform1.p_process.value = "List";
	    document.nform1.submit();
	}
	
	function pagesize(pageSize) {
		document.nform1.action = "/servlet/controller.homepage.HomeNoticeServlet";
		document.nform1.p_pageno.value = 1;
		document.nform1.p_pagesize.value = pageSize;
		document.nform1.p_process.value = "List";
		document.nform1.submit();
	}
	
	//����Ʈ ��ȸ
	function select() {
	    document.nform1.p_pageno.value = 0;
	    document.nform1.action = "/servlet/controller.homepage.HomeNoticeServlet";
	    document.nform1.p_process.value = "List";
	    document.nform1.submit();
	}
	
	//�󼼺���
	function selectView(seq) {
	
	    document.nform1.action = "/servlet/controller.homepage.HomeNoticeServlet";
	    document.nform1.p_process.value = "selectView";
	    document.nform1.p_seq.value= seq;
	    document.nform1.submit();
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
                                            <a href="#"><span>�н���������</span></a>
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
                                        <span><span>��</span>�н��������Ϳ� ���Ű��� ȯ���մϴ�.</span>
                                        <span class="point_orange"><span>��</span>��������ī���̿��� �˷��帮�� ���ҽ��� Ȯ���Ͻ� �� �ֽ��ϴ�.</span>
                                    </div>
                                    <div class="board_search_box mo_width">
                                        <form name="nform1" method="post">
										    <input type="hidden" name="p_process">
										    <input type="hidden" name="p_pageno"  value="${pageno }"> 
										    <input type="hidden" name="p_seq">
											<input type="hidden" name="p_pagesize"  value="${pagesize}"/>
											<input type="hidden" name="gubun" value="${param.gubun }" />
    										<input type="hidden" name="menuid" value="${param.menuid }" />
                                            <select name="p_search" id="p_search">
                                                <option value="adtitle" <c:if test="${param.p_search eq 'adtitle' }" > selected </c:if>>����</option>
                                                <option value="adcontent" <c:if test="${param.p_search eq 'adcontent' }" > selected </c:if>>����</option>
                                                <option value="adname" <c:if test="${param.p_search eq 'adname' }" > selected </c:if>>�ۼ���</option>
                                            </select>
                                            <input type="text" name="p_searchtext" id="p_searchtext" class="board_search" value="<c:out value="${param.p_searchtext }" />" title="�˻�� �Է����ּ���">
                                            <input type="button" class="btn_board_search" value="" onclick="javascript:select();">
                                        </form>
                                    </div>
                                </div>
                                <div class="sub_boarder_body">
                                    <table class="pc_table">
                                        <colgroup>
                                            <col width="8%">
                                            <col width="auto">
                                            <col width="15%">
                                            <col width="8%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>��ȣ</th>
                                                <th>����</th>
                                                <th>�ۼ�����</th>
                                                <th>��ȸ��</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${selectNoticeList }" var="list" varStatus="status">
	                                            <tr>
	                                                <td>${list.d_dispnum }</td>
	                                                <td><a href="javascript:selectView('<c:out value="${list.d_seq }" />');"><c:out value="${list.d_adtitle }" /></a></td>
	                                                <td>
	                                                	<fmt:parseDate value="${list.d_addate }" var="addate" pattern="yyyyMMddHHmmss" />
                                           				<fmt:formatDate value="${addate }" pattern="yyyy.MM.dd" />
	                                                </td>
	                                                <td><c:out value="${list.d_cnt }" /></td>
	                                            </tr>
	                                            <c:set var="totalpage" value="${list.d_totalpage }" />
                                        	</c:forEach>
                                        	<c:if test="${fn:length(selectNoticeList) <= 0 }">
                                        		<tr>
                                        			<td colspan="4">��ϵ� ���������� �����ϴ�.</td>
                                        		</tr>
                                        		<c:set var="totalpage" value="1" />
                                        	</c:if>
                                        </tbody>
                                    </table>
                                    
                                    <!-- mobile table -->
                                    
                                    <table class="mo_table">
                                        <colgroup>
                                            <col width="auto">
                                            <col width="85%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>��ȣ</th>
                                                <th>����</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${selectNoticeList }" var="list" varStatus="status">
	                                            <tr>
	                                                <td>${list.d_dispnum }</td>
	                                                <td><a href="javascript:selectView('<c:out value="${list.d_seq }" />');"><c:out value="${list.d_adtitle }" /></a></td>
	                                            </tr>
	                                            <c:set var="totalpage" value="${list.d_totalpage }" />
                                        	</c:forEach>
                                        	<c:if test="${fn:length(selectNoticeList) <= 0 }">
                                        		<tr>
                                        			<td colspan="4">��ϵ� ���������� �����ϴ�.</td>
                                        		</tr>
                                        		<c:set var="totalpage" value="1" />
                                        	</c:if>
                                        </tbody>
                                    </table>
                                </div>
                                ${pu:typeB_printPageListDiv(totalpage, pageno, pagesize) }
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
