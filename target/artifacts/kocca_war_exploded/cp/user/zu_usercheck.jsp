<%
//**********************************************************
//  1. ��      ��: ������ ��ȸ
//  2. ���α׷���: zu_usercheck.jsp
//  3. ��      ��: ����ȸ�� ���Խ� ������ ��ȸ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2005.2.15
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=MS949" %>
<%//@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.library.*" %>

<%
RequestBox box = (RequestBox)request.getAttribute("requestbox");

DataBox dbox = (DataBox)request.getAttribute("userCheck");

//�������� �´ٸ� v_cnt ���� 1�� ��ȯ��.
int v_cnt = dbox.getInt("d_cnt");

if(v_cnt > 0){
%>
<script language="javascript">
//parent.form1.p_ischk.value = "0";
parent.regist_form.check_flag.value = "1";
parent.regist_form.hidden_staffid.value = "<%//=userid%>";
parent.regist_form.hidden_staffname.value = "<%//=hname%>";
alert("����ڵ��� �系 ���������� Ȯ�εǾ����ϴ�.");
</script>
<%
}
else{
%>
<script language="javascript">
//parent.form1.p_ischk.value = "1";
parent.regist_form.check_flag.value = "0";
alert("�Է��Ͻ� ������ �ش��ϴ� ��� �������� �����ϴ�.\n\nȮ���� �ٽ� �Է��� �ּ���.");
</script>
<%
}
%>


