<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<div class="lnb_wrap">
    <span class="lnb_header">������û</span>
    <ul class="lnb_con">
        <li <c:if test="${param.left_active eq '01' }" > class="on"</c:if>><a href="javascript:menuForward('9', '01');">������û�ȳ�</a></li>
        <li <c:if test="${param.left_active eq '02' }" > class="on"</c:if>><a href="javascript:menuForward('9', '02');">������û</a></li>
        <li <c:if test="${param.left_active eq '03' }" > class="on"</c:if>><a href="javascript:menuForward('9', '03');">������ûȮ��/���</a></li>
    </ul>
</div>