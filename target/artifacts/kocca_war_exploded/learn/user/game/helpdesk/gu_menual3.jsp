<%
//**********************************************************
//  1. ��      ��: HelpDesk > �¶��� �޴���
//  2. ���α׷��� : gu_menual3.jsp
//  3. ��      ��: �¶��� �޴���
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
	box.put("leftmenu","06"); 

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

function move(tab){
	document.form1.p_process.value= "Help";
	document.form1.p_tab.value = tab;
	document.form1.action = "/servlet/controller.homepage.HomePageHelpServlet";
	document.form1.submit();
}

</SCRIPT>

<style type="text/css">
<!--
.l-padding {
	padding-left: 12px;
}
-->
</style>

<form name = "form1" enctype = "multipart/form-data" method = "post">
		<input type = "hidden" name = "p_process"   value = "">
		<input type = "hidden" name = "p_tab"		value = "">


<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="720" height="35" align="right"  background="/images/user/game/helpdesk/<%=tem_subimgpath%>/tit_menual.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> 
      HOME > Help Desk > �¶��θ޴���</td>
  </tr>
  <tr> 
    <td height="20"></td>
  </tr>
</table>
<!-- �� -->
<table width="719" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="719" align="right"><a href="javascript:move(1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image11','','/images/user/game/helpdesk/tab1_01on.gif',1)"><img src="/images/user/game/helpdesk/tab1_01.gif" name="Image11" border="0"></a><a href="javascript:move(2)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image12','','/images/user/game/helpdesk/tab1_02on.gif',1)"><img src="/images/user/game/helpdesk/tab1_02.gif" name="Image12" border="0"></a><img src="/images/user/game/helpdesk/tab1_03on.gif"><a href="javascript:move(4)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image13','','/images/user/game/helpdesk/tab1_04on.gif',1)"><img src="/images/user/game/helpdesk/tab1_04.gif" name="Image13" border="0"></a></td>
  </tr>
</table>
<table width="720" border="0" cellpadding="0" cellspacing="0" background="/images/user/game/apply/gbox_bg.gif">
  <tr> 
    <td><img src="/images/user/game/apply/gbox_top.gif"></td>
  </tr>
  <tr> 
    <td align="center" valign="top"><table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><img src="/images/user/game/helpdesk/st_menual3.gif"></td>
        </tr>
        <tr> 
          <td height="9"></td>
        </tr>
      </table>
      <table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class="tbl_menualtext2" >1. ���� ���ι� �޴��� ���� ���ǽ��� Ŭ���մϴ�.</td>
        </tr>
        <tr> 
          <td height="2"></td>
        </tr>
        <tr> 
          <td height="5" background="/images/user/game/apply/guide_linebg.gif"></td>
        </tr>
      </table>
      <table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="10"></td>
        </tr>
        <tr> 
          <td class="tbl_gleft"><strong>�н����ΰ���</strong><br>
            ���� �н��ϰ� �ִ� ������û �Ϸ�� �������� �н����ΰ����� ���ɴϴ�. <br>
            �ش������ <strong>��</strong>�н���Ȳ���⸦ Ŭ���ϸ� �� ������ �󼼺��⸦ ���ý� ������ <strong>��</strong>�н��ϱ⸦ 
            ������ �н�â�� �߰� �� ������ �н��Ͻ� �� �ֽ��ϴ�.</td>
        </tr>
        <tr> 
          <td class="tbl_gleft"><strong>�н���������<br>
            </strong> ������û�� �Ͽ����� ���� ������û�� �Ϸ���� ���� �������� ���ɴϴ�.<br>
            ���� �н��� �Ҽ� ������ �� ������ �̸� <strong>��</strong>������ �� �ֽ��ϴ�.</td>
        </tr>
        <tr> 
          <td height="5"></td>
        </tr>
        <tr> 
          <td align="center" valign="top"><img src="/images/user/game/helpdesk/menual_img2.gif" width="622" height="270"></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class="tbl_menualtext2" >2. �н���Ȳ���⸦ Ŭ���Ͻø� �����󼼺��� â�� ��ϴ�.</td>
        </tr>
        <tr> 
          <td height="2"></td>
        </tr>
        <tr> 
          <td height="5" background="/images/user/game/apply/guide_linebg.gif"></td>
        </tr>
      </table>
      <table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="10"></td>
        </tr>
        <tr> 
          <td class="tbl_gleft"><strong>��</strong> �н������� ���� �������� �н�Ȱ�� ������ Ȯ���Ͻ� 
            �� �ֽ��ϴ�.</td>
        </tr>
        <tr>
          <td class="tbl_gleft"><strong>��</strong> �������Ȯ�� -�̼����������� ������������� �����־� 
            �̼��� �ʿ��� ������ Ȯ���� �� �ֽ��ϴ�.</td>
        </tr>
        <tr>
          <td class="tbl_gleft"><strong>��</strong> �н������Ȳ <br>
            ������ �� �߰���, �������� ������Ȳ �� ����Ʈ, ���������� �����ߴ����� ���θ� Ȯ���� �� �ֽ��ϴ�.<br>
            ���� �н������� ���� �н���Ȳ�� Ȯ���� �� �ֽ��ϴ�.</td>
        </tr>
        <tr> 
          <td height="5"></td>
        </tr>
        <tr> 
          <td align="center" valign="top"><img src="/images/user/game/helpdesk/menual_img3.gif" width="581" height="525"></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class="tbl_menualtext2" >3. �н��ϱ⸦ Ŭ���ϸ� �н�â�� ���� �н��Ͻ� �� �ֽ��ϴ�.</td>
        </tr>
        <tr> 
          <td height="2"></td>
        </tr>
        <tr> 
          <td height="5" background="/images/user/game/apply/guide_linebg.gif"></td>
        </tr>
      </table>
      <table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class="tbl_gleft">�н�â ùȭ�鿣 �� ������ �������װ� �������� Ȯ���ϽǼ� ������ �ϴܿ��� ������ ���ø� 
            �ѹ��� ���� �� �ֽ��ϴ�.</td>
        </tr>
        <tr> 
          <td class="tbl_gleft"><strong>��</strong> �н������� ������ �����н��� �ٷ� ���۵˴ϴ�.</td>
        </tr>
        <tr> 
          <td class="tbl_gleft"><strong>��</strong> <strong>�н� ���������޴�<br>
            </strong>* ����/���� - ������ ��������� �н������Ȳ �� ���� ������ �н����θ� Ȯ���� �� �ֽ��ϴ�. <br>
            * �����ϱ� - �н��ϸ鼭 �ñ��� ������ �����Ͻ� �� �ֽ��ϴ�.<br>
            * ����Ʈ�� - ������ ����Ʈ�� Ȯ���ϰ� �����մϴ�.<br>
            * �ڷ�� - �����н��� ���õ� �ڷᳪ ������ �Ǵ� �۵��� �����н��ڵ�� ������ �� �ִ� �����Դϴ�.<br>
            * ���ϱ� - �����н��� ���Ͻ� �� �ֽ��ϴ�.</td>
        </tr>
        <tr>
          <td class="tbl_gleft"><strong>��</strong> ���� ���� ��ϸ� �Ѵ��� ���� �� �ְ� �� ���ú��� 
            Ŭ���ؼ� �� �� �ֽ��ϴ�.</td>
        </tr>
        <tr> 
          <td height="5"></td>
        </tr>
        <tr> 
          <td align="center" valign="top"><img src="/images/user/game/helpdesk/menual_img4.gif" width="598" height="406"></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td valign="bottom"><img src="/images/user/game/apply/gbox_bo.gif"></td>
  </tr>
</table>




<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
