<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page language="java" import="SafeNC.kisinfo.*"%>
<%
	//**********************************************************************************************	
	//�ѱ��ſ������� ��������� �ȽɽǸ�Ȯ�� ����
	//����Ʈ�ڵ�,����Ʈ�н�����,return_url ,��û seq �� ��ȣȭ�Ѵ�.
	//�ۼ��� : 2006.10.23
    //**********************************************************************************************	
   
   
	//�ϽɽǸ���� ��������� ����� ���� ��ȣȭ�� ���� �ѽ��� �Ѱ��ָ�, �ѽ��� �˾�â�� ȣ���մϴ�.  
  //�ѽ��򿡼� ������� �ֹι�ȣ�� �̸��� �޾� ���������� ��ġ��, ������� ����url�� ��ȣȭ�Ͽ� �����ϴ�.
 	//��ȣȭ�� ���� certnc_return.jsp ���Ͽ��� ��ȣȭ�Ͽ� ��ü���� ����� ������ �˷��ݴϴ�.
     
   
  // �ʼ� �������� : pSite_code, pSite_pwd, pReturn_url 3���� �Դϴ�. 
    	
	String pSite_code 	= "K674";				// �ѽ��򿡼� �߱޹��� ����Ʈ id 
	String pSite_pwd  	= "26023508";					// �ѽ��򿡼� �߱޹��� ����Ʈ ��й�ȣ
	String pSeqid	   	= "1234567890";				// CP��û��ȣ :  �ѽ��� ���μ��� �Ϸ� �� �Է��� ���� ��ȯ�� �帳�ϴ�. 
																					//							 �ȽɽǸ��� ��ü �߰��� �ѽ��� ���μ����� ����Ǵ� �����̱⿡ 
																					//			 				 �ʿ�� ����Ҽ� �ִ� ������ �־����ϴ�. ������ �ּ���
	
	String pReturn_url	= "http://edu.kocca.or.kr/certi/certnc_return.jsp";		// ������� ���� ������ URL(��ü���� ������� ������ URL�Դϴ�.)
	//String pReturn_url	= "http://localhost:7001/certi/certnc_return.jsp";		// ������� ���� ������ URL(��ü���� ������� ������ URL�Դϴ�.)
	//http://localhost:7001/certi/ipin_process.jsp �׽�Ʈ��
	//http://edu.kocca.or.kr/certi/ipin_process.jsp �Ǽ�����
	
	String pReserved1	= "test1";					// ��Ÿ Reserved data1 : �ѽ��� ���μ��� ������ ������ ���Դϴ�. �ʿ�ÿ� ����� �ּ���.
	String pReserved2	= "test2";					// ��Ÿ Reserved data2 : �ѽ��� ���μ��� ������ ������ ���Դϴ�. �ʿ�ÿ� ����� �ּ���.
	String pReserved3	= "test3";					// ��Ÿ Reserved data3 : �ѽ��� ���μ��� ������ ������ ���Դϴ�. �ʿ�ÿ� ����� �ּ���.
	String enc_data		= "";
	
	// ����Ÿ�� ��ȣȭ,��ȣȭ �ϴ� ����Դϴ�.
	SafeNCCipher safeNC = new SafeNCCipher();
	
	//**********************************************************************************************
	// ����Ÿ�� ��ȣȭ �մϴ�. 
	//**********************************************************************************************	
	
	if( safeNC.request(pSite_code,pSite_pwd,pSeqid,pReturn_url,pReserved1,pReserved2,pReserved3) == 0 ) {
		enc_data = safeNC.getEncParam();		
	}else {
		enc_data = "";
	}               
%>

<html>
<head>
	<script Language="JavaScript">
	   function fnPopup(){
	   	   //�ѱ��ſ������� �Ƚ� �Ǹ�Ȯ�� �˾��������� ���ϴ�.	 
		   //window.open('', 'popup','width=410, height=555');
		   document.form.target = "_self";
		   document.form.action = "https://cert.namecheck.co.kr/certnc_input.asp"
		   document.form.submit();
	   }
	</script> 

<!-- 
		enc_data �� ���� �ѽ������� �����ݴϴ�. enc_data�� ���� ������, ���������� ���񽺸� ������ �����ϴ�. 
		enc_data �� ���� ���� ���Ͻø� SafeNc.jar ������ �ٽ� �ѹ� Ȯ���� �ֽð�, ���� ��⵿ �� �ּ���.
		
 -->

</head>		
<body onload="javascript:fnPopup();">
<form method="post" name="form">
 	<input type="hidden" name="enc_data" value="<%=enc_data%>">
</form>
</body>
</html>	
