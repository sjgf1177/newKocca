<html>
<%@ page contentType = "text/html;charset=euc-kr" %>
<title>��ȭ������ ��ũ����� 7�� ������ ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" >
<meta http-equiv="Pragma" content="no-cache" >
<link href="/css/user_style_k1.css" rel="stylesheet" type="text/css">
<SCRIPT language="JavaScript"> 
<!-- 
// üũ�� �ݱ��ư�� �������� ��Ű�� ����� â�� �ݽ��ϴ�

function eg_popup()
{
	var todayDate = new Date();
	todayDate.setDate( todayDate.getDate() + 1 );
	document.cookie = "MainPopup=done; path=/; expires=" + todayDate.toGMTString() + ";" 
	self.close();
}

function setCookie( name, value, expiredays ) 
{ 
var todayDate = new Date(); 
todayDate.setDate( todayDate.getDate() + expiredays ); 
document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
} 
 
function closeWin() 
{ 
	if(document.frm.checkvalue.checked)
	{
		setCookie( "kocca_open", "done" , 1); // ��Ű�� üũ
		self.close();
	}
}
</SCRIPT>
</head>

<body leftmargin="0" topmargin="0">
<form name="frm" method="post">
<table width="400" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><img src="img/6.gif"></td>
</tr>
<tr>
<td><img src="img/7.gif" border="0" usemap="#Map"></td>
</tr>
<tr>
<td height="25" bgcolor="d4d4d3">
<div>
<div align="center" class="style1">

<label></label><div align="center" class="style1">
<input type="checkbox" onClick="eg_popup();" name="checkbox">
<span class="style3"><a href="javascript:close();">���� �Ϸ� �� â�� ���� ����</a></span> </div></td>
</tr>
</table>
<map name="Map">
<area shape="rect" coords="240,276,341,297" href="http://contents.connect.or.kr/servlet/controller.homepage.KHomeNoticeServlet?p_process=selectView&p_seq=250" target="_blank">
</map>
</form>
</body>
</html>
