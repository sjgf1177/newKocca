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
			<td colspan="3" class="table_top_line"></td>
		</tr>
		<tr>
            <td class="table_title" height="25" width="10%"><b>No</b></td>
   	        <td class="table_title"><b>������</b></td>
   	        <td class="table_title" width="20%"><b>�������</b></td>
       	    
		</tr>
	<%
		String t_grcode		= "";
		String t_gyear		= "";
		String t_grseq		= "";
		String t_grseqnm	= "";
		String t_stat		= "";
		
		if(list.size() > 0){
			
		    for(int i = 0; i < list.size(); i++) {
		        DataBox tbox = (DataBox)list.get(i);
		        t_grcode	= tbox.getString("d_grcode");
		        t_gyear		= tbox.getString("d_gyear");
		        t_grseq		= tbox.getString("d_grseq");
		        t_grseqnm	= tbox.getString("d_grseqnm");
		        t_stat		= tbox.getString("d_stat");
	%>
		<tr>
       	    <td class="table_01" style="font-weight:bold;"><%=list.size()-i %></td>
   	        <td class="table_02_1"><%=t_grseqnm %></td>
   	        <td class="table_02_1"><a href="javascript:update_stat('<%=t_grseq %>','<%=t_stat %>');"><%=t_stat %></a></td>
		</tr>
	<%
			}
		}else{
	%>
		<tr>
       	    <td class="table_02_1" colspan="3">��ȸ�� �����Ͱ� �����ϴ�.</td>
		</tr>
	
	<%	} %>
		
 	</table>