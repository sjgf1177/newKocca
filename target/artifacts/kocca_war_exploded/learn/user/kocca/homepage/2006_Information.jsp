
	   
<%
//**********************************************************
//  1. ��      ��: Ȩ������ 2006_���и����ȳ�
//  2. ���α׷��� : 2006_Information.jsp
//  3. ��      ��: Ȩ������ 2006_���и����ȳ�
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
		<td><img src="/images/user/kocca/homepage/type1/2006_admi_info.gif" width="166" height="56"></td>
	  </tr>
	  <tr> 
		<td height="8"></td>
	  </tr>
	</table>