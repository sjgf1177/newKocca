<%
//**********************************************************
//  1. ��      ��: ������ ���� ��� ����
//  2. ���α׷��� : za_OffBillRegistAdmin_E.jsp
//  3. ��      ��: �������� - �����ᳳ�ε��
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.12.23
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
	response.setHeader("Content-Disposition", "inline; filename=za_OffBillRegistAdmin_E.xls");
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
	String  ss_subjseq          = box.getString("s_subjseq");	  	//����
    String  ss_mastercd			= box.getString("s_mastercd");		//����&�ڽ�
    String  ss_upperclass		= box.getString("s_upperclass");	//������з�
    String  ss_middleclass		= box.getString("s_middleclass");	//�����ߺз�
    String  ss_lowerclass		= box.getString("s_lowerclass");	//�����Һз�
    String  ss_startdate		= box.getString("s_startdate");		//�Ⱓ��ȸ ����
    String  ss_enddate			= box.getString("s_enddate");		//�Ⱓ��ȸ ��
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
        <td align="center" height="30"><font size="3"><b>�������� ������ ���ε��</b></font></td>
    </tr>
  <tr>
    <td align="center" valign="top">
      <!----------------- ��ȸ ���� ----------------->
      <table class="table_out" cellspacing="1" cellpadding="5" border="1">
          <tr>
          	<td>No</td>
			<td>������</td>
			<td>����</td>
			<td>������</td>
			<td>������</td>
			<td>�ǰ�����</td>
			<td>���αⰣ</td>
			<td>���δ���ڼ�</td>
          </tr>

<%  
	String  v_subj        = "";
	String  v_year        = "";
	String  v_subjnm      = "";
	String  v_subjseq     = "";
	String  v_seq         = "";
	String  v_billreqnm   = "";
	double  v_biyong      = 0;
	double  v_realbiyong  = 0;
	String  v_billbegindt = "";
	String  v_billenddt   = "";
	int	    v_usercnt     = 0;
	

	if (v_action.equals("go")) {
        	
        ArrayList  list = (ArrayList)request.getAttribute("selectList");
        
        for (i=0; i<list.size(); i++) {
			DataBox dbox = (DataBox)list.get(i);

            v_finalString	= "";

            v_subj        = dbox.getString("d_subj");
            v_year        = dbox.getString("d_year");
            v_subjnm      = dbox.getString("d_subjnm");
            v_subjseq     = dbox.getString("d_subjseq");
            v_seq         = dbox.getString("d_seq");
            v_billreqnm   = dbox.getString("d_billreqnm");
            v_biyong      = dbox.getDouble("d_biyong");
            v_realbiyong  = dbox.getDouble("d_realbiyong");
            v_billbegindt = dbox.getString("d_billbegindt");
            v_billenddt   = dbox.getString("d_billenddt");
            v_usercnt     = dbox.getInt("d_usercnt");

			v_dispnum		= dbox.getString("d_dispnum");
			v_totalpage     = dbox.getInt("d_totalpage");
			v_rowcount      = dbox.getInt("d_rowcount");
			v_total_rowcount= dbox.getInt("d_totalrowcount");

%>
            <tr>
				<td><%= i + 1 %></td>
                <td><%= v_subjnm %></td>
                <td><%= StringManager.cutZero(v_subjseq) %></td>
                <td><%= v_billreqnm %></td>
                <td><%= v_biyong %></td>
                <td><%= v_realbiyong %></td>
                <td><%= FormatDate.getFormatDate(v_billbegindt,"yyyy/MM/dd") %> ~ <%= FormatDate.getFormatDate(v_billenddt,"yyyy/MM/dd") %></td>
                <td><%= v_usercnt %></td>
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