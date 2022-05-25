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
    
    String tap			= "";
    
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

function changeTap(process){
    var objDl   = document.getElementsByName("objDl");
    var objDd   = document.getElementsByName("objDd");


    if(idx == '1'){
    	objDd[0].style.display  = "block";
    	objDd[1].style.display  = "none";
    }else if(idx == '2' ){
    	objDd[0].style.display  = "none";
    	objDd[1].style.display  = "block";
    }    
}  


</SCRIPT>
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
      	<% if(v_code.equals("HELP_INTERNET")){ %>
    <table width="672" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" colspan="2" class="h_road">&nbsp;</td>
      </tr>
      <tr>
        <td><img src="/images/portal/homepage_renewal/support/stitle_07.gif" alt="�н�ȯ�� �����" /></td>
        <td class="h_road">Home &gt; �н����� �ȳ�  &gt; <strong>�н�ȯ�� �����</strong></td>
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
        <td><img src="/images/portal/homepage_renewal/support/bar_02.jpg" width="672" height="104" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
    <table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image45','','/images/portal/homepage_renewal/support/tab_on_001.gif',1)"><img src="/images/portal/homepage_renewal/support/tab_on_001.gif" name="Image45" width="168" height="39" border="0" id="Image45" /></a></td>
        <td><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelpMove" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image46','','/images/portal/homepage_renewal/support/tab_on_002.gif',1)"><img src="/images/portal/homepage_renewal/support/tab_off_002.gif" name="Image46" width="168" height="39" border="0" id="Image46" /></a></td>
        </tr>
    </table>    
    <table width="100%" border="0" cellpadding="15" cellspacing="2" bgcolor="#7692CB">
      <tr>
        <td bgcolor="f7f7f7">������ ����� ������ �����ôٸ�, ���� ��� ���� ���ͳ� ȸ���� ����ӵ��� Ȯ���� �ּ���.
          <br />
          ȸ�� �ӵ� �׽�Ʈ�� �Ϸ翡 20~30�� ������ �ΰ� �ݵ�� �������� ���ּž� ��Ȯ�� �ӵ��� �� �� �ֽ��ϴ�.</td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="10" colspan="2"></td>
        </tr>
      <tr>
        <td width="20" height="40"><img src="/images/portal/homepage_renewal/common/icon_blue.jpg"/></td>
        <td><img src="/images/portal/homepage_renewal/support/sstitle_02.gif"/></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="tit_table">����</td>
        <td class="tit_table_right">�ּ� ���ͳ� ȸ���ӵ�</td>
      </tr>
      <tr>
        <td class="ct_tit_table">�Ϲݵ�����</td>
        <td class="ct_tit_table_right">�ּ� 300 Kbps ~ 400 Kbps</td>
      </tr>
      <tr>
        <td class="ct_tit_table">�ѱ���������ī���� ������</td>
        <td class="ct_tit_table_right">�ּ� 500 Kbps ~ 700 Kbps</td>
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
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="10" colspan="2"></td>
      </tr>
      <tr>
        <td width="20" height="40"><img src="/images/portal/homepage_renewal/common/icon_blue.jpg"/></td>
        <td><img src="/images/portal/homepage_renewal/support/sstitle_03.gif"/></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="2" colspan="2" bgcolor="#7692CB"></td>
        </tr>
      <tr>
        <td height="10" colspan="2"></td>
        </tr>
      <tr>
        <td width="20">&nbsp;</td>
        <td height="20">1. �ѱ�����ȭ����� ����Ʈ�� �����մϴ�.<a href="http://speed.nia.or.kr/" target="_blank" ><span class="btxt"> http://speed.nia.or.kr/</span></a></td>
        </tr>
      <tr>
        <td>&nbsp;</td>
        <td height="20">2. ��� �޴����� ǰ�������׽�Ʈ �� <span class="style1">���ͳ� �ӵ�</span> �Ǵ� ���ο� <span class="style1">���ͳ� �ӵ�</span>�� �����մϴ�. </td>
        </tr>
      <tr>
        <td height="10" colspan="2"></td>
        </tr>
    </table>
    <table width="90%" border="0" align="center" cellpadding="20" cellspacing="1" bgcolor="eeeeee">
      <tr>
        <td bgcolor="#FFFFFF"><div align="center"><img src="/images/portal/homepage_renewal/support/img_help1.gif" width="478" height="270" /></div></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="10" colspan="2"></td>
      </tr>
      <tr>
        <td width="20">&nbsp;</td>
        <td height="20">3. [ǰ���׽�Ʈ]�� �����Ͻø� ������ ���α׷��� ��ġ�ϰ� �Ǵµ�, �� �̶� ��ġ�� �����Ͽ� �ּ���.    </td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td height="20">������ġ ���ԡ��� �����Ͻø� �ӵ������� �Ͻ� �� �����ϴ�. </td>
      </tr>
      <tr>
        <td height="10" colspan="2"></td>
      </tr>
    </table>
    <table width="90%" border="0" align="center" cellpadding="20" cellspacing="1" bgcolor="eeeeee">
      <tr>
        <td bgcolor="#FFFFFF"><div align="center"><img src="/images/portal/homepage_renewal/support/img_help2.gif" width="408" height="152" /></div></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="10" colspan="2"></td>
      </tr>
      <tr>
        <td width="20">&nbsp;</td>
        <td height="20">4. ���ͳ� �ӵ� ǰ������ �׽�Ʈ�� �ϱ� ���� ȸ������ �ý��� ������ �̿��ϱ� ���ؼ��� ����� ���Ǹ�
    �ϼž� �մϴ�. </td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td height="20">������ ��ư�� ������ �ּ���</td>
      </tr>
      <tr>
        <td height="10" colspan="2"></td>
      </tr>
    </table>
    <table width="90%" border="0" align="center" cellpadding="20" cellspacing="1" bgcolor="eeeeee">
      <tr>
        <td bgcolor="#FFFFFF"><div align="center"><img src="/images/portal/homepage_renewal/support/img_help3.gif" width="488" height="273" /></div></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="10" colspan="2"></td>
      </tr>
      <tr>
        <td width="20">&nbsp;</td>
        <td height="20">5. ���� �̿� ȯ�濡�� ���ΰ� �´� ���� ȯ���� �����Ͽ� �ֽ� �� <span class="style1">�׽�Ʈ ����</span> ��ư�� ������ �ּ���.</td>
      </tr>
      
      <tr>
        <td height="10" colspan="2"></td>
      </tr>
    </table>
    <table width="90%" border="0" align="center" cellpadding="20" cellspacing="1" bgcolor="eeeeee">
      <tr>
        <td bgcolor="#FFFFFF"><div align="center"><img src="/images/portal/homepage_renewal/support/img_help4.gif" width="490" height="377" /></div></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="10" colspan="2"></td>
      </tr>
      <tr>
        <td width="20">&nbsp;</td>
        <td height="20">6. ȭ���� ��� ������ ǥ�õǾ��ٸ�, ���ͳ� ǰ�������� ���������� �̷���� ���Դϴ�.    </td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td height="20">�� ��� Ȯ�� ��ư�� �����ø� ���� ����� ���ؼ� Ȯ���Ͻ� �� �ֽ��ϴ�. </td>
      </tr>
      <tr>
        <td height="10" colspan="2"></td>
      </tr>
    </table>
    <table width="90%" border="0" align="center" cellpadding="20" cellspacing="1" bgcolor="eeeeee">
      <tr>
        <td bgcolor="#FFFFFF"><div align="center"><img src="/images/portal/homepage_renewal/support/img_help5.gif" width="468" height="597" /></div></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="10" colspan="2"></td>
      </tr>
      <tr>
        <td width="20">&nbsp;</td>
        <td height="20">7. ���ͳ� �ӵ� ǰ������ �׽�Ʈ ����� Ȯ���մϴ�. </td>
      </tr>
      
      <tr>
        <td height="10" colspan="2"></td>
      </tr>
    </table>
    <table width="90%" border="0" align="center" cellpadding="20" cellspacing="1" bgcolor="eeeeee">
      <tr>
        <td bgcolor="#FFFFFF"><div align="center"><img src="/images/portal/homepage_renewal/support/img_help6.gif" width="474" height="697" /></div></td>
      </tr>
    </table>
    
    <%}else if(v_code.equals("HELP_VIDEO")){ %>
    
    	<table width="672" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" colspan="2" class="h_road">&nbsp;</td>
      </tr>
      <tr>
        <td><img src="/images/portal/homepage_renewal/support/stitle_07.gif" alt="�н�ȯ�� �����" /></td>
        <td class="h_road">Home &gt; �н����� �ȳ�  &gt; <strong>�н�ȯ�� �����</strong></td>
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
        <td><img src="/images/portal/homepage_renewal/support/bar_02.jpg" width="672" height="104" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
    <table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image45','','/images/portal/homepage_renewal/support/tab_on_001.gif',1)"><img src="/images/portal/homepage_renewal/support/tab_off_001.gif" name="Image45" width="168" height="39" border="0" id="Image45" /></a></td>
        <td><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelpMove" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image46','','/images/portal/homepage_renewal/support/tab_on_002.gif',1)"><img src="/images/portal/homepage_renewal/support/tab_on_002.gif" name="Image46" width="168" height="39" border="0" id="Image46" /></a></td>
      </tr>
    </table>
    <table width="100%" border="0" cellpadding="15" cellspacing="2" bgcolor="#7692CB">
      <tr>
        <td bgcolor="f7f7f7">������ ���¸� ������ �� ���� ������ ����ٸ�, ������ �ӵ��� ������ ������.
          <br />
          ���ͳ� ȸ���ӵ� ������ ������ �ӵ� ������ ������� �ٸ� �� ������, ������ �ӵ� ������� �ӵ��� ����ġ�� ���� <br />
          ���
���ͳ� ȸ���ӵ� ������ ���� ȸ�� �ӵ��� �Բ� üũ�� �ֽñ� �ٶ��ϴ�.</td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="10" colspan="2"></td>
      </tr>
      <tr>
        <td width="20" height="40"><img src="/images/portal/homepage_renewal/common/icon_blue.jpg"/></td>
        <td><img src="/images/portal/homepage_renewal/support/sstitle_006.gif"/></td>
      </tr>
      <tr>
        <td height="1" colspan="2" bgcolor="#7692CB"></td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="20">
      <tr>
        <td><div align="center">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="20" height="25" class="stxt">��</td>
              <td class="btxt"><div align="left">300kbps</div></td>
            </tr>
          </table>
          <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
            <tr>
              <td height="200" bgcolor="#FFFFFF">
              	<div align="center">	              
	              <SCRIPT language=javascript type=text/javascript>
	              	object_embed("mms://vod.kbi.re.kr/goldclass/UCC.wmv","300","250");
	              </SCRIPT>
	            </div>
	          </td>
            </tr>
          </table>
        </div></td>
        <td><div align="center">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="20" height="25" class="stxt">��</td>
              <td class="btxt"><div align="left">500kbps</div></td>
            </tr>
          </table>
          <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
            <tr>
              <td height="200" bgcolor="#FFFFFF">
              	<div align="center">				
				<SCRIPT language=javascript type=text/javascript>
				object_embed("mms://speedtest.hvod.nefficient.co.kr/speedtest/test2.wmv","300","250");
                </SCRIPT>
			  	</div>
			  </td>
            </tr>
          </table>
        </div></td>
      </tr>
    </table>
    <!--Ÿ��Ʋ�κ�//-->
    <%} %>
    </td>
    <td width="20">&nbsp;</td>
    
  </tr>
</table>
      	
      	<%}else{ %>


            <h2><img src="/images/portal/studying/h2_tit5.gif" alt="�н�ȯ�浵���" class="fl_l" /><p class="category">Home > �н��������� > <strong>�н�ȯ�浵���</strong></p></h2>

            <p><img src="/images/portal/studying/help_borimg.gif" alt="���� ������ ���ؼ��� ������ ���ͳ� ����ȯ���� �ʿ��մϴ�. ������ ����ȯ���� üũ�غ�����." /></p>
<!-- ������ ���� ���� -->
<%=v_content %>
<!-- ������ ���� ���� -->
<%} %>
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->
