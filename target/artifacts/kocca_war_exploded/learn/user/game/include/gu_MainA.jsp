<%
//**********************************************************
//  1. 제      목 : 홈페이지 메인
//  2. 프로그램명  : zu_MainA.jsp
//  3. 개      요 : 홈페이지 메인
//  4. 환      경 : JDK 1.3
//  5. 버      젼 : 1.0
//  6. 작      성 : 이나연 05.12.15
//  7. 수      정 :
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

	//로그인 체크 변수  
    boolean bLoginCheck = false;

    //세션에 사용자 정보가 있는지 검사
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

<%//템플릿 정보%>
<%@ include file="/learn/user/game/include/site_info.jsp" %>

<!------- 글로벌메뉴, 상단 로고,메뉴 시작 ------------>
<%@ include file="/learn/user/game/include/topMainA.jsp"%>      
<!------- 글로벌메뉴, 상단 로고,메뉴 끝  ------------->

<SCRIPT LANGUAGE="JavaScript">

    function winonload()
    {
    //    if("<%=session.getAttribute("userid")%>" == "" || "<%=session.getAttribute("userid")%>" == "null")
    //    {
    //        document.getElementById("p_userid").focus();
    //    }
    }

</SCRIPT>

    <table cellpadding="0" cellspacing="0" width="212" height="100%" style="table-layout:fixed" border="0">
        <col width="1"><col width="8"><col width="190"><col width="13">
        <tr valign="top">
        <td bgcolor="#cccccc"></td>
        <td></td>
        <td>
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
        </tr>
        </table>
    </td>
    <TD width="564" align=center background="/images/user/game/homepage/type1/center_bg.gif"><img src="/images/user/game/homepage/type1/con_top.gif" width="564" height="22"><br>
        
<%
    for (int i=0; i<mainc_list.size(); i++) {
        DataBox dbox1 = (DataBox)mainc_list.get(i);

        v_m_gubun     = dbox1.getString("d_gubun");
        v_m_menuid    = dbox1.getString("d_menuid");
        v_m_menuname  = dbox1.getString("d_menuname");
        v_m_menuurl   = dbox1.getString("d_menuurl");

%>
		<%if( v_m_menuid.equals("07") ){
			if( (s_userid) != "" ){%>
		<!--  <%=v_m_menuname%> table start -->
		<jsp:include page="<%=v_m_menuurl%>" flush="true" />
		<!--  <%=v_m_menuname%> table end -->
			<%}else{}%>
		<%}else{%>
		<!--  <%=v_m_menuname%> table start -->
		<jsp:include page="<%=v_m_menuurl%>" flush="true" />
		<!--  <%=v_m_menuname%> table end -->
		<%}%>
<%	}
%>
    </td>
    <td valign="top">
        <table cellpadding="0" cellspacing="0" width="224" height="100%" style="table-layout:fixed" border="0">
        <col width="223"><col width="1">
        <tr><td colspan="2" height="22"><img src="/images/user/game/homepage/type1/right_top.gif"></td></tr>
        <tr>
        <TD vAlign=top align=center width=223 bgcolor="#FFFFFF" >
            <table cellpadding="0" cellspacing="0" width="190" border="0">

<%
    for (int i=0; i<mainr_list.size(); i++) {
        DataBox dbox2 = (DataBox)mainr_list.get(i);

        v_m_gubun     = dbox2.getString("d_gubun");
        v_m_menuid    = dbox2.getString("d_menuid");
        v_m_menuname  = dbox2.getString("d_menuname");
        v_m_menuurl   = dbox2.getString("d_menuurl");

%>

				<tr>
					<td>
				<!--  <%=v_m_menuname%> table start -->
				<jsp:include page="<%=v_m_menuurl%>" flush="true" />
				<!--  <%=v_m_menuname%> table end -->
					</td>
				</tr>
				<tr height="5"><td></td></tr>
<%	}
%>
            </table>
        </td>
        <td bgcolor="#ACC7DE"></td>
        </tr>
        </table>



<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottomA.jsp"%>
<!---------- copyright end  -------------------->


