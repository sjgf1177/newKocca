<%------------------------------------------------------------------------------
 FILE NAME : INIsecurepay_kocca.jsp
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
//**********************************************************
//  1. ��      ��: SUBJECT PREVIEW PAGE
//  2. ���α׷���: gu_SubjectPreviewOn.jsp
//  3. ��      ��: �����ȳ�
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004. 01.12
//  7. ��      ��:
//***********************************************************
%>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.account.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<jsp:useBean id = "memberBean" class = "com.credu.system.MemberAdminBean"  scope = "page" />
<jsp:useBean id = "code" class = "com.credu.system.CodeConfigBean"  scope = "page" />
<jsp:useBean id = "probean" class = "com.credu.propose.ProposeBean"  scope = "page" />

<% //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

	/**************************************
	 * 1. INIpay41 Ŭ������ �ν��Ͻ� ���� *
	 **************************************/
	INIpay41 inipay = new INIpay41();


	/*********************
	 * 2. ���� ���� ���� *
	 *********************/

	 /************************************************************************************
	 * �ϴ��� PGID �κ��� ���Ҽ��ܺ��� TID�� ������ ǥ���ϵ��� �ϸ�,                     *
	 * ���Ƿ� �����Ͽ� �߻��� ������ ���ؼ��� (��)�̴Ͻý��� å����                      *
	 * ������ �ҽ� ������ ���Ǹ� �ٶ��ϴ�					             *
	 ************************************************************************************/

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
		else if(paymethod.equals("TEEN")){
		pgid = "TEEN"; // ƾĳ��
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
	inipay.setCardCode(request.getParameter("cardcode")); // �÷����ο��� ���ϵǴ� ī���ڵ� ���ڸ�
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

	 String tid 			= inipay.getTid(); // �ŷ���ȣ
	 String resultCode 		= inipay.getResultCode(); // ����ڵ� ("00"�̸� ���� ����)
	 String resultMsg 		= inipay.getResultMsg(); // ������� (���Ұ���� ���� ����)
	 String payMethod 		= inipay.getPayMethod(); // ���ҹ�� (�Ŵ��� ����)
	 String price1 			= inipay.getPrice1(); // OK Cashbag ���հ���� �ſ�ī�� ���ұݾ�
	 String price2 			= inipay.getPrice2(); // OK Cashbag ���հ���� ����Ʈ ���ұݾ�
	 String authCode 		= inipay.getAuthCode(); // �ſ�ī�� ���ι�ȣ
	 String cardQuota 		= inipay.getCardQuota(); // �ҺαⰣ
	 String quotaInterest 	= inipay.getQuotaInterest(); // �������Һ� ���� ("1"�̸� �������Һ�)
	 String cardCode 		= inipay.getCardCode(); // �ſ�ī��� �ڵ� (�Ŵ��� ����)
	 String cardIssuerCode 	= inipay.getCardIssuerCode(); // ī��߱޻� �ڵ� (�Ŵ��� ����)
	 String authCertain 	= inipay.getAuthCertain(); // �������� ���࿩�� ("00"�̸� ����)
	 String pgAuthDate 		= inipay.getPgAuthDate(); // �̴Ͻý� ���γ�¥
	 String pgAuthTime 		= inipay.getPgAuthTime(); // �̴Ͻý� ���νð�
	 String ocbSaveAuthCode = inipay.getOcbSaveAuthCode(); // OK Cashbag ���� ���ι�ȣ
	 String ocbUseAuthCode 	= inipay.getOcbUseAuthCode(); // OK Cashbag ��� ���ι�ȣ
	 String ocbAuthDate 	= inipay.getOcbAuthDate(); // OK Cashbag �����Ͻ�
	 String eventFlag 		= inipay.getEventFlag(); // ���� �̺�Ʈ ���� ����
	 String nohpp 			= inipay.getNoHpp(); // �޴��� ������ ���� �޴��� ��ȣ
	 String noars 			= inipay.getNoArs(); // ��ȭ���� �� ���� ��ȭ��ȣ
	 String perno 			= inipay.getPerno(); // �۱��� �ֹι�ȣ
	 String vacct 			= inipay.getVacct(); // ������¹�ȣ
	 String vcdbank 		= inipay.getVcdbank(); // �Ա��� �����ڵ�
	 String dtinput 		= inipay.getDtinput(); // �Աݿ�����
	 String nminput 		= inipay.getNminput(); // �۱��� ��
	 String nmvacct 		= inipay.getNmvacct(); // ������ ��
	 String moid 			= inipay.getmoid(); // ���� �ֹ���ȣ
	 String codegw 			= inipay.getcodegw(); // ��ȭ���� ����� �ڵ�
	 String ocbcardnumber 	= inipay.getocbcardnumber(); // OK CASH BAG ���� , ������ ��� OK CASH BAG ī�� ��ȣ
	 String cultureid 		= inipay.getcultureid(); // ���� ���� ID
	 String cardNumber 		= inipay.getCardNumber(); // �ſ�ī���ȣ

	 String mid 			= request.getParameter("mid");
	 String goodname 		= request.getParameter("goodname");
	 String price 			= request.getParameter("price");
	 String buyername 		= request.getParameter("buyername");
	 String buyertel 		= request.getParameter("buyertel");
	 String buyeremail 		= request.getParameter("buyeremail");

	// ƾĳ�� ���������� �̿�ÿ���  ���� ��� ����
	String RemainPrice 		= inipay.getRemainPrice();		//ƾĳ�������� �ܾ�

	//N:�Ϲݰ���, P:����������, B:����
	String v_gubun		= request.getParameter("p_gubun");

	String v_receive = request.getParameter("p_receive");
	String v_phone = request.getParameter("p_phone");
	String v_post1 = request.getParameter("p_post1");
	String v_post2 = request.getParameter("p_post2");
	String v_addr1 = request.getParameter("p_addr1");
	String v_addr2 = request.getParameter("p_addr2");

	/*-------------------------------------------------------------------------*
	 * �����߻��� ��� �޼������� �����ڵ带 �����ϴ� �κ����� ���� ���� ����  *
	 *-------------------------------------------------------------------------*/
	 //String tmp_ErrCode[] 	= resultMsg.split("]");
	 //String resulterrCode 	= resultMsg.substring(1,tmp_ErrCode[0].length());

	 System.out.println("resultmsg.indexOf=" + resultMsg.indexOf("]"));

	 String resulterrCode 	= "";

	 if (resultMsg.indexOf("]") != -1) {
	 	resulterrCode=resultMsg.substring(1,resultMsg.indexOf("]"));
	 }

	 System.out.println("resulterrCode = " + resulterrCode);
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
	 	System.out.println("#1");

	 	// DB CODE HERE
	 	if (box.getSession("userid").equals(""))    {
	 		// ������ ������ �������
	 		inipay.setType("cancel"); // ����
			inipay.setCancelMsg("NO SESSION"); // ��һ���
			inipay.startAction();

			resultCode = "01";
			resultMsg = "NO SESSION";

	 	} else {
	 		//HashTable ����

			Hashtable BillData = new Hashtable();

			BillData.clear();
			BillData.put("tid" 				,tid 			);
			BillData.put("resultCode" 		,resultCode 	);
			BillData.put("resultMsg" 		,resultMsg 		);
			BillData.put("payMethod" 		,payMethod 		);
			BillData.put("price1" 			,price1 		);
			BillData.put("price2" 			,price2 		);
			BillData.put("authCode" 		,authCode 		);
			BillData.put("cardQuota" 		,cardQuota 		);
			BillData.put("quotaInterest" 	,quotaInterest 	);
			BillData.put("cardCode" 		,cardCode 		);
			BillData.put("cardIssuerCode" 	,cardIssuerCode );
			BillData.put("authCertain" 	    ,authCertain 	);
			BillData.put("pgAuthDate" 		,pgAuthDate 	);
			BillData.put("pgAuthTime" 		,pgAuthTime 	);
			BillData.put("ocbSaveAuthCode"  ,ocbSaveAuthCode);
			BillData.put("ocbUseAuthCode" 	,ocbUseAuthCode );
			BillData.put("ocbAuthDate" 	    ,ocbAuthDate 	);
			BillData.put("eventFlag" 		,eventFlag 		);
			BillData.put("nohpp" 			,nohpp 			);
			BillData.put("noars" 			,noars 			);
			BillData.put("perno" 			,perno 			);
			BillData.put("vacct" 			,vacct 			);
			BillData.put("vcdbank" 		    ,vcdbank 		);
			BillData.put("dtinput" 		    ,dtinput 		);
			BillData.put("nminput" 		    ,nminput 		);
			BillData.put("nmvacct" 		    ,nmvacct 		);
			BillData.put("moid" 			,moid 			);
			BillData.put("codegw" 			,codegw 		);
			BillData.put("ocbcardnumber" 	,ocbcardnumber 	);
			BillData.put("cultureid" 		,cultureid 		);
			BillData.put("cardNumber" 		,cardNumber 	);
			BillData.put("mid" 			    ,mid 			);
			BillData.put("goodname" 		,goodname 		);
			BillData.put("price" 			,price 			);
			String v_ispointuse = request.getParameter("ispointuse");
			if (v_ispointuse == null) 	v_ispointuse = "N";

			BillData.put("ispointuse"		,	v_ispointuse); //����Ʈ ��뿩��


			String v_point = request.getParameter("point");
			if (v_point == null) v_point = "0";
			BillData.put("point" 			,v_point 		); //��� ����Ʈ
			BillData.put("buyername" 		,buyername 		);
			BillData.put("buyertel" 		,buyertel 		);
			BillData.put("buyeremail" 		,buyeremail 	);
			BillData.put("resulterrCode"	,resulterrCode  );

			System.out.println("v_gubun 1= " + v_gubun);

	 		BillData.put("gubun"           ,v_gubun);
	 		System.out.println("v_gubun 2= " + v_gubun);
			BillData.put("userid"           ,box.getSession("userid")      );
			BillData.put("usernm"           ,box.getSession("name")      );


			BillData.put("inputname"        ,"");
			BillData.put("inputdate"        ,"");

			BillData.put("receive"          ,v_receive     );
			BillData.put("phone"           	,v_phone     );
			BillData.put("post1"           	,v_post1     );
			BillData.put("post2"           	,v_post2     );
			BillData.put("addr1"           	,v_addr1     );
			BillData.put("addr2"           	,v_addr2     );
			BillData.put("tem_grcode"           	,box.getSession("tem_grcode")     );

			System.out.println("v_tid 				= " + tid 				);
			System.out.println("v_resultCode 	    = " + resultCode 	    );
			System.out.println("v_resultMsg 		= " + resultMsg 		);
			System.out.println("v_payMethod 		= " + payMethod 		);
			System.out.println("v_price1 			= " + price1 			);
			System.out.println("v_price2 			= " + price2 			);
			System.out.println("v_authCode 		    = " + authCode 		    );
			System.out.println("v_cardQuota 		= " + cardQuota 		);
			System.out.println("v_quotaInterest 	= " + quotaInterest 	);
			System.out.println("v_cardCode 		    = " + cardCode 		    );
			System.out.println("v_cardIssuerCode 	= " + cardIssuerCode 	);
			System.out.println("v_authCertain 	    = " + authCertain 	    );
			System.out.println("v_pgAuthDate 		= " + pgAuthDate 		);
			System.out.println("v_pgAuthTime 		= " + pgAuthTime 		);
			System.out.println("v_ocbSaveAuthCode   = " + ocbSaveAuthCode   );
			System.out.println("v_ocbUseAuthCode 	= " + ocbUseAuthCode 	);
			System.out.println("v_ocbAuthDate 	    = " + ocbAuthDate 	    );
			System.out.println("v_eventFlag		    = " + eventFlag		    );
			System.out.println("v_nohpp 			= " + nohpp 			);
			System.out.println("v_noars 			= " + noars 			);
			System.out.println("v_perno 			= " + perno 			);
			System.out.println("v_vacct 			= " + vacct 			);
			System.out.println("v_vcdbank 		    = " + vcdbank 		    );
			System.out.println("v_dtinput 		    = " + dtinput 		    );
			System.out.println("v_nminput 		    = " + nminput 		    );
			System.out.println("v_nmvacct 		    = " + nmvacct 		    );
			System.out.println("v_moid 			    = " + moid 			    );
			System.out.println("v_codegw 			= " + codegw 			);
			System.out.println("v_ocbcardnumber 	= " + ocbcardnumber 	);
			System.out.println("v_cultureid 		= " + cultureid 		);
			System.out.println("v_cardNumber 		= " + cardNumber 		);
			System.out.println("v_mid 			    = " + mid 			    );
			System.out.println("v_goodname 		    = " + goodname 		    );
			System.out.println("v_price	            = " + price	            );
			System.out.println("v_ispointuse		= " + v_ispointuse		);
			System.out.println("v_point 		    = " + v_point 		    );
			System.out.println("v_buyername 	    = " + buyername 	    );
			System.out.println("v_buyertel 	        = " + buyertel 	        );
			System.out.println("v_buyeremail 	    = " + buyeremail 	    );
			System.out.println("v_resulterrCode     = " + resulterrCode     );
			System.out.println("v_gubun             = " + v_gubun            );
			System.out.println("v_userid            = " + box.getSession("userid")            );
			System.out.println("v_usernm            = " + box.getSession("name")            );
			System.out.println("v_billprice         = " + request.getParameter("p_billprice")         );
			System.out.println("tem_grcode         = " + box.getSession("tem_grcode")         );

			int isOk = 0;

			AccountManagerBean bean = new AccountManagerBean();

			if (resultCode.equals("00")) {
				//��ٱ��� ����
				if(v_gubun.equals("P")) {	//��Ű������
					isOk = bean.InsertBasketPackage(box);
				} else {	//�Ϲݰ���
					isOk = bean.InsertBasketSubj(box);
				}
				//������� ����
				if(isOk > 0) {
		 			isOk = bean.BillProcess(BillData);
		 		}
			}

		 	System.out.println("�������"+isOk);

	 		if (isOk==1) {//����

	 		} else {//����
	 			inipay.setType("cancel"); // ����
				inipay.setCancelMsg("DB FAIL"); // ��һ���
				inipay.startAction();

				resultCode = "01";
				resultMsg = "DB FAIL";
	 		}
	 	}


	 }
	 catch(Exception e)
	 {
	 	System.out.println("Exception FOUND");
	 	System.out.println("err="+e);
		inipay.setType("cancel"); // ����
		inipay.setCancelMsg("DB FAIL"); // ��һ���
		inipay.startAction();

		resultCode = "01";
		resultMsg = "SYSTEM FAIL";
	}
