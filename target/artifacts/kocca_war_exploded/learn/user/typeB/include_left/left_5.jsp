<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<div class="lnb_wrap">
	<span class="lnb_header">��������</span>
	<ul class="lnb_con">
		<c:if test="${sessionScope.tem_grcode ne 'N000179'}">
			<li <c:if test="${param.left_active eq '01' }" > class="on"</c:if>><a href="javascript:menuForward('5','01');">��ü</a></li>
			<li <c:if test="${param.left_active eq '17' }" > class="on"</c:if>><a href="javascript:menuForward('5','17');">��ۿ���</a></li>
			<li <c:if test="${param.left_active eq '18' }" > class="on"</c:if>><a href="javascript:menuForward('5','18');">����</a></li>
			<li <c:if test="${param.left_active eq '19' }" > class="on"</c:if>><a href="javascript:menuForward('5','19');">��ȭ/�ִ�/ĳ����</a></li>
			<li <c:if test="${param.left_active eq '20' }" > class="on"</c:if>><a href="javascript:menuForward('5','20');">��ȭ�Ϲ�</a></li>
		</c:if>
		<%-- <li <c:if test="${param.left_active eq '22' }" > class="on"</c:if>><a href="javascript:menuForward('5','22');">�������λ���Ʈ</a></li>
		<li <c:if test="${param.left_active eq '23' }" > class="on"</c:if>><a href="javascript:menuForward('5','23');">������Ŭ����</a></li> --%>
		
		<li <c:if test="${param.left_active eq '21' }" > class="on"</c:if>><a href="javascript:menuForward('5','21');">�ι�/�濵/����</a></li>
<%-- 		<li <c:if test="${param.left_active eq '26' }" > class="on"</c:if>><a href="javascript:menuForward('5','26');">�ι��� ����</a></li> --%>

	</ul>

</div>
