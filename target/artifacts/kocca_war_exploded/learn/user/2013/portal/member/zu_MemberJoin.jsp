<%
//**********************************************************
//  1. ��      ��: ȸ������_����Ȯ��
//  2. ���α׷��� : zu_MemberJoin.jsp
//  3. ��      ��: ȸ������_����Ȯ��
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��:
//  7. ��      ��:
//***********************************************************
%>

<%@page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>

<%@page import="com.credu.library.RequestBox" %>
<%@page import="com.credu.library.RequestManager" %>
<%@page import="NiceID.Check.CPClient" %>
<%@taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    String prevProcess = box.getString("p_process");

    if (prevProcess == null || prevProcess.equals("") || !prevProcess.equals("CheckAgree") ) {
%>
<!DOCTYPE html>
<html>
<title>�ѱ���������ī����</title>
<script type="text/javascript">
    alert("�߸��� �����Դϴ�.");
    location.href = "/";
</script>
<body>
</body>
</html>
<%
    } else {


        CPClient niceCheck = new CPClient();

        String sSiteCode = "G7889";             // NICE�κ��� �ο����� ����Ʈ �ڵ�
        String sSitePassword = "KCQJDMUIH9ZI";  // NICE�κ��� �ο����� ����Ʈ �н�����

        String sRequestNumber = "REQ0000000001";            // ��û ��ȣ, �̴� ����/�����Ŀ� ���� ������ �ǵ����ְ� �ǹǷ�
                                                            // ��ü���� �����ϰ� �����Ͽ� ���ų�, �Ʒ��� ���� �����Ѵ�.
        sRequestNumber = niceCheck.getRequestNO(sSiteCode);
        session.setAttribute("REQ_SEQ" , sRequestNumber);   // ��ŷ���� ������ ���Ͽ� ������ ���ٸ�, ���ǿ� ��û��ȣ�� �ִ´�.

        String sAuthType = "M";          // ������ �⺻ ����ȭ��, M: �ڵ���, C: �ſ�ī��, X: ����������

        String popgubun = "Y";      //Y : ��ҹ�ư ���� / N : ��ҹ�ư ����
        String customize = "";      //������ �⺻ �������� / Mobile : �����������

        // CheckPlus(��������) ó�� ��, ��� ����Ÿ�� ���� �ޱ����� ���������� ���� http���� �Է��մϴ�.
        String sReturnUrl = "http://edu.kocca.or.kr/certi/checkplus/checkplus_success.jsp";      // ������ �̵��� URL
        String sErrorUrl = "http://edu.kocca.or.kr/certi/checkplus/checkplus_fail.jsp";          // ���н� �̵��� URL

        // �Էµ� plain ����Ÿ�� �����.
        String sPlainData = "7:REQ_SEQ" + sRequestNumber.getBytes().length + ":" + sRequestNumber +
                            "8:SITECODE" + sSiteCode.getBytes().length + ":" + sSiteCode +
                            "9:AUTH_TYPE" + sAuthType.getBytes().length + ":" + sAuthType +
                            "7:RTN_URL" + sReturnUrl.getBytes().length + ":" + sReturnUrl +
                            "7:ERR_URL" + sErrorUrl.getBytes().length + ":" + sErrorUrl +
                            "11:POPUP_GUBUN" + popgubun.getBytes().length + ":" + popgubun +
                            "9:CUSTOMIZE" + customize.getBytes().length + ":" + customize;

        String sMessage = "";
        String sEncData = "";

        int iReturn = niceCheck.fnEncode(sSiteCode, sSitePassword, sPlainData);
        if( iReturn == 0 ) {
            sEncData = niceCheck.getCipherData();

        } else if( iReturn == -1) {
            sMessage = "��ȣȭ �ý��� �����Դϴ�.";

        } else if( iReturn == -2) {
            sMessage = "��ȣȭ ó�������Դϴ�.";

        } else if( iReturn == -3) {
            sMessage = "��ȣȭ ������ �����Դϴ�.";

        } else if( iReturn == -9) {
            sMessage = "�Է� ������ �����Դϴ�.";

        } else {
            sMessage = "�˼� ���� ���� �Դϴ�. iReturn : " + iReturn;
        }

        box.put("title_str", "����Ȯ�� - ȸ������ - �̿�ȳ� - �н�����");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>

<script type="text/javascript">

    window.name = "Parent_window";

    /**
     * �Ƚɺ������� �˾�â ����
     */
    function fnNiceCertiPopup(){
        window.open("", "popupChk", "width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no");

        document.certiForm.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
        document.certiForm.target = "popupChk";
        document.certiForm.submit();
    }

    /**
     * �̸������� �˾�â ����
     */
    function fnEmailCertiPopup() {
        window.open("", "popupChk", "width=636, height=306, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=no, location=no, scrollbar=no");
        document.emailCetiForm.action = "/certi/email/emailCerti.jsp";
        document.emailCetiForm.target = "popupChk";
        document.emailCetiForm.submit();
    }
</script>
<!-- container-new ���� //-->
<div id="container-new">

    <div id="mainMenu">
            <!-- �н����� -->
            <ul class="location">
                <li>Ȩ</li>
                <li>�̿�ȳ�</li>
                <li>ȸ������ <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <!-- <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome" >�̿�ȳ�</a></li> //-->
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin" class="active">ȸ������</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd">���̵�/�н����� ã��</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=PersonalNew">��������ó����ħ</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=UserAgree">�̿���</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&amp;p_code=FOOTER_EMAIL">�̸��Ϲ��ܼ����ź�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport">Ȩ������ �����ǰ�</a></li>
                    </ul>
                <!--
                <li>�̿�ȳ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
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
                -->
                </li>
            </ul>
            <!-- ������ο� -->
        </div>
        <!-- //#mainMenu -->


        <!-- ������ ���� ���� -->
        <div id="contents">

            <h2 class="subTit">ȸ������<!-- <img src="/images/2013/support/join_title.gif" alt="ȸ������" />//--></h2>

            <div id="subCont">
                <div class="stepimgBox">
                    <img src="/images/2013/support/private_img2.jpg" alt="ȸ�������� 4�ܰ� �������, ����Ȯ��, �����Է�, ���ԿϷ� �߿��� ���� 2�ܰ� ����Ȯ�� �ܰ��Դϴ�." />
                </div>
                <div class="joinBox">
                    <div class="cont">
                        <div class="btnArea wd2">
                            <button type="button" class="btnText" onclick="javascript:fnNiceCertiPopup();"><span>�Ƚɺ�������</span></button>
                            <button type="button" class="btnText" onclick="javascript:fnEmailCertiPopup();"><span>�̸�������</span></button>
                        </div>
                    </div>

                </div>
                <!--//�Ǹ�Ȯ�� -->


            </div>
            <!-- //#subCont -->

        </div>

    <form name="certiForm" method="post">
        <input type="hidden" name="m" value="checkplusSerivce" /> <!-- �ʼ� ����Ÿ��, �����Ͻø� �ȵ˴ϴ�. -->
        <input type="hidden" name="EncodeData" value="<%= sEncData %>"/>    <!-- ������ ��ü������ ��ȣȭ �� ����Ÿ�Դϴ�. -->

        <!-- ��ü���� ����ޱ� ���ϴ� ����Ÿ�� �����ϱ� ���� ����� �� ������, ������� ����� �ش� ���� �״�� �۽��մϴ�. �ش� �Ķ���ʹ� �߰��Ͻ� �� �����ϴ�. -->
        <input type="hidden" name="param_r1" value="regMember" />
        <input type="hidden" name="param_r2" value="" />
        <input type="hidden" name="param_r3" value="" />
    </form>

    <form name="emailCetiForm" method="post">
        <input type="hidden" name="param_r1" value="regMember" />
    </form>

<!-- container-new ���� //-->
<div id="container-new">

<%@ include file="/learn/user/2013/portal/include/footer.html"%>

<%
    }
%>
