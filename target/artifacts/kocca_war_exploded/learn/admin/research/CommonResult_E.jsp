<%
//**********************************************************
//  1. ��      ��: �Ϲݼ���
//  2. ���α׷���: CommonResult_E
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
    String v_grcode = box.getString("p_grcode");
    String v_gyear  = box.getString("p_gyear");        
    //String v_subj   = box.getString("p_subj");
    //String v_subjseq= box.getString("p_subjseq"); 
    String v_sulpapernum= box.getString("p_sulpapernum");     
    //String v_param = "http://218.144.185.176/learn/admin/research/OZ_sulmuncommonResult.jsp";
    String v_param = "http://10.40.37.65:9999/learn/admin/research/OZ_SulmunCommonResult.jsp";
    
    v_param = v_param+"?p_grcode="+v_grcode+"&p_gyear="+v_gyear+"&p_sulpapernum="+v_sulpapernum;    
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
   <param name="connection.reportname" value="reaserch/sulmuncommon.ozr">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">     
   <param name="odi.odinames" value="sulmuncommon">
   <param name="odi.sulmuncommon.pcount" value="1">
   <param name="odi.sulmuncommon.args1" value="sulmunl_url=<%=v_param%>">
</OBJECT>
</body>
</html>



