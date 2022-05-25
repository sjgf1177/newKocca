<%
//**********************************************************
//  1. ��      ��: �������
//  2. ���α׷��� : za_ajax_GoldclassStat.jsp
//  3. ��      ��: ����_���Ŭ�������
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: 
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.statistics.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }


    ArrayList list     = (ArrayList)request.getAttribute("selectList");

%>
          
	<table class="table_out" cellspacing="1" cellpadding="5">
		<tr>
			<td colspan="14" class="table_top_line"></td>
		</tr>
		<tr>
            <td class="table_title" width="9%" height="25"><b>�з�</b></td>
   	        <td class="table_title" width="7%"><b>1��</b></td>
   	        <td class="table_title" width="7%"><b>2��</b></td>
   	        <td class="table_title" width="7%"><b>3��</b></td>
   	        <td class="table_title" width="7%"><b>4��</b></td>
   	        <td class="table_title" width="7%"><b>5��</b></td>
   	        <td class="table_title" width="7%"><b>6��</b></td>
   	        <td class="table_title" width="7%"><b>7��</b></td>
   	        <td class="table_title" width="7%"><b>8��</b></td>
   	        <td class="table_title" width="7%"><b>9��</b></td>
   	        <td class="table_title" width="7%"><b>10��</b></td>
   	        <td class="table_title" width="7%"><b>11��</b></td>
   	        <td class="table_title" width="7%"><b>12��</b></td>
   	        <td class="table_title" width="7%"><b>�հ�</b></td>
       	    
		</tr>
	<%
		String t_area = "";
		int t_tot = 0;
		int t_jan = 0;	int t_feb = 0;	int t_mar = 0;	int t_apr = 0;
		int t_may = 0;	int t_jun = 0;	int t_jul = 0;	int t_aug = 0;
		int t_sep = 0;	int t_oct = 0;	int t_nov = 0;	int t_dec = 0;
		
	    for(int i = 0; i < list.size(); i++) {
	
	        DataBox tbox = (DataBox)list.get(i);
	        t_area				= tbox.getString("d_area");
	        t_tot				= tbox.getInt("d_tot");
	        t_jan				= tbox.getInt("d_jan");
	        t_feb				= tbox.getInt("d_feb");
	        t_mar				= tbox.getInt("d_mar");
	        t_apr				= tbox.getInt("d_apr");
	        t_may				= tbox.getInt("d_may");
	        t_jun				= tbox.getInt("d_jun");
	        t_jul				= tbox.getInt("d_jul");
	        t_aug				= tbox.getInt("d_aug");
	        t_sep				= tbox.getInt("d_sep");
	        t_oct				= tbox.getInt("d_oct");
	        t_nov				= tbox.getInt("d_nov");
	        t_dec				= tbox.getInt("d_dec");
	        if(t_area.equals("B0")){t_area = "���";}
	        else if(t_area.equals("K0")){t_area = "��ȭ";}
	        else if(t_area.equals("G0")){t_area = "����";}
	        else {t_area = "�հ�";}
	%>
		<tr>
       	    <td class="table_01" style="font-weight:bold;"><%=t_area%></td>
   	        <td <%=t_area.equals("�հ�") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=new java.text.DecimalFormat("##,###,##0").format(t_jan)%></td>
   	        <td <%=t_area.equals("�հ�") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=new java.text.DecimalFormat("##,###,##0").format(t_feb)%></td>
   	        <td <%=t_area.equals("�հ�") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=new java.text.DecimalFormat("##,###,##0").format(t_mar)%></td>
   	        <td <%=t_area.equals("�հ�") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=new java.text.DecimalFormat("##,###,##0").format(t_apr)%></td>
   	        <td <%=t_area.equals("�հ�") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=new java.text.DecimalFormat("##,###,##0").format(t_may)%></td>
   	        <td <%=t_area.equals("�հ�") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=new java.text.DecimalFormat("##,###,##0").format(t_jun)%></td>
   	        <td <%=t_area.equals("�հ�") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=new java.text.DecimalFormat("##,###,##0").format(t_jul)%></td>
   	        <td <%=t_area.equals("�հ�") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=new java.text.DecimalFormat("##,###,##0").format(t_aug)%></td>
   	        <td <%=t_area.equals("�հ�") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=new java.text.DecimalFormat("##,###,##0").format(t_sep)%></td>
   	        <td <%=t_area.equals("�հ�") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=new java.text.DecimalFormat("##,###,##0").format(t_oct)%></td>
   	        <td <%=t_area.equals("�հ�") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=new java.text.DecimalFormat("##,###,##0").format(t_nov)%></td>
   	        <td <%=t_area.equals("�հ�") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=new java.text.DecimalFormat("##,###,##0").format(t_dec)%></td>
   	        <td <%=t_area.equals("�հ�") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=new java.text.DecimalFormat("##,###,##0").format(t_tot)%></td>
		</tr>
	<%} %>
 	</table>