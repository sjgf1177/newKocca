<%
//**********************************************************
//  1. ��      ��: ȸ������_����Ȯ��
//  2. ���α׷��� : zu_MemberJoin.jsp
//  3. ��      ��: ȸ������_����Ȯ��
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��:
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page language="java" import="Kisinfo.Check.IPINClient" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%@page import="Kisinfo.Check.IPIN2Client"%>

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");

    if (box == null) box = RequestManager.getBox(request);

    // �Ǹ����� ����
    //===========================================
    HttpSession s = request.getSession(true);
    s.putValue("NmChkSec","98u9iuhuyg87");
    //===========================================
    	
//   	<!-- �����ɰ��� ���� -->

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
	
	String sReturnURL				= "http://edu.kocca.or.kr/ipin_process.jsp";
	//String sReturnURL				= "http://localhost:7001/ipin_process.jsp";
	//"http://localhost:7001/ipin_process.jsp";
	//"http://edu.kocca.or.kr/ipin_process.jsp";
	
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

//<!-- �����ǰ��� �� -->
%>

<%@ page import = "com.credu.homepage.LoginBean" %>
<%@ page import="java.net.InetAddress" %>
<%
	InetAddress inet= InetAddress.getLocalHost();
	String ipSplit = inet.getHostAddress();
	String [] ipnum=ipSplit.replace(".","/").split("/");

	String topmenu = box.getString("topmenu");
	if ((topmenu == null) || (topmenu.equals("")) ) topmenu = "1";
	String submenu1 = box.getString("submenu");
	
	String notSelected = "ratemenu";
	String selected = "ratemenuon";
	int zindex = 0;
	
	String topWarp_userid = box.getSession("userid");
  	String topWarp_usernm = box.getSession("name");
  	String topWarp_gadmin = box.getSession("gadmin");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta name="description" content="�ѱ���������ī����" />
<meta name="keywords" content="kocca, �ѱ���������ī����" />
<title>kocca �ѱ���������ī����(<%=ipnum[3]%>)</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>

<script type="text/javascript" src="/js/2013/caption.js"></script>
<script type="text/javascript" src="/js/2013/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="/js/2013/jquery.selectbox-0.6.1.js"></script>
<script type="text/javascript" src="/js/2013/jquery.cycle2.min.js"></script>
<script type="text/javascript" src="/js/2013/common.js"></script>
<script type="text/javascript" src="/js/2013/lib.js"></script>

<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="text/javascript" language="JavaScript" src="/script/mainscript.js"></script>
<style type="text/css" media="screen">@import "/css/2013/common.css";</style>
<style type="text/css" media="screen">@import "/css/2013/layout.css";</style>
<style type="text/css" media="screen">@import "/css/2013/sub.css";</style>
<script>
/* �н����� ����Ű üũ */
function password_enter(e) {
  if (e.keyCode =='13'){  login_main();  }
}
</script>

<!-- ��ũ��Ʈ���� -->
<script language="JavaScript" type="text/JavaScript">
window.name = "Parent_window";
// �̸��� �ֹι�ȣ ���� ���ֱ�
function TrimString(v_String){
   /*���� Ʈ�� */
   len = v_String.length;
   for(i=0;i<len;i++){
      if(v_String.substring(0,1) == " ") v_String = v_String.substring(1);
      else	  break;
   }
   /* ������ Ʈ��*/
   len = v_String.length;
   for(i=len;i>0;i--){
      if(v_String.substring(i-1) == " ") v_String = v_String.substring(0,i-1);
      else	  break;
   }
	return v_String;
}

//�ڵ��̵�
function moveFocus(num,fromform,toform)
    {
        var str = fromform.value.length;
        if(str == num)
       toform.focus();
    }

