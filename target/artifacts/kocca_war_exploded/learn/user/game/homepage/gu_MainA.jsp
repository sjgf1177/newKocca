<%
//**********************************************************
//  1. ��	  �� : Ȩ������ ����
//  2. ���α׷���  : zu_MainA.jsp
//  3. ��	  �� : Ȩ������ ����
//  4. ȯ	  �� : JDK 1.3
//  5. ��	  �� : 1.0
//  6. ��	  �� : �̳��� 05.12.15
//  7. ��	  �� :
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

	LoginBean bean = new LoginBean();

	String v_m_gubun		= "";
	String v_m_menuid	   = "";
	String v_m_menuname	 = "";
	String v_m_menuurl	  = "";
	ArrayList mainl_list = (ArrayList)request.getAttribute("mainl_list");
	ArrayList mainr_list = (ArrayList)request.getAttribute("mainr_list");
	ArrayList mainc_list = (ArrayList)request.getAttribute("mainc_list");
   
%>

<%//���ø� ����%>

<%//@ include file="/learn/user/game/include/topMainA.jsp"%>
<%@ include file="/learn/user/portal/include/topNoLeftMenu.jsp"%>
        <div id="content" class="footer_content">	  
    <TABLE width=1000 height="100%" cellPadding=0 cellSpacing=0 >
        <COLGROUP>
        <COL width=212>
        <COL width=564>
        <COL width=224>
        <TR vAlign=top>
              <TD width="212" align=center>
<SCRIPT LANGUAGE="JavaScript">

	function winonload()
	{
	//	if("<%=session.getAttribute("userid")%>" == "" || "<%=session.getAttribute("userid")%>" == "null")
	//	{
	//		document.getElementById("p_userid").focus();
	//	}
	}

</SCRIPT>

	<table cellpadding="0" cellspacing="0" width="216" height="100%" style="table-layout:fixed" border="0" bgcolor="#FFFFFF">
		<col width="1"><col width="8"><col width="190"><col width="13">
		<tr>
		<td colspan="3" height="15"></td>
		<tr valign="top">
		<td bgcolor="#cccccc"></td>
		<td></td>
		<td align="right">
<%
	for (int i=0; i<mainl_list.size(); i++) {
		DataBox dbox1 = (DataBox)mainl_list.get(i);

		v_m_gubun	 = dbox1.getString("d_gubun");
		v_m_menuid	= dbox1.getString("d_menuid");
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
	<TD width="558" align=center bgcolor="#FFFFFF">
<table border="0" cellspacing="0" cellpadding="0" width="539">
<tr>
<td height="15"></td>
<td valign="top" rowspan="2"><img src="/images/user/game/homepage/type1/con_bg.gif"></td>
</tr>
<tr>
<td>	
<%
	for (int i=0; i<mainc_list.size(); i++) {
		DataBox dbox1 = (DataBox)mainc_list.get(i);

		v_m_gubun	 = dbox1.getString("d_gubun");
		v_m_menuid	= dbox1.getString("d_menuid");
		v_m_menuname  = dbox1.getString("d_menuname");
		v_m_menuurl   = dbox1.getString("d_menuurl");

%>
		<%if( v_m_menuid.equals("07") ){
			if( (s_userid) != "" ){%>
		<!--  <%=v_m_menuurl%> table start -->
		<jsp:include page="<%=v_m_menuurl%>" flush="true" />
		<!--  <%=v_m_menuname%> table end -->
			<%}else{}%>
		<%}else{%>
		<!--  <%=v_m_menuurl%> table start -->
		<jsp:include page="<%=v_m_menuurl%>" flush="true" />
		<!--  <%=v_m_menuname%> table end -->
		<%}%>
<%	}
%>
</td>
</tr>
</table>
	</td>
	<td valign="top">
		<table cellpadding="0" cellspacing="0" width="224" height="100%" style="table-layout:fixed" border="0">
		<col width="223"><col width="1">
		<tr><td colspan="2" height="15"><img src="/images/user/game/homepage/type1/right_top.gif"></td></tr>
		<tr>
		<TD vAlign=top align=center width=223 bgcolor="#FFFFFF" >
			<table cellpadding="0" cellspacing="0" width="190" border="0">

<%
	for (int i=0; i<mainr_list.size(); i++) {
		DataBox dbox2 = (DataBox)mainr_list.get(i);

		v_m_gubun	 = dbox2.getString("d_gubun");
		v_m_menuid	= dbox2.getString("d_menuid");
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
		<td bgcolor="#FFFFFF"></td>
		</tr>
		</table>
</td>
</TR>
</COLGROUP>
</TABLE>
    </div>
<!-- ���û���Ʈ ���� -->
<%@ include file="/learn/user/game/include/relateSite.jsp"%>
<!-- ���û���Ʈ -->
<!-- footer -->
<%@ include file="/learn/user/portal/include/footerNoLeftMenu.jsp"%>
<!-- footer -->


