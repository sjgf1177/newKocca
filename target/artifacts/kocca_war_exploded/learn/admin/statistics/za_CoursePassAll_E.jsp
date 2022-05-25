<%
//**********************************************************
//  1. ��      ��: ����� ��� - ������Ȳ - ��ü  ��Ȳ ����
//  2. ���α׷��� : za_CoursePassAll_E.jsp
//  3. ��      ��: ������Ȳ - ��ü  ��Ȳ
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.12.11
//  7. ��      ��:
//***********************************************************
%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%	
	response.setContentType("application/vnd.ms-text");
	response.setHeader("Content-Disposition", "inline; filename=za_CoursePassAll_E.xls");
	response.setHeader("Content-Description", "JSP Generated Data");

    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

	String	v_grcode			= "";
	String	v_gyear				= "";
	String	v_grseq				= "";
	String	v_edustart			= "";
	String	v_eduend			= "";
	String	v_grseqnm			= "";
	int		v_user_cnt			= 0;
	int		v_grad_cnt			= 0;
	double	v_grad_rate			= 0;
	int		v_total_user_cnt	= 0;
	int		v_total_grad_cnt	= 0;
	double	v_total_user_cnt_d	= 0;
	double	v_total_grad_cnt_d	= 0;
	String	v_total_grad_rate	= "";
    int     i           		= 0;
    
    String	ss_grcode			= box.getString("s_grcode");		//�����׷�
    String	ss_gyear			= box.getString("s_gyear");			//�⵵
    String	ss_grseq			= box.getString("s_grseq");			//��������
    String	ss_grseqnm			= box.getString("s_grseqnm");		//����������
    String  ss_upperclass		= box.getString("s_upperclass");	//������з�
    String  ss_middleclass		= box.getString("s_middleclass");	//�����ߺз�
    String  ss_lowerclass		= box.getString("s_lowerclass");	//�����Һз�
    String  ss_startdate		= box.getString("s_startdate");		//�Ⱓ��ȸ ����
    String  ss_enddate			= box.getString("s_enddate");		//�Ⱓ��ȸ ��
    String  ss_option1			= box.getString("s_option1");		//��豸��
    String  ss_option2			= box.getString("s_option2");		//��躰 ����2
    String  ss_option3			= box.getString("s_option3");		//��躰 ����3
    
    if (ss_enddate.equals("")) {
    	ss_startdate	= FormatDate.getDateAdd(FormatDate.getDate("yyyyMMdd"), "yyyy-MM-dd", "month", -1);
    	ss_enddate		= FormatDate.getFormatDate(FormatDate.getDate("yyyyMMdd"), "yyyy-MM-dd");
    }
    
    String  v_action	= box.getString("p_action");
	String  v_orderType	= box.getStringDefault("p_orderType"," asc"); //���ļ���
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" height="30"><font size="3"><b>��ü ������Ȳ</b></font></td>
    </tr>
  <tr>
    <td align="center" valign="top">
      <!----------------- ��ȸ ���� ----------------->
      <table class="table_out" cellspacing="1" cellpadding="5" border="1">		
        <tr>
          <td>��������</td>
          <td>�����Ⱓ</td>
          <td>�н��ο�</td>
          <td>�����ο�</td>
          <td>������</td>
       </tr>
<%  	if (v_action.equals("go")) {
        	ArrayList  list = (ArrayList)request.getAttribute("selectList");

        	for (i=0; i<list.size(); i++) {
				DataBox dbox = (DataBox)list.get(i);

				v_grcode			= dbox.getString("d_grcode");
				v_gyear				= dbox.getString("d_gyear");
				v_grseq				= dbox.getString("d_grseq");
				v_edustart			= dbox.getString("d_edustart");
				v_eduend			= dbox.getString("d_eduend");
				v_grseqnm			= dbox.getString("d_grseqnm");
				v_user_cnt			= dbox.getInt("d_user_cnt");
				v_grad_cnt			= dbox.getInt("d_grad_cnt");
				v_grad_rate			= dbox.getDouble("d_grad_rate");

				v_total_user_cnt	+= v_user_cnt;
				v_total_grad_cnt	+= v_grad_cnt;
				v_total_user_cnt_d	+= v_user_cnt;
				v_total_grad_cnt_d	+= v_grad_cnt;
%>
        <tr>
          <td><%= v_gyear %>-<%= v_grseq %> <%= v_grseqnm %></td>
          <td><%= FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd") %> ~ <%= FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd") %></td>
          <td><%= v_user_cnt %></td>
          <td><%= v_grad_cnt %></td>
          <td><%= v_grad_rate %></td>
        </tr>
<%
        	}
			if (i == 0) {
%>
        <tr>
        	<td align="center" bgcolor="#FFFFFF" height="100" colspan="5">��ϵ� ������ �����ϴ�.</td>
        </tr>
<%			} else { 
				if (v_total_user_cnt != 0) {
					v_total_grad_rate = new java.text.DecimalFormat("###,###,###.##").format(v_total_grad_cnt_d / v_total_user_cnt_d * 100);
				} else {
					v_total_grad_rate = "0";					
				}
%>
	    <tr>
          <td>�հ�</td>
          <td></td>
          <td><%= v_total_user_cnt %></td>
          <td><%= v_total_grad_cnt %></td>
          <td><%= v_total_grad_rate %>%</td>
        </tr>
<%			}
		}
%>
        </table>
      </td>
  </tr>
</table>
</body>
</html>