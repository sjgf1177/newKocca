<%@ page contentType="text/html;charset=euc-kr" %>

<%

	/********************************************************************************************************************************************
		NICE�ſ������� Copyright(c) KOREA INFOMATION SERVICE INC. ALL RIGHTS RESERVED
		
		���񽺸� : �����ֹι�ȣ���� (IPIN) ����
		�������� : �����ֹι�ȣ���� (IPIN) ����� ���� ���� ó�� ������
		
				   ���Ź��� ������(�������)�� ����ȭ������ �ǵ����ְ�, close�� �ϴ� ��Ȱ�� �մϴ�.
	*********************************************************************************************************************************************/
	
	// ����� ���� �� CP ��û��ȣ�� ��ȣȭ�� ����Ÿ�Դϴ�. (ipin_main.jsp ���������� ��ȣȭ�� ����Ÿ�ʹ� �ٸ��ϴ�.)
	String sResponseData = request.getParameter("enc_data");
	
	// ipin_main.jsp ���������� ������ ����Ÿ�� �ִٸ�, �Ʒ��� ���� Ȯ�ΰ����մϴ�.
	String sReservedParam1 = request.getParameter("param_r1");
    String sReservedParam2 = request.getParameter("param_r2");
    String sReservedParam3 = request.getParameter("param_r3");
    
    
    
    // ��ȣȭ�� ����� ������ �����ϴ� ���
    if (!sResponseData.equals("") && sResponseData != null)
    {

%>

<html>
<head>
	<title>NICE�ſ������� �����ֹι�ȣ ����</title>
	<script language='javascript'>
		function fnLoad()
		{
			// ��翡���� �ֻ����� �����ϱ� ���� 'parent.opener.parent.document.'�� �����Ͽ����ϴ�.
			// ���� �ͻ翡 ���μ����� �°� �����Ͻñ� �ٶ��ϴ�.
			parent.opener.parent.document.vnoform.enc_data.value = "<%= sResponseData %>";
			
			//parent.opener.parent.document.vnoform.param_r1.value = "<%= sReservedParam1 %>";
			//parent.opener.parent.document.vnoform.param_r2.value = "<%= sReservedParam2 %>";
			//parent.opener.parent.document.vnoform.param_r3.value = "<%= sReservedParam3 %>";
			
			parent.opener.parent.document.vnoform.target = "Parent_window";
			
			// ���� �Ϸ�ÿ� ��������� �����ϰ� �Ǵ� �ͻ� Ŭ���̾�Ʈ ��� ������ URL
			parent.opener.parent.document.vnoform.action = "/certi/ipin_result.jsp";
			parent.opener.parent.document.vnoform.submit();
			
			self.close();
		}
	</script>
</head>
<body onLoad="fnLoad()">

<%
	} else {
%>

<html>
<head>
	<title>NICE�ſ������� �����ֹι�ȣ ����</title>
	<body onLoad="self.close()">

<%
	}
%>

</body>
</html>