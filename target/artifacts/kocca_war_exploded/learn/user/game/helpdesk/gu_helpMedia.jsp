<%
//**********************************************************
//  1. ��      ��: HelpDesk > �н�ȯ�浵���
//  2. ���α׷��� : gu_helpMedia.jsp
//  3. ��      ��: �н�ȯ�浵��� (������)
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
    <td><img src="/images/user/game/helpdesk/text_img_media.gif" ></td>
  </tr>
  <tr> 
    <td height="15">&nbsp;</td>
  </tr>
</table>

<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="1">&nbsp;</td>
    <td width="156"><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image17','','/images/user/game/helpdesk/tab_01on.gif',1)"><img src="/images/user/game/helpdesk/tab_01.gif" name="Image17" width="156" height="31" border="0"></a></td>
    <td width="156"><img src="/images/user/game/helpdesk/tab_02on.gif" width="156" height="31"></td>
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
    <td valign="top" class="font_ex">������ ���¸� ������ �� ���� ������ ����ٸ�, ������ �ӵ��� ������ ������.<br>
      ���ͳ� ȸ���ӵ� ������ ������ �ӵ� ������ ������� �ٸ� �� ������, ������ �ӵ� ������� �ӵ��� ����ġ�� ���� ��� <br>
      ���ͳ� ȸ���ӵ� ������ ���� ȸ�� �ӵ��� �Բ� üũ�� �ֽñ� �ٶ��ϴ�.</td>
  </tr>
  <tr> 
    <td height="10"></td>
  </tr>
  <tr> 
    <td valign="top"><img src="/images/user/game/helpdesk/st_media1.gif"></td>
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
          <td width="550" align="center" bgcolor="#E7F7FE"><strong>�ý��� ����</strong></td>
        </tr>
        <tr> 
          <td class="tbl_dbtit2">OS</td>
          <td align="center" >Windows XP </td>
        </tr>
        <tr> 
          <td height="26" class="tbl_dbtit1">IE</td>
          <td height="26" align="center" >Mozilla/4.0 (compatible; MSIE 6.0; Windows 
            NT 5.1; SV1) </td>
        </tr>
        <tr> 
          <td height="26" class="tbl_dbtit1">CPU</td>
          <td height="26" align="center" >x86 </td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="20">&nbsp;</td>
  </tr>
  <tr> 
    <td><img src="/images/user/game/helpdesk/st_media2.gif" width="352" height="15"></td>
  </tr>
  <tr> 
    <td height="10"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="/images/user/game/helpdesk/help_300.gif"></td>
    <td valign="top"><img src="/images/user/game/helpdesk/help_500.gif"></td>
  </tr>
  <tr> 
    <td height="5" colspan="2"></td>
  </tr>
  <tr> 
    <td width="365"><script language = "javascript" src = "/script/user_patch.js"></script>
				<script language='javascript'>
					object_embed("/asf/test_mynameis.asf","300","250");
				</script><!--embed src="/asf/test_mynameis.asf" width="300" height="250"></embed--></td>
    <td width="355" valign="top"><script language='javascript'>
					object_embed("mms://speedtest.hvod.nefficient.co.kr/speedtest/test1.wmv","300","250");
				</script><!--embed src="mms://speedtest.hvod.nefficient.co.kr/speedtest/test1.wmv" width=300 height=250></embed--></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td valign="top">&nbsp;</td>
  </tr>
</table> 


<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
