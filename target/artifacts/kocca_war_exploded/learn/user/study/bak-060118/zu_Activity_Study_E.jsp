<%
//**********************************************************
//  1. ��      ��: �����н�Ȱ��
//  2. ���α׷���: zu_Activity_Study_E.jsp
//  3. ��      ��: �����н�Ȱ�� - �н�
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

    String  s_userid  = box.getSession("userid");
    String  subj      = box.getString("subj");
    String  year      = box.getString("year");
    String  subjseq   = box.getString("subjseq");

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
   <param name="connection.reportname" value="study/Activity_Study.ozr">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">
   <param name="odi.odinames" value="Activity_Study">
   <param name="odi.Activity_Study.pcount" value="4">
   <param name="odi.Activity_Study.args1" value="userid=<%=s_userid%>">
   <param name="odi.Activity_Study.args2" value="subj=<%=subj%>">
   <param name="odi.Activity_Study.args3" value="year=<%=year%>">
   <param name="odi.Activity_Study.args4" value="subjseq=<%=subjseq%>">
</OBJECT>


</body>
</HTML>

