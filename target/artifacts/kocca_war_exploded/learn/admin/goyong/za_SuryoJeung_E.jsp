<%
//**********************************************************
//  1. ��      ��: ������
//  2. ���α׷���: za_SuryoJeung_E.jsp
//  3. ��      ��: ������ ����
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

    Vector  vc_checks   = box.getVector("p_checks");
    String  v_checks    = "";
    String  v_userid   = "";
    String  v_subj     = "";
    String  v_year     = "";
    String  v_subjseq  = "";

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

<%
    for(int i=0;i<vc_checks.size();i++) {
        v_checks  = vc_checks.elementAt(i).toString();
        StringTokenizer v_check = new StringTokenizer(v_checks, ",");
        while (v_check.hasMoreTokens()) {
            v_userid   = v_check.nextToken();
            v_subj     = v_check.nextToken();
            v_year     = v_check.nextToken();
            v_subjseq  = v_check.nextToken();
//out.println(i +" : " + v_userid +","+ v_subj +","+ v_year +","+ v_subjseq + "<br>");

                if (i ==0) {
%>
   <param name="connection.reportname" value="study/SuryoJeung.ozr">
   <param name="connection.displayname" value="<%=v_userid%>">
   <param name="viewer.showtree" value="true">
   <param name="viewer.ismultidoc" value="true">
   <param name="viewer.childcount" value="<%=vc_checks.size()-1%>">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">
   <param name="odi.odinames" value="SuryoJeung">
   <param name="odi.SuryoJeung.pcount" value="4">
   <param name="odi.SuryoJeung.args1" value="userid=<%=v_userid%>">
   <param name="odi.SuryoJeung.args2" value="subj=<%=v_subj%>">
   <param name="odi.SuryoJeung.args3" value="year=<%=v_year%>">
   <param name="odi.SuryoJeung.args4" value="subjseq=<%=v_subjseq%>">
<%
                } else {
%>

<!--    <param name="child<%=i%>.connection.servlet" value="http://218.144.185.176/oz30/server">-->
	<param name="child<%=i%>.connection.server" value="10.40.37.65">
	<param name="child<%=i%>.connection.port" value="8003">
    <param name="child<%=i%>.connection.reportname" value="study/SuryoJeung.ozr">
    <param name="child<%=i%>.connection.displayname" value="<%=v_userid%>">
    <param name="child<%=i%>.odi.odinames" value="SuryoJeung">
    <param name="child<%=i%>.odi.SuryoJeung.pcount" value="4">
    <param name="child<%=i%>.odi.SuryoJeung.args1" value="userid=<%=v_userid%>">
    <param name="child<%=i%>.odi.SuryoJeung.args2" value="subj=<%=v_subj%>">
    <param name="child<%=i%>.odi.SuryoJeung.args3" value="year=<%=v_year%>">
    <param name="child<%=i%>.odi.SuryoJeung.args4" value="subjseq=<%=v_subjseq%>">
<%
            }
        }
    }
%>

</OBJECT>


</body>
</HTML>
