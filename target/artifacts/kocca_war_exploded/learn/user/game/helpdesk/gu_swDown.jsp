<%
//**********************************************************
//  1. ��      ��: HelpDesk > SW �ٿ�ε�
//  2. ���α׷��� : gu_swDown.jsp
//  3. ��      ��: SW �ٿ�ε�
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.26
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>


<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box       = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
	box.put("leftmenu","03");

    String  v_process     = box.getString("p_process");

%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topHelpdesk.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->


<script language="JavaScript" type="text/JavaScript">
<!--


//-->

function clickHandler() {
  var targetId, srcElement, targetElement, srcCss;
  srcElement = window.event.srcElement;

  if (srcElement.className == "question") {
     targetId = srcElement.id + "details";
     targetElement = document.all(targetId);
     srcCss = document.all(srcElement.id);

     if (targetElement.style.display == "none") {
        targetElement.style.display = "";
        //srcCss.style.color = "#666666";
        //srcCss.style.font = "normal 9pt \"����\"";
     } else {
        targetElement.style.display = "none";
        //srcCss.style.color = "";
        //srcCss.style.font = "normal 9pt \"����\"";
     }
  }
}

document.onclick = clickHandler;

//-->
</script>


<style type="text/css">
<!--
.l-padding {
	padding-left: 12px;
}
-->
</style>


<form name = "form1" method = "post">
	  <input type = "hidden" name = "p_process"   value = "">
	  <input type = "hidden" name = "p_pageno"    value = "">
	  <input type = "hidden" name = "p_seq"       value = "">
	  <input type = "hidden" name = "p_userid"    value = "">


<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="720" height="35" align="right"  background="/images/user/game/helpdesk/<%=tem_subimgpath%>/tit_swdown.gif" class="location" ><img src="/images/user/game/common/location_bl.gif">
      HOME > Help Desk > S/W�ٿ�ε�</td>
  </tr>
  <tr>
    <td height="20"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/images/user/game/helpdesk/text_swdown.gif"></td>
  </tr>
  <tr>
    <td height="15">&nbsp;</td>
  </tr>
</table>
<!-- ������ȸ -->
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><a href="http://cyber.gameacademy.or.kr/upload/FlashMX2004-kr.zip" target="_blank"><img src="/images/user/game/helpdesk/swdown_01.gif"></a></td>
  </tr>
  <tr>
    <td><a href="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" target="_blank"><img src="/images/user/game/helpdesk/swdown_02.gif" width="720" height="109"></a></td>
  </tr>
  <tr>
    <td><a href="http://www.macromedia.com/shockwave/download/download.cgi?Lang=Korean&P5_Language=Korea" target="_blank"><img src="/images/user/game/helpdesk/swdown_03.gif"></a></td>
  </tr>
  <tr>
    <td><a href="http://www.real.com" target="_blank"><img src="/images/user/game/helpdesk/swdown_04.gif"></a></td>
  </tr>
  <tr>
    <td><a href="http://java.com/ko/download/windows_automatic.jsp" target="_blank"><img src="/images/user/game/helpdesk/swdown_05.gif"></a></td>
  </tr>
</table>
</form>

<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
