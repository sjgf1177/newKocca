<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
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
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > ��ī���� �Ұ� > ������� > <u>������ ���� �缺����</u></td>
			</tr>
		</table>
		<div class="concept">
			<div>
				<img src="/images/2012/sub/page7/title/business.gif" alt="��������ȳ�">
			</div>
		</div><br>
		<!--dl class="skipcontent">
			<dt>���� �ٷΰ���</dt>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip01" tabindex="121" title="������ �ٽ��η¾缺�� ����� �̵��մϴ�">����</a></dd>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip02" tabindex="122" title="������ �ٽ��η¾缺�� ��������� �̵��մϴ�">�����</a></dd>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip03" tabindex="123" title="������ �ٽ��η¾缺�� �������� �̵��մϴ�">����</a></dd>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip04" tabindex="124" title="������ �ٽ��η¾缺�� �������� ���Ƿ� �̵��մϴ�">�������� ����</a></dd>
		</dl-->
		<ul class="category">
			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=1" tabindex="171" title="������ ����缺 ������ ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business01on.png" alt="������ ����缺 ����"></a></li>
			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=2" tabindex="172" title="������ ���� �米���� ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business02.png" alt="����� ���� �米��"></a></li>
			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=3" tabindex="173" title="�¶��� ������ ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business03.png" alt="�¶��� ����"></a></li>
<!--			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=4" tabindex="174" title="���� ���������� ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business04.png" alt="���� ��������"></a></li>-->
<!--			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=5" tabindex="175" title="3D��ü ������ �����η� �缺�� ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business05.png" alt="3D��ü ������ �����η� �缺"></a></li>-->
			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=6" tabindex="176" title="â������ �缺����� ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business06.png" alt="â������ �缺���"></a></li>
