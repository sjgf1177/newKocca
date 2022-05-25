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
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.account.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.book.*" %>

<%@ page import = "com.credu.propose.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

	String v_usernm = box.getSession("name");
	String v_email  = box.getSession("email");

	String  v_tem_grcode   = box.getSession("tem_grcode");

	String v_process= box.getString("p_process");

	int v_billprice = 0;

	String v_goodname = "";

	//����
	String v_name    = "";
    String v_post1   = "";
    String v_post2   = "";
    String v_addr    = "";
    String v_addr2   = "";
    String v_hometel = "";

    //request parameter
    v_billprice        = box.getInt("p_realpay");
    String v_rprocess       = box.getString("p_rprocess");
    String v_subj           = box.getString("p_subj");

    String v_iscourseYn     = box.getString("p_iscourseYn");
    String v_course         = box.getString("p_course");
    String v_courseseq      = box.getString("p_courseseq");
    String v_coursenm       = box.getString("p_coursenm");

    String v_subjnm         = box.getString("p_subjnm");
    String v_isonoff        = box.getString("p_isonoff");
    String v_upperclassnm   = box.getString("p_upperclassnm");
    String v_upperclass     = box.getString("p_upperclass");
    String v_select         = box.getString("p_select");
    String v_actionurl      = box.getString("p_actionurl");
    String v_lsearchsubject = box.getString("p_lsearchsubject");
    String v_gubun          = box.getString("p_gubun");
    String v_subjseq        = box.getString("p_subjseq");
    String v_biyong         = box.getString("p_biyong");
    String v_discount       = box.getString("p_discount");
    String v_year           = box.getString("p_year");

    String v_username       = box.getSession("name");
    String v_userid         = box.getSession("userid");
    String v_bookyn         = box.getString("rbo_1");
    String v_bookprice      = box.getString("p_bookprice");
    String v_usemileage     = box.getString("p_usemileage");
    String v_classname      = "";

    if(v_iscourseYn.equals("Y"))
    {
        v_classname = v_coursenm;
    } else {
        v_classname = v_subjnm;
    }
%>
<html>
<head>
<title>����������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>
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

<script language=javascript src="http://plugin.inicis.com/pay40.js"></script>
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="VBScript" src="/script/cresys_lib.vbs"></script>

<script language=javascript>
StartSmartUpdate();
</script>

<!----------------------------------------------------------------------------------
�� ���� ��
 ��� �ڹٽ�ũ��Ʈ�� ������������ ���� �����ϽǶ� ���������� ������ ��ġ����
 �����Ͽ��� ���Ͽ� �߻��Ҽ� �ִ� �÷����� ������ �̿��� ������ �� �ֽ��ϴ�.

  <script language=javascript src="http://plugin.inicis.com/pay40.js"></script>
  <script language=javascript>
  StartSmartUpdate();	// �÷����� ��ġ(Ȯ��)
  </script>
----------------------------------------------------------------------------------->


<script language=javascript>

var openwin;

function isnum(data)
{
  for (var i = 0 ;i < data.value.length ;i++ )
  {
    if ((data.value.substring(i,i+1) < "0" || data.value.substring(i,i+1) > "9" )) {
      	return false;
    } else {
    	return true;
    }
  }
}


function cal_price() {
	ff = document.ini;

    if (isnum(ff.point) == false) {
    	return;
    }


	ff.price.value =  parseInt(ff.subjprice.value) - parseInt(ff.point.value);

	//ff.price.value = fnMoneyType(ff.price.value);
}

function fnMoneyType(v) {
        v = v.toString();
        if (v.length > 3) {
                var mod = v.length % 3;
                var retval = (mod > 0 ? (v.substring(0,mod)) : "");
                for (i=0 ; i < Math.floor(v.length / 3); i++) {
                        if ((mod == 0) && (i == 0)) {
                                retval += v.substring(mod+ 3 * i, mod + 3 * i + 3);
                        } else {
                                retval+= "," + v.substring(mod + 3 * i, mod + 3 * i + 3);
                        }
                }
                return retval;
        } else {
                return v;
        }
}

