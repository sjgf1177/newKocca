<%@ page contentType="text/html;charset=MS949" %>
<%@ page isErrorPage="true" %>
<%@ page import="com.credu.library.*" %>

<%
//-----------------------------------------------------------------
// ���α׷��� : ���� ó��
// ���α׷�ID : error.jsp
// �ۼ���     : ������
// �ۼ���     : 2002. 4. 9
//-----------------------------------------------------------------

String errMessage="";

		errMessage = ErrorManager.getErrorStackTrace(exception);
		
//		if (conf.getProperty("service.status").equals("true")) { // ���� �������̸� ������ ������ ������ �ʰ� �޽���ó���Ѵ�.
//				Log.log(conf.getProperty("dir.log")+"error.log", errMessage.toString()); // log ���Ͽ� ����ϰ�
//				Log.log(conf.getProperty("dir.log")+"error.log", backTrace.toString());
%>
<html>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="Pragma" content="no-cache">
<TITLE>Compound JSPs</TITLE></HEAD>

<BODY BGCOLOR=#C0C0C0>
<H2>Exception Occurred</H2>
<FONT SIZE=2>
<%=errMessage %>
</FONT>
</BODY></HTML>

