<%//���ø� ����%>
<%@ include file="/learn/user/kocca/include/site_info.jsp" %>

<%
    String topmenu  = "1";

    if (tem_type.equals("KA")) {
%>
        <%@ include file="/learn/user/kocca/include/topCourseA.jsp" %>
<%
    } else if (tem_type.equals("KB")) {
%>
        <%@ include file="/learn/user/kocca/include/topCourseB.jsp" %>
<%
    }
%>