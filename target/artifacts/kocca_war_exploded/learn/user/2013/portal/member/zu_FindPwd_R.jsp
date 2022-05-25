<%
//**********************************************************
//  1. ��      ��: �н����� ã�� ���
//  2. ���α׷��� : zu_FindPwd_R.jsp
//  3. ��      ��: �н����� ã�� ���
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��:
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String v_name = box.getString("p_name_2");
    //String v_pwd  = (String)request.getAttribute("pwd");
    String v_tmp_pwd  =  box.getString("tmp_pwd");
    String v_email  = box.getString("v_toEmail");

    box.put("title_str", "���̵�/�н�����ã��-�̿�ȳ�, �н�����");
%>

<%@ include file="/learn/user/2013/portal/include/top_sub.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->


<!-- ��ũ��Ʈ���� -->
<script language="JavaScript" type="text/JavaScript">
<!--//

//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- form ���� -->
<form name="form1"  action="" method="post" action="">
    <input type="hidden"    name="p_process"    value="" />

    <div id="mainMenu">
            <!-- �н����� -->
            <ul class="location">
                <li>Ȩ</li>
                <li>�н�����</li>
                <li>
                    �̿�ȳ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">FAQ</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
                        <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List">��������</a></li>
                        <!--<li><a href="#">��������</a></li>-->
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome" class="active">�̿�ȳ�</a></li>
                    </ul>
                </li>
                <li>
                    ���̵�/�н����� ã�� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SiteMap">����Ʈ��</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin">ȸ������</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd" class="active">���̵�/�н����� ã��</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate">�� ���� ����</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=PersonalNew">��������ó����ħ</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=UserAgree">�̿���</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&amp;p_code=FOOTER_EMAIL">�̸��Ϲ��ܼ����ź�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport">Ȩ������ �����ǰ�</a></li>
                    </ul>
                </li>
            </ul>
            <!-- ������ο� -->
        </div>
        <!-- //#mainMenu -->


        <!-- ������ ���� ���� -->
        <div id="contents">
            <h2 class="subTit"><img src="/images/2013/support/idpw_title.gif" alt="���̵�/�н����� ã��" /></h2>

            <div id="subCont">
                <div class="searhIdpw_done">
                    <% if (v_tmp_pwd.equals("")) {  %>
                        �Է��Ͻ� ������ ��ġ�ϴ� ������ �����ϴ�.
                    <% } else {  %>
                        <%=v_name %> ȸ������ �ӽ� ��й�ȣ�� <strong><%=v_tmp_pwd %></strong> �Դϴ�.<br/>
                        �ȳ��� �帰 �ӽ� ��й�ȣ�� �α��� �� &quot;������������&quot; ������ �����Ͽ� �ֽñ� �ٶ��ϴ�.
                    <% } %>
                    <a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd"><img src="/images/2013/btn/btn_back.gif" alt="�ڷΰ���" /></a>
                </div>
                <!-- //searhIdpw -->
            </div>
            <!-- //#subCont -->
        </div>
    </form>
<!-- form �� -->

<!-- footer -->
<%@ include file="/learn/user/2013/portal/include/footer.jsp"%>
<!--// footer -->