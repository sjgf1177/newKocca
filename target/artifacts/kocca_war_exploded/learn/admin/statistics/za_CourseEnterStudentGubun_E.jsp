<%
//**********************************************************
//  1. ��      ��: ����� ��� - �԰���Ȳ - �������� - ȸ�����к�, ����, ���ɴ뺰, �зº�, ��ȭ��������ں�, ��ȭ��������ں�  ��Ȳ
//  2. ���α׷��� : za_CourseenterStudentGubun_E.jsp
//  3. ��      ��: �԰���Ȳ - �������� - ȸ�����к�, ����, ���ɴ뺰, �зº�, ��ȭ��������ں�, ��ȭ��������ں�  ��Ȳ
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.12.09
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
	response.setHeader("Content-Disposition", "inline; filename=za_CourseEnterStudentGubun_E.xls");
	response.setHeader("Content-Description", "JSP Generated Data");

	RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    String	v_gubun		= "";
    String	v_gubunnm	= "";
    int		v_cnt		= 0;
    int		v_rate		= 0;
    int     i           = 0;
    int		v_total		= 0;
    String	stat_text	= "";
 	
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

    if ("MEM".equals(ss_option3)) {
    	stat_text	= "ȸ�����к�";
    } else if ("GEN".equals(ss_option3)) {
    	stat_text	= "����";
    } else if ("YEA".equals(ss_option3)) {
    	stat_text	= "���ɴ뺰";
    } else if ("SCH".equals(ss_option3)) {
    	stat_text	= "�зº�";
    } else if ("CUL".equals(ss_option3)) {
    	stat_text	= "��ȭ��������ں�";
    } else if ("NCU".equals(ss_option3)) {
    	stat_text	= "��ȭ��������ں�";
    }
    
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
        <td align="center" height="30"><font size="3"><b>�������� <%= stat_text %> �԰���Ȳ</b></font></td>
    </tr>
  <tr>
    <td align="center" valign="top">
      <!----------------- ��ȸ ���� ----------------->
      <table class="table_out" cellspacing="1" cellpadding="5" border="1">		
        <tr>
          <td>ȸ������</td>
          <td>�����ο�</td>
          <td>����</td>
        </tr>
<%  	if (v_action.equals("go")) {
        	ArrayList  list = (ArrayList)request.getAttribute("selectList");

        	for (i=0; i<list.size(); i++) {
				DataBox dbox = (DataBox)list.get(i);

		        v_gubun		= dbox.getString("d_gubun");
		        v_gubunnm	= dbox.getString("d_gubunnm");
		        v_cnt		= dbox.getInt("d_cnt");
		        v_rate		= dbox.getInt("d_rate");
		        
		        v_total		+= v_cnt;
%>
        <tr>
          <td><%= v_gubunnm %></td>
          <td><%= v_cnt %> ��</td>
          <td><%= v_rate %>%</td>
        </tr>
<%
        	}
			if (i == 0) {
%>
        <tr>
        	<td align="center" bgcolor="#FFFFFF" height="100" colspan="3">��ϵ� ������ �����ϴ�.</td>
        </tr>
<%			} else { %>
	    <tr>
          <td>�հ�</td>
          <td><%= v_total %> ��</td>
          <td>100%</td>
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