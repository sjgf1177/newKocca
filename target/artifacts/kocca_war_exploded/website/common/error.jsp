<%@ page contentType="text/html;charset=MS949" %>
<%@ page isErrorPage="true" %>
<%@ page import="com.credu.library.*" %>

<%
//**********************************************************
//  1. ��      ��: ����ó��
//  2. ���α׷���: error.jsp
//  3. ��      ��: Ŀ�´�Ƽ ȸ������ ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 4. 9
//  7. ��      ��: ������ 2003. 4. 9
//***********************************************************

String errMessage="";

if(ErrorManager.isErrorMessageView()) {
    errMessage = ErrorManager.getErrorStackTrace(exception, true);		
%>
<html>
<head>	
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<meta http-equiv="pragma" content="no-cache">
<title>compound jsp</title></head>
<body bgcolor=#c0c0c0>
<h2>exception occurred</h2>
<font size=2>
<%=errMessage %>
</font>
</body></html>
<%
}else {	
%>

<html>
<body onload="javascript:document.errform.submit()">
<form name="errform" action="/learn/library/include/printSystemErrorMessage.jsp" method=post>
</form>
</body>
</html>
<%
}
%>
