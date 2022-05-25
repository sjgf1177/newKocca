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
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    Kisinfo.Check.CPClient kisCrypt = new  Kisinfo.Check.CPClient();

    String sEncodeData = request.getParameter("EncodeData");
    String sPlainData = "";
    String sSiteCode = "G1091";				// �ѽ��������κ��� �ο����� ����Ʈ �ڵ�
    String sSitePassword = "OGUNHRYMMD3M";		// �ѽ��������κ��� �ο����� ����Ʈ �н�����
    String sCipherTime = "";						// ��ȣȭ�� �ð�
    String sRequestNumber = "";						// ��û ��ȣ
    String sResponseNumber = "";					// ���� ������ȣ
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
        sResponseNumber = (String)mapresult.get("RES_SEQ");
        sAuthType = (String)mapresult.get("AUTH_TYPE");
        
        String session_sRequestNumber = (String)box.getSession("REQ_SEQ");
        if(!sRequestNumber.equals(session_sRequestNumber))
        {
            sMessage = "���ǰ��� �ٸ��ϴ�. �ùٸ� ��η� �����Ͻñ� �ٶ��ϴ�.";
            sResponseNumber = "";
            sAuthType = "";
        }
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

    //��й�ȣ �����(������Ʈ)
    LoginBean bean = new LoginBean();
    box.put("p_userid_2", box.getSession("sUserid"));
    box.put("p_resno1_2", box.getSession("sJuminid1"));
    box.put("p_resno2_2", box.getSession("sJuminid2"));
    box.put("p_name_2", box.getSession("sName"));
    String v_tmp_pwd = bean.selectTempPassword1(box);
%>

<html>
<head>
    <title>�н����� ��߱� - ���� ����</title>
<link type="text/css" href="/css/2013/common.css" rel="stylesheet" />
<link type="text/css" href="/css/2013/sub.css" rel="stylesheet" />
<link type="text/css" href="/css/2013/popup.css" rel="stylesheet" />

<SCRIPT LANGUAGE="JavaScript">
<!--
    // ���
    function insert() {
        var fm=document.form1;
        var v_handphone = fm.p_handphone1.value+'-'+fm.p_handphone2.value+'-'+fm.p_handphone3.value;

        if( (fm.p_handphone1.value) == "" ){
            alert("�ڵ��� ��ȣ�� �Է��ϼ���");
            fm.p_handphone1.focus(); return;
        }else if( (fm.p_handphone2.value) == "" || fm.p_handphone2.length > 4 ){
            alert("�ڵ��� ��ȣ�� �ٸ��� �Է��ϼ���");
            fm.p_handphone2.focus(); return;
        }else if( (fm.p_handphone3.value) == "" || fm.p_handphone3.length > 4 ){
            alert("�ڵ��� ��ȣ�� �ٸ��� �Է��ϼ���");
            fm.p_handphone3.focus(); return;
        }

        fm.p_checks.value = "1";        
        fm.p_title.value = "[KOCCA] �ӽ� ��й�ȣ�� <%=v_tmp_pwd %> �Դϴ�. �α��� �� �ű� ��й�ȣ�� �������ּ���.";
        fm.p_handphone.value = fm.p_handphone1.value+'-'+fm.p_handphone2.value+'-'+fm.p_handphone3.value;
        
        document.form1.action = "/servlet/controller.library.SMSServlet";
        document.form1.p_process.value = "certicheck";
        document.form1.submit();
    }
//-->
</SCRIPT>
</head>
<body onload="javascript:window.resizeTo(459,500);">

     <%--�ʿ信 ���� ����� ��
    <table width=480 border=1>
        <tr>
            <td>��ȣȭ�� �ð�</td>
            <td><%= sCipherTime %> (YYMMDDHHMMSSSSS)</td>
        </tr>
        <tr>
            <td>��û ��ȣ</td>
            <td><%= sRequestNumber %></td>
        </tr>            
        <tr>
            <td>�ѽ������� ��ȣ</td>
            <td><%= sResponseNumber %></td>
        </tr>            
        <tr>
            <td>��������</td>
            <td><%= sAuthType %></td>
        </tr>
    </table><br><br>  
   --%>
    <!-- <%= sMessage %> -->

<form name = "form1" method = "post">
  <input type='hidden' name = 'p_process' value=''>
  <input type='hidden' name ="p_checks" value=""/>
  <input type="hidden"	name="p_handphone" value="" />
  <input type="hidden"	name="p_title" value="" />
  <!-- tz_humantouc insert parameter start-->
  
  
<div id="popup" style="width:443px; height:450px;">
	<h2><img src="/images/2013/support/password_sms_title.gif" alt="�н����� SMS �߼� ����" /></h2>
	<div class="title">
			<span>�޴��� �н����� �߱� Ȯ��</span>
		</div>
	<!-- pcont -->
	<div class="pcont">
		<span class="pcont_topl"></span><span class="pcont_topr"></span>
		<!-- inner -->
		<div class="inner">
			<p class="txt1">������ ���������� �׻� ��ȣȭ�Ǿ� ó���ǰ�, �����������θ� ������ �������� �ʽ��ϴ�.</p>
			<p class="txt2">
				<strong>�������� �Ϸ�</strong> �Ǿ����ϴ�.<br />�Է��Ͻ� �޴��� ������ �ӽ� ��й�ȣ�� �߼��� �帳�ϴ�.
			</p>
			<div class="mbBox">
				�޴�����ȣ
				<select name="p_handphone1" id="p_handphone1">
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="016">016</option>
                    <option value="017">017</option>
                    <option value="018">018</option>
                    <option value="019">019</option>
                </select>-
				<input type="text" name="p_handphone2" id="p_handphone2" maxlength="4" class="inputText" size="4" title="�޴�����ȣ �߰��ڸ� �Է�" style="width:70px" /> -
				<input type="text" name="p_handphone3" id="p_handphone3" maxlength="4" class="inputText" size="4" title="�޴�����ȣ ���ڸ� �Է�" style="width:70px" />
			</div>
			<span class="tips">�� �� ���񽺴� ����� �ΰ����� �ʽ��ϴ�.</span>
			<!-- btn_area -->
			<div class="btn_area">
				<a href="javascript:insert()"><img src="/images/2013/btn/btn_send.gif" alt="����" /></a>
				<a href="#" onclick="self.close();return false;"><img src="/images/2013/btn/btn_lyclose.gif" alt="�ݱ�" /></a>
			</div>
			<!--// btn_area -->
		</div>
		<!--// inner -->
		<span class="pcont_btml"></span><span class="pcont_btmr"></span>
	</div>
	<!--// pcont -->
	<p class="btm_logo"><img src="/images/2013/common/popfoot_logo.gif" alt="kocca �ѱ���������ī����" /></p>
</div>
</form>
</body>
</html>