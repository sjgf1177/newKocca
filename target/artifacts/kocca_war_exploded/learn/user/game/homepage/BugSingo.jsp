


<%
//**********************************************************
//  1. ��      ��: Ȩ������ ���׽Ű�
//  2. ���α׷��� : BugSingo.jsp
//  3. ��      ��: Ȩ������ ���׽Ű�
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.21
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

            <table cellpadding="0" cellspacing="0" width="190">
            <tr>
            <td height="10"></td>
            </tr>
              <tr>
               	<td align="center">
					<a href="/servlet/controller.homepage.HomePageBugBoardServlet">
					<img src="/images/user/game/homepage/type1/right_bug.gif"></a>
			    </td>
              </tr>
            </table>