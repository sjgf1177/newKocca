<%
//**********************************************************
//  1. ��      ��: ����Ʈ
//  2. ���α׷���: za_SulmunFiveScaleSubj_E.jsp
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
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");			
    
    String v_grcode = box.getString("s_grcode");
    String v_year   = box.getString("s_gyear");
    String v_subjseqgr = box.getString("s_grseq"); 
    String v_param = "s_grcode="+v_grcode+"&s_gyear="+v_year+"&s_grseq="+v_subjseqgr;		 
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
   <param name="connection.reportname" value="reports/SulmunFiveScaleSubj.ozr">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">
   <param name="odi.odinames" value="SulmunFiveScale">
   <param name="odi.SulmunFiveScale.pcount" value="1">
   <param name="odi.SulmunFiveScale.args1" value="sulmun_url=http://218.144.185.176/learn/admin/course/za_SulmunFiveScale.jsp?<%=v_param%>">
</OBJECT>
</body>
</html>