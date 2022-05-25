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

    box.put("title_str", "����� �� ���� - �н����� - ������");
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
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelpSWDown">����Ʈ����ٿ�ε�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp" class="active">����� �� ����</a></li>
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
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelpSWDown">����Ʈ����ٿ�ε�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp"><strong><u>����� �� ����</u></strong></a></li>
<!--
                    <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
                    <li><a href="#">��������</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome">�̿�ȳ�</a></li>
-->                </ul>
            </div>
            <!-- //������ο� -->
        </div>


        <!-- ������ ���� ���� -->
        <div id="contents">
        <h2 class="subTit">����Ͼ� ����</h2>

            <div id="subCont">
                <div class="noticBox">
                    ����Ʈ���� ���� ������ �� �ִ� �ѱ���������ī���� ���� ����� Ȩ������ �Դϴ�.<br/>
                    PC���� �Ӹ� �ƴ϶� ����Ϸ� �н��Ͻ� �� �ֽ��ϴ�.<br/><br/>
                    -�ȵ���̵� : �����÷��� ���� > '�ѱ���������ī����' �˻�<br/>
                    -IOS : �۽���� ���� > '�ѱ���������ī����' �˻�
                </div>
                <div>

                    <div style="width:550px; float:left; padding-top:40px;">
                        <div>
                            <img src="/images/2013/support/mobile_app_sub_title.jpg" alt="�ѱ���������ī���� �������/���ø����̼�"/>
                        </div>
                        <div>
                            <div style="width:250px; float:left; padding-top:50px">
                                <span style="font-size:20px; font-weight:bold; padding:25px;">PC���� �ٿ�ޱ�</span>
                                <a href="https://itunes.apple.com/us/app/kocca/id492151283?l=ko&ls=1&mt=8" target="_blank" title="��â���� �����ϴ�."><img src="/images/2013/support/mobileapp_down_ios.png" style="padding:20px 0px 0px 20px;" alt="iOS�� �ٿ�ޱ�" /></a></br>
                                <a href="https://play.google.com/store/apps/details?id=com.newin.kocca" target="_blank" title="��â���� �����ϴ�."><img src="/images/2013/support/mobileapp_down_android.png" style="padding:20px 0px 0px 20px;" alt="Android�� �ٿ�ޱ�" /></a>
                            </div>
                            <div style="width:250px; float:right; padding-top:50px">
                                <span style="font-size:20px; font-weight:bold; padding:25px;">QR�ڵ�� �ٿ�ޱ�</span>
                                <img src="/images/2013/support/qrcode.jpg" style="width:110px; height:110px; padding:20px 0px 0px 25px;" alt="QR�ڵ�" />
                            </div>
                        </div>

                    </div>

                    <div style="width:370px; float:right;">
                        <img src="/images/2013/support/mobile_screen_shot.jpg" alt="����ϼ��� ��ũ����" />
                    </div>
                </div>
               
            </div>
            <!-- //#subCont -->

        </div>
        <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>