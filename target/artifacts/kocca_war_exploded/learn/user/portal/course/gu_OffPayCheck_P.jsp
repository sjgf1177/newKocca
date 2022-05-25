<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
//**********************************************************
//  1. ��      ��: �������� �����ý�û
//  2. ���α׷���: gu_OffPayCheck_P.jsp
//  3. ��      ��: �������� �����ý�û
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2010.01.18
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process = box.getString("p_process");

	String p_specials = box.get("p_specials");
	String p_action = box.get("p_action");
	String type = box.get("type");

	String p_listgubun = box.get("p_listgubun");
	String p_subj      = box.get("p_subj");
	String p_year      = box.get("p_year");
	String p_subjseq   = box.get("p_subjseq");
	String p_seq       = box.get("p_seq");

    String v_classname    = "";
    String v_area		  = "";
    String v_tid          = "";
    String v_goodname     = "";
    String v_buyername    = "";
    String v_buyertel     = "";
    String v_buyertel1    = "";
    String v_buyertel2    = "";
    String v_buyertel3    = "";
    String v_buyeremail   = "";
    String v_pgauthdate   = "";
    String v_edustart     = "";
    String v_eduend       = "";
    double v_price        = 0;
    double v_biyong       = 0;
    double v_total_biyong = 0;
    String v_subjnm       = "";
    
    ArrayList list = (ArrayList)request.getAttribute("offpayInfo");

    if (list.size() > 0) {
        DataBox dbox   = (DataBox)list.get(0);
        v_classname    = dbox.getString("d_classname");
        v_area		   = dbox.getString("d_area");
        v_tid          = dbox.getString("d_tid");
        v_goodname     = dbox.getString("d_subjnm");
        v_buyername    = dbox.getString("d_buyername");
        v_buyertel     = dbox.getString("d_buyertel");
        v_buyeremail   = dbox.getString("d_buyeremail");
        v_pgauthdate   = dbox.getString("d_pgauthdate");
        v_pgauthdate   = FormatDate.getFormatDate(v_pgauthdate,"yyyy.MM.dd");
        v_edustart     = dbox.getString("d_edustart");
        v_eduend       = dbox.getString("d_eduend");
        v_edustart     = FormatDate.getFormatDate(v_edustart,"yyyy.MM.dd");
        v_eduend       = FormatDate.getFormatDate(v_eduend,"yyyy.MM.dd");
        v_total_biyong = dbox.getDouble("d_biyong");
        v_price        = dbox.getDouble("d_price");
        
        String[]	arrBuyertel	= v_buyertel.split("-");

    	//�޴���ȭ��ȣ ó��
    	v_buyertel		= v_buyertel.replace("-","");
    	if (v_buyertel.length() != 0) {
    		if (arrBuyertel.length == 3) {
    			v_buyertel1	= arrBuyertel[0];
    			v_buyertel2	= arrBuyertel[1];
    			v_buyertel3	= arrBuyertel[2];
    		} else {
    			if (v_buyertel.length() >= 3) v_buyertel1	= v_buyertel.substring(0,3);
    			if (v_buyertel.length() >= 7) {
    				v_buyertel2	= v_buyertel.substring(3,7);
    			} else if (v_buyertel.length() > 3 && v_buyertel.length() <= 7) {
    				v_buyertel2	= v_buyertel.substring(3,v_buyertel.length());
    			}
    			if (v_buyertel.length() > 7) v_buyertel3	= v_buyertel.substring(7);
    		}
    	}
    }
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>��������Ȯ��</title>
<link rel="stylesheet" type="text/css" href="/css/portal/base.css" />
<script language=javascript src="http://plugin.inicis.com/pay40.js"></script>
<script type="text/javascript" src="/script/portal/common.js"></script>
<script type="text/javascript" src="/namo_cross/js/namo_scripteditor.js"></script> 
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type='text/javascript' src='/script/user_patch.js'></script>
<script type="VBScript" src="/script/cresys_lib.vbs"></script>  

<script language=javascript>
StartSmartUpdate();
</script>
<!--
�� ���� ��
 ��� �ڹٽ�ũ��Ʈ�� ������������ ���� �����ϽǶ� ���������� ������ ��ġ����
 �����Ͽ��� ���Ͽ� �߻��Ҽ� �ִ� �÷����� ������ �̿��� ������ �� �ֽ��ϴ�.

  <script language=javascript src="http://plugin.inicis.com/pay40.js"></script>
  <script language=javascript>
  StartSmartUpdate();	// �÷����� ��ġ(Ȯ��)
  </script>
