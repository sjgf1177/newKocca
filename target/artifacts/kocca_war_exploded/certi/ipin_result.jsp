<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" import="Kisinfo.Check.IPIN2Client" %>

<%

	/********************************************************************************************************************************************
		NICE�ſ������� Copyright(c) KOREA INFOMATION SERVICE INC. ALL RIGHTS RESERVED
		
		���񽺸� : �����ֹι�ȣ���� (IPIN) ����
		�������� : �����ֹι�ȣ���� (IPIN) ��� ������
	*********************************************************************************************************************************************/
	
	String sSiteCode				= "B014";			// IPIN ���� ����Ʈ �ڵ�		(NICE�ſ����������� �߱��� ����Ʈ�ڵ�)
	String sSitePw					= "20727176";			// IPIN ���� ����Ʈ �н�����	(NICE�ſ����������� �߱��� ����Ʈ�н�����)
	
	String sRtnMsg					= "";			// ó����� �޼���
	
	
	// ����� ���������� ���� ���� ����
	String sVNumber					= "";			// �����ֹι�ȣ (13�ڸ��̸�, ���� �Ǵ� ���� ����)
	String sName					= "";			// �̸�
	String sDupInfo					= "";			// �ߺ����� Ȯ�ΰ� (DI - 64 byte ������)
	String sAgeCode					= "";			// ���ɴ� �ڵ� (���� ���̵� ����)
	String sGenderCode				= "";			// ���� �ڵ� (���� ���̵� ����)
	String sBirthDate				= "";			// ������� (YYYYMMDD)
	String sNationalInfo			= "";			// ��/�ܱ��� ���� (���� ���̵� ����)
	String sCPRequestNum			= "";			// CP ��û��ȣ
	
	String sAuthInfo				= "";			// ����Ȯ�� ���� (���� ���̵� ����)
	String sCoInfo1					= "";			// �������� Ȯ�ΰ� (CI - 88 byte ������)
	String sCIUpdate				= "";			// CI ��������
	
	
	// ����� ���� �� CP ��û��ȣ�� ��ȣȭ�� ����Ÿ�Դϴ�.
    String sResponseData = request.getParameter("enc_data");
    
    // CP ��û��ȣ : ipin_main.jsp ���� ���� ó���� ����Ÿ
    String sCPRequest = (String)session.getAttribute("CPREQUEST");
    
    
    
    // ��ü ����
    IPIN2Client pClient = new IPIN2Client();
	
	
	/*
	�� ��ȣȭ �Լ� ����  ��������������������������������������������������������������������������������������������������������������������
		Method �����(iRtn)�� ����, ���μ��� ���࿩�θ� �ľ��մϴ�.
		
		fnResponse �Լ��� ��� ����Ÿ�� ��ȣȭ �ϴ� �Լ��̸�,
		fnResponseExt �Լ��� ��� ����Ÿ ��ȣȭ �� CP ��û��ȣ ��ġ���ε� Ȯ���ϴ� �Լ��Դϴ�. (���ǿ� ���� sCPRequest ����Ÿ�� ����)
		
		���� �ͻ翡�� ���ϴ� �Լ��� �̿��Ͻñ� �ٶ��ϴ�.
	������������������������������������������������������������������������������������������������������������������������������������������
	*/
	int iRtn = pClient.fnResponse(sSiteCode, sSitePw, sResponseData);
	//int iRtn = pClient.fnResponse(sSiteCode, sSitePw, sResponseData, sCPRequest);
	
	// Method ������� ���� ó������
	if (iRtn == 1)
	{
	
		/*
			������ ���� ����� ������ ������ �� �ֽ��ϴ�.
			����ڿ��� �����ִ� ������, '�̸�' ����Ÿ�� ���� �����մϴ�.
		
			����� ������ �ٸ� ���������� �̿��Ͻ� ��쿡��
			������ ���Ͽ� ��ȣȭ ����Ÿ(sResponseData)�� ����Ͽ� ��ȣȭ �� �̿��Ͻǰ��� �����մϴ�. (���� �������� ���� ó�����)
			
			����, ��ȣȭ�� ������ ����ؾ� �ϴ� ��쿣 ����Ÿ�� ������� �ʵ��� ������ �ּ���. (����ó�� ����)
			form �±��� hidden ó���� ����Ÿ ���� ������ �����Ƿ� �������� �ʽ��ϴ�.
		*/
		
		sVNumber			= pClient.getVNumber();			// �����ֹι�ȣ (13�ڸ��̸�, ���� �Ǵ� ���� ����)
		sName				= pClient.getName();			// �̸�
		sDupInfo			= pClient.getDupInfo();			// �ߺ����� Ȯ�ΰ� (DI - 64 byte ������)
		sAgeCode			= pClient.getAgeCode();			// ���ɴ� �ڵ� (���� ���̵� ����)
		sGenderCode			= pClient.getGenderCode();		// ���� �ڵ� (���� ���̵� ����)
		sBirthDate			= pClient.getBirthDate();		// ������� (YYYYMMDD)
		sNationalInfo		= pClient.getNationalInfo();	// ��/�ܱ��� ���� (���� ���̵� ����)
		sCPRequestNum		= pClient.getCPRequestNO();		// CP ��û��ȣ
		
		sAuthInfo			= pClient.getAuthInfo();		// ����Ȯ�� ���� (���� ���̵� ����)
		sCoInfo1			= pClient.getCoInfo1();			// �������� Ȯ�ΰ� (CI - 88 byte ������)
		sCIUpdate			= pClient.getCIUpdate();		// CI ��������
		
		//out.println("�����ֹι�ȣ : " + sVNumber);
		//out.println("�̸� : " + sName);
		//out.println("�ߺ����� Ȯ�ΰ� (DI) : " + sDupInfo);
		//out.println("���ɴ� �ڵ� : " + sAgeCode);
		//out.println("���� �ڵ� : " + sGenderCode);
		//out.println("������� : " + sBirthDate);
		//out.println("��/�ܱ��� ���� : " + sNationalInfo);
		//out.println("CP ��û��ȣ : " + sCPRequestNum);
		//out.println("����Ȯ�� ���� : " + sAuthInfo);
		//out.println("�������� Ȯ�ΰ� (CI) : " + sCoInfo1);
		//out.println("CI �������� : " + sCIUpdate);
		//out.println("------ ��ȣȭ �� ������ �������� Ȯ���� �ֽñ� �ٶ��ϴ�.<BR><BR><BR><BR><BR><BR>");
		
		sRtnMsg = "���� ó���Ǿ����ϴ�.";
		
	}
	else if (iRtn == -1 || iRtn == -4)
	{
		sRtnMsg =	"iRtn ��, ���� ȯ�������� ��Ȯ�� Ȯ���Ͽ� �ֽñ� �ٶ��ϴ�.";
	}
	else if (iRtn == -6)
	{
		sRtnMsg =	"���� �ѱ� charset ������ euc-kr �� ó���ϰ� ������, euc-kr �� ���ؼ� ����� �ֽñ� �ٶ��ϴ�.<BR>" +
					"�ѱ� charset ������ ��Ȯ�ϴٸ� ..<BR><B>iRtn ��, ���� ȯ�������� ��Ȯ�� Ȯ���Ͽ� ���Ϸ� ��û�� �ֽñ� �ٶ��ϴ�.</B>";
	}
	else if (iRtn == -9)
	{
		sRtnMsg = "�Է°� ���� : fnResponse �Լ� ó����, �ʿ��� �Ķ���Ͱ��� ������ ��Ȯ�ϰ� �Է��� �ֽñ� �ٶ��ϴ�.";
	}
	else if (iRtn == -12)
	{
		sRtnMsg = "CP ��й�ȣ ����ġ : IPIN ���� ����Ʈ �н����带 Ȯ���� �ֽñ� �ٶ��ϴ�.";
	}
	else if (iRtn == -13)
	{
		sRtnMsg = "CP ��û��ȣ ����ġ : ���ǿ� ���� sCPRequest ����Ÿ�� Ȯ���� �ֽñ� �ٶ��ϴ�.";
	}
	else
	{
		sRtnMsg = "iRtn �� Ȯ�� ��, NICE�ſ������� ���� ����ڿ��� ������ �ּ���.";
	}

%>

<html>
<head>
	<script language="JavaScript" type="text/JavaScript">
	function init(){		
		document.form1.action = "/servlet/controller.homepage.MainMemberJoinServlet";
		document.form1.p_process.value  = "CheckResno";
		document.form1.submit();
	}	
	</script>
</head>

<body onload="javascript:init();">
<table border="0">

<form name="form1" method="post">
	<input type="hidden" name="enc_data" value="<%= sResponseData %>">
	<input type="hidden" name="p_process" value="">
	<input type="hidden" name="i_sex" value="<%=sGenderCode %>">
	<input type="hidden" name="i_username" value="<%=sName %>">
	<input type="hidden" name="i_dupinfo" value="<%=sDupInfo %>">
	<input type="hidden" name="i_birthdate" value="<%=sBirthDate %>"/>
	<input type="hidden" name="i_vnumber" value="<%=sVNumber %>"/>	
	<input type="hidden" name="i_irtn" value="<%=iRtn %>"/>
	<input type="hidden" name="i_conninfo" value="<%=sCoInfo1 %>"/>
	
	
	
</form>
</table>

</body>
</html>