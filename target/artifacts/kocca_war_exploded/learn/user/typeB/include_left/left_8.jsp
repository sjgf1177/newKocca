<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<div class="lnb_wrap">
     <span class="lnb_header">�����ȳ�</span>
     <ul class="lnb_con">
         <li <c:if test="${param.left_active eq '01' }" > class="on"</c:if>><a href="javascript:menuForward('8', '01');">���������ȳ�</a></li>
     </ul>
 </div>