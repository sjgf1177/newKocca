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

    box.put("title_str", "�̿�ȳ�");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>

<!-- container-new ���� //-->
<div id="container-new">

        <!-- mainMenue -->
        <div id="mainMenu">
            <!-- �н����� -->
            <ul class="location">
                <li>Ȩ</li>
                <li>�̿�ȳ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome" class="active">�̿�ȳ�</a></li>
<!--
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin">ȸ������</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd">���̵�/�н����� ã��</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=PersonalNew">��������ó����ħ</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=UserAgree">�̿���</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&amp;p_code=FOOTER_EMAIL">�̸��Ϲ��ܼ����ź�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport">Ȩ������ �����ǰ�</a></li>
//-->
<!--
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">FAQ</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
                        <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List">��������</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome" class="active">�̿�ȳ�</a></li>
-->
                    </ul>
                </li>
            </ul>

            <!-- ������ο� -->
            <div class="introCategory">
                <ul>
                    <!--<li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SiteMap">����Ʈ��</a></li>-->
<%
    if ( !isUserLogin ) {
%>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin">ȸ������</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd">���̵�/�н����� ã��</a></li>
<%
    }
%>
                    <!--<li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate">�� ���� ����</a></li>-->
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=PersonalNew">��������ó����ħ</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=UserAgree">�̿���</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&amp;p_code=FOOTER_EMAIL">�̸��Ϲ��ܼ����ź�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport">Ȩ������ �����ǰ�</a></li>
                </ul>
            </div>
            <!-- //������ο� -->
            <!-- //�н����� -->
        </div>
        <!-- //#mainMenu -->


        <!-- ������ ���� ���� -->
        <div id="contents">

            <h2 class="subTit">�̿�ȳ�<!--<img src="/images/2013/support/support_title.gif" alt="�̿�ȳ�" />//--></h2>

            <div id="subCont">
                <div class="imgBox">
                    <img src="/images/2013/support/img_support.jpg" alt="�ѱ���������ī���� �̿�ȳ� �� ���� �������� Ȩ������ �����ǰ߱��� �̿�ȳ����� �����ϰ� ����Ͻ� �� �ֽ��ϴ�." />
                </div>
            </div>
            <!-- //#subCont -->

        </div>
        <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>