<%
//**********************************************************
//  1. ��      ��: ����Ʈ��
//  2. ���α׷��� : ku_SiteMap.jsp
//  3. ��      ��: ����Ʈ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.22
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

    String  v_process     = box.getString("p_process");
    String  v_faqcategory = "";
    v_faqcategory = box.getString("faqcategory");

    int     v_fnum       = 0, v_totalpage = 0, v_rowcount = 1;
    int     v_pageno     = box.getInt("p_pageno");
    String  v_title      = "";
    String  v_contents   = "";
    String  v_indate     = "";
    String  v_searchtext = box.getString("p_searchtxt");
    ArrayList list       = (ArrayList)request.getAttribute("selectList");
    String faqcategory   ="";

%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/kocca/include/topSiteMap.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->


<SCRIPT LANGUAGE="JavaScript">
<!--

//-->
</SCRIPT>

                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td  class="location" > HOME > ����Ʈ��</td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td><img src="/images/user/kocca/common/<%=tem_subimgpath%>/tit_sitemap.gif"></td>
                          </tr>
                          <tr>
                            <td height="20"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td><img src="/images/user/kocca/common/text_sitemap.gif"></td>
                          </tr>
                          <tr >
                            <td height="1" background="/images/user/kocca/common/dot_bg_9.gif"></td>
                          </tr>
                          <tr >
                            <td height="35" ></td>
                          </tr>
                        </table>
                        <!--����Ʈ��
