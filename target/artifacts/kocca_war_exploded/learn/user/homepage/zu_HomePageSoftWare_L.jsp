<%
//**********************************************************
//  1. ��      ��: Ȩ������ ����Ʈ���� ����Ʈȭ��
//  2. ���α׷���: zu_HomePageSoftWare_L.jsp
//  3. ��      ��: Ȩ������ ����Ʈ���� ����Ʈȭ��
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

    String  v_process     = box.getString("p_process");
    String s_userid  = box.getSession("userid");

box.put("leftmenu","03");                       // �޴� ���̵� ����
%>
<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topSupport.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

		  <!-- center start -->
		    <table width="730" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="20" align="center" valign="top" class="location">HOME 
                  &gt; �н��������� &gt; S/W�ٿ�ε�</td>
              </tr>
              <tr> 
                <td align="center" valign="top"> 
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="/images/user/support/<%=tem_subimgpath%>/tit_swdown.jpg"></td>
                    </tr>
                    <tr>
                      <td height="20"></td>
                    </tr>
                  </table>
                  <!-- qna table -->
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top"><img src="/images/user/support/down_img.jpg" ></td>
                    </tr>
                    <tr> 
                      <td align="center" valign="top">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td align="center" valign="top"> <table width="615" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="114" rowspan="4" valign="top"><a href="http://e-learninghmc.yeslearn.co.kr/data/flashmx_trial_en.exe"><img src="/images/user/support/down_flashmx.jpg" border="0"></a></td>
                            <td width="501"><img src="/images/user/support/down_tit_flashmx.gif"></td>
                          </tr>
                          <tr> 
                            <td height="7"></td>
                          </tr>
                          <tr> 
                            <td valign="top">flashmx_trial_en.exe�� �ٿ�����ż� setup�� 
                              ��Ű�ð� ����Ͻø� 30�ϸ� ���Ǽ� �ֽ��ϴ�.</td>
                          </tr>
                          <tr> 
                            <td valign="top"><img src="/images/user/support/down_line.gif" ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="25" align="center" valign="top">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td align="center" valign="top"><table width="615" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="114" rowspan="4" valign="top"><a href="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" target="_new"><img src="/images/user/support/down_flashview.jpg" border="0"></a></td>
                            <td width="501"><img src="/images/user/support/down_tit_flashview.gif"></td>
                          </tr>
                          <tr> 
                            <td height="7"></td>
                          </tr>
                          <tr> 
                            <td valign="top">��翡�� �غ��� ��κ� ������ �÷����� �����ϰ� �ִ� ��찡 
                              ��κ��Դϴ�. ��ġ�� �ȵǴ� �������е鲲���� �̸� ��ġ�Ͻñ� �ٶ��ϴ�.</td>
                          </tr>
                          <tr> 
                            <td valign="top"><img src="/images/user/support/down_line.gif" ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="25" align="center" valign="top"></td>
                    </tr>
                    <tr> 
                      <td align="center" valign="top"><table width="615" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="114" rowspan="4" valign="top"><a href="http://e-learninghmc.yeslearn.co.kr/data/viewer_inst1.exe"><img src="/images/user/support/down_penda.jpg" width="94" height="70" border="0"></a></td>
                            <td width="501"><img src="/images/user/support/down_tit_penda.gif" width="461" height="18"></td>
                          </tr>
                          <tr> 
                            <td height="7"></td>
                          </tr>
                          <tr> 
                            <td valign="top">���� Ȯ����� *.cct �� ��쿡 PenDA ���α׷��� �ٿ�޾Ƽ� 
                              ��ġ�Ͻñ� �ٶ��ϴ�.</td>
                          </tr>
                          <tr> 
                            <td valign="bottom"><img src="/images/user/support/down_line.gif" ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="25" align="center" valign="top"></td>
                    </tr>
                    <tr> 
                      <td align="center" valign="top"><table width="615" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="114" rowspan="4" valign="top"><a href="http://www.gva.co.kr/products/student.asp" target="_new"><img src="/images/user/support/down_gva.jpg" border="0"></a></td>
                            <td width="501"><img src="/images/user/support/down_tit_gva.gif"></td>
                          </tr>
                          <tr> 
                            <td height="7"></td>
                          </tr>
                          <tr> 
                            <td valign="top">GVA�� ���۵� �������� �ٿ�ε� �޾� �н��Ͻñ� ���ؼ��� 
                              �� ����Ʈ��� �ʿ��մϴ�. </td>
                          </tr>
                          <tr> 
                            <td valign="bottom"><img src="/images/user/support/down_line.gif" ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="25" align="center" valign="top">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td align="center" valign="top"><table width="615" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="114" rowspan="4" valign="top"><a href="http://www.macromedia.com/shockwave/download/download.cgi?Lang=Korean&P5_Language=Korean" target="_new"><img src="/images/user/support/down_wave.jpg" border="0"></a></td>
                            <td width="501"><img src="/images/user/support/down_tit_wave.gif" width="461" height="18"></td>
                          </tr>
                          <tr> 
                            <td height="7"></td>
                          </tr>
                          <tr> 
                            <td valign="top">��ũ�ι̵�� Shockwave �÷��̾��Դϴ�. ��ũ�ι̵�� 
                              ���ͷ� ���۵� ��Ƽ�̵�� �������� ���������� ���÷��� �� �÷������� ��ġ�ϼ���.</td>
                          </tr>
                          <tr> 
                            <td valign="bottom"><img src="/images/user/support/down_line.gif" ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="25" align="center" valign="top"></td>
                    </tr>
                    <tr> 
                      <td align="center" valign="top"><table width="615" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="114" rowspan="4" valign="top"><a href="/portal/user/gold/down/HwpViewer.exe"><img src="/images/user/support/down_hansoft.jpg" border="0"></a></td>
                            <td width="501"><img src="/images/user/support/down_tit_hansoft.gif"></td>
                          </tr>
                          <tr> 
                            <td height="7"></td>
                          </tr>
                          <tr> 
                            <td valign="top">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td valign="bottom"><img src="/images/user/support/down_line.gif" ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="25" align="center" valign="top"></td>
                    </tr>
                    <tr> 
                      <td align="center" valign="top"><table width="615" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="114" rowspan="4" valign="top"><a href="http://java.com/ko/download/windows_automatic.jsp
