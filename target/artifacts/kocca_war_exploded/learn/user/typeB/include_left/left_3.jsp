<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<div class="lnb_wrap">
	<span class="lnb_header">���� ���ǽ�</span>
	<ul class="lnb_con">
		<li <c:if test="${param.left_active eq '11' }" > class="on"</c:if>><a href="javascript:menuForward('3','11');">�������ΰ���</a></li>
		<li <c:if test="${param.left_active eq '02' }" > class="on"</c:if>><a href="javascript:menuForward('3','02');">���Ǳ����̷�</a></li>
		<li <c:if test="${param.left_active eq '12' }" > class="on"</c:if>><a href="javascript:menuForward('3','12');">���ǻ�㳻��</a></li>
	</ul>
</div>
