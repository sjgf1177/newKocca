<%
//**********************************************************
//  1. ��      ��: Ŀ�´�Ƽ QnA 
//  2. ���α׷��� : zu_CmuQnA_L.jsp
//  3. ��      ��: Ŀ�´�Ƽ QnA.
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2005.07.01 
//  7. ��      ��: 2005.07.01 
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage   = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "com.credu.community.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="../../css/user_style_community2.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<table width="663" height="210" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2" valign="top" background="../../images/community/pop_bg.gif" style="padding-left:6px; padding-top:6px; padding-right:6px;"> 
      <table width="100%" border="1" cellspacing="0" 
                         cellpadding="5"   style="border-collapse:collapse;" bordercolor="#B7BEC1">
        <tr> 
          <td align="center" valign="top" bgcolor="#FFFFFF"> 
            <!-- ���� -->
            <table width="97%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="1" bgcolor="CCCCCC"></td>
              </tr>
              <tr> 
                <td><table width="243" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="bottom" class="title"><strong><img src="../../images/community/pop_bl.gif" align="absmiddle">���� 
                        ���ú��� </strong><img src="../../images/community/title_vline.gif" align="absbottom"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="1" bgcolor="CCCCCC"></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
            </table>
            <table width="97%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="1" class="list_poll" > <table width="596" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><strong>1. ȸ���� ������ �������? <font color="#FF6600">(�ʼ�����)</font></strong></td>
                    </tr>
                    <tr> 
                      <td height="5"></td>
                    </tr>
                    <tr> 
                      <td> <input type="radio" name="radiobutton" value="radiobutton">
                        ����� </td>
                    </tr>
                    <tr> 
                      <td><input type="radio" name="radiobutton" value="radiobutton">
                        �ݿ��� </td>
                    </tr>
                    <tr> 
                      <td height="6"></td>
                    </tr>
                    <tr> 
                      <td><strong>�ݿ����� ���ٸ� ��?</strong></td>
                    </tr>
                    <tr> 
                      <td><textarea name="textarea" cols="70" rows="3"></textarea></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="1" background="../../images/community/bg_line.gif"></td>
              </tr>
              <tr> 
                <td align="center" valign="top" class="list_poll"> <table width="596" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><strong>2. ȸ����Ҵ� ��� �������? <font color="#FF6600">(�ʼ�����)</font></strong></td>
                    </tr>
                    <tr> 
                      <td height="5"></td>
                    </tr>
                    <tr> 
                      <td><table width="596" border="2" cellspacing="0" 
                         cellpadding="3"  style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
                          <tr> 
                            <td width="148" class="tbl_ctit2">&nbsp;</td>
                            <td width="141" class="tbl_ctit2">����</td>
                            <td width="135" class="tbl_ctit2">�����̴�</td>
                            <td width="136" class="tbl_ctit2">���ڴ�</td>
                          </tr>
                          <tr> 
                            <td class="tbl_grc">ö�꿪</td>
                            <td class="tbl_grc"><input type="radio" name="radiobutton" value="radiobutton"></td>
                            <td class="tbl_grc"><input type="radio" name="radiobutton" value="radiobutton"></td>
                            <td class="tbl_grc"><input type="radio" name="radiobutton" value="radiobutton"></td>
                          </tr>
                          <tr> 
                            <td class="tbl_grc">�繫�� ��ó</td>
                            <td class="tbl_grc"><input type="radio" name="radiobutton" value="radiobutton"></td>
                            <td class="tbl_grc"><input type="radio" name="radiobutton" value="radiobutton"></td>
                            <td class="tbl_grc"><input type="radio" name="radiobutton" value="radiobutton"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="1" background="../../images/community/bg_line.gif"></td>
              </tr>
              <tr> 
                <td align="center" class="list_poll"><table width="596" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><strong>3. 2���� ��� �������? <font color="#FF6600">(�ʼ�����)</font></strong></td>
                    </tr>
                    <tr> 
                      <td height="5"></td>
                    </tr>
                    <tr> 
                      <td> <input type="radio" name="radiobutton" value="radiobutton">
                        ȣ���� </td>
                    </tr>
                    <tr> 
                      <td><input type="radio" name="radiobutton" value="radiobutton">
                        �뷡��</td>
                    </tr>
                    <tr> 
                      <td>&nbsp;</td>
                    </tr>
                    <tr> 
                      <td><strong>�뷡���� ���ٸ� ��?</strong></td>
                    </tr>
                    <tr> 
                      <td><textarea name="textarea2" cols="70" rows="3"></textarea></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td width="600" height="38" valign="top" background="../../images/community/pop_bobg.jpg"><img src="../../images/community/pop_backimg.jpg"></td>
    <td width="63" background="../../images/community/pop_bobg.jpg"> <a href="javascript:self.close()"><img src="../../images/user/button/btn_close.gif" border="0"></a></td>
  </tr>
</table>
</body>
</html>
