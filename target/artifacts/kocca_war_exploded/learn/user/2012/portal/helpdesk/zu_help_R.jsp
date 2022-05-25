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
    
    String tap			= "";
    
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

<form name = "form1" enctype = "multipart/form-data" method = "post" action="">
	<input type = "hidden" name = "p_process"   value = "">
	<input type = "hidden" name = "p_tab"		value = "">
	<input type = "hidden" name = "p_code"      value = "">
	
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > �н����� > <u>�н�ȯ�� �����</u></td>
			</tr>
		</table>
		<div class="concept d04">
			<div><img src="/images/2012/sub/page4/title/help.gif" alt="��ī���� �¶��� ���� �� �н�ȯ���� ������ �� �ֽ��ϴ�"></div>
			<ul class="pagetab">
				<li><img src="/images/2012/sub/page4/tabmenu/test_on.png" alt="�н�ȯ�� �׽�Ʈ"></li>
				<li><a href="javascript:menuForward('4','03');" tabindex="121" title="���� ������ Ȯ���մϴ�"><img src="/images/2012/sub/page4/tabmenu/sw_off.png" alt="����Ʈ���� �ٿ�ε�"></a></li>
			</ul>
		</div>
		<br>
		<dl class="skipcontent">
			<dt>���� �ٷΰ���</dt>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip01" tabindex="122" title="1~3�ܰ�� �̵��մϴ�">�н�ȯ�� �׽�Ʈ 1~3�ܰ�</a></dd>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip02" tabindex="123" title="4~5�ܰ�� �̵��մϴ�">�н�ȯ�� �׽�Ʈ 4~6�ܰ�</a></dd>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip03" tabindex="124" title="7~10�ܰ�� �̵��մϴ�">�н�ȯ�� �׽�Ʈ 7~10�ܰ�</a></dd>
		</dl>
		<div class="internetguide">
			������ ����� ������ �����ôٸ�, ���� ��� ���� ���ͳ� ȸ���� ����ӵ��� Ȯ���� �ּ���.<br>
			ȸ�� �ӵ� �׽�Ʈ�� �Ϸ翡 20~30�� ������ �ΰ� �ݵ�� �������� ���ּž� ��Ȯ�� �ӵ��� �� �� �ֽ��ϴ�.
		</div>
		<div class="guidestep">
			<table id="skip01" class="stepimage" cellpadding="0" cellspacing="0">
				<colgroup><col width="302"><col width="37"><col width="302"><col width="*"><col width="302"></colgroup>
				<tr>
					<td class="alignL"><img src="/images/2012/sub/page4/guide/test01.gif" class="stepst" alt="Step01 �������"></td>
					<td class="alignC"><img src="/images/2012/common/icon_arrow.gif" alt="arrow"></td>
					<td class="alignC"><img src="/images/2012/sub/page4/guide/test02.gif" class="stepst" alt="Step02 �������"></td>
					<td class="alignC"><img src="/images/2012/common/icon_arrow.gif" alt="arrow"></td>
					<td class="alignR"><img src="/images/2012/sub/page4/guide/test03.gif" class="stepst" alt="Step03 �������"></td>
				</tr>
				<tr class="division">
					<td>(Step 01)</td>
					<td></td>
					<td>(Step 02)</td>
					<td></td>
					<td>(Step 03)</td>
				</tr>
			</table>
			<p><span>Step 01.</span> �ѱ�����ȭ����� ����Ʈ�� �����մϴ�. ���� �� ��� �޴����� <b>ǰ�������׽�Ʈ �� ���ͳ� �ӵ�</b> �Ǵ� ���ο� <b>���ͳ� �ӵ�</b>�� �����մϴ�. <a href="http://speed.nia.or.kr/" tabindex="172" target="_blank" title="���ͳ� ǰ������ �׽�Ʈ�� �̵��մϴ�."><u>(�ѱ�����ȭ����� �ٷΰ���)</u></a></p>
			<p><span>Step 02.</span> ���� ���� ��� ����ȭ�鿡�� <b>����� �а� ���� ��</b> �ӵ� ������ ������ ���Ѵٸ�, ����� ���� �� ������ Ŭ���մϴ�.</p>
			<p><span>Step 03.</span> ������ ó�� �õ��ϴ� ��� ������ ���� �� �������� �޽����� ���ɴϴ�. �׽�Ʈ ������ ���ؼ��� "<b>Ȯ��</b>"��ư�� Ŭ���Ͽ� ��ġ���α׷��� �ٿ�ε��մϴ�.</p>
			<br><br>
			<table id="skip02" class="stepimage" cellpadding="0" cellspacing="0">
				<colgroup><col width="302"><col width="37"><col width="302"><col width="*"><col width="302"></colgroup>
				<tr>
					<td class="alignL"><img src="/images/2012/sub/page4/guide/test04.gif" class="stepst" alt="Step04 �������"></td>
					<td class="alignC"><img src="/images/2012/common/icon_arrow.gif" alt="arrow"></td>
					<td class="alignC"><img src="/images/2012/sub/page4/guide/test05.gif" class="stepst" alt="Step05 �������"></td>
					<td class="alignC"><img src="/images/2012/common/icon_arrow.gif" alt="arrow"></td>
					<td class="alignR"><img src="/images/2012/sub/page4/guide/test06.gif" class="stepst" alt="Step06 �������"></td>
				</tr>
				<tr class="division">
					<td>(Step 04)</td>
					<td></td>
					<td>(Step 05)</td>
					<td></td>
					<td>(Step 06)</td>
				</tr>
			</table>
			<p><span>Step 04.</span> �ٿ�ε尡 �Ϸ�Ǹ�, �� �̹����� ���� "<b>����� ���� ��Ʈ��</b>" ������ ���ɴϴ�. �� �� "<b>��</b>"�� �����Ͽ�, ���α׷� ��ġ�� �����մϴ�.</p>
			<p><span>Step 05.</span> ��ġ�� ���������� �����ϱ� ����, "<b>Next</b>"��ư�� ��ġ������ ȭ���� ������ ������ Ŭ���մϴ�.</p>
			<p><span>Step 06.</span> ��ġ ȭ�鿡�� PCȯ�濡 ���� <b>�� 1~3�� ����</b>�� �ҿ�˴ϴ�.</p>
			<br><br>
			<table id="skip03" class="stepimage" cellpadding="0" cellspacing="0">
				<colgroup><col width="302"><col width="37"><col width="302"><col width="*"><col width="302"></colgroup>
				<tr>
					<td class="alignL"><img src="/images/2012/sub/page4/guide/test07.gif" class="stepst" alt="Step07 �������"></td>
					<td class="alignC"><img src="/images/2012/common/icon_arrow.gif" alt="arrow"></td>
					<td class="alignC"><img src="/images/2012/sub/page4/guide/test08.gif" class="stepst" alt="Step08 �������"></td>
					<td class="alignC"><img src="/images/2012/common/icon_arrow.gif" alt="arrow"></td>
					<td class="alignR"><img src="/images/2012/sub/page4/guide/test09.gif" class="stepst" alt="Step09 �������"></td>
				</tr>
				<tr class="division">
					<td>(Step 07)</td>
					<td></td>
					<td>(Step 08)</td>
					<td></td>
					<td>(Step 09)</td>
				</tr>
			</table>
			<p><span>Step 07.</span> ��ġ�� �Ϸ�Ǹ�, "<b>Close</b>"��ư�� Ŭ���Ͽ� �����츦 �ݾ��ݴϴ�.</p>
			<p><span>Step 08.</span> ���α׷� ��ġ�� �Ϸ� �� ȸ������ ���� �̿��ϴ� ȸ����, ���� PC�� �̿��ϴ� ��ġ�� �ְ����¸� �ǹٸ��� ������ �� "<b>����</b>"��ư�� Ŭ���մϴ�.</p>
			<p><span>Step 09.</span> "<b>����</b>"��ư�� Ŭ���Ͽ� ������ �����մϴ�. (��Ȥ "���� ���� �̿��ڰ� �����ϴ�" ��� �޼����� ������ ��찡 �ֽ��ϴ�. �̷��� ��쿡�� �� �� �� �ٽ� �����մϴ�.)</p>
			<p><span>Step 10.</span> �������� <b>�� 1~3�� ���� �ҿ�</b>�Ǹ�, ���ͳ� �ӵ� ������ �Ϸ�˴ϴ�. <b>�ٿ�ε� �ӵ��� 1.00 Mbps �̸��� ���</b> �¶��� ������ ������ ����� �� �ֽ��ϴ�.</p>
		</div>
	</div>
</form>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
