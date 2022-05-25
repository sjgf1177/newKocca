<%
//**********************************************************
//  1. ��      ��: �������� �԰��ο� �����ٿ�ε�
//  2. ���α׷���: za_cpstudentExcel_E.jsp
//  3. ��      ��: �������� �԰��ο� �����ٿ�ε�
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2005.8.29
//  7. ��      ��:
//***********************************************************
%>

<%@ page language="java" contentType="application/vnd.ms-excel;charset=euc-kr" %>

<//%@ page contentType = "text/html;charset=MS949" %>
<%//@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>

<%

String v_date = FormatDate.getDate("yyyyMMddHHmmss");

//response.setHeader("Content-Disposition", "inline; filename=za_Inspection1.xls");
response.setHeader("Content-Disposition", "attachment; filename=CP_EduResult_" + v_date + ".xls");
//response.setHeader("Content-Description", "JSP Generated Data");
%>

<%
RequestBox box = (RequestBox)request.getAttribute("requestbox");

ArrayList list = (ArrayList)request.getAttribute("selectStudentExcel");

int v_dispnum = 0;
String v_userid = "";
String v_name   = "";
String v_orga_ename   = "";
String v_jikwinm    = "";
String v_resno    = "";
String v_email    = "";
String v_comptel    = "";
String v_handphone    = "";
String v_appdate    = "";
String v_subjnm = "";
int v_subjseq = 0;
int v_subjseqgr = 0;
int v_cpsubjseq = 0;
String v_edustart = "";
String v_eduend = "";
String v_cpnm = "";
String v_grcodenm    = "";
int v_rowcount = 0; 
String v_title = "";
String v_work_plcnm = "";
	
if(box.getString("p_downgubun").equals("1")){
	//Ȯ���ڸ�� �ٿ�ε�
	v_title = "���� Ȯ���� ���";
	v_date = "��û��";
}
else if(box.getString("p_downgubun").equals("2")){
	//����ڸ�� �ٿ�ε�
	v_title = "���� ����� ���";
	v_date = "�����";
}
else{
	//��û�ڸ�� �ٿ�ε�
	v_title = "���� ��û�� ���";
	v_date = "��û��";
}
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>Untitled Document</title>

</head>

<body>
<table border="0" cellpadding="5" cellspacing="1" bgcolor="#333333" style="font-size:12PX">
  <tr bgcolor="#FFFFFF"> 
    <td colspan="16">�� <%=v_title%> [�� <%=box.getString("total_row_count")%> ��]</td>
  </tr>
</table>
<table border="1" cellpadding="5" cellspacing="1" bgcolor="#333333" style="font-size:12PX">
  <tr bgcolor="#FFFFFF"> 
    <td>��ȣ</td>
    <td>�����׷�</td>
    <td>������ü</td>
    <td>������</td>
    <td>����</td>
    <td>��ü����</td>
    <td>�н��Ⱓ</td>
    <td>���</td>
    <td>����</td>
    <td>����</td>
    <td>�Ҽ�</td>
    <td>�μ�</td>
    <td>�ֹε�Ϲ�ȣ</td>
    <td>�̸���</td>
    <td>�繫����ȭ</td>
    <td>�޴���ȭ</td>
    <td><%=v_date%></td>
  </tr>
<%
String v_deptnam ="";
String v_companynm = "";
	for(int i = 0; i < list.size(); i++) {
        DataBox dbox = (DataBox)list.get(i);  

		//sql = "select a.userid, a.name, a.orga_ename, a.jikwinm, a.resno, a.email, a.comptel, a.handphone, ";
		//sql += " b.appdate, c.subjnm, c.subjseq, c.cpsubjseq, c.edustart, c.eduend, d.cpnm, e.grcodenm ";
            	
		//sql = "select a.subj, a.subjnm, b.subjseq, b.propstart, b.propend, b.edustart, b.eduend, c.cpnm, count(d.userid) as usercnt ";
        
        v_dispnum 		= dbox.getInt("d_dispnum");
        v_userid 		= dbox.getString("d_userid");
        v_name   		= dbox.getString("d_name");
        v_deptnam   	= dbox.getString("d_deptnam");
        v_jikwinm    	= dbox.getString("d_jikwinm");
        v_resno    		= StringManager.substring(dbox.getString("d_resno"),0,6) + "-" + StringManager.substring(dbox.getString("d_resno"),6,13);
        v_email    		= dbox.getString("d_email");
        v_comptel    	= dbox.getString("d_comptel");
        v_handphone    	= dbox.getString("d_handphone");
        v_appdate    	= FormatDate.getFormatDate(dbox.getString("d_adate"),"yyyy/MM/dd");
        v_subjnm 		= dbox.getString("d_subjnm");
        v_subjseq 		= StringManager.toInt(dbox.getString("d_subjseq"));
        v_subjseqgr 		= StringManager.toInt(dbox.getString("d_subjseqgr"));
        v_cpsubjseq 	= StringManager.toInt(dbox.getString("d_cpsubjseq"));
        v_edustart 		= FormatDate.getFormatDate(dbox.getString("d_edustart"),"yyyy/MM/dd");
        v_eduend 		= FormatDate.getFormatDate(dbox.getString("d_eduend"),"yyyy/MM/dd");
        v_cpnm 			= dbox.getString("d_cpnm");
        v_grcodenm    	= dbox.getString("d_grcodenm");        
        v_rowcount 		= dbox.getInt("d_rowcount");
        v_companynm     = dbox.getString("d_companynm");
%>
  <tr bgcolor="#FFFFFF"> 
    <td><div align="center"><%=v_dispnum%></div></td>
    <td><%=v_grcodenm%></td>
    <td><%=v_cpnm%></td>
    <td><%=v_subjnm%></td>
    <td><div align="center"><%=v_subjseqgr%></div></td>
    <td><div align="center"><%=v_cpsubjseq%></div></td>
    <td><div align="center"><%=v_edustart%> - <%=v_eduend%></div></td>
    <td style='mso-number-format:"\@";'><%=v_userid%></td>
    <td><div align="center"><%=v_name%></div></td>
    <td><%=v_jikwinm%></td>
    <td><%=v_companynm%></td>
    <td><%=v_deptnam%></td>
    <td><%=v_resno%></td>
    <td><%=v_email%></td>
    <td><%=v_comptel%></td>
    <td><%=v_handphone%></td>
    <td><div align="center"><%=v_appdate%></div></td>
  </tr>
<%
	}
%>
</table>
</body>
</html>
