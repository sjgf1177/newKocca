<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page import="com.credu.library.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.lang.String" %>
<%@ page import="com.credu.system.*" %>
<%@ page import="com.credu.common.*" %>
<%@ page import="com.credu.homepage.*" %>
<%@ page import="com.credu.util.Base64" %>


<%@page import="com.credu.scorm.multi.Base64Decoder"%><jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
try {
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }
    box.setSession("tem_grcode","N000108");
    box.setSession("tem_sso","Y");

    //HashMap ssoMap = new HashMap();
    String encodedD1 = request.getParameter("strUserID");
    String encodedD2 = request.getParameter("strKName");

    String id = Base64.decodeToString(encodedD1);
    id = "nara_"+id;
    String name = Base64.decodeToString(encodedD2);
    
    System.out.println(id + " : " + name);
    // System.out.println("N000022 id : " + id);
    // System.out.println("N000022 pw : " + pw);
    // System.out.println("N000022 name : " + name);
    // System.out.println("N000022 compnm : " + compnm);
    // System.out.println("N000022 deptnm : " + deptnm);
    // System.out.println("N000022 levelnm : " + levelnm);
    // System.out.println("N000022 email : " + email);
    // System.out.println("N000022 tel : " + tel);
    // System.out.println("N000022 mobile : " + mobile);
    // System.out.println("N000022 fax : " + fax);

    if(id.equals("") || name.equals("")) {
%>
<script type="text/javascript">
    alert("�߸��� ���� �Դϴ�.");
    location.href="http://edu.kocca.or.kr";
</script>
<%
    } else {
%>
<jsp:forward page="/servlet/controller.homepage.MainServlet" >
        <jsp:param name="p_id" value="<%=id%>" />
        <jsp:param name="p_pw" value="kocca12345" />
        <jsp:param name="gubun" value="60" />
        <jsp:param name="p_name" value="<%=name%>" />
        <jsp:param name="p_process" value="ASP_Login" />
    </jsp:forward>
<%
    }
%>

<%--HashMap => <%=ssoMap.toString()%>                   <br>--%>
<%--���̵� => <%=(String)ssoMap.get("F1")%>                     <br>--%>
<%--��й�ȣ => <%=decoder.decode((String)ssoMap.get("F12"))%>      <br>--%>
<%--�̸� => <%=(String)ssoMap.get("F2")%>                   <br>--%>
<%--�̸��� => <%=(String)ssoMap.get("F21")%>                <br>--%>
<%--����ó => <%=(String)ssoMap.get("F5")%>                     <br>--%>
<%--�޴����̵� => <%=request.getParameter("menuid")%>           <br>--%>
<%--<%--%>
<%--out.print("ssoMap=> "+ssoMap.toString());--%>
<%--String sParmMenu = "101SBC1";--%>
<%--out.println("topmenu(gubun)=>"+sParmMenu.substring(0,1)+"<br>");--%>
<%--out.println("leftmenu(menuid)=>"+sParmMenu.substring(1,3)+"<br>");--%>
<%--out.println("orders=>"+sParmMenu.substring(6,7)+"<br>");--%>
<%--%>--%>

<%
/*
SessionUser user = new SessionUser();
user.setUserId((String)ssoMap.get("F18")==null?"":(String)ssoMap.get("F18")); // �α���ID
user.setUserName((String)ssoMap.get("F2")==null?"":(String)ssoMap.get("F2"));    // ����ڸ�
user.setUserUid((String)ssoMap.get("F1")==null?"":(String)ssoMap.get("F1"));     // �����ID
user.setUserCompId((String)ssoMap.get("F3")==null?"":(String)ssoMap.get("F3"));   // ȸ��ID
user.setUserCompName((String)ssoMap.get("F4")==null?"":(String)ssoMap.get("F4"));    // ȸ���
user.setUserDeptId((String)ssoMap.get("F6")==null?"":(String)ssoMap.get("F6"));   // �μ�ID
user.setUserDeptName((String)ssoMap.get("F7")==null?"":(String)ssoMap.get("F7"));    // �μ���
user.setUserGradeName((String)ssoMap.get("F9")==null?"":(String)ssoMap.get("F9"));   // ���޸�
user.setUserSysMail((String)ssoMap.get("F13")==null?"":(String)ssoMap.get("F13"));   // ���θ���
user.setUserEmail((String)ssoMap.get("F21")==null?"":(String)ssoMap.get("F21"));     // �ܺθ���
user.setCompId("compid");   // ȸ���ڵ�
user.setTsId("tsid");       // ������������ID
user.setMenuId("menuid");   // �޴�ID
user.setUserDptPosition((String)ssoMap.get("F45")==null?"":(String)ssoMap.get("F45"));  // ����
user.setUserMemGrade((String)ssoMap.get("F20")==null?"":(String)ssoMap.get("F20"));   // ȸ�����
user.setUserPhone((String)ssoMap.get("F5")==null?"":(String)ssoMap.get("F5"));      // ��ȭ��ȣ
user.setUserMobile((String)ssoMap.get("F56")==null?"":(String)ssoMap.get("F56"));     // �޴�����ȣ
user.setUserFax((String)ssoMap.get("F57")==null?"":(String)ssoMap.get("F57"));        // �ѽ���ȣ
*/

} catch (Exception e) {
    System.out.println("Exception Occured ins narasso.jsp : " + e.getMessage());
    throw new Exception("Exception Occured ins narasso.jsp \r\n" + e.getMessage());
}

%>