<%
//**********************************************************
//  1. ��      ��: ���ְ��� �ý��� ��й�ȣȮ��ȭ��
//  2. ���α׷���: zu_CpPw_Find.jsp
//  3. ��      ��: ���ְ��� �ý��� ��й�ȣȮ��ȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 12. 18
//  7. ��      ��: ������ 2004. 12. 18
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
RequestBox box = (RequestBox)request.getAttribute("requestbox");
String isMailed = "";

isMailed = (String)request.getAttribute("selectPds");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>���ְ����ý���</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/gate_style.css">
</head>

<body leftmargin=0 topmargin=0>
<form name = "form1" method = "post">
	<input type='hidden' name='p_process'	value=''>
    


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><%@include file="zu_Include1.jsp"%></td>
  </tr>
</table>
<table width="950" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="80">&nbsp;</td>
    <td class=O_bgline></td>
  </tr>
  <tr> 
    <td><table width="949" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="25">&nbsp;</td>
          <td colspan="3" align="center"><table width="588" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="257"><img src="/images/gate/O_loginimg_01.gif" width="257" height="29"></td>
                <td width="275" background="/images/gate/O_loginimg_bgtop.gif">&nbsp;</td>
                <td width="56"><img src="/images/gate/O_loginimg_04.gif" width="56" height="29"></td>
              </tr>
              <tr> 
                <td><img src="/images/gate/O_pwfind_02.gif" width="257" height="121"></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="5%">&nbsp;</td>
                      <td width="95%">&nbsp;</td>
                    </tr>
                    <tr> 
					<%if (isMailed == "Ok") {%>
                      <td>&nbsp;</td>
                      <td>��й�ȣ �˻������ ���Ϸ� �߼��Ͽ����ϴ�.<br>
                        ������ Ȯ���Ͻð� �α������ּ���.<br>
					  </td>
					  <%}else{%>
					  <td>&nbsp;</td>
                      <td>��й�ȣ �˻���� ���Ϲ߼ۿ� �����Ͽ����ϴ�.<br>
                        �ٽ��ѹ� Ȯ�����ּ���.<br>
					  </td>
					  <%}%>
                    </tr>
                    <tr> 
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
                <td><img src="/images/gate/O_loginimg_05.gif" width="56" height="121"></td>
              </tr>
              <tr> 
                <td><img src="/images/gate/O_loginimg_03.gif" width="257" height="30"></td>
                <td background="/images/gate/O_loginimg_undertop.gif">&nbsp;</td>
                <td><img src="/images/gate/O_loginimg_06.gif" width="56" height="30"></td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td colspan="3" style=padding-left:44px>&nbsp;</td>
              </tr>
            </table></td>
          <td width="10">&nbsp;</td>
        </tr>
        <tr> 
          <td width="25" height="80">&nbsp;</td>
          <td width="85" height="80">&nbsp;</td>
          <td width="25" height="80">&nbsp;</td>
          <td width="775" height="80">&nbsp;</td>
          <td height="50">&nbsp;</td>
        </tr>
        <tr> 
          <td width="25">&nbsp;</td>
          <td colspan="3"><img src="/images/gate/O_copyright.gif" width="370" height="41"></td>
          <td>&nbsp;</td>
        </tr>
      </table></td>
    <td class=O_bgline></td>
  </tr>
</table>
</FORM>
</body>
</html>
