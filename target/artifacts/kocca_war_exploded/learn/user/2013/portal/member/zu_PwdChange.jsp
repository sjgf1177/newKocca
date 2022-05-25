<%
//**********************************************************
//  1. ����     : ��й�ȣ ����
//  2. ���ϸ�   : /learn/user/2013/portal/member/zu_PwdChange.jsp
//  3. ����     : ȸ���� ��й�ȣ ���� �������̴�.
//  4. ȯ��     : JDK 1.5
//  5. ����     : 1.0
//  6. �ۼ�     : unknown
//  7. �����̷�
//      - 2014-05-12: ��й�ȣ ���� ü�� ���濡 ���� ����.
//                    ���ȵ�� üũ �ڹٽ�ũ��Ʈ ����.
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
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

    String v_userid = box.getSession("userid");

    box.put("title_str", "��й�ȣ���� - ���������� - �̿�ȳ� - �н�����");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<style type="text/css">
 .secure_info   {   display:none; padding:8px; word-break: keep-all; border:2px solid #3a96d7;
                    position:absolute; top:232px; left:560px; width:480px; height:268px; z-index:9999; overflow:auto; background:#ffffff;
                }
</style>

<!-- ��ũ��Ʈ���� -->
<!-- <script type="text/javascript" src="/script/password.js"></script> //-->
<script type="text/javascript">

    /**
     * ��й�ȣ ���� ����� üũ�Ѵ�.
     */
    function fnCheckPaswordLevel(password) {
        var desc = new Array();
        desc[0] = "<label style=\"color:#ff0000;\">�ſ� ����</label>"; // �ſ����
        desc[1] = "<label style=\"color:#ff0000;\">�ſ� ����</label>"; // ���ݺ���
        desc[2] = "<label style=\"color:#808080;\">����</label>"; // �������
        desc[3] = "<label style=\"color:#0000ff;\">����</label>"; // ��ȣ����
        desc[4] = "<label style=\"color:#808000;\">��ȣ</label>"; // �����ϴ�
        desc[5] = "<label style=\"color:#008000;\">�ſ� ��ȣ</label>"; // �ſ�����
        var score = 0;

        //if password length == 0, do nothing
        if (password.length == 0) return;
        //if password bigger than 8 give 1 point
        if (password.length > 7) score++;

        //if password has both lower and uppercase characters give 1 point
        if ( ( password.match(/[a-z]/) ) || ( password.match(/[A-Z]/) ) ) score++;
        //if password has at least one number give 1 point
        if (password.match(/\d+/)) score++;
        //if password has at least one special caracther give 1 point
        if ( password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/) ) score++;
        //if password bigger than 12 give another 1 point
        if (password.length > 12) score++;

        //document.getElementById("passwordDescription").innerHTML = desc[score];
        $("#oPwdLevelArea").html( desc[score] );
    }

    /**
     * ��й�ȣ�� ��й�ȣȮ�� ���� ���Ѵ�.
     */
    function fnCheckPasswordRe(rePassword) {
        var password = $("#oNewPwd").val();
        if ( rePassword != "" ) {
            if (rePassword.length < password.length ) {
                $("#oPwdReArea").html("<label style=\"color:#fca500;\">���Էµ� ��й�ȣ�� �ʹ� ª��</label>");
            } else if ( password != rePassword ) {
                $("#oPwdReArea").html("<label style=\"color:#fca500;\">��й�ȣ�� ���� ����</label>");
            } else {
                $("#oPwdReArea").html("<label style=\"color:#008000;\">��й�ȣ Ȯ��</label>");
            }
        } else {
            $("#oPwdReArea").html("");
        }
    }

    /**
     * ��й�ȣ�� �����Ѵ�.
     */
    function fnUpdateUserPassword() {
        var docForm = document.passwordChangeForm;
        var oldPwd = docForm.p_pwd_old.value;
        var newPwd = docForm.p_pwd.value;
        var newPwdRe = docForm.p_pwd_re.value;

        var secureLevel = "";

        if (oldPwd.length == 0) {
            alert("���� ��й�ȣ�� �Է��� �ֽʽÿ�.");
            docForm.p_pwd_old.focus();
            return;
        } else if (newPwd.length == 0) {
            alert("�� ��й�ȣ�� �Է��� �ֽʽÿ�.");
            docForm.p_pwd.focus();
            return;
        } else if (newPwdRe.length == 0) {
            alert("�� ��й�ȣȮ���� �Է��� �ֽʽÿ�.");
            docForm.p_pwd_re.focus();
            return;
        } else if (newPwd != newPwdRe) {
            alert("���ο� ��й�ȣ�� �ٸ��� �ԷµǾ����ϴ�.");
            docForm.p_pwd.focus();
            return;
        } else if (newPwd.length < 8 ) {
            alert("��й�ȣ�� 8�ڸ� �̻� �Է��� �ֽʽÿ�.");
            docForm.p_pwd.focus();
            return;
        } else if ( oldPwd == newPwd ) {
            alert("���ο� ��й�ȣ�� ���� ��й�ȣ�� �����մϴ�.");
            docForm.p_pwd.focus();
            return;
        } else {
            docForm.target = "_self";
            docForm.action = https_host() + "/servlet/controller.homepage.MainMemberJoinServlet";
            docForm.p_process.value = "ChangePwdOk";
            docForm.submit();
        }
    }