-->
<script language="JavaScript">
<!--//
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
		document.ini.price.value = document.ini.price.value.replace(/\,/gi,"");
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
				frm.quotabase.value = "����:�Ͻú�:3����:4����:5����:6����:7����:8����:9����:10����:11����:12����";
				//frm.quotabase.value = "�Ͻú�";

			}


			if (MakePayMessage(frm))
			{
				disable_click();
				//openwin = window.open("/inicis/childwin.html","childwin","width=299,height=149");
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
		top.window.focus();
}

function fnCancel() {
	if(confirm('������ ����Ͻðڽ��ϱ�?')) {
		top.window.close();
	  }
}
//-->
</script>
</head>
<!--
�� ���� ��
 �Ʒ��� body TAG�� �����߿�
 onload="javascript:enable_click()" onFocus="javascript:focus_control()" �� �κ��� �������� �״�� ���.
 �Ʒ��� form TAG���뵵 �������� �״�� ���.
-->
<body onload="javascript:enable_click()" onFocus="javascript:focus_control()" id="popup"><!-- popup size : 400*277 -->
<form name="f1" method="post">
	<input type="hidden" name="p_process"/>
</form>
<!-- ******************************** ��ũ��Ʈ���� ******************************** -->
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->
<!-- form ���� -->
<!-- <form name=ini method=post action="/inicis/INIsecurepay.jsp" onsubmit="return pay(this)"> -->
<form name=ini method=post action="/servlet/controller.bill.OffBillServlet" onsubmit="return pay(this)">
	<input type="hidden" name="gopaymethod" value=""/>
	<input type=hidden name=goodname size=20 value="<%=v_goodname%>"/> <!-- ��ǰ�� -->
	<input type="hidden" name="ispointuse" value="N"/>
	<input type="hidden" name="point" value="0"/>
	<input type="hidden" name="p_gubun" value="N"/><!-- ����(N:�Ϲ�,P:��Ű��,B:����)  -->
	<input type="hidden" name="price" value="<%= new java.text.DecimalFormat("###,###,##0").format(v_price) %>"/>
	<input type="hidden" name="tem_grcode" value="<%=box.getSession("tem_grcode")%>"/>

	<input type="hidden" name="type"	value="<%=type%>"/>
	<input type="hidden" name="p_process"	value="securepay"/>
	<input type="hidden" name="p_rprocess"	value=""/>
	
	<input type="hidden" name="p_listgubun" value="<%= p_listgubun %>"/>
	<input type="hidden" name="p_subj"      value="<%= p_subj %>"/>
	<input type="hidden" name="p_year"      value="<%= p_year %>"/>
	<input type="hidden" name="p_subjseq"   value="<%= p_subjseq %>"/>
	<input type="hidden" name="p_seq"       value="<%= p_seq %>"/>
	
	<input type="hidden" name="p_area"       value="<%= v_area %>"/>

	<div id="pop_header">
		<h1><img src="/images/portal/popup/myclass_h1_tit1.gif" alt="��������Ȯ��" /></h1>
	</div>
	<div id="pop_container">
		<div id="contentwrap" class="message_top">
			<ul class="basket_tab">
				<li><img src="/images/portal/myclass/basket_off_tab1_on.gif" alt="��������Ȯ��" /></li>
				<li><img src="/images/portal/myclass/basket_off_tab2_off.gif" alt="�����Ϸ�" /></li>
			</ul>
			
			<p class="myclass_basket_txt">������ư�� ������ ���� ������ �����ϰ� ��ȣȭ�ϱ� ���� �÷����� â�� ��µ˴ϴ�. �÷����ο��� �����ϴ� �ܰ迡 ���� ������<br /> �Է��� �� [���� ���� Ȯ��] �ܰ迡�� Ȯ�ι�ư�� ������ ����ó���� �˴ϴ�. ���ȯ�濡 ���� �ټ� �ð��� �ɸ����� ������ ���������<br /> ǥ�õɶ����� ������ư�� �����ų� �������� �������� ���ð� ��ø� ��ٷ� �ֽʽÿ�.</p>
			
			<h3 class=" mg_t30"><img src="/images/portal/myclass/stit_basket1.gif" alt="��û����" /></h3>
			<table class="board_list">
			<colgroup><col width="110px" /><col width="340px" /><col width="150px" /><col width="90px" /></colgroup>
			<thead>
			<tr class="myclass">
				<th><p>�з�</p></th>
				<th><p>������</p></th>
				<th><p>�����Ⱓ</p></th>
				<th class="end"><p>������</p></th>
			</tr>
			</thead>
			<tbody>
			<tr onmouseover="className='over'" onmouseout="className=' '">
				<td><%= v_classname %></td>
				<td class="ta_l"><a href=""><strong><%= v_goodname %></strong></a></td>
				<td class="num"><%= v_edustart %> ~ <%= v_eduend %></td>
				<td class="ta_r num"><strong><%= new java.text.DecimalFormat("###,###,##0").format(v_total_biyong) %>��</strong></td>
			</tr>
			</tbody>
			</table>
			
			<h3 class=" mg_t30"><img src="/images/portal/myclass/stit_basket3.gif" alt="�� �����ݾ�" /></h3>
			<table class="view_myclass">
			<colgroup><col width="15%" /><col width="85%" /></colgroup>
			<tr>
				<th>�� �����ݾ�</th>
				<td colspan="3" class="end"><%= new java.text.DecimalFormat("###,###,##0").format(v_price) %>��</td>
			</tr>
			</table>
			
			<h3 class=" mg_t30"><img src="/images/portal/myclass/stit_basket5.gif" alt="������ ����" /></h3>
			<table class="view_myclass">
			<colgroup><col width="15%" /><col width="35%" /><col width="15%" /><col width="35%" /></colgroup>
			<tr>
				<th>����</th>
				<td colspan="3" class="end"><input type=hidden name="buyername" value="<%= v_buyername %>"/><%= v_buyername %></td>
			</tr>
			<tr>
				<th>�̸���</th>
				<td><input type="text" name="buyeremail" class="inbox" style="width:162px;" value="<%= v_buyeremail %>" /></td>
				<th>�޴���ȭ</th>
				<td class="end">
					<input type="hidden" name="buyertel" id="buyertel" value="<%= v_buyertel %>" />
					<input type="text" onchange="$('#buyertel').val($('#buyertel1').val()+'-'+$('#buyertel2').val()+'-'+$('#buyertel3').val());" class="inbox" name="buyertel1" id="buyertel1" style="width:38px;" maxlength="3" value="<%= v_buyertel1 %>" />-
					<input type="text" onchange="$('#buyertel').val($('#buyertel1').val()+'-'+$('#buyertel2').val()+'-'+$('#buyertel3').val());" class="inbox" name="buyertel2" id="buyertel2" style="width:38px;" maxlength="4" value="<%= v_buyertel2 %>" />-
					<input type="text" onchange="$('#buyertel').val($('#buyertel1').val()+'-'+$('#buyertel2').val()+'-'+$('#buyertel3').val());" class="inbox" name="buyertel3" id="buyertel3" style="width:38px;" maxlength="4" value="<%= v_buyertel3 %>" />
				</td>
			</tr>
			</table>
			<p class="board_basket_comment">���ڿ���� �̵���ȭ��ȣ �Է��� ������ �������� ������ E-MAIL �Ǵ� SMS�� �˷��帮�� �����̿��� �ݵ�� �����Ͻñ� �ٶ��ϴ�.</p>
			
			<h3 class=" mg_t30"><img src="/images/portal/myclass/stit_basket6.gif" alt="��������" /></h3>
			<table class="view_myclass">
			<colgroup><col width="15%" /><col width="85%" /></colgroup>
			<tr>
				<th>�������</th>
				<td class="end">
					<input name="paygubun" type="radio" value="CARD" value="radiobutton" id="paygubun" checked/>�ſ�ī��
					<input name="paygubun" value="DirectBANK" type="radio" value="radiobutton" id="paygubun" class="mg_l35" />�ǽð� ������ü
				<!--	<input name="radiobutton" type="radio" value="radiobutton" class="mg_l35" />������ -->
				</td>
			</tr>
			<tr>
				<th>�����ݾ�</th>
				<td class="end"><strong><em><%= new java.text.DecimalFormat("###,###,##0").format(v_price) %></em> ��</strong></td>
			</tr>
			</tr>
			</table>
		</div>
	</div>
	<div id="pop_footer" style="height:57px;">
		<p class="f_btn"><a href="javascript:if(pay(document.ini)) document.ini.submit();" class="btn_account"><span>�����ϱ�</span></a><a href="javascript:fnCancel();" class="btn_account_gr"><span>���</span></a></p>
	</div>