// �������� �Է�ȭ������
function memberJoinOK(){
	
	var parentName = document.form1.pname.value;
	var parentResno1 = document.form1.presno1.value;
	var parentResno2 = document.form1.presno2.value;
	var parentEmail1 = document.form1.pemail1.value;
	var parentEmail2 = document.form1.pemail2.value;
	var checkradio = document.form1.checkradio.value;
	var cName  = document.form1.pp_username.value;
	var cResno1 = document.form1.pp_resno1.value;
	var cResno2 = document.form1.pp_resno2.value;

	
		//alert("14�̸�");
		if(document.form1.pagree.checked == false){
			alert("�����븮���� ���Ǹ� ���ּ���");
			return;
		}
		if(!TrimString(parentName)){
			alert("��ȣ�� �̸��� �Է��ϼ���");
			document.form1.pname.focus();
			return;
		}
		if(!TrimString(parentResno1) || document.form1.presno1.value.length < 6){
			alert("�ֹε�Ϲ�ȣ�� �ٸ��� �Է��ϼ���");
			document.form1.presno1.value = "";
			document.form1.presno1.focus();
			return;
		}
		if(!TrimString(parentResno2) || document.form1.presno2.value.length < 7){
			alert("�ֹε�Ϲ�ȣ�� �ٸ��� �Է��ϼ���");
			document.form1.presno2.value = "";
			document.form1.presno2.focus();
			return;
		}
		if(!TrimString(parentEmail1)){
			alert("��ȣ�� �̸����� �ٸ��� �Է��ϼ���");
			document.form1.pemail1.focus();
			return;
		}
		if(!TrimString(parentEmail2)){
			alert("��ȣ�� �̸����� �ٸ��� �Է��ϼ���");
			document.form1.pemail2.focus();
			return;
		}
		if(!TrimString(cName)){
			alert("�̸��� �Է��ϼ���");
			document.form1.pemail2.focus();
			return;
		}
		if(!TrimString(cResno1)){
			alert("�ֹε�Ϲ�ȣ�� �ٸ��� �Է��ϼ���");
			document.form1.pemail2.focus();
			return;
		}
		if(!TrimString(cResno2)){
			alert("�ֹε�Ϲ�ȣ�� �ٸ��� �Է��ϼ���");
			document.form1.pemail2.focus();
			return;
		}

		if(!regcheck(cResno1+cResno2))
	    {
	        $("[name='pp_resno1']").val("");
	        $("[name='pp_resno2']").val("");
	        $("[name='pp_resno1']").focus();
	        return;
	    }
		if(!regcheck(parentResno1+parentResno2))
	    {
	        $("[name='parentResno1']").val("");
	        $("[name='parentResno2']").val("");
	        $("[name='parentResno1']").focus();
	        return;
	    }
		
		// ȸ������ Ȯ��		
	    document.form1.pname.value = parentName;
	    document.form1.presno1.value   = parentResno1;
	    document.form1.presno2.value   = parentResno2;
	    document.form1.pemail1.value   = parentEmail1;
	    document.form1.pemail2.value   = parentEmail2;
	    
	    document.form1.p_username.value = cName;
	    document.form1.p_resno1.value   = cResno1;
	    document.form1.p_resno2.value   = cResno2;
	    document.form1.action = "/certi/nc_p.jsp";                                 //�Ǹ����� üũ ������
	    document.form1.checkflag.value   = "true";
	    
	    document.form1.submit(); 
		
}


// ���ڸ� ���� �����.
function onlyNumber()
{
    if(((event.keyCode<48)||(event.keyCode>57))) {
        event.returnValue=false;
    }
}

