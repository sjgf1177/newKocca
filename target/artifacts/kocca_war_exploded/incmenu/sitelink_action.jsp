<%-- 
	��  �� : ���� ����Ʈ�� ��ũ
	���ϸ� : sitelink_action.jsp
	�ۼ��� : 2004.12.01
	�ۼ��� : �̼���[cospm@hanafos.com]
	��  �� : 
	��  �� : ���� üũ�Ͽ� ó�� �Ұ�. ������ ��
--%> 

<%@ page language="java" contentType="text/html; charset=euc-kr" %>

<%@ page import="com.daumsoft.util.SBUtil" %>
<%@ page import="com.daumsoft.sitelink.SiteLinkManager" %>
<%@ page import="com.daumsoft.sitelink.SiteLinkEntity" %>

<%
	int iSL_NO = Integer.parseInt(request.getParameter("slNo"));

	SiteLinkEntity sle = new SiteLinkEntity();
	SiteLinkManager slMan = SiteLinkManager.getInstance();
	
	sle = slMan.selSiteLinkInfo(iSL_NO);

	String sSiteUrl = sle.getM_sSiteUrl();	// ����Ʈ �⺻ Url
	String sSiteLinkPage = "";				// ����Ʈ ��ũ������
	String sSsnEmpNo = "";					// ���
	String sSsnName = "";					// ����
	String sSsnRrn = "";					// �ֹε�Ϲ�ȣ
	String sSsnId = "";						// ���̵�
	String[] sPvs = null;					// Param&Value
%>

<html>
<body>
<form name="SL_FORM" >

<%
	// ���� ���� üũ �Ұ�
	if (iSL_NO == 0) {
		sSiteLinkPage = sle.getM_sSiteLinkPage();
		sSiteUrl = sSiteUrl + sSiteLinkPage;

		sSsnEmpNo = sle.getM_sSsnEmpNo();
		sSsnName = sle.getM_sSsnName();
		sSsnRrn = sle.getM_sSsnRrn();
		sSsnId = sle.getM_sSsnId();
	    sPvs = sle.getM_sParamValues(sle.getM_sParamValue(), "|");	
%>

<input type="hidden" name="<%=sSsnEmpNo%>" value="����">
<input type="hidden" name="<%=sSsnName%>" value="����">
<input type="hidden" name="<%=sSsnRrn%>" value="����">
<input type="hidden" name="<%=sSsnId%>" value="����">

<%
		if (sPvs != null) {
			for (int i=0; i < sPvs.length; i++) {
				String[] sPv = SBUtil.tokenizingByDelimeter(sPvs[i], "_");
%>

<input type="hidden" name="<%=sPv[0]%>" value="<%=sPv[1]%>">

<%
			}
		}
	}
%>

</form>
</body>
</html>


<script>    
		document.SL_FORM.action = '<%=sSiteUrl%>';
		document.SL_FORM.submit();
</script>
