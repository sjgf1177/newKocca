<%
//**********************************************************
//  1. ��      ��: �ٷΰ���
//  2. ���α׷��� : Quick_menu.jsp
//  3. ��      ��: �ٷΰ���
//  4. ȯ      ��: JDK 1.4
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
					<td><img src="/images/user/kocca/homepage/type1/quick_menu_top.gif" width="166" height="5"><br></td>
				</tr>
				<tr> 
				<jsp:include page="/learn/user/kocca/homepage/Quick_menu_01.jsp" flush="true" />
				</tr>
				<tr> 
				<jsp:include page="/learn/user/kocca/homepage/Quick_menu_01_1.jsp" flush="true" />
				</tr>				
				<!--tr> 
				<jsp:include page="/learn/user/kocca/homepage/Quick_menu_02.jsp" flush="true" />
				</tr-->
				<tr> 
				<jsp:include page="/learn/user/kocca/homepage/Quick_menu_03.jsp" flush="true" />
				</tr>
				<tr> 
					<td height="4"><img src="/images/user/kocca/homepage/type1/quick_menu_bottom.gif" width="166" height="4"><br></td>
				</tr>
				<tr>
					<td height="9"></td>
				</tr>
				<tr> 
					<td height="8" align="center"><a href="mailto:cyber012@kocca.or.kr"><img src="/images/user/kocca/homepage/type2/st_call_center.gif" border="0"></td>
				</tr>
			</table>