<%
//**********************************************************
//  1. ��      ��: ��������� ���� ����
//  2. ���α׷��� : za_OffBillAdmin_E.jsp
//  3. ��      ��: �������� - ��������� ����
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.12.18
//  7. ��      ��:
//***********************************************************
%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.library.PageUtil" %>
<%@ page import = "com.credu.propose.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%	
	response.setContentType("application/vnd.ms-text");
	response.setHeader("Content-Disposition", "inline; filename=za_OffBillAdmin_E.xls");
	response.setHeader("Content-Description", "JSP Generated Data");

    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }
    
    String  v_searchtext  = box.getString("p_searchtext");
    String  v_search      = box.getString("p_search");

	String  v_process  = "selectList";

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

	int     v_totalpage =  0;
    int     v_rowcount  =  0;
    int     v_rowspan   =  0;
    int     v_total     =  0;
    int     i           =  0;
	int		v_total_rowcount = 0;

	if(v_pageno == 0)
	{
		v_pageno = 1;
	}

    String  v_ongo     = "whenSelection('go')";
	String  v_finalString = "";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" height="30"><font size="3"><b>�������� ������ ���� ��ȸ</b></font></td>
    </tr>
  <tr>
    <td align="center" valign="top">
      <!----------------- ��ȸ ���� ----------------->
      <table class="table_out" cellspacing="1" cellpadding="5" border="1">
         <tr>		
			<td>No</td>
			<td>������</td>
			<td>���̵�</td>
			<td>����</td>
			<td>ȸ������</td>
			<td>��������</td>
			<td>�����ݾ�</td>
			<td>�������</td>
			<td>������</td>
			<td>������</td>
          </tr>
<%  
	String  v_grcode       = "";
	String  v_tid          = "";
	String  v_userid       = "";
	String  v_usernm       = "";
	String  v_membergubun = "";
	String  v_codenm       = "";
	String  v_goodname     = "";
	String  v_inputdate    = "";
	double  v_price        = 0;
	String  v_resultcode   = "";
	String  v_paymethod    = "";
	String  v_paystatus    = "";
	String  v_buyername    = "";
	String  v_pgauthdate   = "";
	String  v_cancelyn     = "";
	double	v_total_price  = 0;
	String  v_cancel_btn   = "";

	if (v_action.equals("go")) {
        	
        ArrayList  list = (ArrayList)request.getAttribute("selectList");
        
        int v_today = Integer.parseInt(FormatDate.getDate("yyyyMMddHH"));  //���� ��¥ �Ͻ� �ʱ�ȭ

        for (i=0; i<list.size(); i++) {
			DataBox dbox = (DataBox)list.get(i);

            v_finalString	= "";

            v_grcode      = dbox.getString("d_grcode");
            v_tid         = dbox.getString("d_tid");
            v_userid      = dbox.getString("d_userid");
            v_usernm      = dbox.getString("d_usernm");
            v_membergubun = dbox.getString("d_membergubun");
            v_codenm      = dbox.getString("d_codenm");
            v_goodname    = dbox.getString("d_goodname");
            v_inputdate   = dbox.getString("d_inputdate");
            v_price       = dbox.getDouble("d_price");
            v_resultcode  = dbox.getString("d_resultcode");
            v_paymethod   = dbox.getString("d_paymethod");
            v_paystatus   = dbox.getString("d_paystatus");
            v_buyername   = dbox.getString("d_buyername");
            v_pgauthdate  = dbox.getString("d_pgauthdate");
            v_cancelyn    = dbox.getString("d_cancelyn");

			v_dispnum		= dbox.getString("d_dispnum");
			v_totalpage     = dbox.getInt("d_totalpage");
			v_rowcount      = dbox.getInt("d_rowcount");
			v_total_rowcount= dbox.getInt("d_totalrowcount");

			if ("Y".equals(v_paystatus) && (!"TaxBill".equals(v_paymethod) && (!"BankBook".equals(v_paymethod)))) {
				v_cancel_btn = "<a href=\"javascript:fnPayInfo('" + v_tid + "')\">[�������]</a>";
			} else {
				v_cancel_btn = "";
			}
			
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

			v_total_price += v_price;
%>
            <tr>
				<td><%= i + 1 %></td>
                <td><%= v_goodname %></td>
                <td><%= v_userid %></td>
                <td><%= v_usernm %></td>
                <td><%= v_codenm %></td>
                <td><%= v_paystatus %></td>
                <td><%= v_price %></td>
                <td><%= v_paymethod %></td>
                <td><%= v_buyername %></td>
                <td><%= FormatDate.getFormatDate(v_pgauthdate,"yyyy/MM/dd") %></td>
            </tr>
<%          //}
        }
		if (i == 0)
			{ %>
			<tr>
				<td align="center" bgcolor="#FFFFFF" height="100" colspan="11">��ϵ� ������ �����ϴ�.</td>
			  </tr>
			<%}
    }

%>
        </table>
      </td>
  </tr>
</table>
</body>
</html>