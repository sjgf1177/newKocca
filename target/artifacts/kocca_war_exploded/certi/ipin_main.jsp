<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" import="Kisinfo.Check.IPIN2Client" %>

<%

	/********************************************************************************************************************************************
		NICE�ſ������� Copyright(c) KOREA INFOMATION SERVICE INC. ALL RIGHTS RESERVED
		
		���񽺸� : �����ֹι�ȣ���� (IPIN) ����
		�������� : �����ֹι�ȣ���� (IPIN) ȣ�� ������
	*********************************************************************************************************************************************/
	
	String sSiteCode				= "B014";			// IPIN ���� ����Ʈ �ڵ�		(NICE�ſ����������� �߱��� ����Ʈ�ڵ�)
	String sSitePw					= "20727176";			// IPIN ���� ����Ʈ �н�����	(NICE�ſ����������� �߱��� ����Ʈ�н�����)
	
	String sEncData					= "";			// ��ȣȭ �� ����Ÿ
	
	String sRtnMsg					= "";			// ó����� �޼���
	
	
	
	/*
	�� sReturnURL ������ ���� ����  ����������������������������������������������������������������������������������������������������������
		NICE�ſ������� �˾����� �������� ����� ������ ��ȣȭ�Ͽ� �ͻ�� �����մϴ�.
		���� ��ȣȭ�� ��� ����Ÿ�� ���Ϲ����� URL ������ �ּ���.
		
		* URL �� http ���� �Է��� �ּž��ϸ�, �ܺο����� ������ ��ȿ�� �������� �մϴ�.
		* ��翡�� �����ص帰 ���������� ��, ipin_process.jsp �������� ����� ������ ���Ϲ޴� ���� �������Դϴ�.
		
		�Ʒ��� URL �����̸�, �ͻ��� ���� �����ΰ� ������ ���ε� �� ���������� ��ġ�� ���� ��θ� �����Ͻñ� �ٶ��ϴ�.
		�� - http://www.test.co.kr/ipin_process.jsp, https://www.test.co.kr/ipin_process.jsp, https://test.co.kr/ipin_process.jsp
	������������������������������������������������������������������������������������������������������������������������������������������
	*/
	String sReturnURL				= "http://edu.kocca.or.kr/certi/ipin_process.jsp";
	//String sReturnURL				= "http://localhost:7001/certi/ipin_process.jsp";
	//http://localhost:7001/certi/ipin_process.jsp �׽�Ʈ��
	//http://edukocca.or.kr/certi/ipin_process.jsp �Ǽ�����
	/*
	�� sCPRequest ������ ���� ����  ����������������������������������������������������������������������������������������������������������
		[CP ��û��ȣ]�� �ͻ翡�� ����Ÿ�� ���Ƿ� �����ϰų�, ��翡�� ������ ���� ����Ÿ�� ������ �� �ֽ��ϴ�.
		
		CP ��û��ȣ�� ���� �Ϸ� ��, ��ȣȭ�� ��� ����Ÿ�� �Բ� �����Ǹ�
		����Ÿ ������ ���� �� Ư�� ����ڰ� ��û�� ������ Ȯ���ϱ� ���� �������� �̿��Ͻ� �� �ֽ��ϴ�.
		
		���� �ͻ��� ���μ����� �����Ͽ� �̿��� �� �ִ� ����Ÿ�̱⿡, �ʼ����� �ƴմϴ�.
	������������������������������������������������������������������������������������������������������������������������������������������
	*/
	String sCPRequest				= "";
	
	
	
	
	
	// ��ü ����
	IPIN2Client pClient = new IPIN2Client();
	
	
	// �ռ� ����帰 �ٿͰ���, CP ��û��ȣ�� ������ ����� ���� �Ʒ��� ���� ������ �� �ֽ��ϴ�.
	sCPRequest = pClient.getRequestNO(sSiteCode);
	
	// CP ��û��ȣ�� ���ǿ� �����մϴ�.
	// ���� ������ ������ ������ ipin_result.jsp ���������� ����Ÿ ������ ������ ���� Ȯ���ϱ� �����Դϴ�.
	// �ʼ������� �ƴϸ�, ������ ���� �ǰ�����Դϴ�.
	session.setAttribute("CPREQUEST" , sCPRequest);
	
	
	// Method �����(iRtn)�� ����, ���μ��� ���࿩�θ� �ľ��մϴ�.
	int iRtn = pClient.fnRequest(sSiteCode, sSitePw, sCPRequest, sReturnURL);
	
	// Method ������� ���� ó������
	if (iRtn == 0)
	{
	
		// fnRequest �Լ� ó���� ��ü������ ��ȣȭ�� �����͸� �����մϴ�.
		// ����� ��ȣȭ�� ����Ÿ�� ��� �˾� ��û��, �Բ� �����ּž� �մϴ�.
		sEncData = pClient.getCipherData();
		
		sRtnMsg = "���� ó���Ǿ����ϴ�.";
	
	}
	else if (iRtn == -1 || iRtn == -2)
	{
		sRtnMsg =	"������ �帰 ���� ��� ��, �ͻ� ����ȯ�濡 �´� ����� �̿��� �ֽñ� �ٶ��ϴ�.<BR>" +
					"�ͻ� ����ȯ�濡 �´� ����� ���ٸ� ..<BR><B>iRtn ��, ���� ȯ�������� ��Ȯ�� Ȯ���Ͽ� ���Ϸ� ��û�� �ֽñ� �ٶ��ϴ�.</B>";
	}
	else if (iRtn == -9)
	{
		sRtnMsg = "�Է°� ���� : fnRequest �Լ� ó����, �ʿ��� 4���� �Ķ���Ͱ��� ������ ��Ȯ�ϰ� �Է��� �ֽñ� �ٶ��ϴ�.";
	}
	else
	{
		sRtnMsg = "iRtn �� Ȯ�� ��, NICE�ſ������� ���� ����ڿ��� ������ �ּ���.";
	}

