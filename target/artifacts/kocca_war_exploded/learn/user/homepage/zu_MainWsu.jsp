<%
//**********************************************************
//  1. ��      �� : Ȩ������ ����
//  2. ���α׷��� : zu_Main.jsp
//  3. ��      �� :
//  4. ȯ      �� : JDK 1.3
//  5. ��      �� : 1.0
//  6. ��      �� : ������ 2005.07.8
//  7. ��      �� :
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.lang.*" %>
<%@ page import = "java.net.InetAddress" %>
<%@ page import = "java.net.InetSocketAddress" %>
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
<%@ include file="/learn/user/include/topMainA.jsp"%>      
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

            <!-- center start -->
            <table width="650" height="450" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="470" align="center" valign="top"></td>
                <td width="180" align="center" valign="top" background="/images/user/homepage/type1/bg_right.gif">&nbsp;</td>
              </tr>
              <tr>
                <td align="center" valign="top">
                  <table width="470" border="0" cellspacing="0" cellpadding="0">
                  
                  <%
                  	//out.println("homeHost======="+homeHost);
                  %>

<%
    for (int i=0; i<mainc_list.size(); i++) {
        DataBox dbox1 = (DataBox)mainc_list.get(i);

        v_m_gubun     = dbox1.getString("d_gubun");
        v_m_menuid    = dbox1.getString("d_menuid");
        v_m_menuname  = dbox1.getString("d_menuname");
        v_m_menuurl   = dbox1.getString("d_menuurl");

%>
                    <tr>
                      <td align="center">
<!--  <%=v_m_menuname%> table start -->
<jsp:include page="<%=v_m_menuurl%>" flush="true" />
<!--  <%=v_m_menuname%> table end -->
                      </td>
                    </tr>
<%

    }
%>


                  </table>
                </td>
                <td align="center" valign="top" background="/images/user/homepage/type1/bg_right.gif">


<%
    for (int i=0; i<mainr_list.size(); i++) {
        DataBox dbox2 = (DataBox)mainr_list.get(i);

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
              </tr>
              <tr bgcolor="#999999">
                <td height="2" align="center" valign="top"></td>
                <td height="2" align="center" valign="top" background="/images/user/homepage/type1/bg_right.gif"></td>
              </tr>
            </table>


<!---------- copyright start ------------------->
<%@ include file="/learn/user/include/bottomA.jsp"%>
<!---------- copyright end  -------------------->

