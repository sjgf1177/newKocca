<%
//**********************************************************
//  1. ��      ��: Ȩ������ �¶��� �޴���
//  2. ���α׷���: zu_HomePageOnline2_1_L.jsp
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
                      <td><table width="675" border="2" cellspacing="0" 
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed">
                          <tr> 
                            <td align="center" bgcolor="#F0F7F5" style="padding-top:8px;padding-bottom:8px"><a href="#1">���� 
                              ���ǽ�</a> �� <a href="#2">���� �����̷�</a> �� <a href="#3">���� 
                              ������ </a> �� <a href="#4">���� �н�Ȱ��</a> �� <a href="#5">���İ��� </a>
                              �� <a href="#6">E-test  </a>l <a href="#7">����</a></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="20"></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="307"><img src="../../../images/user/guide/online_m01.jpg"></td>
                      <td width="368" valign="top"> <table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="../../../images/user/guide/online_num1.gif" align="absmiddle"> 
                              <font color="#000000">���� ���ǽ� �޴��̵� </font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">���ʻ���� ���� ���ǽ��� Ŭ���ϸ� ���ǰ��ǽǷ� �̵��Ͽ� �н��� 
                              ���� �� �� ������ �н��� ������ ������ �ٽ� ������ �� �ֽ��ϴ�.</td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td><img src="../../../images/user/guide/online_m01-1.jpg"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="../../../images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr align="right"> 
                      <td colspan="2"><a href="#"><img src="../../../images/user/button/btn_top.gif" border="0"></a></td>
                    </tr>
                    <tr align="right"> 
                      <td height="10" colspan="2"></td>
                    </tr>
                  </table>

                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="351" valign="top"><img src="../../../images/user/guide/st_online2.gif"><a name="1"></a></td>
                      <td width="324" align="right" valign="top"><a href="javascript:menuMove('selectList2_2')"><img src="../../../images/user/button/btn_studydoguide.gif" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td height="15" colspan="2">&nbsp;</td>
                    </tr>
                  </table>

                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="307" valign="top"><img src="../../../images/user/guide/online_m02.jpg"></td>
                      <td width="368" valign="top"> <table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="../../../images/user/guide/online_num1.gif" width="13" height="14" align="absmiddle"> 
                              <font color="#000000">�н����� ����</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">���� �н��ϰ� �ִ� �������� �������� Ŭ���ϸ� ���� ������ 
                              ���Ǽ� ������ <font color="#CC3300">�н��ϱ� ��ư</font>�� ������ 
                              �н�â�� ��ϴ�.<br> <br> <font color="#CC3300">�н���Ȳ����</font>�� 
                              ������ ������ ��������� �н������Ȳ �� ���� ������ �н����θ� Ȯ���� �� �ֽ��ϴ�.</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="../../../images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr> 
                      <td><img src="../../../images/user/guide/online_m03.jpg"></td>
                      <td valign="top"><table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="../../../images/user/guide/online_num2.gif" width="13" height="14" align="absmiddle"> 
                              <font color="#000000">�н��������� ����</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">������û�Ͽ� ����ó���� �Ϸ�� ���������� ���� �н��Ⱓ�� �������� 
                              ���� �������� �н�������� �����Դϴ�. <br>
                              �н��Ⱓ�� �Ǹ� �н����ΰ������� �Ű��� �н��� �� �� �ֽ��ϴ�.<br></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="../../../images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr> 
                      <td valign="top"><img src="../../../images/user/guide/online_m04.jpg" width="289" height="193"></td>
                      <td valign="top"><table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="../../../images/user/guide/online_num3.gif" width="13" height="14" align="absmiddle"> 
                              <font color="#000000">�н��� ��ģ����</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">�н�(����)�Ⱓ�� ����� �������� �������ɱⰣ�� ���� <font color="#CC3300">����</font>�� 
                              �� �� �ֽ��ϴ�.<br> <br>
                              ���Ῡ��(����)�� �н����� <font color="#CC3300">7�� �� ����</font> 
                              Ȯ�ΰ��� �մϴ�.</td>
                          </tr>
                        </table></td>
                    </tr>
					  <tr > 
                      <td height="14" colspan="2" background="../../../images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr align="right"> 
                      <td colspan="2"><a href="#"><img src="../../../images/user/button/btn_top.gif" border="0"></a></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="351" valign="top"><img src="../../../images/user/guide/st_online2-1.gif"><a name="2" id="2"></a></td>
                      <td width="324" align="right" valign="top">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td height="15" colspan="2">&nbsp;</td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="307" valign="top"><img src="../../../images/user/guide/online_m05.jpg"></td>
                      <td width="368" valign="top"> <table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="../../../images/user/guide/online_num1.gif" width="13" height="14" align="absmiddle"> 
                              <font color="#000000">���α����̷� ����</font> </td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">&nbsp;������ ������û�� ������ ���� <font color="#CC3300">�����̷�</font>�� 
                              ���� �ֽ��ϴ�.<br>
                              <br>
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="../../../images/user/guide/vline.gif" ></td>
                    </tr>
					                    <tr> 
                      <td width="307" valign="top"><img src="../../../images/user/guide/online_m06.jpg"></td>
                      <td width="368" valign="top"> <table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="../../../images/user/guide/online_num2.gif" width="13" height="14" align="absmiddle"> 
                              <font color="#000000">��������/������</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">��û�� �������� �����Ⱓ�� �����Ⱓ, �̼����θ� �˼� ������ 
                              <font color="#CC3300">��������</font>�� <font color="#CC3300">������</font>�� 
                              ���� ����Ͻ� �� �ֽ��ϴ�.</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="../../../images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr align="right"> 
                      <td colspan="2"><a href="#"><img src="../../../images/user/button/btn_top.gif" border="0"></a></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="351" valign="top"><img src="../../../images/user/guide/st_online2-2.gif"><a name="3" id="3"></a></td>
                      <td width="324" align="right" valign="top">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td height="15" colspan="2">&nbsp;</td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="307" valign="top"><img src="../../../images/user/guide/online_m07.jpg"></td>
                      <td width="368" valign="top"> <table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="../../../images/user/guide/online_num1.gif" width="13" height="14" align="absmiddle"> 
                              <font color="#000000">���� ������</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">����Ʈ,�н������ؼ� ������ �ø� ������ �׿����� �亯 ���� 
                              �Ѵ��� Ȯ�� �Ͻ� �� �ֽ��ϴ�. </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="../../../images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr align="right"> 
                      <td colspan="2"><a href="#"><img src="../../../images/user/button/btn_top.gif" border="0"></a></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="351" valign="top"><img src="../../../images/user/guide/st_online2-3.gif"><a name="4" id="4"></a></td>
                      <td width="324" align="right" valign="top">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td height="15" colspan="2">&nbsp;</td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="307" valign="top"><img src="../../../images/user/guide/online_m08.jpg"></td>
                      <td width="368" valign="top"> <table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="../../../images/user/guide/online_num1.gif" width="13" height="14" align="absmiddle"> 
                              <font color="#000000">����ƮȰ��</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top"><font color="#CC3300">��</font>�ڽ��� 
                              ����Ʈ�� �α����� �ð��� �α����� Ƚ�� �� �α��� ���� ������ �����ְ� <font color="#CC3300">��</font>����Ʈ������ 
                              ���� �ۼ��ϰ� �ڷḦ ����ϴ� Ƚ���� ��ϵǾ� ���� Ȱ���� �Ѵ��� ���� �� �ֽ��ϴ�.<br>
                              <font color="#CC3300">��</font>����Ʈ�� �� �޴����� ������ Ƚ���� 
                              �� �� �ֽ��ϴ�.</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="../../../images/user/guide/vline.gif" ></td>
                    </tr>
					 <tr> 
                      <td width="307" valign="top"><img src="../../../images/user/guide/online_m09.jpg"></td>
                      <td width="368" valign="top"> <table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="../../../images/user/guide/online_num2.gif" width="13" height="14" align="absmiddle"> 
                              <font color="#000000">�н�Ȱ��</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">���� �н����� �������� ������� ��ϵǾ� �־ ���� ���� 
                              ���콺�� �������� �ش� �������� ��ǳ������ ��ϴ�. ���� Ȱ�� ��踦 ���� ���� ������ 
                              �����ϸ� �ϴܿ� �ش� ������ �� ������ ���õ˴ϴ�.<br>
                              <font color="#000000">&nbsp; </font> </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="../../../images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr align="right"> 
                      <td colspan="2"><a href="#"><img src="../../../images/user/button/btn_top.gif" border="0"></a></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="351" valign="top"><img src="../../../images/user/guide/st_online2-4.gif"><a name="5" id="5"></a></td>
                      <td width="324" align="right" valign="top">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td height="15" colspan="2">&nbsp;</td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="307" valign="top"><img src="../../../images/user/guide/online_m10.jpg"></td>
                      <td width="368" valign="top"> <table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="../../../images/user/guide/online_num1.gif" width="13" height="14" align="absmiddle"> 
                              <font color="#000000">�ֱ�����</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">������ ���Ͽ� �� ���Ͻô� ��� <font color="#CC3300">������ 
                              ���� ����</font>�ϰ� ���� ��<br>
                              �ִ� ���Դϴ�. <br>
                              �ֱٿ� �ö�� ������ ���ĵ��� ��ϵǾ� �ֽ��ϴ�.<br>
                              ����� ���Ͻø� �ϴ��� ���ĵ���� Ŭ���Ͽ� ��� �Ͻø� �˴ϴ�</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="../../../images/user/guide/vline.gif" ></td>
                    </tr>
					<tr> 
                      <td width="307" valign="top"><img src="../../../images/user/guide/online_m11.jpg"></td>
                      <td width="368" valign="top"> <table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="../../../images/user/guide/online_num2.gif" width="13" height="14" align="absmiddle"> 
                              <font color="#000000">�ֱ����� ���</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">������ ����Ҷ� ī�װ��� �����Ͽ� �о߸� �������� ������ 
                              ����ϰ� ÷�������� �ִ� 5������ �ø��� �� �ֽ��ϴ�.</td>
                          </tr>
                        </table></td>
                    </tr>
					
                    <tr > 
                      <td height="14" colspan="2" background="../../../images/user/guide/vline.gif" ></td>
                    </tr>
					<tr> 
                      <td width="307" valign="top"><img src="../../../images/user/guide/online_m12.jpg"></td>
                      <td width="368" valign="top"> <table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="../../../images/user/guide/online_num3.gif" width="13" height="14" align="absmiddle"> 
                              <font color="#000000">�α�����</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">�ø� ���ĵ� �߿� �ִ���ȸ/�ִ���õ/�ִٴ���� ����� �α����ĵ��� 
                              ��� ���� ���Դϴ�.</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="../../../images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr align="right"> 
                      <td colspan="2"><a href="#"><img src="../../../images/user/button/btn_top.gif" border="0"></a></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="351" valign="top"><img src="../../../images/user/guide/st_online2-5.gif"><a name="6" id="6"></a></td>
                      <td width="324" align="right" valign="top">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td height="15" colspan="2">&nbsp;</td>
                    </tr>
                  </table>
                  
      <table width="675" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="307" valign="top"><img src="../../../images/user/guide/online_m13.jpg"></td>
          <td width="368" valign="top"> <table width="355" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><img src="../../../images/user/guide/online_num1.gif" width="13" height="14" align="absmiddle"> 
                  <font color="#000000">E - test��</font> </td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
              <tr> 
                <td valign="top">���� ����ǰ� �ִ� �׽�Ʈ�� ���� �Ͻ� �� �ֽ��ϴ�.</td>
              </tr>
              <tr> 
                <td><img src="../../../images/user/guide/online_num2.gif" width="13" height="14" align="absmiddle"> 
                  <font color="#000000">E - test���</font></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
              <tr> 
                <td valign="top">���� �ش�Ǵ� �׽�Ʈ�� �װ��� ������ �׽�Ʈ �̷��� ��ȸ �Ͻ�<br>
                  �� �ֽ��ϴ�.</td>
              </tr>
            </table></td>
        </tr>
        <tr > 
          <td height="14" colspan="2" background="../../../images/user/guide/vline.gif" ></td>
        </tr>
        <tr align="right"> 
          <td colspan="2"><a href="#"><img src="../../../images/user/button/btn_top.gif" border="0"></a></td>
        </tr>
      </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="351" valign="top"><img src="../../../images/user/guide/st_online2-6.gif" width="333" height="16"><a name="7" id="7"></a></td>
                      <td width="324" align="right" valign="top">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td height="15" colspan="2">&nbsp;</td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="307" valign="top"><img src="../../../images/user/guide/online_m15.jpg"></td>
                      <td width="368" valign="top"> <table width="355" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="../../../images/user/guide/online_num1.gif" width="13" height="14" align="absmiddle"> 
                              <font color="#000000">��������Ʈ</font></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top">������ ũ�� ����/�Ϲ�/������/����� �κ����� ������ ������ 
                              ����˴ϴ�.<br>
                              <br>
                              <font color="#CC3300">�� </font>�ش� �����о߸� ������ �� ��������Ʈ�� 
                              <font color="#CC3300">�����</font>���� ���ð����� ����Ʈ�� <font color="#CC3300">�鼳�������� 
                              Ŭ��</font>�Ͻø� �ش� �������� ����˴ϴ�.</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr > 
                      <td height="14" colspan="2" background="../../../images/user/guide/vline.gif" ></td>
                    </tr>
                    <tr align="right"> 
                      <td colspan="2"><a href="#"><img src="../../../images/user/button/btn_top.gif" border="0"></a></td>
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
