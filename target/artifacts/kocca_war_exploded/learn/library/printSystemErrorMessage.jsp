<%
//**********************************************************
//  1. ��      ��: ���� ó�� ȭ��
//  2. ���α׷���: printSystemErrorMessage.jsp
//  3. ��      ��: System Error ó�� ȭ��
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 4. 9
//  7. ��      ��: ������ 2003. 4. 9
//***********************************************************
%>

<%@ page isErrorPage="true" contentType="text/html;charset=euc-kr"%>

<%
        String errMsg = request.getParameter("errMsg");
		out.print(errMsg);
		if( errMsg == null ){
			errMsg = "";
		} else {
		  out.print(errMsg);
		}
		
%>


<HTML>
<HEAD>
<TITLE></TITLE>
<LINK rel="stylesheet" href="/css/style_main.css" type="text/css">
<SCRIPT src="/script/cresys.js" language="JavaScript"></SCRIPT>


</HEAD>

<BODY topmargin="0" leftmargin="0">

<TABLE cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
	
	<tr valign="top">
		<td>
			<TABLE cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
				<tr valign="top">
					<td width="200" >
						<!-- ���� �޴� ���� -->
						<TABLE cellpadding="0" cellspacing="0" border="0" width="200">
							<tr>
								<td align="right" style="padding-right:1px">
									<!--IMG src="/images/common/left_title_login.gif" border="0"-->
								</td>
							</tr>
						</TABLE>
						<!-- ���� �޴� �� -->
					</td>
					<td>
						<!-- �˻� ���� -->
						<%//@include file="/incmenu/search_knowledge.jsp"%>
						<!-- �˻� �� -->
						<!-- ���� ���� -->
						<table width="628" align="center" height="100%" border="0" cellpadding="0" cellspacing="0">
						  <!--
						  <tr> 
						    <td width="19" height="28" align="left" valign="top"><img src="/images/admin/portal/bullet01.gif"></td>
						    <td width="767" valign="top" class="title">�ý��� ����</td>
						  </tr>
						  <tr> 
						    <td height="1" colspan="2" bgcolor="#CCCCCC"><img src="/images/admin/portal/blank.gif" width="1" height="1"></td>
						  </tr>
						  <tr> 
						    <td height="3" colspan="2" bgcolor="#F0F0F0"><img src="/images/admin/portal/blank.gif" width="1" height="1"></td>
						  </tr>
						-->
						  <tr>
						    <td align="center" width="18" style="padding-left:20px">
						    <img src="/images/common/system_error.gif" border="0">
						
						    <!--����κ� �� --></td>
						  </tr>
						</table>
						<!-- ���� �� -->
					</td>
				</tr>
			</TABLE>
		</td>
	</tr>
	<tr height="51">
		<td valign="top">
			<!-- FOOTER ���� -->
			<jsp:include page="/incmenu/footer.jsp" flush="true">
				<jsp:param name="sUrl" value="<%=request.getServletPath().toString()%>"/>
			</jsp:include>
			<!-- FOOTER �� -->
		</td>
	</tr>
</TABLE>
</BODY>
</HTML>

