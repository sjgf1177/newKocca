<%
//**********************************************************
//  1. ��      ��: Ȩ������ ���� ��Ȳ
//  2. ���α׷���: zu_HomePageClient_L.jsp
//  3. ��      ��: Ȩ������ ���� ��Ȳ
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
	box.put("leftmenu","05");                       // �޴� ���̵� ����
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topGuide.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<script language="JavaScript" type="text/JavaScript">
<!--

//��Ź�Ʒ� �Ƿ����� ������ �̵��Ѵ�.
function Process() {
    document.form1.action = "/servlet/controller.homepage.HomePageClientServlet";
    document.form1.p_process.value = "selectList";
    document.form1.submit();
}


//-->
</script>
		  <!-- center start -->
		    <table width="730" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="20" align="center" valign="top" class="location"> 
                  HOME &gt; �����ȳ� &gt; ������Ȳ</td>
              </tr>
              <tr> 
                <td align="center" valign="top"> 
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top"><img src="/images/user/guide/<%=tem_subimgpath%>/tit_client.jpg"></td>
                    </tr>
                    <tr> 
                      <td height="20"></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><img src="/images/user/guide/st_c_01.gif"></td>
                    </tr>
                    <tr> 
                      <td height="20"></td>
                    </tr>
                    <tr>
                      <td height="20" align="center"><table width="650" border="0" cellpadding="0" cellspacing="0" bgcolor="FCFAF2">
                          <tr>
                            <td valign="top"><img src="/images/user/guide/c_box_top.gif" ></td>
                          </tr>
                          <tr>
                            <td align="center"><table width="600" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><img src="/images/user/guide/c_com_hyun.gif"></td>
                                  <td><img src="/images/user/guide/c_com_kia.gif"></td>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td valign="bottom"><img src="/images/user/guide/c_box_bo.gif" ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="20"></td>
                    </tr>
                  </table> 
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><img src="/images/user/guide/st_c_02.gif" ></td>
                    </tr>
                    <tr> 
                      <td height="15"></td>
                    </tr>
                    <tr> 
                      <td height="20" align="center"><table width="650" border="0" cellpadding="0" cellspacing="0" bgcolor="FCFAF2">
                          <tr> 
                            <td valign="top"><img src="/images/user/guide/c_box_top.gif" width="650" height="8"></td>
                          </tr>
                          <tr> 
                            <td align="center"><table width="600" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="152"><img src="/images/user/guide/c_com_mobis.gif"></td>
                                  <td width="150"><img src="/images/user/guide/c_com_dymos.gif" width="130" height="53"></td>
                                  <td width="148"><img src="/images/user/guide/c_com_power.gif"></td>
                                  <td width="150"><img src="/images/user/guide/c_com_kefico.gif" width="130" height="53"></td>
                                </tr>
                                <tr> 
                                  <td height="10" colspan="4"></td>
                                </tr>
                                <tr> 
                                  <td><img src="/images/user/guide/c_com_bontec.gif"></td>
                                  <td><img src="/images/user/guide/c_com_wia.gif"></td>
                                  <td><img src="/images/user/guide/c_com_wisco.gif" width="130" height="53"></td>
                                  <td><img src="/images/user/guide/c_com_aju.gif"></td>
                                </tr>
								 <tr> 
                                  <td height="10" colspan="4"></td>
                                </tr>
                                <tr> 
                                  <td><img src="/images/user/guide/c_com_ihl.gif"></td>
                                  <td><img src="/images/user/guide/c_com_echop.gif"></td>
                                  <td><img src="/images/user/guide/c_com_aia.gif"></td>
                                  <td><img src="/images/user/guide/c_com_msheet.gif"></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td valign="bottom"><img src="/images/user/guide/c_box_bo.gif" ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="20"></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><img src="/images/user/guide/st_c_03.gif" ></td>
                    </tr>
                    <tr> 
                      <td height="15"></td>
                    </tr>
                    <tr> 
                      <td height="20" align="center"><table width="650" border="0" cellpadding="0" cellspacing="0" bgcolor="FCFAF2">
                          <tr> 
                            <td valign="top"><img src="/images/user/guide/c_box_top.gif" ></td>
                          </tr>
                          <tr> 
                            <td align="center"><table width="650" border="0" cellpadding="0" cellspacing="0" bgcolor="FCFAF2">
                                <tr> 
                                  <td valign="top"><img src="/images/user/guide/c_box_top.gif" ></td>
                                </tr>
                                <tr> 
                                  <td align="center"><table width="600" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td width="153"><img src="/images/user/guide/c_com_ini.gif"></td>
                                        <td width="150"><img src="/images/user/guide/c_com_hysco.gif"></td>
                                        <td width="148"><img src="/images/user/guide/c_com_bng.gif"></td>
                                        <td width="149">&nbsp;</td>
                                      </tr>
                                    </table></td>
                                </tr>
                                <tr> 
                                  <td valign="bottom"><img src="/images/user/guide/c_box_bo.gif" ></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td valign="bottom"><img src="/images/user/guide/c_box_bo.gif" ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="20"></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><img src="/images/user/guide/st_c_04.gif" ></td>
                    </tr>
                    <tr> 
                      <td height="15"></td>
                    </tr>
                    <tr> 
                      <td height="20" align="center"><table width="650" border="0" cellpadding="0" cellspacing="0" bgcolor="FCFAF2">
                          <tr> 
                            <td valign="top"><img src="/images/user/guide/c_box_top.gif"></td>
                          </tr>
                          <tr> 
                            <td align="center"><table width="600" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="153"><img src="/images/user/guide/c_com_hycapital.gif"></td>
                                  <td width="150"><img src="/images/user/guide/c_com_hycard.gif"></td>
                                  <td width="148">&nbsp;</td>
                                  <td width="149">&nbsp;</td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td valign="bottom"><img src="/images/user/guide/c_box_bo.gif" ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="20"></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><img src="/images/user/guide/st_c_05.gif" ></td>
                    </tr>
                    <tr> 
                      <td height="15"></td>
                    </tr>
                    <tr> 
                      <td height="20" align="center" valign="top"><table width="650" border="0" cellpadding="0" cellspacing="0" bgcolor="FCFAF2">
                          <tr> 
                            <td valign="top"><img src="/images/user/guide/c_box_top.gif" ></td>
                          </tr>
                          <tr> 
                            <td align="center" valign="top"><table width="600" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="152"><img src="/images/user/guide/c_com_rotem.gif"></td>
                                  <td width="150"><img src="/images/user/guide/c_com_glovis.gif"></td>
                                  <td width="148"><img src="/images/user/guide/c_com_emco.gif"></td>
                                  <td width="150"><img src="/images/user/guide/c_com_hae.gif"></td>
                                </tr>
                                <tr> 
                                  <td height="10" colspan="4"></td>
                                </tr>
                                <tr> 
                                  <td><img src="/images/user/guide/c_com_kiati.gif"></td>
                                  <td><img src="/images/user/guide/c_com_echo.gif"></td>
                                  <td><img src="/images/user/guide/c_com_ngv.gif"></td>
                                  <td><img src="/images/user/guide/c_com_9ho.gif"></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td valign="bottom"><img src="/images/user/guide/c_box_bo.gif" ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="20"></td>
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
