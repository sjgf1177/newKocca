<%
//**********************************************************
//  1. ��      ��: SUBJECT PREVIEW PAGE
//  2. ���α׷���: gu_SubjectPreviewOn.jsp
//  3. ��      ��: �����ȳ�
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004. 01.12
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.account.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    box.put("leftmenu","01");                       // �޴� ���̵� ����

    String  v_process      = box.getString("p_process");
    
    ArrayList list = (ArrayList)request.getAttribute("MyBillList");
    
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topApply.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->


<SCRIPT LANGUAGE="JavaScript">
<!--
    function detail() {
        farwindow = window.open("", "openWin", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 920, height = 640, top=0, left=0");
        document.topdefaultForm.target = "open"
        document.topdefaultForm.action = "/servlet/controller.account.AccountManagerServlet";
        document.topdefaultForm.submit();

        farwindow.window.focus();
    }    

//-->
</SCRIPT>



	<!-- title -->
	<table width="720" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
		<td width="720" height="35" align="right"  background="/images/user/game/account/tit_state.gif" class="location" ><img src="/images/user/game/common/location_bl.gif">
		  HOME > ������û > ������Ȳ</td>
	  </tr>
	  <tr> 
		<td height="20"></td>
	  </tr>
	</table>
	
	
	<!-- ������Ȳ ����  -->

	<table width="720" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="5"><img src="/images/user/game/account/t_p01.gif" width="192" height="31"></td>
          </tr>
    </table>
	<table width="720" border="2" cellspacing="0" cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
	  <tr  class="lcolor"> 
		<td height="3" colspan="8" class="linecolor_my"></td>
	  </tr>
		  <tr> 
			<td class="tbl_gtit2">NO</td>
			<td class="tbl_gtit2">����</td>
			<td class="tbl_gtit2">������</td>
			<td class="tbl_gtit2">�����ݾ�</td>
			<td class="tbl_gtit2">�������</td>
			<td class="tbl_gtit2">������</td>
			<td class="tbl_gtit2">ȯ�ҿ���</td>
			<td class="tbl_gtit2">ȯ����</td>
		  </tr>
	  </tr>
	  <% for (int i=0; i<list.size(); i++) { 
	  		DataBox dbox = (DataBox)list.get(i); 
	  		
	  		String v_gubunnm 		= dbox.getString("d_gubunnm");
	  		String v_goodname 		= dbox.getString("d_goodname");
	  		int    v_price			= dbox.getInt("d_price");
	  		String v_paymethodnm 	= dbox.getString("d_paymethodnm");
	  		String v_pgauthdate 	= dbox.getString("d_pgauthdate");
	  		String v_cancelyn 		= dbox.getString("d_cancelyn");
	  		String v_cancelresult 	= dbox.getString("d_cancelresult");
	  		String v_canceldate 	= dbox.getString("d_canceldate");
	  		
	  %>
	  <tr> 
		<td class="tbl_grc"><%=i+1%></td>
		<td class="tbl_grc"><%=v_gubunnm%></td>
		<td class="tbl_gleft"><%=v_goodname%></td>
		<td align="right" style="padding-right:10px;"><%=new java.text.DecimalFormat("###,###,##0").format(v_price)%></td>
		<td class="tbl_grc"><%=v_paymethodnm%></td>
		<td class="tbl_grc"><%=FormatDate.getFormatDate(v_pgauthdate,"yyyy/MM/dd")%></td>
		<td class="tbl_grc"><%=v_cancelyn%></td>
		<td class="tbl_grc"><%=FormatDate.getFormatDate(v_canceldate,"yyyy/MM/dd")%></td>
	  </tr>
	  <% } %>
	
	  <% if (list.size()==0) { %>
	  <tr>
 		<td colspan=8 align=center>��ϵ� ������ �����ϴ�.</td>
	  </tr>
	  <% } %>

	</table>
	
	<!-- ������Ȳ �� -->
	
	<br>
	

	

<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->