<!--
�������̵�.
�׽�Ʈ�� ��ģ ��, �߱޹��� ���̵�� �ٲپ� �ֽʽÿ�.
-->
<%
		String area			= box.get("p_area");
		String mid = null;
		if ( area.equals("G0") ) {			// ���� mallId kocca00000
			mid	=	conf.getProperty("inipay.mid.realgame");
		} else if( area.equals("K0") ) {	// ���� mallId kocca00002
			mid	=	conf.getProperty("inipay.mid.realcontent");
		} else if( area.equals("B0") ) {	// ��� mallId kocca00004
			mid	=	conf.getProperty("inipay.mid.realbroad");
		} else {
			mid	=	conf.getProperty("inipay.mid.realgame");
		}
%>

<input type=hidden name=mid value="<%= mid %>"/>

<!--
ȭ�����
WON �Ǵ� CENT
���� : ��ȭ������ ���� ����� �ʿ��մϴ�.
-->
<input type=hidden name=currency value="WON"/>


<!--
������ �Һ�
�����ڷ� �Һθ� ���� : yes
�������Һδ� ���� ����� �ʿ��մϴ�.
ī��纰,�Һΰ������� �������Һ� ������ �Ʒ��� ī���ҺαⰣ�� ���� �Ͻʽÿ�.
�������Һ� �ɼ� ������ �ݵ�� �Ŵ����� �����Ͽ� �ֽʽÿ�.
-->
<input type=hidden name=nointerest value="no"/>