function pay(frm)
{
	// MakePayMessage()�� ȣ�������ν� �÷������� ȭ�鿡 ��Ÿ����, Hidden Field
	// �� ������ ä������ �˴ϴ�. �Ϲ����� ���, �÷������� ����ó���� �����ϴ� ����
	// �ƴ϶�, �߿��� ������ ��ȣȭ �Ͽ� Hidden Field�� ������ ä��� �����ϸ�,
	// ���� �������� INIsecurepay.php�� �����Ͱ� ����Ʈ �Ǿ� ���� ó������ �����Ͻñ� �ٶ��ϴ�.
	if(document.ini.clickcontrol.value == "enable")
	{
		if (document.ini.paygubun(0).checked) {
			document.ini.gopaymethod.value = "onlycard";
		}

		if (document.ini.paygubun(1).checked) {
			document.ini.gopaymethod.value = "onlydbank";
		}

		if (document.ini.paygubun(2).checked) {
			document.ini.gopaymethod.value = "VBank";
		}

		if(document.ini.gopaymethod.value == "") {
			alert("���� ������ �����ϼ���.");
			return false;
		}



		if(document.ini.goodname.value == "")  // �ʼ��׸� üũ (��ǰ��, ��ǰ����, �����ڸ�, ������ �̸����ּ�, ������ ��ȭ��ȣ)
		{
			alert("���������� �����ϴ�.");
			return false;
		}

		if(document.ini.price.value == "")
		{
			alert("���������� �����ϴ�.");
			return false;
		}

		if(document.ini.buyername.value == "")
		{
			alert("������ ������ �����ϴ�.");
			return false;
		}

		if(document.ini.buyeremail.value == "")
		{
			alert("EMAIL �ּҸ� �Է��ϼ���.");
			document.ini.buyeremail.focus();
			return false;
		}

		if(document.ini.buyertel1.value == "" || document.ini.buyertel2.value == "" || document.ini.buyertel3.value == "")
		{
			alert("��ȭ��ȣ�� �Է��ϼ���.");
			return false;
		}

		document.ini.buyertel.value = document.ini.buyertel1.value + document.ini.buyertel2.value + document.ini.buyertel3.value;

		document.ini.price.value = document.ini.price.value.replace(",","");
/*
		if (document.ini.paygubun(2).checked) {


			if(document.ini.p_inputname.value.length < 1)
			{
				alert("�Ա��ڸ� �Է��� �ּ���.");
				document.ini.p_inputname.focus();
				return false;
			}
			if(document.ini.p_inputdate.value.length != 8 )
			{
				alert("�Ա����� �Է��� �ּ���.");
				document.ini.p_inputdate.focus();
				return false;
			}

			document.ini.gopaymethod.value = "BankBook";
			document.ini.action="/inicis/INIsecurepayBankBook.jsp";
			document.ini.submit();
			return true;
		}
*/
		if(document.INIpay == null || document.INIpay.object == null)  // �÷����� ��ġ���� üũ
		{
			alert("\n�̴����� �÷����� 128�� ��ġ���� �ʾҽ��ϴ�. \n\n������ ������ ���Ͽ� �̴����� �÷����� 128�� ��ġ�� �ʿ��մϴ�. \n\n�ٽ� ��ġ�Ͻ÷��� Ctrl + F5Ű�� �����ðų� �޴��� [����/���ΰ�ħ]�� �����Ͽ� �ֽʽÿ�.");
			return false;
		}
		else
		{
			/******
			 * �÷������� �����ϴ� ���� �����ɼ��� �̰����� ������ �� �ֽ��ϴ�.
			 * (�ڹٽ�ũ��Ʈ�� �̿��� ���� �ɼ�ó��)
			 */

			/*
			50000�� �̸��� �ҺκҰ�, �ϽúҸ� �÷����ο��� ���� �����ϱ� ���� ����
			*/

        		if(parseInt(frm.price.value) < 50000)
        		{
    				/****  �� ���� ��  - ������ �������� ���� ���� nointerest ���� "yes"�� ����
    				                     �� �ܿ��� �Ϲ������� "no"���� ����
    				****/
    				frm.nointerest.value = "no";
            			frm.quotabase.value = "�Ͻú�";
        		}
        		else
        		{
            			/*
				�� ���� �� - ���� 5�����̸� ���ǿ� ���� �������� �� ������ ���� �ʵ�(nointerest, quotabase)��
				             ���������� �״�� ������ �� �ֵ��� �Ʒ� �ҽ� �߿� nointerest, quotabase ���� �����ϰ� ����
				*/

				frm.nointerest.value = "yes";
				frm.quotabase.value = "����:�Ͻú�:3����:4����:5����:6����:7����:8����:9����:10����:11����:12����";
				//frm.quotabase.value = "�Ͻú�";

			}


			if (MakePayMessage(frm))
			{
				disable_click();
				openwin = window.open("childwin.html","childwin","width=299,height=149");
				return true;
			}
			else
			{
				alert("������ ����ϼ̽��ϴ�.");
				return false;
			}
		}
	}
	else
	{
		return false;
	}
}


