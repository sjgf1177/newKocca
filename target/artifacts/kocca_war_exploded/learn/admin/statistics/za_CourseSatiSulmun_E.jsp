<%
//**********************************************************
//  1. ��      ��: ����� ��� - ������ ���� ����
//  2. ���α׷��� : za_CourseSatiSulmun_E.jsp
//  3. ��      ��: ������Ȳ - ��ü  ��Ȳ
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.12.12
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
	response.setHeader("Content-Disposition", "inline; filename=za_CourseSatiSulmun_E.xls");
	response.setHeader("Content-Description", "JSP Generated Data");

    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    String	v_grcode			= "";
    String	v_gyear				= "";
    String	v_grseq				= "";
    String	v_upperclass		= "";
    String	v_middleclass		= "";
    String	v_middleclassname	= "";
    String	v_subj				= "";
    String	v_subjnm			= "";
    String	v_grseqnm			= "";
    double	v_distcode1_avg		= 0; 
    int		v_rank				= 0;
    int		v_rank2				= 0;
    int		v_rowspan			= 0;
    int		v_rowspan2			= 0;
	
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
          <td>No</td>
          <td>��������</td>
          <td>�о�</td>
          <td>������</td>
          <td>������ ����</td>
       </tr>
<%  	if (v_action.equals("go")) {
        	ArrayList  list = (ArrayList)request.getAttribute("selectList");

        	for (i=0; i<list.size(); i++) {
				DataBox dbox = (DataBox)list.get(i);

			    v_grcode			= dbox.getString("d_grcode");
				v_gyear				= dbox.getString("d_gyear");
				v_grseq				= dbox.getString("d_grseq");
				v_grseqnm			= dbox.getString("d_grseqnm");
				v_upperclass		= dbox.getString("d_upperclass");
				v_middleclassname	= dbox.getString("d_middleclassname");
				v_subj				= dbox.getString("d_subj");
				v_subjnm			= dbox.getString("d_subjnm");
				v_distcode1_avg		= dbox.getDouble("d_distcode1_avg");
				v_rank				= dbox.getInt("d_rank");
				v_rank2				= dbox.getInt("d_rank2");
				v_rowspan			= dbox.getInt("d_rowspan");
				v_rowspan2			= dbox.getInt("d_rowspan2");
%>
        <tr>
          <td><%= i + 1 %></td>
<%
			if (v_rowspan != 0) {
%>
          <td rowspan="<%= v_rowspan %>"><b><%= v_gyear %>-<%= v_grseq %><br/><%= v_grseqnm %></b></td>
<%
			}
%>
<%
			if (v_rowspan2 != 0) {
%>
          <td rowspan="<%= v_rowspan2 %>"><%= v_middleclassname %></td>
<%
			}
%>
          <td><%= v_subjnm %></td>
          <td><%= v_distcode1_avg %>%</td>
        </tr>
<%
        	}
			if (i == 0) {
%>
        <tr>
        	<td align="center" bgcolor="#FFFFFF" height="100" colspan="5">��ϵ� ������ �����ϴ�.</td>
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