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
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > ��ī���� �Ұ� > ������� > <u>������ ���� �米��</u></td>
			</tr>
		</table>
		<div class="concept">
			<div>
				<img src="/images/2012/sub/page7/title/business.gif" alt="��������ȳ�">
			</div>
		</div><br>
		<!--dl class="skipcontent">
			<dt>���� �ٷΰ���</dt>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip01" tabindex="121" title="����� ���� �米�������� ����� �̵��մϴ�">����</a></dd>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip02" tabindex="122" title="����� ���� �米�������� ��������� �̵��մϴ�">�����</a></dd>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip03" tabindex="123" title="����� ���� �米�������� �������� �̵��մϴ�">����</a></dd>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip04" tabindex="124" title="����� ���� �米�������� �������� ���Ƿ� �̵��մϴ�">�������� ����</a></dd>
		</dl-->
		<ul class="category">
			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=1" tabindex="171" title="������ ����缺 ������ ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business01.png" alt="������ ����缺 ����"></a></li>
			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=2" tabindex="172" title="������ ���� �米���� ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business02on.png" alt="����� ���� �米��"></a></li>
			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=3" tabindex="173" title="�¶��� ������ ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business03.png" alt="�¶��� ����"></a></li>
<!--			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=4" tabindex="174" title="���� ���������� ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business04.png" alt="���� ��������"></a></li>-->
<!--			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=5" tabindex="175" title="3D��ü ������ �����η� �缺�� ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business05.png" alt="3D��ü ������ �����η� �缺"></a></li>-->
			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=6" tabindex="176" title="â������ �缺����� ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business06.png" alt="â������ �缺���"></a></li>
