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


<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
//�Էµ� ���� ����
function insert_check() {    
    document.form1.action = "/servlet/controller.homepage.HomePageContactServlet";
    document.form1.p_process.value = "insertContactUs";
    document.form1.submit();
}

//-->
</script>
<!-- ��ũ��Ʈ�������� -->

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
				<li><img src="/images/2012/sub/page7/tabmenu/contactus01on.png" alt="��ü ���� ��û"></li>
				<li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactetc" tabindex="170" title="������,�������,�Ϲݹ��Ǹ� �� �� �ֽ��ϴ�"><img src="/images/2012/sub/page7/tabmenu/contactus02.png" alt="���� �� ����"></a></li>
			</ul>
		</div>
		<div class="grouptip">
			<h5>
			�ѱ������������ ���̹���ī���̿����� ���,���,�б� ������� ��ü�������񽺸� �����ϰ� �ֽ��ϴ�.<br>
			����, ��ȭ, ��� �о��� 135�� ������ ����� �����˴ϴ�.<br>
			��������� ���������� ��ȯ���� Ȱ��ǰ�, �б������� ���� ���� �� �α����� ���� ���·� �̷������ �ֽ��ϴ�.<br>
			��ü�������񽺴� ��ü ���̹��������� �����ص帮�� ü������ ������ ���� ��������� ���� �������� �����˴ϴ�.<br>
			���̹���������ī���� �Ұ� �ڷḦ ���� �� �ڼ��� ���� Ȯ�� �����ϸ�, �ñ��Ͻ� ���� �Ʒ� ��ȣ�� �������� �����ֽñ� �ٶ��ϴ�.
			</h5>
			<a href="/upload/contactus/kocca_cyber_academy_2013_guide.pdf" target="_blank" tabindex="171" title="(��â) ���̹���������ī���� �Ұ�(������� ����) ������ �ٿ�ε� �մϴ�"><img src="/images/2012/sub/page7/btn_groupguide.gif" alt="��ü�н��ȳ��� �ٿ�ε�"></a>
			<h5>
			���̹���������ī���� ������� : <b>02-2161-0077 / <a href="mailto::edu_kocca@naver.com" alt="edu_kocca@naver.com">edu_kocca@naver.com</a></b>
			</h5>
		</div>
		
		<form id="groupinsert" name="form1" method="post" enctype="multipart/form-data" action="/servlet/controller.homepage.HomePageContactServlet">
   		<input type = "hidden" name="p_process"    value = "insertContactUs">
		<div class="namefont"><h3>�⺻�����Է�</h3><p><img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�">�� �ʼ� �Է� �׸��Դϴ�.</p></div>
		<div class="contactform contactformtopcolor1">
			<table class="insertform" cellpadding="0" cellspacing="0" summary="��ü������û�� �⺻������ �Է��մϴ�">
				<colgroup><col width="160"><col width="120"><col width="290"><col width="120"><col width="*"></colgroup>
				<tr>
					<th>��ü�� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td colspan="4"><input type="text" name="company" tabindex="173" title="��ü���� �Է����ּ���" style="width:220px;"></td>
				</tr>
				<tr>
					<th>�ּ� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td colspan="4"><input type="text" name="addr" tabindex="174" title="��ü �������� �Է����ּ���" style="width:395px;"></td>
				</tr>
				<tr>
					<th rowspan="2">�����</th>
					<td class="addtitle">�μ�/����</td>
					<td><input type="text" name="com_dept" class="unqueryform" tabindex="175" title="�μ��� ������ �Է����ּ���" style="width:220px;"></td>
					<td class="addtitle">������ȭ <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></td>
					<td>
						<dl class="colbath">
							<dd>
								<select class="select" name="tel1" tabindex="176" title="������ȣ�� �������ּ���">
									<option value="">������ȣ ����</option>
									<option value="070">070</option>
									<option value="02">02</option>
									<option value="031">031</option>
									<option value="032">032</option>
									<option value="033">033</option>
									<option value="041">041</option>
									<option value="042">042</option>
									<option value="043">043</option>
									<option value="051">051</option>
									<option value="052">052</option>
									<option value="053">053</option>
									<option value="054">054</option>
									<option value="055">055</option>
									<option value="061">061</option>
									<option value="062">062</option>
									<option value="063">063</option>
									<option value="064">064</option>
								</select>
							</dd>
							<dd class="hyphen">-</ddname="tel1" >
							<dd><input type="text" name="tel2" tabindex="177" title="������ȭ ��� ��ȣ�� �Է����ּ���" style="width:30px; text-align:center;" maxlength="4"></dd>
							<dd class="hyphen">-</dd>
							<dd><input type="text" name="tel3" tabindex="178" title="������ȭ �� 4�ڸ� ��ȣ�� �Է����ּ���" style="width:30px; text-align:center;" maxlength="4"></dd>
						</dl>
					</td>
				</tr>
				<tr>
					<td class="addtitle">���� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></td>
					<td><input type="text" name="com_name" tabindex="179" title="����� �Ǹ��� �Է����ּ���" style="width:220px;"></td>
					<td class="addtitle">����Ϲ�ȣ <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></td>
					<td>
						<dl class="colbath">
							<dd>
								<select class="select" name="mobile1" tabindex="180" title="�̵���ȣ�� �������ּ���">
									<option value="">�̵���ȣ ����</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</dd>
							<dd class="hyphen">-</dd>
							<dd><input type="text" name="mobile2" tabindex="181" title="����� ��� ��ȣ�� �Է����ּ���" style="width:30px; text-align:center;" maxlength="4"></dd>
							<dd class="hyphen">-</dd>
							<dd><input type="text" name="mobile3" tabindex="182" title="����� �� 4�ڸ� ��ȣ�� �Է����ּ���" style="width:30px; text-align:center;" maxlength="4"></dd>
						</dl>
					</td>
				</tr>
				<tr>
					<th>�̸��� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td colspan="2">
						<dl class="colbath">
							<dd><input type="text" name="email1" tabindex="183" style="width:100px;" title="�̸��� ���̵� �Է����ּ���"></dd>
							<dd class="hyphen">@</dd>
							<dd><input type="text" name="email2" id="inmeildomain" tabindex="184" style="width:130px;" title="�̸��� �������� �Է����ּ���"></dd>
							<dd>
								<select id="selectmailtype" class="select" tabindex="185" title="�����Է� �Ǵ� ���ֻ��Ǵ� ���� ��ȣ�� �������ּ���">
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
					<td class="addtitle">Ȩ������</td>
					<td>
						<input type="text" name="homepage" class="unqueryform" tabindex="186" title="Ȩ�������� �ִٸ� Ȩ������ �ּҸ� �Է����ּ���" value="http://" style="width:260px;">
					</td>
				</tr>
			</table>
		</div>
		
		<div class="namefont"><h3>�н������Է�</h3><p><img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�">�� �ʼ� �Է� �׸��Դϴ�.</p></div>
		<div class="contactform contactformtopcolor2">
			<table class="insertform" cellpadding="0" cellspacing="0" summary="��ü������û�� �н������� �Է��մϴ�">
				<colgroup><col width="160"><col width="270"><col width="160"><col width="*"></colgroup>
				<tr>
					<th>��û�о� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td colspan="3">
						<input type="radio" name="category" value="1" class="radio" id="boardcastiing" tabindex="191" title="��ۺо߸� ��û�մϴ�"><label for="boardcastiing" class="label" title="��ۺо߸� ��û�մϴ�">���</label>
						<input type="radio" name="category" value="2" class="radio" id="game" tabindex="192" title="���Ӻо߸� ��û�մϴ�"><label for="game" class="label" title="���Ӻо߸� ��û�մϴ�">����</label>
						<input type="radio" name="category" value="3" class="radio" id="culture" tabindex="193" title="��ȭ�о߸� ��û�մϴ�"><label for="culture" class="label" title="��ȭ�о߸� ��û�մϴ�">��ȭ</label>
					</td>
				</tr>
				<tr>
					<th>������û�Ⱓ <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td>
						<dl class="colbath">
							<dd><input type="text" name="edustart" tabindex="194" id="startdate" title="������û�������� �������ּ���" style="width:80px; text-align:center;"></dd>
							<dd class="hyphen">~</dd>
							<dd><input type="text" name="eduend" tabindex="195" id="enddate" title="������û�������� �������ּ���" style="width:80px; text-align:center;"></dd>
						</dl>
					</td>
					<td class="addtitle">�н������� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></td>
					<td><input type="text" name="edustartday" tabindex="196" id="learningstart" title="�н��������� �������ּ���" style="width:80px; text-align:center;"></td>
				</tr>
				<tr>
					<th>�н��Ⱓ <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td>
						<select class="select" name="eduperiod" tabindex="197" title="�����Ⱓ�� �������ּ���">
							<option value="1">1����</option>
							<option value="2">2����</option>
							<option value="3">3����</option>
						</select>
					</td>
					<td class="addtitle">�����԰��ο� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></td>
					<td>
						<dl class="colbath">
							<dd><input type="text" name="edustudent" tabindex="198" title="�����԰��ο��� �Է����ּ���" maxlength="5" style="width:40px; text-align:center;"></dd>
							<dd class="hyphen">��</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<th>������������ <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td colspan="3">
						<dl class="colbath">
							<dd class="hyphen">1�� �ִ�</dd>
							<dd>
								<select class="select" name="edusubjcnt" tabindex="199" title="�����Ⱓ�� �������ּ���">
									<option value="1">1�� ����</option>
									<option value="2">2�� ����</option>
									<option value="3">3�� ����</option>
								</select>
							</dd>
							<dd class="hyphen">�� ������ �� �ֵ��� �����մϴ�</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<th>LOGO���ε� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td colspan="3">
						<input type="FILE" name="p_file" tabindex="200" title="ASP���� ���� ���� ��ü�� �ΰ� ���ε����ּ���" style="width:350px;">
						<p>���Բ��� �Ҽ��Ͻ� ��ü(���,�б�,���)�� �ΰ��̹���(gif,jpg,png ��)�� ������ּ���.</p>
					</td>
				</tr>
				
				<tr>
					<th>��û���� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td colspan="3" id="requestbox">
						<input type="checkbox" id="allcourse" name="apply_gubun" value="1" tabindex="201" class="checkbox" title="��ü������ ��û�մϴ�"><label for="allcourse" class="label" title="��ü������ ��û�մϴ�">��ü����</label>
						<input type="checkbox" id="boardcastcourse" name="apply_gubun" value="2" tabindex="202" class="checkbox" title="��ü������ ��û�մϴ�"><label for="boardcastcourse" class="label" title="��ü������ ��û�մϴ�">��ۺо� ����</label>
						<input type="checkbox" id="gamecourse" name="apply_gubun" value="3" tabindex="203" class="checkbox" title="��ü������ ��û�մϴ�"><label for="gamecourse" class="label" title="��ü������ ��û�մϴ�">���Ӻо� ����</label>
						<input type="checkbox" id="culturecourse" name="apply_gubun" value="4" tabindex="204" class="checkbox" title="��ü������ ��û�մϴ�"><label for="culturecourse" class="label" title="��ü������ ��û�մϴ�">��ȭ�о� ����</label>
						<br>
						<textarea name="apply_subj" title="���� �߰� �ʿ� �� �������� �Է����ּ���" tabindex="205" style="width:700px;"></textarea>
					</td>
				</tr>
				
				<tr>
					<th>��Ÿ����</th>
					<td colspan="3"><textarea id="addcourse" name="etc" title="�� �Է³��� �� ���ǻ����� �ִٸ� �Է����ּ���" tabindex="206" style="width:700px;"></textarea></td>
				</tr>
				<tr>
					<th>��û������ <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td colspan="3">
						<dl class="colbath">
							<dd class="hyphen">http://</dd>
							<dd><input type="text" name="domain" tabindex="207" title="���� Ȩ�������� �̿��� ������ �̸��� �Է����ּ���" style="width:120px;"></dd>
							<dd class="hyphen">.edukocca.or.kr</dd>
						</dl>
					</td>
				</tr>
			</table>
		</div>
		<div class="contactbtm">
		<!-- <a href='javascript:insert_check()'><img src="/images/2012/sub/page7/btn_request.gif" alt="�� �������� ��û�մϴ�"></a> -->
		<input type="image" tabindex="208" src="/images/2012/sub/page7/btn_request.gif" alt="�� �������� ��û�մϴ�"> 
		</div>
		</form>
	</div>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
