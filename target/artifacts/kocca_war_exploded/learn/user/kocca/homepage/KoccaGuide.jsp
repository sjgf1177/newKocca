
	   
<%
//**********************************************************
//  1. ��      ��: Ȩ������ kocca���̵�
//  2. ���α׷��� : KoccaGuide.jsp
//  3. ��      ��: Ȩ������ kocca���̵�
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.22
//  7. ��      ��:
//***********************************************************
%>
	   
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

%>	


	<table width="166" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
		<td><a href="/servlet/controller.homepage.KHomePageHelpServlet?p_process=Help"><img src="/images/user/kocca/homepage/type1/kocca_guide.gif" width="166" height="43"></a></td>
	  </tr>
	  <tr> 
		<td height="8"></td>
	  </tr>
	</table>
<!-- kocca���̵� -->	