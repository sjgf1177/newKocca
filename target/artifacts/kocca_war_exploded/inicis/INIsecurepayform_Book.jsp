<%
//**********************************************************
//  1. ��      ��: SUBJECT PREVIEW PAGE
//  2. ���α׷���: zu_BookBill_P.jsp
//  3. ��      ��: �����ȳ�
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004. 01.12
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.book.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String  v_process  = box.getString("p_process");
    String  v_bookcode = box.getString("p_bookcode");

    String v_classify      = "";          // �з�
    String v_codenm        = "";          // �з���
    String v_bookname      = "";          // �����
    int    v_price         = 0;           // ����
    int    v_dis_price     = 0;           // �ǸŰ�

    String upload_url = conf.getProperty("url.upload");
    DecimalFormat  df = new DecimalFormat("###,##0");

    //DataBox dbox = (DataBox)request.getAttribute("selectBook");
    BookBean bean = new BookBean();
    DataBox dbox = bean.selectBook(box);

    if (dbox != null) {
        v_classify      = dbox.getString("d_classify");
        v_codenm        = dbox.getString("d_codenm");
        v_bookname      = dbox.getString("d_bookname");
        v_price         = dbox.getInt   ("d_price");
        v_dis_price     = dbox.getInt   ("d_dis_price");
     }

    String v_name    = "";
    String v_post1   = "";
    String v_post2   = "";
    String v_addr    = "";
    String v_addr2   = "";
    String v_hometel = "";

    MemberInfoBean memberbean = new MemberInfoBean();
    DataBox dbox2 =  memberbean.getMemberInfo(box);
    if (dbox2 != null) {
		v_name    = dbox2.getString("d_name");
        v_post1   = dbox2.getString("d_post1");
        v_post2   = dbox2.getString("d_post2");
        v_addr    = dbox2.getString("d_addr");
        v_addr2   = dbox2.getString("d_addr2");
        v_hometel = dbox2.getString("d_hometel");
    }

    if (box.getSession("userid").equals("")) { %>
<html>
<head>
<title>����������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>
<script language=javascript>
	alert("�α����� �ʿ��մϴ�.");
	window.close();
</script>

<%  } else {
%>

<html>
<head>
<title>����������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>
<link rel="stylesheet" href="css/group.css" type="text/css">
<link href="/css/user_style1.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="VBScript" src="/script/cresys_lib.vbs"></script>

<script language=javascript src="http://plugin.inicis.com/pay40.js"></script>
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
			document.ini.gopaymethod.value = "BankBook";
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


	    if(document.ini.p_receive.value.length < 1 ) {
	        alert("������ �̸��� �Է��� �ּ���.");
	        document.ini.p_receive.focus();
	        document.ini.p_receive.select();
	        return false;
	    }

	    if(document.ini.p_phone.value.length < 1 ) {
	        alert("������ ��ȭ��ȣ�� �Է��� �ּ���.");
	        document.ini.p_phone.focus();
	        document.ini.p_phone.select();
	        return false;
	    }

	    if(document.ini.p_addr1.value.length < 1 ) {
	        alert("������ �ּҸ� �Է��� �ּ���.");
	        document.ini.p_addr1.focus();
	        document.ini.p_addr1.select();
	        return false;
	    }

		document.ini.buyertel.value = document.ini.buyertel1.value + document.ini.buyertel2.value + document.ini.buyertel3.value;

		document.ini.price.value = document.ini.price.value.replace(",","");

		if (document.ini.paygubun(2).checked) {
		    if(document.ini.p_accountname.value.length < 1) {
		        alert("�Ա��ڸ� �Է��� �ּ���.");
		        document.ini.p_accountname.focus();
		        document.ini.p_accountname.select();
		        return false;
		    }

		    if(document.ini.p_paydate.value.length < 1 ) {
		        alert("�Ա����� �Է��� �ּ���.");
		        document.ini.p_paydate.focus();
		        document.ini.p_paydate.select();
		        return false;
		    }

	            document.ini.action = "/servlet/controller.book.BookServlet";
		    document.ini.p_process.value = "bookPropose";
		    document.ini.target = "_self";

		    document.ini.submit();
		    return true;
		}


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

				frm.nointerest.value = "no";
				//frm.quotabase.value = "����:�Ͻú�:3����:4����:5����:6����:7����:8����:9����:10����:11����:12����";
				frm.quotabase.value = "�Ͻú�";

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
	alert("20");
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
	if (document.ini.paygubun(2).checked) {
		IDBank.style.display = "";
	} else {
		IDBank.style.display = "none";
	}
}

