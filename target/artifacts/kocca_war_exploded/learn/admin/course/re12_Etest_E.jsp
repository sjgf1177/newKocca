<%
//**********************************************************
//  1. ��      ��: Etest
//  2. ���α׷���: re12_Etest_E.jsp
//  3. ��      ��: �������
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

    String  ss_grcode      = box.getString("s_grcode");           //�����׷�
    String  ss_gyear       = box.getString("s_gyear");            //�⵵
    String  ss_grseq       = box.getString("s_grseq");            //��������
    String  ss_grseqnm     = box.getString("s_grseqnm");          //����������
    String  ss_upperclass  = box.getString("s_upperclass");       //������з�
    String  ss_middleclass = box.getString("s_middleclass");      //�����ߺз�
    String  ss_lowerclass  = box.getString("s_lowerclass");       //�����Һз�

    String  ss_uclass      = box.getStringDefault("s_uclass","ALL");        //�����з�
            
    
    String  ss_subjcourse  = box.getString("s_subjcourse");       //����&�ڽ�
    
    String  ss_subjseq     = box.getString("s_subjseq");          //���� ����
    
    String  ss_company     = box.getString("s_company");          //ȸ��
    String  ss_edustart    = box.getString("s_start");            //����������
    String  ss_eduend      = box.getString("s_end");              //����������

    String v_param = " and c.grcode='"+ss_grcode+"' ";    

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


   <param name="connection.reportname" value="reports/re12_Etest.ozr">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">
   <param name="odi.odinames" value="re12_Etest">
   <param name="odi.re12_Etest.pcount" value="1">
   <param name="odi.re12_Etest.args1" value="param=<%=v_param%>">   
</OBJECT>
</body>
</html>



