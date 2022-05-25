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

    box.put("title_str", "â������ �缺��� - ������� �ȳ� - ��ī���̼Ұ�");
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
					<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=3"><img src="/images/2013/introduce/tabbs3_off.jpg" alt="�¶��� ����" /></a></li>
					<li><a href="#"><img src="/images/2013/introduce/tabbs4_on.jpg" alt="â������ �缺���" /></a></li>
				</ul>
				<h3 class="blind">������ ���� �缺����</h3>
				
				<h4 class="subTit_h4_gray">��� ����</h4>
				<div class="academiSec gray">
					<ul>
						<li>
							�̷� ������ ����� �̲�� ���� â������ �缺�� ����, â�� �о��� ��� ������(����)�� ���� ������ ���丵�� �����Ͽ�, û�� ������<br />
							â�۴ɷ� ���߰� ���ڸ� â��<br />
							- ������ â�Ǽ��� ���丵 ��ȹ/��� ������ ������ ���÷������������ �����Ͽ� ����<br />
							- �÷��� ����� ���� ������(����)�� â�Ǳ�����(��Ƽ)�� ��Ī, ��Ⱓ�� ������ �Ʒð� �߽� â���� ���� ���� (9����~10����)<br /><br />
							&nbsp;&nbsp;�� â�Ǳ�����(��Ƽ)�� �÷��� ����� �ٷΰ���� ü���ϰ�, ����� �÷��� ����� �����ϴ� �پ��� ������Ʈ��  ���Ͻ����� ����<br />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(�ſ� �� 100�鸸�� ����, 4�뺸�� ����)<br />
							&nbsp;&nbsp;�� �÷��� ����� ���並 ���� ���λ��, ��� �˼�, â��/â�� ���丵 �� �پ��� ��°�� ��Ī
						</li>
					</ul>
				</div>

				<h4 class="subTit_h4_gray">�������</h4>
				<div class="tableWrap2">
					<table class="layoutTable2 space3">
						<colgroup>
							<col width="22%"/>
							<col width="*"/>
						</colgroup>
						<tr>
							<th scope="col" class="thtit">����</th>
							<th scope="col">�ڰ�</th>
						</tr>
						<tr>
							<td class="tdtit">�÷��� ���</td>
							<td>
								<ul>
									<li>������ â���о��� ������ ���丵/�Ʒ��� ������ ���� 3�� �̻��� ����</li>
								</ul>
							</td>
						</tr>
						<tr>
							<td class="tdtit">����</td>
							<td>
								<ul>
									<li>�ش�о� 10�� �̻��� ����� ���� ������ (�÷��� ������� ����)</li>
								</ul>
							</td>
						</tr>
						<tr>
							<td class="tdtit">â�Ǳ�����(��Ƽ)</td>
							<td>
								<ul>
									<li>â���� ������ �Ҿ��� ���� ��������� (�� 18��~35���� â�ۺо� ���� ����ڸ� ����/������ ���� ����)</li>
								</ul>
							</td>
						</tr>
					</table>
				</div>
				<!-- //tableWrap2 -->

				<h4 class="subTit_h4_gray">�������� �� ��������</h4>
				<div class="academiSec gray">
					<ul>
						<li>2014�⵵ ������ â������ ���ݻ���� ��, ���Ӱ� ���۵˴ϴ�.</li>
						<li>
							�������� : �÷��� ��� �������� > �÷��� ��� ���� > ����� ���� Ȯ�� �� â�Ǳ�����(��Ƽ)���� > �ߴ�� �� ������ ���丵 �ǽ�<br />
							<span>�÷������ : 2014�� �� 7�� ��� ����, ����� �� 4,5��� ���� ��������</span>
							<span>��      �� :���� 1�δ� 100������ Ȱ���� �÷��� ������� ����</span>
							<span>â�Ǳ�����(��Ƽ) : �÷������ �� ����� ��ȣ����(�ٷΰ��)�� �ΰ�, â��Ȱ���� �ʿ��� �ǹ��� �����ϵ��� ����<br />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							(�ſ� �� 100������ �޿��� �÷��� ����� ����, 4�뺸�� ����)</span>
						</li>
					</ul>
				</div>

				<h4 class="subTit_h4_gray">��û���</h4>
				<div class="academiSec gray">
					<ul>
						<li>
							�ѱ������������ Ȩ������(<a href="http://www.kocca.kr" target="_blank">www.kocca.kr</a>) ����, ���ȸ�� ����, �α��� �Ŀ� �ش� ��� ��û����� �ٿ�޾� �ۼ� ��<br />
							÷�μ����� �Բ� �¶��� ������û ����
						</li>
					</ul>
				</div>

				<h4 class="subTit_h4_gray">����ó</h4>
				<div class="academiSec gray">
					<ul>
						<li>�ѱ������������ ������â�������� T : 02-2161-0072, 1566-1114</li>
					</ul>
				</div>

			</div>
			<!-- //#subCont -->
			
		</div>
		<!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>