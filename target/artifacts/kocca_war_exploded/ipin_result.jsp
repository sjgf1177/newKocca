<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" import="Kisinfo.Check.IPINClient" %>

<%

		/********************************************************************************************************************************************
		NICE�ſ������� Copyright(c) KOREA INFOMATION SERVICE INC. ALL RIGHTS RESERVED
		
		���񽺸� : �����ֹι�ȣ���� (IPIN) ����
		�������� : �����ֹι�ȣ���� (IPIN) ��� ������
		*********************************************************************************************************************************************/
		
		String sSiteCode				= "B014";			// IPIN ���� ����Ʈ �ڵ�		(NICE�ſ����������� �߱��� ����Ʈ�ڵ�)
		String sSitePw					= "20727176";			// IPIN ���� ����Ʈ �н�����	(NICE�ſ����������� �߱��� ����Ʈ�н�����)
		
		String sRtnMsg					= "";			// ó����� �޼���
		
		String i_sex         = "";
		String i_memberyear  = "";
		String i_membermonth = "";
		String i_memberday   = "";
		String i_username	 = "";
		String i_dupinfo	 = "";
		String i_birthdate	 = "";
		String i_vnumber	 = "";
		
		// ����� ���� �� CP ��û��ȣ�� ��ȣȭ�� ����Ÿ�Դϴ�.
		String sResponseData = request.getParameter("enc_data");
		
		// CP ��û��ȣ : ipin_main.jsp ���� ���� ó���� ����Ÿ
		String sCPRequest = (String)session.getAttribute("CPREQUEST");
		
		
		
		// ��ü ����
		IPINClient pClient = new IPINClient();
		
		
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
		i_memberyear  = pClient.getBirthDate().substring(0,4); 
		i_membermonth = pClient.getBirthDate().substring(4,6);
		i_memberday   = pClient.getBirthDate().substring(6,8);
		i_sex 		  = pClient.getGenderCode().substring(0,1);
		i_username 	  = pClient.getName();
		i_dupinfo	  = pClient.getDupInfo();
		i_birthdate	  = pClient.getBirthDate();
		i_vnumber	  = pClient.getVNumber();
				
		String sVNumber			= pClient.getVNumber();			// �����ֹι�ȣ (13�ڸ��̸�, ���� �Ǵ� ���� ����)
		String sName			= pClient.getName();			// �̸�
		String sDupInfo			= pClient.getDupInfo();			// �ߺ����� Ȯ�ΰ� (DI - 64 byte ������)
		String sAgeCode			= pClient.getAgeCode();			// ���ɴ� �ڵ� (���� ���̵� ����)
		String sGenderCode		= pClient.getGenderCode();		// ���� �ڵ� (���� ���̵� ����)
		String sBirthDate		= pClient.getBirthDate();		// ������� (YYYYMMDD)
		String sNationalInfo	= pClient.getNationalInfo();	// ��/�ܱ��� ���� (���� ���̵� ����)
		String sCPRequestNum	= pClient.getCPRequestNO();		// CP ��û��ȣ
		
		sRtnMsg = "���� ó���Ǿ����ϴ�.";
		
		}
		else if (iRtn == -1 || iRtn == -4)
		{
		sRtnMsg =	"iRtn ��, ���� ȯ�������� ��Ȯ�� Ȯ���Ͽ� �ֽñ� �ٶ��ϴ�.";
		}
		else if (iRtn == -6)
		{
		sRtnMsg =	"���� �ѱ� charset ������ euc-kr �� ó���ϰ� ������, euc-kr �� ���ؼ� ����� �ֽñ� �ٶ��ϴ�.<BR>	�ѱ� charset ������ ��Ȯ�ϴٸ� ..<BR><B>iRtn ��, ���� ȯ�������� ��Ȯ�� Ȯ���Ͽ� ���Ϸ� ��û�� �ֽñ� �ٶ��ϴ�.</B>";
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


<%@page import="com.credu.library.RequestBox"%>
<%@page import="com.credu.library.RequestManager"%>



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

<!-- ����� ������ '�̸�' �ܿ��� ȭ�鿡 �����Ͻø� �ȵ˴ϴ�.
	 ����� ������ ����ؾ� �ϴ� ��쿣, �Ʒ��� ���� ��ȣȭ ������ ��� �� ��ȣȭ�Ͽ� �̿��Ͻñ� �ٶ��ϴ�.
	 ����, ��ȣȭ �� ����Ÿ�� ����ؾ� �ϴ� ��쿡�� ���������� ���Ͽ� ������ �ֽñ� �ٶ��ϴ�. -->
	 
<table border="0">
<form name="form1" method="post">
	<input type="hidden" name="enc_data" value="<%= sResponseData %>">
	<input type="hidden" name="p_process" value="">
	<input type="hidden" name="i_sex" value="<%=i_sex %>">
	<input type="hidden" name="i_memberyear" value="<%=i_memberyear %>">
	<input type="hidden" name="i_membermonth" value="<%=i_membermonth %>">
	<input type="hidden" name="i_memberday" value="<%=i_memberday %>">
	<input type="hidden" name="i_username" value="<%=i_username %>">
	<input type="hidden" name="i_dupinfo" value="<%=i_dupinfo %>">
	<input type="hidden" name="i_birthdate" value="<%=i_birthdate %>"/>
	<input type="hidden" name="i_vnumber" value="<%=i_vnumber %>"/>	
	<input type="hidden" name="i_irtn" value="<%=iRtn %>"/>
	
	
	
</form>
</table>

</body>
</html>