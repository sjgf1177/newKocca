<%
//**********************************************************
//  1. ��      ��: �ٸ�
//  2. ���α׷���: SubjResult_E.jsp
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
    String s_grcode       = box.getString("s_grcode");
    String s_gyear        = box.getString("s_gyear");        
    String s_grseq        = box.getString("s_grseq");
    String s_subjcourse   = box.getString("s_subjcourse"); 
    String s_subjseq      = box.getString("s_subjseq"); 
    int    s_damunpapernum= box.getInt("s_damunpapernum");     
        
    String v_param = "http://10.40.37.65:9999/learn/admin/multiestimate/OZ_DamunSubjResult_L.jsp";
    
    // head param�� 
    String v_param_h = "and b.subj='"+s_subjcourse+"' and b.damunpapernum = "+s_damunpapernum+" and b.grcode='"+s_grcode+"' and b.year = '"+s_gyear+"' and b.subjseq = '"+s_subjseq+"' ";
    
    //v_param = v_param+"?p_grcode="+v_grcode+"&p_gyear="+v_gyear+"&p_subj="+v_subj+"&p_subjseq="+v_subjseq+"&s_sulpapernum="+v_sulpapernum;    
    v_param = "s_grcode="+s_grcode+"&s_gyear="+s_gyear+"&s_grseq="+s_grseq+"&s_subjcourse="+s_subjcourse+"&s_subjseq="+s_subjseq+"&s_damunpapernum="+s_damunpapernum;
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
   <param name="connection.reportname" value="damun/SubjResult.ozr">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">     
   <param name="odi.odinames" value="SubjResult">
   <param name="odi.SubjResult.pcount" value="2">
   <param name="odi.SubjResult.args1" value="param=<%=v_param%>">
   <param name="odi.SubjResult.args2" value="param_h=<%=v_param_h%>">
</OBJECT>
</body>
</html>

