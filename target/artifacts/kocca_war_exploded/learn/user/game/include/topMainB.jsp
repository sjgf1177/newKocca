<%
    String topmenu  = "0"; 
%>
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" >
<meta http-equiv="Pragma" content="no-cache" >
<TITLE> :::: ���̹� ���� ��ī���� :::: </TITLE>
<link rel="stylesheet" type="text/css" href="/css/user_style2.css" >
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="VBScript" src="/script/cresys_lib.vbs"></script>
</HEAD>

<BODY <%=onLoad%>>

<!----------------- ������ / �޴��̵���ũ��Ʈ ���� ----------------->
<%@ include file="/learn/user/game/include/common.jsp"%>
<!----------------- ������ / �޴��̵���ũ��Ʈ �� ------------------>

<table width="100%" border="0" cellpadding="0" cellspacing="0" background="<%=tem_imgpath%><%=tem_topbg%>">
  <tr>
    <td>
	<!-- top -->
	  <table width="1000" height="108" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="194">&nbsp;</td>
          <td width="806" align="right">
            <!----------------- global menu ���� ----------------->
            <%@ include file="/learn/user/game/include/globalmenuB.jsp"%>
            <!-----------------  global menu �� ------------------>
          </td>
        </tr>
        <tr> 
          <td valign="bottom"><a href="/indexGame.jsp"><img src="<%=tem_imgpath%><%=tem_toplogo%>" border="0"></a></td>
          <td valign="top">
            <!----------------- menu flash ���� ----------------->
            <%@ include file="/learn/user/game/include/menuflashB.jsp"%>
            <!----------------- menu flash �� ------------------>
          </td>
        </tr>
        <tr>
          <td width="216" valign="bottom" bgcolor="#FFFFFF">&nbsp;</td>
          <td align="right" valign="top" bgcolor="#FFFFFF"><img src="/images/user/game/homepage/type2/con_top.gif"></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>