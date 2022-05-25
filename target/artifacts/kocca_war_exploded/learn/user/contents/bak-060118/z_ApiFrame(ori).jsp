<%
//**********************************************************
//  1. ��      ��: APIFRAME
//  2. ���α׷���: APIFRAME.jsp
//  3. ��      ��: APIFRAME 
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 12. 06
//  7. ��      ��:
//*********************************************************** 
%>

<%@ page contentType="text/html; charset=euc-kr"  %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.contents.*" %>
<%@ page import = "com.credu.common.*" %>

<%
	 
	/*---------------------------------------
	  ĳ�� ���� �� �ѱ�ó��
	 ---------------------------------------*/		
	response.setHeader("cache-control", "no-cache"); 
	response.setHeader("expires", "0"); 
	response.setHeader("pragma", "no-cache");
	
	request.setCharacterEncoding("euc-kr");

	RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }
	
	/*---------------------------------------
	   ���� �� �Ķ���Ͱ�
	 ---------------------------------------*/	
	String p_oid = request.getParameter("p_oid");
	String p_lesson = request.getParameter("p_lesson");
	String p_url = request.getParameter("url");

	String  p_userid    = box.getSession("userid");    
    String  s_name      = box.getSession("name");
    String  p_subj      = box.getSession("s_subj");
    String  p_year      = box.getSession("s_year");
    String  p_subjseq   = box.getSession("s_subjseq");

	String commit_value = "get";	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE></TITLE>
<SCRIPT LANGUAGE="JAVASCRIPT">

var API = null;

/******************************************************
  ���� API�� ȣ������ �������� �̵��ؾ� ��
******************************************************/
function initAPI(){	
	
	API = lmsApiFrame;
	lmsContFrame.document.location.href="<%=p_url%>";	
}
</SCRIPT>
</HEAD>

<frameset rows="*,150" cols="*" framespacing="0" frameborder="NO" border="0" onload="initAPI();" >
	<!-- Contents Frame: ó���� ���������� �ε� -->
	<frame src="z_Loading.html" name="lmsContFrame" scrolling="auto" noresize>
	
	<!-- API Frame: Api�� ���� -->
	<frame src="API.jsp?commit_value=<%=commit_value%>&userid=<%=p_userid%>&p_oid=<%=p_oid%>&p_lesson=<%=p_lesson%>&p_subj=<%=p_subj%>&p_year=<%=p_year%>&p_subjseq=<%=p_subjseq%>" name="lmsApiFrame" scrolling="no" noresize >
</frameset>

<noframes> 
<BODY>
</BODY>
</noframes> 
</HTML>
