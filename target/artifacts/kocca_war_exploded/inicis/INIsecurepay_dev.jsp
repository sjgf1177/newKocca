<%------------------------------------------------------------------------------
 FILE NAME : INIsecurepay.jsp
 AUTHOR : jwkim@inicis.com
 DATE : 2004/07
 USE WITH : INIsecurepay.html
 
 �̴����� �÷������� ���� ��û�� ������ ó���Ѵ�.
                                                          http://www.inicis.com
                                                      http://support.inicis.com
                            Copyright 2004 Inicis Co., Ltd. All rights reserved.
------------------------------------------------------------------------------%>
<%@ page
	language = "java"
	contentType = "text/html; charset=euc-kr"
	import = "com.inicis.inipay.*"
%>

<% 
	/**************************************
	 * 1. INIpay41 Ŭ������ �ν��Ͻ� ���� *
	 **************************************/
	INIpay41 inipay = new INIpay41();
	
	
	/*********************
	 * 2. ���� ���� ���� *
	 *********************/
	 
	 /************************************************************************************
	 * �ϴ��� PGID �κ��� ���Ҽ��ܺ��� TID�� ������ ǥ���ϵ��� �ϸ�,   *
	 * ���Ƿ� �����Ͽ� �߻��� ������ ���ؼ��� (��)�̴Ͻý��� å����      *
	 * ������ �ҽ� ������ ���Ǹ� �ٶ��ϴ�					        	*
	 ***********************************************************************************/
			
	String pgid = "";
	String paymethod = request.getParameter("paymethod");
	if(paymethod.equals("Card")){
		pgid = "CARD"; //�ſ�ī��
	}
	else if(paymethod.equals("Account")){
		pgid = "ACCT"; // ���� ���� ��ü
	}
	else if(paymethod.equals("DirectBank")){
		pgid = "DBNK"; // �ǽð� ���� ��ü
	}
	else if(paymethod.equals("OCBPoint")){
		pgid = "OCBP"; // OCB
	}
	else if(paymethod.equals("VCard")){
		pgid = "ISP_"; // ISP ����
	}
	else if(paymethod.equals("HPP")){
		pgid = "HPP_"; // �޴��� ����
	}
	else if(paymethod.equals("Nemo")){
		pgid = "NEMO"; // NEMO ����
	}
	else if(paymethod.equals("ArsBill")){
		pgid = "ARSB"; // 700 ��ȭ����
	}
	else if(paymethod.equals("PhoneBill")){
		pgid = "PHNB"; // PhoneBill ����(�޴� ��ȭ)
	}
	else if(paymethod.equals("Ars1588Bill")){
		pgid = "1588"; // 1588 ��ȭ����
	}
	else if(paymethod.equals("VBank")){
		pgid = "VBNK"; // ������� ��ü
	}
	else if(paymethod.equals("Culture")){
		pgid = "CULT"; // ��ȭ��ǰ�� ����
	}
	else if(paymethod.equals("CMS")){
		pgid = "CMS_"; // CMS ����
	}
	else if(paymethod.equals("AUTH")){
		pgid = "AUTH"; // �ſ�ī�� ��ȿ�� �˻�
	}
	else if(paymethod.equals("INIcard")){
		pgid = "INIC"; // ��Ƽ�Ӵ� ����
	}
	else if(paymethod.equals("MDX")){
		pgid = "MDX_"; // �󵦽�ī��
	}
	else{
		pgid = paymethod;
	}	
	
	inipay.setInipayHome("C:/INIpay41_JAVA"); // INIpay Home (�����η� ������ ����)
	inipay.setKeyPw("1111"); // Ű�н�����(�������̵� ���� ����)
	inipay.setType("securepay"); // ����
	inipay.setPgId("INIpay"+pgid); // ����
	inipay.setSubPgIp("203.238.3.10"); // ����
	inipay.setDebug("true"); // �α׸��("true"�� �����ϸ� ���� �αװ� ������)
	inipay.setMid(request.getParameter("mid")); // �������̵�
	inipay.setUid(request.getParameter("uid")); // ����(���� ���� �Ұ�)
	inipay.setUip(request.getRemoteAddr()); // ����
	inipay.setGoodName(request.getParameter("goodname"));
	inipay.setCurrency(request.getParameter("currency"));
	inipay.setPrice(request.getParameter("price"));
	inipay.setBuyerName(request.getParameter("buyername"));
	inipay.setBuyerTel(request.getParameter("buyertel"));
	inipay.setBuyerEmail(request.getParameter("buyeremail"));
	inipay.setParentEmail(request.getParameter("parentemail")); // ��ȣ�� �̸��� �ּ�(�ڵ��� , ��ȭ�����ÿ� 14�� �̸��� ���� �����ϸ�  �θ� �̸��Ϸ� ���� �����뺸 �ǹ�, �ٸ����� ���� ���ÿ� ���� ����)
	inipay.setPayMethod(request.getParameter("paymethod"));
	inipay.setEncrypted(request.getParameter("encrypted"));
	inipay.setSessionKey(request.getParameter("sessionkey"));
	inipay.setUrl("http://www.your_domain.co.kr"); // ���� ���񽺵Ǵ� ���� SITE URL�� �����Ұ�
	inipay.setCardCode(request.getParameter("cardcode")); // �÷����ο��� ���ϵǴ� ī���ڵ�
	/*-----------------------------------------------------------------*
	 * ������ ���� *                                                   *
	 *-----------------------------------------------------------------*
	 * �ǹ������ �ϴ� ������ ��쿡 ���Ǵ� �ʵ���̸�               *
	 * �Ʒ��� ������ INIsecurepay.html ���������� ����Ʈ �ǵ���        *
	 * �ʵ带 ����� �ֵ��� �Ͻʽÿ�.                                  *
	 * ������ ������ü�� ��� �����ϼŵ� �����մϴ�.                   *
	 *-----------------------------------------------------------------*/
	inipay.setRecvName(request.getParameter("recvname")); 	// ������ ��
	inipay.setRecvTel(request.getParameter("recvtel"));	// ������ ����ó
	inipay.setRecvAddr(request.getParameter("recvaddr"));	// ������ �ּ�
	inipay.setRecvPostNum(request.getParameter("recvpostnum"));	// ������ �����ȣ
	
	
	/*--------------------------------------------------------------*
	 * ������ �Һ� �ŷ��� ��� �Һΰ��� �ڿ� ������ ���θ� ǥ���Ѵ�.*
	 *--------------------------------------------------------------*/
	String interest = "";
	String quotainterest = request.getParameter("quotainterest");
	if(quotainterest.equals("1")){
		interest = "(������ �Һ�)";
	}
	/*--------------------------------------------------------------*/
	
	
	/*
	 * �̴Ͻý� ��ȸ ������(https://iniweb.inicis.com)���� ���̴�
	 * �ѱ��� ������ ��� �Ʒ� 3�� �� �ϳ��� ���(�ּ�����)�Ͽ� 
	 * �ѱ��� ����� ���̴� ���� ����Ͻʽÿ�.
	 */
	
	//inipay.setEncoding(1);
	//inipay.setEncoding(2);
	//inipay.setEncoding(3);

	
	/****************
	 * 3. ���� ��û *
	 ****************/
	inipay.startAction();
	
	
	/****************
	 * 4. ���� ��� *
	 ****************/
	 
	 String tid = inipay.getTid(); // �ŷ���ȣ
	 String resultCode = inipay.getResultCode(); // ����ڵ� ("00"�̸� ���� ����)
	 String resultMsg = inipay.getResultMsg(); // ������� (���Ұ���� ���� ����)
	 String payMethod = inipay.getPayMethod(); // ���ҹ�� (�Ŵ��� ����)
	 String price1 = inipay.getPrice1(); // OK Cashbag ���հ���� �ſ�ī�� ���ұݾ�
	 String price2 = inipay.getPrice2(); // OK Cashbag ���հ���� ����Ʈ ���ұݾ�
	 String authCode = inipay.getAuthCode(); // �ſ�ī�� ���ι�ȣ
	 String cardQuota = inipay.getCardQuota(); // �ҺαⰣ
	 String quotaInterest = inipay.getQuotaInterest(); // �������Һ� ���� ("1"�̸� �������Һ�)
	 String cardCode = inipay.getCardCode(); // �ſ�ī��� �ڵ� (�Ŵ��� ����)
	 String cardIssuerCode = inipay.getCardIssuerCode(); // ī��߱޻� �ڵ� (�Ŵ��� ����)
	 String authCertain = inipay.getAuthCertain(); // �������� ���࿩�� ("00"�̸� ����)
	 String pgAuthDate = inipay.getPgAuthDate(); // �̴Ͻý� ���γ�¥
	 String pgAuthTime = inipay.getPgAuthTime(); // �̴Ͻý� ���νð�
	 String ocbSaveAuthCode = inipay.getOcbSaveAuthCode(); // OK Cashbag ���� ���ι�ȣ
	 String ocbUseAuthCode = inipay.getOcbUseAuthCode(); // OK Cashbag ��� ���ι�ȣ
	 String ocbAuthDate = inipay.getOcbAuthDate(); // OK Cashbag �����Ͻ�
	 String eventFlag = inipay.getEventFlag(); // ���� �̺�Ʈ ���� ����
	 String nohpp = inipay.getNoHpp(); // �޴��� ������ ���� �޴��� ��ȣ
	 String noars = inipay.getNoArs(); // ��ȭ���� �� ���� ��ȭ��ȣ  
	 String perno = inipay.getPerno(); // �۱��� �ֹι�ȣ
	 String vacct = inipay.getVacct(); // ������¹�ȣ
	 String vcdbank = inipay.getVcdbank(); // �Ա��� �����ڵ�
	 String dtinput = inipay.getDtinput(); // �Աݿ�����
	 String nminput = inipay.getNminput(); // �۱��� ��
	 String nmvacct = inipay.getNmvacct(); // ������ ��
	 String moid = inipay.getmoid(); // ���� �ֹ���ȣ
	 String codegw = inipay.getcodegw(); // ��ȭ���� ����� �ڵ�
	 String ocbcardnumber = inipay.getocbcardnumber(); // OK CASH BAG ���� , ������ ��� OK CASH BAG ī�� ��ȣ
	 String cultureid = inipay.getcultureid(); // ���� ���� ID
	 String cardNumber = inipay.getCardNumber(); // �ſ�ī���ȣ  	 
	 String mid = request.getParameter("mid");
	 String goodname = request.getParameter("goodname");
	 String price = request.getParameter("price");
	 String buyername = request.getParameter("buyername");
	 String buyertel = request.getParameter("buyertel");
	 String buyeremail = request.getParameter("buyeremail");
	 
        /*-------------------------------------------------------------------------*
	 * �����߻��� ��� �޼������� �����ڵ带 �����ϴ� �κ����� ���� ���� ����  *
	 *-------------------------------------------------------------------------*/
	 String tmp_ErrCode[] = resultMsg.split("]");
	 String resulterrCode = resultMsg.substring(1,tmp_ErrCode[0].length()); // ����޼��� �����ڵ�
	/*-------------------------------------------------------------------------*/
	 
		 
	/*******************************************************************
	 * 5. �������                                                     *
	 *                                                                 *
	 * ���� ����� DB � �����ϰų� ��Ÿ �۾��� �����ϴٰ� �����ϴ�  *
	 * ���, �Ʒ��� �ڵ带 �����Ͽ� �̹� ���ҵ� �ŷ��� ����ϴ� �ڵ带 *
	 * �ۼ��մϴ�.                                                     *
	 *******************************************************************/
	 try
	 {
	 	// DB CODE HERE
	 }
	 catch(Exception e)
	 {
		inipay.setType("cancel"); // ����
		inipay.setCancelMsg("DB FAIL"); // ��һ���
		inipay.startAction();
		
		resultCode = "01";
		resultMsg = "DB FAIL";
	}
