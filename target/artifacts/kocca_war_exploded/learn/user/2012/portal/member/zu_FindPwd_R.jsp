<%
//**********************************************************
//  1. ��      ��: �н����� ã�� ���
//  2. ���α׷��� : zu_FindPwd_R.jsp
//  3. ��      ��: �н����� ã�� ���
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��:
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String v_name = box.getString("p_name_2");
    //String v_pwd  = (String)request.getAttribute("pwd");
    String v_tmp_pwd  =  box.getString("tmp_pwd");
    String v_email  = box.getString("v_toEmail");
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
				<td class="pagetitle"><img src="/images/2012/sub/page0/title/member_idpass.gif" alt="���̵� ��й�ȣ ã��"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > <u>���̵�/��й�ȣ ã��</u></td>
			</tr>
		</table>
		<div class="idpass">
			<div class="idfinish">
			
				<% if (v_tmp_pwd.equals("")) {  %>
                      <h6>�Է��Ͻ� ������ ��ġ�ϴ� ������ �����ϴ�</h6>
                   <% } else {  %>
                       <h6><strong><%=v_name %></strong> ȸ������ �ӽ� ��й�ȣ�� <strong><%=v_tmp_pwd %></strong> �Դϴ�.<br />
                           	�ȳ��� �帰 �ӽ� ��й�ȣ�� �α��� �� &quot;������������&quot; ������ �����Ͽ� �ֽñ� �ٶ��ϴ�.
                       </h6>
                   <% } %>
				<br>
				<button type="button" class="btn_nomal_white" onclick="history.go(-1)" title="���� ȭ������ ���ư��ϴ�.">�ڷΰ���</button>
			</div>
		</div>
	</div>

</form>
<!-- form �� -->

<!-- footer -->
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
<!--// footer -->