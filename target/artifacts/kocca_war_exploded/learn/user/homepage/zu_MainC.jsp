<%
//**********************************************************
//  1. ��      �� : Ȩ������ ����     (C)
//  2. ���α׷��� : zu_MainB.jsp
//  3. ��      �� :
//  4. ȯ      �� : JDK 1.3
//  5. ��      �� : 1.0
//  6. ��      �� : ������ 2005.07.8
//  7. ��      �� :
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.propose.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    //�α��� üũ ����  
    boolean bLoginCheck = false;

    //���ǿ� ����� ������ �ִ��� �˻�
    if (session.getAttribute("userid") != null ) {
        bLoginCheck = true;
    }
    box.put("onLoad","onload=\"winonload();\"");

    LoginBean bean = new LoginBean();
            
    String v_m_gubun        = "";
    String v_m_menuid       = "";
    String v_m_menuname     = "";
    String v_m_menuurl      = "";
    ArrayList mainl_list = (ArrayList)request.getAttribute("mainl_list");
    ArrayList mainr_list = (ArrayList)request.getAttribute("mainr_list");
    ArrayList mainc_list = (ArrayList)request.getAttribute("mainc_list");
%>
<%//���ø� ����%>
<%@ include file="/learn/user/include/site_info.jsp" %>


<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topMainC.jsp"%>      
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">
<!--

// ��������
function openInfomation() {
    window.open('/learn/user/homepage/pop_infomation_agree.html','openTong','width=450,height=328,scrollbars=no,resizable=no');
}
<%
   if (bLoginCheck) {
   // ó���α�� : 0, ������ : 1
       int isOk = bean.firstCheck(box);
       if (isOk == 0) {
%>
           openInfomation();
<%
       }
   }
%>
//-->
</SCRIPT>

<!-- center -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr>
    <td height="16"></td>
  </tr>
  <tr> 
    <td background="/images/user/homepage/type3/bg_center.gif"><table width="870" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="170" align="center" valign="top" background="/images/user/homepage/type3/bg_left.gif">

<%
    for (int i=0; i<mainl_list.size(); i++) {
        DataBox dbox2 = (DataBox)mainl_list.get(i);

        v_m_gubun     = dbox2.getString("d_gubun");
        v_m_menuid    = dbox2.getString("d_menuid");
        v_m_menuname  = dbox2.getString("d_menuname");
        v_m_menuurl   = dbox2.getString("d_menuurl");

%>
<!--  <%=v_m_menuname%> table start -->
<jsp:include page="<%=v_m_menuurl%>" flush="true" />
<!--  <%=v_m_menuname%> table end -->
<%
    }
%>
          </td>
          <td valign="top">
            <table width="690" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="496" height="25">&nbsp;</td>
                <td width="194">&nbsp;</td>
              </tr>
              <tr> 
                <td align="center" valign="top" > 

<%
    for (int i=0; i<mainc_list.size(); i++) {
        DataBox dbox1 = (DataBox)mainc_list.get(i);

        v_m_gubun     = dbox1.getString("d_gubun");
        v_m_menuid    = dbox1.getString("d_menuid");
        v_m_menuname  = dbox1.getString("d_menuname");
        v_m_menuurl   = dbox1.getString("d_menuurl");

%>

<!--  <%=v_m_menuname%> table start -->
<jsp:include page="<%=v_m_menuurl%>" flush="true" />
<!--  <%=v_m_menuname%> table end -->
<%
    }
%>
                </td>
                <td align="center" valign="top" background="/images/user/homepage/type3/bg_right.gif"> 
<%
    for (int i=0; i<mainr_list.size(); i++) {
        DataBox dbox3 = (DataBox)mainr_list.get(i);

        v_m_gubun     = dbox3.getString("d_gubun");
        v_m_menuid    = dbox3.getString("d_menuid");
        v_m_menuname  = dbox3.getString("d_menuname");
        v_m_menuurl   = dbox3.getString("d_menuurl");

%>

<!--  <%=v_m_menuname%> table start -->
<jsp:include page="<%=v_m_menuurl%>" flush="true" />
<!--  <%=v_m_menuname%> table end -->
<%
    }
%>
                </td>
              </tr>
            </table>


<!---------- copyright start ------------------->
<%@ include file="/learn/user/include/bottomC.jsp"%>
<!---------- copyright end  -------------------->