<!--			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=7" tabindex="177" title="��� ���ε༭ ���� ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business07.png" alt="��� ���ε༭ ����"></a></li>-->
<!--			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=8" tabindex="178" title="���ӱ��� ����ڰ� ������ ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business08.png" alt="���ӱ��� ����ڰ� ����"></a></li>-->
		</ul>
		<div class="txtpage">
			<h1>������ �ٽ� �η¾缺</h1>
			<h2>(��ۿ���,����,3D)</h2>
			<h4>������ �ٽ� �η¾缺 ���������� ��������� ������� �̵�� ȯ�� ��ȭ�� �´� ���������� â�� ������ �۷ι� ����� ��ȭ�� �������� ����, ��ۿ���, 3D ���� â�۱�� ������ �缺�� ���� ��Ǵ� �������α׷��Դϴ�.</h4>
			<!--h3 id="skip01"><p><img src="/images/2012/common/icon/icon_skip_up.gif" alt="������ ���ư���"><a href="#" tabindex="181" title="���� ȭ����ġ�� ���� ������ �ø��ϴ�">������ ���ư���</a></p>����</h3>
			<h6>
				<p>����� : ������ ����� ���� ����� ���� ���� ���������� ���� ����� �� â�� ������ ���� ������ ����</p>
				<p>������� : ������ �о߿� ��ɰ� ���� �ִ� ��, �����а� ����(����)��, ���úо� �����</p>
				<p>����� : 6~10���� / ��ⱳ�� �</p>
			</h6>
			<table class="intable" cellspacing="0" cellpadding="0" summary="�оߺ� �������� �ȳ��Դϴ�">
				<caption>�оߺ� �������� �ȳ�</caption>
				<colgroup><col width="150"><col width="*"><col width="180"><col width="180"><col width="140"></colgroup>
				<tr>
					<th id="v_category">�о�</th>
					<th id="v_course">������</th>
					<th id="v_schedule">��������</th>
					<th id="v_learning">�����Ⱓ</th>
					<th id="v_people" class="noborder">�����ο�</th>
				</tr>
				<tr>
					<th name="v_category" rowspan="5" class="notweight">���.����</th>
					<td name="v_course">VFX (Ư������)</td>
					<td name="v_schedule">''12.3~11</td>
					<td name="v_learning">9����</td>
					<td name="v_people">15</td>
				</tr>
				<tr>
					<td name="v_course">��� �׷���</td>
					<td name="v_schedule">''12.3~11</td>
					<td name="v_learning">9����</td>
					<td name="v_people">15</td>
				</tr>
				<tr>
					<td name="v_course">������ ��������</td>
					<td name="v_schedule">''12.3~9/9~12</td>
					<td name="v_learning">6/4����</td>
					<td name="v_people">30</td>
				</tr>
				<tr>
					<td name="v_course">������ ��������</td>
					<td name="v_schedule">''12.3~9</td>
					<td name="v_learning">6����</td>
					<td name="v_people">10</td>
				</tr>
				<tr>
					<td colspan="3">�� ��</td>
					<td name="v_people">70</td>
				</tr>
				<tr>
					<th name="v_category" rowspan="5" class="notweight">����</th>
					<td name="v_course">���ӵ�����(��ȹ)</td>
					<td name="v_schedule">''12.3~12</td>
					<td name="v_learning">10����</td>
					<td name="v_people">15</td>
				</tr>
				<tr>
					<td name="v_course">�������α׷�</td>
					<td name="v_schedule">''12.3~12</td>
					<td name="v_learning">10����</td>
					<td name="v_people">13</td>
				</tr>
				<tr>
					<td name="v_course">���ӱ׷���</td>
					<td name="v_schedule">''12.3~12</td>
					<td name="v_learning">10����</td>
					<td name="v_people">18</td>
				</tr>
				<tr>
					<td name="v_course">���� ������Ʈ</td>
					<td name="v_schedule">''12.3~12</td>
					<td name="v_learning">10����</td>
					<td name="v_people">19</td>
				</tr>
				<tr>
					<td colspan="3">�� ��</td>
					<td>65</td>
				</tr>
				<tr>
					<th name="v_category" name="v_category" class="notweight">��ȹ.â��</th>
					<td name="v_course">������ ��ȹâ��</td>
					<td name="v_schedule">''12.3~12</td>
					<td name="v_learning">10����</td>
					<td name="v_people">20</td>
				</tr>
				<tr>
					<th name="v_category" class="notweight">����Ͻ�</th>
					<td name="v_course">���������� ����Ͻ�</td>
					<td name="v_schedule">''12.3~11</td>
					<td name="v_learning">9����</td>
					<td name="v_people">15</td>
				</tr>
				<tr>
					<th></th>
					<td colspan="3">�� ��</td>
					<td>35</td>
				</tr>
				<tr>
					<th>�� �� ��</th>
					<td colspan="3"></td>
					<td>170</td>
				</tr>
			</table>
			<h3 id="skip02"><p><img src="/images/2012/common/icon/icon_skip_up.gif" alt="������ ���ư���"><a href="#" tabindex="182" title="���� ȭ����ġ�� ���� ������ �ø��ϴ�">������ ���ư���</a></p>�����</h3>
			<h6>
				<p>���� �ְ��� ���������� Ȱ���� ������ ���� ���� ���� ���� ����</p>
				<p>�оߺ� �����䱸�� ����, Ʈ���� �м��� ���� ������ ���� ���� �߽��� �������� �</p>
				<p>�������� ��������� ��Ʈ�� ������ ���� ��ǰ�� �������� ����</p>
				<p>ǳ���� ���� ����� ���� ������ ������ �������� ���� �������� Ȱ�� ���� ���� ����</p>
				<p>ö���� ���� ������ ���� ���� ȿ�� �� ���� ������ ����</p>
			</h6>
			<h3 id="skip03"><p><img src="/images/2012/common/icon/icon_skip_up.gif" alt="������ ���ư���"><a href="#" tabindex="183" title="���� ȭ����ġ�� ���� ������ �ø��ϴ�">������ ���ư���</a></p>����</h3>
			<div class="outline">
				<table class="stepbox" cellspacing="0" cellpadding="0" summary="� �����Դϴ�">
					<colgroup><col width="120"><col width="40"><col width="120"><col width="40"><col width="120"><col width="40"><col width="120"><col width="40"><col width="120"><col width="40"><col width="120"></colgroup>
					<tr>
						<td class="inbox">���� �����䱸����</td>
						<td><img src="/images/2012/sub/page7/arrow.gif" alt="arrow"></td>
						<td class="inbox">�������� ����</td>
						<td><img src="/images/2012/sub/page7/arrow.gif" alt="arrow"></td>
						<td class="inbox">������û/����<br>(1~2��)</td>
						<td><img src="/images/2012/sub/page7/arrow.gif" alt="arrow"></td>
						<td class="inbox">���������<br>(3~11��)</td>
						<td><img src="/images/2012/sub/page7/arrow.gif" alt="arrow"></td>
						<td class="inbox">����������<br>(12��)</td>
						<td><img src="/images/2012/sub/page7/arrow.gif" alt="arrow"></td>
						<td class="inbox">�������</td>
					</tr>
				</table>
				<p>���������� ������ ������ �Ϻ� ���̰� �ֽ��ϴ�.</p>
			</div>
			<br>
			<h6>
				<p class="bolder">���� ��û/����</p>
					<span>- ��û��� : �¶��� ��û / <a href="http://edu.kocca.or.kr" tabindex="184" target="_blank" title="�ѱ���������ī���� �ٷΰ��� (��â)">http://edu.kocca.or.kr</a></span><br>
					<span>- ���߱��� : �����ɻ� �� �����ɻ縦 ���� ������ �ڰݱ��ؿ� ������ ������ ����</span>
					<br><br>
				<p class="bolder">�������� �</p>
					<span>- ������� : ���� �� �ǽ�����, �������� �ǽ����� �� ������ Ŀ��ŧ���� ���� ���� ���� �߽��� ���� �</span><br>
					<span>- �������� : ���� �ǹ�������, �а� ������ ��</span><br>
					<span>- �����ý��� �� ��� : ���� �ְ��� ���� ��� Ȱ���� ������ ���� �ǹ� �߽��� ���� �</span><br>
					<span>- ������� : �ѱ���������ī���� ���ǽ�(�� ���ȸ�� ����)</span>
					<br><br>
				<p class="bolder">���� Ư��</p>
				<table class="intable" cellspacing="0" cellpadding="0" summary="���� Ư�� �ȳ�">
				<caption>���� Ư�� �ȳ�ǥ</caption>
				<colgroup><col width="200"><col width="*"></colgroup>
					<tr>
						<th>������</th>
						<th class="noborder">����</th>
					</tr>
					<tr>
						<td id="v_cate1" class="noborder">����</td>
						<td name="v_cate1" class="leftpadding">
							- �� 316,000�� ���б� ����(����Ͻ� ���� ����)<br>
							- �ѱ������������ �������α׷� �켱 ���� ��ȸ ����<br>
								&nbsp;&nbsp;�� ���̹���������ī����, �������� �������� ��<br>
							- ���� ���۷��� �� ����ȸ ���� ����
						</td>
					</tr>
					<tr>
						<td id="v_cate2" class="noborder">��ȹ��â��</td>
						<td name="v_cate2" class="leftpadding">- ������Ʈ �ϼ�ȭ�� ���� ���� ����, ������Ȱ�� ��ȸ Ȯ�� ����</td>
					</tr>
					<tr>
						<td id="v_cate3" class="noborder">���������� ����Ͻ�</td>
						<td name="v_cate3" class="leftpadding">- ���� �� ����ڿ��� ���úо� ����, ���Ͻ� ��ȸ ����</td>
					</tr>
				</table>
			</h6>
			<h3 id="skip04"><p><img src="/images/2012/common/icon/icon_skip_up.gif" alt="������ ���ư���"><a href="#" tabindex="185" title="���� ȭ����ġ�� ���� ������ �ø��ϴ�">������ ���ư���</a></p>�������� ����</h3>
			<h6>
				<p>��ǥ : 02-2161-0072</p>
			</h6--><br>
			<img src="/images/2012/sub/page7/cha_01.gif"/>
			<img src="/images/2012/sub/page7/cha_02.gif"/>
			<img src="/images/2012/sub/page7/cha_03.gif"/>
		</div>
	</div>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>