<%
//**********************************************************
//  1. ��      ��: ȸ��Ż��
//  2. ���α׷��� :zu_MemberWithdraw.jsp
//  3. ��      ��: ȸ��Ż��
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
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String v_userid   = box.getSession("userid");

    box.put("title_str", "ȸ��Ż�� - �������� - ���θ޴�");
%>


<%@ include file="/learn/user/2013/portal/include/header.jsp"%>

<script language="JavaScript" type="text/JavaScript">
function doWithdraw(){
    var fm=document.form1;

    if( (fm.p_userid.value) == ""){
        alert("���̵� �����ϴ�");
    }
    if( (fm.p_pwd.value) == ""){
        alert("��й�ȣ�� �Է��ϼ���");
        fm.p_pwd.focus();return;
    }
    document.form1.p_process.value="MemberWithdrawOk";
    document.form1.action="/servlet/controller.homepage.MainMemberJoinServlet";
    document.form1.submit()
}
</script>
<!-- ��ũ��Ʈ�������� -->
<!-- container-new ���� //-->
<div id="container-new">

    <!-- form ���� -->
    <form name="form1"  action="" method="post" action="">
        <input type="hidden"    name="p_process"    value="" >
        <input type="hidden"    name="p_userid" value="<%=v_userid %>" >
        <div id="mainMenu">
            <!-- �н����� -->
            <ul class="location">
                <li>���θ޴�</li>
                <li>�������� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">�¶��� ���ǽ�</a></li>
                        <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage">���屳��</a></li>
                        <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=MINE">�����ۼ��� ��</a></li>
                        <li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage">��㳻��</a></li>
                        <li><a href="#" class="active">��������</a></li>
                    </ul>
                </li>
                <!-- 2015-01-09 �������
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
                    �� ���� ���� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SiteMap">����Ʈ��</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin">ȸ������</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd">���̵�/�н����� ã��</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate" class="active">�� ���� ����</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=PersonalNew">��������ó����ħ</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=UserAgree">�̿���</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&amp;p_code=FOOTER_EMAIL">�̸��Ϲ��ܼ����ź�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport">Ȩ������ �����ǰ�</a></li>
                    </ul>
                </li>
                //-->

            </ul>
            <!-- ������ο� -->
            <!-- 2015-01-09 �������
                <div class="introCategory">
                    <ul>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SiteMap">����Ʈ��</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin">ȸ������</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd">���̵�/�н����� ã��</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate"><strong><u>�� ���� ����</u></strong></a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=PersonalNew">��������ó����ħ</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=UserAgree">�̿���</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&amp;p_code=FOOTER_EMAIL">�̸��Ϲ��ܼ����ź�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport">Ȩ������ �����ǰ�</a></li>
                    </ul>
                </div>

            //-->
        </div>
        <!-- //#mainMenu -->

        <!-- ������ ���� ���� -->
        <div id="contents">

            <h2 class="subTit">��������<!--<img src="/images/2013/support/myinform_title.gif" alt="����������" />//--></h2>
                <div id="subCont">
                    <ul class="tabCus">
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate"><img src="/images/2013/support/tabinfo1_off.jpg" alt="�⺻��������" /></a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=ChangePwd"><img src="/images/2013/support/tabinfo2_off.jpg" alt="��й�ȣ����" /></a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberWithdraw"><img src="/images/2013/support/tabinfo3_on.jpg" alt="ȸ��Ż��" /></a></li>
                    </ul>
                    <h3 class="blind">���� �� ���� ������ġ</h3>

                    <div class="formWrap">
                        <div class="txtLeft">
                            <p class="txt1">���ݱ��� �ѱ������������ ��ī���̸� �̿��� �ּż� ����帳�ϴ�.</p>
                            <ul>
                                <li> ȸ��Ż�� ��û�Ͻø� �ش� ���̵�� ����� �����ǹǷ� <strong>�ش�
                                  ���̵�δ� �簡���� �Ұ���</strong>�մϴ�.</li>
                                <li> ȸ��Ż���� ȸ�������� �����Ǹ�, ���� ������ ID�� �ű԰��� ID
                                  ���� ID �ߺ������� �Խñ� ������ ���Ͽ� ����� ID�� �����ϴ�.</li>
                                <li> ȸ�� Ż�� �� �簡�� �����ϸ�, ���������� <strong>ȸ��Ż��� ���ÿ�
                                  ���� �� �ı�</strong>�˴ϴ�.</li>
                              </ul>
                             <p class="txt2">&lt;���� : �ѱ���������ī���� ��� TEL. 02-2161-0077 &gt; </p>
                        </div>
                        <!-- //txtLeft -->
                        <div class="txtRight">
                            <table class="dataTable3" summary="�� ǥ�� �� �������� ��й�ȣ���� ǥ�� ���� ��й�ȣ Ȯ��, �� ��й�ȣ, �� ��й�ȣ Ȯ�� �������� ���� �Ǿ� �ֽ��ϴ�.">
                        <caption>�� �������� ��й�ȣ���� ǥ</caption>
                                <colgroup>
                                    <col width="20%"/>
                                    <col width="*"/>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row"><label for="identity">���̵�</label></th>
                                    <td><%=v_userid %></td>
                                </tr>
                                <tr>
                                    <th scope="row"><label for="pw2">��й�ȣ</label></th>
                                    <td><input type="password" name="p_pwd" id="pw2" class="inputPw" size="30" /></td>
                                </tr>
                                <tr>
                                    <th scope="row"><label for="reason">Ż�����</label></th>
                                    <td><textarea id="reason" name="p_leave_reason" class="textArea" rows="7" cols="37" /></textarea></td>
                                </tr>
                                </tbody>
                            </table>
                            <a href="javascript:doWithdraw();"><img src="/images/2013/support/btn_out.gif" alt="ȸ��Ż�� ��û�մϴ�" /></a>
                        </div>
                        <!-- //txtRight -->
                    </div>
                    <!-- //formWrap -->
                </div>
                <!-- //#subCont -->

        </div>
    </form>

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>