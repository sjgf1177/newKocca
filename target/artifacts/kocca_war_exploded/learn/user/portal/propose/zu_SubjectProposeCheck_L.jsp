<%
//**********************************************************
//  1. ��	  ��: SUBJECT LIST
//  2. ���α׷���: zu_Subject_L.jsp
//  3. ��	  ��: ������ȸ
//  4. ȯ	  ��: JDK 1.3
//  5. ��	  ��: 1.0
//  6. ��	  ��: 2004.01.14
//  7. ��	  ��:
//***********************************************************
%>
<%!
	private void append(StringBuffer list, DataBox dbox) {
		/*list.append("<tr onmouseover=\"className='over'\" onmouseout=\"className=' '\">\n");
		list.append("	<td><input type='hidden' name='p_subj' value='" + dbox.get("d_subj") + "'/>" + dbox.get("d_classname") + "</td>\n");
		list.append("	<td class=\"ta_l\"><a href=\"\"><strong>" + dbox.get("d_subjnm") + "</strong></a></td>\n");
		list.append("	<td class=\"num\">" + dbox.getDate("d_edustart") + "~" + dbox.getDate("d_edustart") + "</span></td>\n");
		list.append("	<td class=\"ta_r num\"><strong class=\"myclass\">" + dbox.getCommaInt("d_biyong") + "��</strong></td>\n");
		list.append("</tr>\n");//*/
		list.append("<tr onmouseover=\"className='over'\" onmouseout=\"className=' '\">\n");
		list.append("	<td><input type='hidden' name='p_subj' value='");
		list.append(dbox.get("d_subj"));
		list.append("'/>");
		list.append("<input type='hidden' name='p_subjseq' value='");
		list.append(dbox.get("d_subjseq"));
		list.append("'/>");
		list.append("<input type='hidden' name='p_year' value='");
		list.append(dbox.get("d_year"));
		list.append("'/>");        
		list.append(dbox.get("d_classname"));
		list.append("</td>\n");
		list.append("	<td class=\"ta_l\"><a href=\"\"><strong>");
		list.append(dbox.get("d_subjnm"));
		list.append("</strong></a></td>\n");
		list.append("	<td class=\"num\">");
		list.append(dbox.getDate("d_edustart"));
		list.append("~");
		list.append(dbox.getDate("d_eduend"));
		list.append("</span></td>\n");
		list.append("	<td class=\"ta_r num\"><strong class=\"myclass\">");
		list.append(dbox.getCommaInt("d_biyong"));
		list.append("��</strong></td>\n");
		list.append("</tr>\n");
	}
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
	String p_specials = box.get("p_specials");
	String p_action = box.get("p_action");
	String type = box.get("type");
	String v_goodname = null;
	if (box == null) box = RequestManager.getBox(request);
	DataBox resultbox = (DataBox) request.getAttribute("resultbox");
	List<DataBox> proposeResultList = (List<DataBox>)resultbox.getObject("proposeResultList");		 // ���� ����Ʈ
	StringBuffer listY = new StringBuffer();
	StringBuffer listN = new StringBuffer();
	if (proposeResultList!=null) {
		for(DataBox dbox : proposeResultList) {
			if(v_goodname == null) {
				v_goodname = dbox.get("d_subjnm");
			}
			if (dbox.get("d_chkfirst").equals("Y")) {
				append(listY, dbox);
			}
			else {
				append(listN, dbox);
			}
		}
		if (proposeResultList.size()>1) v_goodname += "�� " + (proposeResultList.size()-1) + "��";
	}
	String[]phone = resultbox.getStringArray("d_handphone", "-");
	%>
<%@ include file="/learn/user/portal/include/site_info.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>�ѱ���������ī����</title>
<link href="/css/portal/homepage_renewal/style.css" rel="stylesheet" type="text/css" />
<link href="/css/portal/homepage_renewal/member.css" rel="stylesheet" type="text/css" />
<script language=javascript src="http://plugin.inicis.com/pay40.js"></script>
<script type="text/javascript" src="/script/portal/common.js"></script>
<script type="text/javascript" src="/namo_cross/js/namo_scripteditor.js"></script> 
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type='text/javascript' src='/script/user_patch.js'></script>
<script language="javascript" src="/script/mainscript.js"></script>
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
		document.ini.price.value = document.ini.price.value.replace(",","");
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
		openwin.focus();
}

function fnCancel() {
	if(confirm('������ ����Ͻðڽ��ϱ�?')) {
		menuForward('3','18');
	}
}

