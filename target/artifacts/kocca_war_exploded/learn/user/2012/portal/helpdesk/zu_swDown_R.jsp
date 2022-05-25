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
    
    box.put("topmenu","5");
    box.put("submenu","4");

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

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
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
<form name = "form1" enctype = "multipart/form-data" method = "post" action="">
		<input type = "hidden" name = "p_process"   value = "">
		<input type = "hidden" name = "p_tab"		value = "">
		<input type = "hidden" name = "p_code"      value = "">
		
		<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0" summary="���� �����ִ� �������� ��ġ�Դϴ�.">
			<tr>
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > �н����� > <u>�н�ȯ�� �����</u></td>
			</tr>
		</table>
		<div class="concept d04">
			<div><img src="/images/2012/sub/page4/title/help.gif" alt="��ī���� �¶��� ���� �� �н�ȯ���� ������ �� �ֽ��ϴ�"></div>
			<ul class="pagetab">
				<li><a href="javascript:menuForward('4','05');" tabindex="121" title="��ȹ ������ Ȯ���մϴ�"><img src="/images/2012/sub/page4/tabmenu/test_off.png" alt="�н�ȯ�� �׽�Ʈ"></a></li>
				<li><img src="/images/2012/sub/page4/tabmenu/sw_on.png" alt="����Ʈ���� �ٿ�ε�"></li>
			</ul>
		</div>
		<br>
		<dl class="skipcontent">
			<dt>���� �ٷΰ���</dt>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip01" tabindex="122" title="�¶��ΰ��Ǹ� �����ϱ� ���� �ʿ� ����Ʈ�����Դϴ�">�����ʼ� ����Ʈ����</a></dd>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip02" tabindex="123" title="Ư�� ���ǽ� �ʿ��� ���� ��(�������)�� �ٿ�ε��� �� �ֽ��ϴ�">���� �� �������</a></dd>
		</dl>
		<table class="swdownload" cellpadding="0" cellspacing="0" id="skip01" summary="�н��� �ʿ��� ��Ƽ�� ����Ʈ��� �ٿ�޾� ��ġ�� �� �ֽ��ϴ�">
			<tr>
				<th id="sw1"><div><img src="/images/2012/sub/page4/guide/icon_flash_player.gif" alt="flash player(�÷��� �÷��̾�)"></div></th>
				<td name="sw1">
					<h4>Adobe Flash Player</h4>
					<h6>�¶��ΰ����� ������ ��κ� �÷��÷� ���۵Ǿ� �ֽ��ϴ�. �н��� �ϱ� ���ؼ��� �� S/W�� �ʼ��Դϴ�.</h6>
					<a href="http://get.adobe.com/kr/flashplayer/" target="_blank" tabindex="181" title="��� �÷��� �÷��̾� �ٿ�ε� Ȩ�������� �̵��մϴ� (��â)"><img src="/images/2012/sub/page4/btn_godownload.gif" alt="�ٿ�ε� �ٷΰ���"></a>
				</td>
				<th id="sw2"><div><img src="/images/2012/sub/page4/guide/icon_shokwave.gif" alt="Adobe ShockWave Player(��� ��ũ���̺� �÷��̾�)"></div></th>
				<td name="sw2">
					<h4>Adobe ShockWave Player</h4>
					<h6>ShockWave�� ���۵� ���� �Ǵ� �̵� ���� ���ؼ��� �� S/W�� �ʿ��մϴ�.</h6>
					<a href="http://get.adobe.com/kr/shockwave/" target="_blank" tabindex="182" title="��� ��ũ���̺� �÷��̾� �ٿ�ε� Ȩ�������� �̵��մϴ� (��â)"><img src="/images/2012/sub/page4/btn_godownload.gif" alt="�ٿ�ε� �ٷΰ���"></a>
				</td>
			</tr>
			<tr>
				<th id="sw3"><div><img src="/images/2012/sub/page4/guide/icon_real.gif" alt="RealPlayer(���� �÷��̾�)"></div></th>
				<td name="sw3">
					<h4>RealPlayer</h4>
					<h6>ra, rm ������ �̷���� ���Ǹ� �� �� �ִ� ���α׷��Դϴ�.</h6>
					<a href="http://kr.real.com/" target="_blank" tabindex="183" title="���� �÷��̾� �ٿ�ε� Ȩ�������� �̵��մϴ� (��â)"><img src="/images/2012/sub/page4/btn_godownload.gif" alt="�ٿ�ε� �ٷΰ���"></a>
				</td>
				<th id="sw4"><div><img src="/images/2012/sub/page4/guide/icon_java.gif" alt="Java 6(�ڹ�6)"></div></th>
				<td name="sw4">
					<h4>ORACLE Java 7</h4>
					<h6>XP�ʱ���� ����ڴ� �ڹ� ����ӽ��� ��ġ�Ǿ� ���� �ʽ��ϴ�. ���Ǹ� �ޱ� ���ؼ��� �ʼ��� S/W�Դϴ�.</h6>
					<a href="http://java.com/ko/download/index.jsp" target="_blank" tabindex="184" title="����Ŭ �ڹ�7 �ٿ�ε� Ȩ�������� �̵��մϴ� (��â)"><img src="/images/2012/sub/page4/btn_godownload.gif" alt="�ٿ�ε� �ٷΰ���"></a>
				</td>
			</tr>
			<tr>
				<th id="sw5"><div><img src="/images/2012/sub/page4/guide/icon_winmedia.gif" alt="Windows Media Player(������ �̵�� �÷��̾�)"></div></th>
				<td name="sw5">
					<h4>Windows Media Player</h4>
					<h6>���� �� �������� ������ ���� ��� �� S/W�� ��ġ�ؾ� �ϴ� ��찡 �ֽ��ϴ�.</h6>
					<a href="http://www.microsoft.com/ko-KR/download/details.aspx?id=20426" tabindex="185" title="������ �̵�� �÷��̾� �ٿ�ε� Ȩ�������� �̵��մϴ� (��â)" target="_blank"><img src="/images/2012/sub/page4/btn_godownload.gif" alt="�ٿ�ε� �ٷΰ���"></a>
				</td>
				<th id="sw6"><div><img src="/images/2012/sub/page4/guide/icon_hangul.gif" alt="hangul viewer(�ѱ� ���)"></div></th>
				<td name="sw6">
					<h4>�ѱ۰� ��ǻ�� ���ǽ� ��� 2010 SE+</h4>
					<h6>�����ڷ� �� �ѱ�����(hwp)�� �ۼ��� �ڷᰡ �ֽ��ϴ�. �ڷḦ Ȯ���Ͻ� �� ��ġ�մϴ�.</h6>
					<a href="http://www.hancom.com/downLoad.downPU.do?mcd=002" tabindex="186" title="�ѱ۰� ��ǻ�� ���ǽ� ��� �ٿ�ε� Ȩ�������� �̵��մϴ� (��â)" target="_blank"><img src="/images/2012/sub/page4/btn_godownload.gif" alt="�ٿ�ε� �ٷΰ���"></a>
				</td>
			</tr>
			<tr>
				<th id="sw7"><div><img src="/images/2012/sub/page4/guide/icon_leader.gif" alt="Adobe Reader X(��� ���� X)"></div></th>
				<td name="sw7">
					<h4>Adobe Reader X</h4>
					<h6>�����ڷ� �� PDF���Ϸ� �� ��ũ�ι�� ������ �ֽ��ϴ�. �ڷḦ Ȯ���Ͻ� �� ��ġ�մϴ�.</h6>
					<a href="http://get.adobe.com/kr/reader/?promoid=HTEHD" target="_blank" tabindex="187" title="��� ���� �ٿ�ε� Ȩ�������� �̵��մϴ� (��â)"><img src="/images/2012/sub/page4/btn_godownload.gif" alt="�ٿ�ε� �ٷΰ���"></a>
				</td>
				<th id="sw8"><div><img src="/images/2012/sub/page4/guide/icon_ppt.gif" alt="MS Office PowerPoint Viewer(����ũ�μ���Ʈ ���ǽ� �Ŀ�����Ʈ ���)"></div></th>
				<td name="sw8">
					<h4>MS Office PowerPoint Viewer</h4>
					<h6>�����ڷ� �� �Ŀ�����Ʈ(ppt)���Ϸ� �ۼ��� �ڷᰡ �ֽ��ϴ�. �ڷḦ Ȯ���Ͻ� �� ��ġ�մϴ�.</h6>
					<a href="http://www.microsoft.com/ko-kr/download/details.aspx?id=13" target="_blank" tabindex="188" title="����ũ�μ���Ʈ ���ǽ� �Ŀ�����Ʈ ��� �ٿ�ε� Ȩ�������� �̵��մϴ� (��â)"><img src="/images/2012/sub/page4/btn_godownload.gif" alt="�ٿ�ε� �ٷΰ���"></a>
				</td>
			</tr>
		</table>
		<table class="swdownload" cellpadding="0" cellspacing="0" id="skip02" summary="Ư�� ���� �н��� �ʿ��� ����ü����� ����Ʈ��� �ٿ���� �� �ֽ��ϴ�">
			<tr>
				<th id="sw9"><div><img src="/images/2012/sub/page4/guide/icon_flash.gif" alt="Adobe Flash CS6 (����������)(��� �÷��� CS6)"></div></th>
				<td name="sw9">
					<h4>Adobe Flash CS6 (���� �������)</h4>
					<h6>����,��ȭ �� �ִϸ��̼� �� �پ��� �о߿��� �ַ� ���Ǵ� ���Դϴ�. </h6>
					<a href="http://www.adobe.com/cfusion/tdrc/index.cfm?product=flash&loc=ko" target="_blank" tabindex="191" title="��� �÷��� CS6 (����������) �ٿ�ε� Ȩ�������� �̵��մϴ� (��â)"><img src="/images/2012/sub/page4/btn_godownload.gif" alt="�ٿ�ε� �ٷΰ���"></a>
				</td>
				<th id="sw10"><div><img src="/images/2012/sub/page4/guide/icon_aftereffect.gif" alt="Adobe After Effect CS6 (���� �������)(��� ������ ����Ʈ CS6)"></div></th>
				<td name="sw10">
					<h4>Adobe After Effect CS6 (���� �������)</h4>
					<h6>���� Ư��ȿ���� ������ �� �ִ� ���Դϴ�. ��ȭ �� ���ӿ��� �������� �ſ� �����ϴ�.</h6>
					<a href="http://www.adobe.com/cfusion/tdrc/index.cfm?product=after_effects" target="_blank" tabindex="192" title="��� ����������Ʈ CS6 (����������) �ٿ�ε� Ȩ�������� �̵��մϴ� (��â)"><img src="/images/2012/sub/page4/btn_godownload.gif" alt="�ٿ�ε� �ٷΰ���"></a>
				</td>
			</tr>
			<tr>
				<th id="sw11"><div><img src="/images/2012/sub/page4/guide/icon_premiere.gif" alt="Adobe Premiere CS6 (����������)(��� �����̾� CS6)"></div></th>
				<td name="sw11">
					<h4>Adobe Premiere Pro CS6 (���� �������)</h4>
					<h6>��ȭ, �ִϸ��̼ǵ��� ������ ������ ���ڵ��� �� �� �ִ� ���� ���Դϴ�.</h6>
					<a href="http://www.adobe.com/cfusion/tdrc/index.cfm?product=premiere_pro" target="_blank" tabindex="193" title="��� �����̾� CS6 (����������) �ٿ�ε� Ȩ�������� �̵��մϴ� (��â)"><img src="/images/2012/sub/page4/btn_godownload.gif" alt="�ٿ�ε� �ٷΰ���"></a>
				</td>
				<th id="sw12"><div><img src="/images/2012/sub/page4/guide/icon_photoshop.gif" alt="Adobe Photoshop CS6 (���� �������)(��� ���伥 CS6)"></div></th>
				<td name="sw12">
					<h4>Adobe Photoshop CS6 (���� �������)</h4>
					<h6>��� �̹��� �� ������ �����ϰų� ������ �� �ִ� ��ǥ���� ���Դϴ�.</h6>
					<a href="http://www.adobe.com/cfusion/tdrc/index.cfm?product=photoshop" target="_blank" tabindex="194" title="��� ���伥 CS6 (����������) �ٿ�ε� Ȩ�������� �̵��մϴ� (��â)"><img src="/images/2012/sub/page4/btn_godownload.gif" alt="�ٿ�ε� �ٷΰ���"></a>
				</td>
			</tr>
			<tr>
				<th id="sw13"><div><img src="/images/2012/sub/page4/guide/icon_3dsmax.gif" alt="Autodesk 3ds Max (����ü����)(���䵥��ũ 3Ds �ƽ�)"></div></th>
				<td name="sw13">
					<h4>Autodesk 3ds Max (����ü����)</h4>
					<h6>����,��ȭ,�ִϸ��̼�,�̹��� �� 3D������ ���� �θ� ���Ǵ� ���Դϴ�.</h6>
					<a href="http://www.autodesk.co.kr/adsk/servlet/download/item?siteID=1169528&id=17089546" target="_blank" tabindex="195" title="���䵥��ũ 3Ds �ƽ� (����ü����) �ٿ�ε� Ȩ�������� �̵��մϴ� (��â)"><img src="/images/2012/sub/page4/btn_godownload.gif" alt="�ٿ�ε� �ٷΰ���"></a>
				</td>
				<th id="sw14"><div><img src="/images/2012/sub/page4/guide/icon_maya.gif" alt="Autodesk Maya (����ü����)(���䵥��ũ ����)"></div></th>
				<td name="sw14">
					<h4>Autodesk Maya (����ü����)</h4>
					<h6>3D�ִϸ��̼� ���ۿ� Ưȭ�� ��ǥ���� 3D�׷��� ���Դϴ�.</h6>
					<a href="http://www.autodesk.co.kr/adsk/servlet/download/item?siteID=1169528&id=17089766" target="_blank" tabindex="196" title="���䵥��ũ ���� (����ü����) �ٿ�ε� Ȩ�������� �̵��մϴ� (��â)"><img src="/images/2012/sub/page4/btn_godownload.gif" alt="�ٿ�ε� �ٷΰ���"></a>
				</td>
			</tr>
		</table>
	</div>
</form>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
