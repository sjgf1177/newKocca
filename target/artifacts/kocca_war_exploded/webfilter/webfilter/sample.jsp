<%@ page contentType="text/html; charset=euc-kr"%>
<html>
<head>
<title>sample</title>

<Script Language="javascript">
function send(){
	document.frm.submit();
}              
</script>

</head>

<body>
<form name="frm" action="/board/board_write_action.jsp" method="post">
<table class="view1" title="����" summary="�����Դϴ�.">
	<tr>
		<td>����</td>
		<td><input type="text" name="subject"></td>
	</tr>	
	<tr>
		<td>����</td>
		<td><textarea name="content" cols="60" rows="10"></textarea></td>
	</tr>	
</table>
<input type="button" value="���" onclick="send();">
</form>
<!--  ������ ���� -->  
<%@ include file="/webfilter/inc/initCheckWebfilter.jsp"%>
<!--  ������ ���� -->
</body>
</html>