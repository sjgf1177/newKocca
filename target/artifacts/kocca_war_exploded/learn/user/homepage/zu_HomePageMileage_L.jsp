<%
//**********************************************************
//  1. ��      ��: Ȩ������ ���ϸ��� ����
//  2. ���α׷���: zu_PageMileage_L.jsp
//  3. ��      ��: Ȩ������ ���ϸ��� ����
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̿��� 2005. 7. 1
//  7. ��      ��: �̿��� 2005. 7. 1
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
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    String s_userid     = box.getSession("userid");
    box.put("leftmenu","05");                       // �޴� ���̵� ����
%>
<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topSupport.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->
          <!-- center start -->
            <table width="730" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="20" align="center" valign="top" class="location">HOME 
                  &gt; �н��������� &gt; Activity ����</td>
              </tr>
              <tr> 
                <td align="center" valign="top"> 
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="/images/user/support/<%=tem_subimgpath%>/tit_activity.jpg"></td>
                    </tr>
                    <tr>
                      <td height="20"></td>
                    </tr>
                  </table>

                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="675" valign="top"><img src="/images/user/support/st_act_01.gif"></td>
                    </tr>
                    <tr> 
                      <td height="10">&nbsp;</td>
                    </tr>
                  </table> 
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td align="center"><img src="/images/user/support/act_01img.jpg"></td>
                    </tr>
                    <tr> 
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                  <table width="576" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><img src="/images/user/guide/online_num1.gif" width="13" height="14" align="absmiddle"> 
                        <font color="#000000">�ڽ��� ����Ʈ�� �α����� �ð��� �α����� Ƚ�� �� �α��� 
                        ���� ������ �����ݴϴ�.</font></td>
                    </tr>
                    <tr> 
                      <td height="10"></td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/guide/online_num2.gif" width="13" height="14" align="absmiddle"> 
                        <font color="#000000">����Ʈ������ ���� �ۼ��ϰ� �ڷḦ ����ϴ� Ƚ���� ��ϵǾ� 
                        ���� Ȱ���� �Ѵ��� ���� �� �ֽ��ϴ�.</font></td>
                    </tr>
                    <tr> 
                      <td height="20">&nbsp;</td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td align="center"><img src="/images/user/support/act_02img.jpg"></td>
                    </tr>
                    <tr> 
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                  <table width="576" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><img src="/images/user/guide/online_num1.gif" width="13" height="14" align="absmiddle"> 
                        <font color="#000000">����Ʈ �޴����� ������ Ƚ���� ��ϵǰ� �Ѱ���� ���ͼ� �ڽ��� 
                        ����ƮȰ�� ������ ���� �� �ֽ��ϴ�.</font></td>
                    </tr>
                    <tr> 
                      <td height="30">&nbsp;</td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="675" valign="top"><img src="/images/user/support/st_act_02.gif" width="333" height="16"></td>
                    </tr>
                    <tr> 
                      <td height="10">&nbsp;</td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td align="center"><img src="/images/user/support/act_03img.jpg"></td>
                    </tr>
                    <tr> 
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                  <table width="576" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top"><img src="/images/user/guide/online_num1.gif" width="13" height="14" align="absmiddle"> 
                        <font color="#000000">���� �н����� �������� ������� ��ϵǾ� �־ ����
                        ���� ���콺�� �������� �ش� �������� ��ǳ������ ��ϴ�. ���� Ȱ�� ��踦 ���� ���� ������ �����ϸ� 
                        �ϴܿ� �ش� ������ �� ������ ���õ˴ϴ�.</font></td>
                    </tr>
                    <tr> 
                      <td height="10"></td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/guide/online_num2.gif" width="13" height="14" align="absmiddle"> 
                        <font color="#000000">�н����� ���� �� ������ ������ �н��ð�, �ֱٿ� �н��ߴ� 
                        ��¥, �� ������ ���ǽǿ� �����ߴ� Ƚ��, ������ ������� ���������� ���� Ȯ�� �Ͻ� �� �ֽ��ϴ�.</font> 
                      </td>
                    </tr>
                    <tr> 
                      <td height="10"></td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/guide/online_num3.gif" width="13" height="14" align="absmiddle"> 
                        <font color="#000000">������ ������ �н�Ȱ�� ������ ���ϰ� ��ϵǾ� �־� �ֽ��ϴ�. 
                        <br>
                        �޴����� ����Ƚ��, ��ϼ��� ������ �н��� �󵵼��� ��Ͽ��θ� Ȯ�� �� �� �־ �н������� ���� 
                        �����Ͻ� �� �ֽ��ϴ�.</font></td>
                    </tr>
                    <tr> 
                      <td height="20" align="right"><a href="#"><img src="/images/user/button/btn_top.gif" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td align="center" valign="top">&nbsp;</td>
              </tr>
              <tr> 
                <td width="470" height="2" align="center" valign="top" bgcolor="#999999"></td>
              </tr>
            </table>

<!---------- copyright start ------------------->
<%@ include file="/learn/user/include/bottom.jsp"%>
<!---------- copyright end  -------------------->