</script>

<script language="Javascript">
    window.resizeTo(750,680);
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

<script>
//���ڸ� �Է� ����
function numcheck(oTarget) {
    if(((event.keyCode < 48) || (event.keyCode > 57)) && ((event.keyCode < 96) || (event.keyCode > 105)))
        if((event.keyCode == 9) || (event.keyCode == 8) || (event.keyCode == 46))
            event.returnValue = true;
        else
            event.returnValue = false;
}

//�Է�
function input() {


    if(document.ini.p_receive.value.length < 1 ) {
        alert("������ �̸��� �Է��� �ּ���.");
        document.ini.p_receive.focus();
        document.ini.p_receive.select();
        return;
    }
    if(document.ini.p_phone.value.length < 1 ) {
        alert("������ ��ȭ��ȣ�� �Է��� �ּ���.");
        document.ini.p_phone.focus();
        document.ini.p_phone.select();
        return;
    }
    if(document.ini.p_addr1.value.length < 1 ) {
        alert("������ �ּҸ� �Է��� �ּ���.");
        document.ini.p_addr1.focus();
        document.ini.p_addr1.select();
        return;
    }

	if (document.ini.paygubun(2).checked) {
	    if(document.ini.p_accountname.value.length < 1) {
	        alert("�Ա��ڸ� �Է��� �ּ���.");
	        document.ini.p_accountname.focus();
	        document.ini.p_accountname.select();
	        return;
	    }
	    if(document.ini.p_paydate.value.length < 1 ) {
	        alert("�Ա����� �Է��� �ּ���.");
	        document.ini.p_paydate.focus();
	        document.ini.p_paydate.select();
	        return;
	    }

        document.ini.action = "/servlet/controller.book.BookServlet";
	    document.ini.p_process.value = "bookBillCheckPage";
	    document.ini.target = "_self";

	    document.ini.submit();

	}

}

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

<!-----------------------------------------------------------------------------------------------------
�� ���� ��
 �Ʒ��� body TAG�� �����߿�
 onload="javascript:enable_click()" onFocus="javascript:focus_control()" �� �κ��� �������� �״�� ���.
 �Ʒ��� form TAG���뵵 �������� �״�� ���.
------------------------------------------------------------------------------------------------------->


<!--body bgcolor="#F6F6F6"-->
<body bgcolor="#F6F6F6" leftmargin=0 topmargin=0 marginwidth=0 marginheight=0 bottommargin=0 rightmargin=0 onload="javascript:enable_click()" onFocus="javascript:focus_control()">
<form name="f1" method="post">
	<input type="hidden" name="p_process">
</form>
<!--form name="form1" method="post"-->
<form name=ini method=post action="/inicis/INIsecurepay_Book.jsp" onSubmit="return pay(this)">
    <input type='hidden' name='p_bookcode'     value="<%=v_bookcode%>">
    <input type='hidden' name='p_bookname'     value="<%=v_bookname%>">
    <input type='hidden' name='p_dis_price'    value="<%=v_dis_price%>">
    <input type='hidden' name='p_realpaymoney' value="<%=v_dis_price%>">

			<input type=hidden name=goodname size=20 value="<%=v_bookname%>"> <!-- ��ǰ�� -->
          	<input type="hidden" name="price" value="<%=v_dis_price%>">

<input type=hidden name=buyername size=20 value="<%=box.getSession("name")%>">


