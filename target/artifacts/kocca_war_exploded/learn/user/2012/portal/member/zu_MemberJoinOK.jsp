<%
//**********************************************************
//  1. ��      ��: ȸ������ �Ϸ�
//  2. ���α׷��� : zu_MemberJoinOk.jsp
//  3. ��      ��: ȸ������ �Ϸ�
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��:
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    
    box.put("topmenu","1");
	box.put("submenu","2");
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
	<input type="hidden"	name="p_process"	value="" >
	<input type="hidden"	name="p_resno" value="" >
	
	<!--Ÿ��Ʋ�κ�//-->
	<div class="content">
		<div class="joinfinish"><img src="/images/2012/sub/page0/join_finish.gif" alt="�ѱ���������ī���� ȸ�������� �Ϸ�Ǿ����ϴ�."></div>
	</div>

</form>
<!-- form �� -->

<!-- footer -->
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
<!--// footer -->