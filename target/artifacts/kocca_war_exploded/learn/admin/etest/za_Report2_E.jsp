<%
//**********************************************************
//  1. ��      ��: ����Ʈ
//  2. ���α׷���: za_Report2_E.jsp
//  3. ��      ��: ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 
//  7. ��      ��:
//***********************************************************
%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.complete.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");			
    if (box == null) box = RequestManager.getBox(request);
        
    String p_etestsubj = box.getString("p_etestsubj");
    String p_year      = box.getString("p_year");

    String v_param  = "p_etestsubj="+p_etestsubj+"&p_year="+p_year+"";
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
   <param name="connection.reportname" value="etest/EtestSelAnswerList.ozr">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">   
   <param name="odi.odinames" value="EtestSelAnswerList">
   <param name="odi.EtestSelAnswerList.pcount" value="1">
   <param name="odi.EtestSelAnswerList.args1" value="param=<%=v_param%>">
</OBJECT>
</body>
</html>
