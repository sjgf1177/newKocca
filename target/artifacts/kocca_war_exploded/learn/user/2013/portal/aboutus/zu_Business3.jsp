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

    box.put("title_str", "�¶��α��� - ������� �ȳ� -  ��ī���̼Ұ�");
%>
		
<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- container-new ���� //-->
<div id="container-new">

        <div id="mainMenu">
            <!-- ��ī���� �Ұ� -->
            <ul class="location">
                <li>Ȩ</li>
                <li>��ī���̼Ұ�</li>
                <li>
                    ������� �ȳ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul style="z-index: 1;">
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Vision">��ī���̼Ұ�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage">�λ縻</a></li>
                        <!-- 2015-03-18 ����
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility">�ü��Ұ�</a></li>
                        //-->
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu" class="active">������� �ȳ�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=PR">ȫ������</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=COOPER">�������±��</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus">���޹���</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Direction">���ô� ��</a></li>

<!-- 2015-01-08 �������
                        <li><a href="/servlet/controller.infomation.BriefingHomePageServlet?p_process=selectList">�����ڷ�</a></li>
-->
                    </ul>
                </li>
            </ul>
<!--2015-01-08 �������
            <div class="introCategory">
                <ul>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage">������� �λ縻</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility">�ü��Ұ�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu"><strong><u>������� �ȳ�</u></strong></a></li>
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
			<h2 class="subTit">������� �ȳ�<!--<img src="/images/2013/introduce/edubusiness_title.gif" alt="�������" />//--></h2>
			
			<div id="subCont">
				<ul class="tabCus">
					<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=1"><img src="/images/2013/introduce/tabbs1_off.jpg" alt="������ ���� �缺����" /></a></li>
					<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=2"><img src="/images/2013/introduce/tabbs2_off.jpg" alt="������ ���� �米��" /></a></li>
					<li><a href="#"><img src="/images/2013/introduce/tabbs3_on.jpg" alt="�¶��� ����" /></a></li>
					<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=4"><img src="/images/2013/introduce/tabbs4_off.jpg" alt="â������ �缺���" /></a></li>
				</ul>
				<h3 class="blind">������ ���� �缺����</h3>
				
				<h4 class="subTit_h4_gray">���̹���������ī����  http://edu.kocca.or.kr</h4>
				<div class="academiSec gray">
					<ul>
						<li> ��������� ���� �η� �� ����������, �ѱ���������ī���� ȸ�� ����� ���� ���¿� ���� ����</li>
						<li> ���԰��� �о� 131�� ���� ����</li>
						<li> �������� 199�� ���� ����</li>
						<li> �оߺ� ���� Ʃ����  Ʃ�͸� ���� ����</li>
						<li> ������ ���� ����</li>
					</ul>
				</div>

				<h4 class="subTit_h4_gray">�����о� �� ü��</h4>
				<div class="academiSec gray gimg">
					<ul>
						<li>��ɰ� ����� ����� ���ߺз�ü�� ����</li>
					</ul>
				</div>

				<h4 class="subTit_h4_gray">���� ��û/����</h4>
				<div class="academiSec gray">
					<ul>
						<li>��û��� : �¶��� ��û / http://edu.kocca.or.kr</li>
						<li>��û���� : �ѱ���������ī���� ȸ��, ��û ȸ���� ���� ����</li>
					</ul>
				</div>

				<h4 class="subTit_h4_gray">���������</h4>
				<div class="academiSec gray">
					<ul>
						<li>������� : �н��� ���� PC �Ǵ� ����Ͽ��� �¶��� �н�</li>
						<li>����� : �ſ� 2ȸ ����(1��, 15��</li>
						<li>����� : ��ۿ��� / ���� / ��ȭ������ ��ȹ, ����, ����Ͻ� �о� �� 131�� ���� � (�������� 199�� ���� �)</li>
						<li>�н��Ⱓ : ���� ������ ���� �н� 1����, ���� ������ ���� ���� 3����</li>
						<li>������� : ����</li>
					</ul>
				</div>

				<h4 class="subTit_h4_gray">��������</h4>
				<div class="academiSec gray">
					<ul>
						<li>�ѱ���������ī���� �¶��α�����<br/>Tel : 02-2161-0077</li>
					</ul>
				</div>
				
			</div>
			<!-- //#subCont -->
			
		</div>
		<!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->
		
<%@ include file="/learn/user/2013/portal/include/footer.html"%>