<%
//**********************************************************
//  1. ��      ��: ���ԡ���� ������ ���
//  2. ���α׷��� : za_CourseStatistics_E.jsp
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
	response.setHeader("Content-Disposition", "inline; filename=za_CourseStatisticsNew_E.xls");
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

    ArrayList<DataBox> selectCourseStatisticList = (ArrayList<DataBox>)request.getAttribute("selectCourseStatisticList");
    
    int tot_studentCnt = 0;
    int tot_stoldCnt = 0;
    
    int studentCnt_G0 = 0;
    int studentCnt_B0 = 0;
    int studentCnt_K0 = 0;
    int stoldCnt_G0 = 0;
    int stoldCnt_B0 = 0;
    int stoldCnt_K0 = 0;
    
    int studentCnt = 0;
    int stoldCnt = 0;

%>

<html>
<head>
<title>���ԡ���� ������ ���  Excel����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

				<table class="table_out" cellspacing="1" cellpadding="4" border="1">
	                <tr>
				        <td align="center" height="30" colspan="5"><font size="3"><b>���� B2C ������ ���� ���</b></font></td>
				    </tr>
	                <tr>
				        <td align="center" height="30" colspan="5"><font size="3"><b>�������� �н����� ������ ���� : <%= searchStartDate %> ~ <%= searchEndDate %></b></font></td>
				    </tr>
	                <tr>
	                    <td class="table_title" width="15%"><b>�о�</b></td>
	                    <td class="table_title" width="10%"><b>�����ڵ�</b></td>
	                    <td class="table_title" width="*"><b>������</b></td>
	                    <td class="table_title" width="10%"><b>���۳⵵</b></td>
	                    <td class="table_title" width="10%"><b>����</b></td>
	                    <!-- <td class="table_title" width="10%"><b>����</b></td>  -->
	                </tr>
                
                
<%
        if ( selectCourseStatisticList != null && selectCourseStatisticList.size() > 0 ) {
            dbox = null;
            for(int i = 0; i < selectCourseStatisticList.size(); i++) {
                dbox = (DataBox)selectCourseStatisticList.get(i);
                if("K0".equals( dbox.getString("d_area") )){
                	if(searchGubun.equals("ALL")){
	                	studentCnt_K0 += (dbox.getInt("d_student_cnt_b2b") + dbox.getInt("d_student_cnt_b2c"));
	                	stoldCnt_K0 += (dbox.getInt("d_isgraduated_b2b") + dbox.getInt("d_isgraduated_b2c"));
                	}else{
	                	studentCnt_K0 += dbox.getInt("d_student_cnt_"+searchGubun.toLowerCase());
	                	stoldCnt_K0 += dbox.getInt("d_isgraduated_"+searchGubun.toLowerCase());
                	}
                }
                
                if("B0".equals( dbox.getString("d_area") )){
                	if(searchGubun.equals("ALL")){
	                	studentCnt_B0 += (dbox.getInt("d_student_cnt_b2b") + dbox.getInt("d_student_cnt_b2c"));
	                	stoldCnt_B0 += (dbox.getInt("d_isgraduated_b2b") + dbox.getInt("d_isgraduated_b2c"));
                	}else{
	                	studentCnt_B0 += dbox.getInt("d_student_cnt_"+searchGubun.toLowerCase());
	                	stoldCnt_B0 += dbox.getInt("d_isgraduated_"+searchGubun.toLowerCase());
                	}
                }
                
                if("G0".equals( dbox.getString("d_area") )){
                	if(searchGubun.equals("ALL")){
	                	studentCnt_G0 += (dbox.getInt("d_student_cnt_b2b") + dbox.getInt("d_student_cnt_b2c"));
	                	stoldCnt_G0 += (dbox.getInt("d_isgraduated_b2b") + dbox.getInt("d_isgraduated_b2c"));
                	}else{
	                	studentCnt_G0 += dbox.getInt("d_student_cnt_"+searchGubun.toLowerCase());
	                	stoldCnt_G0 += dbox.getInt("d_isgraduated_"+searchGubun.toLowerCase());
                	}
                }
                
                
                tot_studentCnt += (dbox.getInt("d_student_cnt_b2b") + dbox.getInt("d_student_cnt_b2c"));
                tot_stoldCnt += (dbox.getInt("d_isgraduated_b2b") + dbox.getInt("d_isgraduated_b2c"));
                
                
            }
%>
			<tr>
                <td class="table_02" colspan="4">�� ��</td>
                <td class="table_02" ><%= tot_studentCnt %></td>
                <!-- <td class="table_02" ><%= tot_stoldCnt %> </td> -->
            </tr>
			<tr>
                <td class="table_02" colspan="2">��ۿ���</td>
                <td class="table_02" colspan="2">��ۿ��� �հ�</td>
                <td class="table_02" ><%= studentCnt_B0 %></td>
                <!-- <td class="table_02" ><%= stoldCnt_B0 %> </td> -->
            </tr>
			<tr>
                <td class="table_02" colspan="2">���Ӱ���</td>
                <td class="table_02" colspan="2">���Ӱ��� �հ� </td>
                <td class="table_02" ><%= studentCnt_G0 %></td>
                <!-- <td class="table_02" ><%= stoldCnt_G0 %> </td> -->
            </tr>
			<tr>
                <td class="table_02" colspan="2">��ȭ������</td>
                <td class="table_02" colspan="2">��ȭ������ �հ� </td>
                <td class="table_02" ><%= studentCnt_K0 %></td>
                <!-- <td class="table_02" ><%= stoldCnt_K0 %> </td> -->
            </tr>
<%            
        } else {
%>
                <tr>
                    <td class="table_02" colspan="17">��ȸ�� �ڷᰡ �����ϴ�.</td>
                </tr>
<%
        }
%>
            </table>
            
<%
        if ( selectCourseStatisticList != null && selectCourseStatisticList.size() > 0 ) {
%>
			<table class="table_out" cellspacing="1" cellpadding="5" border="1">
				<colgroup>
					<col width="15%"/>
					<col width="10%"/>
					<col width="*"/>
					<col width="10%"/>
					<col width="10%"/>
				</colgroup>
<%
            dbox = null;
            for(int i = 0; i < selectCourseStatisticList.size(); i++) {
                dbox = (DataBox)selectCourseStatisticList.get(i);
              	if(searchGubun.equals("ALL")){
	               	studentCnt = (dbox.getInt("d_student_cnt_b2b") + dbox.getInt("d_student_cnt_b2c"));
	               	stoldCnt = (dbox.getInt("d_isgraduated_b2b") + dbox.getInt("d_isgraduated_b2c"));
              	}else{
	               	studentCnt = dbox.getInt("d_student_cnt_"+searchGubun.toLowerCase());
	               	stoldCnt = dbox.getInt("d_isgraduated_"+searchGubun.toLowerCase());
              	}
%>
				<tr>
	                <td class="table_02_1" ><%=dbox.getString("d_areanm")%></td>
	                <td class="table_02_1" ><%=dbox.getString("d_subj")%></td>
	                <td class="table_02_2" ><%=dbox.getString("d_subjnm")%></td>
	                <td class="table_02_1" ><%=dbox.getString("d_crdate")%></td>
	                <td class="table_02_1" ><%= studentCnt %></td>
	                <!-- <td class="table_02_1" ><%= stoldCnt %> </td> -->
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