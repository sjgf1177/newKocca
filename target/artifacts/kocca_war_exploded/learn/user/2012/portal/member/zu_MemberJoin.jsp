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

	box.put("topmenu","1");
	box.put("submenu","2");

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

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->


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

	//var v_name  = document.form1.p_username.value;
	//var v_resno1 = document.form1.p_resno1.value;
	//var v_resno2 = document.form1.p_resno2.value;
	var parentName = document.form1.pname.value;
	var parentResno1 = document.form1.presno1.value;
	var parentResno2 = document.form1.presno2.value;
	var parentEmail1 = document.form1.pemail1.value;
	var parentEmail2 = document.form1.pemail2.value;
	var checkradio = document.form1.checkradio.value;
	var cName  = document.form1.pp_username.value;
	var cResno1 = document.form1.pp_resno1.value;
	var cResno2 = document.form1.pp_resno2.value;
	
	if(document.form1.checkradio.value.length>0){
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
	    //document.form1.action="/servlet/controller.homepage.MainMemberJoinServlet";    //�Ǹ����� üũ ���� �������
	    document.form1.action = "/certi/nc_p.jsp";                                 //�Ǹ����� üũ ������
	    document.form1.checkflag.value   = "true";
	    
	    document.form1.submit(); 
		
	}else{


		/*if(!TrimString(v_name)){
		alert("�̸��� �Է��ϼ���");
		document.form1.p_username.focus();
		return;
	}

	if(!TrimString(v_resno1) || document.form1.p_resno1.value.length < 6){
		alert("�ֹε�Ϲ�ȣ�� �ٸ��� �Է��ϼ���");
		document.form1.p_resno1.value = "";
		document.form1.p_resno1.focus();
		return;
	}
	if(!TrimString(v_resno2) || document.form1.p_resno2.value.length < 7){
		alert("�ֹε�Ϲ�ȣ�� �ٸ��� �Է��ϼ���");
		document.form1.p_resno2.value = "";
		document.form1.p_resno2.focus();
		return;
	}

    if(!regcheck(v_resno1+v_resno2))
    {
        $("[name='p_resno1']").val("");
        $("[name='p_resno2']").val("");
        $("[name='p_resno1']").focus();
        return;
    }
    */


    // ȸ������ Ȯ��
    //document.form1.p_username.value = v_name;
    //document.form1.p_resno1.value   = v_resno1;
    //document.form1.p_resno2.value   = v_resno2;
    //document.form1.action="/servlet/controller.homepage.MainMemberJoinServlet";    //�Ǹ����� üũ ���� �������
    document.form1.action = "/certi/nc_p.jsp";                                 //�Ǹ����� üũ ������
    document.form1.checkflag.value   = "true";
    
    document.form1.submit();   
	}                   
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
			//document.form1.p_username.value="";
			//document.form1.p_resno1.value="";
			//document.form1.p_resno2.value="";
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
		//self.close();
	}
	
	
</script>

<!-- ������ ��ũ��Ʈ ���� -->

<!-- ��ũ��Ʈ�������� -->

<!-- form ���� -->

<!-- ������ form ���� -->

<!-- �����ֹι�ȣ ���� �˾��� ȣ���ϱ� ���ؼ��� ������ ���� form�� �ʿ��մϴ�. -->
<form name="form_ipin" method="post" action="/">
	<input type="hidden" name="m" value="pubmain">						<!-- �ʼ� ����Ÿ��, �����Ͻø� �ȵ˴ϴ�. -->
    <input type="hidden" name="enc_data" value="<%= sEncData %>">		<!-- ������ ��ü������ ��ȣȭ �� ����Ÿ�Դϴ�. -->
    
    <!-- ��ü���� ����ޱ� ���ϴ� ����Ÿ�� �����ϱ� ���� ����� �� ������, ������� ����� �ش� ���� �״�� �۽��մϴ�.
    	 �ش� �Ķ���ʹ� �߰��Ͻ� �� �����ϴ�. -->
    <input type="hidden" name="param_r1" value="">
    <input type="hidden" name="param_r2" value="">
    <input type="hidden" name="param_r3" value="">
    
    <!--<a href="javascript:fnPopup();"><img src="http://image.creditbank.co.kr/static/img/vno/new_img/bt_17.gif" width=218 height=40 border=0></a>-->
</form>

