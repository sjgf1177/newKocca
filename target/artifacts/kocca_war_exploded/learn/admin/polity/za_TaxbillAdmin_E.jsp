<%
//**********************************************************
//  1. ��      ��: ��꼭 ���� ����
//  2. ���α׷��� : za_TaxbillAdmin_E.jsp
//  3. ��      ��: �������� - ��꼭 ����
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
	response.setHeader("Content-Disposition", "inline; filename=za_TaxbillAdmin_E.xls");
	response.setHeader("Content-Description", "JSP Generated Data");

    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }
    
    String  v_searchtext  = box.getString("p_searchtext");
    String  v_search      = box.getString("p_search");

	String  v_process  = "selectList";

    String  ss_grcode			= box.getString("s_grcode");		//�����׷�
    String  ss_gyear			= box.getString("s_gyear");			//�⵵
    String  ss_grseq			= box.getString("s_grseq");			//��������
    String  ss_grseqnm			= box.getString("s_grseqnm");		//����������
    String  ss_mastercd			= box.getString("s_mastercd");		//����&�ڽ�
    String  ss_upperclass		= box.getString("s_upperclass");	//������з�
    String  ss_middleclass		= box.getString("s_middleclass");	//�����ߺз�
    String  ss_lowerclass		= box.getString("s_lowerclass");	//�����Һз�
    String  ss_paystatus		= box.getString("s_paystatus");	    //��������
    String  ss_startdate		= box.getString("s_startdate");		//�Ⱓ��ȸ ����
    String  ss_enddate			= box.getString("s_enddate");		//�Ⱓ��ȸ ��
	
	String v_grtype = GetCodenm.get_grtype(box,ss_grcode);
	
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
        <td align="center" height="30"><font size="3"><b>��꼭 ����</b></font></td>
    </tr>
  <tr>
    <td align="center" valign="top">
      <!----------------- ��ȸ ���� ----------------->
      <table class="table_out" cellspacing="1" cellpadding="5" border="1">		
          <tr>
			<td>No</b></td>
			<td>��������</td>
			<td>������</td>
			<td>�����Ⱓ</td>
			<td>�԰��ο�</td>
			<td>�����ݾ�</td>
			<td>��������</td>
			<td>�߱޴��</td>
			<td>������</td>
          </tr>
          
        <%
        String  v_grcode     = "";
        String  v_gyear      = "";
        String  v_grseq      = "";
        String  v_grseqnm    = "";
        String  v_tid        = "";
        String  v_goodname   = "";
        String  v_edustart   = "";
        String  v_eduend     = "";
        int		v_studentcnt = 0;
        double  v_price      = 0;
        String  v_paystatus  = "";
        String  v_userid     = "";
        String  v_name       = "";
        String  v_pgauthdate = "";
        double	v_total_price = 0;

        if (v_action.equals("go")) {
        	
        ArrayList  list = (ArrayList)request.getAttribute("selectList");
        
        int v_today = Integer.parseInt(FormatDate.getDate("yyyyMMddHH"));  //���� ��¥ �Ͻ� �ʱ�ȭ

        for (i=0; i<list.size(); i++) {
			DataBox dbox = (DataBox)list.get(i);

            v_finalString	= "";

            v_grcode     = dbox.getString("d_grcode");
            v_gyear      = dbox.getString("d_gyear");
            v_grseq      = dbox.getString("d_grseq");
            v_grseqnm    = dbox.getString("d_grseqnm");
            v_tid        = dbox.getString("d_tid");
            v_goodname   = dbox.getString("d_goodname");
            v_edustart   = dbox.getString("d_edustart");
            v_eduend     = dbox.getString("d_eduend");
            v_studentcnt = dbox.getInt("d_studentcnt");
            v_price      = dbox.getDouble("d_price");
            v_paystatus  = dbox.getString("d_paystatus");
            v_userid     = dbox.getString("d_userid");
            v_name       = dbox.getString("d_name");
            v_pgauthdate = dbox.getString("d_pgauthdate");

			v_dispnum		= dbox.getString("d_dispnum");
			v_totalpage     = dbox.getInt("d_totalpage");
			v_rowcount      = dbox.getInt("d_rowcount");
			v_total_rowcount= dbox.getInt("d_totalrowcount");

			if ("Y".equals(v_paystatus)) {
				v_paystatus = "�����Ϸ�";
			} else if ("N".equals(v_paystatus)) {
				v_paystatus = "�̰���";
			} else if ("R".equals(v_paystatus)) {
				v_paystatus = "ȯ�ҿϷ�";
			}
			
			v_total_price += v_price;
%>
            <tr>
				<td><%=(i + 1) %></td>
                <td><%= v_grseqnm %></td>
                <td><%= v_goodname %></td>
                <td><%= FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd") %> ~ <%= FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd") %></td>
                <td><%= v_studentcnt  %></td>
                <td><%= v_price %></td>
                <td><%= v_paystatus %></td>
                <td><%= v_name %></td>
                <td><%= FormatDate.getFormatDate(v_pgauthdate,"yyyy/MM/dd") %></td>
                
            </tr>
<%          //}
        }
		if (i == 0)
			{ %>
			<tr>
				<td align="center" bgcolor="#FFFFFF" height="100" colspan="9">��ϵ� ������ �����ϴ�.</td>
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