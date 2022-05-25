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
    String  v_tem_grcode   = box.getSession("tem_grcode");
    
    String v_content    = "";
    String v_code       = "";
    String v_title      = "";
    
    DataBox dbox = (DataBox)request.getAttribute("selectView");
    if (dbox != null) {
    	v_content    = dbox.getString("d_content");
        v_code       = dbox.getString("d_code");
        v_title      = dbox.getString("d_title");
     }
    
    
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->

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
	document.form1.p_code.value = tab;
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
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name = "form1" enctype = "multipart/form-data" method = "post">
		<input type = "hidden" name = "p_process"   value = "">
		<input type = "hidden" name = "p_tab"		value = "">
		<input type = "hidden" name = "p_code"      value = "">
		
		<%if( box.getSession("tem_grcode").equals("N000001")) { %>
	<table>   
      <tr>
      	<td>
      	
      	<!--Ÿ��Ʋ�κ�-->
    <table width="672" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" colspan="2" class="h_road">&nbsp;</td>
      </tr>
      <tr>
        <td><img src="/images/portal/homepage_renewal/support/stitle_06.gif" alt="S/W�ٿ�ε�" /></td>
        <td class="h_road">Home &gt; �н����� �ȳ�  &gt; <strong>S/W�ٿ�ε�</strong></td>
      </tr>
      <tr>
        <td height="12" colspan="2"></td>
        </tr>
      <tr>
        <td height="1" colspan="2" bgcolor="E5E5E5"></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><img src="/images/portal/homepage_renewal/support/bar_01.jpg" width="672" height="104" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="2" colspan="3" bgcolor="#7692CB"></td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td width="32%"><div align="center">
            <table border="0" cellpadding="10" cellspacing="1" bgcolor="eeeeee">
              <tr>
                <td bgcolor="#FFFFFF"><img src="/images/portal/homepage_renewal/support/thumb_sw_flash.jpg" width="99" height="99" /></td>
              </tr>
            </table>
        </div></td>
        <td width="68%">
            <table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="4%" height="30"><strong class="org">��</strong></td>
                <td height="30"><div align="left" class="btxt">Adobe Flash CS5.5 (���� �������)</div></td>
              </tr>
              <tr>
                <td height="1" colspan="2" bgcolor="eeeeee"></td>
              </tr>
              <tr>
                <td><strong class="org">��</strong></td>
                <td width="96%" height="25">������ �ٿ�����ż� setup ��Ű�ð� ����Ͻø� ���� ���� ������ ����Ͻ� </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td height="23" valign="top">�� �ֽ��ϴ�.</td>
              </tr>
              <tr>
                <td height="1" colspan="2" bgcolor="eeeeee"></td>
              </tr>
              <tr>
                <td height="30">&nbsp;</td>
                <td height="30" class="h_road"><a href="http://www.adobe.com/cfusion/tdrc/index.cfm?product=flash&loc=ko" target=_blank><img src="/images/portal/homepage_renewal/support/btn_down.jpg" /></a></td>
                </tr>
              <tr>
                <td height="1" colspan="2" bgcolor="eeeeee"></td>
              </tr>
            </table>
        </td>
        <td width="0%"><div align="center"></div></td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="1" colspan="3" bgcolor="#7692CB"></td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td width="32%"><div align="center">
            <table border="0" cellpadding="10" cellspacing="1" bgcolor="eeeeee">
              <tr>
                <td bgcolor="#FFFFFF"><img src="/images/portal/homepage_renewal/support/thumb_sw_fView.gif" width="99" height="99" /></td>
              </tr>
            </table>
        </div></td>
        <td width="68%"><table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <td width="4%" height="30"><strong class="org">��</strong></td>
              <td height="30" class="btxt">Flash View </td>
            </tr>
            <tr>
              <td height="1" colspan="2" bgcolor="eeeeee"></td>
            </tr>
            <tr>
              <td><strong class="org">��</strong></td>
              <td width="96%" height="25">��翡�� �غ��� ��κ� ������ �÷����� �����ϰ� �ִ� ��찡 ��κ��Դϴ�. </td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td height="23" valign="top">��ġ�� �ȵǴ� �������е�Լ��� �̸� ��ġ�Ͻñ� �ٶ��ϴ�.</td>
            </tr>
            <tr>
              <td height="1" colspan="2" bgcolor="eeeeee"></td>
            </tr>
            <tr>
              <td height="30">&nbsp;</td>
              <td height="30" class="h_road"><a href="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" target=_blank><img src="/images/portal/homepage_renewal/support/btn_down.jpg" /></a></td>
            </tr>
            <tr>
              <td height="1" colspan="2" bgcolor="eeeeee"></td>
            </tr>
        </table></td>
        <td width="0%"><div align="center"></div></td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="1" colspan="3" bgcolor="#7692CB"></td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td width="32%"><div align="center">
            <table border="0" cellpadding="10" cellspacing="1" bgcolor="eeeeee">
              <tr>
                <td bgcolor="#FFFFFF"><img src="/images/portal/homepage_renewal/support/thumb_sw_shockwave.gif" width="99" height="99" /></td>
              </tr>
            </table>
        </div></td>
        <td width="68%"><table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <td width="4%" height="30"><strong class="org">��</strong></td>
              <td height="30" class="btxt">Macromedia ShockWave Player </td>
            </tr>
            <tr>
              <td height="1" colspan="2" bgcolor="eeeeee"></td>
            </tr>
            <tr>
              <td><strong class="org">��</strong></td>
              <td width="96%" height="25">ShockWave�� Ȩ�������� ���� �÷����� ������ ���� ��� �÷����� ���� </td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td height="23" valign="top">���ֵ��� ���ִ� ���α׷��Դϴ�</td>
            </tr>
            <tr>
              <td height="1" colspan="2" bgcolor="eeeeee"></td>
            </tr>
            <tr>
              <td height="30">&nbsp;</td>
              <td height="30" class="h_road"><a href="http://www.macromedia.com/shockwave/download/download.cgi?Lang=Korean&amp;P5_Language=Korea" target=_blank><img src="/images/portal/homepage_renewal/support/btn_down.jpg" /></a></td>
            </tr>
            <tr>
              <td height="1" colspan="2" bgcolor="eeeeee"></td>
            </tr>
        </table></td>
        <td width="0%"><div align="center"></div></td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="1" colspan="3" bgcolor="#7692CB"></td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td width="32%"><div align="center">
            <table border="0" cellpadding="10" cellspacing="1" bgcolor="eeeeee">
              <tr>
                <td bgcolor="#FFFFFF"><img src="/images/portal/homepage_renewal/support/thumb_sw_real.gif" width="99" height="99" /></td>
              </tr>
            </table>
        </div></td>
        <td width="68%"><table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <td width="4%" height="30"><strong class="org">��</strong></td>
              <td height="30" class="btxt">Real Player �ѱ���</td>
            </tr>
            <tr>
              <td height="1" colspan="2" bgcolor="eeeeee"></td>
            </tr>
            <tr>
              <td><strong class="org">��</strong></td>
              <td width="96%" height="25">ra, rm ������ �̷���� ���Ǹ� �� �� �ִ� ���α׷��Դϴ�. </td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td height="23">��ġ�Ͻø� �ΰ����� ��ɵ� Ȱ���� �� �ֽ��ϴ�.  </td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td height="23" valign="top">�ֽŹ��� �� �÷��� ����www.real.com ���� ���ø� �̿��Ͻ� �� �ֽ��ϴ�</td>
            </tr>
            <tr>
              <td height="1" colspan="2" bgcolor="eeeeee"></td>
            </tr>
            <tr>
              <td height="30">&nbsp;</td>
              <td height="30" class="h_road"><a href="http://www.real.com" target=_blank><img src="/images/portal/homepage_renewal/support/btn_down.jpg" /></a></td>
            </tr>
            <tr>
              <td height="1" colspan="2" bgcolor="eeeeee"></td>
            </tr>
        </table></td>
        <td width="0%"><div align="center"></div></td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="1" colspan="3" bgcolor="#7692CB"></td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td width="32%"><div align="center">
            <table border="0" cellpadding="10" cellspacing="1" bgcolor="eeeeee">
              <tr>
                <td bgcolor="#FFFFFF"><img src="/images/portal/homepage_renewal/support/thumb_sw_java.gif" width="99" height="99" /></td>
              </tr>
            </table>
        </div></td>
        <td width="68%"><table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <td width="4%" height="30"><strong class="org">��</strong></td>
              <td height="30" class="btxt">�ڹ� ����ӽ�(VM) </td>
            </tr>
            <tr>
              <td height="1" colspan="2" bgcolor="eeeeee"></td>
            </tr>
            <tr>
              <td><strong class="org">��</strong></td>
              <td width="96%" height="25">XP �ʱ���� ����ڴ� �ڹ� ����ӽ��� XP�� ��ġ�Ǿ� ���� �ʽ��ϴ�. </td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td height="23" valign="top">�н� �Ǵ� ����Ʈ ��� �Ͻñ� ���ؼ��� �� ����Ʈ��� �ʿ��մϴ�.</td>
            </tr>
            <tr>
              <td height="1" colspan="2" bgcolor="eeeeee"></td>
            </tr>
            <tr>
              <td height="30">&nbsp;</td>
              <td height="30" class="h_road"><a href="http://java.com/ko/download/windows_automatic.jsp" target=_blank><img src="/images/portal/homepage_renewal/support/btn_down.jpg" /></a></td>
            </tr>
            <tr>
              <td height="1" colspan="2" bgcolor="eeeeee"></td>
            </tr>
        </table></td>
        <td width="0%"><div align="center"></div></td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="1" bgcolor="CACACA"></td>
      </tr>
      <tr>
        <td height="4" bgcolor="F7F7F7"></td>
      </tr>
    </table>
    <!--Ÿ��Ʋ�κ�//-->
    </td>
    <td width="20">&nbsp;</td>
    
  </tr>
</table>
      	<%}else{ %>


            <h2><img src="/images/portal/studying/h2_tit4.gif" alt="S/W�ٿ�ε�" class="fl_l" /><p class="category">Home > �н��������� > <strong>S/W�ٿ�ε�</strong></p></h2>

            <p><img src="/images/portal/studying/sw_borimg.gif" alt="����������� ����Ʈ �̿�� �ʿ��� Software�Դϴ�. �ʿ�� �ٿ�޾Ƽ� ��ġ�Ͽ� �̿��Ͻñ� �ٶ��ϴ�." /></p>
            
<!-- ������ ���� ���� -->
<%=v_content %>
<!-- ������ ���� ���� -->

		<%} %>
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->