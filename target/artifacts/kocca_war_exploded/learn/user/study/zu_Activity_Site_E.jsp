<%
//**********************************************************
//  1. ��      ��: �����н�Ȱ��
//  2. ���α׷���: zu_Activity_Site_E.jsp
//  3. ��      ��: �����н�Ȱ�� - ����Ʈ
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
	String  grcode   = box.getSession("tem_grcode");

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
   <param name="connection.reportname" value="study/Activity_Site.ozr">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">
   <param name="odi.odinames" value="Activity_Site">
   <param name="odi.Activity_Site.pcount" value="2">
   <param name="odi.Activity_Site.args1" value="userid=<%=s_userid%>">
   <param name="odi.Activity_Site.args2" value="grcode=<%=grcode%>">
</OBJECT>


</body>
</HTML>

