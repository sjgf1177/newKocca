<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page import="com.credu.library.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "java.lang.String" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
//DEFINED class&variable START
RequestBox box = (RequestBox)request.getAttribute("requestbox");
if (box == null) box = RequestManager.getBox(request);

int p_userCnt = box.getInt("p_userCnt");
String p_message = box.getString("p_message");

box.setSession("isevent","Y");

if(p_message.equals("Y")) {
	if(p_userCnt > 0) {
	%>
		<script>
		 parent.document.mform1.p_isevent.value = "Y";
		 alert("��õȸ�� Ȯ���� �Ǿ����ϴ�\n\nȸ������ �̺�Ʈ �Ⱓ ���� 1������\n1������ �����Ͻ� �� �ֽ��ϴ�");
		</script>
	<%
	} else {
	%>
		<script>
		 parent.document.mform1.p_isevent.value = "N";
		 alert("ȸ�����̵� �ٽ� �� �� Ȯ���Ͻʽÿ�!");
		</script>
	<%
	}
}
%>