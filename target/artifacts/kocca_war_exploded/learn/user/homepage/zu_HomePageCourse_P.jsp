<%
//**********************************************************
//  1. ��      ��: Ȩ������ ����ü�赵 �˾�
//  2. ���α׷���: zu_HomePageCourse_P.jsp
//  3. ��      ��: Ȩ������ ����ü�赵 �˾�
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̿��� 2005. 7. 25
//  7. ��      ��: �̿��� 2005. 7. 25
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>


<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    String v_dirKey      = "bulletin";
    String v_url         = conf.getProperty("url.upload")+v_dirKey;
	String str           = request.getParameter("p_savelfile");
    String savelfile     = str.substring(1,str.length()-1); 
	String v_savelfile   = v_url + "/" + savelfile;
%>
<html>
<head>
<title>����ü�赵</title>
</head>
<body>
<a href="javascript:close();"><img src="<%=v_savelfile%>"></a>
</body>
</html>