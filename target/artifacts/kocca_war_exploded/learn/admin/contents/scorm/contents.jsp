<%
//**********************************************************
//  1. ��      ��: ������ ȭ��
//  2. ���α׷��� : za_SCO_I.jsp
//  3. ��      ��: ������ ȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 24
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.scorm.*" %>
<%@ page import = "com.credu.contents.*" %>

<%  
   	RequestBox box = null;	
    box = (RequestBox)request.getAttribute("requestbox");
	
    if (box == null) {
    		box = RequestManager.getBox(request); 
		}
	String	oid	= box.getString("oid");		
%>

<SCRIPT LANGUAGE="JAVASCRIPT">
<!--
var API = null;

/******************************************************
  ���� API�� ȣ������ �������� �̵��ؾ� ��
******************************************************/
function initAPI(){	
	API = etop;		
	ebody.document.location.href="/learn/admin/contents/scorm/contents_view.jsp?oid=<%=oid%>";
}
//-->
</SCRIPT>

<frameset rows="0,*" cols="*" border="1" FRAMESPACING="0" TOPMARGIN="0" LEFTMARGIN="0" MARGINHEIGHT="0" MARGINWIDTH="0" ONLOAD="initAPI();">
	<frame src="DummyApi.jsp"  name="etop" id="etop" scrolling="NO" frameborder="0" BORDER="0">	
	<frame src="Empty.html"  name="ebody" scrolling="NO" frameborder="0" BORDER="0">
</frameset>