<%
//**********************************************************
//  1. ��      ��: ���׽�Ʈ
//  2. ���α׷���: za_ETestResultList_E.jsp
//  3. ��      ��: ���
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
    String v_grcode = box.getString("s_grcode");
    String v_gyear  = box.getString("s_gyear");        
    String v_etestsubj   = box.getString("s_etestsubj");
   
    //String v_param = "http://10.40.37.65:9999/learn/admin/etest/OZ_ETestResultList.jsp";
    
    String v_param = "s_grcode="+v_grcode+"&s_gyear="+v_gyear+"&s_etestsubj="+v_etestsubj;    
 
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
   <param name="connection.reportname" value="etest/result_1.ozr">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">     
   <param name="odi.odinames" value="result_1">
   <param name="odi.result_1.pcount" value="1">
   <param name="odi.result_1.args1" value="param=<%=v_param%>">
</OBJECT>
</body>
</html>



