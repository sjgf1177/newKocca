<%
    String topmenu  = "0"; 
%>
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" >
<meta http-equiv="Pragma" content="no-cache" >
<TITLE> :::: ���̹� ���� ��ī���� :::: </TITLE>
<link rel="stylesheet" type="text/css" href="/css/user_style1.css" >
<link rel="stylesheet" type="text/css" href="/css/user_style_new.css" >
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="VBScript" src="/script/cresys_lib.vbs"></script>
<script language = "javascript" src = "/script/user_patch.js"></script>
</HEAD>

<BODY <%=onLoad%>>
<!----------------- ������ / �޴��̵���ũ��Ʈ ���� ----------------->
<%@ include file="/learn/user/game/include/common.jsp"%>
<!----------------- ������ / �޴��̵���ũ��Ʈ �� ------------------>
<div id="topmenu">
<%@ include file="/learn/user/game/include/menuflashA.jsp"%>
</div>

     
<table cellpadding="0" cellspacing="0" width="100%" height="100%">
<tr valign="top" height="64">
<td>
	<!-- TOP --><!--height 97���� 64�� ����-->
	<table cellpadding="0" cellspacing="0" width="100%" height="64" background="<%=tem_imgpath%><%=tem_topbg%>" style="table-layout:fixed;" border="0">
	<COLGROUP>
        <COL width=1>
        <COL width=999><!--070703����-->
        <COL>
	<tr>
	<td width="22%" rowspan="2" valign="top"><!-- Logo -->
		<% String v_indexURL = "";
		   String s_tem_grcode = box.getSession("tem_grcode");
		   if (s_tem_grcode.equals("N000002")) {
		   	v_indexURL = "/indexGame.jsp";
		   } else {
		   	v_indexURL = "/index" + s_tem_grcode + ".jsp";
		   }
		%>
		<a href="<%=v_indexURL%>"><img src="<%=tem_imgpath%><%=tem_toplogo%>"></a><br>
	</td><!--padding-right:95px;-->
	<td width="77%" height=31 valign="top" style="text-align:right;padding-right:5px;"><!-- top menu -->
    <!----------------- global menu ���� ----------------->
    <%@ include file="/learn/user/game/include/globalmenuA.jsp"%>
    <!-----------------  global menu �� ------------------>
	</td>
	<td rowspan="2"></td>
	</tr>
	<!--���� menu flash �ڸ�-->	
	</table>
	<!-- // TOP -->
</td>
</tr>

<tr valign="top">
<td background="<%=tem_imgpath%><%=tem_mainbg%>" bgcolor="#f6f6f6">

	<!-- KEY VISUAL FLASH -->
	<table cellpadding="0" cellspacing="0" width="1020" height="245">
	<tr>
	<td><!-- mainflash.swf --><!--setParam2('1000');setParam3('212');height="193"-->
	
			<script language = "javascript" src = "/script/user_patch.js"></script>
			<script language='javascript'>
			setParam1('<%=tem_imgpath+""+tem_mainflash%>');
			setParam2('766');
			setParam3('245');
			//alert("1111");
			object_patch('leftmenuB');
			setParam1('');
			setParam2('');
			setParam3('');
			</script>
		<!--object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="766" height="245">
        <param name="movie" value="<%//=tem_imgpath%><%//=tem_mainflash%>">
        <param name="quality" value="high">
        <embed src="<%//=tem_imgpath%><%//=tem_mainflash%>" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="766" height="245"></embed></object--><br>
	</td>
	<!---->
	<td><img src="<%=tem_imgpath%>N000002_righteventbg.gif"></td>
	</tr>
	</table>
	<!-- //KEY VISUAL FLASH -->

	<!-- CONTENTS -->
	<TABLE width=1000 height="100%" cellPadding=0 cellSpacing=0 >
        <COLGROUP>
        <COL width=212>
        <COL width=564>
        <COL width=224>
        <TR vAlign=top>
              <TD width="212" align=center>