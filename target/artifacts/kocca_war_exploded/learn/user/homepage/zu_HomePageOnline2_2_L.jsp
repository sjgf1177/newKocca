<%
//**********************************************************
//  1. ��      ��: Ȩ������ �¶��� �޴���
//  2. ���α׷���: zu_HomePageOnline2_2_L.jsp
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
                      <td width="95" valign="top"><a href="javascript:menuMove('selectList')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image351','','/images/user/guide/tab_online_01_on.gif',1)"><img src="/images/user/guide/tab_online_01.gif" name="Image351" border="0" id="Image351"></a> 
                      </td>
                      <td width="113" valign="top" ><img src="/images/user/guide/tab_online_02_on.gif"></td>
                      <td width="128" valign="top" ><a href="javascript:menuMove('selectList3')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image371','','/images/user/guide/tab_online_03_on.gif',1)"><img src="/images/user/guide/tab_online_03.gif" name="Image371" border="0" id="Image371"></a></td>
                      <td width="100" valign="top" ><a href="javascript:menuMove('selectList4')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image381','','/images/user/guide/tab_online_04_on.gif',1)"><img src="/images/user/guide/tab_online_04.gif" name="Image381" border="0" id="Image381"></a></td>
                      <td width="239" align="right" >&nbsp;</td>
                    </tr>
                    <tr> 
                      <td height="10" colspan="5"></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="337" valign="top"><img src="/images/user/guide/st_studydoguide.gif" ></td>
                      <td width="338" align="right" valign="top"><a href="javascript:menuMove('selectList2_1')"><img src="/images/user/button/btn_myclassguide.gif" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td height="20" colspan="2">&nbsp;</td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="307" valign="top"><img src="/images/user/guide/online_ms01.jpg"></td>
                      <td width="368" valign="top"> <table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><font color="#000000"><strong>�н����� ���� </strong></font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">���ǰ��ǽǿ��� �н����� ������ <font color="#CC3300">�н��ϱ� 
                              ��ư</font>�� Ŭ���ϸ� ����ȭ��� ���� �н����� ȭ���� ���ɴϴ�.</td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td><font color="#000000"><img src="/images/user/guide/online_num1.gif" width="13" height="14" align="absmiddle"> 
                              �н����� </font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">ȭ�� �߾ӿ����� ����ȭ�鿡�� ���� ���� ������������ ������������ 
                              ǥ�õǸ� �������������� Ȯ���� �� �ֽ��ϴ�. <br> <br>
                              �н����� ��ư�� Ŭ���ϸ� �н��� ������ �� �ֽ��ϴ�. <br> <br>
                              �����н��ÿ� �����н�ù�������� �̵��ϸ� �н������� ���� ���¿����� �ֱٿ� �н��� �������� 
                              �̵��Ͽ� �̾ �н��� �� �� �ֽ��ϴ�. <br></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="/images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr> 
                      <td valign="top"><img src="/images/user/guide/online_ms02.jpg" width="289" height="193"></td>
                      <td valign="top"><table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/guide/online_num2.gif" align="absmiddle"> 
                              �н�����</td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">ȭ�� �����ʿ� <font color="#CC3300">�����н�����</font>�� 
                              �־� ���ϴ� �н��׸��� Ŭ���Ͽ� �н��� ������ �� �ֽ��ϴ�.<br>
                              �н��������� �Ʒ��� ���� �̹����� �н����θ� �������ݴϴ�. <br> </td>
                          </tr>
                          <tr> 
                            <td valign="top"><img src="/images/user/guide/myhelp_img07.gif" align="absmiddle"> 
                              �̹� �н��� �׸�ǥ�� </td>
                          </tr>
                          <tr> 
                            <td valign="top"><img src="/images/user/guide/myhelp_img08.gif" align="absmiddle"> 
                              �н����� �׸�ǥ�� </td>
                          </tr>
                          <tr> 
                            <td valign="top"><img src="/images/user/guide/myhelp_img09.gif" align="absmiddle"> 
                              ���н� �׸�ǥ�� </td>
                          </tr>
                          <tr> 
                            <td valign="top">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td valign="top">����� HIDE�� Ŭ���ϸ� ������������ ����� �پ��� �н�����ȭ���� 
                              ũ�Ⱑ �þ�� �н�ȭ���� ũ�⸦ �а� �Ͽ� ���Ǽ� �ֽ��ϴ�. <br>
                              ����� ���������� Ŭ���ϸ� ���������� Ȯ���� �� �ֽ��ϴ�. </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="/images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr> 
                      <td valign="top"><img src="/images/user/guide/online_ms03.jpg"></td>
                      <td valign="top"> <table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><font color="#000000"><strong>�н� ���������޴�</strong></font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">ȭ�� �ϴܿ��� ���� ���н����� Ȯ�� �� ����Ʈ����, ����, 
                              �����ø� �� �� ������ ��Ÿ �Խ��ǵ��� �н����������� ����� �� �ֽ��ϴ�.</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="/images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/guide/online_ms04.jpg"></td>
                      <td valign="top"><table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/guide/online_num1.gif" align="absmiddle"> 
                              <font color="#000000">��������</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">����/���� ������������ ������ ��������� �н������Ȳ �� ���� 
                              ������ �н����θ� Ȯ���� �� �ֽ��ϴ�.</td>
                          </tr>
                          <tr> 
                            <td valign="top">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td valign="top"><font color="#000000">- �������Ȯ�� </font><br>
                              �̼����������� ������������� �����־� �̼��� �ʿ��� ������ Ȯ���� �� �ֽ��ϴ�. <br> 
                              <br> <font color="#000000">- �н������Ȳ </font><br>
                              ������ �� �߰���, �������� ������Ȳ �� ����Ʈ, ���������� �����ߴ����� ���θ� 
                              Ȯ���� �� �ֽ��ϴ�.<br>
                              ���� �н������� ���� �н���Ȳ�� Ȯ���� �� �ֽ��ϴ�. <br></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="/images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr> 
                      <td valign="top"><img src="/images/user/guide/online_ms05.jpg" ></td>
                      <td valign="top"><table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/guide/online_num2.gif" align="absmiddle"> 
                              <font color="#000000">����Ʈ</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">����ȭ��� ���� ����Ʈ�� �����Ǹ� ������ Ŭ������ ����Ʈ�� 
                              �����ϸ� �˴ϴ�.<br> </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="/images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/guide/online_ms06.jpg" ></td>
                      <td valign="top"><table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/guide/online_num3.gif" align="absmiddle"> 
                              <font color="#000000">����</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">�������� �� ������ �� ������ ������ �� �ֽ��ϴ�. ���¶��� 
                              ���䰡�ɿ��θ� Ȯ���ϰ� ���������� Ŭ���ϸ� ������ ������ �� �ֽ��ϴ�.<br> </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="/images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/guide/online_ms07.jpg" ></td>
                      <td valign="top"><table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/guide/online_num4.gif" width="13" height="14" align="absmiddle"> 
                              <font color="#000000">��</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">�߰��� �� ������, �����򰡿� ���� �� �� �ֽ��ϴ�. <br>
                              ���¶��� ���ð��ɿ��θ� Ȯ���ϰ� ���������� Ŭ���ϸ� �򰡿� ������ �� ������ �־��� �ð��ȿ� 
                              ������ Ǯ�� �����ϸ� �˴ϴ�.<br> </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="/images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/guide/online_ms08.jpg" ></td>
                      <td valign="top"><table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/guide/online_num5.gif" width="13" height="14" align="absmiddle"> 
                              <font color="#000000">�ڷ��/�Խ���/��й�</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">�����н��� ���õ� �ڷᳪ ������ �Ǵ� �۵��� �����н��ڵ�� 
                              ������ �� �ִ� �����Դϴ�.<br> </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td align="right" valign="top"><a href="#"><img src="/images/user/button/btn_top.gif" border="0"></a></td>
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
