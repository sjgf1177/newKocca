<%@ page contentType="text/html; charset=euc-kr" import="java.util.*, javax.mail.*, javax.mail.internet.*, com.credu.library.*" %>
<%
boolean success = false;
Mailing mailing = new Mailing();
success = mailing.send("218.232.93.13","jhcho75@hanmail.net","������","jhcho75@hanmail.net","TEST","TESTTTTTTTTTTT");
if(success) {
%>
<script>
alert('������ ���������� �߼۵Ǿ����ϴ�.');
history.back();
</script>
<%
} else {
%>
<script>
alert('���� �߼��� �����Ͽ����ϴ�!');
//history.back();
</script>
<%
}
%>