//���� ���뺸��
function whenSubjInfo(subj,subjnm,courseyn,upperclass,upperclassnm, year, subjseq){
document.form1.p_subj.value = subj;
document.form1.p_subjnm.value = subjnm;
document.form1.p_iscourseYn.value = courseyn;
document.form1.p_upperclass.value = upperclass;
document.form1.p_upperclassnm.value = upperclassnm;
document.form1.p_year.value = year;
document.form1.p_subjseq.value = subjseq;
document.form1.p_process.value = 'SubjectPreviewPage';
document.form1.p_rprocess.value = 'SubjectList';
document.form1.action='/servlet/controller.propose.ProposeCourseServlet';
document.form1.target = "_self";
document.form1.submit();
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
<body onload="javascript:enable_click()" onFocus="javascript:focus_control()">
<form name="f1" method="post">
	<input type="hidden" name="p_process"/>
</form>
<!-- accessibility_menu -->
<ul id="accessibility_menu">
    <li><a href="#content">�������� �Ѿ��</a></li>
    <li><a href="#header">�� �޴��� �Ѿ��</a></li>
    <li><a href="#banner">�ؽ�Ʈ���ʷ� �Ѿ��</a></li>
    <li><a href="#footer">ī�Ƕ����ͷ� �Ѿ��</a></li>
</ul>
<!--// accessibility_menu -->
<hr />

<!-- header -->
<script language="javascript">
    
</script>

<%@ include file="/learn/user/portal/include/common.jsp" %>

<div id="header">
    <!-- Top Warp ���� -->
	<%@ include file="/learn/user/portal/include/topWarp.jsp" %>
	<!-- Top Warp ���� -->
	
	<!-- Top Menu ���� -->
	<%@ include file="/learn/user/portal/include/topMenu.jsp" %>
    <!-- Top Menu ���� -->	

    <!-- Top Visual ���� -->
    <%@ include file="/learn/user/portal/include/topVisual.jsp" %>
    <!-- Top Visual ���� -->
</div>

<!--// header -->
<hr />
<!-- container -->
<div id="container">
    <div id="contentWrap">
        <!-- ����޴����� -->
        <%@ include file="/learn/user/portal/include/subMenu.jsp"%>
        <!-- ����޴��������� -->

<!-- content ���� -->
        <div id="content">

<!-- ******************************** ��ũ��Ʈ���� ******************************** -->
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->
<!-- form ���� -->
<!-- <form name=ini method=post action="/inicis/INIsecurepay.jsp" onsubmit="return pay(this)"> -->
<form name=ini method=post action="/servlet/controller.bill.BillServlet" onsubmit="return pay(this)">

<!-- <form name="form1" action="/servlet/controller.propose.ProposeCourseServlet" method="post"> -->
	<input type="hidden" name="gopaymethod" value=""/>
	<input type="hidden" name=goodname size=20 value="<%=v_goodname%>"/> <!-- ��ǰ�� -->
	<input type="hidden" name="p_dis"	value="<%=box.get("p_dis")%>"/>
	<input type="hidden" name="ispointuse" value="N"/>
	<input type="hidden" name="point" value="0"/>
	<input type="hidden" name="p_gubun" value="N"/><!-- ����(N:�Ϲ�,P:��Ű��,B:����)  -->
	<input type="hidden" name="price" value="<%= box.getCommaInt("totalPrice") %>"/>
	<input type="hidden" name="tem_grcode" value="<%=box.getSession("tem_grcode")%>"/>

	<input type="hidden" name="type"	value="<%=type%>"/>
	<input type="hidden" name="p_process"	value="securepay"/>
	<input type="hidden" name="p_rprocess"	value=""/>
	<input type="hidden" name="totalPrice" value="<%= box.get("totalPrice") %>"/>
	<input type="hidden" name="usePoint" value="<%= box.get("usePoint") %>"/>
	
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
        <td><img src="/images/portal/homepage_renewal//myclass/stitle_06.gif" alt="��ٱ���" /></td>
        <td class="h_road">Home &gt; ���� ���ǽ�  &gt; <strong>��ٱ���</strong></td>
      </tr>
      <tr>
        <td height="12" colspan="2"></td>
        </tr>
      <tr>
        <td height="1" colspan="2" bgcolor="E5E5E5"></td>
      </tr>
    </table>
    <!--Ÿ��Ʋ�κ�//-->
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/images/portal/homepage_renewal//myclass/toff_01.jpg" name="Image49" id="Image49" /></td>
    <td><img src="/images/portal/homepage_renewal//myclass/ton_02.jpg" name="Image50"  id="Image50" /></td>
    <td class="h_road" ><img src="/images/portal/homepage_renewal//myclass/toff_03.jpg" name="Image51" id="Image51" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="org">* ������ �Ϸ�Ǿ� ������û�� �Ϸ�˴ϴ�.</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="org">* �������� ������ ��� 1�� ���� ��, ����������� ��ȸ/���Ρ����� ������ �����Ͽ� �ֽñ� �ٶ��ϴ�.</td>
        <!-- <td class="h_road"><img src="/images/portal/homepage_renewal//myclass/btn_offline_ok.jpg" /></td>  -->
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="20" height="40"><img src="/images/portal/homepage_renewal/common/icon_blue.jpg"/></td>
        <td><img src="/images/portal/homepage_renewal/myclass/sstitle_02.gif"/></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
          <td height="1" colspan="5" bgcolor="#7692CB"></td>
        </tr>
      <tr>
        <td class="tit_table">�з�</td>
        <td class="tit_table"> ������ </td>
        <td class="tit_table">�����Ⱓ</td>
        <td class="tit_table_right">������</td>
      </tr>
      <%if (proposeResultList!=null) {
  		for(DataBox dbox : proposeResultList) { %>  		
      <tr>      	
        <td class="ct_tit_table"><%=dbox.getString("d_classname") %></td>
        <td class="ct_tit_table_left"><%=dbox.getString("d_subjnm") %></td>
        <td class="ct_tit_table"><%=dbox.getString("d_edustart") %>~<%=dbox.getString("d_eduend") %></td>
        <td class="ct_tit_table_right"><%=dbox.getString("d_biyong") %>��</td>
      </tr>
      <tr>
      	<td><input type="hidden" name="p_subj"	value="<%=dbox.getString("d_subj") %>"/></td>
      	<td><input type="hidden" name="p_subjseq"	value="<%=dbox.getString("d_subjseq") %>"/></td>
      	<td><input type="hidden" name="p_year"	value="<%=dbox.getString("d_year") %>"/></td>
      </tr>
      <%} } %>
    </table>

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="1" bgcolor="CACACA"></td>
      </tr>
	  <tr>
        <td height="10" bgcolor="ffffff"></td>
      </tr>
    </table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="20" height="40"><img src="/images/portal/homepage_renewal//common/icon_blue.jpg"/></td>
        <td><img src="/images/portal/homepage_renewal//myclass/sstitle_02_2.gif"/></td>
      </tr>
    </table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
          <td height="1" colspan="2" bgcolor="#7692CB"></td>
        </tr>
      <tr>
        <td class="tit_table">����</td>
        <td class="ct_tit_table_lright"><input type=hidden name=buyername size=20 value="<%=resultbox.get("d_name")%>"/><%= resultbox.get("d_name") %></td>
      </tr>
      <tr>
        <td class="tit_table">�̸���</td>
        <td class="ct_tit_table_lright"><input type=hidden name=parentemail value=""/>
					<input type="text" class="inbox" name="buyeremail" id="buyeremail" style="width:162px;" value="<%= resultbox.get("d_email") %>" /></td>
      </tr>
      <tr>
        <td class="tit_table">�޴���ȭ</td>
        <td class="ct_tit_table_lright"><input type="hidden" name="buyertel" id="buyertel" value="<%= resultbox.get("d_handphone") %>" />
					<input type="text" onchange="$('#buyertel').val($('#buyertel1').val()+'-'+$('#buyertel2').val()+'-'+$('#buyertel3').val());" class="inbox" name="buyertel1" id="buyertel1" style="width:38px;" maxlength="3" value="<%= phone[0] %>" />-
					<input type="text" onchange="$('#buyertel').val($('#buyertel1').val()+'-'+$('#buyertel2').val()+'-'+$('#buyertel3').val());" class="inbox" name="buyertel2" id="buyertel2" style="width:38px;" maxlength="4" value="<%= phone[1] %>" />-
					<input type="text" onchange="$('#buyertel').val($('#buyertel1').val()+'-'+$('#buyertel2').val()+'-'+$('#buyertel3').val());" class="inbox" name="buyertel3" id="buyertel3" style="width:38px;" maxlength="4" value="<%= phone[2] %>" /></td>
      </tr>
    </table>

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="1" bgcolor="CACACA"></td>
      </tr>
      <tr>
        <td height="3" bgcolor="ffffff"></td>
      </tr>

	  <tr>
		<td class="txt">* �������� ������ ��� 1�� ���� ��, ����������� ��ȸ/���Ρ����� ������ �����Ͽ� �ֽñ� �ٶ��ϴ�.</td>
	  </tr>
	  <tr>
        <td height="10" bgcolor="ffffff"></td>
      </tr>
    </table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="20" height="40"><img src="/images/portal/homepage_renewal//common/icon_blue.jpg"/></td>
        <td><img src="/images/portal/homepage_renewal//myclass/sstitle_02_3.gif"/></td>
      </tr>
    </table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
          <td height="1" colspan="2" bgcolor="#7692CB"></td>
        </tr>
        <% if( Integer.parseInt(box.getString("totalPrice")) > 0 ) { %>	
      <tr>
        <td class="tit_table">�������</td>
        <td class="ct_tit_table_lright"><input name="paygubun" type="radio" value="CARD" value="radiobutton" id="paygubun" checked/>�ſ�ī��
					<input name="paygubun" value="DirectBANK" type="radio" value="radiobutton" id="paygubun" class="mg_l35" />�ǽð� ������ü
				<!--	<input name="radiobutton" type="radio" value="radiobutton" class="mg_l35" />������ --></td>
      </tr>
      <tr>
        <td class="tit_table">�����ݾ�</td>
        <td class="ct_tit_table_lright"><span class="rtxt"><strong><%= box.getCommaInt("totalPrice") %></strong></span></td>
      </tr>
      <%}else{ %>
      <tr>
        <td class="tit_table">�������</td>
        <td class="ct_tit_table_lright">����</td>
      </tr>
      <tr>
        <td class="tit_table">�����ݾ�</td>
        <td class="ct_tit_table_lright"><span class="rtxt"><strong><%= box.getCommaInt("totalPrice") %></strong></span></td>
      </tr>
      <%} %>
    </table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="1" bgcolor="CACACA"></td>
      </tr>
      <tr>
        <td height="4" bgcolor="F7F7F7"></td>
      </tr>
	</table>



    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
      <% if( Integer.parseInt(box.getString("totalPrice")) > 0 ) { %>	
        <td><div align="center"><a href="javascript:if(pay(document.ini)) document.ini.submit();"><img src="/images/portal/homepage_renewal//myclass/btn_pok.jpg" alt="�����ϱ�"  /></a></div></td>
        <%}else{ %>
        <td><div align="center"><a href="javascript:document.ini.submit();"><img src="/images/portal/homepage_renewal//myclass/btn_pok.jpg" alt="�����ϱ�"  /></a></div></td>
        <%} %>
      </tr>
    </table></td>
    <td width="20">&nbsp;</td>
    
  </tr>
</table>
      	
      	<%}else{ %>
			<h2><img src="/images/portal/myclass/h2_tit3.gif" alt="��ٱ���" class="fl_l" /><p class="category">Home &gt; ���ǰ��ǽ� &gt; <strong>��ٱ���</strong></p></h2>
			<ul class="basket_tab">
				<li><img src="/images/portal/myclass/basket_tab1_2.gif" alt="1.��û��� Ȯ��" /></li>
				<li><img src="/images/portal/myclass/basket_tab2_on.gif" alt="2.�������� Ȯ��" /></li>
				<li><img src="/images/portal/myclass/basket_tab3.gif" alt="3.�����Ϸ�" /></li>
			</ul>

	
			<ul class="basket_info">
				<li>������ư�� ������ ���� ������ �����ϰ� ��ȣȭ�ϱ� ���� �÷����� â�� ��µ˴ϴ�.</li> 
				<li>�÷����ο��� �����ϴ� �ܰ迡 ���� ������ �Է��� �� [���� ���� Ȯ��] �ܰ迡�� Ȯ�ι�ư�� ������ ����ó���� �˴ϴ�. </li>
				<li>���ȯ�濡 ���� �ټ� �ð��� �ɸ����� ������<br />
				��������� ǥ�õɶ����� ������ư�� �����ų� �������� �������� ���ð� ��ø� ��ٷ� �ֽʽÿ�.</li>
			</ul>
	<h3 class=" mg_t30"><img src="/images/portal/myclass/stit_basket1.gif" alt="��û����" /></h3>

<div id="listY">
	<table class="board_list">
	<colgroup><col width="110px" /><col width="270px" /><col width="150px" /><col width="90px" /><col width="70px" /></colgroup>
	<thead>
		<tr class="myclass">
			<th><p>�з�</p></th>
			<th><p>������</p></th>
			<th><p>�����Ⱓ</p></th>
			<th class="end"><p>������</p></th>
		</tr>
	</thead>
	<tbody>
		<%= listY.toString() %>
	</tbody>
	</table>
</div>
<!-- form �� -->
	
	<h3 class=" mg_t30"><img src="/images/portal/myclass/stit_basket3.gif" alt="�� �����ݾ�" /></h3>
	<table class="box_list">
	<colgroup><col width="175px" /><col width="175px" /><col width="175px" /><col width="175px" /></colgroup>
	<thead>
	<tr>
		<th>������</th>
		<th>��������</th>
		<th>����Ʈ���</th>
		<th>�ǰ��� �ݾ�</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td><%= box.getCommaInt("sumPrice") %> ��</td>
		<td>- <%= box.getCommaInt("discountPrice") %> ��</td>
		<td><input type='hidden' name='usePoint' value='<%= box.get("usePoint") %>'/>- <%= box.getCommaInt("usePoint") %> ��</td>
		<td><strong><em><input type='hidden' name='totalPrice' value='<%= box.get("totalPrice") %>'/><%= box.getCommaInt("totalPrice") %></em> ��</strong></td>
	</tr>
	</tbody>
	</table>
	
			<h3 class=" mg_t30"><img src="/images/portal/myclass/stit_basket5.gif" alt="������ ����" /></h3>
			<table class="view_myclass">
			<colgroup><col width="15%" /><col width="85%" /></colgroup>
			<tr>
				<th>����</th>
				<td class="end"><input type=hidden name=buyername size=20 value="<%=resultbox.get("d_name")%>"/><%= resultbox.get("d_name") %></td>
			</tr>
			<tr>
				<th>�̸���</th>
				<td class="end">
					<input type=hidden name=parentemail value=""/>
					<input type="text" class="inbox" name="buyeremail" id="buyeremail" style="width:162px;" value="<%= resultbox.get("d_email") %>" />
				</td>
			</tr>
			<tr>
				<th>�޴���ȭ</th>
				<td class="end">
					<input type="hidden" name="buyertel" id="buyertel" value="<%= resultbox.get("d_handphone") %>" />
					<input type="text" onchange="$('#buyertel').val($('#buyertel1').val()+'-'+$('#buyertel2').val()+'-'+$('#buyertel3').val());" class="inbox" name="buyertel1" id="buyertel1" style="width:38px;" maxlength="3" value="<%= phone[0] %>" />-
					<input type="text" onchange="$('#buyertel').val($('#buyertel1').val()+'-'+$('#buyertel2').val()+'-'+$('#buyertel3').val());" class="inbox" name="buyertel2" id="buyertel2" style="width:38px;" maxlength="4" value="<%= phone[1] %>" />-
					<input type="text" onchange="$('#buyertel').val($('#buyertel1').val()+'-'+$('#buyertel2').val()+'-'+$('#buyertel3').val());" class="inbox" name="buyertel3" id="buyertel3" style="width:38px;" maxlength="4" value="<%= phone[2] %>" />
				</td>
			</tr>
			</table>
			<p class="board_basket_comment">���ڿ���� �̵���ȭ��ȣ �Է��� ������ �������� ������ E-MAIL �Ǵ� SMS�� �˷��帮�� �����̿��� �ݵ�� �����Ͻñ� �ٶ��ϴ�.</p>
			
		<% if( Integer.parseInt(box.getString("totalPrice")) > 0 ) { %>	
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
				<td class="end"><strong><em><%= box.getCommaInt("totalPrice") %></em> ��</strong></td>
			</tr>
			</table>
			<p class="board_btn ag_c mg_t20"><a href="javascript:if(pay(document.ini)) document.ini.submit();" class="btn_account"><span>�����ϱ�</span></a><a href="javascript:fnCancel();" class="btn_account_gr"><span>���</span></a></p>
		<% } else { %>
			<h3 class=" mg_t30"><img src="/images/portal/myclass/stit_basket6.gif" alt="��������" /></h3>
			<table class="view_myclass">
			<colgroup><col width="15%" /><col width="85%" /></colgroup>
			<tr>
				<th>�������</th>
				<td class="end">
					����
				</td>
			</tr>
			<tr>
				<th>�����ݾ�</th>
				<td class="end"><strong><em><%= box.getCommaInt("totalPrice") %></em> ��</strong></td>
			</tr>
			</table>
			<p class="board_btn ag_c mg_t20"><a href="javascript:document.ini.submit();" class="btn_account"><span>�����ϱ�</span></a><a href="javascript:fnCancel();" class="btn_account_gr"><span>���</span></a></p>
		<% } %>
		
		<%} %>

<!--
�������̵�.
�׽�Ʈ�� ��ģ ��, �߱޹��� ���̵�� �ٲپ� �ֽʽÿ�.
-->
<input type=hidden name=mid value="<%= conf.getProperty("inipay.mid.real") %>"/>


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

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->
