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

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->
<%if( box.getSession("tem_grcode").equals("N000001")) { %>
<link href="/css/portal/homepage_renewal/member.css" rel="stylesheet" type="text/css" />
<%}%>

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
<form name="form_ipin" method="post">
	<input type="hidden" name="m" value="pubmain">						<!-- �ʼ� ����Ÿ��, �����Ͻø� �ȵ˴ϴ�. -->
    <input type="hidden" name="enc_data" value="<%= sEncData %>">		<!-- ������ ��ü������ ��ȣȭ �� ����Ÿ�Դϴ�. -->
    
    <!-- ��ü���� ����ޱ� ���ϴ� ����Ÿ�� �����ϱ� ���� ����� �� ������, ������� ����� �ش� ���� �״�� �۽��մϴ�.
    	 �ش� �Ķ���ʹ� �߰��Ͻ� �� �����ϴ�. -->
    <input type="hidden" name="param_r1" value="">
    <input type="hidden" name="param_r2" value="">
    <input type="hidden" name="param_r3" value="">
    
    <!--<a href="javascript:fnPopup();"><img src="http://image.creditbank.co.kr/static/img/vno/new_img/bt_17.gif" width=218 height=40 border=0></a>-->
</form>

<form name="vnoform" method="post">
	<input type="hidden" name="enc_data">								<!-- �������� ����� ���� ��ȣȭ ����Ÿ�Դϴ�. -->
	
	<!-- ��ü���� ����ޱ� ���ϴ� ����Ÿ�� �����ϱ� ���� ����� �� ������, ������� ����� �ش� ���� �״�� �۽��մϴ�.
    	 �ش� �Ķ���ʹ� �߰��Ͻ� �� �����ϴ�. -->    
    <input type="hidden"	name="p_process"	value="" />
	<input type="hidden"	name="p_resno" value="" />
    <input type="hidden"	name="checkflag" value="" />
    <input type="hidden"	name="checkradio" value="" />  
</form>

<!-- ������ form �� -->

