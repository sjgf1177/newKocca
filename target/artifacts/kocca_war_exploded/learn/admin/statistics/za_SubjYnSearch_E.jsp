<%
//**********************************************************
//  1. ��      ��:
//  2. ���α׷���:
//  3. ��      ��:
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��:
//  7. ��      ��:
//***********************************************************
%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.scorm.*" %>
<%@ page import = "com.credu.statistics.*" %>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%
	response.setHeader("Content-Disposition", "attachment; filename=za_SubjYnSearch_E.xls");
	response.setHeader("Content-Description", "JSP Generated Data");

	String startDate  = FormatDate.getRelativeDate(-60);
	String endDate = FormatDate.getRelativeDate(30);

	RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    String  v_action    = box.getString("p_action");
    String  v_edustart  =  "";
    String  v_eduend    =  "";
	String	v_fmt_biyong    =  "";
	String	v_stucnt     =  "";
	String	v_fmt_stucnt_tatal	=	"";
	String	v_fmt_subjsales_tatal	=	"";

	String  ss_grcode       = box.getString("s_grcode");          //�����׷�
    String  ss_gyear        = box.getString("s_gyear");           //�⵵
    String  ss_grseq        = box.getString("s_grseq");           //��������
    String  ss_grseqnm      = box.getString("s_grseqnm");         //����������
    String  ss_upperclass   = box.getString("s_upperclass");      //������з�
    String  ss_middleclass  = box.getString("s_middleclass");     //�����ߺз�
    String  ss_lowerclass   = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse   = box.getString("s_subjcourse");      //����&�ڽ�
    String  ss_subjseq      = box.getString("s_subjseq");         //���� ����

    String  ss_edustart		= box.getString("s_start");            //����������
    String  ss_eduend		= box.getString("s_end");              //����������
    String  ss_isuse		= box.getString("ss_isuse");           //��뱸��

	ArrayList list = null;
	int listsize = 0;
	int i = 0;

    if ( v_action.equals("go") ) {
	    list = (ArrayList)request.getAttribute("SubjYnList");

    	listsize = list.size();
	}

	String searchStart = FormatDate.getFormatDate(startDate,"yyyy-MM-dd");
	String searchEnd   = FormatDate.getFormatDate(endDate,"yyyy-MM-dd");

	String  v_searchStart = box.getString("p_searchStart");
	String  v_searchEnd   = box.getString("p_searchEnd");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
	<tr>
		<td align="center" height="30"><font size="3"><b>�ű�/�󰭰��� ��Ȳ</b></font></td>
	</tr>
  <tr>
    <td align="center" valign="top">
        <!----------------- ����������ȸ ���� ----------------->
        <table cellspacing="1" cellpadding="5" border="1">
	      <tr align=center>
            <td><b>No</b></td>
            <td><b>�ڵ�</b></a></td>
            <td><b>����</b></td>
			<td><b>��米��</b></td>
            <td><b>����ȸ��</b></td>
            <td><b>�����</b></td>
          </tr>
<%
    if ( v_action.equals("go") ) {
		for (i=0; i<list.size(); i++ ) {
			DataBox dbox = (DataBox)list.get(i);
%>
          <tr>
			<td align=center><%= (i+1) %></td>
			<td align=center><%=dbox.getString("d_subj")%></td>
			<td align=left><%=dbox.getString("d_subjnm")%></td>
            <td align=center><%=dbox.getString("d_musernm")%></td>
			<td align=center><%=dbox.getString("d_compnm")%></td>
			<td align=center><%=dbox.getString("d_isuse")%></td>
           </tr>
<%
		}
	}
%>
        </table>
      </td>
  </tr>
</table>
</body>
</html>
