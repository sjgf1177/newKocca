<%@page contentType = "text/html; charset=euc-kr" %>
<%@page import="java.net.*" %>
<%@page import="java.util.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="com.tmax.sso.filter.*" %>


<%
/********************************************************************
1. returnURL �� �α׾ƿ� �ϰ� �̵��� URL �� �����ȴ�.               *
																	*
2. �α׾ƿ��� single���� ���������, TMAXSSOCLOS �� no�� �����ؼ� *
   �� ���ӽÿ��� ������ �߻����� �ʰ� �Ѵ�							*
********************************************************************/

//String returnURL = SSOConf.loginInputURL;   //���������� --> com.tmax.sso.filter.logininputurl
//String returnURL = SSOConf.portalLoginURL;
//String returnURL = "http://www.gameacademy.or.kr";
String returnURL = "http://www.wecon.kr/sub/kocca/member/join_2.jsp";
session.invalidate();
if(SSOConf.relogin) {
	out.println("relogin ok");
	Cookie tmaxsso_cookie = new Cookie(Util.authenticatedCookieName, "no");
	Cookie tmaxssocookie2 = new Cookie("TMAXSSOCLOS", "no");
//	Cookie tmaxsso_cookie3 = new Cookie("TMAXSSOCOOK", "no");

	tmaxsso_cookie.setPath("/");
	tmaxssocookie2.setPath("/");
//	tmaxsso_cookie3.setPath("/");

	response.addCookie(tmaxsso_cookie);
	response.addCookie(tmaxssocookie2);
//	response.addCookie(tmaxsso_cookie3);

// ���� �α׾ƿ� ������ �߰��ؾ� ��

}else{
	out.println("relogin false");
}
out.println("returnURL" + returnURL);

%>