<%
//**********************************************************
//  1. ��      ��: HelpDesk > �н�ȯ�浵���
//  2. ���α׷��� : gu_help.jsp
//  3. ��      ��: �н�ȯ�浵��� (���ͳ�)
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.26
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
	box.put("leftmenu","05"); 

    String  v_process     = box.getString("p_process");
                  
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topHelpdesk.jsp"%>
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

<style type="text/css">
<!--
.l-padding {
	padding-left: 12px;
}
-->
</style>


<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="720" height="35" align="right"  background="/images/user/game/helpdesk/<%=tem_subimgpath%>/tit_help.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> 
      HOME > Help Desk > �н�ȯ�浵���</td>
  </tr>
  <tr> 
    <td height="20"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="/images/user/game/helpdesk/text_img_internet.gif" ></td>
  </tr>
  <tr> 
    <td height="15">&nbsp;</td>
  </tr>
</table>

<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="1">&nbsp;</td>
    <td width="156"><img src="/images/user/game/helpdesk/tab_01on.gif"></td>
    <td width="156"><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelpMove" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','/images/user/game/helpdesk/tab_02on.gif',1)"><img src="/images/user/game/helpdesk/tab_02.gif" name="Image5" width="156" height="31" border="0"></a></td>
    <td width="170">&nbsp;</td>
    <td width="236"></td>
    <td width="1">&nbsp;</td>
  </tr>
  <tr> 
    <td height="5" colspan="6"></td>
  </tr>
  <tr> 
    <Td colspan="6"><img src="/images/user/game/helpdesk/g_back.jpg"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td valign="top" class="font_ex">������ ����� ������ �����ôٸ�, ���� ��� ���� ���ͳ� ȸ���� ����ӵ��� 
      Ȯ���� �ּ���.<br>
      ȸ�� �ӵ� �׽�Ʈ�� �Ϸ翡 20~30�� ������ �ΰ� �ݵ�� �������� ���ּž� ��Ȯ�� �ӵ��� �� �� �ֽ��ϴ�.</td>
  </tr>
  <tr> 
    <td height="10"></td>
  </tr>
  <tr> 
    <td valign="top"><img src="/images/user/game/helpdesk/st_internet1.gif"></td>
  </tr>
  <tr> 
    <td height="10"></td>
  </tr>
  <tr> 
    <td valign="top"><table width="720" border="2" cellspacing="0" 
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
        <tr  class="lcolor"> 
          <td height="3" colspan="2" class="linecolor_helpdesk01"></td>
        </tr>
        <tr> 
          <td width="170" align="center" bgcolor="#D3E7F5"><strong>����</strong></td>
          <td width="550" align="center" bgcolor="#E7F7FE"><strong>�ּ� ���ͳ� ȸ���ӵ�</strong></td>
        </tr>
        <tr> 
          <td class="tbl_dbtit2">�Ϲݵ�����</td>
          <td align="center" >�ּ� 300 Kbps ~ 400 Kbps</td>
        </tr>
        <tr> 
          <td height="26" class="tbl_dbtit1">Game Academy������</td>
          <td height="26" align="center" >�ּ� 500 Kbps ~ 700 Kbps</td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="20">&nbsp;</td>
  </tr>
  <tr> 
    <td><span style="CURSOR: hand" 
                              onClick=comment(menu1);><img src="/images/user/game/helpdesk/st_internet2.gif"></span></td>
  </tr>
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="5" background="/images/user/game/helpdesk/stu_box_vline2.gif"></td>
  </tr>
  <tr> 
    <td height="10"></td>
  </tr>
  <tr> 
    <td valign="top" style="PADDING-LEFT: 35px"><SPAN id=menu1 
                              style="DISPLAY: none"> 
      <TABLE cellSpacing=0 cellPadding=0 width="95%" 
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
            <TD valign="top"><img src="/images/user/game/helpdesk/help_test_01.jpg"></TD>
          </TR>
          <TR> 
            <TD>&nbsp;</TD>
          </TR>
          <TR> 
            <TD height=25>�б�, ȸ��, PC�� ����� ���뼱 ǰ������ �� <FONT 
                                color=#ff5400>ǰ���׽�Ʈ</FONT>�� �����մϴ�. </TD>
          </TR>
          <TR> 
            <TD><img src="/images/user/game/helpdesk/help_test_02.jpg"></TD>
          </TR>
          <TR> 
            <TD>&nbsp;</TD>
          </TR>
          <TR> 
            <TD height=38>3. [ǰ���׽�Ʈ]�� �����Ͻø� ������ ���α׷��� ��ġ�ϰ� �Ǵµ�, �� �̶� <font color="#ff5400">��ġ</font>�� 
              �����Ͽ� �ּ���. <br>
              ����ġ ���ԡ��� �����Ͻø� �ӵ������� �Ͻ� �� �����ϴ�. </TD>
          </TR>
          <TR> 
            <TD align="center" valign="top"><img src="/images/user/game/helpdesk/help_test_03.jpg" width="410" height="155"></TD>
          </TR>
          <TR> 
            <TD>&nbsp;</TD>
          </TR>
          <TR> 
            <TD height=38>4. ���� ���ӻ����� ����, ���� ��ġ�Է� ���� ���� ����, ��ġ���� �ɼ��� �����Ͻð�, <BR>
              ������ �̸��� ���ڿ����� ��� �����Ͻ� �� <FONT color=#ff5400>Test Start</FONT> ��ư�� 
              Ŭ���մϴ�. </TD>
          </TR>
          <TR> 
            <TD align="center"><img src="/images/user/game/helpdesk/help_speed_05.gif"></TD>
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
            <TD align="center" valign="top"><img src="/images/user/game/helpdesk/help_speed_06.gif"></TD>
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
    <td><span style="CURSOR: hand" onclick=comment(menu2);><img src="/images/user/game/helpdesk/st_internet3.gif"></span></td>
  </tr>
  <tr>
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="5" background="/images/user/game/helpdesk/stu_box_vline2.gif"></td>
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
            <TD align="center"><img src="/images/user/game/helpdesk/help_speed_7.gif"></TD>
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
            <TD align="center"><img src="/images/user/game/helpdesk/help_speed_8.gif"></TD>
          </TR>
          <TR> 
            <TD>&nbsp;</TD>
          </TR>
          <TR> 
            <TD height=60>- �պ������� : 10ms ���� ����, 20ms ~ 30ms �̻� �ξ� ũ�� �ʰ��� ��찡 ���������� 
              �߻��Ѵٸ� ���ͳ� ȸ����ü�� ������ �ֽñ� �ٶ��ϴ� <BR>
              - �ս��� : 0.00% ����, �ս����� ���������� �߻��� ��� ���ͳ� ȸ����ü�� ������ �ֽñ� �ٶ��ϴ�. </TD>
          </TR>
          <TR> 
            <TD>&nbsp;</TD>
          </TR>
          <TR> 
            <TD height=60>3. Bandwidth Gaugea���� ���ͳ� <FONT 
                                color=#ff5400>ȸ����ü ��հ� ����� ������</FONT>�� Download 
              �ӵ��� ���մϴ�.<BR>
              ����� �������� ���ͳ� ȸ����ü ��հ��� 70~80% �̸��� ��쿡�� ���ͳ� ȸ����ü�� ���� �ٶ��ϴ�.</TD>
          </TR>
          <TR> 
            <TD align="center"><img src="/images/user/game/helpdesk/help_speed_9.gif"></TD>
          </TR>
          <TR> 
            <TD>&nbsp;</TD>
          </TR>
          <TR> 
            <TD height=20>4. ����� �ý��� ������ Ȯ���մϴ�. </TD>
          </TR>
          <TR> 
            <TD align="center"><img src="/images/user/game/helpdesk/help_speed_10.gif"></TD>
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
</table> 


<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
