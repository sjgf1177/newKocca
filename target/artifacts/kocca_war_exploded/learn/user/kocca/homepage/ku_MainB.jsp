<%
//**********************************************************
//  1. ��      �� : Ȩ������ ����
//  2. ���α׷���  : ku_MainB.jsp
//  3. ��      �� : Ȩ������ ����
//  4. ȯ      �� : JDK 1.3
//  5. ��      �� : 1.0
//  6. ��      �� : �̳��� 05.12.15
//  7. ��      �� :
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
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


    String s_userid  = box.getSession("userid");

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
<%@ include file="/learn/user/kocca/include/site_info.jsp" %>

<!------- �۷ι��޴�, ��� �ΰ�,�޴� ���� ------------>
<%@ include file="/learn/user/kocca/include/topMainB.jsp"%>      
<!------- �۷ι��޴�, ��� �ΰ�,�޴� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">

    function winonload()
    {
//        if("<%=session.getAttribute("userid")%>" == "" || "<%=session.getAttribute("userid")%>" == "null")
//        {
//            document.getElementById("p_userid").focus();
//        }
    }

</SCRIPT>

                  <table width="182" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td valign="top"></td>
                      <td height="10" valign="top"></td>
                      <td valign="top"></td>
                    </tr>
                    <tr> 
                      <td width="15" valign="top"></td>
                      <td valign="top"> 

<%
    for (int i=0; i<mainl_list.size(); i++) {
        DataBox dbox1 = (DataBox)mainl_list.get(i);

        v_m_gubun     = dbox1.getString("d_gubun");
        v_m_menuid    = dbox1.getString("d_menuid");
        v_m_menuname  = dbox1.getString("d_menuname");
        v_m_menuurl   = dbox1.getString("d_menuurl");

%>

		<!--  <%=v_m_menuname%> table start -->
		<jsp:include page="<%=v_m_menuurl%>" flush="true" />
		<!--  <%=v_m_menuname%> table end -->
<%	}
%>

                      </td>
                      <td width="1" valign="top"></td>
                    </tr>
                  </table>
                </td>
                <td width="491" valign="top">
                  <table width="491" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="15" valign="top">&nbsp;</td>
                      <td align="center" valign="top">
                        <table width="460" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="15">
                                <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="460" height="262" id="mainflash" align="middle">
                                <param name="movie" value="<%=tem_imgpath%><%=tem_mainflash%>" />
                                <param name="quality" value="high" />
                                <embed src="<%=tem_imgpath%><%=tem_mainflash%>" quality="high" bgcolor="#ffffff" width="460" height="262" name="mainflash" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
                                </object>
                            </td>
                          </tr>
                          <tr> 
                            <td height="20">&nbsp;</td>
                          </tr>
                        </table>
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
<%	}
%>
                      </td>
                      <td width="10"></td>
                    </tr>
                  </table>
                </td>
                <td width="243" valign="top"><table width="243" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="100%" align="center" valign="top">

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
<%	}
%>
                        
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>

<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottomB_main.jsp"%>
<!---------- copyright end  -------------------->
