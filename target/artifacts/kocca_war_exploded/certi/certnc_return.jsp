<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page language="java" import="SafeNC.kisinfo.*"%>
<%
	//**********************************************************************************************
	//�ѱ��ſ������� ��������� �ȽɽǸ�Ȯ�� ����
	//�ۼ��� : 2006.10.23
    //**********************************************************************************************

	 //�ѽ��򿡼� ������ ������� enc_data �� ��� �����帳�ϴ�. (main ������ enc_data�ʹ� �ٸ��ϴ�.) �̶�, �ѱ��� euc-kr �� �����ϴ�. 
	 //�ѽ��򿡼� ������ ���� 
	 //1. �Ƚ�Ű�� : �ֹι�ȣ ��üŰ (13byte) - ��ü���� ������ ������� ��Ƽũ�� ���Դϴ�. 
	 //2. ���� 		:	�ȽɽǸ� ����� �̸�
	 //3. ������� : ����� �������
	 //4. ���� 		:��-M, ��-F, �ܱ��γ�-A, �ܱ��ο�-B
	 //���� 4������ ������ ������, ���Ͻ� ��� �Ƚ�Ű���� ���� �Ѱܵ帱�� �ֽ��ϴ�. �������ڿ��� ���� �ּ���.


	String enc_data = "";
	String sMsg = "";
    String nc_safeid 	= "";	//�Ƚ�Ű��(13�ڸ�)
    String nc_username 	= "";	//����
    String nc_jumindate	= "";	//�������
    String nc_gender 	= "";	//����
    String isIpin		= "N";	//�����ɿ���( ������ Y / �Ǹ����� N )
    int iReturn			= 0;	//���ϰ�
	
	//���� �� ������� ������ ��ȣȭ �Ǿ� ��ȯ�ȴ�.
	enc_data = request.getParameter("enc_data");		
	
	//out.println("���ϵ���Ÿ : " + enc_data + "<br><br><br>");

	if (enc_data != "") {
	    SafeNCCipher safeNC = new SafeNCCipher();
	    
		//**********************************************************************************************
		// ReturnURL�κ��� ���ŵ� ��ȣȭ ������(AES_CBC_PAD, SHA256, BASE64 Encoded Data)	
		// �޼ҵ带 ȣ���Ͽ� ��ȣȭ�� ���� �����ɴϴ�.
		//**********************************************************************************************	    
        iReturn = safeNC.response(enc_data);		
        
        //�ѽ����˾����� ���ϰ� 2,3,50(���ǵ�������)���� �ش��ϴ� ����ڴ� ó���ǰ� �ֽ��ϴ�.
				//2, 3, 50 ���� �ش��ϴ� ���ϰ��� ó�����ּ���.
        
        if( iReturn > 0 ) {                      
			if (iReturn == 1) {		
				sMsg = "���θ���";						//�ȽɽǸ� ó������� 1 : ������������. ==> �����ܰ�� ó���� �ֽø� �˴ϴ�.
			}else if (iReturn == 2){	
				sMsg = "���ξƴ�";						//�����̾ƴѰ�� : �ѽ��򿡼� ó���մϴ�.
			}else if (iReturn == 3) {		
			   sMsg = "�ڷ����";      			//�ڷ���� : �ѽ��򿡼� ó���մϴ�. 
			}else if (iReturn == 4) {	
			   sMsg = "�ý��ۿ���";      
			}else if (iReturn == 5) {		
			   sMsg = "üũ������";      
			}else if (iReturn == 10) {
			   sMsg = "����Ʈ�ڵ����";      
			}else if (iReturn == 11) {
			   sMsg = "�ߴܵȻ���Ʈ";      
			}else if (iReturn == 12) {	
			   sMsg = "��й�ȣ����";      
			}else{
				sMsg = "��Ÿ�����Դϴ�." ;   //�ش� ���Ͽ������� Ȯ���Ͽ� ó���Ͽ� �ּ���.     
			}

		    //out.println ("�Ǹ�Ȯ�� ó�����(iReturn) = [" + iReturn + "] " + sMsg + "<BR>");   	
		    //out.println ("�Ƚ�Ű��(13�ڸ�:�ֹι�ȣ��ü��) = [" + safeNC.getSafeID() + "]<BR>");
		    //out.println ("���� = [" + safeNC.getUserName() + "]<BR>");
		    //out.println ("������� = [" + safeNC.getJuminDate() + "]<BR>");	      		
		    //out.println ("���� = [" + safeNC.getGender() + "]<BR>");		      			
		    //out.println ("REQUEST_SEQ = [" + safeNC.getRequestSEQ() + "]<BR>");
		    //out.println ("RESERVED1 = [" + safeNC.getReserved1() + "]<BR>");
		    //out.println ("RESERVED2 = [" + safeNC.getReserved2() + "]<BR>");
		    //out.println ("RESERVED3 = [" + safeNC.getReserved3() + "]<BR>");  
		    
		    
		    nc_safeid		=	safeNC.getSafeID();
		    nc_username		=	safeNC.getUserName();
		    nc_jumindate	=	safeNC.getJuminDate();
		    nc_gender		=	safeNC.getGender();
		}		    	    	
	}else{
		out.println ("ó���� ����Ÿ�� �����ϴ�.");
	}
%>

<html>
<head>
	<script Language="JavaScript">
	   function fnLoad(){
			
		   if(<%=iReturn%> == "1"){
				//alert("�Ǹ������� �Ϸ�Ǿ����ϴ�");

				//�ѱ��ſ������� �Ƚ� �Ǹ�Ȯ�� �˾��������� ���ϴ�.	 
				   //window.open('', 'popup','width=410, height=555');
				   //document.form.target = "_self";
				   //document.form.action = "https://cert.namecheck.co.kr/certnc_input.asp"
				   //document.form.submit();
				   parent.opener.parent.document.form1.nc_safeid.value = "<%=nc_safeid%>";
				   parent.opener.parent.document.form1.nc_username.value = "<%=nc_username%>";
				   parent.opener.parent.document.form1.nc_jumindate.value = "<%=nc_jumindate%>";
				   parent.opener.parent.document.form1.nc_gender.value = "<%=nc_gender%>";
				   parent.opener.parent.document.form1.nc_cert.value = "Y";
				   
				   
				   parent.opener.parent.document.form1.target = "Parent_window";
				   parent.opener.parent.document.form1.action = "/servlet/controller.homepage.MainMemberJoinServlet";
				   parent.opener.parent.document.form1.p_process.value = "CheckResno";
				   parent.opener.parent.document.form1.submit();

				   self.close();
		   }else{
			   alert("�Է��Ͻ� ������ �ùٸ��� �ʽ��ϴ�.");
			   self.close();
		   }
	   	   
	   }
	</script> 

<!-- 
		enc_data �� ���� �ѽ������� �����ݴϴ�. enc_data�� ���� ������, ���������� ���񽺸� ������ �����ϴ�. 
		enc_data �� ���� ���� ���Ͻø� SafeNc.jar ������ �ٽ� �ѹ� Ȯ���� �ֽð�, ���� ��⵿ �� �ּ���.
		
 -->

</head>		
<!-- <body onload="javascript:fnPopup();">  -->
<body onload="JavaScript:fnLoad()">
<form method="post" name="form">
 	<!--<a href="JavaScript:fnLoad();">�ȽɽǸ�Ȯ��</a>
--></form>
</body>
</html>	
