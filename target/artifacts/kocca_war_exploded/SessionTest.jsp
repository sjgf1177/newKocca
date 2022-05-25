<%@ page  contentType="text/html;charset=euc-kr"%>

<%@ page import="java.util.*" %>
<%@ page import="java.net.InetAddress" %>
<html>
<head>
<title>���� ����</title>
</head>
<body>

<%
 Integer count = (Integer)session.getAttribute("count");
 if(count == null){
  count = new Integer(1);
 } else{
  count = new Integer(count.intValue() + 1);
 }
 
 //session.setMaxInactiveInterval(120);//120�ʷ� ����

 session.setAttribute("count", count);

 out.println("�湮 Ƚ��(session): " + count + "<br>");
 out.println("<p>");
 out.println("<h3>���� ���� : </h3>");
 
 out.println("���� ID: " + session.getId() + "<br>");
 out.println("���� ��ȿ�ð�(��): " + session.getMaxInactiveInterval() + "<br>");
 out.println("���� ����: " + session.isNew() + "<br>");
 out.println("���� �ð�: " + session.getCreationTime());
 out.println("<i>(" + new Date(session.getCreationTime()) + ")</i><br>");
 out.println("������ ���� �ð�: " + session.getLastAccessedTime());
 out.println("<i>(" + new Date(session.getLastAccessedTime()) + "></i><br>");
 out.println("���� ��û ����(��Ű): " + request.isRequestedSessionIdFromCookie() + "<br>");
 out.println("���� ��ȿ ����: " + request.isRequestedSessionIdValid() + "<br>");
 InetAddress address = null;
 address = InetAddress.getLocalHost();
 
 out.println("Host �̸� : " + address.getHostName() + "<br>");
 out.println("Host IP : " + address.getHostAddress() + "<br>");
 out.println("<br>");
 out.println("SERVER_NAME : " + System.getProperty("weblogic.Name") + "<br>");
 
%>

<%
 out.println("<h3>Cookie ���� "+"</h3>");
String cookieName = "username";
Cookie cookies [] = request.getCookies ();
Cookie myCookie = null;
if (cookies != null)
{
 for (int i = 0; i < cookies.length; i++)
  {
    out.println (cookies [i].getName()+"=");
    out.println (cookies [i].getValue()+"<br>");
  }
}
%>

<%
out.println("<h3>Keys</h3>");

Enumeration e = session.getAttributeNames();
for (; e.hasMoreElements() ;) {
  String key = (String)e.nextElement();    
  out.println(key+":" + session.getValue(key).toString());
  out.println("<br>");
}

%>


</body>
</html>