<form name="form1"  action="" method="post" >
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
    
              <%if( box.getSession("tem_grcode").equals("N000001")) { %>
      
      <table>   
	      <tr>
	      	<td>
	      	
	      	<!--Ÿ��Ʋ�κ�-->
    <table width="672" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" colspan="2" class="h_road">&nbsp;</td>
      </tr>
      <tr>
        <td><img src="/images/portal/homepage_renewal/member/stitle_01.gif" alt="ȸ������" /></td>
        <td class="h_road">Home &gt; �̿�ȳ�  &gt; <strong>ȸ������</strong></td>
      </tr>
      <tr>
        <td height="12" colspan="2"></td>
        </tr>
      <tr>
        <td height="1" colspan="2" bgcolor="E5E5E5"></td>
      </tr>
    </table>
    <!--Ÿ��Ʋ�κ�//-->
      <table width="672" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="15"></td>
        </tr>
        <tr>
          <td>
          
          <!--process-->
          <table width="672" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="34"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td><img src="/images/portal/homepage_renewal/member/step_02.gif" alt="" /></td>
                </tr>
              </table></td>
            </tr>
          </table>
          <!--process//-->
          
          </td>
        </tr>
        <tr>
          <td height="15"></td>
        </tr>
      </table>
      
     
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td id="s_stit"><img src="/images/portal/homepage_renewal/member/s_stitle_03.gif" alt="����Ȯ��" /></td>
        </tr>
        <tr>
          <td><!-- <p>���� ���� ����ڵ��� ��Ȱ�� ���� �̿�� �¶��� �󿡼��� �͸� ������� ���� ���� ���� �����ϱ� ����<br />
            ȸ���Կ� ���� �Ǹ����� �����ϰ� �ֽ��ϴ�. ȸ������ �����Ͻ� ������� ������ ���� ���� ���̴� ����� <br />
            �������� ������, ��� ȸ�� ������ �������� ��ȣ��å�� ���� ��ȣ�ް� �ֽ��ϴ�.</p>
            <p>&nbsp;</p> -->
            <p>���� ������ ���� �ٸ� ����� �ֹε�Ϲ�ȣ�� �����Ͽ� ���ͳ� ���񽺿� �����ϴ� ���� ����� ����������<br />
              <span class="blue_txt">3�� ������ ¡�� �Ǵ� 1õ���� ������ ����</span>�� ó�����Ƿ� �ݵ�� <span class="blue">���� �Ǹ�</span>���θ� ������ �ֽñ� �ٶ��ϴ�.</p>
            <p>&nbsp;</p>
            <!-- <p>�ܱ��� ȸ�� ���Թ��Ǵ� �ѱ���������ī���� ������� ���� �������ֽñ� �ٶ��ϴ�.<br />
          Tel. 02-2161-0077   &nbsp;&nbsp;&nbsp;E-mail. academy@kocca.or.kr </p> --></td>
        </tr>
        <tr>
          <td>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mg_t18 " >
           <tr>
		   		<td style="font-size: 0px;" id="namechk">
		   			<a href="javascript:chageImg('1');" ><img src="/images/portal/homepage_renewal/member/btn_namechk_on.gif" alt="�Ǹ�Ȯ��" name="image991" id="image991" /></a>
                    <a href="javascript:chageImg('2');" ><img src="/images/portal/homepage_renewal/member/btn_ipin_off.gif" alt="���� i-Pin ����" name="image992" id="image992"/></a>
				</td>
           </tr>
           <table id="tab1" width="100%" border="0" cellspacing="0" cellpadding="0" >           
            <tr>
          <td id="namechk_box"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="center"><table width="643" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="50">2006�� 9�� 24�� ���� �����Ǵ� �ֹε�Ϲ��� ���� Ÿ���� �ֹι�ȣ�� �¶��� ȸ�� ������ �ϴ� �� <br />
Ÿ���� �ֹε�Ϲ�ȣ�� ���� ����ϰ� �Ǹ� 3�� ������ ¡�� �Ǵ� 1õ���� ������ ������ �ΰ��� �� �ֽ��ϴ�.</td>
                    </tr>
                    <tr>
                      <td><table width="100%" border="0" cellpadding="4" cellspacing="1">
                        <tr>
                          <td height="30"><table border="0" align="center" cellpadding="3" cellspacing="0">
                              <tr>
                                <td class="obox"><input name="radio" type="radio" class="input_search2" id="radio" value="radio1" checked onclick="javascript:changeJoinType('1')"/></td>
                                <td>�Ϲ�ȸ��(14���̻�) </td>
                                <td><span class="obox">
                                  <input name="radio" type="radio" class="input_search2" id="radio2" value="radio2" onclick="javascript:changeJoinType('2')"/>
                                </span></td>
                                <td>�Ϲ�ȸ��(14���̸�) </td>
                                <!-- <td><span class="obox">
                                  <input name="radio" type="radio" class="input_search2" id="radio3" value="radio3" />
                                </span></td>
                                <td>�ܱ���ȸ��(�ܱ��� ��Ϲ�ȣ�� ���� ����)</td> -->
                              </tr>
                            </table></td>
                        </tr>
                        <tr>
                          <td bgcolor="#FFFFFF">
                          	<div class="joinType" id="joinType1" style="display:;">
	                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
	                            <tr>
	                              <!--
	                              <td width="8%"><div align="center">�̸�</div></td>
	                              <td width="21%"><input name="p_username" type="text" id="p_username" size="20" /></td>
	                              <td width="15%"><div align="center">�ֹε�Ϲ�ȣ</div></td>
	                              <td width="38%"><input name="p_resno1" type="text" id="p_resno1" size="15" maxlength="6" onkeyup="moveFocus(6,this,this.form.p_resno2);" onKeypress="onlyNumber();" />
	                                -
	                              <input name="p_resno2" type="password" id="p_resno2" size="15" maxlength="7" onKeypress="onlyNumber();"/></td>
	                              -->
	                              <td width="18%"><a href="javascript:ncPopup();"><img src="/images/portal/homepage_renewal//member/btn_ok01.jpg" /></a></td>
	                            </tr>
	                          </table>
	                         </div>
	                         <div class="joinType" id="joinType2" style="display:none;">
	                          <table width="630" border="0" cellspacing="0" cellpadding="4">
								  <tr>
									<td bgcolor="FFFFFF" colspan="4"><br><span class="btxt">14�� �̸� ������ ���̹���������ī���� ȸ�������� ���� ��ȣ�� ���ǰ� �ʿ��մϴ�.</span><br><br>
										�� ����Ʈ ȸ�������� '������Ÿ� �̿������� ���� ����' �� 31���� ������ ����<br>
										�� 14�� �̸��� �Ƶ��� ���������� �̿��ϴ� ��� ��ȣ�� �Ǵ� �����븮���� ���ǰ� �־�� ȸ�������� �����մϴ�.<Br><Br>
										<strong>�Ʒ� �ֹε�Ϲ�ȣ�� �Է����ּ���. (�Ǹ����� ����Ʈ)</strong><Br>&nbsp;
										
										<div align=right><input type="checkbox" id="pagree" name="pagree">�ڳడ �� ����Ʈ ȸ������ ����ϴµ� �����մϴ�.</div>
									</td>
								  </tr>
		                            <tr>
		                              <td width="90"><div align="left" class=btxt>��ȣ�� �̸�</div></td>
		                              <td align="left" width="150"><input name="pname" type="text" id="pname" size="20" /></td>
		                              <td width="140"><div align="left" class=btxt>��ȣ�� �ֹε�Ϲ�ȣ</div></td>
		                              <td align="left"><input name="presno1" type="text" id="presno1" size="14" maxlength="6" onkeyup="moveFocus(6,this,this.form.presno2);" onKeypress="onlyNumber();" />-<input name="presno2" type="password" id="presno2" size="14" maxlength="7" onKeypress="onlyNumber();" /></td>
		                            </tr>
									<tr>
										<td bgcolor="#E5E5E5" height="1" colspan="4"></td>
									</tr>
									<tr>
										<td><div align="left" class=btxt>��ȣ�� �̸���</div></td>
										<td colspan="3" align="left">
											<input name=pemail1 type="text" id="pemail1" size="15" /> @ <input name="pemail2" type="text" id="pemail2" size="15" />
											<select name="pemail3" id="pemail3" onchange="emailChange();">
						                       <option value="">�����Է�</option>
						                       <option value="naver.com" >naver.com</option>
						                       <option value="chol.com" >chol.com</option>
						                       <option value="dreamwiz.com" >dreamwiz.com</option>
						                       <option value="empal.com" >empal.com</option>
						                       <option value="freechal.com" >freechal.com</option>
						                       <option value="gmail.com" >gmail.com</option>
						                       <option value="hanafos.com" >hanafos.com</option>
						                       <option value="hanmail.net" >hanmail.net</option>
						                       <option value="hanmir.com" >hanmir.com</option>
						                       <option value="hitel.net" >hitel.net</option>
						                       <option value="hotmail.com" >hotmail.com</option>
						                       <option value="korea.com" >korea.com</option>
						                       <option value="lycos.co.kr" >lycos.co.kr</option>
						                       <option value="nate.com" >nate.com</option>
						                       <option value="netian.com" >netian.com</option>
						                       <option value="paran.com" >paran.com</option>
						                       <option value="yahoo.com" >yahoo.com</option>
						                       <option value="yahoo.co.kr" >yahoo.co.kr</option>
						                   </select>
										</td>
									</tr>
									<tr>
										<td bgcolor="#E5E5E5" height="1" colspan="4"></td>
									</tr>
		
									<tr>
		                              <td width="90"><div align="left" class=btxt>ȸ�� �̸�</div></td>
		                              <td align="left" width="150"><input name="pp_username" type="text" id="pp_username" size="20" /></td>
		                              <td width="130"><div align="left" class=btxt>ȸ�� �ֹε�Ϲ�ȣ</div></td>
		                              <td align="left"><input name="pp_resno1" type="text" id="pp_resno1" size="14" maxlength="6" onkeyup="moveFocus(6,this,this.form.pp_resno2);" onKeypress="onlyNumber();" />-<input name="pp_resno2" type="password" id="pp_resno2" size="14" maxlength="7" onKeypress="onlyNumber();"/></td>
		                            </tr>
		                            <tr>
									  <td bgcolor="ffffff" colspan="4"><a href="javascript:memberJoinOK()"><img src="/images/portal/homepage_renewal//member/btn_ok01.jpg" /></a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
								</table>
							</div>
                          </td>
                        </tr>
                      </table></td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>        
           </table>
           <table id="tab2" width="100%" border="0" cellspacing="0" cellpadding="0" style="display:none;">
           <tr>
             <td id="namechk_box"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                 <tr>
                   <td width="25">&nbsp;</td>
                   <td width="226" height="60" align="left" valign="top"><b>���� ������(I_PIN)�� ���ͳݻ��� ���νĺ���ȣ�� �ǹ��Ͽ�,<br/>
���Ȯ���̾���� ���ͳݿ��� �ֹε�Ϲ�ȣ�� ������� �ʰ�<br/>
Ȯ�� �� �� �ִ� �����Դϴ�. </b>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
                   <tr>
                     <td align="left"><a href="javascript:ipinPopup();"><img src="/images/portal/homepage_renewal/member/btn_ipin_ok.jpg" alt="Ȯ��"/></a></td>
                    </tr>
                </table></td>
                  <td width="1" bgcolor="#b7b7b7"></td>
                 <td width="230" id="description">�Է��Ͻ� ������ ����Ȯ�ο����� ���Ǹ�, ȸ�������� �Ϸ�Ǹ� ����� Ȯ���� ���� (�ֹι�ȣ �� �߿������� ��ȣȭ ó��)ȸ�������� ����˴ϴ�. ȸ�������� �������� �������� ������, ����������ȣ��ħ�� ���� ��ȣ�ް� �ֽ��ϴ�.</td>
                <td>&nbsp;</td>
               </tr>
            </table></td>
            </tr>
           </table>
     </table></td>
        </tr>
        <tr>
			<td height="20">&nbsp;</td>
		</tr>
        <tr>
			<td align="center"><p>�ܱ��� ȸ�� ���Թ��Ǵ� �ѱ���������ī���� ������� ���� �������ֽñ� �ٶ��ϴ�.<br />
          Tel. 02-2161-0077   &nbsp;&nbsp;&nbsp;E-mail. academy@kocca.or.kr </p></td>
		 </tr>
      </table>
    </td>
    <td width="20">&nbsp;</td>
    
  </tr>
</table>
	      	
	      	<%}else{ %>

    <h2><img src="/images/portal/member/membership/h1_tit.gif" alt="ȸ������" class="fl_l" /><p class="category">Home &gt; �̿�ȳ� &gt; <strong>ȸ������</strong></p></h2>

    <p><img src="/images/portal/member/membership/member_info_2.gif"  alt="����Ȯ��" /></p>
    <p class="mg_t30"><img src="/images/portal/member/membership/stit_m1.gif"  alt="����Ȯ��" /></p>
    <p class="mg_t15 mg_l15 lh_17">���� ���� ����ڵ��� ��Ȱ�� ���� �̿�� �¶��� �󿡼��� �͸� ������� ���� ���� ���� �����ϱ� ����<br />
        ȸ���Կ� ���� �Ǹ����� �����ϰ� �ֽ��ϴ�. ȸ������ �����Ͻ� ������� ������ ���� ���� ���̴� ����� <br />
        �������� ������, ��� ȸ�� ������ �������� ��ȣ��å�� ���� ��ȣ�ް� �ֽ��ϴ�.<br /><br />
        * ���� ������ ���� �ٸ� ����� �ֹε�Ϲ�ȣ�� �����Ͽ� ���ͳ� ���񽺿� �����ϴ� ���� ����� ����������<br />
        <span style="color:#3DA5D6;">3�� ������ ¡�� �Ǵ� 1õ���� ������ ����</span>�� ó�����Ƿ� �ݵ��
        <span style="color:#3DA5D6;">���� �Ǹ�</span>���θ� ������ �ֽñ� �ٶ��ϴ�. <br /><br/>
        �ܱ��� ȸ�� ���Թ��Ǵ� �ѱ���������ī���� ������� ���� �������ֽñ� �ٶ��ϴ�.<br />
        Tel. 02-2161-0077&nbsp;&nbsp;   E-mail. <a href="mailto:academy@kocca.or.kr">academy@kocca.or.kr</a>
    </p>

        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mg_t18 " >
           <tr>
		   		<td style="font-size: 0px;">
		   			<a href="javascript:chageImg('1');" ><img src="/images/portal/member/membership/box_img_1_1.gif" alt="�Ǹ�Ȯ��" name="image991" width="91" height="21" border="0" id="image991" /></a>
                    <a href="javascript:chageImg('2');" ><img src="/images/portal/member/membership/box_img_1_4.gif" alt="���� i-Pin ����" name="image992" width="131" height="21" border="0" id="image992"/></a>
				</td>
           </tr>
           <table id="tab1" width="100%" border="0" cellspacing="0" cellpadding="0" >
           <tr>
           	<td><img src="/images/portal/member/membership/box_img_1_5.gif" width="690" height="16" /></td>
           </tr>
           <tr>
             <td  background="/images/portal/member/membership/box_img_3.gif" alt=""><table width="100%" border="0" cellspacing="0" cellpadding="0">
                 <tr>
                   <td width="25">&nbsp;</td>
                   <td height="25" align="left" valign="bottom" class="fw_b fc_n">�̿��� ������ �̸��� �ֹι�ȣ�� ��Ȯ�� �Է��� �ֽʽÿ�.</td>
                 </tr>
               <tr>
                 <td width="25">&nbsp;</td>
                 <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                   <tr>
                     <td align="left"><table border="0" align="left" cellpadding="0" cellspacing="0">
                       <tr>
                         <td width="80" align="left">�̸�</td>
                         <td width="170"><span class="pd_t7">
                           <input name="p_username" type="text" class="inp_txt_01" id="p_username" size="32" maxlength="30" title="�̸�"/>
                         </span></td>
                       </tr>
                       <tr>
                         <td align="left">�ֹε�Ϲ�ȣ</td>
                         <td><span class="pd_t7">
                           <input name="p_resno1" type="text" class="inp_txt_01" id="p_resno1" title="�ֹε�Ϲ�ȣ���ڸ�" size="14" maxlength="6" onkeyup="moveFocus(6,this,this.form.p_resno2);" onKeypress="onlyNumber();"/> -
                             <input name="p_resno2" type="password" class="inp_txt_01" id="p_resno2" title="�ֹε�Ϲ�ȣ���ڸ�"size="14" maxlength="7" onKeypress="onlyNumber();"/>
                         </span></td>
                       </tr>
                    </table></td>
                    <td><a href="javascript:memberJoinOK()"><img src="/images/portal/member/membership/btn_joinok.gif" alt="Ȯ��" width="84" height="43" /></a></td>
                   </tr>
                </table></td>
                 <td><img src="/images/portal/member/membership/box_img_4.gif" width="27" height="79" /></td>
                 <td align="left" class="fs_s fc_96">�Է��Ͻ� ������ ����Ȯ�ο����� ���Ǹ�, ȸ��<br />
                                                        ������ �Ϸ�Ǹ� ����� Ȯ���� ���� (�ֹι�ȣ �� <br />
                                                        �߿������� ��ȣȭ ó��)ȸ�������� ����˴ϴ�.<br />
                                                        ȸ�������� �������� �������� ������,<br />
                                                        <span style="color:#DC143C;">����������ȣ��ħ�� ���� ��ȣ�ް� �ֽ��ϴ�.</span></td>
                <td>&nbsp;</td>
               </tr>
            </table></td>
            </tr>
           <tr>
             <td><img src="/images/portal/member/membership/box_img_2.gif" width="690" height="12" /></td>
           </tr>
           </table>
           <table id="tab2" width="100%" border="0" cellspacing="0" cellpadding="0" style="display:none;">
           <tr>
           	<td><img src="/images/portal/member/membership/box_img_1_5.gif" width="690" height="16" /></td>
           </tr>
           <tr>
             <td  background="/images/portal/member/membership/box_img_3.gif" alt=""><table width="100%" border="0" cellspacing="0" cellpadding="0">
                 <tr>
                   <td width="25">&nbsp;</td>
                   <td height="25" align="left" valign="bottom" class="fw_b fc_n">���� ������(I_PIN)�� ���ͳݻ��� ���νĺ���ȣ�� �ǹ��Ͽ�,<br/> ���Ȯ���̾���� ���ͳݿ��� �ֹε�Ϲ�ȣ�� ������� �ʰ�<br/> Ȯ�� �� �� �ִ� �����Դϴ�. </td>
                 </tr>
               <tr>
                 <td width="25">&nbsp;</td>
                 <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                   <tr>
                     <td align="left"><a href="javascript:fnPopup();"><img src="/images/portal/member/membership/I_PIN_btn_joinok.gif" alt="Ȯ��" width="200" height="43" /></a></td>
                    </tr>
                </table></td>
                 <td><img src="/images/portal/member/membership/box_img_4.gif" width="27" height="79" /></td>
                 <td align="left" class="fs_s fc_96">�Է��Ͻ� ������ ����Ȯ�ο����� ���Ǹ�, ȸ��<br />
                                                        ������ �Ϸ�Ǹ� ����� Ȯ���� ���� (�ֹι�ȣ �� <br />
                                                        �߿������� ��ȣȭ ó��)ȸ�������� ����˴ϴ�.<br />
                                                        ȸ�������� �������� �������� ������,<br />
                                                        <span style="color:#DC143C;">����������ȣ��ħ�� ���� ��ȣ�ް� �ֽ��ϴ�.</span></td>
                <td>&nbsp;</td>
               </tr>
            </table></td>
            </tr>
           <tr>
             <td><img src="/images/portal/member/membership/box_img_2.gif" width="690" height="12" /></td>
           </tr>
           </table>
     </table>
     <%} %>

</form>
<!-- form �� -->

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->