<!--
ī���ҺαⰣ
�� ī��纰�� �����ϴ� �������� �ٸ��Ƿ� �����Ͻñ� �ٶ��ϴ�.

value�� ������ �κп� ī����ڵ�� �ҺαⰣ�� �Է��ϸ� �ش� ī����� �ش�
�Һΰ����� �������Һη� ó���˴ϴ� (�Ŵ��� ����).
-->
<input type=hidden name=quotabase value="����:�Ͻú�"/> <!--:3����:4����:5����:6����:7����:8����:9����:10����:11����:12����-->


<!-- ��Ÿ���� -->
<!--
SKIN : �÷����� ��Ų Į�� ���� ��� - 6���� Į��(ORIGINAL, GREEN, ORANGE, BLUE, KAKKI, GRAY)
HPP : ������ �Ǵ� �ǹ� ���� ���ο� ���� HPP(1)�� HPP(2)�� ���� ����(HPP(1):������, HPP(2):�ǹ�).
Card(0): �ſ�ī�� ���ҽÿ� �̴Ͻý� ��ǥ �������� ��쿡 �ʼ������� ���� �ʿ� ( ��ü �������� ��쿡�� ī����� ��࿡ ���� ����) - �ڼ��� ������ �޴���  ����.
OCB : OK CASH BAG ���������� �ſ�ī�� �����ÿ� OK CASH BAG ������ �����Ͻñ� ���Ͻø� "OCB" ���� �ʿ� �� �ܿ� ��쿡�� �����ؾ� �������� ���� �̷����.
RECEIPT : ���ݿ����� ������ ���Ͻô� ��� �߰��Ͻø� �÷����ο��� ���ݿ����� �߱��� ���� �������̽��� ���Ǽ� �ֽ��ϴ�
-->
<input type=hidden name=acceptmethod value="SKIN(ORIGINAL):HPP(1)"/> <!--:OCB-->

<!--
���� �ֹ���ȣ : �������Ա� ����(������� ��ü),��ȭ����(1588 Bill) ���� �ʼ��ʵ�� �ݵ�� ������ �ֹ���ȣ�� �������� �߰��ؾ� �մϴ�.
�������� �߿� �ǽð� ������ü �̿� �ÿ��� �ֹ� ��ȣ�� ��������� ��ȸ�ϴ� ���� �ʵ尡 �˴ϴ�.
���� �ֹ���ȣ�� �ִ� 40 BYTE �����Դϴ�.
-->
<input type=hidden name=oid size=40 value="mall_use_order_id"/>

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
<input type=hidden name=quotainterest value=""/>
<input type=hidden name=paymethod value=""/>
<input type=hidden name=cardcode value=""/>
<input type=hidden name=cardquota value=""/>
<input type=hidden name=rbankcode value=""/>
<input type=hidden name=reqsign value="DONE"/>
<input type=hidden name=encrypted value=""/>
<input type=hidden name=sessionkey value=""/>
<input type=hidden name=uid value=""/>
<input type=hidden name=sid value=""/>
<input type=hidden name=version value=4000/>
<input type=hidden name=clickcontrol value=""/>

</form>
</body>
</html>