<table width="700" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="/images/user/game/apply/pop_tit_offlinemoney.gif" ></td>
  </tr>
  <tr>
    <td><table width="700" border="0" cellspacing="0" cellpadding="0">
        <tr background="/images/user/game/apply/pop_box_topbg.gif">
          <td width="22" height="10" valign="top" background="/images/user/game/apply/pop_box_topbg.gif"><img src="/images/user/game/apply/pop_box_toph.gif" width="22" height="10"></td>
          <td width="657" height="10" background="/images/user/game/apply/pop_box_topbg.gif"></td>
          <td width="21" height="10" align="right" background="/images/user/game/apply/pop_box_topbg.gif"><img src="/images/user/game/apply/pop_box_toptail.gif" width="21" height="10"></td>
        </tr>
        <tr>
          <td valign="top" background="/images/user/game/apply/pop_box_lbg.gif">&nbsp;</td>
          <td align="center" valign="top" bgcolor="#FFFFFF">
            <!-- �����ȳ� -->
            <table width="620" border="2" cellspacing="0" cellpadding="3" style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
              <tr  class="lcolor">
                <td height="3" class="tbl_gleft">                             "����" ��ư�� ������ ���� ������ �����ϰ� ��ȣȭ�ϱ� ���� �÷����� â�� ��µ˴ϴ�.<br>
                  �÷����ο��� �����ϴ� �ܰ迡 ���� ������ �Է��� �� <b>[���� ���� Ȯ��]</b> �ܰ迡�� <br>"Ȯ��" ��ư�� ������
                  ����ó���� ���۵˴ϴ�.<br>
              ���ȯ�濡 ���� �ټ� �ð��� �ɸ����� ������ ��������� ǥ�õɶ����� "����" ��ư�� �����ų� �������� �������� ���ð�
              ��ø� ��ٷ� �ֽʽÿ�.
