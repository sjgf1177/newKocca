<%
//**********************************************************
//  1. ��      ��: ����������޹�ħ
//  2. ���α׷��� : zu_Personal.jsp
//  3. ��      ��: ����������޹�ħ
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 
//  7. ��      ��:
//***********************************************************
%>

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
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > ��ī���� �Ұ� > ������� > <u>���� ��������</u></td>
			</tr>
		</table>
		<div class="concept">
			<div>
				<img src="/images/2012/sub/page7/title/business.gif" alt="��������ȳ�">
			</div>
		</div><br>
		<ul class="category">
			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=1" tabindex="171" title="������ ����缺 ������ ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business01.png" alt="������ ����缺 ����"></a></li>
			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=2" tabindex="172" title="������ ���� �米���� ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business02.png" alt="����� ���� �米��"></a></li>
			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=3" tabindex="173" title="�¶��� ������ ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business03.png" alt="�¶��� ����"></a></li>
<!--			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=4" tabindex="174" title="���� ���������� ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business04on.png" alt="���� ��������"></a></li>-->
<!--			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=5" tabindex="175" title="3D��ü ������ �����η� �缺�� ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business05.png" alt="3D��ü ������ �����η� �缺"></a></li>-->
			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=6" tabindex="176" title="â������ �缺����� ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business06.png" alt="â������ �缺���"></a></li>
<!--			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=7" tabindex="177" title="��� ���ε༭ ���� ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business07.png" alt="��� ���ε༭ ����"></a></li>-->
<!--			<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=8" tabindex="178" title="���ӱ��� ����ڰ� ������ ���� �Ұ��մϴ�"><img src="/images/2012/sub/page7/tabmenu/business08.png" alt="���ӱ��� ����ڰ� ����"></a></li>-->
		</ul>
		<div class="txtpage">
			<h1>���� ��������</h1>
			<h4>�����ڰ��������ʹ� �̱��� Apple��, Avid��, Digidesign��, ���� Quantel �� �� �ؿ� ����������� ��Ʈ�ʽ��� �����Ͽ� ������ Video/Audio �о�, HD�Կ� �� 5�� �о��� ���� �ڰ��������͸� ��ϸ� ���� �԰ݰ� ���� ü�迡 �´� ������� ���� �۷ι� ������� ���� ������ ������� �η��� �缺�ϰ� �ֽ��ϴ�.</h4>
			<br>
			<table class="intable" cellspacing="0" cellpadding="0">
				<caption>������������ �ȳ�</caption>
				<colgroup><col width="280"><col width="*"><col width="220"></colgroup>
				<tr>
					<th>������������</th>
					<th>���Ȳ</th>
					<th class="noborder">���</th>
				</tr>
				<tr>
					<th rowspan="2" class="notweight">Avid Authorized Training Partner(AATP)</th>
					<td class="leftpadding">
						- Avid �������� ����, Instructor�� ���� ���� �԰��� �������� ����<br>
						- ���� ���� �� ����ڿ� ���� �׽�Ʈ�� ���� ���� Cerificate ��� ����<br>
						- �����: Media Composer 101, 201, 202, 203, 205, 220, 324
					</td>
					<td rowspan="2" class="leftpadding">Avid(ڸ)<br>Avid ���� ������������ ����(2008��)<br>Pro school ����(2003)</td>
				</tr>
				<tr>
					<td class="leftpadding">
						- Avid ������ ����, Instructor�� ���� ���� �԰��� ����� ����<br>
						- ���� ���� �׽�Ʈ�� ���� ���� Certificate��� ����<br>
						- �����: Pro Tools 101, 110, 201, 210M, 210P
					</td>
				</tr>
				<tr>
					<th class="notweight">Apple Authorized Training Center(AATC)</th>
					<td class="leftpadding">
						- Apple �������� ����, Instructor�� ���� ���� �԰��� Final Cut Pro ����<br>
						- ���� ���� �� ����ڿ� ���� �׽�Ʈ�� ���� ���� Certificate��氡��<br>
						- �����: Final Cut Pro Level��,��
					</td>
					<td class="leftpadding">Apple(ڸ)<br>Apple���� ������������ ����(2007��)</td>
				</tr>
			</table>
		</div>
	</div>
	
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>