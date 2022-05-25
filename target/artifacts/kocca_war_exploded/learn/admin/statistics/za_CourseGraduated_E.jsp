<%
//**********************************************************
//  1. ��      ��: ����(���) �������+������ ��� �����ٿ�ε�
//  2. ���α׷��� : za_CourseGraduated_E.jsp
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
	response.setHeader("Content-Disposition", "inline; filename=za_CourseGraduated_E.xls");
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

    ArrayList<DataBox> selectList = (ArrayList<DataBox>)request.getAttribute("selectCourseGraduatedList");

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
				        <td align="center" height="30" colspan="7"><font size="3"><b>���� B2C ������ ���ᡤ������ ���</b></font></td>
				    </tr>
	                <tr>
				        <td align="center" height="30" colspan="7"><font size="3"><b>�������� ���� ������ ���� : <%= searchStartDate %> ~ <%= searchEndDate %></b></font></td>
				    </tr>
	                <tr>
	                    <td class="table_title" width="10%"><b>�о�</b></td>
	                    <td class="table_title" width="10%"><b>�����ڵ�</b></td>
	                    <td class="table_title" width="*"><b>������</b></td>
	                    <td class="table_title" width="10%"><b>���۳⵵</b></td>
	                    <td class="table_title" width="10%"><b>����</b></td>
	                    <td class="table_title" width="10%"><b>������������</b></td>
	                    <td class="table_title" width="10%"><b>���������</b></td>
	                </tr>
	                
<%!
		public class AreaInfo { //�оߺ� ���� Ŭ����
			public int gradCnt = 0;
	
			public int sulSum = 0;
			public int sulCnt = 0;
			public int sulKind = 0;
		}
%>	                
<%
        if ( selectList != null && selectList.size() > 0 ) {
        	
            dbox = null;
            
            Map<String, AreaInfo> mapArea = new HashMap<String, AreaInfo>();
            mapArea.put( "K0", new AreaInfo() );
            mapArea.put( "B0", new AreaInfo() );
            mapArea.put( "G0", new AreaInfo() );

            int tot_gradCnt = 0;
           	int tot_sulCnt = 0;
           	int tot_sulKind = 0;
           	int tot_sulSum = 0;

	           	for(int i = 0; i < selectList.size(); i++) {
	                dbox = (DataBox)selectList.get(i);
	                // �о� ����
	                String area = dbox.getString("d_area");
	                AreaInfo dArea = (AreaInfo)mapArea.get(area);
	                dArea.gradCnt += dbox.getInt("d_isgraduated_b2c");
	                dArea.sulCnt += dbox.getInt("d_sul_cnt");
	                dArea.sulSum += dbox.getInt("d_distcode_avg");
	                if ( dbox.getInt("d_sul_cnt") > 0 ) dArea.sulKind ++;
	                // ��ü
	                tot_gradCnt += dbox.getInt("d_isgraduated_b2c");
	                tot_sulCnt += dbox.getInt("d_sul_cnt");
	                tot_sulSum += dbox.getInt("d_distcode_avg");
	                if ( dbox.getInt("d_sul_cnt") > 0 ) tot_sulKind++;
	            }
%>
				<tr>
	                <td class="table_02" colspan="4">�� ��</td>
	                <td class="table_02" ><%= tot_gradCnt %></td>
	                <td class="table_02" ><%= tot_sulCnt %></td>
	                <td class="table_02" ><%= (tot_sulKind!=0?tot_sulSum/tot_sulKind:0) %></td>
	            </tr>
	            <% AreaInfo dArea = new AreaInfo(); %>
				<tr>
					<% dArea = (AreaInfo)mapArea.get("B0"); %>
	                <td class="table_02" colspan="2">��ۿ���</td>
	                <td class="table_02" colspan="2">��ۿ��� �հ�</td>
	                <td class="table_02" ><%= dArea.gradCnt %></td>
	                <td class="table_02" ><%= dArea.sulCnt %></td>
	                <td class="table_02" ><%= (dArea.sulKind!=0?dArea.sulSum/dArea.sulKind:0) %></td>
	                <%-- <td class="table_02" ><%= sulSum_B0 %></td> --%>
	            </tr>
				<tr>
					<% dArea = (AreaInfo)mapArea.get("G0"); %>
	                <td class="table_02" colspan="2">���Ӱ���</td>
	                <td class="table_02" colspan="2">���Ӱ��� �հ�</td>
	                <td class="table_02" ><%= dArea.gradCnt %></td>
	                <td class="table_02" ><%= dArea.sulCnt %></td>
	                <td class="table_02" ><%= (dArea.sulKind!=0?dArea.sulSum/dArea.sulKind:0) %></td>
	            </tr>
				<tr>
					<% dArea = (AreaInfo)mapArea.get("K0"); %>
	                <td class="table_02" colspan="2">��ȭ������</td>
	                <td class="table_02" colspan="2">��ȭ������ �հ�</td>
	                <td class="table_02" ><%= dArea.gradCnt %></td>
	                <td class="table_02" ><%= dArea.sulCnt %></td>
	                <td class="table_02" ><%= (dArea.sulKind!=0?dArea.sulSum/dArea.sulKind:0) %></td>
	            </tr>
            
<%
	            dbox = null;
	            for(int i = 0; i < selectList.size(); i++) {
	                dbox = (DataBox)selectList.get(i);
%>
				<tr>
	                <td class="table_02_1" ><%=dbox.getString("d_areanm")%></td>
	                <td class="table_02_1" ><%=dbox.getString("d_subj")%></td>
	                <td class="table_02_2" ><%=dbox.getString("d_subjnm")%></td>
	                <td class="table_02_1" ><%=dbox.getString("d_crdate")%></td>
	                <td class="table_02_1" ><%=dbox.getString("d_isgraduated_b2c")%></td>
	                <td class="table_02_1" ><%=dbox.getString("d_sul_cnt")%></td>
	                <td class="table_02_1" ><%=dbox.getString("d_distcode_avg")%> </td>
	            </tr>
<%            
           		}
            
        	} else {
%>
                <tr>
                    <td class="table_02" colspan="17">��ȸ�� �ڷᰡ �����ϴ�.</td>
                </tr>
<%
        	}
%>
            </table>

</body>
</html>
