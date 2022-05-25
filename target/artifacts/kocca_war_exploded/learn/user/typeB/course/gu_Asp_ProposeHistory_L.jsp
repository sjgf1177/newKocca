<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<jsp:include page="/learn/user/typeB/include/topMainAsp.jsp" />
<script type="text/javascript">
//������û ��� �˾�
function cancelApply(p_tid, p_paymethod){
    window.self.name = "winProposePage";
    farwindow = window.open("", "openWinCancelApply", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 550, height = 450, top=0, left=0");
    document.form1.target = "openWinCancelApply"
    document.form1.p_tid.value = p_tid;
    document.form1.p_paymethod.value = p_paymethod;
	document.form1.p_process.value = 'ProposeCancelApplyPage';
    document.form1.action = "/servlet/controller.study.MyClassServlet";
    document.form1.submit();

    farwindow.window.focus();
    document.form1.target = window.self.name;
}

//�������
function cancelPropose(p_tid, p_paymethod){

    if(!confirm("������ ����Ͻðڽ��ϱ�?\n������û����� ���������� ��ҵ˴ϴ�.")){
        return;
    }

    document.form1.target = "_self"
    document.form1.p_tid.value = p_tid;
    document.form1.p_paymethod.value = p_paymethod;
	document.form1.p_process.value = 'CancelPropose';
    document.form1.action = "/servlet/controller.study.MyClassServlet";
    document.form1.submit();
}
</script>

<form name= "form1" method= "post">
    <input type='hidden' name='p_process'>
    <input type='hidden' name='p_userid'    >
    <input type='hidden' name='p_subj'      >
    <input type='hidden' name='p_year'      >
    <input type='hidden' name='p_subjseq'   >
    <input type='hidden' name='p_subjnm'    >
    <input type='hidden' name='p_tid'	    >
    <input type='hidden' name='p_paymethod' >
</form>
<section>
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <jsp:include page="/learn/user/typeB/include_left/left_9.jsp">
                    	<jsp:param value="${param.menuid }" name="left_active"/>
                    </jsp:include>
                    <div class="subContainer">
                        <div class="sub_section">
                            <div class="sub_contents_header">
                                <span>������û Ȯ��/���</span>
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
                                            <a href="#"><span>������û</span></a>
                                        </li>
                                        <li>
                                            <a href="#"><span>������ûȮ��/���</span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sub_contents_body">
                                <div class="sub_board_header">
                                    <div class="list_title">
                                        <span><span>��</span>������û�� �Ϸ�� ��������Դϴ�. ��û�� ������� �����Ⱓ�� Ȯ���ϼ���.</span>
                                    </div>
                                </div>
                                <div class="sub_boarder_body">
                                    <table>
                                        <colgroup>
                                            <col width="auto">
                                            <col width="30%">
                                            <col width="15%">
                                            <col width="11%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>������</th>
                                                <th>�����Ⱓ<br/>(������û��)</th>
                                                <th>���λ���</th>
                                                <th>���</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${ProposeHistoryList }" var="list" varStatus="status">
                                        		<fmt:parseDate value="${list.d_edustart }" var="edustart" pattern="yyyyMMddHH" />
                                        		<fmt:parseDate value="${list.d_eduend }" var="eduend" pattern="yyyyMMddHH" />
                                        		<fmt:parseDate value="${list.d_appdate }" var="appdate" pattern="yyyyMMddHHmmss" />
	                                        	<tr>
	                                                <td><c:out value="${list.d_subjnm }" /></td>
	                                                <td class="gray">
	                                                	<fmt:formatDate value="${edustart }" pattern="yyyy.MM.dd" /> ~ <fmt:formatDate value="${eduend }" pattern="yyyy.MM.dd" /><br/>
	                                                	<c:if test="${list.d_appdate ne '' }">
	                                                		(<fmt:formatDate value="${appdate }" pattern="yyyy.MM.dd" />)
	                                                	</c:if>
	                                                </td>
	                                                <td>
	                                                	<c:choose>
	                                                		<c:when test="${list.d_chkfirst eq 'Y' && list.d_chkfinal eq 'Y' }"><span class="complete">����</span></c:when>
	                                                		<c:when test="${list.d_chkfirst eq 'Y' && list.d_chkfinal eq 'B' }"><span class="incomplete">���δ��</span></c:when>
	                                                		<c:when test="${list.d_chkfirst eq 'Y' && list.d_chkfinal eq 'N' }"><span class="gray">�ݷ�</span></c:when>
	                                                		<c:otherwise><span class="gray">-</span></c:otherwise>
	                                                	</c:choose>
	                                                </td>
	                                                <td class="gray">
														<c:choose>
															<c:when test="${list.d_refundyn eq 'N' && list.d_refundableyn eq 'Y' }">
																<c:choose>
																	<c:when test="${list.d_canceldate ne '' }">
																		��ҿ�û��<br/>
																		<c:out value="${list.d_canceldate }" />
																	</c:when>
																	<c:otherwise>
																		<c:choose>
																			<c:when test="${list.d_cancelableyn eq 'Y' }">
																				<a href="javascript:cancelPropose('<c:out value="${list.d_tid }" />','<c:out value="${list.d_paymethod }" />');" class="btn_registrationCancel">�������</a>
																			</c:when>
																			<c:otherwise>
																				<a href="javascript:cancelApply('<c:out value="${list.d_tid }" />','<c:out value="${list.d_paymethod }" />');" class="btn_registrationCancel">��ҿ�û</a>
																			</c:otherwise>
																		</c:choose>
																	</c:otherwise>
																</c:choose>
															</c:when>
															<c:otherwise>
																<c:choose>
																	<c:when test="${list.d_refundyn eq 'Y' }">
																		�����<br/>
																		<fmt:parseDate value="${list.d_refunddate }" var="refunddate" pattern="yyyyMMddHHmmss" />
																		<fmt:formatDate value="${refunddate }" pattern="yyyy.MM.dd"/>
																	</c:when>
																	<c:otherwise>
																		�Ⱓ����
																	</c:otherwise>
																</c:choose>
															</c:otherwise>
														</c:choose>
													</td>
	                                            </tr>
                                        	</c:forEach>
                                        	<c:if test="${fn:length(ProposeHistoryList) <= 0 }">
                                        		<tr>
                                        			<td colspan="4">������û Ȯ��/��� ������ �����ϴ�.</td>
                                        		</tr>
                                        	</c:if>
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
</section>

<!-- footer -->
<jsp:include page="/learn/user/typeB/include/newFooterB.jsp" />
<!-- footer -->
</body>
</html>