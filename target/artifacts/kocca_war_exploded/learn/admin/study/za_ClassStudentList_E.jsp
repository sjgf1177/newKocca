<%
//**********************************************************
//  1. ��      ��: �����ڵ� �� ������ ����Ʈ
//  2. ���α׷���: za_ClassStudentList_E.jsp
//  3. ��      ��: �����ڵ� �� ������ ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004.1.28
//  7. ��      ��:
//***********************************************************
%>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.system.*" %>

<%//@ page language="java" contentType="application/vnd.ms-excel;name=My_Excel;charset=euc-kr" %>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
  response.setContentType("application/vnd.ms-text");
  response.setHeader("Content-Disposition", "inline; filename=ClassStudentList.xls");
  response.setHeader("Content-Description", "JSP Generated Data");

    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    String  v_userid    = "";
    String  v_subj      = "";
    String  v_year      = "";
    String  v_subjseq   = "";

    ArrayList list = (ArrayList)request.getAttribute("ClassStudentList");
%>  

<html>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<head>
<title></title>
</head>

<body>

  <table border="1">
  <tr align="center">
    <td>Ŭ����</td>
    <td>�����ID</td>
    <td>����ID</td>
    <td>����</td>
    <td>����</td>
  </tr>
<%
    for(int i = 0; i < list.size(); i++) {
      DataBox dbox = (DataBox)list.get(i);
      v_subj          = dbox.getString("d_subj");
      v_year          = dbox.getString("d_year");
      v_subjseq       = dbox.getString("d_subjseq");
      v_userid        = dbox.getString("d_userid");
%>
        <tr>
            <td></td>
            <td><%=v_userid%></td>
            <td></td>
            <td><%=v_subj%></td>
            <td><%=v_subjseq%></td>
        </tr>
<%
    }

%>
</table>   


</table>
</body>
</html>