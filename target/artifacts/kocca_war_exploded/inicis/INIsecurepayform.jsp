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

	String  v_isevent   = box.getSession("isevent");	//������ 50% ����ȸ�� ����

	int v_billprice = 0;

	ArrayList list1 = null;

	String v_gubun = box.getString("p_gubun");

	AccountManagerBean bean = new AccountManagerBean();

	ProposeCourseBean bean2  = new ProposeCourseBean();

	if (v_gubun.equals("N")) { //�Ϲݰ���
		list1 = bean.selectBasketSubj(box);
	} else if (v_gubun.equals("P")) { //��Ű������
		list1 = bean.selectBasketPackage(box);
	} else if (v_gubun.equals("B")) { //����
		list1 = bean.selectBasketBook(box);
	}

	String v_goodname = "";

	//����
	String v_name    = "";
    String v_post1   = "";
    String v_post2   = "";
    String v_addr    = "";
    String v_addr2   = "";
    String v_hometel = "";



	// �̺�Ʈ �κ� start
	String  s_userid = box.getSession("userid");
	String currentDate = new java.text.SimpleDateFormat("yyyyMMdd", new java.util.Locale("en", "US")).format(new java.util.Date());
	int iCurrentDate = Integer.parseInt(currentDate);
	// �̺�Ʈ �κ� end
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
		IDBank.style.display = "none";
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
<form name=ini method=post action="/inicis/INIsecurepay.jsp" onSubmit="return pay(this)">

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

		<!-- ��ǰ ����Ʈ ���� -->
	<% if (v_gubun.equals("N")) { //�Ϲݰ��� %>
			<!-- �Ϲݰ��� ����  -->
	<table width="508" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="5">�Ϲݰ���
	  </td>
      </tr>
    </table>

	<table width="508" border="0" cellpadding="0" cellspacing="1" bgcolor="c1bba5">
      <tr>
        <td height="25" width="50" align="center" bgcolor="ddd9cd">NO</td>
        <td height="25" align="center" bgcolor="ddd9cd">������</td>
        <td width="50" align="center" bgcolor="ddd9cd">����</td>
        <td width="100" align="center" bgcolor="ddd9cd">������</td>
      </tr>
	  <% int v_sumprice = 0;
	  	 int v_dcrate = 0;
	  	 String v_firstSubjnm = "";

	  	 int v_pricecnt = 0;

	  	 for (int i=0; i<list1.size(); i++) {
	  		DataBox dbox = (DataBox)list1.get(i);

	  		if (i==0) { v_firstSubjnm = dbox.getString("d_subjnm"); }

	  		String v_subjnm   = dbox.getString("d_subjnm");
	  		String v_subj	  = dbox.getString("d_subj");
	  		String v_year	  = dbox.getString("d_year");
	  		String v_subjseq  = dbox.getString("d_subjseq");
	  		String v_edustart = dbox.getString("d_edustart");
	  		String v_eduend   = dbox.getString("d_eduend");
	  		int    v_price	  = dbox.getInt("d_price");

	  		if (v_price>0) v_pricecnt++;

			if(v_tem_grcode.equals("N000002") && v_isevent.equals("Y") && (s_userid.equals("gameacademy") || (iCurrentDate >= 20090605 && iCurrentDate <= 20090731))) {
	  			v_price = 10000;
	  		}

	  		v_sumprice += v_price;
	  %>
	  <tr>
        <td height="25" align="center" bgcolor="#FFFFFF"><%=i+1%></td>
        <td bgcolor="#FFFFFF" class="tbl_gleft" style="padding-left:10px;"><%=v_subjnm%></td>
        <td height="25" align="center" bgcolor="#FFFFFF"><%=v_subjseq%></td>
        <td height="25" colspan="2" align="center" bgcolor="#FFFFFF"><%=new java.text.DecimalFormat("###,###,##0").format(v_price)%></td>
      </tr>
	<% } %>

	<% if (list1.size()==0) { %>
	<tr>
	  <td colspan=4 align=center>��ϵ� ������ �����ϴ�.</td>
	</tr>
	<% } %>

	<tr>
        <td height="25" colspan="5" align="center" bgcolor="#FFFFFF">&nbsp;</td>
        </tr>

      <tr>
        <td height="25" colspan="3" align="left" bgcolor="ddd9cd" style="padding-left:10px;">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</td>
        <td height="25" bgcolor="#FFFFFF"><img src="/images/user/game/account/spacer.gif" width="24" height="8">
        <%=new java.text.DecimalFormat("###,###,##0").format(v_sumprice)%>
        </td>
      </tr>
      <tr>
        <td height="25" colspan="3" align="left" bgcolor="ddd9cd" style="padding-left:10px;">��&nbsp;��&nbsp;��</td>
        <td height="25" bgcolor="#FFFFFF"><img src="/images/user/game/account/spacer.gif" width="24" height="8">
	<%
	if(v_tem_grcode.equals("N000002") && v_isevent.equals("Y") && (s_userid.equals("gameacademy") || (iCurrentDate >= 20090605 && iCurrentDate <= 20090731))) {
		out.print("0%"); v_dcrate = 0;
	} else {
		/*	50%���� �̺�Ʈ
         if (v_pricecnt==1) 	 { out.print("0%"); v_dcrate = 0; }
	  	 else if (v_pricecnt==2) { out.print("20%"); v_dcrate = 20; }
	  	 else if (v_pricecnt==3) { out.print("30%"); v_dcrate = 30; }
	  	 else if (v_pricecnt==4) { out.print("40%"); v_dcrate = 40; }
	  	 else if (v_pricecnt==5) { out.print("50%"); v_dcrate = 50; }
	  	 else { out.print("0%"); v_dcrate = 0; }
	  	 */
	  	 out.print("0%"); v_dcrate = 0;
	}
	  %>
	   </td>
      </tr>
      <tr>
        <td height="25" colspan="3" align="left" bgcolor="ddd9cd" style="padding-left:10px;">�����ݾ�</td>
        <td height="25" bgcolor="#FFFFFF"><img src="/images/user/game/account/spacer.gif" width="24" height="8">
	  	<%
        v_billprice = v_sumprice - (v_sumprice * v_dcrate / 100);
	  	out.print(new java.text.DecimalFormat("###,###,##0").format(v_billprice));
	  	%>
	  	</td>
      </tr>

	<tr>
        <td height="25" colspan="5" align="left" bgcolor="#FFFFFF" style="padding-left:10px;">��&nbsp;��&nbsp;�� :
         <%
         if (list1.size()>0) {
	  		if (list1.size()==1) {
	  			out.print(v_firstSubjnm);
	  			v_goodname = v_firstSubjnm;
	  		} else {
	  			v_goodname = v_firstSubjnm + " �� " + (list1.size() - 1) + "��";
	  			out.print(v_goodname);
	  		}
	     }
	  %>
        </td>
        </tr>


	</table>
	<!-- �Ϲݰ��� �� -->

	<% } else if (v_gubun.equals("P")) { //��Ű������ %>
	<!-- ���������� ���� -->
	<table width="508" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="5">����������</td>
          </tr>
        </table>
	<table width="508" border="0" cellpadding="0" cellspacing="1" bgcolor="c1bba5">
      <tr>
        <td height="25" width="50" align="center" bgcolor="ddd9cd">NO</td>
        <td height="25" align="center" bgcolor="ddd9cd" colspan=2>������</td>
        <td width="50" align="center" bgcolor="ddd9cd">����</td>
        <td width="100" align="center" bgcolor="ddd9cd">������</td>
      </tr>
	  <% int v_sumprice = 0;
		 String v_tmp_course   = "";
		 String v_course       = "";
		 String v_firstSubjnm = "";
		 int    v_coutsecnt   = 0;

	  	 for (int i=0; i<list1.size(); i++) {
	  		DataBox dbox = (DataBox)list1.get(i);

	  		if (i==0) { v_firstSubjnm = dbox.getString("d_scsubjnm"); }

	  		String v_scsubjnm   = dbox.getString("d_scsubjnm");
	  		String v_scsubj	  = dbox.getString("d_scsubj");
	  		String v_scyear	  = dbox.getString("d_scyear");
	  		String v_scsubjseq  = dbox.getString("d_scsubjseq");
	  		int    v_scbiyong  = dbox.getInt("d_scbiyong");
	  		int    v_subjcnt  = dbox.getInt("d_subjcnt");

	  		v_course        = dbox.getString("d_course");

	  		String v_subjnm   = dbox.getString("d_subjnm");
	  		String v_subj	  = dbox.getString("d_subj");
	  		String v_year	  = dbox.getString("d_year");
	  		String v_subjseq  = dbox.getString("d_subjseq");
	  		String v_edustart = dbox.getString("d_edustart");
	  		String v_eduend   = dbox.getString("d_eduend");
	  		int    v_price	  = dbox.getInt("d_price");



	  		if(!v_tmp_course.equals(v_course)) {
                v_tmp_course = v_course;
                v_sumprice += v_scbiyong;
                v_coutsecnt++;
                %>
		  <tr>
	        <td height="25" align="center" bgcolor="#FFFFFF" rowspan=<%=v_subjcnt%>><%=i+1%></td>
	        <td bgcolor="#FFFFFF" class="tbl_gleft" rowspan=<%=v_subjcnt%> style="padding-left:10px;"><%=v_scsubjnm%></td>
	        <td height="25" align="center" bgcolor="#FFFFFF" style="padding-left:10px;"><%=v_subjnm%></td>
	        <td height="25" align="center" bgcolor="#FFFFFF"><%=v_subjseq%></td>
	        <td height="25" align="center" bgcolor="#FFFFFF" rowspan=<%=v_subjcnt%>><%=new java.text.DecimalFormat("###,###,##0").format(v_scbiyong)%></td>
	      </tr>
	  	<% } else { %>
          <tr >
		     <td height="25" align="center" bgcolor="#FFFFFF" style="padding-left:10px;"><%=v_subjnm%></td>
		     <td height="25" align="center" bgcolor="#FFFFFF" style="padding-left:10px;"><%=v_subjseq%></td>
          </tr>
	  	<% }  %>
      <% } %>

		  <% if (list1.size()==0) { %>
			<tr>
			  <td colspan=5 align=center>��ϵ� ������ �����ϴ�.</td>
			</tr>
		  <% } %>

	<tr>
        <td height="25" colspan="4" align="left" bgcolor="ddd9cd" style="padding-left:10px;">�����ݾ�</td>
        <td height="25" bgcolor="#FFFFFF"><img src="/images/user/game/account/spacer.gif" width="24" height="8">
        <%v_billprice = v_sumprice;
	  	out.print(new java.text.DecimalFormat("###,###,##0").format(v_billprice));
	  %></td>
      </tr>

      <tr>
        <td height="25" colspan="5" align="center" bgcolor="#FFFFFF">&nbsp;</td>
        </tr>

      <tr>
        <td height="25" colspan="5" align="left" bgcolor="ddd9cd" style="padding-left:10px;">������ :
        <% if (list1.size()>0) {
	  		if (v_coutsecnt==1) {
	  			out.print(v_firstSubjnm);
	  			v_goodname = v_firstSubjnm;
	  		} else {
	  			v_goodname = v_firstSubjnm + " �� " + (v_coutsecnt - 1) + "��";
	  			out.print(v_goodname);
	  		}
	     }
	  %>
	  </td>
      </tr>
    </table>
	<!-- ���������� �� -->

	<% } else if (v_gubun.equals("B")) { //����

	  	 String v_firstSubjnm = "";
	  	 int    v_coutsecnt   = 0;

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

	%>

	<!-- ���� ���� -->
	<table width="508" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="5">����</td>
      </tr>
    </table>

    <table width="508" border="0" cellpadding="0" cellspacing="1" bgcolor="c1bba5">
      <tr>
        <td height="25" align="center" bgcolor="ddd9cd">NO</td>
        <td height="25" align="center" bgcolor="ddd9cd">������</td>
        <td align="center" bgcolor="ddd9cd">����</td>
        <td align="center" bgcolor="ddd9cd">����</td>
        <td align="center" bgcolor="ddd9cd">�հ�</td>
      </tr>
<%
			  int v_booksumprice = 0;
			  v_coutsecnt=list1.size();
			  for (int i=0; i<list1.size(); i++) {
		  		DataBox dbox = (DataBox)list1.get(i);

		  		String v_bookname = dbox.getString("d_bookname");
		  		String v_bookcode = dbox.getString("d_bookcode");
		  		int    v_seq	  = dbox.getInt("d_seq");
		  		int    v_price    = dbox.getInt("d_price");
		  		int    v_unit     = dbox.getInt("d_unit");
		  		int    v_amount   = dbox.getInt("d_amount");
		  		v_booksumprice    = v_booksumprice + v_amount;

		  		if (i==0) { v_firstSubjnm = dbox.getString("d_bookname"); }
	  		%>
	  <tr>
        <td width="50" height="25" align="center" bgcolor="#FFFFFF"><%=i+1%></td>
        <td bgcolor="#FFFFFF" class="tbl_gleft" style="padding-left:10px;"><%=v_bookname%></td>
        <td height="25" align="center" bgcolor="#FFFFFF"><%=new java.text.DecimalFormat("##,###,##0").format(v_unit)%></td>
        <td height="25" align="center" bgcolor="#FFFFFF"><%=new java.text.DecimalFormat("##,###,##0").format(v_price)%></td>
        <td height="25" align="center" bgcolor="#FFFFFF"><%=new java.text.DecimalFormat("##,###,##0").format(v_amount)%></td>
      </tr>
      <% }
      v_billprice = v_booksumprice;
       %>
      <% if (list1.size()!=0) { %>
        <tr>
            <td bgcolor="#FFFFFF" colspan=4 align=center>�հ�</td>
            <td bgcolor="#FFFFFF" align=center><%=new java.text.DecimalFormat("##,###,##0").format(v_booksumprice)%></td>
        </tr>
      <% } %>

       <% if (list1.size()>0) {
	  		if (v_coutsecnt==1) {
	  			out.print(v_firstSubjnm);
	  			v_goodname = v_firstSubjnm;
	  		} else {
	  			v_goodname = v_firstSubjnm + " �� " + (v_coutsecnt - 1) + "��";
	  			out.print(v_goodname);
	  		}
	     }
	  %>
    </table>
	<% } %>
	<!-- ���� �� -->
	<!-- ��ǰ ����Ʈ �� -->

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
              <input type=text name=buyeremail class="input" size=20 value="<%=v_email%>">
              <input type=hidden name=parentemail value=""></td>
          </tr>
          <tr>
            <td width="118" height="25" align="center" background="/images/user/game/account/td_bg.gif" bgcolor="ddd9cd">�̵���ȭ</td>
            <td height="25" bgcolor="#FFFFFF"><img src="/images/user/game/account/spacer.gif" width="20" height="8">
            	&nbsp;<input type=text name="buyertel1" size=3 class="input" maxlength="3">-
            	<input type=text name="buyertel2" size=4 class="input" maxlength="4">-
            	<input type=text name="buyertel3" size=4 class="input" maxlength="4">
              	<input type=hidden name="buyertel"></td>
          </tr>

          <!-- ������ ���� ���� -->
          <tr>
            <td width="118" height="25" align="center" background="/images/user/game/account/td_bg.gif" bgcolor="ddd9cd">������ ����</td>
            <td height="25" bgcolor="#FFFFFF"><img src="/images/user/game/account/spacer.gif" width="20" height="8">&nbsp;<input type="text" class="input" name="p_receive" maxlength="10" value="<%=v_name%>"></td>
          </tr>
          <tr>
            <td width="118" height="25" align="center" background="/images/user/game/account/td_bg.gif" bgcolor="ddd9cd">������ ��ȭ��ȣ</td>
            <td height="25" bgcolor="#FFFFFF"><img src="/images/user/game/account/spacer.gif" width="20" height="8">&nbsp;<input type="text" class="input" name="p_phone" maxlength="14" value="<%=v_hometel%>"></td>
          </tr>
          <tr>
            <td width="118" height="25" align="center" background="/images/user/game/account/td_bg.gif" bgcolor="ddd9cd">������ �����ȣ</td>
            <td height="25" bgcolor="#FFFFFF"><img src="/images/user/game/account/spacer.gif" width="20" height="8">&nbsp;<input type="text" class="input" name="p_post1" maxlength="3" size="4" value="<%=v_post1%>" readOnly> -
                    <input type="text" class="input" name="p_post2" maxlength="3" size="4" value="<%=v_post2%>" readOnly>
                    <a href="javascript:searchPost()"><img src="/images/user/game/button/btn_zipcode.gif" align="absmiddle"width="87" height="18" border="0"> </a></td>
          </tr>
          <tr>
            <td width="118" height="25" align="center" background="/images/user/game/account/td_bg.gif" bgcolor="ddd9cd">������ �ּ�</td>
            <td height="25" bgcolor="#FFFFFF"><img src="/images/user/game/account/spacer.gif" width="20" height="8">&nbsp;<input type="text" class="input" name="p_addr1" maxlength="100" size= "60" value="<%=v_addr%>"><br>
                    <img src="/images/user/game/account/spacer.gif" width="20" height="8">&nbsp;<input type="text" class="input" name="p_addr2" maxlength="100" size= "60" value="<%=v_addr2%>"></td>
          </tr>
          <!-- ������ ���� �� -->
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

          <tr id="IDBank" style="display:none">
          	<td width="118" height="25" align="center" bgcolor="ddd9cd">������ �Ա�</td>
          	<td height="25" bgcolor="#FFFFFF">
          		<table border=0>
          			<tr>
          				<td width=80>�Աݰ���</td>
          				<td>361437-04-001935 ��������</td>
          			</tr>
          			<tr>
         				<td width=80>�Ա��ڸ�</td>
          				<td><input type="text" class="input" name="p_inputname" value="<%=v_usernm%>"></td>
					</tr>
          			<tr>
         				<td width=80>�Ա�����</td>
          				<td><input type="text" class="input" name="p_inputdate" maxlength="8" onkeydown="javascript:return numcheck(this)"> "-" ����(ex.20060130)</td>
					</tr>
          		</table>
          	</td>
          </tr>

			<input type=hidden name=goodname size=20 value="<%=v_goodname%>"> <!-- ��ǰ�� -->
          	<input type="hidden" name="ispointuse" value="N">
          	<input type="hidden" name="point" value="0">
          	<input type="hidden" name="price" value="<%=v_billprice%>">
          	<input type="hidden" name="tem_grcode" value="<%=box.getSession("tem_grcode")%>">
           <tr>
            <td height="25" align="center" background="/images/user/game/account/td_bg.gif" bgcolor="ddd9cd">�����ݾ�</td>
            <td height="25" bgcolor="#FFFFFF"><img src="/images/user/game/account/spacer.gif" width="24" height="8">
              <%=new java.text.DecimalFormat("###,###,###").format(v_billprice)%>
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
              <td><input type=image src="/images/user/game/account/b_setok.gif" width="54" height="21" border="0"></td>
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
<% if (request.getServerName().indexOf("210.118.65.146")==0) { %>
<input type=hidden name=mid value="INIpayTest">
<% } else { %>
<input type=hidden name=mid value="kocca00001">
<% } %>


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
<input type=hidden name=p_gubun value="<%=request.getParameter("p_gubun")%>">
<input type=hidden name=p_process value="<%=v_process%>">

</form>
</body>



