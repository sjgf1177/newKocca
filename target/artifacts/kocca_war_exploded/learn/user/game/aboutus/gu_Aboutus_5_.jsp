<%
//**********************************************************
//  1. ��      ��: ��ī���̼Ұ� > ��ȭ������ �η¾缺ü�赵
//  2. ���α׷��� : ku_Academy.jsp
//  3. ��      ��: ��ȭ������ �η¾缺ü�赵
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.22
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
	if (box == null) box = RequestManager.getBox(request);

	box.put("leftmenu","01"); 
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topAboutus.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->
                  <!-- Ÿ��Ʋ -->
                  <table width="720" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="35" width="720" align="right"  background="/images/user/game/aboutus/<%=tem_subimgpath%>/tit_05.gif" class="location"><img src="/images/user/game/common/location_bl.gif"> HOME > aboutus > �����ܰ�</td>
                    </tr>
                    <tr> 
                      <td height="20">&nbsp;</td>
                    </tr>
                  </table>
             
                  <table width="720" border="2" cellspacing="0" cellpadding="3" style="border-collapse:collapse;" bordercolor="#ededed" rules="rows" frame="hsides">
                    <tr> 
                      <td width="106"><img src="/images/user/game/aboutus/about05-1.gif" width="106" height="26"></td>
                      <td width="5">&nbsp;</td>
                      <td width="106"><img src="/images/user/game/aboutus/about05-2.gif" width="106" height="26"></td>
                      <td width="5">&nbsp;</td>
                      <td width="503"><img src="/images/user/game/aboutus/about05-3.gif"></td>
                    </tr>
                    <tr> 
                      <td align="center">
					  <table width="77" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="77" align="center" background="/images/user/game/aboutus/c_bg.gif"><strong>1�ܰ�</strong><br>
                              (2001)</td>
                          </tr>
                        </table></td>
                      <td valign="bottom"><img src="/images/user/game/aboutus/vline.gif" width="5" height="76"></td>
                      <td align="center">�غ�ܰ�</td>
                      <td valign="bottom"><img src="/images/user/game/aboutus/vline.gif" width="5" height="76"></td>
                      <td class="tbl_about5">- ���Ӱ��� �� �� �� �� �� ����ȸ ����<br>
                        - ���簳��, ���������� �� ���ܺ� ��ý��� ����<br>
                        - ������ ���� �η� �� ���ݱ��� � �η� Ȯ��</td>
                    </tr>
                    <tr> 
                      <td align="center">
					  <table width="77" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="77" align="center" background="/images/user/game/aboutus/c_bg.gif"><strong>2�ܰ�</strong><br>
                              (2002)</td>
                          </tr>
                        </table></td>
                      <td valign="bottom"><img src="/images/user/game/aboutus/vline.gif" width="5" height="76"></td>
                      <td align="center">�ù� �</td>
                      <td valign="bottom"><img src="/images/user/game/aboutus/vline.gif" width="5" height="76"></td>
                      <td class="tbl_about5">- LMS ���� �� ������ ���� (�������� ����)<br>
                        - �����ý��� ���� �� ���ܺ� �ù� � ����<br>
                        - 1���⵵ �л� ���� �� ���ݱ�������Ʈ ����<br>
                        - 1 �� 2�� �г⵵ ������ ���� �� ����<br>
                        - ���� ���Ӱ��ô��а� ���� �ù� ����</td>
                    </tr>
                    <tr> 
                      <td align="center">
					  <table width="77" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="77" align="center" background="/images/user/game/aboutus/c_bg.gif"><strong>3�ܰ�</strong><br>
                              (2003)</td>
                          </tr>
                        </table></td>
                      <td valign="bottom"><img src="/images/user/game/aboutus/vline.gif" width="5" height="76"></td>
                      <td align="center">��� ����</td>
                      <td valign="bottom"><img src="/images/user/game/aboutus/vline.gif" width="5" height="76"></td>
                      <td class="tbl_about5">- ���ݴ��� ���� �� 2���⵵ �л� ����<br>
                        - 1 �� 2�� �г⵵ ������ ���� ����<br>
                        - 2 �� 3�� �г⵵ ������ ����<br>
                        - ���� ����(���)�� ���� ü�� ����<br>
                        - ���� 5,000�� ���Ӱ��߰��� ����</td>
                    </tr>
                    <tr> 
                      <td align="center">
					  <table width="77" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="77" align="center" background="/images/user/game/aboutus/c_bg.gif"><strong>4�ܰ�</strong><br>
                              (2004)</td>
                          </tr>
                        </table></td>
                      <td valign="bottom"><img src="/images/user/game/aboutus/vline.gif" width="5" height="76"></td>
                      <td align="center">��� ����</td>
                      <td valign="bottom"><img src="/images/user/game/aboutus/vline.gif" width="5" height="76"></td>
                      <td class="tbl_about5">- �� �� �� �� �� ��������ȸ �<br>
                        - ������ ��������� ����ü�� ����<br>
                        - 2 �� 3�� �г⵵ ������ ���� ����<br>
                        - 3 �� 4�� �г⵵ ������ ����</td>
                    </tr>
                    <tr>
                      <td align="center">
					  <table width="77" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="77" align="center" background="/images/user/game/aboutus/c_bg.gif"><strong>5�ܰ�</strong><br>
                              (2005)</td>
                          </tr>
                        </table></td>
                      <td valign="bottom"><img src="/images/user/game/aboutus/vline.gif" width="5" height="76"></td>
                      <td align="center">���ݴ���<br>
                        �����غ�</td>
                      <td valign="bottom"><img src="/images/user/game/aboutus/vline.gif" width="5" height="76"></td>
                      <td class="tbl_about5">- ���ݴ��� ������ ���� ���� Ȯ��<br>
                        - 3 �� 4�� �г⵵ ������ ���� ����<br>
                        - ���ڵ����� ��ġ �� �<br>
                        - �ؿܱ�������� ���� ����</td>
                    </tr>
                  </table><!--/td>
              </tr>
              <tr>
                <td height="30"  valign="top" class="submargin"></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table-->


	
<!-- foote -->
<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>