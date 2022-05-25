<%
//**********************************************************
//  1. ��      ��: ȸ������ �Ϸ�
//  2. ���α׷��� : zu_MemberJoinOk.jsp
//  3. ��      ��: ȸ������ �Ϸ�
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��:
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    box.put("title_str", "���ԿϷ� - ȸ������ - �̿�ȳ� - �н�����");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>

<!-- container-new ���� //-->
<div id="container-new">

<form name="form1"  action="" method="post" action="">
    <input type="hidden"    name="p_process"    value="" >
    <input type="hidden"    name="p_resno" value="" >

        <div id="mainMenu">
            <!-- �н����� -->
            <ul class="location">
                <li>Ȩ</li>
                <li>�̿�ȳ�</li>
                <li>
                    ȸ������ <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin" class="active">ȸ������</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd">���̵�/�н����� ã��</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=PersonalNew">��������ó����ħ</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=UserAgree">�̿���</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&amp;p_code=FOOTER_EMAIL">�̸��Ϲ��ܼ����ź�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport">Ȩ������ �����ǰ�</a></li>
                    </ul>
                </li>
                
                <!-- 2015-01-16 ���� ����
                <li>Ȩ</li>
                <li>�н�����</li>
                <li>
                    �̿�ȳ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>    
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">FAQ</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
                        <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List">��������</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome" class="active">�̿�ȳ�</a></li>
                    </ul>
                </li>
                <li>
                    ȸ������ <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SiteMap">����Ʈ��</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin" class="active">ȸ������</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd">���̵�/�н����� ã��</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate">�� ���� ����</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=PersonalNew">��������ó����ħ</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=UserAgree">�̿���</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&amp;p_code=FOOTER_EMAIL">�̸��Ϲ��ܼ����ź�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport">Ȩ������ �����ǰ�</a></li>
                    </ul>
                </li>

                //-->
            </ul>
            <!-- ������ο� -->
        </div>
        <!-- //#mainMenu -->


        <!-- ������ ���� ���� -->
        <div id="contents">
            <h2 class="subTit">ȸ������<!-- <img src="/images/2013/support/join_title.gif" alt="ȸ������" /> //--></h2>

            <div id="subCont">
                <div class="stepimgBox">
                    <img src="/images/2013/support/private_img4.jpg" alt="ȸ�������� 4�ܰ� �������, ����Ȯ��, �����Է�, ���ԿϷ� �߿��� ���� 4�ܰ� ���ԿϷ� �ܰ��Դϴ�." />
                </div>
                <p class="msgBox"><img src="/images/2013/support/img_join_done.jpg" alt="�ѱ���������ī���� ȸ�������� �Ϸ�Ǿ����ϴ�. ���ݺ��� ������ ��ī������ �پ��� ���񽺸� �̿��Ͻ� �� �ֽ��ϴ�." /></p>
            </div>
            <!-- //#subCont -->
        </div>
</form>
</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>