function enable_click()
{
	document.ini.clickcontrol.value = "enable"
}

function disable_click()
{
	document.ini.clickcontrol.value = "disable"
}

function focus_control()
{
	if(document.ini.clickcontrol.value == "disable")
		openwin.focus();
}

//���ڸ� �Է� ����
function numcheck(oTarget)
{
	if(((event.keyCode < 48) || (event.keyCode > 57)) && ((event.keyCode < 96) || (event.keyCode > 105)))
		if((event.keyCode == 9) || (event.keyCode == 8) || (event.keyCode == 46))
			event.returnValue = true;
		else
			event.returnValue = false;
}

function chkPayMethod() {
	//if (document.ini.paygubun(2).checked) {
	//	IDBank.style.display = "";
	//} else {
		//IDBank.style.display = "none";
	//}
}

window.resizeTo(620,720);

</script>

<script language="javascript">

// �����ȣ�˻�
function searchPost() {
    window.self.name = "PersonalSelect";
    open_window("openPost","","100","100","417","400","","","","yes","");
    document.f1.target = "openPost";
    document.f1.action='/servlet/controller.library.PostSearchServlet';
    document.f1.p_process.value = 'SearchPostOpenPage';
    document.f1.submit();
    document.f1.target = window.self.name;
}
// �ּ� �޾ƿ���
function receivePost(post1, post2, addr, postgubun){
    document.ini.p_post1.value = post1;
    document.ini.p_post2.value = post2;
    document.ini.p_addr1.value = addr;
    document.ini.p_addr2.focus();

}
</script>

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>

<!-----------------------------------------------------------------------------------------------------
�� ���� ��
 �Ʒ��� body TAG�� �����߿�
 onload="javascript:enable_click()" onFocus="javascript:focus_control()" �� �κ��� �������� �״�� ���.
 �Ʒ��� form TAG���뵵 �������� �״�� ���.
------------------------------------------------------------------------------------------------------->

<body bgcolor="#FFFFFF" text="#242424" leftmargin=0 topmargin=0 marginwidth=0 marginheight=0 bottommargin=0 rightmargin=0 onload="javascript:enable_click()" onFocus="javascript:focus_control()"><center>
<form name="f1" method="post">
	<input type="hidden" name="p_process">
</form>
<form name=ini method=post action="/inicis/INIsecurepay_kocca.jsp" onSubmit="return pay(this)">