<!--			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=7" tabindex="177" title="��� ���ε༭ ���� ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business07.png" alt="��� ���ε༭ ����"></a></li>-->
<!--			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=8" tabindex="178" title="���ӱ��� ����ڰ� ������ ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business08.png" alt="���ӱ��� ����ڰ� ����"></a></li>-->
		</ul>
		<div class="txtpage">
			<h1>������ ���� �米������</h1>
			<h4>������ ���� �米�������� ������ ����� �����ڸ� ������� ���������� â�� ���� �� �۷ι� ����� ��ȭ�� �������� â�۱�� ������ �缺�� ���� ��Ǵ� �������α׷��Դϴ�.</h4>
			<!--h3 id="skip01"><p><img src="/images/2012/common/icon/icon_skip_up.gif" alt="������ ���ư���"><a href="#" tabindex="181" title="���� ȭ����ġ�� ���� ������ �ø��ϴ�">������ ���ư���</a></p>����</h3>
			<h6>
				<p>����� : ������ ����� ���� ����� ���� ���� ���������� ���� ����� â�� ������ ���� ������ ����</p>
				<p>��� : ������ ����� ������ �о� ������</p>
				<p>����� : 1-10�� / �ܱ� ���� �</p>
			</h6>
			<table class="intable" cellspacing="0" cellpadding="0" summary="�оߺ� �������� �ȳ��Դϴ�">
				<caption>�оߺ� �������� �ȳ�</caption>
				<colgroup><col width="250"><col width="*"><col width="180"><col width="180"></colgroup>
				<tr>
					<th>�о�</th>
					<th>������</th>
					<th>�����Ⱓ</th>
					<th class="noborder">�����ο�</th>
				</tr>
				<tr>
					<th rowspan="12" class="notweight">�������� �ڿ����� �߼ұ��<br>���ҽþ� �������� (�뵿��)</th>
					<td>Final Cut Pro����</td>
					<td>'12.01.09~01.13</td>
					<td>5</td>
				</tr>
				<tr>
					<td>iPhone ���۰���</td>
					<td>'12.01.09~01.13</td>
					<td>15</td>
				</tr>
				<tr>
					<td>������ ��ȹ�� �ۼ� ���� ����</td>
					<td>'12.02.20~2.21</td>
					<td>15</td>
				</tr>
				<tr>
					<td>����Ͻ� ��ų�� ����</td>
					<td>'12.02.1~2.2</td>
					<td>5</td>
				</tr>
				<tr>
					<td>Protools �������</td>
					<td>'12.02.13~02.17</td>
					<td>5</td>
				</tr>
				<tr>
					<td>�����й̵�� ��ũ�÷ο� ����</td>
					<td>'12.03.12~03.14</td>
					<td>5</td>
				</tr>
				<tr>
					<td>���� ������ ����� ����</td>
					<td>'12.04.4~04.6</td>
					<td>10</td>
				</tr>
				<tr>
					<td>��������ȹ(��ȭ,���,����,�ִ�,����)����</td>
					<td>'12.05.8~05.10</td>
					<td>10</td>
				</tr>
				<tr>
					<td>Avid MC 101����</td>
					<td>'12.02.6~2.10</td>
					<td>5</td>
				</tr>
				<tr>
					<td>Final Cut Pro����</td>
					<td>'12.02.20~2.24</td>
					<td>5</td>
				</tr>
				<tr>
					<td>��ǥ��, ���۱�, ���̼��� ��� ��� ����</td>
					<td>'12.06.11~06.15</td>
					<td>10</td>
				</tr>
				<tr>
					<td colspan="2">�� ��</td>
					<td>90</td>
				</tr>
				<tr>
					<th rowspan="7" class="notweight">��ȭ������ ��������</th>
					<td>â���� ������ ����߰��� ���� ���̳�</td>
					<td>��12.05.16~05.17</td>
					<td>15</td>
				</tr>
				<tr>
					<td>�ٹ�ȭ ������ ������ ����</td>
					<td>5�� ��</td>
					<td>15</td>
				</tr>
				<tr>
					<td>������ť���͸� �������� ���̵�</td>
					<td>��12.06.19~06.20</td>
					<td>20</td>
				</tr>
				<tr>
					<td>OSMU�� ���� �� â�۰���</td>
					<td>��12.09.3~10.12</td>
					<td>10</td>
				</tr>
				<tr>
					<td>��������, ��ȹ���� �������</td>
					<td>��12.10.16.~10.17</td>
					<td>20</td>
				</tr>
				<tr>
					<td>û�ҳ��� ���� â�ǰ��� ���ǹ̵�� ����</td>
					<td>10�� ��</td>
					<td>15</td>
				</tr>
				<tr>
					<td colspan="2">�� ��</td>
					<td>95</td>
				</tr>
			</table>
			<br>
			<h6>�� �������� ������ �� ������ ��������� �������� ���� �ѱ���������ī����(<a href="http://edu.kocca.or.kr" tabindex="182" target="_blank" title="�ѱ���������ī���� Ȩ�������� �̵��մϴ�">http://edu.kocca.or.kr</a>)�� �����Ͻñ� �ٶ��ϴ�.</h6>
			<h3 id="skip02"><p><img src="/images/2012/common/icon/icon_skip_up.gif" alt="������ ���ư���"><a href="#" tabindex="183" title="���� ȭ����ġ�� ���� ������ �ø��ϴ�">������ ���ư���</a></p>�����</h3>
			<h6>
				<p>���� �ְ��� ���������� Ȱ���� ������ ���� ���� ���� ���� ����</p>
				<p>�оߺ� �����䱸�� ����, Ʈ���� �м��� ���� ������ ���� ���� �߽��� �������� �</p>
				<p>�������� ��������� ��Ʈ�� ������ ���� ��ǰ�� �������� ����</p>
				<p>ǳ���� ���� ����� ���� ������ ������ �������� ���� �������� Ȱ�� ���� ���� ����</p>
				<p>ö���� ���� ������ ���� ���� ȿ�� �� ���� ������ ����</p>
			</h6>
			<h3 id="skip03"><p><img src="/images/2012/common/icon/icon_skip_up.gif" alt="������ ���ư���"><a href="#" tabindex="184" title="���� ȭ����ġ�� ���� ������ �ø��ϴ�">������ ���ư���</a></p>����</h3>
			<h6>
				<p class="bolder">���� ��û/����</p>
					<span>- ��û��� : �¶��� ��û / <a href="http://edu.kocca.or.kr" tabindex="185" target="_blank" title="�ѱ���������ī���� �ٷΰ��� (��â)">http://edu.kocca.or.kr</a></span><br>
					<span>- ���߱��� : �� ������ �����ڰ� ���� ���ռ� ����, ������û ������, �Ҽӱ���� �ο� �ȹ� ��</span>
					<br><br>
				<p class="bolder">�������� �</p>
					<span>- ������� : ���� �� �ǽ�����, �������� �ǽ����� �� ������ Ŀ��ŧ���� ���� ���� ���� �߽��� ���� �</span><br>
					<span>- �������� : ���� �ǹ�������, �а� ������ ��</span><br>
					<span>- �����ý��� �� ��� : ���� �ְ��� ���� ��� Ȱ���� ������ ���� �ǹ� �߽��� ���� �</span><br>
					<span>- ������� : �ѱ���������ī���� ���ǽ�(�� ���ȸ�� ����)</span>
			</h6>
			<h3 id="skip04"><p><img src="/images/2012/common/icon/icon_skip_up.gif" alt="������ ���ư���"><a href="#" tabindex="186" title="���� ȭ����ġ�� ���� ������ �ø��ϴ�">������ ���ư���</a></p>�������� ����</h3>
			<h6>
				<p>��ǥ : 02-2161-0072</p>
			</h6-->
			<br/>
			<img src="/images/2012/sub/page7/hyunup_01.gif"/>
			<img src="/images/2012/sub/page7/hyunup_02.gif"/>
			<h6>�� �������� ������ �� ������ ��������� �������� ���� �ѱ���������ī����(<a href="http://edu.kocca.or.kr" tabindex="182" target="_blank" title="�ѱ���������ī���� Ȩ�������� �̵��մϴ�">http://edu.kocca.or.kr</a>)�� �����Ͻñ� �ٶ��ϴ�.</h6>
			<img src="/images/2012/sub/page7/hyunup_03.gif"/>
		</div>
	</div>
	<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>