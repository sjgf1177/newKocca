<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.cp.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

	box.put("topmenu","7");
	box.put("submenu","7");
    
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
    
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagetitle"></td>
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > ��ī���� �Ұ� > <u>Contact Us</u></td>
			</tr>
		</table>
		<div class="concept g07">
			<div><img src="/images/2012/sub/page7/title/title_contactus.png" alt="Contact Us(����/��û�ϱ�), ��ü������û(ASP) �� ������, ������� ���� �����մϴ�"></div>
			<ul class="pagetab">
				<li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus" tabindex="170" title="��ü����(ASP)�� ��û�� �� �ֽ��ϴ�"><img src="/images/2012/sub/page7/tabmenu/contactus01.png" alt="��ü ���� ��û"></a></li>
				<li><img src="/images/2012/sub/page7/tabmenu/contactus02on.png" alt="���� �� ����"></li>
			</ul>
		</div>
		<div class="grouptip">
			<h5>�ѱ���������ī���̴� �� �������� ��� �ǰ��� �����ϰ� �赵�� �ϰڽ��ϴ�.</h5>
		</div>
		<form id="corpinsert" method="post" enctype="multipart/form-data" action="/servlet/controller.homepage.HomePageContactServlet">
   		<input type = "hidden" name="p_process"    value = "insertContactEtc">
		<div class="namefont"><h3>���� �� ���� �ۼ�</h3><p><img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�">�� �ʼ� �Է� �׸��Դϴ�.</p></div>
		<div class="contactform contactformtopcolor1">
			<table class="insertform" cellpadding="0" cellspacing="0" summary="��ü������û�� �⺻������ �Է��մϴ�">
				<colgroup><col width="160"><col width="250"><col width="160"><col width="*"></colgroup>
				<tr>
					<th>���� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td colspan="3"><input type="text" name="username" tabindex="171" title="�̸��� �Է����ּ���" style="width:160px;"></td>
				</tr>
				<tr>
					<th>����ó <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td>
						<dl class="colbath">
							<dd><input type="text" name="tel1" tabindex="172" title="������ȣ �Ǵ� �̵���ȣ�� �Է����ּ���" style="width:20px; text-align:center;" maxlength="3"></dd>
							<dd class="hyphen">-</dd>
							<dd><input type="text" name="tel2" tabindex="173" title="��� ��ȣ�� �Է����ּ���" style="width:30px; text-align:center;" maxlength="4"></dd>
							<dd class="hyphen">-</dd>
							<dd><input type="text" name="tel3" tabindex="174" title="�� 4�ڸ� ��ȣ�� �Է����ּ���" style="width:30px; text-align:center;" maxlength="4"></dd>
						</dl>
					</td>
				</tr>
				<tr>
					<th>�̸��� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td>
						<dl class="colbath">
							<dd><input type="text" name="email1" tabindex="175" style="width:100px;" title="�̸��� ���̵� �Է����ּ���"></dd>
							<dd class="hyphen">@</dd>
							<dd><input type="text" name="email2" id="inmeildomain" tabindex="176" style="width:130px;" title="�̸��� �������� �Է����ּ���"></dd>
							<dd>
								<select id="selectmailtype" class="select" tabindex="177" title="�����Է� �Ǵ� ���ֻ��Ǵ� ���� ��ȣ�� �������ּ���">
									<option>�����Է�</option>
									<option>chol.com</option>
									<option>daum.net</option>
									<option>dreamwiz.com</option>
									<option>empal.com</option>
									<option>freechal.com</option>
									<option>gmail.com</option>
									<option>hanafos.com</option>
									<option>hanmail.net</option>
									<option>hanmir.com</option>
									<option>hitel.net</option>
									<option>hotmail.com</option>
									<option>korea.com</option>
									<option>lycos.co.kr</option>
									<option>naver.com</option>
									<option>nate.com</option>
									<option>netian.com</option>
									<option>paran.com</option>
									<option>yahoo.co.kr</option>
								</select>
							</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<th>�з� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td colspan="3">
						<select class="select" name="category" tabindex="178" title="�з��� �������ּ���">
							<option value="1">�Ϲݹ���</option>
							<option value="2">�������</option>
							<option value="3">������</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>���� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td colspan="3"><input type="text" name="title" tabindex="179" title="������ �Է����ּ���" style="width:700px;"></td>
				</tr>
				<tr>
					<th>���� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td colspan="3"><textarea name="content" id="incontact" title="������ �Է����ּ���" tabindex="180" style="width:700px; height:300px;"></textarea></td>
				</tr>
				<tr>
					<th>���ø�ũ</th>
					<td colspan="3"><input type="text" name="link" class="unqueryform" tabindex="181" title="���ø�ũ�� ���� ��� ��ũ�ּҸ� �Է����ּ���" style="width:700px;" value="http://"></td>
				</tr>
				<tr>
					<th>����÷��</th>
					<td colspan="3"><input type="FILE" name ="p_file" class="unqueryform" tabindex="182" title="÷���� ������ ���� ��� ������ �����Ͽ� ������ּ���" style="width:350px;"></td>
				</tr>
			</table>
		</div>
		<div class="contactbtm"><input type="image" tabindex="183" src="/images/2012/sub/page7/btn_register.gif" alt="�� �������� ��û�մϴ�"></div>
		</form>
	</div>

<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