%>

<html>
<head>

<title>INIpay</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<script>
	var openwin=window.open("childwin.html","childwin","width=300,height=160");
	openwin.close();
	
	function show_receipt() // ������ ���
	{
		if("<%=resultCode%>" == "00")
		{
			var receiptUrl = "https://iniweb.inicis.com/DefaultWebApp/mall/cr/cm/mCmReceipt_head.jsp?noTid=" + "<%=tid%>" + "&noMethod=1";
			window.open(receiptUrl,"receipt","width=430,height=700");
		}
		else
		{
			alert("�ش��ϴ� ���������� �����ϴ�");
		}
	}
		
	function errhelp() // �� �������� ���
	{
		var errhelpUrl = "http://www.inicis.com/ErrCode/Error.jsp?result_err_code=" + "<%=resulterrCode%>" + "&mid=" + "<%=mid%>" + "&tid=<%=tid%>" + "&goodname=" + "<%=goodname%>" + "&price=" + "<%=price%>" + "&paymethod=" + "<%=payMethod%>" + "&buyername=" + "<%=buyername%>" + "&buyertel=" + "<%=buyertel%>" + "&buyeremail=" + "<%=buyeremail%>" + "&codegw=" + "<%=codegw%>";
		window.open(errhelpUrl,"errhelp","width=520,height=150, scrollbars=yes,resizable=yes");
	}
	
	
	