</td>
              </tr>
            </table>
            <table width="620" border="2" cellspacing="0" cellpadding="3" style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
              <tr  class="lcolor">
                <td height="3" class="linecolor_app"></td>
                <td width="239" height="3" class="linecolor_app2"></td>
                <td width="90" height="3" class="linecolor_app"></td>
                <td width="152" height="3" class="linecolor_app2"></td>
              </tr>
              <tr>
                <td width="103" class="tbl_gtit2">�����</td>
                <td colspan="3" class="tbl_gleft"><%=v_bookname%></td>
              </tr>
              <tr>
                <td class="tbl_gtit2">�����</td>
                <td colspan="3" class="tbl_gleft"><strong><%=df.format(v_dis_price)%></strong></td>
              </tr>
              <tr>
                <td class="tbl_gtit2">EMAIL</td>
                <td colspan="3" class="tbl_gleft">
                              <input type=text name=buyeremail class="input" size=20 value="<%=box.getSession("email")%>">
              		<input type=hidden name=parentemail value="">
				</td>
              </tr>
              <tr>
                <td rowspan="2" class="tbl_gtit2">�̵���ȭ</td>
                <td colspan="3" class="tbl_gleft">
				&nbsp;<input type=text name="buyertel1" size=3 class="input" maxlength="3">-
            	<input type=text name="buyertel2" size=4 class="input" maxlength="4">-
            	<input type=text name="buyertel3" size=4 class="input" maxlength="4">
              	<input type=hidden name="buyertel">
				</td>
              </tr>
              <tr>
                <td colspan="3" class="tbl_gleft">
                * ���ڿ���� �̵���ȭ��ȣ�� �Է¹޴� ���� ������ �������� ������ <strong><font color="ff9c00">E-MAIL</font></strong> �Ǵ�
                <strong><font color="ff9c00">SMS</font></strong>�� �˷��帮�� �����̿���
                �ݵ�� �����Ͻñ� �ٶ��ϴ�.
				</td>
              </tr>
              <tr>
                <td class="tbl_gtit2">������ ����</td>
                <td colspan="3" class="tbl_gleft">
                    <input type="text" class="input" name="p_receive" maxlength="10" value="<%=v_name%>">
                </td>
              </tr>
              <tr>
                <td class="tbl_gtit2">������ ��ȭ��ȣ</td>
                <td colspan="3" class="tbl_gleft">
                    <input type="text" class="input" name="p_phone" maxlength="14" value="<%=v_hometel%>">
                </td>
              </tr>
              <tr>
                <td class="tbl_gtit2">������ �����ȣ</td>
                <td colspan="3" class="tbl_gleft">
                    <input type="text" class="input" name="p_post1" maxlength="3" size="4" value="<%=v_post1%>" readOnly> -
                    <input type="text" class="input" name="p_post2" maxlength="3" size="4" value="<%=v_post2%>" readOnly>
                    <a href="javascript:searchPost()"><img src="/images/user/game/button/btn_zipcode.gif" align="absmiddle"width="87" height="18" border="0"> </a>
                </td>
              </tr>
              <tr>
                <td class="tbl_gtit2">������ �ּ�</td>
                <td colspan="3" class="tbl_gleft">
                    <input type="text" class="input" name="p_addr1" maxlength="100" size= "60" value="<%=v_addr%>"><br>
                    <input type="text" class="input" name="p_addr2" maxlength="100" size= "60" value="<%=v_addr2%>">
                </td>
              </tr>

              <tr>
                <td class="tbl_gtit2">�������</td>
                <td colspan="3" class="tbl_gleft">
                                  <img src="/images/user/game/account/spacer.gif" width="15" height="8">
                                  <input type="radio" name="paygubun" value="CARD" onClick="chkPayMethod();">
              �ſ�ī�� ����<br> <img src="/images/user/game/account/spacer.gif" width="15" height="8">
              <input type="radio" name="paygubun" value="DirectBANK" onClick="chkPayMethod();">
              �ǽð� ������ü<br> <img src="/images/user/game/account/spacer.gif" width="15" height="8">
              <input type="radio" name="paygubun" value="BankBook" onClick="chkPayMethod();">
              ������(�Աݰ��� : 361437-04-001935 �������� (��)�ѱ����ӻ�����߿�)<br>
              <input type="hidden" name="gopaymethod" value="">
                </td>
              </tr>

	         <tr id="IDBank" style="display:none">
	          	<td  height="25" align="center" bgcolor="ddd9cd">������ �Ա�</td>
	          	<td colspan="3" height="25" bgcolor="#FFFFFF">
	          		<table border=0>
	          			<!--tr>
	          				<td width=80>�Աݰ���</td>
	          				<td></td>
	          			</tr-->
	          			<tr>
	         				<td width=80>�Ա��ڸ�</td>
	          				<td><input type="text" class="input" name="p_accountname" value="<%=box.getSession("name")%>"></td>
						</tr>
	          			<tr>
	         				<td width=80>�Ա�����</td>
	          				<td><input type="text" class="input" name="p_paydate" maxlength="8" onkeydown="javascript:return numcheck(this)"> "-" ����(ex.20060130)</td>
						</tr>
	          		</table>
	          	</td>
	          </tr>

            </table>
            <table width="620" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td colspan="2" align="right">&nbsp;</td>
              </tr>
              <tr>
                <!--td colspan="2" align="right"><a href="javascript:input()"><img src="/images/user/game/button/btn_confirm.gif" width="48" height="21" border="0"></a> <a href="javascript:self.close();"><img src="/images/user/game/button/btn_close.gif" border="0"></a></td-->
                <td colspan="2" align=center><input type=image src="/images/user/game/account/b_setok.gif" width="54" height="21" border="0"></a> &nbsp;&nbsp;
                <a href="javascript:window.close();"><img src="/images/user/button/btn_cancel.gif" width="45" height="21" border="0"></a></td>
              </tr>
            </table></td>
          <td background="/images/user/game/apply/pop_box_rbg.gif">&nbsp;</td>
        </tr>
        <tr>
          <td valign="bottom" background="/images/user/game/apply/pop_box_lbg.gif"><img src="/images/user/game/apply/pop_box_boh.gif" width="22" height="21"></td>
          <td background="/images/user/game/apply/pop_box_bobg.gif">&nbsp;</td>
          <td valign="bottom" background="/images/user/game/apply/pop_box_rbg.gif"><img src="/images/user/game/apply/pop_box_botail.gif" width="21" height="21"></td>

        </tr>
      </table></td>
  </tr>
</table>

<!--
�������̵�.
�׽�Ʈ�� ��ģ ��, �߱޹��� ���̵�� �ٲپ� �ֽʽÿ�.
-->
<input type=hidden name=mid value="kocca00001">

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
<input type=hidden name=p_TID value="<%=request.getParameter("p_bookcode")%>">
<input type=hidden name=p_gubun value="<%=request.getParameter("p_gubun")%>">
<input type=hidden name=p_process value="<%=v_process%>">
</form>
</body>
</html>
<% } //Login Check%>