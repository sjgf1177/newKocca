<%
//**********************************************************
//  1. ��      ��: HelpDesk > �н�ȯ�浵���
//  2. ���α׷��� : ku_menual.jsp
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
	box.put("leftmenu","03"); 

    String  v_process     = box.getString("p_process");
                  
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/kocca/include/topHelpdesk.jsp"%>
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
	document.form1.action = "/servlet/controller.homepage.KHomePageHelpServlet";
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

                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td  class="location" > HOME > ����Ÿ &gt; �¶����н��̿�ȳ�</td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/kocca/customer/<%=tem_subimgpath%>/tit_menual.gif"></td>
                          </tr>
                          <tr> 
                            <td height="20"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/kocca/customer/text_img_menual.gif"></td>
                          </tr>
                          <tr> 
                            <td height="15"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td align="right"><img src="/images/user/kocca/customer/tab_01on.gif"><a href="javascript:move(2)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image32','','/images/user/kocca/customer/tab_02on.gif',1)"><img src="/images/user/kocca/customer/tab_02.gif" name="Image32" border="0"></a><a href="javascript:move(3)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image33','','/images/user/kocca/customer/tab_03on.gif',1)"><img src="/images/user/kocca/customer/tab_03.gif" name="Image33" border="0"></a><a href="javascript:move(4)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image34','','/images/user/kocca/customer/tab_04on.gif',1)"><img src="/images/user/kocca/customer/tab_04.gif" name="Image34" border="0"></a></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellpadding="0" cellspacing="0" background="/images/user/kocca/customer/guide_box_bg.gif">
                          <tr> 
                            <td valign="top"><img src="/images/user/kocca/customer/guide_box_top.gif"></td>
                          </tr>
                          <tr> 
                            <td align="center" valign="top"> <table width="650" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td><img src="/images/user/kocca/customer/st_g_app1.gif"></td>
                                </tr>
                                <tr> 
                                  <td height="8"></td>
                                </tr>
                              </table>
                              <table width="650" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td class="tbl_menualtext2" >1. ������û�޴�����</td>
                                </tr>
                                <tr> 
                                  <td height="2"></td>
                                </tr>
                                <tr> 
                                  <td height="5" background="/images/user/kocca/apply/guide_linebg.gif"></td>
                                </tr>
                              </table>
                              <table width="650" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td height="5"></td>
                                </tr>
                                <tr> 
                                  <td align="center"><img src="/images/user/kocca/apply/guide_1img1.gif"></td>
                                </tr>
                                <tr> 
                                  <td>&nbsp;</td>
                                </tr>
                              </table>
                              <table width="650" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td class="tbl_menualtext2">2. ���ϴ� ������ ��û��ư Ŭ��</td>
                                </tr>
                                <tr> 
                                  <td height="2"></td>
                                </tr>
                                <tr> 
                                  <td height="5" background="/images/user/kocca/apply/guide_linebg.gif"></td>
                                </tr>
                              </table>
                              <table width="650" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td height="10"></td>
                                </tr>
                                <tr> 
                                  <td class="tbl_gleft">�� ������û �ϰ��� �ϴ� ���������� �����ϰ� 
                                    ���ϴ� ���¸� Ȯ���� �� ���û ��ư�� Ŭ���մϴ�.</td>
                                </tr>
                                <tr> 
                                  <td height="5"></td>
                                </tr>
                                <tr> 
                                  <td align="center"><img src="/images/user/kocca/apply/guide_1img2.gif"></td>
                                </tr>
                                <tr> 
                                  <td>&nbsp;</td>
                                </tr>
                              </table>
                              <table width="650" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td class="tbl_menualtext2">3. ������ ȭ���� Ȯ���ϰ� 
                                    ����Ŭ��</td>
                                </tr>
                                <tr> 
                                  <td height="2"></td>
                                </tr>
                                <tr> 
                                  <td height="5" background="/images/user/kocca/apply/guide_linebg.gif"></td>
                                </tr>
                              </table>
                              <table width="650" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td height="10"></td>
                                </tr>
                                <tr> 
                                  <td class="tbl_gleft"><strong>�������</strong>�� 
                                    ���� ��û�� ������ �ٷ� ������û Ȯ�� ������ ��Ÿ���� Ȯ���ϸ� ��û�� ��� 
                                    �̷�� ���ϴ�.</td>
                                </tr>
                                <tr> 
                                  <td class="tbl_gleft"><strong>�������</strong>�� 
                                    ��û�ϴ� ������ �� ������ ������ �ϴܿ��� ����ȭ���� ��ϴ�.<br>
                                    �� ���ϸ����� �����ϰ� ������ �ش��ѵ� ������ ���ϸ����� �����Ḧ �Ϻ� ���� 
                                    �Ͻ� �� �ֽ��ϴ�.<br>
                                    �� ���ϴ� ���� ���¸� Ŭ���մϴ�.</td>
                                </tr>
                                <tr> 
                                  <td height="5"></td>
                                </tr>
                                <tr> 
                                  <td align="center"><img src="/images/user/kocca/apply/guide_1img3.gif"></td>
                                </tr>
                                <tr> 
                                  <td>&nbsp;</td>
                                </tr>
                              </table>
                              <table width="650" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td class="tbl_menualtext2">4. ���ݰ��� Ŭ���� ����ó�� 
                                    �˾�â�� ��ϴ�.</td>
                                </tr>
                                <tr> 
                                  <td height="2"></td>
                                </tr>
                                <tr> 
                                  <td height="5" background="/images/user/kocca/apply/guide_linebg.gif"></td>
                                </tr>
                              </table>
                              <table width="650" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td height="10"></td>
                                </tr>
                                <tr> 
                                  <td class="tbl_gleft">�� �Ա��ڶ��� �Ա��� ������ ���� �Ա��� 
                                    �������� ��Ȯ�ϰ� ���ϴ�.</td>
                                </tr>
                                <tr> 
                                  <td class="tbl_gleft">Ȯ���� ������ ��û�� �Ϸ�Ǿ��ٴ� �޼����� 
                                    �߸鼭 ������û�� �Ϸ�˴ϴ�.</td>
                                </tr>
                                <tr> 
                                  <td height="5"></td>
                                </tr>
                                <tr> 
                                  <td align="center" valign="top"><img src="/images/user/kocca/apply/guide_1img4.gif" width="546" height="275"></td>
                                </tr>
                                <tr> 
                                  <td>&nbsp;</td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td valign="bottom"><img src="/images/user/kocca/customer/guide_box_bo.gif"></td>
                          </tr>
                        </table>
	</form>




<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