%>

<html>
<head>
	<title>NICE�ſ������� �����ֹι�ȣ ����</title>
	
	<script language='javascript'>
	//window.name ="Parent_window";
	
	function fnPopup(){
		//window.open('', 'popupIPIN2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		//document.form_ipin.target = "popupIPIN2";
		document.form_ipin.action = "https://cert.vno.co.kr/ipin.cb";
		document.form_ipin.submit();
	}
	</script>
</head>

<body onload="javascript:fnPopup();"><!--
iRtn : <%= iRtn %> - <%= sRtnMsg %><br><br>
��ü���� ��ȣȭ ����Ÿ : [<%= sEncData %>]<br><br>

--><!-- �����ֹι�ȣ ���� �˾��� ȣ���ϱ� ���ؼ��� ������ ���� form�� �ʿ��մϴ�. -->
<form name="form_ipin" method="post">
	<input type="hidden" name="m" value="pubmain">						<!-- �ʼ� ����Ÿ��, �����Ͻø� �ȵ˴ϴ�. -->
    <input type="hidden" name="enc_data" value="<%= sEncData %>">		<!-- ������ ��ü������ ��ȣȭ �� ����Ÿ�Դϴ�. -->
    
    <!-- ��ü���� ����ޱ� ���ϴ� ����Ÿ�� �����ϱ� ���� ����� �� ������, ������� ����� �ش� ���� �״�� �۽��մϴ�.
    	 �ش� �Ķ���ʹ� �߰��Ͻ� �� �����ϴ�. -->
    <input type="hidden" name="param_r1" value="">
    <input type="hidden" name="param_r2" value="">
    <input type="hidden" name="param_r3" value="">
    
    <!--<a href="javascript:fnPopup();"><img src="http://image.creditbank.co.kr/static/img/vno/new_img/bt_17.gif" width=218 height=40 border=0></a>
--></form>



<!-- �����ֹι�ȣ ���� �˾� ���������� ����ڰ� ������ ������ ��ȣȭ�� ����� ������ �ش� �˾�â���� �ްԵ˴ϴ�.
	 ���� �θ� �������� �̵��ϱ� ���ؼ��� ������ ���� form�� �ʿ��մϴ�. -->
<form name="vnoform" method="post">
	<input type="hidden" name="enc_data">								<!-- �������� ����� ���� ��ȣȭ ����Ÿ�Դϴ�. -->
	
	<!-- ��ü���� ����ޱ� ���ϴ� ����Ÿ�� �����ϱ� ���� ����� �� ������, ������� ����� �ش� ���� �״�� �۽��մϴ�.
    	 �ش� �Ķ���ʹ� �߰��Ͻ� �� �����ϴ�. -->
    <input type="hidden" name="param_r1" value="">
    <input type="hidden" name="param_r2" value="">
    <input type="hidden" name="param_r3" value="">
</form>

</body>
</html>