<form name="vnoform" method="post" action="">
	<input type="hidden" name="enc_data">								<!-- �������� ����� ���� ��ȣȭ ����Ÿ�Դϴ�. -->
	
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
    <input type="hidden" name="enc_data">
    <!-- �����ɰ��� �� -->
    <!-- �ȽɽǸ��������� ����-->
    <input type="hidden" name="enc_data" value="">
 	<input type="hidden" name="nc_safeid" value="">
 	<input type="hidden" name="nc_username" value="">
 	<input type="hidden" name="nc_jumindate" value="">
 	<input type="hidden" name="nc_gender" value="">
 	<input type="hidden" name="nc_cert" value="">
 	<!-- �ȽɽǸ��������� ����-->
	<div class="content">
		<table class="rootinfo" cellpadding="0" cellspacing="0" summary="���� ���̴� �������� ��ġ�Դϴ�">
			<tr>
				<td class="pagetitle"><img src="/images/2012/sub/page0/title/member_join.gif" alt="ȸ������"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > <u>ȸ������</u></td>
			</tr>
		</table>
		<table class="joinform" cellpadding="0" cellspacing="0" summary="����Ȯ���� ���� �����Դϴ�">
			<colgroup><col width="50%"><col width="*"></colgroup>
			<tr>
				<td>
					<img src="/images/2012/sub/page0/join_step02.gif" alt="�������">
					<div class="lawsmsg">
						<h4>���� ������ ���� �ٸ� ����� �ֹε�Ϲ�ȣ�� �����Ͽ� ���ͳ� ���񽺿� �����ϴ� ���� ����� ���������� <u>3�� ������ ¡�� �Ǵ� 1õ���� ������ ����</u>�� ó�����Ƿ� �ݵ�� ���� �Ǹ����θ� ������ �ֽñ� �ٶ��ϴ�.</h4>
					</div>
					<div class="realchecktip">
						<h6><img src="/images/2012/sub/icon_dot.png" alt="dot" align="absmiddle">������ ��ġ�ϴ� ����� "<u>�Ǹ�Ȯ��</u>"�� "<u>����I-Pin����</u>" �ΰ��� ��� �� �Ѱ����� �����Ͽ�<br> &nbsp; ����Ȯ���� �����Ͽ� �ֽñ� �ٶ��ϴ�.</h6>
					</div>
				</td>
				<td>
					<ul class="realtab">
						<li><button type="button" onclick="checktype('1');" tabindex="171" id="real1" class="realon" title="�ȽɽǸ�Ȯ���� �̿��Ͽ� ����Ȯ���� �մϴ�">�Ǹ�Ȯ��</button></li>
						<li><button type="button" onclick="checktype('2');" tabindex="172" id="real2" class="realoff" title="���� I-PIN ������ �̿��Ͽ� ����Ȯ���� �մϴ�">����I-PIN����</button></li>
					</ul>
					<div class="realnamebox">
						<div class="realnamecheck" id="checkview1">
							<h6>2006�� 9�� 24�� ���� �����Ǵ� �ֹε�Ϲ��� ���� Ÿ���� �ֹι�ȣ�� �¶��� ȸ�� ������ �ϴ� �� Ÿ���� �ֹε�Ϲ�ȣ�� ���� ����ϰ� �Ǹ� 3�� ������ ¡�� �Ǵ� 1õ���� ������ ������ �ΰ��� �� �ֽ��ϴ�.</h6>
							<table class="ageselect" cellpadding="0" cellspacing="0" summary="������ ���� ����">
								<tr>
									<td><input type="radio" id="senior" tabindex="181" onclick="joinyearcheck('off')" class="radio" name="peopletype" title="�Ϲ�ȸ��(14�� �̻�)" checked><label for="senior" class="label">�Ϲ�ȸ��(14�� �̻�)</label></td>
									<td><input type="radio" id="junior" tabindex="182" onclick="joinyearcheck('on')" class="radio" name="peopletype" title="�Ϲ�ȸ��(14�� ����)"><label for="junior" class="label">�Ϲ�ȸ��(14�� ����)</label></td>
								</tr>
							</table>
							<div id="year14min" class="year14min">
								<h6><b>14�� �̸� ������ ���̹���������ī���� ȸ�������� ���� ��ȣ�� ���ǰ� �ʿ��մϴ�.</b></h6>
								<br>
								<h6>�� ����Ʈ ȸ�������� '������Ÿ� �̿������� ���� ����' �� 31���� ������ ���� �� 14�� �̸��� �Ƶ��� ���������� �̿��ϴ� ��� ��ȣ�� �Ǵ� �����븮���� ���ǰ� �־�� ȸ�������� �����մϴ�.</h6>
								<table class="familyfield" cellpadding="0" cellspacing="0" summary="�������� Ȯ��">
									<colgroup><col width="120"><col width="*"></colgroup>
									<tr>
										<th colspan="2" class="agreen"><input type="checkbox" tabindex="183" name="pagree" class="checkbox" id="agreen"><label for="agreen" class="label">�ڳడ �� ����Ʈ ȸ������ ����ϴµ� �����մϴ�.</label></th>
									</tr>
									<tr>
										<th>��ȣ�� ����</th>
										<td><input type="text" name="pname" tabindex="184" style="width:176px;" id="txtfield1" onfocus="choicefield('1');"></td>
									</tr>
									<tr>
										<th>��ȣ�� �ֹε�Ϲ�ȣ</th>
										<td><input type="text" name="presno1" tabindex="185" style="width:60px;" maxlength="6" id="txtfield2" onfocus="choicefield('2');"> - <input type="password" tabindex="186" name="presno2" style="width:95px;" maxlength="7" id="txtfield3" onfocus="choicefield('3');"></td>
									</tr>
									<tr>
										<th>��ȣ�� �̸���</th>
										<td>
											<input type="text" tabindex="187" name="pemail1" style="width:70px;" id="txtfield4" onfocus="choicefield('4');">@<input name="pemail2" tabindex="188" type="text" style="width:70px;" id="txtfield5" onfocus="choicefield('5');">
											<select class="select" tabindex="189" id="txtfield6" onfocus="choicefield('6');">
												<option>�����Է�</option>
												<option>chol.com</option>
												<option>daum.net</option>
												<option>dreamwiz.com</option>
												<option>empal.com</option>
												<option>freechal.com</option>
												<option>gmail.com</option>
												<option>hanafos.com</option>
												<option>hanmail.net</option>
												<option>hanmir.com</option>
												<option>hitel.net</option>
												<option>hotmail.com</option>
												<option>korea.com</option>
												<option>lycos.co.kr</option>
												<option>naver.com</option>
												<option>nate.com</option>
												<option>netian.com</option>
												<option>paran.com</option>
												<option>yahoo.co.kr</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>ȸ�� ����</th>
										<td><input type="text" tabindex="190" name="pp_username" style="width:176px;" id="txtfield7" onfocus="choicefield('7');"></td>
									</tr>
									<tr>
										<th>ȸ�� �ֹε�Ϲ�ȣ</th>
										<td><input type="text" tabindex="191" name="pp_resno1" style="width:60px;" maxlength="6" id="txtfield8" onfocus="choicefield('8');"> - <input name="pp_resno2" tabindex="192" type="password" style="width:95px;" maxlength="7" id="txtfield9" onfocus="choicefield('9');"></td>
									</tr>
								</table>
								<div class="realfooter"><a href="javascript:memberJoinOK();" tabindex="193" title="�ȽɽǸ�Ȯ���� �����մϴ�"><img src="/images/2012/sub/page0/btn_realcheck.gif" alt="�ȽɽǸ�Ȯ��"></a></div>
							</div>
							<div id="year14max" class="realfooter"><a href="javascript:ncPopup();" tabindex="194" title="�ȽɽǸ�Ȯ���� �����մϴ�"><img src="/images/2012/sub/page0/btn_realcheck.gif" alt="�ȽɽǸ�Ȯ��"></a></div>
						</div>
						<div class="realnamecheck" id="checkview2" style="display:none;">
							<h6>���� ������(I_PIN)�� ���ͳݻ��� ���νĺ���ȣ�� �ǹ��Ͽ�,<br> ��� Ȯ���� ����� ���ͳݿ��� �ֹε�Ϲ�ȣ�� ������� �ʰ� Ȯ�� �� �� �ִ� �����Դϴ�. </h6>
							<div class="ipinconnect"><a href="javascript:ipinPopup();" tabindex="195" title="I-PIN������ �����մϴ�"><img src="/images/2012/sub/page0/btn_ipin.gif" alt="����(i-pin)����"></a></div>
							<h6>�Է��Ͻ� ������ ����Ȯ�ο����� ���Ǹ�, ȸ�������� �Ϸ�Ǹ� ����� Ȯ���� ���� (�ֹι�ȣ �� �߿������� ��ȣȭ ó��)ȸ�������� ����˴ϴ�. ȸ�������� �������� �������� ������, ����������ȣ��ħ�� ���� ��ȣ�ް� �ֽ��ϴ�.</h6>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
