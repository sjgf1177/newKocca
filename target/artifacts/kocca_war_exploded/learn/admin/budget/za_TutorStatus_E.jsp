<%
//**********************************************************
//  1. ��      ��: ������Ȳ
//  2. ���α׷���: za_TutorStatus_L.jsp
//  3. ��      ��: ������Ȳ
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 12. 17
//  7. ��      ��: 
//**********************************************************
%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.budget.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page language="java" contentType="application/vnd.ms-excel;charset=euc-kr" %>

<%
	response.setHeader("Content-Disposition", "inline; filename=TutorInfo.xls");   
	response.setHeader("Content-Description", "JSP Generated Data");
	
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String  v_tutorgubun   = box.getStringDefault("s_tutorgubun","ALL");//���籸��(I:�系����,O:��ܰ���,C:�������)
    String  v_srchsubjnm = box.getStringDefault("p_srchsubjnm","");		//������
    
    String  v_subjclass   = box.getStringDefault("p_subjclass","ALL");    //���Ǻо�
    String  v_tutorname   = box.getStringDefault("p_tutorname","");    //�����


%>

<html>
<head>
<title>������Ȳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td align="center" valign="top">
     
      <!----------------- ���� ���� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out" border=1>
        <tr> 
          <td class="table_title"><b>NO</b></td>
          <td class="table_title"><b>���籸��</b></td>
          <td class="table_title"><b>�����/���������</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>��ȭ</b></td>
          <td class="table_title"><b>�̵���ȭ</b></td>
          <td class="table_title"><b>���Ǻо�</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>�ְ��μ�</b></td>
          <td class="table_title" colspan=2><b>�����Ⱓ</b></td>
          <td class="table_title"><b>������</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>�����簭�ǽð�</b></td>
          <td class="table_title"><b>�ð��簭���</b></td>
          <td class="table_title"><b>�Է��� ���</b></td>
          <td class="table_title"><b>�Է��� ����</b></td>
          <td class="table_title"><b>�Է½ð�</b></td>
        </tr>
        <%  ArrayList  list = (ArrayList)request.getAttribute("tutorStatusList");
		int listsize = list.size();
		double execpercent = 0.00d;
	    for (int i=0; i<list.size(); i++) {
	        DataBox dbox = (DataBox)list.get(i); 
			execpercent = dbox.getDouble("d_execpercent");
			%>
        <tr> 
          <td class="table_01"><%=listsize-i%></td>
          <td class="table_02_1"><%=dbox.getString("d_tutorgubunnm")%></td>
          <td class="table_02_1"><%=dbox.getString("d_name")%></td>
          <td class="table_02_1"><%=dbox.getString("d_compnm")%></td>
          <td class="table_02_1">&nbsp;<%=dbox.getString("d_phone")%></td>
          <td class="table_02_1">&nbsp;<%=dbox.getString("d_handphone")%></td>
          <td class="table_02_1"><%=dbox.getString("d_subjclassnm")%></td>
          <td class="table_02_2"><%=dbox.getString("d_subjnm")%></td>
          <td class="table_02_1"><%=dbox.getString("d_inusercompnm")%></td>
          <td class="table_02_1"><%=dbox.getString("d_edustart")%></td>
          <td class="table_02_1"><%=dbox.getString("d_eduend")%></td>
          <td class="table_02_2"><%=dbox.getString("d_lessonnm")%></td>
          <td class="table_02_1"><%=dbox.getDouble("d_grade")%></td>
          <td class="table_02_1"><%=dbox.getInt("d_eduhr")%></td>
          <td class="table_02_1"><%=dbox.getInt("d_price")%></td>
          <td class="table_02_1">&nbsp;<%=dbox.getString("d_inuserid")%></td>
          <td class="table_02_1"><%=dbox.getString("d_inusername")%></td>
          <td class="table_02_1">&nbsp;<%=FormatDate.getFormatDate(dbox.getString("d_indate"),"yyyy/MM/dd hh:mm:ss")%></td>
        </tr>
        <%  } %>
      </table>
      <!----------------- ���� ���� �� ----------------->
      <br>
    </td>
  </tr>
</table>

</body>
</html>
