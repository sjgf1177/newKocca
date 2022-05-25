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
			<td colspan="10" class="table_top_line"></td>
		</tr>
		<tr>
            <td class="table_title" width="10%" height="25"><b>�⵵</b></td>
   	        <td class="table_title"><b>����������</b></td>
   	        <td class="table_title" width="8%"><b>����</b></td>
   	        <td class="table_title" width="8%"><b>������</b></td>
   	        <td class="table_title" width="8%"><b>��û��</b></td>
   	        <td class="table_title" width="8%"><b>�ݷ���</b></td>
   	        <td class="table_title" width="8%"><b>���μ�</b></td>
   	        <td class="table_title" width="8%"><b>����</b></td>
   	        <td class="table_title" width="8%"><b>�̼���</b></td>
   	        <td class="table_title" width="8%"><b>�����</b></td>
       	    
		</tr>
	<%
		String	t_grcode 			= "";
		String	t_gyear				= "";
		String	t_grseq				= "";
		String	t_grseqnm			= "";
		String	t_area				= "";
		String	t_areanm			= "";
		int		t_subjcnt			= 0;
		int		t_proposecnt		= 0;
		int		t_studentcnt		= 0;
		int		t_cancelcnt			= 0;
		int		t_isgraduated_y		= 0;
		int		t_isgraduated_n		= 0;
		double  	t_isgraduated_rate	= 0;
		
	    for(int i = 0; i < list.size(); i++) {
	
	        DataBox tbox = (DataBox)list.get(i);
	        t_grcode			= tbox.getString("d_grcode");
	        t_gyear				= tbox.getString("d_gyear");
	        t_grseq				= tbox.getString("d_grseq");
	        t_grseqnm			= tbox.getString("d_grseqnm");
	        t_area				= tbox.getString("d_area");
	        t_subjcnt			= tbox.getInt("d_subjcnt");
	        t_proposecnt		= tbox.getInt("d_proposecnt");
	        t_studentcnt		= tbox.getInt("d_studentcnt");
	        t_cancelcnt			= tbox.getInt("d_cancelcnt");
	        t_isgraduated_y		= tbox.getInt("d_isgraduated_y");
	        t_isgraduated_n		= tbox.getInt("d_isgraduated_n");
	        t_isgraduated_rate	= tbox.getDouble("isgraduatedrate");
	        
	        if(t_area.equals("A0")){t_areanm = "��ü";}
	        else if(t_area.equals("B0")){t_areanm = "���";}
	        else if(t_area.equals("G0")){t_areanm = "����";}
	        else if(t_area.equals("K0")){t_areanm = "��ȭ";}
	        
	%>
		<tr>
       	    <td class="table_01" style="font-weight:bold;"><%=t_gyear%></td>
   	        <td <%=t_area.equals("A0") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=t_area.equals("A0") ? t_grseqnm : "-"%></td>
   	        <td <%=t_area.equals("A0") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=t_areanm%></td>
   	        <td <%=t_area.equals("A0") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=new java.text.DecimalFormat("##,###,##0").format(t_subjcnt)%></td>
   	        <td <%=t_area.equals("A0") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=new java.text.DecimalFormat("##,###,##0").format(t_proposecnt)%></td>
   	        <td <%=t_area.equals("A0") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=new java.text.DecimalFormat("##,###,##0").format(t_cancelcnt)%></td>
   	        <td <%=t_area.equals("A0") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=new java.text.DecimalFormat("##,###,##0").format(t_studentcnt)%></td>
   	        <td <%=t_area.equals("A0") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=new java.text.DecimalFormat("##,###,##0").format(t_isgraduated_y)%></td>
   	        <td <%=t_area.equals("A0") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=new java.text.DecimalFormat("##,###,##0").format(t_isgraduated_n)%></td>
   	        <td <%=t_area.equals("A0") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=new java.text.DecimalFormat("0.00").format(t_isgraduated_rate)%>%</td>
		</tr>
	<%} %>
 	</table>