</script>
<!-- ��ũ��Ʈ�������� -->
<!-- container-new ���� //-->
<div id="container-new">


<!-- form ���� -->
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
                -->
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
                <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=ChangePwd"><img src="/images/2013/support/tabinfo2_on.jpg" alt="��й�ȣ����" /></a></li>
                <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberWithdraw"><img src="/images/2013/support/tabinfo3_off.jpg" alt="ȸ��Ż��" /></a></li>
            </ul>
            <h3 class="blind">���� �� ���� ������ġ</h3>

            <p class="sidetxt"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" />�� �ʼ� �Է� �׸��Դϴ�.</p>
            <div class="tableWrap space1">
                <form id="oPasswordChangeForm" name="passwordChangeForm" method="post" action="">
                    <input type="hidden" name="p_process" value="" />
                    <input type="hidden" name="p_userid" value="<%= v_userid %>" />
                <table class="dataTable2" summary="�� ǥ�� �� �������� ��й�ȣ���� ǥ�� ���� ��й�ȣ Ȯ��, �� ��й�ȣ, �� ��й�ȣ Ȯ�� �������� ���� �Ǿ� �ֽ��ϴ�.">
                    <caption>�� �������� ��й�ȣ���� ǥ</caption>
                    <colgroup>
                        <col width="25%"/>
                        <col width="*"/>
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="pw">�����й�ȣȮ��</label></th>
                        <td><input type="password" name="p_pwd_old" id="oOldPwd" class="inputPw" maxlength="30" title="�����й�ȣ �Է¶�" style="width: 280px; font-size: 11px;" /></td>
                    </tr>
                    <tr>
                        <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="pw2">�� ��й�ȣ</label></th>
                        <td>
                            <input type="password" name="p_pwd" id="oNewPwd" class="inputPw" maxlength="30" title="�� ��й�ȣ �Է¶�" style="width: 280px; font-size: 11px;" onkeyup="fnCheckPaswordLevel(this.value);" onblur="fnCheckPasswordRe(document.passwordChangeForm.p_pwd_re.value);"/>
                            <span id="oPwdLevelArea" style="width:200px;margin-left:10px; font-weight:bold;"></span>
                            <!-- <a href="javascript:void(0);" onmouseover="fnToggleDiv(true);" onmouseout="fnToggleDiv(false);">���ȵ�޾ȳ�</a> //-->
                            <!-- <span id="oLevelMessage" style="padding-left:12px;"></span> //-->
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="pw3">�� ��й�ȣȮ��</label></th>
                        <td>
                            <input type="password" name="p_pwd_re" id="oNewPwdRe" class="inputPw" maxlength="30" title="�� ��й�ȣ Ȯ�� �Է¶�" style="width: 280px; font-size: 11px;" onkeyup="fnCheckPasswordRe(this.value);" />
                            <span id="oPwdReArea" style="width:200px;margin-left:10px; font-weight:bold;"></span>
                        </td>
                    </tr>
                    </tbody>
                </table>
                </form>
            </div>
            <ul class="tips">
                <li>* ��й�ȣ�� 8~30���� ���� ��ҹ���/����/Ư������ ȥ�� ����� �����մϴ�.</li>
                <li>* 2���� ������ ��� 10�ڸ� �̻�, 3���� ������ ��� 8�ڸ� �̻��� �����մϴ�.</li>
                <li>* ���� ��/�ҹ��ڿ� ���� �Ǵ� Ư�����ڸ� ȥ���Ͽ� ����Ͻð�, ���Ϲ�ȣ, �ֹε�Ϲ�ȣ �� �˱� ���� ���ڴ� �����ֽʽÿ�.</li>
                <li>&nbsp;</li>
                <li>���ȼ����� ���� ��ȣ�� �ٸ� ����� ���� �����ϰų�, �ڵ�ȭ ���α׷� ���� �̿��Ͽ� �˾Ƴ��� ����� ��ȣ�� ���մϴ�.</li>
                <li>����������ȣ�� ���� ���ȼ����� ���� ��ȣ�� ����� ���� �߿��մϴ�.</li>
                <li>���� ������ ����������ȣ�� ���� 6�������� �ֱ����� ������ �����մϴ�.</li>
            </ul>
            <div class="btnArea">
                <button type="button" onclick="javascript:fnUpdateUserPassword();" class="btnText"><span>��й�ȣ�� �����մϴ�.</span></button>
            </div>
        </div>
        <!-- //#subCont -->
    </div>

    <div class="secure_info">
        <ul class="tips">
            <li>&nbsp;</li>
            <li>* ��й�ȣ�� 8~30���� ���� ��ҹ���/����/Ư������ ȥ�� ����� �����մϴ�.</li>
            <li>* 2���� ������ ��� 10�ڸ� �̻�, 3���� ������ ��� 8�ڸ� �̻��� �����մϴ�.</li>

            <li style="padding-left:12px; font-weight:normal; color:#d1006c;">- �ҹ��� (a-z)</li>
            <li style="padding-left:12px; font-weight:normal; color:#d1006c;">- �빮�� (A-Z)</li>
            <li style="padding-left:12px; font-weight:normal; color:#d1006c;">- ���� (0-9)</li>
            <li style="padding-left:12px; font-weight:normal; color:#d1006c;">- Ư������ (`~!@#$%^&*()-_+ [] {}|;,.&lt;&gt;/)</li>

            <li>&nbsp;</li>
            <li>* ��й�ȣ�� ����� �� ���� ��� �� �ؼ�����</li>
            <li style="padding-left:12px; font-weight:normal;">- ���� �� ���� Ư������ �̿��� ����(�� �Т��� )</li>
            <li style="padding-left:12px; font-weight:normal;">- 4�� �̻� ���ӵ� ���� �� ������ ���� 3�� �̻��� ����Ͻ� �� �����ϴ�.</li>
            <li style="padding-left:12px; font-weight:normal;">- ������ ��ϵ� �ܾ�, ���̵�, ���������� ���õ� �̸�, ����, ��ȭ��ȣ ���� ������ ����� �ﰡ�մϴ�.</li>
            <!--
            <li>* ���� ��/�ҹ��ڿ� ���� �Ǵ� Ư�����ڸ� ȥ���Ͽ� 9-14�ڸ��� �Է��� �ּ���.</li>
            <li>* ���ӵ� ����, ���Ϲ�ȣ, �ֹε�Ϲ�ȣ �� �˱� ���� ���ڴ� �����ּ���.</li>
            //-->
        </ul>
    </div>


</div>
<!--  //container-new �� //-->
<%@ include file="/learn/user/2013/portal/include/footer.html"%>