<table width="590" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" bgcolor="f3f3eb">
    <br>
    <table width="508" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center"><img src="/images/user/game/account/ti_set.gif" width="532" height="35"></td>
      </tr>
    </table>

    <table width="508" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>
                  <br>
                 "����" ��ư�� ������ ���� ������ �����ϰ� ��ȣȭ�ϱ� ���� �÷����� â�� ��µ˴ϴ�.<br>
                  �÷����ο��� �����ϴ� �ܰ迡 ���� ������ �Է��� �� <b>[���� ���� Ȯ��]</b> �ܰ迡�� <br>"Ȯ��" ��ư�� ������
                  ����ó���� ���۵˴ϴ�.<br>
              ���ȯ�濡 ���� �ټ� �ð��� �ɸ����� ������ ��������� ǥ�õɶ����� "����" ��ư�� �����ų� �������� �������� ���ð�
              ��ø� ��ٷ� �ֽʽÿ�.<br></td>
              </tr>
        </table>
           <br>
      <table width="508" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td><img src="/images/user/game/account/ti_set_01.gif" width="192" height="31"></td>
        </tr>
    </table>
	<!-- �Ϲݰ��� ����  -->
	<table width="508" border="0" cellpadding="0" cellspacing="1" bgcolor="c1bba5">
      <tr>
        <td height="25" align="center" bgcolor="ddd9cd">������</td>
        <td width="50" align="center" bgcolor="ddd9cd">����</td>
        <td width="100" align="center" bgcolor="ddd9cd">������</td>
      </tr>
	  <tr>
        <td bgcolor="#FFFFFF" class="tbl_gleft" style="padding-left:10px;"><%=v_classname%></td>
        <td height="25" align="center" bgcolor="#FFFFFF"><%=v_subjseq%></td>
        <td height="25" align="center" bgcolor="#FFFFFF"><%=new java.text.DecimalFormat("###,###,##0").format(v_billprice)%>��</td>
      </tr>
	</table>
	<!-- �Ϲݰ��� �� -->
	<br>
        <table width="508" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td><img src="/images/user/game/account/ti_set_02.gif" width="192" height="31"></td>
          </tr>
        </table>
        <table width="508" border="0" cellpadding="0" cellspacing="1" bgcolor="c1bba5">
          <tr>
            <td width="118" height="25" align="center" background="/images/user/game/account/td_bg.gif" bgcolor="ddd9cd">����</td>
            <td height="25" bgcolor="#FFFFFF"><img src="/images/user/game/account/spacer.gif" width="24" height="8">
              <input type=hidden name=buyername size=20 value="<%=v_usernm%>">
              <%=v_usernm%></td>
          </tr>
          <tr>
            <td width="118" height="25" align="center" background="/images/user/game/account/td_bg.gif" bgcolor="ddd9cd">���ڿ���</td>
            <td height="25" bgcolor="#FFFFFF"><img src="/images/user/game/account/spacer.gif" width="25" height="8">
              <input type=text name=buyeremail class="input" size=30 value="<%=v_email%>">
              <input type=hidden name=parentemail value=""></td>
          </tr>
          <tr>
            <td width="118" height="25" align="center" background="/images/user/game/account/td_bg.gif" bgcolor="ddd9cd">�̵���ȭ</td>
            <td height="25" bgcolor="#FFFFFF"><img src="/images/user/game/account/spacer.gif" width="20" height="8">
            	&nbsp;<input type=text name="buyertel1" size=3 class="input" maxlength="3">-
            	<input type=text name="buyertel2" size=4 class="input" maxlength="4">-
            	<input type=text name="buyertel3" size=4 class="input" maxlength="4">
              	<input type=hidden name="buyertel">
              	<!-- ������ ���� ���� -->
              	<input type="hidden" name="p_receive" maxlength="10" value="<%=v_name%>">
              	<input type="hidden" name="p_phone" maxlength="14" value="<%=v_hometel%>">
              	<input type="hidden" name="p_post1" maxlength="3" size="4" value="<%=v_post1%>">
              	<input type="hidden" name="p_post2" maxlength="3" size="4" value="<%=v_post2%>">
              	<input type="hidden" name="p_addr1" maxlength="100" size= "60" value="<%=v_addr%>">
              	<input type="hidden" name="p_addr2" maxlength="100" size= "60" value="<%=v_addr2%>">
              	<!-- ������ ���� �� -->
              	</td>
          </tr>
        </table>
		 <table width="512" height="54" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" background="/images/user/game/account/bg_mo.gif"><table width="480" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td>* ���ڿ���� �̵���ȭ��ȣ�� �Է¹޴� ���� ������ �������� ������ <strong><font color="ff9c00">E-MAIL</font></strong> �Ǵ�
                <strong><font color="ff9c00">SMS</font></strong>�� �˷��帮�� �����̿���
                �ݵ�� �����Ͻñ� �ٶ��ϴ�. </td>
            </tr>
          </table></td>
        </tr>
      </table>


      <br>
        <table width="508" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td><img src="/images/user/game/account/ti_set_03.gif" width="192" height="31"></td>
          </tr>
        </table>
        <table width="508" border="0" cellpadding="0" cellspacing="1" bgcolor="c1bba5">
          <tr>
            <td width="118" height="25" align="center" bgcolor="ddd9cd">�������</td>
            <td height="25" bgcolor="#FFFFFF"> <img src="/images/user/game/account/spacer.gif" width="15" height="8">
              <input type="radio" name="paygubun" value="CARD" onClick="chkPayMethod();">
              �ſ�ī�� ����<br> <img src="/images/user/game/account/spacer.gif" width="15" height="8">
              <input type="radio" name="paygubun" value="DirectBANK" onClick="chkPayMethod();">
              �ǽð� ������ü<br> <img src="/images/user/game/account/spacer.gif" width="15" height="8">
              <input type="radio" name="paygubun" value="VBank" onClick="chkPayMethod();">
              ������(�������)<br>
              <input type="hidden" name="gopaymethod" value="">
            </td>
          </tr>

			<input type=hidden name=goodname value="<%=v_classname%>"> <!-- ��ǰ�� -->
          	<input type="hidden" name="ispointuse" value="N">
          	<input type="hidden" name="point" value="0">
          	<input type="hidden" name="price" value="<%=v_billprice%>">
          	<input type="hidden" name="tem_grcode" value="<%=box.getSession("tem_grcode")%>">
           <tr>
            <td height="25" align="center" background="/images/user/game/account/td_bg.gif" bgcolor="ddd9cd">�����ݾ�</td>
            <td height="25" bgcolor="#FFFFFF"><img src="/images/user/game/account/spacer.gif" width="24" height="8">
              <%=new java.text.DecimalFormat("###,###,###").format(v_billprice)%>��
            </td>
          </tr>
        </table>
        <table width="508" height="1" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td bgcolor="c1bba5"></td>
        </tr>
      </table>
            <br>


     <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td></td>
      </tr>
    </table>
      <table width="100%" height="62" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" ><table width="120" border="0" cellspacing="0" cellpadding="0">
            <tr align="center">
              <td><input type=image src="/images/user/game/account/b_setok.gif" width="54" height="21" border="0"></a></td>
              <td><a href="javascript:window.close();"><img src="/images/user/button/btn_cancel.gif" width="45" height="21" border="0"></a></td>
              </tr>
          </table></td>
        </tr>
      </table>      </td>
  </tr>
