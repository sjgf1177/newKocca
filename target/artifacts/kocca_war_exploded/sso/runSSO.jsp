<%@ page contentType = "text/html; charset=euc-kr" %>

<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
int logLevel = 0;
String serviceName = "S06TK";
String nextUrl=(String)request.getParameter("nextUrl");
String strTMAXSSO = "";

if (logLevel<1) 	System.out.println("[SKSSO-runSSO.jsp]  "  + serviceName+ " : nextUrl = '" + nextUrl +"'");

try {
	strTMAXSSO = (String)session.getAttribute("TMAXSSO");
}
catch(Exception e){
	if (logLevel<1) 	System.out.println("[SKSSO-runSSO.jsp]  "  + serviceName+ " : No Exist 'TMAXSSO' Session");
}

/* SSO �α����� �Ǿ����� ������ üũ�Ѵ�. */
if(strTMAXSSO != null && strTMAXSSO.length() != 0 && strTMAXSSO == "SUCCESS"){

		if(nextUrl != null && nextUrl.length() != 0) response.sendRedirect(nextUrl);
		else response.sendRedirect("/");

		return;
}
else {
	if (logLevel<1) 	System.out.println("[SKSSO-runSSO.jsp]  "  + serviceName+ " : SSO Server Down!!!");

	if(nextUrl != null && nextUrl.length() != 0) response.sendRedirect(nextUrl);
	else response.sendRedirect("/");
	//out.println("SSO Server Down");
}
%>