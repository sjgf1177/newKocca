<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
	box.put("topmenu","7");
	box.put("submenu","3");
%>


<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0" summary="���� ������ �������� ��ġ�Դϴ�">
			<tr>
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > ��ī���� �Ұ� > ������� > <u>�¶��α���</u></td>
			</tr>
		</table>
		<div class="concept">
			<div>
				<img src="/images/2012/sub/page7/title/business.gif" alt="��������ȳ�">
			</div>
		</div><br>
		<!--dl class="skipcontent">
			<dt>���� �ٷΰ���</dt>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip01" tabindex="121" title="���̹���������ī���� ��� ����� �̵��մϴ�">����</a></dd>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip02" tabindex="122" title="���̹���������ī���� ��� ��������� �̵��մϴ�">�����</a></dd>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip03" tabindex="123" title="���̹���������ī���� ��� �������� �̵��մϴ�">����</a></dd>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip04" tabindex="124" title="���̹���������ī���� ��� �������� ���Ƿ� �̵��մϴ�">�������� ����</a></dd>
		</dl-->
		<ul class="category">
			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=1" tabindex="171" title="������ ����缺 ������ ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business01.png" alt="������ ����缺 ����"></a></li>
			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=2" tabindex="172" title="������ ���� �米���� ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business02.png" alt="����� ���� �米��"></a></li>
			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=3" tabindex="173" title="�¶��� ������ ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business03on.png" alt="�¶��� ����"></a></li>
<!--			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=4" tabindex="174" title="���� ���������� ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business04.png" alt="���� ��������"></a></li>-->
<!--			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=5" tabindex="175" title="3D��ü ������ �����η� �缺�� ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business05.png" alt="3D��ü ������ �����η� �缺"></a></li>-->
			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=6" tabindex="176" title="â������ �缺����� ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business06.png" alt="â������ �缺���"></a></li>
<!--			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=7" tabindex="177" title="��� ���ε༭ ���� ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business07.png" alt="��� ���ε༭ ����"></a></li>-->
<!--			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=8" tabindex="178" title="���ӱ��� ����ڰ� ������ ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business08.png" alt="���ӱ��� ����ڰ� ����"></a></li>-->
		</ul>
		<div class="txtpage">
			<h1>���̹���������ī���� �</h1>
			<h4>�¶��α��������� ��ۿ���/����/��ȭ������ ��ȹ, ����, �濵, ����Ͻ� �о��� ��� ���� �������� �����Ͽ� ��������� �ű� �����ڿ� �����ڵ鿡�� ���� ������ ��������� ���� ��Ǵ� �������α׷��Դϴ�.</h4>
			<!--h3 id="skip01"><p><img src="/images/2012/common/icon/icon_skip_up.gif" alt="������ ���ư���"><a href="#" tabindex="181" title="���� ȭ����ġ�� ���� ������ �ø��ϴ�">������ ���ư���</a></p>����</h3>
			<h6>
				<p>����� : ��ȭ��������� �������� �����ɷ����� �η¾缺�� ����Ȯ��</p>
				<p>������� : ������ ��� ������, �����������а� �л� �� �Ϲ��� ��</p>
				<p>����� : 136�� ���� �ſ� 1ȸ ����</p>
			</h6>
			<br>
			<h3 id="skip02"><p><img src="/images/2012/common/icon/icon_skip_up.gif" alt="������ ���ư���"><a href="#" tabindex="182" title="���� ȭ����ġ�� ���� ������ �ø��ϴ�">������ ���ư���</a></p>�����</h3>
			<h6>
				<p>������ ����� �����䱸�� ���縦 ���� ���� �߽��� �¶��� ���� ����������</p>
				<p>���չ̵�� ȯ�溯ȭ�� ���� ������ �¶��α����ý��� �</p>
				<p>������ ���� �¶��� Ʃ�͸� Ȱ���� 1:1 ����� �н����� �</p>
				<p> ö���� ���� ������ ���� ���� ȿ�� �� ���� ������ ����</p>
			</h6>
			<h3 id="skip03"><p><img src="/images/2012/common/icon/icon_skip_up.gif" alt="������ ���ư���"><a href="#" tabindex="183" title="���� ȭ����ġ�� ���� ������ �ø��ϴ�">������ ���ư���</a></p>����</h3>
			<h6>
				<p class="bolder">���� ��û/����</p>
					<span>- ��û��� : �¶��� ��û / <a href="http://edu.kocca.or.kr" tabindex="184" target="_blank" title="�ѱ���������ī���� �ٷΰ��� (��â)">http://edu.kocca.or.kr</a></span><br>
					<span>- ���߱��� : ������û ������</span>
					<br><br>
				<p class="bolder">�������� �</p>
					<span>- ������� : �н��� ���� PC���� �¶��� �н�</span><br>
					<span>- ����� : �ſ� 1ȸ ����(1��)</span><br>
					<span>- ����� : ��ۿ���/����/��ȭ������ ��ȹ, ����, �濵����Ͻ� �о� �� 136�� ���� �</span><br>
					<span>- �н��Ⱓ : �н� 1����, ���� 3����</span>
					<span>- �� �� �� : ����</span>
					<span>- �������� : ������ ��� �о� ������, �а�������</span>
			</h6>
			<h3 id="skip04"><p><img src="/images/2012/common/icon/icon_skip_up.gif" alt="������ ���ư���"><a href="#" tabindex="185" title="���� ȭ����ġ�� ���� ������ �ø��ϴ�">������ ���ư���</a></p>�������� ����</h3>
			<h6>
				<p>�ڰ��� ���� (02-3219-6541, <a href="mailto:pke329@kocca.kr" tabindex="186" title="pke329@kocca.kr�� ������ ������ �ۼ��մϴ�">pke329@kocca.kr</a>)</p>
				<p>������ �븮 (02-2161-0077, <a href="mailto:edu_kocca@naver.com" tabindex="186" title="edu_kocca@naver.com�� ������ ������ �ۼ��մϴ�">edu_kocca@naver.com</a>)</p>
			</h6-->
			<br/>
			<img src="/images/2012/sub/page7/cyberonline.gif"/>
			<img src="/images/2012/sub/page7/cyberonline_02.gif"/>
		</div>
	</div>
	
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>