-->
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="182" valign="top">
                              <!--Ÿ��Ʋ -->
                              <table width="182" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><img src="/images/user/kocca/common/sm_st_course.gif"></td>
                                </tr>
                              </table>
                              <table width="182" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td background="/images/user/kocca/common/sitemap_bg_course.jpg"><table width="182" height="10" border="0" cellpadding="0" cellspacing="0">
                                      <tr>
                                        <td></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_01.gif"></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('1', '01', '1')">
                                            �����˻�</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_01.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('1', '02', '2')">
                                            ��ð���</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_01.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('1', '03', '3')">���ð���</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_01.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('1', '04', '4')">
                                            ����������</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_01.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('1', '05', '5')">
                                            ��ũ�����</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_01.gif"></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('1', '06', '6')">
                                            ������������</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"></div></td>
                                        <td class="tbl_bleft_none">&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table></td>
                            <td width="42">&nbsp;</td>
                            <td width="182" valign="top"><table width="182" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><!--img src="/images/user/kocca/common/sm_st_intro.gif"----></td>
                                </tr>
                              </table>
                              <table width="182" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="top" background=""><table width="182" height="10" border="0" cellpadding="0" cellspacing="0">
                                      <tr>
                                        <td></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <!--td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_02.gif"></div></td--->
                                        <!---td class="tbl_bleft_none"><a href="javascript:menuForward('4', '01', '1')">��ī���̼Ұ�</td----->
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <!---td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_02.gif"></div></td--->
                                        <!---td class="tbl_bleft_none"><a href="javascript:menuForward('4', '02', '2')">�����λ縻</td---->
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <!----td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_02.gif"></div></td>
                                        <td class="tbl_bleft_none"><a href="javascript:menuForward('4', '03', '3')">��ȭ�ܵ��� �η¾缺����</a></td----->
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table></td>
                            <td width="42">&nbsp;</td>
                            <td width="182" valign="top"><table width="182" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><img src="/images/user/kocca/common/sm_st_culture.gif" ></td>
                                </tr>
                              </table>
                              <table width="182" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="top" background="/images/user/kocca/common/sitemap_bg_contents.jpg"><table width="182" height="10" border="0" cellpadding="0" cellspacing="0">
                                      <tr>
                                        <td></td>
                                      </tr>
                                    </table>
                                    <!--table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_03.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('5', '01', '1')">ȸ������</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table-->
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_03.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('5', '03', '3')">
                                            �Ŀ� ���ͺ�</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_03.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('5', '02', '2')">�������� ����</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>

                                    </td>
                                </tr>
                              </table></td>
                            <td width="50">&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="3" colspan="6"></td>
                          </tr>
                          <tr>
                            <td rowspan="3" valign="top"><table width="182" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><img src="/images/user/kocca/common/sm_st_myclass.gif" ></td>
                                </tr>
                              </table>
                              <table width="182" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="top" background="/images/user/kocca/common/sitemap_bg_myclass.jpg"><table width="182" height="10" border="0" cellpadding="0" cellspacing="0">
                                      <tr>
                                        <td></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_04.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('3', '01', '1')">
                                            ���ǽ� </a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_04.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('3', '02', '2')">
                                            �����̷�</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_04.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('3', '03', '3')">
                                            ���ǻ�㳻��</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_04.gif"></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('3', '04', '4')">
                                            ���Ǽ���</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_04.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('3', '05', '5')">
                                            �����н�Ȱ��</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_04.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('3', '06', '6')">
                                            e-test</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_04.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('3', '07', '7')">
                                            ������õ����</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_04.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('3', '08', '8')">
                                            ���ɰ���</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <!--table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_04.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('3', '09', '9')">
                                            ���ϸ���</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table--></td>
                                </tr>
                              </table></td>
                            <td height="260">&nbsp;</td>
                            <td valign="top"><table width="182" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><img src="/images/user/kocca/common/sm_st_apply.gif" ></td>
                                </tr>
                              </table>
                              <table width="182" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="top" background="/images/user/kocca/common/sitemap_bg_apply.jpg"><table width="182" height="10" border="0" cellpadding="0" cellspacing="0">
                                      <tr>
                                        <td></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_05.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('2', '01', '1')">������û/ ��� �ȳ�</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_05.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('2', '02', '2')">������û</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_05.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('2', '03', '3')">
                                            ������û Ȯ��/���</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_05.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('2', '04', '4')">
                                            �������ΰ��� ��û/Ȯ��</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_05.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('2', '05', '5')">
                                            ��������</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"></div></td>
                                        <td class="tbl_bleft_none">&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"></div></td>
                                        <td class="tbl_bleft_none">&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table></td>
                            <td>&nbsp;</td>
                            <td valign="top"><table width="182" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><img src="/images/user/kocca/common/sm_st_customer.gif" ></td>
                                </tr>
                              </table>
                              <table width="182" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="top" background="/images/user/kocca/common/sitemap_bg_customer.jpg"><table width="182" height="10" border="0" cellpadding="0" cellspacing="0">
                                      <tr>
                                        <td></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_06.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('6', '01', '1')">
                                            F A Q</td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_06.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('6', '02', '2')">
                                            1 : 1 ���</td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_06.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('6', '03', '3')">
                                            �¶����н��̿�ȳ�</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_06.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('6', '04', '4')">
                                            �н��ڷ��</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_06.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('6', '05', '5')">
                                            ���α׷��ٿ�ε�</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_06.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="javascript:menuForward('6', '06', '6')">
                                            �н�ȯ��ý���</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"></div></td>
                                        <td class="tbl_bleft_none">&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table></td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td rowspan="2">&nbsp;</td>
                            <td height="3" colspan="3"></td>
                            <td rowspan="2">&nbsp;</td>
                          </tr>
                          <tr>
                            <td valign="top"><table width="182" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><img src="/images/user/kocca/common/sm_st_member.gif" ></td>
                                </tr>
                              </table>
                              <table width="182" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="top" background="/images/user/kocca/common/sitemap_bg_customer.jpg"><table width="182" height="10" border="0" cellpadding="0" cellspacing="0">
                                      <tr>
                                        <td></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_06.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="/servlet/controller.homepage.KLoginServlet?p_process=golosspwd">
                                            ���̵�/��й�ȣã��</a>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_06.gif" ></div></td>
                                        <td class="tbl_bleft_none">
                                            <a href="/servlet/controller.homepage.KMemberJoinServlet?p_process=join">
                                            ȸ������</a></td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_06.gif" ></div></td>
                                        <td class="tbl_bleft_none">����������ȣ��å</td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"><img src="/images/user/kocca/common/site_bl_06.gif" ></div></td>
                                        <td class="tbl_bleft_none">�̿���</td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table>
                                    <table width="182" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="24"><div align="right"></div></td>
                                        <td class="tbl_bleft_none">&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td height="5" colspan="2"></td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table></td>
                            <td>&nbsp;</td>
                            <td valign="top"><table width="182" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><img src="/images/user/kocca/common/sm_st_notice.gif" ></td>
                                </tr>
                              </table>
                              <table width="182" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><img src="/images/user/kocca/common/sitemap_bo.gif" ></td>
                                </tr>
                                <tr>
                                  <td height="18"></td>
                                </tr>
                              </table>
                              <table width="182" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><img src="/images/user/kocca/common/sm_st_sitemap.gif"></td>
                                </tr>
                              </table>
                              <table width="182" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><img src="/images/user/kocca/common/sitemap_bo.gif" ></td>
                                </tr>
                                <tr>
                                  <td height="18"></td>
                                </tr>
                              </table></td>
                          </tr>
                        </table> 
    </form>

<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  -------------------->