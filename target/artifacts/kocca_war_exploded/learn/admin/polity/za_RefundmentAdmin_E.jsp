<%
/**
 * file name : za_RefundmentAdmin_E.jsp
 * date      :
 * programmer:
 * function  : ȯ�ҽ�û ���� ����Ʈ ��ȸȭ��
 */
%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.polity.*" %>
<%@ page language="java" contentType="application/vnd.ms-excel;charset=euc-kr" %>

<%	response.setHeader("Content-Disposition", "inline; filename=za_RefundmentAdmin_E.xls");
	response.setHeader("Content-Description", "JSP Generated Data");

    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

	String  v_process  = "selectList";

    String  ss_grcode			= box.getString("s_grcode");		//�����׷�
    String  ss_gyear			= box.getString("s_gyear");			//�⵵
    String  ss_grseq			= box.getString("s_grseq");			//��������
    String  ss_grseqnm			= box.getString("s_grseqnm");		//����������
    String  ss_mastercd			= box.getString("s_mastercd");		//����&�ڽ�
    String  ss_upperclass		= box.getString("s_upperclass");	//������з�
    String  ss_middleclass		= box.getString("s_middleclass");	//�����ߺз�
    String  ss_lowerclass		= box.getString("s_lowerclass");	//�����Һз�
    String  ss_subjcourse		= box.getString("s_subjcourse");	//����&�ڽ�
    String  ss_subjseq			= box.getString("s_subjseq");		//���� ����
    String  ss_refundatestart	= box.getString("s_refundatestart");//ȯ�ҽ�����
    String  ss_refundateend		= box.getString("s_refundateend");	//ȯ��������
    String  ss_refundstat		= box.getString("s_refundstat");	//ȯ�һ���
	
    String  v_action    = box.getString("p_action");

	String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
	String v_dispnum	= "";

	int     v_totalpage =  0;
    int     v_rowcount  =  0;
    int     v_rowspan   =  0;
    int     v_total     =  0;
    int     i           =  0;

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="1" cellspacing="0" cellpadding="0" height="663">
	<tr>
		<td align="center" height="30"><font size="3"><b>ȯ�ҽ�û ���� ����Ʈ</b></font></td>
	</tr>
  <tr>
    <td align="center" valign="top">
        <%
        String v_ispropose          ="";
        String v_proposetype        ="";
        String v_isedutarget        ="";
        String v_educnt             ="";
        String v_mastercd           ="";
        String v_masternm           ="";

        %>

        <!----------------- ����������ȸ ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5" border="1">		
          <tr>
            <td colspan="18" class="table_top_line"></td>
          </tr>
          <tr>
            <td class="table_title"><b>No</b></td>
            <td class="table_title" width="5%"><b>��û��<br>(ID)</b></td>
            <td class="table_title" width="5%"><b>��û<br>����</b></td>
            <td class="table_title" width="5%"><b>����</b></td>
            <td class="table_title" width="7%"><b>�����Ⱓ</b></td>
            <td class="table_title"><b>��û��</b></td>
            <td class="table_title"><b>�⺻<br>������</b></td>
            <td class="table_title"><b>����<br>����</td>
            <td class="table_title"><b>����Ʈ</b></td>
            <td class="table_title"><b>������<br>�ݾ�</td>
            <td class="table_title"><b>�Ա���</td>
            <td class="table_title"><b>�Ա���</td>
            <td class="table_title"><b>�ŷ�<br>����</td>
            <td class="table_title"><b>ȯ��<br>����</td>
            <td class="table_title"><b>ȯ��<br>����</td>
            <td class="table_title"><b>ȯ�Ҿ�</td>
            <td class="table_title"><b>ȯ����</td>
            <td class="table_title"><b>ȯ��<br>����</td>
          </tr>

