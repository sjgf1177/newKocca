<%
//**********************************************************
//  1. ��      ��: ����� ��� - ��ü ��Ȳ
//  2. ���α׷��� : za_TotalStat_L.jsp
//  3. ��      ��: ����� ��� - ��ü
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.12.07
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }
    
    int i = 0;
    
    String v_userid = "";
    String v_subjnm = "";
    String v_name = "";
    String v_areaname = "";
    String v_grseqnm = "";
    
    String v_gubun = "";
    String v_gender = "";
    String v_graduated = "";
    
    
%>
<script language="JavaScript">
<!--
function whenExcel() {
	document.form1.target = 'mainFrame';
    $("#isExcel").val("true");
    document.form1.submit();
    $("#isExcel").val("false");
}
//-->
</script>

      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="left" height="20">&nbsp;<b>������Ȳ</b></td>
          <td align="right">
          <a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif" border="0"></a>
           <!--  <button id="exCel">�������</button> -->
          </td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>           
      <!----------------- ��ȸ ���� ----------------->
       <form name = "form1" method = "post">
        <input type="hidden" name="p_process" value="selectTotalStat">
        <input type="hidden" name="p_action" value ="/servlet/controller.course.CourseStateAdminServlet">
        <input type="hidden" name="param"    id ="param" value="<%=box.getString("param")%>">
        <input type="hidden" name="param1" 	id ="param1" value="<%=box.getString("param1")%>">
        <input type="hidden" name="param2" 	id ="param2" value="<%=box.getString("param2")%>">
        <input type="hidden" name="isExcel" id="isExcel" value="false">
      </form>
      
      <table class="table_out" cellspacing="1" cellpadding="5">		
        <tr>
          <td colspan="9" class="table_top_line"></td>
        </tr>
        <tr>
          <td class="table_title" width="5%"><b>No</b></td>
          <td class="table_title"><b>�о�</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>������</b></td>
          <td class="table_title"><b>ID</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>�̸�</b></td>
          <td class="table_title"><b>������</b></td>
          <td class="table_title"><b>����</b></td>      
        </tr>
        
        <%  	
        	ArrayList  list = (ArrayList)request.getAttribute("selectList");

        	for (i=0; i<list.size(); i++) {
        		
				 DataBox dbox = (DataBox)list.get(i);

				v_areaname		= dbox.getString("d_areaname");
				v_gubun		= dbox.getString("d_gubun");
				v_grseqnm		= dbox.getString("d_grseqnm");
		        v_userid		= dbox.getString("d_userid");
		        v_gender		= dbox.getString("d_sex");
		        v_name			= dbox.getString("d_name");
		        v_subjnm		= dbox.getString("d_subjnm");
		        v_graduated		= dbox.getString("d_graduate"); 
		        
		%>
		 <tr class="table_02_1">
		  <td class="table_02_1"><%= i+1 %></td>
          <td class="table_02_1"><%= v_areaname.substring(0,2) %></td>
          <td class="table_02_1"><%= v_gubun %></td>
          <td class="table_02_1"><%= v_grseqnm %></td>
          <td class="table_02_1"><%= v_userid %></td>
          <td class="table_02_1"><%= v_gender %></td>
          <td class="table_02_1"><%= v_name %></td>
          <td class="table_02_1"><%= v_subjnm %></td>
          <td class="table_02_1"><%= v_graduated %></td>
        </tr>
		<%
        	 }
        	if (i == 0) { 
		%>
        <tr>
        	<td align="center" bgcolor="#FFFFFF" height="100" colspan="15">��ϵ� ������ �����ϴ�.</td>
        </tr>
        <% } %>
      </table>
  <%@ include file = "/learn/library/getJspName.jsp" %>
  </body>
</html>