<%
//**********************************************************
//  1. ��      ��: ��ü�� ������
//  2. ���α׷���: za_cpSulResult_E.jsp
//  3. ��      ��: ��ü�� ������
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2005. 10. 1
//  7. ��      ��:
//**********************************************************
%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

        String  v_gubun = box.getString("p_gubun"); //ȸ�籸��
        String  v_sulpapernum = box.getString("s_sulpapernum");
        String  v_year        = box.getString("p_year");
        String	v_orderColumn	= box.getString("p_orderColumn");           	//������ �÷���
        String	v_orderType     = box.getString("p_orderType");           		//������ ����

		String v_param = "";
		v_param="s_sulpapernum="+v_sulpapernum+"&p_year="+v_year;
		System.out.println("v_param====>>>>"+v_param);
%>

<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<BODY leftmargin="0" topmargin="0" bottommargin="0" marginwidth="0" marginheight="0" >
<!-- �������� ����-->
<%@ include file="/learn/library/oz.jsp"%>
<!-- �������� ��-->
   <param name="connection.reportname" value="cp/cp_sulresult.ozr">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">
   <param name="odi.odinames" value="cp_sulresult">
   <param name="odi.cp_sulresult.pcount" value="1">
   <param name="odi.cp_sulresult.args1" value="param=<%=v_param%>">
</OBJECT>
</body>
</HTML>