<%  
        ArrayList  list = (ArrayList)request.getAttribute("selectList");

        int v_today = Integer.parseInt(FormatDate.getDate("yyyyMMddHH"));  //���� ��¥ �Ͻ� �ʱ�ȭ

		String v_subj		= "";
		String v_subjnm		= "";
		String v_membergubun= "";
		String v_userid		= "";
		String v_uname		= "";
		String v_subjseq	= "";		
		String v_chkfinal	= "";
		String v_scyear		= "";
		String v_edustart	= "";
		String v_eduend 	= "";
		String v_appdate	= "";
		String v_subjprice	= "";
		String v_usepoint	= "";
		String v_paymoney	= "";
		String v_accountname= "";
		String v_paydate	= "";
		String v_paytype	= "";
		String v_refundbank	= "";
		String v_refundaccount	= "";
		String v_discountrate	= "";
		String v_refundmoney	= "";
		String v_refunddate		= "";
		String v_refundstat	= "";
		String v_realpaymoney = "";

        for (i=0; i<list.size(); i++) {
			DataBox dbox = (DataBox)list.get(i);


			v_subj			= dbox.getString("d_subj");
			v_subjnm		= dbox.getString("d_subjnm");
			v_userid		= dbox.getString("d_userid");
			v_uname			= dbox.getString("d_name");
			v_subjseq		= dbox.getString("d_subjseq");
			v_scyear		= dbox.getString("d_year");
			v_edustart		= dbox.getString("d_edustart");
			v_eduend		= dbox.getString("d_eduend");
			v_appdate		= dbox.getString("d_appdate");
			v_subjprice		= dbox.getString("d_subjprice");
			v_discountrate	= dbox.getString("d_discountrate");
			v_usepoint		= dbox.getString("d_usepoint");
			v_paymoney		= dbox.getString("d_paymoney");
			v_realpaymoney	= dbox.getString("d_realpaymoney");
			v_accountname	= dbox.getString("d_accountname");
			v_paydate		= dbox.getString("d_paydate");
			v_paytype		= dbox.getString("d_paytype");
			v_refundbank	= dbox.getString("d_refundbank");
			v_refundaccount	= dbox.getString("d_refundaccount");
			v_refundmoney	= dbox.getString("d_refundmoney");
			v_refunddate	= dbox.getString("d_refunddate");
			v_refundstat	= dbox.getString("d_refundstat");

			v_dispnum		= dbox.getString("d_dispnum");
			v_totalpage     = dbox.getInt("d_totalpage");
			v_rowcount      = dbox.getInt("d_rowcount");

			//ȸ������
			if(v_paytype.equals("C")) {v_paytype = "������";}
			else  {v_paytype = "ī��";}

			if(v_refundstat.equals("CW")) { v_refundstat = "ȯ�ҽ�û";}
			else if(v_refundstat.equals("CY")) {v_refundstat = "ȯ�ҿϷ�";}

%>
            <tr align="left">
                <td><%=(i + 1) %></td>
                <td><%=v_uname %><br>(<%=v_userid%>)</td>
                <td><%=v_subjnm %></td>
                <td><%=v_subjseq %></td>
                <td><%=FormatDate.getFormatDate(v_edustart,"yyyy-MM-dd")%> ~<br><%=FormatDate.getFormatDate(v_eduend,"yyyy-MM-dd")%></td>
				<td><%=FormatDate.getFormatDate(v_appdate,"yyyy-MM-dd HH:mm:ss")%></td>	
                <td><%=v_subjprice %></td>
                <td><%=v_discountrate %></td>
                <td><%=v_usepoint %></td>
                <td><%=v_realpaymoney %></td>
                <td><%=v_accountname %></td>
                <td><%=v_paydate %></td>
                <td><%=v_paytype %></td>
                <td><%=v_refundbank %></td>
                <td><%=v_refundaccount %></td>
                <td><%=v_refundmoney %></td>
                <td><%=v_refunddate %></td>
                <td><%=v_refundstat %></td>
            </tr>
<%        
        }
		if (i == 0)
			{ %>
			<tr>
				<td align="center" bgcolor="#FFFFFF" height="100" colspan="18">��ϵ� ������ �����ϴ�.</td>
			  </tr>
<%			}

%>
           
        </table>
      </td>
  </tr>
</table>
</body>
</html>