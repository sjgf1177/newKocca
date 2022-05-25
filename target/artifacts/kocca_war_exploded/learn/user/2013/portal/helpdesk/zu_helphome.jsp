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

    box.put("title_str", "�н����̵� - �н����� - ������");
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
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=HelpHome"><strong><u>�н� ���̵�</u></strong></a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp" >�н�ȯ�� ����</a></li>
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


        <!-- ������ ���� ���� -->
        <div id="contents">
        <h2 class="subTit">�н����̵�<!--<img src="/images/2013/support/eduguide_title.gif" alt="�н����̵�" />//--></h2>

            <div id="subCont">
                <div class="noticBox">
                    �н� ��/��/�� �ʿ��� ����, �ڷ� �� �̿�ȳ��� �����մϴ�.
                </div>
                <div class="step4"><img src="/images/2013/support/img_4step.jpg" alt="�ѱ���������ī���̿� ó�����̳���? ���������� ����� �޾ƺ�����" usemap="#step_map" /></div>
                <ol class="blind">
                    <li>step1 ȸ������</li>
                    <li>step2 �α���</li>
                    <li>step3 ��������</li>
                    <li>step4 ������û</li>
                </ol>
<%
        if ( isUserLogin ) {
%>
                <map name="step_map">
                    <area shape="rect" coords="635,0,745,111" href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList" target="_self" alt="��������" />
                    <area shape="rect" coords="800,0,910,111" href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList" target="_self" alt="������û" />
                </map>
<%
        } else {
%>
                <map name="step_map">
                    <area shape="rect" coords="305,0,415,111" href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin" target="_self" alt="ȸ������" />
                    <area shape="rect" coords="470,0,580,111" href="/servlet/controller.homepage.MainServlet?p_process=MainLogin" target="_self" alt="�α���" />
                    <area shape="rect" coords="635,0,745,111" href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList" target="_self" alt="��������" />
                    <area shape="rect" coords="800,0,910,111" href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList" target="_self" alt="������û" />
                </map>
<%
        }
%>
            </div>
            <!-- //#subCont -->

        </div>
        <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>