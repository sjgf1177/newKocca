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
<%@ page language="java" contentType="application/vnd.ms-excel;charset=euc-kr" %>
 
<% response.setHeader("Content-Disposition", "attachment; filename=CP_SubjSeqCode.xls");
   response.setHeader("Content-Description", "JSP Generated Data");

RequestBox box = (RequestBox)request.getAttribute("requestbox");

ArrayList list = (ArrayList)request.getAttribute("selectExcelSubjDown");

String v_subjnm = "";
String v_subj = "";
String v_subjseq = "";
String v_subjseqgr = "";
String v_edustart = "";
String v_eduend = "";
String v_stucnt = "";

%>
<body>
<table border="0" cellpadding="5" cellspacing="1" bgcolor="#333333" style="font-size:12PX">
  <tr bgcolor="#FFFFFF">
    <td colspan="16">�� �����ڵ�ǥ </td>
  </tr>
</table>
<table border="1" cellpadding="5" cellspacing="1" bgcolor="#333333" style="font-size:12PX">
  <tr bgcolor="#FFFFFF">
    <td>��ȣ</td>
    <td>������</td>
    <td>�����ڵ�</td>
    <td>����</td>
    <td>����������</td>
    <td>����������</td>
    <td>�л���</td>
  </tr>
<%
	for(int i = 0; i < list.size(); i++) {
        DataBox dbox = (DataBox)list.get(i);
        v_subjnm    = dbox.getString("d_subjnm");
        v_subj      = dbox.getString("d_scsubj");
        v_subjseq   = dbox.getString("d_scsubjseq");
        v_subjseqgr = dbox.getString("d_subjseqgr");
        v_edustart  = dbox.getString("d_edustart");
        v_eduend    = dbox.getString("d_eduend");
        v_stucnt    = dbox.getString("d_stucnt");
        
        v_edustart          = FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd");
        v_eduend            = FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd");


%>
  <tr bgcolor="#FFFFFF">
    <td><div align="center"><%=i+1%></div></td>
    <td><%=v_subjnm%></td>
    <td><%=v_subj%></td>
    <td><%=v_subjseqgr%></td>
    <td><%=v_edustart%></td>
    <td><%=v_eduend%></td>
    <td><%=v_stucnt%></td>
  </tr>
<%
	}
%>
</table>
</body>