</table>


<!--
�������̵�.
�׽�Ʈ�� ��ģ ��, �߱޹��� ���̵�� �ٲپ� �ֽʽÿ�.
-->
<!--
<% if (request.getServerName().indexOf("172.20.220.103")==0) { %>
<input type=hidden name=mid value="INIpayTest">
<% } else { %>
<input type=hidden name=mid value="kocca00002">
<% } %>
-->
<input type=hidden name=mid value="kocca00002">

<!--
ȭ�����
WON �Ǵ� CENT
���� : ��ȭ������ ���� ����� �ʿ��մϴ�.
-->
<input type=hidden name=currency value="WON">


<!--
������ �Һ�
�����ڷ� �Һθ� ���� : yes
�������Һδ� ���� ����� �ʿ��մϴ�.
ī��纰,�Һΰ������� �������Һ� ������ �Ʒ��� ī���ҺαⰣ�� ���� �Ͻʽÿ�.
�������Һ� �ɼ� ������ �ݵ�� �Ŵ����� �����Ͽ� �ֽʽÿ�.
-->
<input type=hidden name=nointerest value="no">


<!--
ī���ҺαⰣ
�� ī��纰�� �����ϴ� �������� �ٸ��Ƿ� �����Ͻñ� �ٶ��ϴ�.

value�� ������ �κп� ī����ڵ�� �ҺαⰣ�� �Է��ϸ� �ش� ī����� �ش�
�Һΰ����� �������Һη� ó���˴ϴ� (�Ŵ��� ����).
-->
<input type=hidden name=quotabase value="����:�Ͻú�"> <!--:3����:4����:5����:6����:7����:8����:9����:10����:11����:12����-->


<!-- ��Ÿ���� -->
<!--
SKIN : �÷����� ��Ų Į�� ���� ��� - 6���� Į��(ORIGINAL, GREEN, ORANGE, BLUE, KAKKI, GRAY)
HPP : ������ �Ǵ� �ǹ� ���� ���ο� ���� HPP(1)�� HPP(2)�� ���� ����(HPP(1):������, HPP(2):�ǹ�).
Card(0): �ſ�ī�� ���ҽÿ� �̴Ͻý� ��ǥ �������� ��쿡 �ʼ������� ���� �ʿ� ( ��ü �������� ��쿡�� ī����� ��࿡ ���� ����) - �ڼ��� ������ �޴���  ����.
OCB : OK CASH BAG ���������� �ſ�ī�� �����ÿ� OK CASH BAG ������ �����Ͻñ� ���Ͻø� "OCB" ���� �ʿ� �� �ܿ� ��쿡�� �����ؾ� �������� ���� �̷����.
RECEIPT : ���ݿ����� ������ ���Ͻô� ��� �߰��Ͻø� �÷����ο��� ���ݿ����� �߱��� ���� �������̽��� ���Ǽ� �ֽ��ϴ�
-->
<input type=hidden name=acceptmethod value="SKIN(ORIGINAL):HPP(1)"> <!--:OCB-->

