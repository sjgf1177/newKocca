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
    
    box.put("title_str", "�̸��Ϲ��ܼ����ź� - �̿�ȳ�");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>

<!-- container-new ���� //-->
<div id="container-new">

        <div id="mainMenu">
            <!-- �н����� -->
            <ul class="location">
                <li>Ȩ</li>
                <li>�̿�ȳ� <!--<a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>-->
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
<!--
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">FAQ</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
                        <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List">��������</a></li>
-->
                        <!--<li><a href="#">��������</a></li>-->
<!--
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome" class="active">�̿�ȳ�</a></li>
                    </ul>
-->
                </li>
                <li>
                    �̸��Ϲ��ܼ����ź� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
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
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&amp;p_code=FOOTER_EMAIL" class="active">�̸��Ϲ��ܼ����ź�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport">Ȩ������ �����ǰ�</a></li>
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
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&amp;p_code=FOOTER_EMAIL"><strong><u>�̸��Ϲ��ܼ����ź�</u></strong></a></li>
                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport">Ȩ������ �����ǰ�</a></li>
                </ul>
            </div>
        </div>
        <!-- //#mainMenu -->


        <!-- ������ ���� ���� -->
        <div id="contents">

            <h2 class="subTit">�̸��Ϲ��ܼ����ź�<!--<img src="/images/2013/support/email_title.gif" alt="�̸��Ϲ��ܼ����ź�" />//--></h2>

                <div id="subCont">

                <div class="emailx">
                    <p class="tx1">
                        �� Ȩ�������� �Խõ� �̸��� �ּҰ� ���ڿ��� ���� ���α׷��̳� �� ����<br />
                        ����� ��ġ�� �̿��Ͽ� �������� �����Ǵ� ���� �ź��ϸ�, �̸� ���ݽ�<br />
                        ������Ÿ����� ���� ����ó������ �����Ͻñ� �ٶ��ϴ�.<br />
                    </p>

                    <p class="tx2">�ѱ������������ ��ī���̴� �̸��� �ּ� ������ �ź��մϴ�.</p>
                    <p class="tx3">������Ÿ��� �� 50���� 2 (���ڿ����ּ��� ���� �������� �� ����)</p>
                    <ul>
                        <li class="num1">�������� ���ڿ����ּ��� ������ �ź��ϴ� �ǻ簡 ��õ� ���ͳ� Ȩ����������
                        �ڵ����� ���ڿ����ּҸ� �����ϴ� ���α׷� �� ���� ����� ��ġ�� �̿��Ͽ�
                        ���ڿ����ּҸ� �����Ͽ����� �ȵȴ�.</li>

                        <li class="num2">�������� �� 1���� ������ �����Ͽ� ������ ���ڿ����ּҸ� �Ǹ� �����Ͽ�����
                        �ƴϵȴ�.</li>

                        <li class="num3">�������� �� 1�� �� �� 2���� ������ ���Ͽ� �������Ǹ� �� �����̱����� ���ڿ���
                        �ּ����� �˰� �̸� �������ۿ� �̿��Ͽ����� �ƴ� �ȴ�. </li>

                        <li class="num4">����, ���� ���� ����� ��ġ�� ����� �̸����ּ� ���ܼ��� ���ظ� ���Ͻ� ���<br />
                        <strong>�ҹ����Դ������� ������ȭ (1336)�� Ȩ������(www.spamcop.or.kr)</strong>��
                        �Ű�â�� ���Ͽ� �Ű��Ͽ� �ֽñ� �ٶ��ϴ�. </li>
                    </ul>
                </div>
                <!--//emailx -->

            </div>
            <!-- //#subCont -->


        </div>
        <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>