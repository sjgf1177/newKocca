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

    box.put("leftmenu","03"); 
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/kocca/include/topAbout.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

 <SCRIPT>
var old_menu = ''; var old_cell = '';
function comment( submenu, cellbar) {

    if( old_menu != submenu ) {

        if( old_menu !='' ) {
            old_menu.style.display = 'none';
        }
        submenu.style.display = 'block';
        old_menu = submenu;
        old_cell = cellbar;

    } else {
        submenu.style.display = 'none';
        old_menu = '';
        old_cell = '';
    }
}

</SCRIPT>

                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td  class="location" > HOME > ��ī���̼Ұ� > ��ȭ������ �η¾缺��ü 
                              ü��</td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/kocca/aboutus/<%=tem_subimgpath%>/tit_academy.gif"></td>
                          </tr>
                          <tr> 
                            <td height="20"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="88" rowspan="3"><img src="/images/user/kocca/aboutus/text_academy.gif" width="680" height="33"></td>
                          </tr>
                          <tr> 
                            <td height="12"></td>
                          </tr>
                          <tr > 
                            <td height="1" colspan="2" background="/images/user/kocca/common/dot_bg_9.gif"></td>
                          </tr>
                          <tr > 
                            <td height="7" colspan="2" ></td>
                          </tr>
                        </table>
                        <!--ü�赵��� -->
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="20">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td><span style="CURSOR: hand" 
                              onClick=comment(menu1);><img src="/images/user/kocca/aboutus/list_01.gif"></span></td>
                          </tr>
                          <tr> 
                            <td valign="top" style="PADDING-LEFT: 35px"><SPAN id=menu1 
                              style="DISPLAY: none"> 
                              <TABLE cellSpacing=0 cellPadding=0 width="95%" 
                              border=0>
                                <TBODY>
                                  <TR> 
                                    <TD height=10></TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_purpose.gif"> 
                                    </TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10" valign="top"></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"> 
                                      ��ȭ����������� �۷ι�ȭ�� ����ϴ� ������ ���� �� �ٽ� �濵�� �׷� �缺</TD>
                                  </TR>
                                  <TR> 
                                    <TD height=20>&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_con.gif"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"> <img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong>���</strong> 
                                      : ����, CEO, CT�����, �ι��� �� �ٺо� ������ </TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong>�Ⱓ 
                                      </strong>: 6����, �� 1ȸ </TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"> - �������� 
                                      (5����) : �߰� (18:30��10:00), �� 2ȸ (1�� 3hr) 
                                      <br>
                                      - �ؿܱ��� (2��) : ���� ���п� ���� (Certificate ����) 
                                      <br>
                                      - ������ : ��������Ʈ �������� ���� (�����ȹ�� ���Ǳ��� ��)</TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong>�ο�</strong> 
                                      : 30�� ����</TD>
                                  </TR>
                                  <TR> 
                                    <TD height=20>&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_day.gif"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      2 ~ 4 : ������ ���� �� ����</TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      5 ~ 10 : ����� (�ؿܿ��� : 8��9����)</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="20">&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_tel.gif" width="220" height="14"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8">�η¾缺�� 
                                      �ں�ȣ �븮(02-2016-4123 / <a href="mailto:jackone@kocca.or.kr">jackone@kocca.or.kr</a>)</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="20">&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD></TD>
                                  </TR>
                                </TBODY>
                              </TABLE>
                              </SPAN></td>
                          </tr>
                          <tr> 
                            <td valign="top"><span style="CURSOR: hand" 
                              onClick=comment(menu2);><img src="/images/user/kocca/aboutus/list_02.gif" width="680" height="37"></span></td>
                          </tr>
                          <tr> 
                            <td valign="top" style="PADDING-LEFT: 35px"><span id="menu2" style="DISPLAY: none"> 
                              <TABLE cellSpacing=0 cellPadding=0 width="95%" 
                              border=0>
                                <TBODY>
                                  <TR> 
                                    <TD height=10></TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_purpose.gif"> 
                                    </TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10" valign="top"></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"> 
                                      ������, ���� �� �����ι� �����η¿� ���� ��ȭ����������� �߿伺 ����</TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"> 
                                      �����η� ���� �� ��ȭ��������� �����ڿ� ���� �米�� ���� </TD>
                                  </TR>
                                  <TR> 
                                    <TD height=20>&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_con.gif"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"> <img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><font color="#336699">�����ι� 
                                      �����η� �������� (�ְ�)</font></TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con">- ������/����/����/���������/��ȣ�� 
                                      : �� 1~2ȸ, 1~2��, ������ 30�� ����</TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><font color="#336699">��ȭ������ 
                                      �������� (�߰�)</font></TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"> - ���߰���(�� 
                                      ��������) : �� 2ȸ, 1����, ���� 25�� <br>
                                      - ��ȭ���� : �� 2ȸ, 2�� ����(��ȹ��,����Ͻ� ��), 2����, ���� 
                                      25�� </TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><font color="#336699">��ȭ��������� 
                                      �ǹ���ũ�� (�ְ�, �ռ�)</font></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con">- �� 5ȸ, 1�� 2��, ���� 50��</TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><font color="#336699">����Ưȭ 
                                      �����η� �缺����(�ְ� �Ǵ� �߰�)</font></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con">- 5�� ����, ������ 25�� ����</TD>
                                  </TR>
                                  <TR> 
                                    <TD height=20>&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_day.gif" align="absmiddle">(�������� 
                                      ���� ����)</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      4 ~ 12 : ���� �</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="20">&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_tel.gif" width="220" height="14"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8">�η¾缺�� 
                                      ������ �븮 (02-2016-4124 / <a href="mailto:hsji@kocca.or.kr">hsji@kocca.or.kr</a>)</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="20">&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD></TD>
                                  </TR>
                                </TBODY>
                              </TABLE>
                              </span></td>
                          </tr>
                          <tr> 
                            <td valign="top"><span style="CURSOR: hand" 
                              onClick=comment(menu3);><img src="/images/user/kocca/aboutus/list_03.gif" width="680" height="37"></span></td>
                          </tr>
                          <tr> 
                            <td valign="top" style="PADDING-LEFT: 35px"><span id="menu3" style="DISPLAY: none">
                              <TABLE cellSpacing=0 cellPadding=0 width="95%" 
                              border=0>
                                <TBODY>
                                  <TR> 
                                    <TD height=10></TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_purpose.gif"> 
                                    </TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10" valign="top"></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"> 
                                      ��ȭ������ �����η��� �۷ι� �ȸ�� ���� �Ծ��� ���� �������α׷� �</TD>
                                  </TR>
                                  <TR> 
                                    <TD height=20>&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_con.gif"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"> <img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong>��������</strong> 
                                      : �̱�, ����, �Ϻ�, �߱�</TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong>�����ο�</strong> 
                                      : �� 120�� ���� (������ �� 30��)</TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong>�����Ⱓ</strong> 
                                      : �̱�/���� 2��, �Ϻ�/�߱� 1��</TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong>������ 
                                      ����</strong> : ������ ���� �� ���ں� 50% (�� �������� 60% 
                                      �̳�)</TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong>��������</strong> 
                                      : �� �ؿܽ��庰 ��ȭ������ ����� ����</TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con">�� ���� : �ؿܾ�ü���� Biz Matching 
                                      �� Global Networking Ȱ�� ���� </TD>
                                  </TR>
                                  <TR> 
                                    <TD height=20>&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_day.gif" align="absmiddle">(�������� 
                                      ���� ����)</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      3 ~ 4 : ���� ����ó Ȯ��</TD>
                                  </TR>
                                  <TR>
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      4 ~ 5 : ������ ����, ���� �غ�</TD>
                                  </TR>
                                  <TR>
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      6 ~ 9 : ���� ���� ����</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="20">&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_tel.gif" width="220" height="14"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8">�η¾缺�� 
                                      ���� ����(02-2016-4121 /<a href="mailto:dionia@kocca.or.kr"> 
                                      dionia@kocca.or.kr</a>)</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="20">&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD></TD>
                                  </TR>
                                </TBODY>
                              </TABLE>
                              </span></td>
                          </tr>
                          <tr> 
                            <td valign="top" ><span style="CURSOR: hand" 
                              onClick=comment(menu4);><img src="/images/user/kocca/aboutus/list_04.gif" width="680" height="37"></span></td>
                          </tr>
                          <tr> 
                            <td valign="top" style="PADDING-LEFT: 35px"><span id="menu4" style="DISPLAY: none">
                              <TABLE cellSpacing=0 cellPadding=0 width="95%" 
                              border=0>
                                <TBODY>
                                  <TR> 
                                    <TD height=10></TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_purpose.gif"> 
                                    </TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10" valign="top"></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"> 
                                      ��� ������ ���꼺 �� ����� ��ȭ�� ���� ����� ���䰡 ū ��ȹ(Planning)��â��(Story-Telling) 
                                      <br>
                                      �ι� ������ �缺 </TD>
                                  </TR>
                                  <TR> 
                                    <TD height=20>&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_con.gif"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"> <img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong>�����Ⱓ</strong> 
                                      : 6���� (2006. 7 �� 2007. 2)</TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong>�����ð�</strong> 
                                      : �ְ� (09:00��17:00) ��Ģ (1�� 7�ð�)</TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong>�������</strong> 
                                      : ���úо� ������ �� �����</TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong>��������</strong> 
                                      : �� 20�� ���� (�л����� ��������/���� ������ �켱)</TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong>��������</strong></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"> - ����/�ؿ� ���� : ��ȭ������ �帣�� 
                                      ��ȹ/â�ۻ��, �ؿܼ������ <br>
                                      - ��ü���� ������Ʈ �ǽ�, �İ߱ٹ�, â�۰���� ��ǥȸ �� </TD>
                                  </TR>
                                  <TR> 
                                    <TD height=20>&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_day.gif" align="absmiddle"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      4 ~ 5 : ������ ���� �� ����</TD>
                                  </TR>
                                  <TR>
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      7 ~ 2007. 2 : ���� �</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="20">&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_tel.gif" width="220" height="14"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8">�η¾缺�� 
                                      �ں�ȣ �븮(02-2016-4123 /<a href="mailto:jackone@kocca.or.kr"> 
                                      jackone@kocca.or.kr</a>)</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="20">&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD></TD>
                                  </TR>
                                </TBODY>
                              </TABLE>
                              </span></td>
                          </tr>
                          <tr> 
                            <td valign="top" ><span style="CURSOR: hand" 
                              onClick=comment(menu5);><img src="/images/user/kocca/aboutus/list_05.gif" width="680" height="37"></span></td>
                          </tr>
                          <tr> 
                            <td valign="top" style="PADDING-LEFT: 35px"><span id="menu5" style="DISPLAY: none">
                              <TABLE cellSpacing=0 cellPadding=0 width="95%" 
                              border=0>
                                <TBODY>
                                  <TR> 
                                    <TD height=10></TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_purpose.gif"> 
                                    </TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10" valign="top"></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"> 
                                      ��ȭ������ �����л��� â�Ǽ� �߱� �� û������ ���� ��ȸ ����</TD>
                                  </TR>
                                  <TR> 
                                    <TD height=20>&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_con.gif"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"> <img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><font color="#336699">������� 
                                      : ��ȭ������ ���� ���Ƹ� (������ �̻�) / 30�� ����</font></TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con">- �ش��б�(��)�� 
                                      �������� ��ϵ� ���Ƹ��� ���� / �����б� ���� ��û ���� <br>
                                      - ��û �ʼ���� : �������´�/�������� ����, �������¾�ü ���� ���� 
                                    </TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong>�����Ը�</strong> 
                                      : (���� ����)</TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong>��������</strong> 
                                      : â��Ȱ���� �ʿ��� ����, �����, Ȱ���� ��</TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><font color="#336699">�������� 
                                      �� Ȱ��ȭ ����</font></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con">- �б�(����)���� �μ�Ƽ�� : ��������, 
                                      ���б� ���� �� <br>
                                      - �������� ������â�۹� ��ǥȸ�� ���� </TD>
                                  </TR>
                                  <TR> 
                                    <TD height=20>&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_day.gif" align="absmiddle">(�������� 
                                      ���� ����)</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      3 ~ 4 : ������� �� ���� �ɻ�</TD>
                                  </TR>
                                  <TR>
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      5 ~11 : ��� ���� (���Ƹ� â��Ȱ��, �߰� ���� ����)</TD>
                                  </TR>
                                  <TR>
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      12 : ��� ��</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="20">&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_tel.gif" width="220" height="14"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8">�η¾缺�� 
                                      �켺�� ����(02-2016-4122 / <a href="mailto:wsb21@kocca.or.kr">wsb21@kocca.or.kr</a>)</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="20">&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD></TD>
                                  </TR>
                                </TBODY>
                              </TABLE>
                              </span></td>
                          </tr>
                          <tr> 
                            <td valign="top" ><span style="CURSOR: hand" 
                              onClick=comment(menu6);><img src="/images/user/kocca/aboutus/list_06.gif" width="680" height="37"></span></td>
                          </tr>
                          <tr> 
                            <td valign="top" style="PADDING-LEFT: 35px"><span id="menu6" style="DISPLAY: none">
                              <TABLE cellSpacing=0 cellPadding=0 width="95%" 
                              border=0>
                                <TBODY>
                                  <TR> 
                                    <TD height=10></TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_purpose.gif"> 
                                    </TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10" valign="top"></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"> 
                                      �η¾缺 ��å������ ���� �������� �� ��� ��� ��ġ��ŷ �ǽ�</TD>
                                  </TR>
                                  <TR> 
                                    <TD height=20>&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_con.gif"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"> <img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8">������� 
                                      ��Ȳ���� �� �η¼��޿��� ����</TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8">��ȭ��������� 
                                      �η����� �� �����м� ���տ���</TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8">��ȭ������ 
                                      ������� �η¾缺 ��ġ��ŷ �����뿪</TD>
                                  </TR>
                                  <TR> 
                                    <TD height=20>&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_day.gif" align="absmiddle"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      3 : ������� ����</TD>
                                  </TR>
                                  <TR>
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      4 ~10 : ���� ����</TD>
                                  </TR>
                                  <TR>
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      10 : �����������</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="20">&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_tel.gif" width="220" height="14"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8">�η¾缺�� 
                                      �ں�ȣ �븮(02-2016-4123 / <a href="mailto:jackone@kocca.or.kr">jackone@kocca.or.kr</a>)</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="20">&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD></TD>
                                  </TR>
                                </TBODY>
                              </TABLE>
                              </span></td>
                          </tr>
                          <tr> 
                            <td valign="top" ><span style="CURSOR: hand" 
                              onClick=comment(menu7);><img src="/images/user/kocca/aboutus/list_07.gif" width="680" height="37"></span></td>
                          </tr>
                          <tr> 
                            <td valign="top" style="PADDING-LEFT: 35px"><span id="menu7" style="DISPLAY: none">
                              <TABLE cellSpacing=0 cellPadding=0 width="95%" 
                              border=0>
                                <TBODY>
                                  <TR> 
                                    <TD height=10></TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_purpose.gif"> 
                                    </TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10" valign="top"></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"> 
                                      û�ҳ� ��� ��ȭ����������� �߿伺 ȫ��</TD>
                                  </TR>
                                  <TR> 
                                    <TD height=20>&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_con.gif"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"> <img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong>������� 
                                      </strong>: ��/��/�� �� �����б� �� û�ҳ� �ü� ��ü</TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><font color="#336699">����</font></TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"> - ��ȭ������ 
                                      �ڹ輭�� ����Ȱ�� (150��) <br>
                                      - ��ȭ������ â���佺Ƽ�� ���� <br>
                                      - ��ȭ������ ���� ���̵�� ���� <br>
                                      - ��ȭ������ ����� ���� �� </TD>
                                  </TR>
                                  <TR> 
                                    <TD height=20>&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_day.gif" align="absmiddle"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      3 : ������û</TD>
                                  </TR>
                                  <TR>
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      4��12 : �������� �� ����� ����</TD>
                                  </TR>
                                  <TR>
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      4��12 : ��ȭ������ ���� ���̵�� ����</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="20">&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_tel.gif" width="220" height="14"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8">��ȹ������ 
                                      ������(02-2016-4036 / <a href="mailto:nurimy@kocca.or.kr">nurimy@kocca.or.kr</a>)</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="20">&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD></TD>
                                  </TR>
                                </TBODY>
                              </TABLE>
                              </span></td>
                          </tr>
                          <tr> 
                            <td valign="top" ><span style="CURSOR: hand" 
                              onClick=comment(menu8);><img src="/images/user/kocca/aboutus/list_08.gif" width="680" height="37"></span></td>
                          </tr>
                          <tr> 
                            <td valign="top" style="PADDING-LEFT: 35px"><span id="menu8" style="DISPLAY: none">
                              <TABLE cellSpacing=0 cellPadding=0 width="95%" 
                              border=0>
                                <TBODY>
                                  <TR> 
                                    <TD height=10></TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_purpose.gif"> 
                                    </TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10" valign="top"></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"> 
                                      �������� ����� ��ȭ������ �����а� Ư��ȭ�� ����� �ʿ��η� ���޽ý��� 
                                      ���� ����</TD>
                                  </TR>
                                  <TR> 
                                    <TD height=20>&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_con.gif"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"> <img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong>�������</strong> 
                                      : ��ȭ���������� ���Ա������ (������ �̻�) 10���� ����</TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong>�����Ը�</strong> 
                                      : �б��� 3.4�� ����</TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong>��������</strong> 
                                      : ������ ���� ����, ������Ʈ �ǽ� ����, Ŀ��ŧ�� ����, ���п��� ��</TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong>���ȿ��</strong> 
                                      : ��ȭ������ ����� ����, �������� ����, ����л� ��ġ ��</TD>
                                  </TR>
                                  <TR> 
                                    <TD height=20>&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_day.gif" align="absmiddle"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      3 : �������(����)</TD>
                                  </TR>
                                  <TR>
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      4 : ��û�� ���� �� ���� �ɻ�</TD>
                                  </TR>
                                  <TR>
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      5 ~ 12 : �������</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="20">&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_tel.gif" width="220" height="14"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8">�η¾缺�� 
                                      �켺�� ����(02-2016-4122 / <a href="mailto:wsb21@kocca.or.kr">wsb21@kocca.or.kr</a>)</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="20">&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD></TD>
                                  </TR>
                                </TBODY>
                              </TABLE>
                              </span></td>
                          </tr>
                          <tr> 
                            <td valign="top" ><span style="CURSOR: hand" 
                              onClick=comment(menu9);><img src="/images/user/kocca/aboutus/list_09.gif" width="680" height="37"></span></td>
                          </tr>
                          <tr>
                            <td valign="top"style="PADDING-LEFT: 35px" ><span id="menu9" style="DISPLAY: none">
                              <TABLE cellSpacing=0 cellPadding=0 width="95%" 
                              border=0>
                                <TBODY>
                                  <TR> 
                                    <TD height=10></TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_purpose.gif"> 
                                    </TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10" valign="top"></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"> 
                                      ��ȭ��������� �������� ��������ɷ� �������</TD>
                                  </TR>
                                  <TR> 
                                    <TD height=20>&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_con.gif"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"> <img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><font color="#336699">�����</font></TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con">- ��������(����) 
                                      : �ſ� 20�� ���� ���� <br>
                                      - ��������(����) : �б� 6������ ���� <br>
                                      - �� ũ ��(����) : �б� 6������ ���� <br>
                                      - ��������(����) : 1�б�(5����) 2�б�(14����) </TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><font color="#336699">������ 
                                      ���� (�� 11������)</font></TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"> - ���� 6������, 
                                      ��ũ�� 1������, ���� 4������ <br>
                                      - �� ����(2003��)���� ������Ʈ ���� (20������) </TD>
                                  </TR>
                                  <TR> 
                                    <TD height=20>&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_day.gif" align="absmiddle"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      1 ~ 12 : ��ī���� �</TD>
                                  </TR>
                                  <TR>
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      2 ~ 3 : 2006�� ���߰�ȹ ����</TD>
                                  </TR>
                                  <TR>
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>2006. 
                                      4 ~12 : ���̹���ī���� � �� ������ ����</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="20">&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_tel.gif" width="220" height="14"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8">�η¾缺�� 
                                      ���� ����(02-2016-4121 / <a href="mailto:dionia@kocca.or.kr">dionia@kocca.or.kr)</a></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="20">&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD></TD>
                                  </TR>
                                </TBODY>
                              </TABLE>
                              </span></td>
                          </tr>
                          <tr>
                            <td valign="top" ><span style="CURSOR: hand" 
                              onClick=comment(menu10);><img src="/images/user/kocca/aboutus/list_10.gif" width="680" height="37"></span></td>
                          </tr>
                          <tr>
                            <td valign="top" style="PADDING-LEFT: 35px"><span id="menu10" style="DISPLAY: none">
                              <TABLE cellSpacing=0 cellPadding=0 width="95%" 
                              border=0>
                                <TBODY>
                                  <TR> 
                                    <TD height=10></TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_purpose.gif"> 
                                    </TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10" valign="top"></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"> 
                                      ��ȭ������ �����ڿ� ����� �������ִ� ������� �ý��� �</TD>
                                  </TR>
                                  <TR> 
                                    <TD height=20>&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_con.gif"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"> <img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8">��/���� 
                                      ä������ ��縦 ���� �������� Work-Net ����</TD>
                                  </TR>
                                  <TR> 
                                    <TD valign="top" class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8">��ȭ������ 
                                      ���� �� �η°��� �����������</TD>
                                  </TR>
                                  <TR> 
                                    <TD height=20>&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_day.gif" align="absmiddle">(�������� 
                                      ���� ����)</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>ä������ 
                                      ����(������ ���) : ����</TD>
                                  </TR>
                                  <TR>
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>ä��ڶ�ȸ 
                                      (�¶���) : �� 3ȸ</TD>
                                  </TR>
                                  <TR>
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>��ǰ����ȸ 
                                      (��/���� ����) : �� 2ȸ</TD>
                                  </TR>
                                  <TR>
                                    <TD class="font_con"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8"><strong></strong>���� 
                                      �̺�Ʈ (��� �̷¼� �û�, ä����� ������ ��)</TD>
                                  </TR>
                                  <TR> 
                                    <TD height="20">&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD><img src="/images/user/kocca/aboutus/st_busi_tel.gif" width="220" height="14"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"></TD>
                                  </TR>
                                  <TR> 
                                    <TD height="10"><img src="/images/user/kocca/aboutus/bl_nemo.gif" height="8">�η¾缺�� 
                                      �켺�� ����(02-2016-4122 / <a href="mailto:wsb21@kocca.or.kr">wsb21@kocca.or.kr</a>) 
                                    </TD>
                                  </TR>
                                  <TR> 
                                    <TD height="20">&nbsp;</TD>
                                  </TR>
                                  <TR> 
                                    <TD></TD>
                                  </TR>
                                </TBODY>
                              </TABLE>
                              </span></td>
                          </tr>
                          <tr>
                            <td valign="top" >&nbsp;</td>
                          </tr>
                        </table> 
      <!-- footer -->
<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  --------------------> 
      <!-- footer end -->
    </td>
  </tr>
</table>

</body>
</html>