<!--
���� �ֹ���ȣ : �������Ա� ����(������� ��ü),��ȭ����(1588 Bill) ���� �ʼ��ʵ�� �ݵ�� ������ �ֹ���ȣ�� �������� �߰��ؾ� �մϴ�.
�������� �߿� �ǽð� ������ü �̿� �ÿ��� �ֹ� ��ȣ�� ��������� ��ȸ�ϴ� ���� �ʵ尡 �˴ϴ�.
���� �ֹ���ȣ�� �ִ� 40 BYTE �����Դϴ�.
-->
<input type=hidden name=oid size=40 value="mall_use_order_id">

<!--
�÷����� ���� ��� ���� �ΰ� �̹��� ���
�÷����� ���� ��ܿ� ���� �ΰ� �̹����� ����Ͻ� �� ������,
�ּ��� Ǯ�� �̹����� �ִ� URL�� �Է��Ͻø� �÷����� ��� �κп� ���� �̹����� �����Ҽ� �ֽ��ϴ�.
-->
<!--input type=hidden name=ini_logoimage_url  value="http://[����� �̹����ּ�]"-->

<!--
���� �����޴� ��ġ�� �̹��� �߰�
���� �����޴� ��ġ�� �̹����� �߰��Ͻ� ���ؼ��� ��� ������ǥ���� ��뿩�� ����� �Ͻ� ��
�ּ��� Ǯ�� �̹����� �ִ� URL�� �Է��Ͻø� �÷����� ���� �����޴� �κп� �̹����� �����Ҽ� �ֽ��ϴ�.
-->
<!--input type=hidden name=ini_menuarea_url value="http://[����� �̹����ּ�]"-->

<!--
�÷����ο� ���ؼ� ���� ä�����ų�, �÷������� �����ϴ� �ʵ��
����/���� �Ұ�
-->
<input type=hidden name=quotainterest value="">
<input type=hidden name=paymethod value="">
<input type=hidden name=cardcode value="">
<input type=hidden name=cardquota value="">
<input type=hidden name=rbankcode value="">
<input type=hidden name=reqsign value="DONE">
<input type=hidden name=encrypted value="">
<input type=hidden name=sessionkey value="">
<input type=hidden name=uid value="">
<input type=hidden name=sid value="">
<input type=hidden name=version value=4000>
<input type=hidden name=clickcontrol value="">
<input type=hidden name=p_TID value="<%=request.getParameter("p_subjcd")%>">
<input type=hidden name=p_gubun value="<%=v_gubun%>">
<input type=hidden name=p_process value="<%=v_process%>">

<!-- �߰� �Ķ���� -->
<input type='hidden' name='p_select'    value="<%=v_select %>">
<input type='hidden' name='p_biyong'    value="<%=v_billprice %>">
<input type='hidden' name='p_bookprice' value="<%=v_bookprice %>">
<input type='hidden' name='p_discount'  value="<%=v_discount %>">
<input type='hidden' name='p_realpay'   value="<%=v_billprice %>">
<input type='hidden' name='p_subj'      value="<%=v_subj %>">
<input type='hidden' name='p_year'      value="<%=v_year %>">
<input type='hidden' name='p_subjseq'   value="<%=v_subjseq %>">
<input type='hidden' name='p_subjnm'    value="<%=v_subjnm %>">
<input type='hidden' name='p_rprocess'  value="<%=v_rprocess %>">
<input type='hidden' name='p_actionurl' value="<%=v_actionurl %>">
<input type='hidden' name='p_isonoff'   value="<%=v_isonoff %>">
<input type='hidden' name='p_upperclass'    value="<%=v_upperclass %>">
<input type='hidden' name='p_upperclassnm'  value="<%=v_upperclassnm %>">
<input type='hidden' name='p_lsearchsubject' value="<%=v_lsearchsubject %>">
<input type='hidden' name='p_bookyn'    value="<%=v_bookyn %>">
<input type='hidden' name='p_usemileage' value="<%=v_usemileage %>">
<input type='hidden' name='p_course' value="<%=v_course %>">
<input type='hidden' name='p_courseseq' value="<%=v_courseseq %>">
<input type='hidden' name='p_coursenm' value="<%=v_coursenm %>">
<input type='hidden' name='p_iscourseYn' value="<%=v_iscourseYn%>">

<input type='hidden' name='p_cyear' value="<%=v_year%>">
<input type='hidden' name='p_price' value="<%=v_billprice%>">
</form>
</body>
</html>