function regcheck(num){
   var month='(0[1-9]|1[0-2])';
   var date='(0[1-9]|[1-2][0-9]|3[0-1])';
   var regMonth = new RegExp(month);
   var regDate = new RegExp(date);

   if(!regMonth.test(num.substring(2,4))) {
      alert("�������� �ֹε�Ϲ�ȣ�� �ƴմϴ�");
      return false;
   }

   if(!regDate.test(num.substring(4,6))) {
      alert("�������� �ֹε�Ϲ�ȣ�� �ƴմϴ�");
      return false;
   }

   var tab=[2,3,4,5,6,7,8,9,2,3,4,5];
   var sum=0,i=0;

   for (i=0;i<12;i++) sum+=parseInt(num.charAt(i))*tab[i];

    if (((11-(sum%11))%10!=num.charAt(12))) {
        alert("�������� �ֹε�Ϲ�ȣ�� �ƴմϴ�");
        return false;
    }

   return true;
}

	function chageImg(idx){
		
		if(parseInt(idx)==1){
			document.getElementById("image991").src = "/images/portal/homepage_renewal/member/btn_namechk_on.gif";					
			document.getElementById("image992").src = "/images/portal/homepage_renewal/member/btn_ipin_off.gif";					
			document.getElementById("tab1").style.display = "block";
			document.getElementById("tab2").style.display = "none";
			}
		else if(parseInt(idx)==2){
		document.getElementById("image991").src = "/images/portal/homepage_renewal/member/btn_namechk_off.gif";		
		document.getElementById("image992").src = "/images/portal/homepage_renewal/member/btn_ipin_on.gif";		
		document.getElementById("tab1").style.display = "none";
		document.getElementById("tab2").style.display = "block";
		}
	}

	// ������ �˾� ����	
	
	function fnPopup(){
		window.open('', 'popupIPIN2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		document.form_ipin.target = "popupIPIN2";
		document.form_ipin.action = "https://cert.vno.co.kr/ipin.cb";
		document.form_ipin.submit();
	}

	function changeJoinType(idx){
		if(parseInt(idx)==1){					
			document.getElementById("joinType1").style.display = "block";
			document.getElementById("joinType2").style.display = "none";
			document.form1.pname.value="";
			document.form1.presno1.value="";
			document.form1.presno2.value="";
			document.form1.pemail1.value="";
			document.form1.pemail2.value="";
			form1.pp_username.value="";
			form1.pp_resno1.value="";
			form1.pp_resno2.value="";
			document.form1.pagree.checked = false;
			document.form1.checkradio.value = "";
		}
		else if(parseInt(idx)==2){	
			document.getElementById("joinType1").style.display = "none";
			document.getElementById("joinType2").style.display = "block";
			document.form1.checkradio.value = "14";
		}
	}

	function emailChange() {
	    var r=$("[name='pemail3']").val();
	    $("[name='pemail2']").val(r);
	}

	// �Ǹ����� �˾� ����
	function ncPopup(){
		window.open('/certi/certnc_main.jsp','nc','width=410, height=555');
	}

	// �������˾�����
	function ipinPopup(){
		window.open('', 'popupIPIN2', 'width=450, height=550, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		document.form_ipin.target = "popupIPIN2";		
		document.form_ipin.action = "/certi/ipin_main.jsp";
		document.form_ipin.submit();
	}

	function joinyearcheck(obj){
		if (obj == "on") {
			document.getElementById("year14min").style.display = "block";
			document.getElementById("year14max").style.display = "none";
		} else {
			document.getElementById("year14min").style.display = "none";
			document.getElementById("year14max").style.display = "block";
		}
	}

</script>

<!-- ������ ��ũ��Ʈ ���� -->

<!-- ��ũ��Ʈ�������� -->

<!-- form ���� -->

<!-- ������ form ���� -->
</head>
<body style="background-image:url('');">
<form name="topdefaultForm" method="post" action="/" id="topdefaultForm" >
  <input type='hidden' name='p_process'   value="" />
  <input type='hidden' name='gubun'       value='0' />
  <input type='hidden' name='menuid'      value='' />
  <input type='hidden' name='url'         value='' />
  <input type='hidden' name='p_cmuno'     value='' />
  <input type='hidden' name='searchClass' value='' />
  <input type='hidden' name='p_auth'      value='' />
  <input type='hidden' name='p_topuserid' value='' />
  <input type='hidden' name='p_toppwd'    value='' />
  <input type='hidden' name='p_area'    value='' />
  <input type='hidden' name='p_lsearchtext'    value='' />
  <input type="submit" class="close" title="����" />
</form>
<!-- �����ֹι�ȣ ���� �˾��� ȣ���ϱ� ���ؼ��� ������ ���� form�� �ʿ��մϴ�. -->
<form name="form_ipin" method="post" action="/">
	<input type="hidden" name="m" value="pubmain" />						<!-- �ʼ� ����Ÿ��, �����Ͻø� �ȵ˴ϴ�. -->
    <input type="hidden" name="enc_data" value="<%= sEncData %>" />		<!-- ������ ��ü������ ��ȣȭ �� ����Ÿ�Դϴ�. -->
    
    <!-- ��ü���� ����ޱ� ���ϴ� ����Ÿ�� �����ϱ� ���� ����� �� ������, ������� ����� �ش� ���� �״�� �۽��մϴ�.
    	 �ش� �Ķ���ʹ� �߰��Ͻ� �� �����ϴ�. -->
    <input type="hidden" name="param_r1" value="" />
    <input type="hidden" name="param_r2" value="" />
    <input type="hidden" name="param_r3" value="" />
</form>

<form name="vnoform" method="post" action="">
	<input type="hidden" name="enc_data" />								<!-- �������� ����� ���� ��ȣȭ ����Ÿ�Դϴ�. -->
	
	<!-- ��ü���� ����ޱ� ���ϴ� ����Ÿ�� �����ϱ� ���� ����� �� ������, ������� ����� �ش� ���� �״�� �۽��մϴ�.
    	 �ش� �Ķ���ʹ� �߰��Ͻ� �� �����ϴ�. -->    
    <input type="hidden"	name="p_process"	value="" />
	<input type="hidden"	name="p_resno" value="" />
    <input type="hidden"	name="checkflag" value="" />
    <input type="hidden"	name="checkradio" value="" />  
</form>

<!-- ������ form �� -->

<form name="form1"  action="" method="post" action="">
	<input type="hidden"	name="p_process"	value="" />
	<input type="hidden"	name="p_resno" value="" />
    <input type="hidden"	name="checkflag" value="" />
    <input type="hidden"	name="checkradio" value="" />   
    
    <input type="hidden"	name="p_username" value="" />
    <input type="hidden"	name="p_resno1" value="" />
    <input type="hidden"	name="p_resno2" value="" />
        
    <!-- �����ɰ��� ���� -->
    <input type="hidden" name="enc_data" />
    <!-- �����ɰ��� �� -->
    <!-- �ȽɽǸ��������� ����-->
    <input type="hidden" name="enc_data" value="" />
 	<input type="hidden" name="nc_safeid" value="" />
 	<input type="hidden" name="nc_username" value="" />
 	<input type="hidden" name="nc_jumindate" value="" />
 	<input type="hidden" name="nc_gender" value="" />
 	<input type="hidden" name="nc_cert" value="" />
 	<!-- �ȽɽǸ��������� ����-->
	<div id="container">
		<!-- ������ ���� ���� -->
		<div id="contents">
		
			<h2 class="subTit"><img src="/images/2013/support/join_title.gif" alt="ȸ������" /></h2>
			
			<div id="subCont">
				<div class="stepimgBox">
					<img src="/images/2013/support/private_img2.gif" alt="����Ȯ�� �ܰ�" />
				</div>
				<div class="joinBox">
					<ul class="tab">
						<li><a href="#"><img src="/images/2013/support/tabjoin1_off.jpg" alt="�Ǹ�Ȯ��" /></a></li>
						<li><a href="#"><img src="/images/2013/support/tabjoin2_off.jpg" alt="���� i-PIN ����" /></a></li>
					</ul>
					<div class="cont">
						<p>2006�� 9�� 24�� ���� �����Ǵ� �ֹε�Ϲ��� ���� Ÿ���� �ֹι�ȣ�� 
						�¶��� ȸ�� ������ �ϴ� �� Ÿ���� �ֹε�Ϲ�ȣ�� ���� ����ϰ� �Ǹ� 
						3�� ������ ¡�� �Ǵ� 1õ���� ������ ������ �ΰ��� �� �ֽ��ϴ�.</p>
						<ul>
							<li><input type="radio" name="peopletype" id="rd1" onclick="joinyearcheck('off')" checked /> <label for="rd1">�Ϲ�ȸ��(14�� �̻�)</label></li>
							<li><input type="radio" name="peopletype" id="rd2" onclick="joinyearcheck('on')" /> <label for="rd2">�Ϲ�ȸ��(14�� ����)</label></li>
						</ul>
						<div id="year14max" class="btnArea wd2">
							<button type="button" class="btnText" onclick="javascript:ncPopup();"><span>�ȽɽǸ�Ȯ��</span></button>
						</div>
						
						<div id="year14min" style="display: none;">
							<p class="txt1">14�� �̸� ������ ���̹���������ī���� ȸ�������� ���� ��ȣ��<br />���ǰ� �ʿ��մϴ�.</p>
							<p class="txt2">�� ����Ʈ ȸ�������� ��������Ÿ� �̿������� ���� ������ �� 31����<br />
							������ ���� �� 14�� �̸��� �Ƶ��� ���������� �̿��ϴ� ��� ��ȣ�� <br />
							�Ǵ� �����븮���� ���ǰ� �־�� ȸ�������� �����մϴ�.</p>
	
							<div class="tableWrap9">
								<table class="dataTable9" summary="�� ǥ�� ��ȣ�� ����,��ȣ�� �ֹε�Ϲ�ȣ,��ȣ�� �̸���,ȸ�� ����,ȸ�� �ֹε�Ϲ�ȣ �������� ���� �Ǿ� �ֽ��ϴ�.">
									<caption>�Ϲ�ȸ�� 14�� �̻� ǥ</caption>
									<colgroup>
										<col width="36%"/>
										<col width="*"/>
									</colgroup>
									<tbody>
									<tr>
										<td colspan="2" class="first"><input type="checkbox" name="pagree" value="1" id="agreen" class="checkBox"/><label for="ck1"> �ڳడ �� ����Ʈ ȸ������ ����ϴ´� �����մϴ�.</label></td>
									</tr>
									<tr>
										<th scope="row"><label for="dName">��ȣ�� ����</label></th>
										<td><input type="text" name="pname" id="dName" class="inputText" size="18" /></td>
									</tr>
									<tr>
										<th scope="row"><label for="idnum">��ȣ�� �ֹε�Ϲ�ȣ</label></th>
										<td><input type="text" name="presno1" id="idnum" class="inputText" size="6" title="�ֹι�ȣ �� 6�ڸ� �Է�"/> - <input type="password" name="presno2"  class="inputPw" size="7" title="�ֹι�ȣ �� 7�ڸ� �Է�" /></td>
									</tr>
									<tr>
										<th scope="row"><label for="dEmail">��ȣ�� �̸���</label></th>
										<td>
											<input type="text" name="pemail1" id="dEmail" class="inputText" size="8" title="�̸��� ���̵� �Է�"/> @
											<input type="text" name="pemail2" class="inputText" size="8" title="�̸��� �ּ� �Է�"/>
<!--											 <select class="select" title="�̸����ּ� ����"><option>�����Է�</option></select>-->
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="dName1">ȸ�� ����</label></th>
										<td><input type="text" name="pp_username" id="dName1" class="inputText" size="18" /></td>
									</tr>
									<tr>
										<th scope="row"><label for="idnum2">ȸ�� �ֹε�Ϲ�ȣ</label></th>
										<td><input type="text" name="pp_resno1" id="idnum2" class="inputText" size="6" title="�ֹι�ȣ �� 6�ڸ� �Է�"/> - <input type="password" name="pp_resno2"  class="inputPw" size="7" title="�ֹι�ȣ �� 7�ڸ� �Է�" /></td>
									</tr>
									</tbody>
								</table>
							</div>
							<div class="btnArea wd2">
								<button type="button" class="btnText" onclick="javascript:memberJoinOK();"><span>�ȽɽǸ�Ȯ��</span></button>
							</div>
						</div>
					</div>
					
					<div class="cont" style="display:none;">
						<p>���� ������(I-PIN)�� ���ͳݻ��� ���νĺ���ȣ�� �ǹ��ϸ�,
						��� Ȯ���� ����� ���ͳݿ��� �ֹε�Ϲ�ȣ�� ������� �ʰ� Ȯ���� 
						�� �ִ� �����Դϴ�.</p> 
						<div class="btnArea btnOuter wd2">
							<button type="button" class="btnText" onclick="javascript:ipinPopup();"><span>����(I-PIN) ����</span></button>
						</div>
						<p>�Է��Ͻ� ������ ����Ȯ�ο����� ���Ǹ�, ȸ�������� �Ϸ�Ǹ�<br />
						����� Ȯ���� ���� (�ֹι�ȣ �� �߿������� ��ȣȭ ó��)ȸ��������<br />
						����˴ϴ�. ȸ�������� �������� �������� ������, ����������ȣ��ħ<br />
						�� ���� ��ȣ�ް� �ֽ��ϴ�.</p>
					</div>
				</div>
				<!--//�Ǹ�Ȯ�� -->

				<div class="joinBox_info">
					���� ������ ���� �ٸ� ����� �ֹε�Ϲ�ȣ�� �����Ͽ�<br />
					���ͳݼ��񽺿� �����ϴ� ���� ����� ���������� <strong>3��<br />
					������ ¡���Ǵ� 1õ���� ������ ����</strong>�� ó�����Ƿ�<br />
					�ݵ�� ���� �Ǹ����θ� ������ �ֽñ� �ٶ��ϴ�.<br /><br />

					<p>������ ��ġ�ϴ� ����� ��<strong>�Ǹ�Ȯ��</strong>���� ��<strong>���� I-PIN����</strong>�� 
					�� ���� ��� �� �� ������ �����Ͽ� ����Ȯ���� �����Ͽ� 
					�ֽñ� �ٶ��ϴ�.</p>
				</div>
				<!--//joinBox_info -->
		
			</div>
			<!-- //#subCont -->
		
		</div>
		</div>
</form>
</body>
</html>