" target="_blank"><img src="/images/user/support/down_java.jpg" width="94" height="70" border="0"></a></td>
                            <td width="501"><img src="/images/user/support/down_tit_java.gif" width="461" height="18"></td>
                          </tr>
                          <tr> 
                            <td height="7"></td>
                          </tr>
                          <tr> 
                            <td valign="top">XP �ʱ���� ����ڴ� �ڹ� ����ӽ��� XP�� ��ġ�Ǿ� ���� 
                              �ʽ��ϴ�. �н� �Ǵ� ����Ʈ��� �Ͻñ� ���ؼ��� �� ����Ʈ��� �ʿ��մϴ�. </td>
                          </tr>
                          <tr> 
                            <td valign="bottom"><img src="/images/user/support/down_line.gif" ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="25" align="center" valign="top">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td align="center" valign="top"><table width="615" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="114" rowspan="4" valign="top"><a href="http://e-learninghmc.yeslearn.co.kr/data/ActiveTutor3.5.exe"><img src="/images/user/support/down_tutor.jpg" width="94" height="70" border="0"></a></td>
                            <td width="501"><img src="/images/user/support/down_tit_tutor.gif" width="461" height="18"></td>
                          </tr>
                          <tr> 
                            <td height="7"></td>
                          </tr>
                          <tr> 
                            <td valign="top">&quot;�ʺ��ڸ� ���� JAVA2���α׷���&quot;������ 
                              �н��Ͻø� �������ǽ� �ʿ��� ���α׷��Դϴ�. �ٿ�޾� ��ġ�Ͻñ� �ٶ��ϴ�. </td>
                          </tr>
                          <tr> 
                            <td valign="bottom"><img src="/images/user/support/down_line.gif" ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="25" align="center" valign="top">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td align="center" valign="top"><table width="615" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="114" rowspan="4" valign="top"><a href="http://e-learninghmc.yeslearn.co.kr/data/rp7com.exe"><img src="/images/user/support/down_real.jpg" border="0"></a></td>
                            <td width="501"><img src="/images/user/support/down_tit_real.gif" width="461" height="18"></td>
                          </tr>
                          <tr> 
                            <td height="7"></td>
                          </tr>
                          <tr> 
                            <td valign="top">ra, rm������ �̷���� ���Ǹ� ���� �ִ� ���α׷��Դϴ�. 
                              ��ġ�Ͻø� �ΰ����� ��ɵ� Ȱ���Ҽ� �ֽ��ϴ�. <br>
                              �ֽ� ���� �� �÷������� http://www.real.com���� ���ø� �̿��ϽǼ� �ֽ��ϴ�.</td>
                          </tr>
                          <tr> 
                            <td valign="bottom"><img src="/images/user/support/down_line.gif" ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td height="25" align="center" valign="top">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td align="center" valign="top"><table width="615" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="114" rowspan="4" valign="top"><img src="/images/user/support/down_nanumi.jpg" width="94" height="70"></td>
                            <td width="501"><img src="/images/user/support/down_tit_nanumi.gif" width="461" height="18"></td>
                          </tr>
                          <tr> 
                            <td height="7"></td>
                          </tr>
                          <tr> 
                            <td valign="top">��������,CyberMBA���¸� �н��Ͻ÷��� �н����α׷��� ��ġ�ؾ� 
                              �մϴ�. <br><br>
                               <table width="370" border="0" cellspacing="1" cellpadding="0">
                                              <tr bgcolor="#F0F0F0"> 
                                                <td width="93" height="25" align="center">���α׷���</td>
                                                <td width="178" height="25" align="center">ȯ 
                                                  ��</td>
                                                <td width="59" height="25" align="center">�ٿ�ޱ�</td>
                                              </tr>
                                              <tr bgcolor="#FFFFFF"> 
                                                <td>������ (2.5����)</td>
                                                <td>Window 95�����</td>
                                                
                                  <td align="center"><a href="http://www.yeslearn.co.kr/anytime/contents/270/program/NaNumi2.5.exe"><img src="/images/user/button/btn_download.gif" border="0"></a></td>
                                              </tr>
                                              <tr bgcolor="#FFFFFF"> 
                                                <td>������(3.5����)</td>
                                                <td>Window 98,ME, 2000,XP�����</td>
                                                
                                  <td align="center"><a href="http://www.yeslearn.co.kr/anytime/contents/270/program/NaNumiPlayer3.5.exe"><img src="/images/user/button/btn_download.gif" border="0"></a></td>
                                              </tr>
                                              <tr bgcolor="#FFFFFF"> 
                                                <td>������(NT��)</td>
                                                <td>Window NT �����</td>
                                                
                                  <td align="center"><a href="http://www.yeslearn.co.kr/anytime/contents/270/program/nanumi_nt.exe"><img src="/images/user/button/btn_download.gif" border="0"></a></td>
                                              </tr>
                                            </table> 
                            </td>
                          </tr>
                          <tr> 
                            <td valign="bottom"><img src="/images/user/support/down_line.gif" ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td align="center" valign="top">&nbsp;</td>
                    </tr>
                  </table> </td>
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