</script>

<style type="text/css">
	BODY{font-size:9pt; line-height:160%}
	TD{font-size:9pt; line-height:160%}
	INPUT{font-size:9pt;}
	.emp{background-color:#E0EFFE;}
</style>

</head>

<body>
<table border=0 width=600>
<tr>
<td>
<hr noshade size=1>
<b>���� ���</b>
<hr noshade size=1>
</td>
</tr>
</table>
<br>

<table border=0 width=600>
	<tr>
		<td align=right nowrap>������� : </td>
		<td><%=payMethod%></td>
	</tr>
	<tr>
		<td align=right nowrap>����ڵ� : </td>
		<td><%=resultCode%></td>
	</tr>
	<tr>
		<td align=right nowrap>������� : </td>
		<td><font class=emp><%=resultMsg%></font></td>
	</tr>
	<tr>
		<td align=right nowrap>�ŷ���ȣ : </td>
		<td><%=tid%></td>
	</tr>
	<tr>
		<td align=right nowrap>���ι�ȣ : </td>
		<td><%=authCode%></td>
	</tr>
	<tr>
		<td align=right nowrap>�ҺαⰣ : </td>
		<td><%=cardQuota%>���� <%=interest%></td>
	</tr>
	<tr>
		<td align=right nowrap>ī������ : </td>
		<td><%=cardCode%></td>
	</tr>
	<tr>
		<td align=right nowrap>ī��߱޻� : </td>
		<td><%=cardIssuerCode%></td>
	</tr>
	<tr>
		<td align=right nowrap>���γ�¥ : </td>
		<td><%=pgAuthDate%></td>
	</tr>
	<tr>
		<td align=right nowrap>���νð� : </td>
		<td><%=pgAuthTime%></td>
	</tr>
	<tr>
		<td align=right><br><b>������ �Աݿ��� ����</b></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align=right nowrap>�Ա� ���� ��ȣ : </td>
		<td><%=vacct%></td>
	</tr>
	<tr>
		<td align=right nowrap>�Ա� �����ڵ� : </td>
		<td><%=vcdbank%></td>
	</tr>
	<tr>
		<td align=right nowrap>������ �� : </td>
		<td><%=nmvacct%></td>
	</tr>
	<tr>
		<td align=right nowrap>�۱��� �� : </td>
		<td><%=nminput%></td>
	</tr>
	<tr>
		<td align=right nowrap>�۱��� �ֹι�ȣ : </td>
		<td><%=perno%></td>
	</tr>
	<tr>
		<td align=right nowrap>��ǰ �ֹ���ȣ : </td>
		<td><%=moid%></td>
	</tr>
	<tr>
		<td align=right nowrap>�Աݿ��� ���� : </td>
		<td><%=dtinput%></td>
	</tr>
	<tr>
		<td align=right><br><b>OK Cashbag ����</b></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align=right nowrap>���� ���ι�ȣ : </td>
		<td><%=ocbSaveAuthCode%></td>
	</tr>
	<tr>
		<td align=right nowrap>��� ���ι�ȣ : </td>
		<td><%=ocbUseAuthCode%></td>
	</tr>
	<tr>
		<td align=right nowrap>�����Ͻ� : </td>
		<td><%=ocbAuthDate%></td>
	</tr>
	<tr>
		<td align=right nowrap>����Ʈ ���ұݾ� : </td>
		<td><%=price2%></td>
	</tr>
	<tr>
		<td colspan=2>
		<br> 											
		�� ���θ��� (��)�̴Ͻý��� ��ǥ������ �̿��ϴ� ���,
		ī���̿������ <font color=red>����ó�� �̴Ͻý��������ҷ�
		ǥ��</font>�˴ϴ�</font>.
		</td>											
	</tr>
	<tr>
	<td colspan=2 align=center>
	<br>
	<%
               	if(resultCode.equals("00")){
               		out.println("<input type=button value='����������' onclick=javascript:show_receipt()>");
                }
                else{
                	out.println("<input type=button value='���г��� �ڼ��� ����' onclick=javascript:errhelp()>");
                }
                                                    	
       	%>
	
	<br><br>
	</td>
	</tr>
	<tr>
		<td colspan=2><hr noshade size=1></td>
	</tr>
	<tr>
		<td align=right colspan=2>Copyright Inicis, Co.<br>www.inicis.com</td>
	</tr>
</table>
</body>
</html>
