<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page errorPage="/jsp/library/error.jsp" %>

<%
    session.invalidate();

    String titleTag = "";
    titleTag = "�α׾ƿ� | �ѱ���������ī����";
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

window.onload = function () {

    alert("�α׾ƿ� �Ǿ����ϴ�.");
    parent.document.location.href="/learn/admin/kocca/login.jsp";

}
</script>

</head>
<body>
</body>
</html>
