<%
//**********************************************************
//  1. ��      ��: Ȩ������ �¶��� �޴���
//  2. ���α׷���: zu_HomePageOnline_L.jsp
//  3. ��      ��: Ȩ������ �¶��� �޴���
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̿��� 2005. 7. 25
//  7. ��      ��: �̿��� 2005. 7. 25
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
    box.put("leftmenu","01");                       // �޴� ���̵� ����
%>
<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topGuide.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">
<!--
    function menuMove(process) {

      document.form1.action = "/servlet/controller.homepage.HomePageOnlineServlet";
      document.form1.p_process.value = process;
      document.form1.submit();
    }

//-->
</SCRIPT>
<form name = "form1">
<input type="hidden" name="p_process" value="">
</form>
          <!-- center start -->
            <table width="730" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="20" align="center" valign="top" class="location"> 
                  HOME &gt; �����ȳ� &gt; �¶��θ޴���</td>
              </tr>
              <tr> 
                <td align="center" valign="top"> 
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top"><img src="/images/user/guide/<%=tem_subimgpath%>/tit_online.jpg"></td>
                    </tr>
                    <tr> 
                      <td height="20"></td>
                    </tr>
                  </table>
                  <!-- ������ -->
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5" colspan="5"></td>
                    </tr>
                    <tr> 
                      <td width="95" valign="top"><img src="/images/user/guide/tab_online_01_on.gif"> 
                      </td>
                      <td width="113" valign="top" ><a href="javascript:menuMove('selectList2_1')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image36','','/images/user/guide/tab_online_02_on.gif',1)"><img src="/images/user/guide/tab_online_02.gif" name="Image36" border="0"></a></td>
                      <td width="128" valign="top" ><a href="javascript:menuMove('selectList3')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image37','','/images/user/guide/tab_online_03_on.gif',1)"><img src="/images/user/guide/tab_online_03.gif" name="Image37" border="0"></a></td>
                      <td width="100" valign="top" ><a href="javascript:menuMove('selectList4')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image38','','/images/user/guide/tab_online_04_on.gif',1)"><img src="/images/user/guide/tab_online_04.gif" name="Image38" border="0"></a></td>
                      <td width="239" align="right" >&nbsp;</td>
                    </tr>
                    <tr> 
                      <td height="10" colspan="5"></td>
                    </tr>
                  </table>
				  <!-- ������ -->
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="675" border="2" cellspacing="0" 
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed">
                          <tr> 
                            <td align="center" bgcolor="#F0F7F5" style="padding-top:8px;padding-bottom:8px"><a href="#1">������û</a> 
                              �� <a href="#2">������ûȮ��/���</a> �� <a href="#3">��ü�����˻�</a> 
                              �� <a href="#4">������������</a> �� <a href="#5">������������</a></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td height="20"></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="307"><img src="/images/user/guide/online_c01.jpg"></td>
                      <td width="368" valign="top"> <table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/guide/online_num1.gif" align="absmiddle"> 
                              <font color="#000000">������û �޴��̵� </font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td>���ʻ���� ������û/�ȳ��� Ŭ���ϸ� ������ûȭ������ �̵��մϴ�.</td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td><img src="/images/user/guide/online_c01-1.jpg"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="/images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr align="right"> 
                      <td height="20" colspan="2"><a href="#"><img src="/images/user/button/btn_top.gif" border="0"></a></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="675" valign="top"><img src="/images/user/guide/st_online1.gif" border="0"><a name="#1" id="#1"></a></td>
                    </tr>
                    <tr> 
                      <td height="15">&nbsp;</td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="307"><img src="/images/user/guide/online_c03.jpg"></td>
                      <td width="368" valign="top"><table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/guide/online_num1.gif" width="13" height="14" align="absmiddle"> 
                              <font color="#000000">������ȸ �� ����</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">�¶��� �� �������ΰ����� �����оߺ��� ��ȸ/�����Ͽ� ������û�� 
                              �� �� �ֽ��ϴ�.<br>
                              <br>
                              ��</strong></font>���̹� �¶��ΰ����̳� ���հ����� �������� �ϴ��� <strong><font color="#CC3300">��</font></strong>�����з��� 
                              �о߿� ���� <strong><font color="#CC3300">��</font></strong>������ 
                              ����Ŭ���ϸ� �� ������������ ȭ������ �̵��ϸ� ������û�� �� �� �ֽ��ϴ�.<br> <br></td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="/images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr> 
                      <td valign="top"><img src="/images/user/guide/online_c04.jpg"></td>
                      <td valign="top"><table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/guide/online_num2.gif" width="13" height="14" align="absmiddle"> 
                              <font color="#000000">���������� ��ȸ �� ������û</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top"><font color="#CC3300"><strong>��</strong></font>������ 
                              ���������� Ȯ���ϰ� �ϴ��� <strong><font color="#CC3300">��</font></strong>�������� 
                              ����Ʈ�� �Ⱓ������ Ȯ������ ������ ��û���� <strong><font color="#CC3300">��</font></strong>��û�ϱ� 
                              ��ư�� Ŭ���ϸ� ������û�� �� �� �ֽ��ϴ�.<br> </td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="/images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr align="right"> 
                      <td colspan="2"><a href="#"><img src="/images/user/button/btn_top.gif" border="0"></a></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="675" valign="top"><img src="/images/user/guide/st_online1-1.gif" border="0"><a name="#2" id="#2"></a></td>
                    </tr>
                    <tr> 
                      <td height="15">&nbsp;</td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="307" valign="top"><img src="/images/user/guide/online_c05.jpg"></td>
                      <td width="368" valign="top"><table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/guide/online_num1.gif" width="13" height="14" align="absmiddle"> 
                              <font color="#000000">������ûȮ��/���</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">������ ������û�� ������ <font color="#CC3300">���λ���</font> 
                              Ȯ�� �� <font color="#CC3300">��û���</font>�� �� ��<br>
                              �ֽ��ϴ�.<br>
                              <br>
                              ������ ������û�� ���������� ������ <font color="#CC3300">������û ����ó�� 
                              ����</font>�� Ȯ���� �� �ֽ��ϴ�.<br> <font color="#CC3300">������û 
                              ���ɱⰣ</font>���� ������ ������û��Ҷ��� ��� ��ư�� Ŭ���ϸ� ������û ��Ҹ� 
                              �� �� �ֽ��ϴ�.</td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                        </table></td>
                    </tr>
					 <tr > 
                      <td height="14" colspan="2" background="/images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr align="right"> 
                      <td colspan="2"><a href="#"><img src="/images/user/button/btn_top.gif" border="0"></a></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="675" valign="top"><img src="/images/user/guide/st_online1-2.gif" border="0"><a name="#3" id="#3"></a></td>
                    </tr>
                    <tr> 
                      <td height="15">&nbsp;</td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="307" valign="top"><img src="/images/user/guide/online_c01-2.jpg"></td>
                      <td width="368" valign="top"><table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/guide/online_num1.gif" width="13" height="14" align="absmiddle"> 
                              <font color="#000000">��ü�����˻�</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">�˻��Ϸ��� ������ �������� �Է�/�˻��Ͽ� ������û �� ������<br>
                              ���� Ȯ���� �� �ֽ��ϴ�. <br>
                              <br>
                              ��ǰ� �ִ� �� ������ ��������, �� �������� �������� �������� ���� �򰡰� ǥ�õǾ� 
                              �ֽ��ϴ�.</td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="/images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr align="right"> 
                      <td colspan="2"><a href="#"><img src="/images/user/button/btn_top.gif" border="0"></a></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="675" valign="top"><img src="/images/user/guide/st_online1-3.gif" border="0"><a name="#4" id="#4"></a></td>
                    </tr>
                    <tr> 
                      <td height="15">&nbsp;</td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="307" valign="top"><img src="/images/user/guide/online_c01-3.jpg"></td>
                      <td width="368" valign="top"><table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/guide/online_num1.gif" width="13" height="14" align="absmiddle"> 
                              <font color="#000000">������������</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">�ϳ� ������ ��ü ���������� �Ѵ��� ���� �ľ� �Ҽ� �ְ� ���⵵ 
                              ���������� Ȯ���� �� �ֽ��ϴ�<br>
                              <br>
                              ������ �ش��ϴ� �׷����� Ŭ���ϸ� �� ������ <font color="#CC3300">�������� 
                              ����</font>�� <font color="#CC3300">�������</font>�� ���� 
                              �� �ֽ��ϴ�.</td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="/images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr align="right"> 
                      <td colspan="2"><a href="#"><img src="/images/user/button/btn_top.gif" border="0"></a></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="675" valign="top"><img src="/images/user/guide/st_online1-4.gif" border="0"><a name="#5" id="#5"></a></td>
                    </tr>
                    <tr> 
                      <td height="15">&nbsp;</td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="307" valign="top"><img src="/images/user/guide/online_c01-4.jpg"></td>
                      <td width="368" valign="top"><table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/guide/online_num1.gif" width="13" height="14" align="absmiddle"> 
                              <font color="#000000">������������</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">�� �޿� �̷������ ���������� ������ ���� �� ������ �� �� 
                              ���� ������ Ȯ�� �Ҽ� �ֽ��ϴ�.<br>
                              <br>
                              ������ �ش��ϴ� �׷����� Ŭ���ϸ� �� ������ <font color="#CC3300">�������� 
                              ����</font>�� <font color="#CC3300">�������</font>�� ���� 
                              �� �ֽ��ϴ�. </td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="/images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr align="right"> 
                      <td colspan="2"><a href="#"><img src="/images/user/button/btn_top.gif" border="0"></a></td>
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
