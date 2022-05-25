<%
//**********************************************************
//  1. ��      ��: ����� ��� - �԰���Ȳ - �оߺ� ȸ�����к�, ����, ���ɴ뺰, �зº�, ��ȭ��������ں�, ��ȭ��������ں�  ��Ȳ
//  2. ���α׷��� : za_CourseEnterFieldGubun_E.jsp
//  3. ��      ��: �԰���Ȳ - �оߺ� �Ϲ�  ��Ȳ
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.12.10
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
	response.setHeader("Content-Disposition", "inline; filename=za_CourseEnterFieldGubun_E.xls");
	response.setHeader("Content-Description", "JSP Generated Data");
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

	String	v_upperclass		= "";
	String	v_middleclass		= "";
	String	v_middleclassname	= "";
	String	v_lowerclass		= "";
	String	v_lowerclassname	= "";
	int		v_rank				= 0;
	int		v_subj_cnt			= 0;
	int		v_total				= 0;
	int		v_rowspan			= 0;
    int     i           		= 0;
    String	stat_text			= "";
    int		v_total_subj_cnt	= 0;
    
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
	
	ArrayList  listGubun	= (ArrayList)request.getAttribute("selectGubunList");

	int [] v_total_field_cnt	= new int [listGubun.size()];
	int [] v_total_cnt			= new int [listGubun.size()];

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
          <td width="5%" rowspan="3">No</td>
          <td colspan="2">����</td>
          <td rowspan="3">��������(��)</td>
          <td colspan="<%= listGubun.size() * 2 %>">�����ο�(��)</td>
        </tr>
        <tr>
          <td rowspan="2">�о�</td>
          <td rowspan="2">���̵�</td>
          <td colspan="<%= listGubun.size() %>">�оߺ�</td>
          <td colspan="<%= listGubun.size() %>">���̵���</td>
        </tr>
        <tr>
<%
			for (int j = 0; j < listGubun.size() ; j++) {
				DataBox dboxGubun = (DataBox)listGubun.get(j);
%>
          <td><%= dboxGubun.getString("d_codenm") %></td>
<%
			}
%>
<%
			for (int j = 0; j < listGubun.size() ; j++) {
				DataBox dboxGubun = (DataBox)listGubun.get(j);
%>
          <td><%= dboxGubun.getString("d_codenm") %></td>
<%
			}
%>
        </tr>
<%  	if (v_action.equals("go")) {
        	ArrayList  list	= (ArrayList)request.getAttribute("selectList");

        	for (i=0; i<list.size(); i++) {
				DataBox dbox = (DataBox)list.get(i);

				v_upperclass		= dbox.getString("d_upperclass");
				v_middleclass		= dbox.getString("d_middleclass");
				v_middleclassname	= dbox.getString("d_middleclassname");
				v_lowerclass		= dbox.getString("d_lowerclass");
				v_lowerclassname	= dbox.getString("d_lowerclassname");
				v_rank				= dbox.getInt("d_rank");
				v_subj_cnt			= dbox.getInt("d_subj_cnt");
				v_rowspan			= dbox.getInt("d_rowspan");
				
			    v_total_subj_cnt	+= v_subj_cnt;

%>
        <tr>
          <td><%= i + 1 %></td>
<%
			if (v_rowspan != 0) {
%>
          <td rowspan="<%= v_rowspan %>"><%= v_middleclassname %></td>
<%
			}
%>
          <td><%= v_lowerclassname %></td>
          <td><%= v_subj_cnt %></td>
<%
			if (v_rowspan != 0) {
				for (int j = 0; j < listGubun.size() ; j++) {
					DataBox dboxGubun = (DataBox)listGubun.get(j);
%>
          <td rowspan="<%= v_rowspan %>"><%= dbox.getInt("d_field_cnt"+(j+1)) %></td>
<%
					v_total_field_cnt[j] += dbox.getInt("d_field_cnt"+(j+1));
				}
			}

			for (int j = 0; j < listGubun.size() ; j++) {
				DataBox dboxGubun = (DataBox)listGubun.get(j);
%>
          <td><%= dbox.getInt("d_cnt"+(j+1)) %></td>
<%
					v_total_cnt[j]		 += dbox.getInt("d_cnt"+(j+1));
			}
%>
        </tr>
<%
        	}
			if (i == 0) {
%>
        <tr>
        	<td align="center" bgcolor="#FFFFFF" height="100" colspan="<%= listGubun.size() * 2 + 4 %>">��ϵ� ������ �����ϴ�.</td>
        </tr>
<%			} else { %>
	    <tr>
          <td colspan="3">�հ�</td>
          <td><%= v_total_subj_cnt %></td>
<%
			for (int j = 0; j < listGubun.size() ; j++) {
				DataBox dboxGubun = (DataBox)listGubun.get(j);
%>
          <td><%= v_total_field_cnt[j] %></td>
<%
			}
			for (int j = 0; j < listGubun.size() ; j++) {
				DataBox dboxGubun = (DataBox)listGubun.get(j);
%>
          <td><%= v_total_cnt[j] %></td>
<%
			}
%>
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