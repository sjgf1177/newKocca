<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<div class="lnb_wrap">
    <span class="lnb_header">ȸ��/�α���</span>
    <ul class="lnb_con">
    	<c:choose>
			<c:when test="${sessionScope.userid eq null || sessionScope.userid == ''}">
		        <li <c:if test="${param.left_active eq '990' }" > class="on"</c:if>><a href="javascript:mainmenu('990');">�α���</a></li>
		        <li <c:if test="${param.left_active eq '1' }" > class="on"</c:if>><a href="javascript:mainmenu('1');">ȸ������</a></li>
		        <li <c:if test="${param.left_active eq '2' }" > class="on"</c:if>><a href="javascript:mainmenu('2');">���̵�/��й�ȣ ã��</a></li>
			</c:when>
			<c:otherwise>
				<c:if test="${sessionScope.agreechk ne 'N'}">
					<li <c:if test="${param.left_active eq '4' }" > class="on"</c:if>><a href="javascript:mainmenu('4');">�������� ����</a></li>
		        </c:if>
				<c:if test="${sessionScope.agreechk eq 'N'}">
					<li class="on">��ü���� ȸ�� ���� �̿�������</li>
		        </c:if>		        
			</c:otherwise>
		</c:choose>
    </ul>
</div>