<%
//**********************************************************
//  1. ��      ��: Ȩ������ �н�ȯ�� �����
//  2. ���α׷���: zu_HomePageHelp_L.jsp
//  3. ��      ��: Ȩ������ �н�ȯ�� �����ȭ��
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

	box.put("leftmenu","06");                       // �޴� ���̵� ����
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topSupport.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->



<script language="JavaScript" type="text/JavaScript">
<!--
//Ŭ���� ����� ����
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

//������ ����Ʈ �������� �̵��Ѵ�.
function moveList() {
    document.form1.action = "/servlet/controller.homepage.HomePageHelpServlet";
    document.form1.p_process.value = "selectListMove";
    document.form1.submit();
}


//-->
</script>

		  <!-- center start -->
  		   <form name="form1">
		   <input type="hidden" name="p_process">
		    <table width="730" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="20" align="center" valign="top" class="location">HOME 
                  &gt; �н��������� &gt; �н�ȯ�� �����</td>
              </tr>
              <tr> 
                <td align="center" valign="top"> 
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="/images/user/support/<%=tem_subimgpath%>/tit_help.jpg"></td>
                    </tr>
                    <tr>
                      <td height="20"></td>
                    </tr>
                  </table>
                  <!-- ������ -->
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5" colspan="4"></td>
                    </tr>
                    <tr> 
                      <td width="98" valign="top"><img src="/images/user/support/help_tab_internet_on.gif"> 
                      </td>
                      <td width="98" valign="top" ><a href="javascript:moveList()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image28','','/images/user/support/help_tab_movie_on.gif',1)"><img src="/images/user/support/help_tab_movie.gif" name="Image28"  border="0"></a></td>
                      <td width="98" valign="top" >&nbsp;</td>
                      <td width="381" ></td>
                    </tr>
                    <tr> 
                      <td height="10" colspan="4"></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><img src="/images/user/support/help_img.jpg"></td>
                    </tr>
                    <tr> 
                      <td height="10"></td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/support/st_help_inter1.gif"></td>
                    </tr>
                    <tr> 
                      <td height="10"></td>
                    </tr>
                    <tr> 
                      <td valign="top"><table width="675" border="2" cellspacing="0" 
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
                          <tr  class="lcolor"> 
                            <td height="3" colspan="2" class="line_color_com"></td>
                          </tr>
                          <tr> 
                            <td width="167" class="tbl_dbtit1"><strong>����</strong></td>
                            <td width="488" align="center"><strong>�ּ� ���ͳ� ȸ���ӵ�</strong></td>
                          </tr>
                          <tr> 
                            <td class="tbl_dbtit2">�Ϲݵ�����</td>
                            <td align="center" >�ּ� 300 Kbps ~ 400 Kbps</td>
                          </tr>
                          <tr> 
                            <td height="26" class="tbl_dbtit1">AutoEverSystems 
                              ������</td>
                            <td height="26" align="center" >�ּ� 500 Kbps ~ 700 
                              Kbps</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="20">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td><span style="CURSOR: hand" 
                              onClick=comment(menu1);><img src="/images/user/support/st_help_inter2.gif"></span></td>
                    </tr>
                    <tr> 
                      <td height="5" background="/images/user/support/stu_box_vline2.gif"></td>
                    </tr>
                    <tr> 
                      <td height="10"></td>
                    </tr>
                    <tr> 
                      <td valign="top" style="PADDING-LEFT: 12px"><SPAN id=menu1 
                              style="DISPLAY: none"> 
                        <TABLE cellSpacing=0 cellPadding=0 width="80%" 
                              border=0>
                          <TBODY>
                            <TR> 
                              <TD height=38>1. �ѱ������ ����Ʈ�� �����մϴ�. <A 
                                href="http://speed.nca.or.kr/" 
                                target=_blank>http://speed.nca.or.kr/</A><BR>
                                2. �������� ADSL ���񽺸� �ް� ��ôٸ� �ʰ�� ���ͳ� ǰ������ �� <FONT color=#ff5400>ǰ���׽�Ʈ</FONT>�� 
                                �����մϴ�. </TD>
                            </TR>
                            <TR> 
                              <TD valign="top"><img src="/images/user/support/help_test_01.jpg"></TD>
                            </TR>
                            <TR> 
                              <TD>&nbsp;</TD>
                            </TR>
                            <TR> 
                              <TD height=25>�б�, ȸ��, PC�� ����� ���뼱 ǰ������ �� <FONT 
                                color=#ff5400>ǰ���׽�Ʈ</FONT>�� �����մϴ�. </TD>
                            </TR>
                            <TR> 
                              <TD><img src="/images/user/support/help_test_02.jpg"></TD>
                            </TR>
                            <TR> 
                              <TD>&nbsp;</TD>
                            </TR>
                            <TR> 
                              <TD height=38>3. [ǰ���׽�Ʈ]�� �����Ͻø� ������ ���α׷��� ��ġ�ϰ� �Ǵµ�, 
                                �� �̶� <font color="#ff5400">��ġ</font>�� �����Ͽ� �ּ���. 
                                <br>
                                ����ġ ���ԡ��� �����Ͻø� �ӵ������� �Ͻ� �� �����ϴ�. </TD>
                            </TR>
                            <TR> 
                              <TD align="center" valign="top"><img src="/images/user/support/help_test_03.jpg" width="410" height="155"></TD>
                            </TR>
                            <TR> 
                              <TD>&nbsp;</TD>
                            </TR>
                            <TR> 
                              <TD height=38>4. ���� ���ӻ����� ����, ���� ��ġ�Է� ���� ���� ����, 
                                ��ġ���� �ɼ��� �����Ͻð�, <BR>
                                ������ �̸��� ���ڿ����� ��� �����Ͻ� �� <FONT color=#ff5400>Test 
                                Start</FONT> ��ư�� Ŭ���մϴ�. </TD>
                            </TR>
                            <TR> 
                              <TD align="center"><img src="/images/user/support/help_speed_05.gif"></TD>
                            </TR>
                            <TR> 
                              <TD>&nbsp;</TD>
                            </TR>
                            <TR> 
                              <TD height=38>5. ȭ�� ������ܿ��� <FONT 
                                color=#ff5400>�׽�Ʈ ��</FONT>�� Ȯ���ϼ̴ٸ�, ���ͳ� ǰ�������� 
                                ���������� �̷���� ���Դϴ�. </TD>
                            </TR>
                            <TR> 
                              <TD align="center" valign="top"><img src="/images/user/support/help_speed_06.gif"></TD>
                            </TR>
                            <TR> 
                              <TD 
                          height=30></TD>
                            </TR>
                          </TBODY>
                        </TABLE>
                        </SPAN></td>
                    </tr>
                    <tr> 
                      <td>&nbsp;</td>
                    </tr>
                    <tr> 
                      <td><span style="CURSOR: hand" onclick=comment(menu2);><img src="/images/user/support/st_help_inter3.gif"></span></td>
                    </tr>
                    <tr>
                      <td height="5" background="/images/user/support/stu_box_vline2.gif"></td>
                    </tr>
                    <tr> 
                      <td height="10"></td>
                    </tr>
                    <tr> 
                      <td style="PADDING-LEFT: 12px"><span id=menu2 
                              style="DISPLAY: none"> 
                        <TABLE cellSpacing=0 cellPadding=0 width="95%" 
                              border=0>
                          <TBODY>
                            <TR> 
                              <TD height=20>1. Download test �� <FONT 
                                color=#ff5400>���ͳ� �ٿ�ε� �ӵ�</FONT>�� Ȯ���մϴ�. </TD>
                            </TR>
                            <TR> 
                              <TD align="center"><img src="/images/user/support/help_speed_7.gif"></TD>
                            </TR>
                            <TR> 
                              <TD>&nbsp;</TD>
                            </TR>
                            <TR> 
                              <TD height=20>2. General Ping Test �� ���ͳ� <FONT 
                                color=#ff5400>�պ�������</FONT>�� <FONT 
                                color=#ff5400>�ս���</FONT>�� Ȯ���մϴ�. </TD>
                            </TR>
                            <TR> 
                              <TD align="center"><img src="/images/user/support/help_speed_8.gif"></TD>
                            </TR>
                            <TR> 
                              <TD>&nbsp;</TD>
                            </TR>
                            <TR> 
                              <TD height=60>- �պ������� : 10ms ���� ����, 20ms ~ 30ms 
                                �̻� �ξ� ũ�� �ʰ��� ��찡 ���������� �߻��Ѵٸ� ���ͳ� ȸ����ü�� ������ �ֽñ� 
                                �ٶ��ϴ� <BR>
                                - �ս��� : 0.00% ����, �ս����� ���������� �߻��� ��� ���ͳ� ȸ����ü�� 
                                ������ �ֽñ� �ٶ��ϴ�. </TD>
                            </TR>
                            <TR> 
                              <TD>&nbsp;</TD>
                            </TR>
                            <TR> 
                              <TD height=60>3. Bandwidth Gaugea���� ���ͳ� <FONT 
                                color=#ff5400>ȸ����ü ��հ� ����� ������</FONT>�� Download 
                                �ӵ��� ���մϴ�.<BR>
                                ����� �������� ���ͳ� ȸ����ü ��հ��� 70~80% �̸��� ��쿡�� ���ͳ� ȸ����ü�� 
                                ���� �ٶ��ϴ�.</TD>
                            </TR>
                            <TR> 
                              <TD align="center"><img src="/images/user/support/help_speed_9.gif"></TD>
                            </TR>
                            <TR> 
                              <TD>&nbsp;</TD>
                            </TR>
                            <TR> 
                              <TD height=20>4. ����� �ý��� ������ Ȯ���մϴ�. </TD>
                            </TR>
                            <TR> 
                              <TD align="center"><img src="/images/user/support/help_speed_10.gif"></TD>
                            </TR>
                            <TR> 
                              <TD 
                          height=30></TD>
                            </TR>
                          </TBODY>
                        </TABLE>
                        </span></td>
                    </tr>
                    <tr> 
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
			  </form>
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