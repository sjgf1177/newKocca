<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page errorPage="/learn/library/error.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.credu.homepage.*"%>
<%@ page import="com.credu.common.*"%>
<%@ page import="com.credu.library.*"%>
<%@ page import="com.credu.system.*"%>

<%
	RequestBox box = (RequestBox) request.getAttribute("requestbox");

	box.put("title_str", "�λ縻 - ��ī���̼Ұ�");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>

<!-- container-new ���� //-->
<div id="container-new">

	<div id="mainMenu">
		<!-- ��ī���� �Ұ� -->
		<ul class="location">
			<li>Ȩ</li>
			<li>��ī���̼Ұ�</li>
			<li>�λ縻 <a href="#" class="unfold"><img
					src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
				<ul style="z-index: 1;">
					<!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
					<li><a
						href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Vision">��ī���̼Ұ�</a></li>
					<li><a
						href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage"
						class="active">�λ縻</a></li>
					<!-- 2015-03-18 ����
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility">�ü��Ұ�</a></li>
                        //-->
					<li><a
						href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu">�������
							�ȳ�</a></li>
					<li><a
						href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=PR">ȫ������</a></li>
					<li><a
						href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=COOPER">�������±��</a></li>
					<li><a
						href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus">���޹���</a></li>
					<li><a
						href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Direction">���ô�
							��</a></li>
					<!-- 2015-01-08 �������
                        <li><a href="/servlet/controller.infomation.BriefingHomePageServlet?p_process=selectList">�����ڷ�</a></li>
-->
				</ul>
			</li>
		</ul>
		<!-- 2015-01-08 ���� ����
            <div class="introCategory">
                <ul>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage"><strong><u>������� �λ縻</u></strong></a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility">�ü��Ұ�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu">������� �ȳ�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=PR">ȫ������</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=COOPER">�������±��</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Direction">���ô� ��</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus">���޹���</a></li>
                    <li><a href="/servlet/controller.infomation.BriefingHomePageServlet?p_process=selectList">�����ڷ�</a></li>
                </ul>
            </div>
-->
	</div>

	<!-- ������ ���� ���� -->
	<div id="contents">
		<h2 class="subTit">�λ縻</h2>
		<div id="subCont">
			<div class="greeting">
				<div>
					<div style="float: left">
						<img src="/images/2013/common/bar.jpg" alt="bar" />
					</div>
					<!-- <div style="padding-left: 15px; font-size: 20px; font-weight: bold">
						�ѱ���������ī���̴� â�������� �ٽɻ���� ����������� �����ϰ� �ִ�<br /> �ѱ��������������
						�����������η¾缺����Դϴ�.
					</div>
				</div>
				<div style="width: 530px; float: left; padding: 40px 16px;">

					�ѱ���������ī���̴� â�������� �ٽɻ���� ����������� �����ϰ� �ִ� �ѱ�������������� �����������η¾缺����Դϴ�. <br />
					<br />
					<br /> �ѱ���������ī���̴� �������о� �۷ι� ����缺�� ���� â��, ����, ���� �� â������� ��ǥ�ϴ� Ű���带
					�ٽɰ�ġ�� ������ ��� ���忡�� �ʿ�� �ϴ� ������ â�����縦 �缺�ϱ� ���� ����ϰ� �ֽ��ϴ�. <br />
					<br />
					<br /> �������� ������� �������� â������ â�� �ɷ¿��� ��Ե˴ϴ�. �۷ι� ������� ���� �������� ��ȹ�� ����,
					�ؿ� ���� ������ ��� ����� â���η� ������� â��Ǵ� ������, ���� â�� ������ ���� ������� ���� â�� ���縦
					�缺�ϱ� ���ؼ��� ü������ ���� Ŀ��ŧ���� ����â���� �޹�ħ���� �� �ִ� ���������� ���߾�� �մϴ�. <br />
					<br />
					<br /> �ѱ���������ī���̴� ������ �ְ��� �������� ǳ���� ���� ���Ͽ�, ���� �ְ��� ���������۱��� ������ ��������
					������ ����� �����η±���, ������ ��������, �������� �ؿܿ��� �� �¶��α������� ���� ��ϰ� ������, �̸� ����
					����������� ���� ����������μ��� ���Ұ� ��� ������ ���� �ּ��� ���ϰڽ��ϴ�. <br />
					<br />
					<br /> �������� ���Ծ��� ���ɰ� ������ ��Ź�帮�ڽ��ϴ�. <br />
					<br />
					<br /> <span style="font-weight: bold">�ѱ�������������� �ۼ���</span>
				</div> -->
				<div style="padding-left: 15px; font-size: 20px; font-weight: bold">
					�ѱ���������ī���̴�<br />�ѱ�������������� �����������η¾缺����Դϴ�.
				</div>
			</div>
			<div style="width: 530px; float: left; padding: 40px 16px;">


				<p>
					�ѱ���������ī���̴� <br />â��/����/���� ���� Ű���带 �ٽɰ�ġ��<br />������ ��� ���忡�� �ʿ��� ������
					â�����縦 �缺�ϱ� ���� ����ϰ� �ֽ��ϴ�.
				</p>
				<br /> <br /> <br />
				<p>
					�������� ������� â������ â�Ǵɷ¿��� ��Ե˴ϴ�.<br />����� â�ۿ����� ���ձ������ ���� ���縦 �缺�ϱ�
					���ؼ���<br />ü������ ���� Ŀ��ŧ���� ���������� �ʿ��մϴ�.
				</p>
				<br /> <br /> <br />
				<p>
					�ѱ���������ī���̴�<br />������ �ְ� �������� ǳ���� ���� ���Ͽ�, ���� �ְ��� ������ ���۱��� ������ ��������<br />������
					��� �����η±���, ������ ��������, �������� �ؿܿ��� �� �¶��� �������� ���� ��ϰ� �ֽ��ϴ�.<br />�̸� ����
					�۷ι� ���� �缺�� ���� ������ ��� ���� ����������μ��� ���Ұ� ��� ���࿡ �ּ��� ���ϰڽ��ϴ�.
				</p>
				<br /> <br /> <br /><p>�������� ���Ծ��� ���ɰ� ������ ��Ź�帮�ڽ��ϴ�.</p> <br /> <br /> <br />
				<span style="font-weight: bold">�ѱ�������������� �ۼ���</span>
				
				
				<div style="float: right; padding-top: 20px;">
					<img src="/images/2013/introduce/img_director.jpg"
						alt="�ѱ�������������� �ۼ��� ����" />
				</div>
			</div>
			<!-- //greeting -->

		</div>
		<!-- //#subCont -->

	</div>
	<!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>