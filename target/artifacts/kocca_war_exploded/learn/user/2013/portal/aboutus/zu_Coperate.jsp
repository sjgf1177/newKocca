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

    box.put("title_str", "�������±�� - ��ī���̼Ұ�");
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
                    �������±�� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul style="z-index: 1;">
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Vision">��ī���̼Ұ�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage"> �λ縻</a></li>
                        <!-- 2015-03-18 ����
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility">�ü��Ұ�</a></li>
                        //-->
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu">������� �ȳ�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=PR">ȫ������</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=COOPER" class="active">�������±��</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus">���޹���</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Direction">���ô� ��</a></li>
<!-- 2015-01-08 �������
                        <li><a href="/servlet/controller.infomation.BriefingHomePageServlet?p_process=selectList">�����ڷ�</a></li>
-->

                    </ul>
                </li>
            </ul>
<!-- 2015-01-08 ���� ����
            <div class="introCategory">
                <ul>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage">������� �λ縻</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility">�ü��Ұ�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu">������� �ȳ�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=PR">ȫ������</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=COOPER"><strong><u>�������±��</u></strong></a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Direction">���ô� ��</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus">���޹���</a></li>
                    <li><a href="/servlet/controller.infomation.BriefingHomePageServlet?p_process=selectList">�����ڷ�</a></li>
                </ul>
            </div>
-->
        </div>
        <div id="contents">
        <h2 class="subTit">�������±��<!--<img src="/images/2013/introduce/partner_title.gif" alt="�������±��" />//--></h2>
            <div id="subCont">
                <div class="cooperation">
                    <ul>
                        <li class="pdnone"><img src="/images/2013/introduce/contact1.gif"  alt="��ȭü��������" /></li>
                        <li><img src="/images/2013/introduce/contact2.gif"  alt="���ı�" /></li>
                        <li><img src="/images/2013/introduce/contact3.gif"  alt="�ѱ��Ҹ���ȭ������" /></li>
                        <li><img src="/images/2013/introduce/contact4.gif"  alt="�߾Ӱ����б�" /></li>
                        <li class="pdnone"><img src="/images/2013/introduce/contact5.gif"  alt="���ѹα�����" /></li>
                        <li><img src="/images/2013/introduce/contact6.gif"  alt="�λ걳��������" /></li>
                        <li><img src="/images/2013/introduce/contact7.gif"  alt="���ﱳ�뿬����" /></li>
                        <li><img src="/images/2013/introduce/contact8.gif"  alt="�߾Ӽ��Ű�������ȸ" /></li>
                        <li class="pdnone"><img src="/images/2013/introduce/contact9.gif"  alt="�ѱ���۰���" /></li>
                        <li><img src="/images/2013/introduce/contact10.gif"  alt="�λ�泲��ǥ���KNN" /></li>
                        <li><img src="/images/2013/introduce/contact11.gif"  alt="SBS" /></li>
                        <li><img src="/images/2013/introduce/contact12.gif"  alt="Ȩ&����" /></li>
                        <li class="pdnone"><img src="/images/2013/introduce/contact13.gif"  alt="HOMI" /></li>
                        <li><img src="/images/2013/introduce/contact14.gif"  alt="HD KOREA broadcasting CORP" /></li>
                        <li><img src="/images/2013/introduce/contact15.gif"  alt="�������б�" /></li>
                        <li><img src="/images/2013/introduce/contact16.gif"  alt="�ߺδ��б�" /></li>
                        <li class="pdnone"><img src="/images/2013/introduce/contact17.gif"  alt="����ȣ�������б�" /></li>
                        <li><img src="/images/2013/introduce/contact18.gif"  alt="������ϰ��а���б�" /></li>
                        <li><img src="/images/2013/introduce/contact19.gif"  alt="���Ϲ̵�����б�" /></li>
                        <li><img src="/images/2013/introduce/contact20.gif"  alt="��������ذ���б�" /></li>
                        <li class="pdnone"><img src="/images/2013/introduce/contact21.gif"  alt="õ��õ�ϰ���б�" /></li>
                        <li><img src="/images/2013/introduce/contact22.gif"  alt="�ѱ����Ӱ��а���б�" /></li>
                        <li><img src="/images/2013/introduce/contact23.gif"  alt="�Ѽ����̹����Ȱ���б�" /></li>
                        <li><img src="/images/2013/introduce/contact24.gif"  alt="�ѱ���ȭ����������б�" /></li>
                    </ul>
                </div>
                <!-- //cooperation -->
            </div>
            <!-- //#subCont -->
        </div>
        <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>