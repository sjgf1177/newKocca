 <%
//**********************************************************
//  1. ��      ��: ������ ���ΰ��� ���� ����
//  2. ���α׷���: za_OffBillAdmin_U
//  3. ��      ��: ������ ���ΰ��� �������� ����(�˾�)
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.12.20
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");

    String  v_searchtext  = box.getString("p_searchtext");
    String  v_search      = box.getString("p_search");

    String  ss_year			    = box.getString("s_year");			//�⵵
	String  ss_subj             = box.getString("s_subjcode");	  	//����
    String  ss_mastercd			= box.getString("s_mastercd");		//����&�ڽ�
    String  ss_upperclass		= box.getString("s_upperclass");	//������з�
    String  ss_middleclass		= box.getString("s_middleclass");	//�����ߺз�
    String  ss_lowerclass		= box.getString("s_lowerclass");	//�����Һз�
    String  ss_paystatus		= box.getString("s_paystatus");	    //��������
    String  ss_startdate		= box.getString("s_startdate");		//�Ⱓ��ȸ ����
    String  ss_enddate			= box.getString("s_enddate");		//�Ⱓ��ȸ ��
    String  ss_startappdate		= box.getString("s_startappdate");	//������û�� ��ȸ ����
    String  ss_endappdate		= box.getString("s_endappdate");	//������û�� ��ȸ ��
    String  ss_paymethod		= box.getString("s_paymethod");		//�������
    String  ss_membergubun		= box.getString("s_membergubun");		//�������
	String  s_subjsearchkey     = box.getString("s_subjsearchkey");
	
    String  v_action    = box.getString("p_action");

	String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
	String  v_dispnum	= "";
    
    int     v_pageno    = box.getInt("p_pageno")== 0 ? 1 : box.getInt("p_pageno");
    int     v_pagesize  = box.getInt("p_pagesize")== 0 ? 10 : box.getInt("p_pagesize");
    
	String  v_tid		 = "";
	String  v_subj		 = "";
	String  v_subjnm	 = "";
	String  v_year   	 = "";
	String  v_subjseq	 = "";
	String  v_seq	     = "";
	double  v_biyong     = 0;
	double  v_price      = 0;
	String  v_paymethod  = "";
	String  v_paystatus  = "";
	String  v_pgauthdate = "";
	String  v_pgauthtime = "";
	String  v_buyername  = "";
	String  v_buyeremail = "";
	String  v_buyertel	 = "";
	String  v_resultcode = "";
	String  v_cancelyn   = "";
	String  v_canceldate = "";
	String  v_canceltime = "";
	String  v_resultmsg  = "";
	int		v_rowspan    = 0;

	DataBox dbox = (DataBox)request.getAttribute("OffBillInfo");
    if (dbox != null) {
    	v_tid	     = dbox.getString("d_tid");
    	v_subj	     = dbox.getString("d_subj");
    	v_subjnm     = dbox.getString("d_subjnm");
		v_year	     = dbox.getString("d_year");
		v_subjseq	 = dbox.getString("d_subjseq");
		v_seq		 = dbox.getString("d_seq");
		v_biyong	 = dbox.getDouble("d_biyong");
		v_price   	 = dbox.getDouble("d_price");
		v_paymethod	 = dbox.getString("d_paymethod");
		v_paystatus	 = dbox.getString("d_paystatus");
		v_pgauthdate = dbox.getString("d_pgauthdate");
		v_pgauthtime = dbox.getString("d_pgauthtime");
		v_buyername	 = dbox.getString("d_buyername");
		v_buyeremail = dbox.getString("d_buyeremail");
		v_buyertel	 = dbox.getString("d_buyertel");
		v_resultcode = dbox.getString("d_resultcode");
		v_cancelyn	 = dbox.getString("d_cancelyn");
		v_canceldate = dbox.getString("d_canceldate");
		v_canceltime = dbox.getString("d_canceltime");
		v_resultmsg  = dbox.getString("d_resultmsg");

		if ("Y".equals(v_paystatus)) {
			v_paystatus = "�����Ϸ�";
		} else if ("N".equals(v_paystatus)) {
			v_paystatus = "�̰���";
		} else if ("R".equals(v_paystatus)) {
			v_paystatus = "ȯ�ҿϷ�";
		}
		
		if ("BankBook".equals(v_paymethod)) {
			v_paymethod = "������";
		} else if ("Card".equals(v_paymethod)) {
			v_paymethod = "�ſ�ī��(ISP)";
		} else if ("DirectBank".equals(v_paymethod)) {
			v_paymethod = "�ǽð�������ü";
		} else if ("TaxBill".equals(v_paymethod)) {
			v_paymethod = "��꼭";
		} else if ("VBank".equals(v_paymethod)) {
			v_paymethod = "������(�������)";
		} else if ("VCard".equals(v_paymethod)) {
			v_paymethod = "�ſ�ī��(�Ƚ�Ŭ��)";
		}

    }
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<SCRIPT LANGUAGE = "JAVASCRIPT" SRC = "/script/hhi_lib.js"></SCRIPT>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<Script language="javascript">
</Script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<table width="600" border="0" cellpadding="0" cellspacing="10" bgcolor="#f7f7f7">
  <tr>
    <td align="left">
        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
          <tr>
            <td align="center" bgcolor="#FFFFFF">
			 <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/portal/s.1_31.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
            <br>

