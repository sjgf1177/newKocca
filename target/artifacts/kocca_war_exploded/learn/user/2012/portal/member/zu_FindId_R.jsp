<%
//**********************************************************
//  1. ��      ��: ID ã�� ���
//  2. ���α׷��� : zu_FindId_R.jsp
//  3. ��      ��: ID ã�� ���
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��:
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "com.credu.library.*" %>


<%@page import="java.util.List"%><jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    
    box.put("topmenu","1");
	box.put("submenu","3");

    String v_name   = box.getString("p_name");
    List<DataBox> useridlist = (List<DataBox>)request.getAttribute("userid");
    int listsize = useridlist.size();
    String v_userid = "";
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->


<!-- ��ũ��Ʈ���� -->
<script language="JavaScript" type="text/JavaScript">
<!--//

//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- form ���� -->
<form name="form1"  action="" method="post" action="">
	<input type="hidden"	name="p_process"	value="" />	
	
	<div class="content">
		<table class="rootinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagetitle"><img src="/images/2012/sub/page0/title/member_idpass.gif" alt="ȸ����������"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > <u>���̵�/��й�ȣ ã��</u></td>
			</tr>
		</table>
		<div class="idpass">
			<div class="idfinish">
				<% if (listsize > 0) { %>
				<h6>ȸ������ ���̵�� 
				<%
					for(int i = 0 ; i < listsize ; i ++){
            	  	DataBox dbox = (DataBox)useridlist.get(i);
              		v_userid = dbox.getString("d_userid");
              	%>   
				<span><strong><%=v_userid %></strong></span>&nbsp;
				<%} %>
				�Դϴ�.</h6>
				<%	} else {%>
				<h6>�Է��Ͻ� ������ ��ġ�ϴ� ������ �����ϴ�</h6>
				<% } %>
				<br>
				<button type="button" class="btn_nomal_white" onclick="history.go(-1)" title="���� ȭ������ ���ư��ϴ�.">�ڷΰ���</button>
			</div>
		</div>
	</div>
</form>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
