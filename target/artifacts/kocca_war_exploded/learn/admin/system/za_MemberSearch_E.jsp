<%
//**********************************************************
//  1. ��      ��: ���� ��ȸȭ��
//  2. ���α׷���: za_Subject_L.jsp
//  3. ��      ��: ���� ��ȸȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 12
//  7. ��      ��: 
//**********************************************************
%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page language="java" contentType="application/vnd.ms-excel;charset=euc-kr" %>

<%response.setHeader("Content-Disposition", "inline; filename=MemberInfo.xls");
  response.setHeader("Content-Description", "JSP Generated Data");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>ȸ��DB�˻�</title>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
    <table border="1" cellspacing="0" cellpadding="0">
        <tr> 
          <td class="table_title"><b>ȸ������</b></td>
          <td class="table_title"><b>ID</b></td>
          <td class="table_title"><b>����(�ѱ�)</b></td>
          <td class="table_title"><b>����(����)</b></td>
          <td class="table_title"><b>E-mail</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>�����ȣ(����)</b></td>
          <td class="table_title"><b>�ּ�(����)</b></td>
          <td class="table_title"><b>��ȭ��ȣ(����)</b></td>
          <td class="table_title"><b>��ȭ��ȣ(ȸ��)</b></td>
          <td class="table_title"><b>��ȭ��ȣ(�ڵ���)</b></td>
          <td class="table_title"><b>ȸ���</b></td>
          <td class="table_title"><b>�����ȣ(ȸ��)</b></td>
          <td class="table_title"><b>�ּ�(ȸ��)</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>�����з�</b></td>
          <td class="table_title"><b>���ϼ��ſ���</b></td>
          <td class="table_title"><b>����ó��������</b></td>
          <td class="table_title"><b>�������ͼ��ſ���</b></td>
          <td class="table_title"><b>���԰��</b></td>
          <td class="table_title"><b>���ʰ�����</b></td>
          <td class="table_title"><b>����������</b></td>
        </tr>

        <%  ArrayList  list = (ArrayList)request.getAttribute("memberList");

            for (int i=0; i<list.size(); i++) {
                DataBox dbox = (DataBox)list.get(i); 
                String d_ldate = dbox.getString("d_ldate");
                if ( d_ldate.length() <= 8  ) d_ldate = "20"+d_ldate.replaceAll("/","");
        %>
        <tr> 
          <td class="table_02_1"><%=dbox.getString("d_membergubunnm")%></td>
          <td class="table_02_1"><%=dbox.getString("d_userid")%></td>
          <td class="table_02_1"><%=dbox.getString("d_name")%></td>
          <td class="table_02_1"><%=dbox.getString("d_eng_name")%></td>
          <td class="table_02_1"><%=dbox.getString("d_email")%></td>    
          <td class="table_02_1">&nbsp;<%=dbox.getString("d_jikwi")%> </td>
          <td class="table_02_1"><%=dbox.getString("d_state")%></td>
          <td class="table_02_1">&nbsp;<%=dbox.getString("d_post1")%>-<%=dbox.getString("d_post2")%></td>
          <td class="table_02_1"><%=dbox.getString("d_addr")%></td>
          <td class="table_02_1">&nbsp;<%=dbox.getString("d_hometel")%></td>
          <td class="table_02_1">&nbsp;<%=dbox.getString("d_comptel")%></td>
          <td class="table_02_1">&nbsp;<%=dbox.getString("d_handphone")%></td>
          <td class="table_02_1">&nbsp;<%=dbox.getString("d_comptext")%></td>
          <td class="table_02_1">&nbsp;<%=dbox.getString("d_comp_post1")%>-<%=dbox.getString("d_comp_post2")%></td>
          <td class="table_02_1"><%=dbox.getString("d_comp_addr1")%> <%=dbox.getString("d_comp_addr2")%></td>
          <td class="table_02_1"><%=dbox.getString("d_jikupnm")%></td>
          <td class="table_02_1"><%=dbox.getString("d_degreenm")%></td>
          <td class="table_02_1"><%=dbox.getString("d_ismailing")%></td>
          <td class="table_02_1"><%=dbox.getString("d_isopening")%></td>
          <td class="table_02_1"><%=dbox.getString("d_islettering")%></td>
          <td class="table_02_1"><%=dbox.getString("d_registgubun")%></td>
          <td class="table_02_1"><%=FormatDate.getFormatDate(dbox.getString("d_indate"),"yyyy/MM/dd")%></td>
          <td class="table_02_1"><%=FormatDate.getFormatDate(d_ldate,"yyyy/MM/dd")%></td>
        </tr>
        <%  } %>
      </table>
      <!----------------- ȸ��DB�˻� �� ----------------->
</body>
</html>