<form name="form1" method = "post">
  <input type="hidden" name="p_process" value="<%=v_process%>">
  <input type="hidden" name="p_mode1"   value = "name">
  <input type="hidden" name="p_mode2"   value = "">
  <input type="hidden" name="p_tid"   value = "<%= v_tid %>">

  <input type="hidden" name="p_orderType" value="<%=v_orderType%>">
  <input type="hidden" name="p_pageno" value="<%=v_pageno%>">
  <input type="hidden" name="p_pagesize"  value = "<%=v_pagesize%>">

  <input type="hidden" name="p_uclass"     value="<%=ss_upperclass%>">
  <input type="hidden" name="p_mclass"     value="<%=ss_middleclass%>">
  <input type="hidden" name="p_lclass"     value="<%=ss_lowerclass%>">

  <input type="hidden" name="s_upperclass"  value="<%= ss_upperclass %>">
  <input type="hidden" name="s_middleclass" value="<%= ss_middleclass %>">
  <input type="hidden" name="s_lowerclass"  value="<%=ss_lowerclass%>">
  <input type="hidden" name="s_paystatus"   value="<%=ss_paystatus%>">
  <input type="hidden" name="s_startdate"   value="<%=ss_startdate%>">
  <input type="hidden" name="s_enddate"     value="<%=ss_enddate%>">
  <input type="hidden" name="p_action"      value="go">
  <input type="hidden" name="p_searchtext"  value="<%= v_searchtext %>">
  <input type="hidden" name="p_search"      value="<%= v_search %>">
  
        <table class="box_table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr>
            <td class="table_title" width="30%"><b>��û������</b></td>
            <td class="table_02_2" colspan="3"><%= v_subjnm %></td>
          </tr>
          <tr>
            <td class="table_title" ><b>��������</b></td>
            <td class="table_02_2" colspan="3"><%= StringManager.cutZero(v_subjseq) %> ��</td>
          </tr>
          <tr>
            <td class="table_title" ><b>�б�</b></td>
            <td class="table_02_2" colspan="3"><%= StringManager.cutZero(v_seq) %> �б�</td>
          </tr>
          <tr>
            <td class="table_title" ><b>������</b></td>
            <td class="table_02_2" colspan="3"><%= new java.text.DecimalFormat("###,###,##0").format(v_biyong) %>��</td>
          </tr>
          <tr>
            <td class="table_title" ><b>�Ѱ����ݾ�</b></td>
            <td class="table_02_2" colspan="3"><%= new java.text.DecimalFormat("###,###,##0").format(v_price) %>��</td>
          </tr>
          <tr>
            <td class="table_title" ><b>��������</b></td>
            <td class="table_02_2" colspan="3"><%= new java.text.DecimalFormat("###,###,##0").format(v_price) %>��</td>
          </tr>
          <tr>
            <td class="table_title" ><b>�������</b></td>
            <td class="table_02_2" colspan="3"><%= v_paymethod %></td>
          </tr>
          <tr>
            <td class="table_title" ><b>������</b></td>
            <td class="table_02_2" colspan="3"><%= !"".equals(v_pgauthdate) ? FormatDate.getFormatDate(v_pgauthdate,"yyyy/MM/dd") : "" %></td>
          </tr>
          <tr>
            <td class="table_title" ><b>�����ڸ�</b></td>
            <td class="table_02_2" colspan="3"><%= v_buyername %></td>
          </tr>
          <tr>
            <td class="table_title" ><b>�̸���</b></td>
            <td class="table_02_2" colspan="3"><%= v_buyeremail %></td>
          </tr>
          <tr>
            <td class="table_title" ><b>��ȭ��ȣ</b></td>
            <td class="table_02_2" colspan="3"><%= v_buyertel %></td>
          </tr>
          <tr>
            <td class="table_title" ><b>��������</b></td>
            <td class="table_02_2" colspan="3"><%= v_paystatus %></td>
          </tr>
<%
	if ("Y".equals(v_cancelyn))	{
		v_rowspan = 3;
	} else {
		v_rowspan = 2;
	}
%>
          <tr>
            <td class="table_title" rowspan="<%= v_rowspan %>"><b>�������� ������</b></td>
            <td class="table_title">��������</td>
            <td class="table_title">��������</td>
            <td class="table_title">�������</td>
          </tr>
          <tr>
            <td class="table_02_1">�����Ϸ�</td>
            <td class="table_02_1"><%= FormatDate.getFormatDate(v_pgauthdate+v_pgauthtime,"yyyy-MM-dd HH:mm ss") %></td>
            <td class="table_02_1">��������</td>
          </tr>
<%
	if ("Y".equals(v_cancelyn)) {
%>
          <tr>
            <td class="table_02_1">ȯ�ҿϷ�</td>
            <td class="table_02_1"><%= FormatDate.getFormatDate(v_canceldate+v_canceltime,"yyyy-MM-dd HH:mm ss") %></td>
            <td class="table_02_1">�������</td>
          </tr>
<%		
	}
%>
        </table>

        <!----------------- �ݱ� ��ư ���� ----------------->
        <table cellspacing="0" cellpadding="0" >
          <tr>
            <td align="right" style="padding-top=10"><a href="javascript:self.close()"><img src="/images/admin/button/btn_close.gif" border="0"></a></td>
          </tr>
        </table>
        <!----------------- �ݱ� ��ư �� ----------------->
        <br>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</form>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
