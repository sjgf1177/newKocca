<%
//**********************************************************
//  1. ��      ��: �ѱ��ſ������� - CheckPlus �������� ����
//  2. ���α׷��� : checkplus_fail.jsp
//  3. ��      ��: �ѱ��ſ������� - CheckPlus �������� ����
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2011-03-17
//  7. ��      ��:
//***********************************************************
%>


<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    Kisinfo.Check.CPClient kisCrypt = new  Kisinfo.Check.CPClient();

    String sEncodeData = request.getParameter("EncodeData");
    String sPlainData = "";
    String sSiteCode = "G1091";				// �ѽ��������κ��� �ο����� ����Ʈ �ڵ�
    String sSitePassword = "OGUNHRYMMD3M";		// �ѽ��������κ��� �ο����� ����Ʈ �н�����
    String sCipherTime = "";						// ��ȣȭ�� �ð�
    String sRequestNumber = "";						// ��û ��ȣ
    String sErrorCode = "";							// ���� ����ڵ�
    String sAuthType = "";							// ���� ����
    String sMessage = "";
    
    int iReturn = kisCrypt.fnDecode(sSiteCode, sSitePassword, sEncodeData);

    if( iReturn == 0 )
    {
        sPlainData = kisCrypt.getPlainData();
        sCipherTime = kisCrypt.getCipherDateTime();
        
        // ����Ÿ�� �����մϴ�.
        java.util.HashMap mapresult = kisCrypt.fnParse(sPlainData);
        
        sRequestNumber = (String)mapresult.get("REQ_SEQ");
        sErrorCode = (String)mapresult.get("ERR_CODE");
        sAuthType = (String)mapresult.get("AUTH_TYPE");
    }
    else if( iReturn == -1)
    {
        sMessage = "��ȣȭ �ý��� �����Դϴ�.";
    }    
    else if( iReturn == -4)
    {
        sMessage = "��ȣȭ ó�������Դϴ�.";
    }    
    else if( iReturn == -5)
    {
        sMessage = "��ȣȭ �ؽ� �����Դϴ�.";
    }    
    else if( iReturn == -6)
    {
        sMessage = "��ȣȭ ������ �����Դϴ�.";
    }    
    else if( iReturn == -9)
    {
        sMessage = "�Է� ������ �����Դϴ�.";
    }    
    else if( iReturn == -12)
    {
        sMessage = "����Ʈ �н����� �����Դϴ�.";
    }    
    else
    {
        sMessage = "�˼� ���� ���� �Դϴ�. iReturn : " + iReturn;
    }
%>

<html>
<head>
    <title>�ѱ��ſ������� - CheckPlus �������� �׽�Ʈ</title>
</head>
<body>
    <center>
    <p><p><p><p>
    ���������� �����Ͽ����ϴ�.<br>

    <%--�ʿ信 ���� ����� ��
    <table width=450 border=1>
        <tr>
            <td>��ȣȭ�� �ð�</td>
            <td><%= sCipherTime %> (YYMMDDHHMMSSSSS)</td>
        </tr>
        <tr>
            <td>��û ��ȣ</td>
            <td><%= sRequestNumber %></td>
        </tr>            
        <tr>
            <td>�������� ���� �ڵ�</td>
            <td><%= sErrorCode %></td>
        </tr>            
        <tr>
            <td>��������</td>
            <td><%= sAuthType %></td>
        </tr>
    </table><br><br>        
    <%= sMessage %><br>
    --%>
    </center>

    <table width=350  cellspacing="0" cellpadding="0">
      <tr>
        <td height="20"></td>
      </tr>
      <tr>
        <td align="center">            
            <a href="javascript:window.close()"><img src="/images/admin/button/btn_close.gif" width="45" height="20"  border="0" alt="�ݱ�"></a>
        </td>
      </tr>
    </table>
</body>
</html>