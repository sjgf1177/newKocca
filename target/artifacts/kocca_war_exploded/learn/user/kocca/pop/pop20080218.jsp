<html>
<%@ page contentType = "text/html;charset=euc-kr" %>
<title>문화콘텐츠 전문가과정 10기 수강생 모집</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" >
<meta http-equiv="Pragma" content="no-cache" >
<link href="/css/user_style_k1.css" rel="stylesheet" type="text/css">
<SCRIPT language="JavaScript"> 
<!-- 
// 체크후 닫기버튼을 눌렀을때 쿠키를 만들고 창을 닫습니다

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
		setCookie( "kocca_open", "done" , 1); // 쿠키값 체크
		self.close();
	}
}
</SCRIPT>
</head>

<body leftmargin="0" topmargin="0">
<form name="frm" method="post">
<table width="400" border="0" cellspacing="0" cellpadding="0">

<tr>
<td><img src="img/021804.jpg"></td>
</tr>
<tr>
<td><img src="img/021805.gif" border="0" usemap="#Map"></td>
</tr>
<tr>
<td height="25" bgcolor="d4d4d3">
<div>
<div align="center" class="style1">

<label></label><div align="center" class="style1">
<input type="checkbox" name="checkvalue" value="Y" onclick="closeWin();">
<span class="style3"><a href="javascript:closeWin();">오늘 하루 이 창을 열지 않음</a></span> </div></td>
</tr>
</table>
<map name="Map">
    <area shape="rect" coords="148,250,291,269" href="http://contents.connect.or.kr/servlet/controller.homepage.MainServlet
" onFocus="this.blur()" target="_blank">
    <area shape="rect" coords="257,317,366,350" href="http://contents.connect.or.kr/servlet/controller.homepage.KHomeNoticeServlet?p_process=selectView&p_seq=314" onFocus="this.blur()" target="_blank">
</map>
</form>
</body>
</html>