%>
<!-------------------------------------------------------------------------------------------------------
 *  													*
 *       												*
 *        												*
 *	�Ʒ� ������ ���� ����� ���� ��� ������ �����Դϴ�. 				                *
 *	���� ���� ���ܺ� ��������� ������ ��µǵ��� �Ǿ� �����Ƿ� �ҽ� �ľ��� ����� ���             *
 *      ������ ��� ������ ���� �ִ� �����ڿ� ���������� (INIsecurepay_dev.jsp)�� ���� �Ͻñ� �ٶ��ϴ�.	*
 *													*
 *													*
 *													*
 -------------------------------------------------------------------------------------------------------->

<html>
<head>
<title>INIpay41 ����������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="css/group.css" type="text/css">
<style>
body, tr, td {font-size:10pt; font-family:����,verdana; color:#433F37; line-height:19px;}
table, img {border:none}

/* Padding ******/
.pl_01 {padding:1 10 0 10; line-height:19px;}
.pl_03 {font-size:20pt; font-family:����,verdana; color:#FFFFFF; line-height:29px;}

/* Link ******/
.a:link  {font-size:9pt; color:#333333; text-decoration:none}
.a:visited { font-size:9pt; color:#333333; text-decoration:none}
.a:hover  {font-size:9pt; color:#0174CD; text-decoration:underline}

.txt_03a:link  {font-size: 8pt;line-height:18px;color:#333333; text-decoration:none}
.txt_03a:visited {font-size: 8pt;line-height:18px;color:#333333; text-decoration:none}
.txt_03a:hover  {font-size: 8pt;line-height:18px;color:#EC5900; text-decoration:underline}
</style>

<script>
	var openwin=window.open("childwin.html","childwin","width=300,height=160");
	openwin.close();

	/*------------------------------------------------------------------------------------------------------*
         * 1. $inipay->m_resultCode 										*
         *       ��. �� �� �� ��: "00" �� ��� ���� ����[�������Ա��� ��� - ������ �������Ա� ��û�� �Ϸ�]	*
         *       ��. �� �� �� ��: "00"���� ���� ��� ���� ����  						*
         *------------------------------------------------------------------------------------------------------*/

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

window.resizeTo(619,600);

</script>


<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>

<script language="javascript">
<!--
<% //if (v_process.equals("update")) { %>
	//opener.location.reload();
	opener.location="/servlet/controller.study.KMyClassServlet?p_process=ProposeCancelPage";
<% //} %>

function myclass() {
	opener.location="/servlet/controller.study.KMyClassServlet?p_process=EducationSubjectPage";
	window.close();
}

function mybilllist() {
	opener.location="/servlet/controller.study.KMyClassServlet?p_process=ProposeCancelPage";
	window.close();
}
-->
</script>
</head>


<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="590" border="0" cellspacing="0" cellpadding="0" bgcolor="f3f3eb">
  <tr>
    <td align="center" ><img src="/images/user/game/account/ti_ok.gif" width="532" height="35"><br>
 <br>
      <table width="508" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="35" bgcolor="ddd9cd"> <!-------------------------------------------------------------------------------------------------------
                 * 1. resultCode 											*
                 *       ��. �� �� �� ��: "00" �� ��� ���� ����[�������Ա��� ��� - ������ �������Ա� ��û�� �Ϸ�]	*
                 *       ��. �� �� �� ��: "00"���� ���� ��� ���� ����  						*
                 -------------------------------------------------------------------------------------------------------->
                  <b><% if(resultCode.equals("00") && payMethod.equals("VBank")){ out.println("������ �������Ա� ��û�� �Ϸ�Ǿ����ϴ�.");}
                  	   else if(resultCode.equals("00")){ out.println("������ ������û�� �����Ǿ����ϴ�.");}
                           else{ out.println("������ ������û�� ���еǾ����ϴ�.");} %> </b></td>
        </tr>
    </table>
      <br>      <table width="508" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td> <img src="/images/user/game/account/ti_set_01.gif" width="192" height="31"></td>
        </tr>
      </table>
      <table width="508" height="1" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td bgcolor="c1bba5"></td>
        </tr>
      </table>
      <table width="508" border="0" cellpadding="0" cellspacing="1" bgcolor="c1bba5">
        <tr>
        <!-------------------------------------------------------------------------------------------------------
                 * 2. m_payMethod 										*
                 *       ��. ���� ����� ���� ��									*
                 *       	��. �ſ�ī�� 	- 	Card								*
                 *		��. ISP		-	VCard								*
                 *		��. �������	-	DirectBank							*
                 *		��. �������Ա�	-	VBank								*
                 *		��. �ڵ���	- 	HPP								*
                 *		��. ��ȭ���� (ars��ȭ ����)	-	Ars1588Bill					*
                 *		��. ��ȭ���� (�޴���ȭ����)	-	PhoneBill					*
                 *		��. OK CASH BAG POINT		-	OCBPoint					*
                 *		��. ��ȭ��ǰ��	-	Culture								*
                 -------------------------------------------------------------------------------------------------------->

<td width="118" height="25" align="center" bgcolor="ddd9cd">������� </td>
          <td height="25" bgcolor="#FFFFFF"><img src="/img/spacer.gif" width="15" height="8">
            <%if (payMethod.equals("Card")) out.print("�ſ�ī��");
              else if (payMethod.equals("VCard")) out.print("�ſ�ī��");
              else if (payMethod.equals("DirectBank")) out.print("������ü");
              else if (payMethod.equals("VBank")) out.print("������(�������)");
            %></td>
        </tr>
        <tr>
          <td width="118" height="25" align="center"  bgcolor="ddd9cd">��&nbsp;&nbsp;&nbsp;&nbsp;�� </td>
          <td height="25" bgcolor="#FFFFFF">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="25" bgcolor="#FFFFFF"><img src="/img/spacer.gif" width="15" height="8">
                            <% if(resultCode.equals("00")){
                            		out.print("����");
                               } else {
                               		out.print("����");
                               }
                            %>
                            </td>
                            <td width="142" align="right">

                <!-------------------------------------------------------------------------------------------------------
                 * 2. $inipay->m_resultCode ���� ���� "������ ����" �Ǵ� "���� ���� �ڼ��� ����" ��ư ���		*
                 *       ��. ���� �ڵ��� ���� "00"�� ��쿡�� "������ ����" ��ư ���					*
                 *       ��. ���� �ڵ��� ���� "00" ���� ���� ��쿡�� "���� ���� �ڼ��� ����" ��ư ���			*
                 -------------------------------------------------------------------------------------------------------->
		<!-- ���а�� �� ���� ��ư ��� -->
                            	<%
                            		if(resultCode.equals("00")){
                				out.println("<a href='javascript:show_receipt();'><img src='/images/user/game/account/button_02.gif' width='85' height='24' border='0'></a>");
                			}
                			else{
                            			out.println("<a href='javascript:errhelp();'><img src='/images/user/game/account/button_02.gif' width='85' height='24' border='0'></a>");
                            		}

                            	%>                    </td>
                          </tr>
                        </table>
                        </td>
        </tr>
        		<!-------------------------------------------------------------------------------------------------------
                 * 1. resultMsg 											*
                 *       ��. ��� ������ ���� �ش� ���нÿ��� "[�����ڵ�] ���� �޼���" ���·� ���� �ش�.                *
                 *		��> [9121]����Ȯ�ο���									*
                 -------------------------------------------------------------------------------------------------------->
        <tr>
          <td width="118" height="25" align="center"  bgcolor="ddd9cd">�������</td>
          <td height="25" bgcolor="#FFFFFF">            <img src="/img/spacer.gif" width="24" height="8"><%=resultMsg%></td>
        </tr>
        		<!-------------------------------------------------------------------------------------------------------
                 * 1. $inipay->m_tid											*
                 *       ��. �̴Ͻý��� �ο��� �ŷ� ��ȣ -��� �ŷ��� ������ �� �ִ� Ű�� �Ǵ� ��			*
                 -------------------------------------------------------------------------------------------------------->

        <tr>
          <td width="118" height="25" align="center" background="/img/td_bg.gif" bgcolor="ddd9cd">�ŷ���ȣ</td>
          <td height="25" bgcolor="#FFFFFF"><img src="/img/spacer.gif" width="24" height="8"><%=tid%></td>
        </tr>
        		<!-------------------------------------------------------------------------------------------------------
                 * 1. $inipay->m_moid											*
                 *       ��. �������� �Ҵ��� �ֹ���ȣ 									*
                 -------------------------------------------------------------------------------------------------------->
        <!--tr>
          <td width="118" height="25" align="center" background="/img/td_bg.gif" bgcolor="ddd9cd">�ֹ���ȣ</td>
          <td height="25" bgcolor="#FFFFFF"><img src="/img/spacer.gif" width="24" height="8"><%=moid%></td>
        </tr-->




        <%


	/*-------------------------------------------------------------------------------------------------------
	 *													*
	 *  �Ʒ� �κ��� ���� ���ܺ� ��� �޼��� ��� �κ��Դϴ�.    						*
	 *													*
	 *  1.  �ſ�ī�� , ISP ���� ��� ��� (OK CASH BAG POINT ���� ���� ���� )				*
	 -------------------------------------------------------------------------------------------------------*/

	if(payMethod.equals("Card") || payMethod.equals("VCard")){
%>

		  	<tr>
            	<td width="118" height="25" align="center" background="/img/td_bg.gif" bgcolor="ddd9cd">�ſ�ī���ȣ</td>
                <td height="25" bgcolor="#FFFFFF"><img src="/img/spacer.gif" width="24" height="8"><%=cardNumber%>****</td>
   			</tr>
			<tr>
            	<td width="118" height="25" align="center" background="/img/td_bg.gif" bgcolor="ddd9cd">�� �� �� ¥</td>
                <td height="25" bgcolor="#FFFFFF"><img src="/img/spacer.gif" width="24" height="8"><%=pgAuthDate%></td>
        	</tr>
            <tr>
                <td width="118" height="25" align="center" background="/img/td_bg.gif" bgcolor="ddd9cd">�� �� �� ��</td>
            	<td height="25" bgcolor="#FFFFFF"><img src="/img/spacer.gif" width="24" height="8"><%=pgAuthTime%></td>
            </tr>
            <tr>
            	<td width="118" height="25" align="center" background="/img/td_bg.gif" bgcolor="ddd9cd">�� �� �� ȣ</td>
                <td height="25" bgcolor="#FFFFFF"><img src="/img/spacer.gif" width="24" height="8"><%=authCode%></td>
            </tr>

<%
          }
        /*-------------------------------------------------------------------------------------------------------
	 *													*
	 *  �Ʒ� �κ��� ���� ���ܺ� ��� �޼��� ��� �κ��Դϴ�.    						*
	 *													*
	 *  2.  ������°��� ��� ��� 										*
	 -------------------------------------------------------------------------------------------------------*/
          else if(payMethod.equals("DirectBank")){
%>

          			<tr>
                                  <td width="118" height="25" align="center" background="/img/td_bg.gif" bgcolor="ddd9cd">�� �� �� ¥</td>
                                   <td height="25" bgcolor="#FFFFFF"><img src="/img/spacer.gif" width="24" height="8"><%=pgAuthDate%></td>
                                </tr>
                                <td width="118" height="25" align="center" background="/img/td_bg.gif" bgcolor="ddd9cd">�� �� �� ��</td>
                                   <td height="25" bgcolor="#FFFFFF"><img src="/img/spacer.gif" width="24" height="8"><%=pgAuthTime%></td>
                                </tr>
<%
          }
        /*-------------------------------------------------------------------------------------------------------
	 *													*
	 *  �Ʒ� �κ��� ���� ���ܺ� ��� �޼��� ��� �κ��Դϴ�.    						*
	 *													*
	 *  3.  ������� ��� 										*
	 -------------------------------------------------------------------------------------------------------*/
          else if(payMethod.equals("VBank")){
%>
          			<tr>
                        <td width="118" height="25" align="center" background="/img/td_bg.gif" bgcolor="ddd9cd">�Աݰ��¹�ȣ</td>
                        <td height="25" bgcolor="#FFFFFF"><img src="/img/spacer.gif" width="24" height="8"><%=vacct%></td>
                    </tr>
          			<tr>
                        <td width="118" height="25" align="center" background="/img/td_bg.gif" bgcolor="ddd9cd">�Ա�����</td>
                        <td height="25" bgcolor="#FFFFFF"><img src="/img/spacer.gif" width="24" height="8">
                        <%
                          if(vcdbank.equals("03")) {
                          	out.print("�������");
                          } else if(vcdbank.equals("04")) {
                          	out.print("��������");
                          } else if(vcdbank.equals("05")) {
                          	out.print("��ȯ����");
                          } else if(vcdbank.equals("07")) {
                          	out.print("�����߾�ȸ");
                          } else if(vcdbank.equals("11")) {
                          	out.print("�����߾�ȸ");
                          } else if(vcdbank.equals("20")) {
                          	out.print("�츮����");
                          } else if(vcdbank.equals("23")) {
                          	out.print("SC��������");
                          } else if(vcdbank.equals("31")) {
                          	out.print("�뱸����");
                          } else if(vcdbank.equals("32")) {
                          	out.print("�λ�����");
                          } else if(vcdbank.equals("34")) {
                          	out.print("��������");
                          } else if(vcdbank.equals("37")) {
                          	out.print("��������");
                          } else if(vcdbank.equals("39")) {
                          	out.print("�泲����");
                          } else if(vcdbank.equals("53")) {
                          	out.print("�ѱ���Ƽ����");
                          } else if(vcdbank.equals("71")) {
                          	out.print("��ü��");
                          } else if(vcdbank.equals("81")) {
                          	out.print("�ϳ�����");
                          } else if(vcdbank.equals("88")) {
                          	out.print("���� �������� (����,��������)");
                          }
                        %>
                        </td>
                    </tr>
                    <tr>
                        <td width="118" height="25" align="center" background="/img/td_bg.gif" bgcolor="ddd9cd">������ ��</td>
                        <td height="25" bgcolor="#FFFFFF"><img src="/img/spacer.gif" width="24" height="8"><%=nmvacct%></td>
                    </tr>
                    <tr>
                        <td width="118" height="25" align="center" background="/img/td_bg.gif" bgcolor="ddd9cd">�۱��� ��</td>
                        <td height="25" bgcolor="#FFFFFF"><img src="/img/spacer.gif" width="24" height="8"><%=nminput%></td>
                    </tr>
<%
          }
%>

      </table>
      <table width="508" height="1" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td bgcolor="c1bba5"></td>
        </tr>
      </table>

            <br>

      <!-- �̿�ȳ� -->
      <!-------------------------------------------------------------------------------------------------------
 *													*
 *  ���� ������($inipay->m_resultCode == "00"�� ��� ) "�̿�ȳ�"  �����ֱ� �κ��Դϴ�.			*
 *  ���� ���ܺ��� �̿������ ���� ���ܿ� ���� ���� ������ ���� �ݴϴ�. 				*
 *  switch , case�� ���·� ���� ���ܺ��� ��� �ϰ� �ֽ��ϴ�.						*
 *  �Ʒ� ������ ��� �մϴ�.										*
 *													*
 *  1.	�ſ�ī�� 											*
 *  2.  ISP ���� 											*
 *  3.  �ڵ��� 												*
 *  4.  ��ȭ ���� (1588Bill)										*
 *  5.  ��ȭ ���� (PhoneBill)										*
 *  6.	OK CASH BAG POINT										*
 *  7.  ���������ü											*
 *  8.  ������ �Ա� ����										*
 *  9.  ��ȭ��ǰ�� ����											*
 ------------------------------------------------------------------------------------------------------->

<%

            	if(resultCode.equals("00")){

            		        /*--------------------------------------------------------------------------------------------------------
	 			*													*
	 			* ���� ������ �̿�ȳ� �����ֱ� 			    						*
				*													*
	 			*  1.  �ſ�ī�� 						                			*
	 			--------------------------------------------------------------------------------------------------------*/

				if(payMethod.equals("Card")){

%>

   <table width="508" height="30" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td> <img src="/images/user/game/account/ti_set_05.gif" width="192" height="31"></td>
        </tr>
      </table>

	<table width="508" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><table width="508" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="10">&nbsp; </td>
              <td>(1) �ſ�ī�� û������ <b>"�̴Ͻý�(inicis.com)"</b>���� ǥ��˴ϴ�.<br>
			   (2) LGī�� �� BCī���� ��� <b>"�̴Ͻý�(�̿� ������)"</b>���� ǥ��ǰ�, �Ｚī���� ��� <b>"�̴Ͻý�(�̿���� URL)"</b>�� ǥ��˴ϴ�.</td>
            </tr>
          </table>
          </td>
        </tr>
      </table>



<%
				}

			       /*--------------------------------------------------------------------------------------------------------
	 			*													*
	 			* ���� ������ �̿�ȳ� �����ֱ� 			    						*
				*													*
	 			*  2.  ISP 						                				*
	 			--------------------------------------------------------------------------------------------------------*/

				else if(payMethod.equals("VCard")){
%>

       <table width="508" height="30" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td> <img src="/images/user/game/account/ti_set_05.gif" width="192" height="31"></td>
        </tr>
      </table>

	<table width="508" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><table width="508" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="10">&nbsp; </td>
              <td>(1) �ſ�ī�� û������ <b>"�̴Ͻý�(inicis.com)"</b>���� ǥ��˴ϴ�.<br>
			   (2) LGī�� �� BCī���� ��� <b>"�̴Ͻý�(�̿� ������)"</b>���� ǥ��ǰ�, �Ｚī���� ��� <b>"�̴Ͻý�(�̿���� URL)"</b>�� ǥ��˴ϴ�.</td>
            </tr>
          </table>
          </td>
        </tr>
      </table>


<%
				}

			       /*--------------------------------------------------------------------------------------------------------
	 			*													*
	 			* ���� ������ �̿�ȳ� �����ֱ� 			    						*
				*													*
	 			*  7. ���������ü					                				*
	 			--------------------------------------------------------------------------------------------------------*/

				else if(payMethod.equals("DirectBank")){

%>

 <table width="508" height="30" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td> <img src="/images/user/game/account/ti_set_05.gif" width="192" height="31"></td>
        </tr>
      </table>

	<table width="508" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><table width="508" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="10">&nbsp; </td>
              <td>(1) ������ ���忡�� <b>"�̴Ͻý�"</b>�� ǥ��˴ϴ�.</td>
            </tr>
          </table>
          </td>
        </tr>
      </table>


<%
				}

		}

%>


      <!-- �̿�ȳ� �� -->

      <br>

      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td></td>
      </tr>
    </table>
      <table width="100%" height="62" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" ><table width="250" border="0" cellspacing="0" cellpadding="0">
            <tr align="center">
            <% if (resultCode.equals("00")) { %>
              <!--td width="176"><a href="javascript:myclass();"><img src="/images/user/game/account/b_my.gif" width="89" height="21"></a></td>
              <td width="10"></td-->
              <td width="176"><a href="javascript:mybilllist();"><img src="/images/user/game/account/b_list.gif" width="89" height="21"></a></td>
              <td width="10"></td>
            <% } %>
              <td width="60"><a href="javascript:window.close();"><img src="/images/user/game/account/btn_cl.gif" width="45" height="21"></a></td>
              </tr>
          </table></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<form name="fbill" method="post" action="/inicis/INIsecurepayform.jsp">
	<input type="hidden" name="p_gubun" value="<%=v_gubun%>">
</form>
</body>
</html>
