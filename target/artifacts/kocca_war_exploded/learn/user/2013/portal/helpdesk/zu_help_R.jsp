<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    box.put("title_str", "�н�ȯ�� �׽�Ʈ - �н����� - ������");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- container-new ���� //-->
<div id="container-new">

        <div id="mainMenu">
        <!-- �н����� -->
            <ul class="location">
                <li>Ȩ</li>
                <li>������</li>
                <li>�н����� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul style="z-index: 1;">
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=HelpHome" class="active">�н�����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">�����ϴ� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
<!--
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp" >�н�ȯ�� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelpSWDown">����Ʈ����ٿ�ε�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp">����� �� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome">�̿�ȳ�</a></li>
-->
                    </ul>
                </li>
            </ul>
            <!-- //�н����� -->
            <div class="introCategory">
                <ul>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=HelpHome">�н� ���̵�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp"><strong><u>�н�ȯ�� ����</u></strong></a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelpSWDown">����Ʈ���� �ٿ�ε�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp">����� �� ����</a></li>
<!--
                    <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
                    <li><a href="#">��������</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome">�̿�ȳ�</a></li>
-->                </ul>
            </div>
            <!-- //������ο� -->
        </div>
        <!-- //#mainMenu -->

        <!-- ������ ���� ���� -->
        <div id="contents">
        <h2 class="subTit">�н�ȯ�� ����<!--<img src="/images/2013/support/envistudy_title.gif" alt="�н�ȯ�� ����" />//--></h2>

            <div id="subCont">
                <!-- �ǻ���
                <ul class="tabCus">
                    <li><a href="#"><img src="/images/2013/support/tabenvi1_on.jpg" alt="�н�ȯ�� �׽�Ʈ" /></a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelpSWDown"><img src="/images/2013/support/tabenvi2_off.jpg" alt="��ƮƮ���� �ٿ�ε�" /></a></li>
                </ul>
                -->

                <div class="noticBox">
                    ������ ����� ������ �����ôٸ�, ���� ��� ���� ���ͳ� ȸ���� ����ӵ��� Ȯ���� �ּ���.<br />
                    ȸ�� �ӵ� �׽�Ʈ�� �Ϸ翡 20~30�� ������ �ΰ� �ݵ�� �������� ���ּž� ��Ȯ�� �ӵ��� �� �� �ֽ��ϴ�.
                </div>

                <ol class="imgOlList">
                    <li><img src="/images/2013/support/envi_step1.jpg" alt="Step 01" /></li>
                    <li><img src="/images/2013/support/envi_step2.jpg" alt="Step 02" /></li>
                    <li><img src="/images/2013/support/envi_step3.jpg" alt="Step 03" /></li>
                </ol>

                <ol class="txtOlList">
                    <li><span>Step 01.</span> �ѱ�����ȭ����� ����Ʈ�� �����մϴ�. ���� �� ��� �޴����� ǰ�������׽�Ʈ�����ͳ� �ӵ� �Ǵ� ���ο� ���ͳ� �ӵ��� �����մϴ�. (<a href="http://speed.nia.or.kr/" target="_blank">�ѱ�����ȭ����� �ٷΰ���</a>)</li>
                    <li><span>Step 02.</span> ���� ���� ��� ����ȭ�鿡�� ����� �а� ���� �� �ӵ� ������ ������ ���Ѵٸ�, ����� ���� �� ������ Ŭ���մϴ�.</li>
                    <li><span>Step 03.</span> ������ ó�� �õ��ϴ� ��� ������ ���� �� �������� �޽����� ���ɴϴ�. �׽�Ʈ ������ ���ؼ��� "Ȯ��"��ư�� Ŭ���Ͽ� ��ġ���α׷��� �ٿ�ε��մϴ�.</li>
                </ol>

                <ol class="imgOlList">
                    <li><img src="/images/2013/support/envi_step4.jpg" alt="Step 04" /></li>
                    <li><img src="/images/2013/support/envi_step5.jpg" alt="Step 05" /></li>
                    <li><img src="/images/2013/support/envi_step6.jpg" alt="Step 06" /></li>
                </ol>

                <ol class="txtOlList">
                    <li><span>Step 04.</span>�ٿ�ε尡 �Ϸ�Ǹ�, �� �̹����� ���� "����� ���� ��Ʈ��" ������ ���ɴϴ�. �� �� "��"�� �����Ͽ�, ���α׷� ��ġ�� �����մϴ�.</li>
                    <li><span>Step 05.</span>��ġ�� ���������� �����ϱ� ����, "Next"��ư�� ��ġ������ ȭ���� ������ ������ Ŭ���մϴ�.</li>
                    <li><span>Step 06.</span>��ġ ȭ�鿡�� PCȯ�濡 ���� �� 1~3�� ������ �ҿ�˴ϴ�.</li>
                </ol>

                <ol class="imgOlList">
                    <li><img src="/images/2013/support/envi_step7.jpg" alt="Step 07" /></li>
                    <li><img src="/images/2013/support/envi_step8.jpg" alt="Step 08" /></li>
                    <li><img src="/images/2013/support/envi_step9.jpg" alt="Step 09" /></li>
                </ol>

                <ol class="txtOlList">
                    <li><span>Step 07.</span>��ġ�� �Ϸ�Ǹ�, "Close"��ư�� Ŭ���Ͽ� �����츦 �ݾ��ݴϴ�.</li>
                    <li><span>Step 08.</span>���α׷� ��ġ�� �Ϸ� �� ȸ������ ���� �̿��ϴ� ȸ����, ���� PC�� �̿��ϴ� ��ġ�� �ְ����¸� �ǹٸ��� ������ �� "����"��ư�� Ŭ���մϴ�.</li>
                    <li><span>Step 09.</span>"����"��ư�� Ŭ���Ͽ� ������ �����մϴ�. (��Ȥ "���� ���� �̿��ڰ� �����ϴ�" ��� �޼����� ������ ��찡 �ֽ��ϴ�. �̷��� ��쿡�� �� �� �� �ٽ� �����մϴ�.)</li>
                    <li><span>Step 10.</span>�������� �� 1~3�� ���� �ҿ�Ǹ�, ���ͳ� �ӵ� ������ �Ϸ�˴ϴ�. �ٿ�ε� �ӵ��� 1.00 Mbps �̸��� ��� �¶��� ������ ������ ����� �� �ֽ��ϴ�.</li>
                </ol>

            </div>
            <!-- //#subCont -->



        </div>
        <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>