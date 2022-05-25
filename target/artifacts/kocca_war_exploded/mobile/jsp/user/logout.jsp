<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page errorPage="/jsp/library/error.jsp" %>

<%@ include file="/mobile/jsp/include/init.jsp" %>
<%
    String retUrl = box.getString("retUrl");
    session.invalidate();

    String titleTag = "";
    if ( isApp ) {
        titleTag = "�α׾ƿ�";
    } else if ( isWeb ) {
        titleTag = "�α׾ƿ� | �ѱ���������ī����";
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%= titleTag %></title>
<link href="/mobile/assets/css/style.css" rel="stylesheet">
<script src="/mobile/assets/js/jquery-1.11.1.min.js"></script>
<script src="/mobile/assets/js/common.js"></script>

<script>
var retUrl = "<%= retUrl %>";    

window.onload = function () {

    alert("�α׾ƿ� �Ǿ����ϴ�.");

    if ( retUrl != "" ) {
        fnMoveNavi(2, "'" + retUrl + "'", "");
    } else {
        fnMoveNavi(2, "/servlet/controller.mobile.openclass.OpenClassPopularServlet", "");
    }
}
</script>

</head>
<body>
</body>
</html>
