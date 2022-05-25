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

    box.put("title_str", "��ī���̼Ұ� - ��ī���̼Ұ�");
%>
        
<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- container-new ���� //-->
<div id="container-new">

        <div id="mainMenu">
            <!-- ��ī���� �Ұ� -->
            <ul class="location">
                <li>Ȩ</li>
                <li>��ī���̼Ұ�</li>
                <li>��ī���̼Ұ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul style="z-index: 1;">
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Vision" class="active">��ī���̼Ұ�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage" >�λ縻</a></li>
                        <!-- 2015-03-18 ����
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility">�ü��Ұ�</a></li>
                        //-->
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu">������� �ȳ�</a></li>
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
        
<!--2015-01-08 ���� ����
            <div class="introCategory">
                <ul>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage">������� �λ縻</a></li>
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
            <h2 class="subTit">��ī���� �Ұ�<!--<img src="/images/2013/introduce/academi_title.gif" alt="��ī���̼Ұ�" />//--></h2>
            <div id="subCont">
                <div class="intro">
                    <p class="aboutTxt" style="margin-left:60px;">
                        �������о� ����缺�� �߽ɿ� �ִ� �ѱ���������ī���̴� �̷� ������ ����� ������ ������ �о� 
                        �ٽ����縦 �缺�ϰ� �ֽ��ϴ�. ������ ���� �缺, <br />������ ���� �米��, �¶��� ��������� ���� ������
                        ���������� �ߵ��� ���� ���°� �ֽ��ϴ�.</p>
                    <div class="aboutImg">
                        <img src="/images/2013/introduce/intro_gaphic5.jpg" alt="����������缺����, �����������米��,�¶������������ ������ ���� ����Ͽ� ���������·� ����ȭ ��Ų �̹���" />
                        <div class="blind">
                            <dl>
                                <dt>����������缺����</dt>
                                <dd>
                                    ������ â������ ���ݻ��, ��������/���������� ����
                                </dd>
                            </dl>
                            <dl>
                                <dt>�¶����������</dt>
                                <dd>
                                    ����/��ۿ���/��ȭ�о� ���̾���������ī���� � http://edu.kocca.or.kr
                                </dd>
                            </dl>
                            <dl>
                                <dt>������ ���� �米��</dt>
                                <dd>
                                    â�� ������ Ŭ����,�������� ������ �ؿܿ���, ��ȹ���ε༭�缺 ����
                                </dd>
                            </dl>
                        </div>
                        <!-- //blind -->
                    </div>
                    <!-- //aboutImg -->
                </div>
                <!-- //intro -->
            </div>
            <!-- //#subCont -->
        </div>
        <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->
        
<%@ include file="/learn/user/2013/portal/include/footer.html"%>