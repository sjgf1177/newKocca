<%------------------------------------------------------------------------------
 FILE NAME : INIcancel.jsp
 AUTHOR : jwkim@inicis.com
 DATE : 2004/06
 USE WITH : INIcancel.html
 
 ���� ��� ��û�� ó���Ѵ�.
                                                          http://www.inicis.com
                                                      http://support.inicis.com
                                 Copyright 2002 Inicis, Co. All rights reserved.
------------------------------------------------------------------------------%>

<%@ page
	language = "java"
	contentType = "text/html; charset=euc-kr"
	import = "com.inicis.inipay.*"
%>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.account.*" %>
<%	

    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

	/**************************************
	 * 1. INIpay41 Ŭ������ �ν��Ͻ� ���� *
	 **************************************/
	INIpay41 inipay = new INIpay41();
	
	String tid = request.getParameter("tid");
	String mid = request.getParameter("mid");
	String msg = request.getParameter("msg");
	
	/*********************
	 * 2. ��� ���� ���� *
	 *********************/
	inipay.setType("cancel"); // ����
	inipay.setInipayHome("C:/INIpay41_JAVA"); // INIpay Home (�����η� ������ ����)
	inipay.setSubPgIp("203.238.3.10"); // ����
	inipay.setKeyPw("1111"); // Ű�н�����(�������̵� ���� ����)
	inipay.setDebug("true"); // �α׸��("true"�� �����ϸ� �ڼ��� �αװ� ������)
	inipay.setMid(mid); // �������̵�
	inipay.setTid(tid); // ����� �ŷ��� �ŷ����̵�
	inipay.setCancelMsg(msg); // ��һ���
	inipay.setUip(request.getRemoteAddr()); // ����
	inipay.setMerchantReserved("merchantreserved"); // ����

	/*
	 * �̴Ͻý� ��ȸ ������(https://iniweb.inicis.com)���� ���̴�
	 * �ѱ��� ������ ��� �Ʒ� 3�� �� �ϳ��� ���(�ּ�����)�Ͽ�
	 * �ѱ��� ����� ���̴� ���� ����Ͻʽÿ�.
	 */
	//inipay.setEncoding(1);
	//inipay.setEncoding(2);
	//inipay.setEncoding(3);
	
	
	/****************
	 * 3. ��� ��û *
	 ****************/
	inipay.startAction();
	
	
	/****************
	 * 4. ��� ��� *
	 ****************/
	 String resultCode = inipay.getResultCode(); // "00"�̸� ��� ����
	 String resultMsg = inipay.getResultMsg(); // ��Ұ���� ���� ����
	 String pgCancelDate = inipay.getPgCancelDate(); // ��ҳ�¥ (YYYYMMDD)
	 String pgCancelTime = inipay.getPgCancelTime(); // ��ҽð� (HHMMSS)
	 String Rcash_cancel_noappl = ""; //inipay.getRcashCancelNoappl(); //���ݿ����� ��� ���ι�ȣ
	 
	 
	 /****************
	 * 5. DB ���� *
	 ****************/
	 try
	 {
	 	// DB CODE HERE
	 		//HashTable ����
			Hashtable BillData = new Hashtable();
			System.out.println("Hash St");
		
			System.out.println("tid = " + tid);
		
			BillData.clear();
			System.out.println("1");
			BillData.put("tid" 				,tid 			);
			BillData.put("mid" 				,mid 			);
			BillData.put("resultmsg" 		,resultMsg 		);
			BillData.put("resultcode" 		,resultCode 	);
			BillData.put("pgcanceldate" 	,pgCancelDate 	);
			BillData.put("pgcanceltime" 	,pgCancelTime 	);
			BillData.put("rcash_cancel_noappl",Rcash_cancel_noappl);
			BillData.put("userid"           ,box.getSession("userid"));
			
			System.out.println("Hash Ed");
			
			//������� ����
			System.out.println("#1");
			AccountManagerBean bean =  new AccountManagerBean();
	 		int isOk = bean.bill_cancel(BillData);
	 		System.out.println("�������"+isOk);
	 		
	 		if (isOk==1) {//����
	 		
	 		}

	 	
	 }
	 catch(Exception e)
	 {
	 	System.out.println("err="+e);
	 }
%>

<html>
<head>

<title>INIpay</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<style type="text/css">
	BODY{font-size:9pt; line-height:160%}
	TD{font-size:9pt; line-height:160%}
	INPUT{font-size:9pt;}
	.emp{background-color:#E0EFFE;}
</style>

<script language="Javascript">
<!--
function parent_reload() {
	opener.window.whenSelection('go');
	window.close();
}
-->
</script>
</head>

<body>

<table border=0 width=500>
<tr>
<td>
<hr noshade size=1>
<b>���� ��� ���</b>
<hr noshade size=1>
</td>
</tr>
</table>
<br>
<table border=0 width=500>
	<tr>
		<td align=right nowrap>��&nbsp;&nbsp;&nbsp;&nbsp;�� : </td>
		<td><%if (resultCode.equals("00")) {
				out.print("��� ����");
			  } else {
			  	out.print("��� ����");
			  }
			%>
		</td>
	</tr>
	<tr>
		<td align=right nowrap>������� : </td>
		<td><font class=emp><%=resultMsg%></font></td>
	</tr>
	<tr>
		<td align=right nowrap>��ҳ�¥ : </td>
		<td><%=pgCancelDate%></td>
	</tr>
	<tr>
		<td align=right nowrap>��ҽð� : </td>
		<td><%=pgCancelTime%></td>
	</tr>
	<!--tr>
		<td align=right nowrap>���ݿ����� ��ҽ� ��ҽ��ι�ȣ : </td>
		<td><%=Rcash_cancel_noappl%></td>
	</tr-->
	<tr>
		<td colspan=2><br><hr noshade size=1></td>
	</tr>
	
	<tr>
		<td align=center colspan=2>
		<% if (resultCode.equals("00")) { %>
			<a href="javascript:parent_reload();">�ݱ�</a>
		<% } else { %>
			<a href="javascript:window.close();">�ݱ�</a>
		<% } %>
		</td>
	</tr>
</table>
</body>
</html>
