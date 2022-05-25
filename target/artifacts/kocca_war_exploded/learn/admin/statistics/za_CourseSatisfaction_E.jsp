<%
//**********************************************************
//  1. ��      ��: ���ԡ���� ������ ������ ���
//  2. ���α׷��� : za_CourseStatistics_L.jsp
//  3. ��      ��: ���ԡ���� ������ ���
//  4. ȯ      ��: JDK 1.7
//  5. ��      ��: 1.0
//  6. ��      ��: ����� 2016. 6. 10
//  7. ��      ��:
//***********************************************************
%>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%	
	response.setContentType("application/vnd.ms-text");
	response.setHeader("Content-Disposition", "inline; filename=za_CourseStatistics_E.xls");
	response.setHeader("Content-Description", "JSP Generated Data");
%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.research.*" %>
<%@ page import = "com.credu.library.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%	
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String searchCondition = box.getStringDefault("searchCondition", "year");
    String searchGubun = box.getStringDefault("searchGubun", "ALL");
    String searchDateGubun = box.getStringDefault("searchDateGubun", "eduend");
    String searchStartDate = box.getString("searchStartDate");
    String searchEndDate = box.getString("searchEndDate");

    DataBox dbox = null;

    ArrayList<DataBox> selectCourseSatisfactionList = (ArrayList<DataBox>)request.getAttribute("selectCourseSatisfactionList");

    int sulCnt = 0;
    double distcodeAvg = 0;
%>
<html>
<head>
<title>���ԡ���� ������ ������ ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
				
				
				<table class="table_out" cellspacing="1" cellpadding="5" border="1">
	                <tr>
	                    <td class="table_title" width="20%"><b>�о�</b></td>
	                    <td class="table_title" width="15%"><b>�����ڵ�</b></td>
	                    <td class="table_title" width="*"><b>������</b></td>
	                    <td class="table_title" width="10%"><b>����</b></td>
	                    <td class="table_title" width="10%"><b>���</b></td>
	                </tr>
<%
        if ( selectCourseSatisfactionList != null && selectCourseSatisfactionList.size() > 0 ) {
%>
<%
            dbox = null;
            for(int i = 0; i < selectCourseSatisfactionList.size(); i++) {
                dbox = (DataBox)selectCourseSatisfactionList.get(i);
                
               	sulCnt = dbox.getInt("d_sul_cnt");
               	distcodeAvg = dbox.getDouble("d_distcode_avg");
%>
				<tr>
	                <td class="table_02_1" ><%=dbox.getString("d_areanm")%></td>
	                <td class="table_02_1" ><%=dbox.getString("d_subj")%></td>
	                <td class="table_02_2" ><%=dbox.getString("d_subjnm")%></td>
	                <td class="table_02_1" ><%= sulCnt %></td>
	                <td class="table_02_1" ><%= distcodeAvg %> </td>
	            </tr>
<%
                
            }
%>
            </table>
<%            
        }
%>

</body>
</html>
