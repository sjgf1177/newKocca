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
                      <td height="35" width="720" align="right"  background="/images/user/game/aboutus/<%=tem_subimgpath%>/tit_04.gif" class="location"><img src="/images/user/game/common/location_bl.gif"> HOME > aboutus > ����ü����</td>
                    </tr>
                    <tr> 
                      <td height="20">&nbsp;</td>
                    </tr>
                  </table>
             
                  <table width="720" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td valign="top">
					  <table width="720" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/game/aboutus/st_2002f.gif" width="352" height="15"></td>
                          </tr>
                          <tr> 
                            <td height="5"></td>
                          </tr>
                        </table>
                        <table width="720" border="0" cellpadding="0" cellspacing="0" background="/images/user/game/aboutus/box_bg.gif">
                          <tr>
                            <td valign="top"><img src="/images/user/game/aboutus/box_t.gif"></td>
                          </tr>
                          <tr>
                            <td align="center" valign="top">
							<table width="680" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td><img src="/images/user/game/aboutus/bl_01.gif" align="absmiddle"><strong><font color="#669933">���б� 
                                    (5��)</font></strong></td>
                                </tr>
                                <tr> 
                                  <td height="5" background="/images/user/game/aboutus/line_bg.gif"></td>
                                </tr>
                                <tr> 
                                  <td height="8"></td>
                                </tr>
                              </table>
                              <table width="650" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td>�������̹����б�, �������д���, ��õ����, ȣ�����б�, ���̹����Ӵ���</td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td valign="bottom"><img src="/images/user/game/aboutus/box_bo.gif"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  
                  <table width="720" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                  <table width="720" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top">
					  <table width="720" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/game/aboutus/st_2002b.gif" width="352" height="15"></td>
                          </tr>
                          <tr> 
                            <td height="5"></td>
                          </tr>
                        </table>
                        <table width="720" border="0" cellpadding="0" cellspacing="0" background="/images/user/game/aboutus/box_bg.gif">
                          <tr> 
                            <td valign="top"><img src="/images/user/game/aboutus/box_t.gif"></td>
                          </tr>
                          <tr> 
                            <td align="center" valign="top">
							<table width="680" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td><img src="/images/user/game/aboutus/bl_01.gif" align="absmiddle"><strong><font color="#669933">���б� (9��)</font></strong></td>
                                </tr>
                                <tr> 
                                  <td height="5" background="/images/user/game/aboutus/line_bg.gif"></td>
                                </tr>
                                <tr> 
                                  <td height="8"></td>
                                </tr>
                              </table>
                              <table width="657" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="657">�ص���������, ��Ҵ��б�, �������б�, ��������, 
                                    �������̹����б�, �������б�, ȣ�����б�, �������д���, Ž����б� </td>
                                </tr>
                                <tr>
                                  <td>&nbsp;</td>
                                </tr>
                              </table>
                              <table width="680" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td><img src="/images/user/game/aboutus/bl_01.gif" align="absmiddle"><strong><font color="#669933">���Ӱ��߻� 
                                    (9��)</font></strong></td>
                                </tr>
                                <tr> 
                                  <td height="5" background="/images/user/game/aboutus/line_bg.gif"></td>
                                </tr>
                                <tr> 
                                  <td height="8"></td>
                                </tr>
                              </table>
                              <table width="657" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="657">�ߵ����е帲�÷���, �߹������δ���, �ߺ�Ʋ��, �߹�������, 
                                    �߼���Ʈ���̺�, �߿��彺������, �߿��翣�����θ�Ʈ,<br>
                                    �߿�����, ���ڵ�� </td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td valign="bottom"><img src="/images/user/game/aboutus/box_bo.gif"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  <table width="720" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                  <table width="720" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top">
					  <table width="720" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/game/aboutus/st_2003f.gif" width="352" height="15"></td>
                          </tr>
                          <tr> 
                            <td height="5"></td>
                          </tr>
                        </table>
                        <table width="720" border="0" cellpadding="0" cellspacing="0" background="/images/user/game/aboutus/box_bg.gif">
                          <tr> 
                            <td valign="top"><img src="/images/user/game/aboutus/box_t.gif"></td>
                          </tr>
                          <tr> 
                            <td align="center" valign="top">
							<table width="680" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td><img src="/images/user/game/aboutus/bl_01.gif" align="absmiddle"><strong><font color="#669933">���б� 
                                    (37��)</font></strong></td>
                                </tr>
                                <tr> 
                                  <td height="5" background="/images/user/game/aboutus/line_bg.gif"></td>
                                </tr>
                                <tr> 
                                  <td height="8"></td>
                                </tr>
                              </table>
                              <table width="650" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td>�泲���б�, ���ֺ��Ǵ���, ���ֿ��ڴ��б�, ��õ���д���, ���緿���б�, 
                                    ���δ��б�, ��������б�, ������, �뱸�̷�����, �뱸���Ǵ���, ��Ҵ��б�, 
                                    �������, �����������б�, ���ǰ�������, ������������, �λ������, �λ�ܱ�����б�, 
                                    ��������, �������, �������̹����б�, ������б�, �������̹�����, �������б�, 
                                    �����д���, �������б�, ���������д��б�, �������д���, ���ְ�������, ���ֱ������б�, 
                                    û�ֱ������б�, �߰迹�����б�, ��õ��������, Ž����б�, �ѱ��ܱ�����б�, 
                                    �Ѽ����б�, ��������, ȣ�����б� </td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td valign="bottom"><img src="/images/user/game/aboutus/box_bo.gif"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  <table width="720" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                  <table width="720" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top">
					  <table width="720" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/game/aboutus/st_2003b.gif" width="352" height="15"></td>
                          </tr>
                          <tr> 
                            <td height="5"></td>
                          </tr>
                        </table>
                        <table width="720" border="0" cellpadding="0" cellspacing="0" background="/images/user/game/aboutus/box_bg.gif">
                          <tr> 
                            <td valign="top"><img src="/images/user/game/aboutus/box_t.gif"></td>
                          </tr>
                          <tr> 
                            <td align="center" valign="top">
							<table width="680" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td><img src="/images/user/game/aboutus/bl_01.gif" align="absmiddle"><strong><font color="#669933">���б� 
                                    (8��)</font></strong></td>
                                </tr>
                                <tr> 
                                  <td height="5" background="/images/user/game/aboutus/line_bg.gif"></td>
                                </tr>
                                <tr> 
                                  <td height="8"></td>
                                </tr>
                              </table>
                              <table width="650" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td>������б�, �������б�, �ѱ����������б�, ȫ�ʹ��б�, ��â�������б�, 
                                    ���������������, ������, �������Ǵ��� </td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td valign="bottom"><img src="/images/user/game/aboutus/box_bo.gif"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  <table width="720" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                  <table width="720" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top">
					  <table width="720" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/game/aboutus/st_2004f.gif" width="352" height="15"></td>
                          </tr>
                          <tr> 
                            <td height="5"></td>
                          </tr>
                        </table>
                        <table width="720" border="0" cellpadding="0" cellspacing="0" background="/images/user/game/aboutus/box_bg.gif">
                          <tr> 
                            <td valign="top"><img src="/images/user/game/aboutus/box_t.gif"></td>
                          </tr>
                          <tr> 
                            <td align="center" valign="top">
							<table width="680" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td><img src="/images/user/game/aboutus/bl_01.gif" align="absmiddle"><strong><font color="#669933">���б� 
                                    (39��)</font></strong></td>
                                </tr>
                                <tr> 
                                  <td height="5" background="/images/user/game/aboutus/line_bg.gif"></td>
                                </tr>
                                <tr> 
                                  <td height="8"></td>
                                </tr>
                              </table>
                              <table width="650" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td>��ϴ��б�, �浿��������, ���ִ��б�, ���ֿ��ڴ��б�, ��õ���д���, ���緿���б�, 
                                    ��������б�, ������, �뱸�̷�����, �뱸���̹����б�, �뱸�������б�, �뱸���Ǵ��б�, 
                                    ��Ҵ��б�, �������, ���ǰ�������, ������б�, ���������, ���ﺸ�Ǵ���, 
                                    ���ſ��ڴ��б�, ��ȣ����, ���Ǵ��б�, ������б�, �����������б�, ��۴��б�, 
                                    �����������, �����д���, �������б�, �������д���, ���ְ�������, Ž����б�, 
                                    â�Ŵ���, õ�ȴ��б�, û����ȭ�������, �ѱ��ܱ�����б�, �Ѽ����б�, �Ѽ����б�, 
                                    ��������, ȣ�����б�, ȣ�����б�</td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td valign="bottom"><img src="/images/user/game/aboutus/box_bo.gif"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  <table width="720" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                  <table width="720" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top">
					  <table width="720" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/game/aboutus/st_2004b.gif" width="352" height="15"></td>
                          </tr>
                          <tr> 
                            <td height="5"></td>
                          </tr>
                        </table>
                        <table width="720" border="0" cellpadding="0" cellspacing="0" background="/images/user/game/aboutus/box_bg.gif">
                          <tr> 
                            <td valign="top"><img src="/images/user/game/aboutus/box_t.gif"></td>
                          </tr>
                          <tr> 
                            <td align="center" valign="top">
							<table width="680" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td><img src="/images/user/game/aboutus/bl_01.gif" align="absmiddle"><strong><font color="#669933">���б� 
                                    (8��)</font></strong></td>
                                </tr>
                                <tr> 
                                  <td height="5" background="/images/user/game/aboutus/line_bg.gif"></td>
                                </tr>
                                <tr> 
                                  <td height="8"></td>
                                </tr>
                              </table>
                              <table width="650" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td>�����б�, ���ִ��б�, ���ֺ��Ǵ���, �������, �ۿ�����, �켮���б�, 
                                    �ѱ�����������б�, �ѱ����̹����б�, �Ѹ����б�, ���ִ��б�</td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td valign="bottom"><img src="/images/user/game/aboutus/box_bo.gif"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  <table width="720" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                  <table width="720" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top">
					  <table width="720" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/game/aboutus/st_2005f.gif" width="352" height="15"></td>
                          </tr>
                          <tr> 
                            <td height="5"></td>
                          </tr>
                        </table>
                        <table width="720" border="0" cellpadding="0" cellspacing="0" background="/images/user/game/aboutus/box_bg.gif">
                          <tr> 
                            <td valign="top"><img src="/images/user/game/aboutus/box_t.gif"></td>
                          </tr>
                          <tr> 
                            <td align="center" valign="top">
							<table width="680" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td><img src="/images/user/game/aboutus/bl_01.gif" align="absmiddle"><strong><font color="#669933">���б� 
                                    (27��)</font></strong></td>
                                </tr>
                                <tr> 
                                  <td height="5" background="/images/user/game/aboutus/line_bg.gif"></td>
                                </tr>
                                <tr> 
                                  <td height="8"></td>
                                </tr>
                              </table>
                              <table width="650" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td>��ϴ��б�, �����б�, ��õ���д���, �뱸�̷�����, �뱸���Ǵ��б�, ���ǰ��д���, 
                                    ������������, ������б�, ������������, �������̹����б�, �������̹�����, 
                                    �����������б�, �켮���б�, ��۴��б�, �������б�, ���ִ��б�, �ּ�����, 
                                    â�Ŵ���, û����ȭ�������, û�����, �ѱ����̹����б�, �Ѹ����б�, �Ѹ����ɴ���, 
                                    ��������, ȣ�����б�, ȣ�����б�, ȣ�����б�</td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td valign="bottom"><img src="/images/user/game/aboutus/box_bo.gif"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  <table width="720" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                  <table width="720" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top">
					  <table width="720" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/game/aboutus/st_2005b.gif" width="352" height="15"></td>
                          </tr>
                          <tr> 
                            <td height="5"></td>
                          </tr>
                        </table>
                        <table width="720" border="0" cellpadding="0" cellspacing="0" background="/images/user/game/aboutus/box_bg.gif">
                          <tr> 
                            <td valign="top"><img src="/images/user/game/aboutus/box_t.gif"></td>
                          </tr>
                          <tr> 
                            <td align="center" valign="top">
							<table width="680" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td><img src="/images/user/game/aboutus/bl_01.gif" align="absmiddle"><strong><font color="#669933">���б� 
                                    (17��)</font></strong></td>
                                </tr>
                                <tr> 
                                  <td height="5" background="/images/user/game/aboutus/line_bg.gif"></td>
                                </tr>
                                <tr> 
                                  <td height="8"></td>
                                </tr>
                              </table>
                              <table width="650" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td>���縯���б�, �������б�, ���ִ��б�, ���ֺ��Ǵ���, ���δ��б�, �������б�, 
                                    �λ���������, �������, ���μ۴����, ���������д��б�, ��ȴ���, �����Ѷ����, 
                                    ���ش���, �ѱ����������б�, �ѱ��ܱ�����б�, �ѱ���Ȱ��������, �Ѷ���б�</td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td valign="bottom"><img src="/images/user/game/aboutus/box_bo.gif"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  <table width="720" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                  <table width="720" border="0" cellpadding="0" cellspacing="0" background="/images/user/game/aboutus/box1_bg.gif">
                    <tr> 
                      <td valign="top"><img src="/images/user/game/aboutus/box1_t.gif" width="720" height="18"></td>
                    </tr>
                    <tr> 
                      <td align="center" valign="top">
						<table width="650" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td>���Ӿ�ī���̿� ���ݱ��� ���� ���� ���� ü�� ���б����� ���� ȸ������ �����ϴ� �л� 
                              � ���ؿ� ���� ���񽺸�<br>
                              �����ϸ�, ����� �Ϲ��� ȸ���� ���������� �����Դϴ�.<br>
                              ���� ���Ǵ� ����� ( ������ �� 02-512-4873 <a href="mailto:hhinny@gameacademy.or.kr"><strong>hhinny@gameacademy.or.kr 
                              </strong></a>)���� �����Ͻñ� �ٶ��ϴ�. </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td valign="bottom"><img src="/images/user/game/aboutus/box1_bo.gif" width="720" height="18"></td>
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