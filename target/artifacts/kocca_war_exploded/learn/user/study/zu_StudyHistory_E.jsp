<%
//**********************************************************
//  1. ��      ��: ���α����̷�
//  2. ���α׷���: zu_StudyHistory_E.jsp
//  3. ��      ��: ���α����̷� ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 
//  7. ��      ��:
//***********************************************************
%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String  s_userid = box.getSession("userid");
	String  s_resno  = box.getSession("resno");

%>
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>


<BODY leftmargin="0" topmargin="0" bottommargin="0" marginwidth="0" marginheight="0" >
<!--  �� �ٿ�ε� �޴� �κ� -->
<!-- �������� ����-->
<%@ include file="/learn/library/oz.jsp"%>
<!-- �������� ��-->
   <param name="connection.reportname" value="study/StudyHistory.ozr">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">
   <param name="odi.odinames" value="StudyHistory">
   <param name="odi.StudyHistory.pcount" value="2">
   <param name="odi.StudyHistory.args1" value="userid=<%=s_userid%>">
   <param name="odi.StudyHistory.args2" value="resno=<%=s_resno%>">
</OBJECT>


</body>
</HTML>

