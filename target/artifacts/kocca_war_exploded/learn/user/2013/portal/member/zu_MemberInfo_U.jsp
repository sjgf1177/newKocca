<%
//**********************************************************
// 1. ���ϸ� : zu_MemberInfo_U.jsp
// 2. ���α׷��� : ȸ������ ���� ȭ��
// 3. ���� : ȸ�� ������ �����ϴ� ȭ���̴�.
// 4. ȯ��: JDK 1.5
// 5. ����: 1.0
// 6. �ۼ� : ?
// 7. ���� �̷� :
//    7.1. ȸ�� ���� �Ϻ� ����
//      ����: 2015-03-02
//      ����: ������ ��û���� ȸ�� ���� �Ϻθ� �����Ѵ�.
//            ������ �׸��� �Ʒ��� ����. (���� ������ ���� �ʰ� �ּ�ó��)
//          - ��ȭ��ȣ, ����, ����, ����о�, �Ҽ�, �����ڰ��� ����
//    7.2. ���ʿ� import ���� �� ����
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "com.credu.library.DataBox" %>
<%@ page import = "com.credu.library.RequestBox" %>
<%@ page import = "com.credu.library.RequestManager" %>

<jsp:useBean id = "conf" class="com.credu.library.ConfigSet" scope="page" />
<jsp:useBean id = "getCodenm" class="com.credu.common.GetCodenm" scope="page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    DataBox dbox = (DataBox)request.getAttribute("memberView");

    String v_handphone = "";
    String v_userid = "";
    String v_name = "";
    String v_sex = "";
    // String v_home_addr = "";
    String v_email = "";
    // String v_hometel = "";
    String v_ismailing = "";
    // String v_workfieldcd = "";
    String v_memberyear = "";
    String v_membermonth = "";
    String v_memberday = "";
    // String v_jikup = "";
    String v_compnm = "";
    // String v_gamelicyn = "";

    // ������� �÷��� �������� �ֹι�ȣ���� ��������� �����´�.
    String v_resno1_Year = "";
    String v_resno1_Month = "";
    String v_resno1_Day = "";

    if (dbox != null ) {
       v_handphone = dbox.get("d_handphone");
       v_userid = dbox.get("d_userid");
       v_name = dbox.get("d_name");
       v_sex = dbox.get("d_sex");
       // v_home_addr = dbox.get("d_addr").substring(0,2);
       v_email = dbox.get("d_email");
       // v_hometel = dbox.get("d_hometel");
       v_ismailing = dbox.get("d_ismailing");
       // v_workfieldcd = dbox.get("d_workfieldcd");
       v_memberyear = dbox.get("d_memberyear");
       v_membermonth = dbox.get("d_membermonth");
       v_memberday = dbox.get("d_memberday");
       // v_jikup = dbox.get("d_jikup");
       // v_compnm = dbox.get("d_compnm");
       // v_gamelicyn = dbox.get("d_gamelicyn");
   }

    String[]handphone = new String[3];
    int index = 0;
    StringTokenizer st = new StringTokenizer(v_handphone, "-");
    while(st.hasMoreTokens()) {
        handphone[index++] = st.nextToken();
    }

    String[]hometel = new String[3];
    index = 0;
    /*
    st = new StringTokenizer(v_hometel, "-");
    while(st.hasMoreTokens()) {
        hometel[index++] = st.nextToken();
    }
    */

    String[]email = new String[2];
    index = 0;
    st = new StringTokenizer(v_email, "@");
    while(st.hasMoreTokens()) {
        email[index++] = st.nextToken();
    }

    String[]home_addr = new String[2];
    index = 0;
    /*
    st = new StringTokenizer(v_home_addr, "@");
    while(st.hasMoreTokens()) {
        home_addr[index++] = st.nextToken();
    }
    */

    box.put("title_str", "�⺻�������� - �������� - ���θ޴�");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<!-- ��ũ��Ʈ���� -->

<script type="text/javascript">
/**
 * ����� ȸ�������� �����Ѵ�.
 */
function Submit_Check(){
    var fm = document.form1;
    // var v_hometel = fm.p_hometel1.value+'-'+fm.p_hometel2.value+'-'+fm.p_hometel3.value;
    var v_handphone = fm.p_handphone1.value+'-'+fm.p_handphone2.value+'-'+fm.p_handphone3.value;
    var v_email = fm.p_email1.value+'@'+fm.p_email2.value;

    var chk_num = "";
    var chk_lower = "";
    var chk_upper = "";
    var chk_special = "";

    /*
    if( (fm.p_hometel1.value) == "" ){
        alert("��ȭ��ȣ�� �Է��ϼ���");
        fm.p_hometel1.focus(); return;
    } else if ( (fm.p_hometel2.value) == "" || fm.p_hometel2.length > 4 ){
        alert("��ȭ��ȣ�� �ٸ��� �Է��ϼ���");
        fm.p_hometel2.focus(); return;
    } else if ( (fm.p_hometel3.value) == "" || fm.p_hometel3.length > 4 ){
        alert("��ȭ��ȣ�� �ٸ��� �Է��ϼ���");
        fm.p_hometel3.focus(); return;
    }
    */

    if( (fm.p_handphone1.value) == "" ){
        alert("�ڵ��� ��ȣ�� �Է��ϼ���");
        fm.p_handphone1.focus(); return;
    }else if( (fm.p_handphone2.value) == "" || fm.p_handphone2.length > 4 ){
        alert("�ڵ��� ��ȣ�� �ٸ��� �Է��ϼ���");
        fm.p_handphone2.focus(); return;
    }else if( (fm.p_handphone3.value) == "" || fm.p_handphone3.length > 4 ){
        alert("�ڵ��� ��ȣ�� �ٸ��� �Է��ϼ���");
        fm.p_handphone3.focus(); return;
    }

    if (fm.p_email1.value =="" || fm.p_email2.value == ""){
        alert("Email �ּҸ� �ٸ��� �Է��ϼ���");
        fm.p_email1.focus();return;
    }

    if(is_mail(v_email) == false) {
        alert("��Ȯ�� E-Mail�� �Է��Ͻʽÿ�.");
        fm.p_email1.focus();
        return;
    }

    /*
    if( fm.p_jikup.value == "" ){
        alert("������ �����Ͻʽÿ�.");
        return;
    }

    if( fm.p_workfieldcd.value == "" ){
        alert("����о߸� �����Ͻʽÿ�.");
        return;
    }

    if( fm.p_compnm.value == "" ){
        alert("�Ҽ��� �Է��ϼ���.");
        return;
    }
    */

    if ( confirm("ȸ�������� �����Ͻðڽ��ϱ�?") ) {
        document.form1.target="_self";
        document.form1.action= https_host() + "/servlet/controller.homepage.MainMemberJoinServlet";
        document.form1.p_handphone.value = v_handphone;
        // document.form1.p_hometel.value = v_hometel;
        document.form1.p_email.value = v_email;
        document.form1.p_process.value="MemberInfoUpdateOk";
        document.form1.submit();
    }
}

//-------------------------------------------------------
// �̸��� �� �̸������� ID�˻�
//-------------------------------------------------------
function is_mail(strEmail)
{
    /** ��������
     - @�� 2���̻�
     - .�� �پ ������ ���
     -  @.��  .@�� �����ϴ� ���
     - ��ó����.�� ��� **/
    var regDoNot = /(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/;

    /** �ʼ�����
     - @������ �ϳ��̻��� ���ڰ� �־�� ��
     - @�� �ϳ��־�� ��
     - Domain�� .�� �ϳ� �̻� �־�� ��
     - Domain���� ������ ���ڴ� ������ 2~4���̾�� �� **/
    var regMust = /^[a-zA-Z0-9\-\.\_]+\@[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4})$/;

    if ( !regDoNot.test(strEmail) && regMust.test(strEmail) ){
        return true;
    }else{
        return false;
    }
}

function emailChange() {
    var r=$("[name='p_email3']").val();
    $("[name='p_email2']").val(r);
    if(r == ""){
        $("[name='p_email2']").attr("readonly",false);
    }else{
        $("[name='p_email2']").attr("readonly",true);
    }
}

function checkYN()
{
    var r=$("[name='p_ismailing']").val();
    if(r=="Y")
        $("[name='p_ismailing']").val("N");
    else
        $("[name='p_ismailing']").val("Y");
}

//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- container-new ���� //-->
<div id="container-new">

    <!-- form ���� -->
    <form name="form1"  action="/" method="post" action="">
        <input type="hidden"    name="p_process"    value="" />
        <input type="hidden"    name="p_handphone" />
        <input type="hidden"    name="p_hometel" />
        <input type="hidden"    name="p_email" />
        <input type="hidden"    name="p_postgubun" value=""/>
        <input type="hidden"    name="p_chk" />
        <input type="hidden"    name="p_kor_name" value="<%=v_name%>" />
        <input type="hidden"    name="p_userid" value="<%= v_userid %>" />

        <div id="mainMenu">
            <!-- �н����� -->
            <ul class="location">
                <li>���θ޴�</li>
                <li>�������� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>
                        <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">�¶��� ���ǽ�</a></li>
                        <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage">���屳��</a></li>
                        <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=MINE">�����ۼ��� ��</a></li>
                        <li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage">��㳻��</a></li>
                        <li><a href="#" class="active">��������</a></li>
                    </ul>
                </li>
                <!-- 2015-01-09 ���� ����
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
            <!-- 2015-01-09 ���� ����
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
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate"><img src="/images/2013/support/tabinfo1_on.jpg" alt="�⺻��������" /></a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=ChangePwd"><img src="/images/2013/support/tabinfo2_off.jpg" alt="��й�ȣ����" /></a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberWithdraw"><img src="/images/2013/support/tabinfo3_off.jpg" alt="ȸ��Ż��" /></a></li>
                </ul>
                <h3 class="blind">���� �� ���� ������ġ</h3>

                <p class="sidetxt"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" />�� �ʼ� �Է� �׸��Դϴ�.</p>
                <div class="tableWrap space2">
                    <table class="dataTable2" summary="�� ǥ�� �� �������� �⺻�������� ǥ�� ����(�ѱ�),���̵�,����,�������,��ȭ��ȣ,����Ϲ�ȣ,�ּ�(��������),�̸���,����,����о�,�Ҽ�,�������� ���� �������� ���� �Ǿ� �ֽ��ϴ�.">
                        <caption>�� �������� �⺻�������� ǥ</caption>
                        <colgroup>
                            <col width="18%"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row"><label for="f_dName">����(���̵�)</label></th>
                            <td><%=v_name %> (<%=v_userid %>)</td>
                        </tr>
                        <!--<tr>
                            <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="f_identity">���̵�</label></th>
                            <td><%=v_userid %></td>
                        </tr>
                        <tr>
                            <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" />����</th>
                            <td>
                                <span class="rd0"><label><input type="radio" name="p_sex" id="male" value="1"  <%= v_sex.equals("1") ? "checked" : ""%> disabled="disabled" /> ����</label></span>
                                <span class="rd1"><label><input type="radio" name="p_sex" id="female" value="2"  <%= v_sex.equals("2") ? "checked" : ""%> disabled="disabled" /> ����</label></span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="f_birth">�������</label></th>
                            <td>
                                <input type="hidden" name="p_memberyear" class="inputText" size="4" value="<%=v_memberyear %>" />
                                <input type="hidden" name="p_membermonth" class="inputText" size="2" title="�¾ �� �Է�" value="<%=v_membermonth %>" />
                                <input type="hidden" name="p_memberday" class="inputText" size="2" title="�¾ �� �Է�" value="<%=v_memberday %>" />
                                <%=v_memberyear %>&nbsp;��&nbsp;&nbsp;<%=v_membermonth %>&nbsp;��&nbsp;&nbsp;<%=v_memberday %>&nbsp;��
                            </td>
                        </tr>-->
                        <!--
                        <tr>
                            <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="f_tel">��ȭ��ȣ</label></th>
                            <td>
                                <select class="select" name="p_hometel1" id="f_tel">
                                    <option value="070" <%--  hometel[0].equals("070") ? "selected" : ""  --%>>070</option>
                                    <option value="02"  <%--  hometel[0].equals("02")  ? "selected" : ""  --%>>02</option>
                                    <option value="051" <%--  hometel[0].equals("051") ? "selected" : ""  --%>>051</option>
                                    <option value="053" <%--  hometel[0].equals("053") ? "selected" : ""  --%>>053</option>
                                    <option value="032" <%--  hometel[0].equals("032") ? "selected" : ""  --%>>032</option>
                                    <option value="062" <%--  hometel[0].equals("062") ? "selected" : ""  --%>>062</option>
                                    <option value="042" <%--  hometel[0].equals("042") ? "selected" : ""  --%>>042</option>
                                    <option value="052" <%--  hometel[0].equals("052") ? "selected" : ""  --%>>052</option>
                                    <option value="031" <%--  hometel[0].equals("031") ? "selected" : ""  --%>>031</option>
                                    <option value="033" <%--  hometel[0].equals("033") ? "selected" : ""  --%>>033</option>
                                    <option value="044" <%--  hometel[0].equals("044") ? "selected" : ""  --%>>044</option>
                                    <option value="043" <%--  hometel[0].equals("043") ? "selected" : ""  --%>>043</option>
                                    <option value="041" <%--  hometel[0].equals("041") ? "selected" : ""  --%>>041</option>
                                    <option value="063" <%--  hometel[0].equals("063") ? "selected" : ""  --%>>063</option>
                                    <option value="061" <%--  hometel[0].equals("061") ? "selected" : ""  --%>>061</option>
                                    <option value="054" <%--  hometel[0].equals("054") ? "selected" : ""  --%>>054</option>
                                    <option value="055" <%--  hometel[0].equals("055") ? "selected" : ""  --%>>055</option>
                                    <option value="064" <%--  hometel[0].equals("064") ? "selected" : ""  --%>>064</option>
                                </select>
                                - <input type="text" name="p_hometel2" value="<%--  hometel[1] --%>" class="inputText" size="4" maxlength="4" title="���� �Է�" />
                                - <input type="text" name="p_hometel3" value="<%--  hometel[2] --%>" class="inputText" size="4" maxlength="4" title="�� 4�ڸ��Է�" />
                            </td>
                        </tr>
                        //-->
                        <tr>
                            <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="f_mobile">�޴���ȭ��ȣ</label></th>
                            <td>
                                <select class="select" name="p_handphone1" id="f_mobile">
                                    <option value="010" <%= handphone[0].equals("010") ? "selected" : "" %>>010</option>
                                    <option value="011" <%= handphone[0].equals("011") ? "selected" : "" %>>011</option>
                                    <option value="016" <%= handphone[0].equals("016") ? "selected" : "" %>>016</option>
                                    <option value="017" <%= handphone[0].equals("017") ? "selected" : "" %>>017</option>
                                    <option value="018" <%= handphone[0].equals("018") ? "selected" : "" %>>018</option>
                                    <option value="019" <%= handphone[0].equals("019") ? "selected" : "" %>>019</option>
                                </select>
                                - <input type="text" name="p_handphone2" value="<%= handphone[1]%>" class="inputText" size="4" maxlength="4" title="��� �ڸ� �Է�" />
                                - <input type="text" name="p_handphone3" value="<%= handphone[2]%>" class="inputText" size="4" maxlength="4" title="�� 4�ڸ��Է�" />
                            </td>
                        </tr>
                        <!--
                        <tr>
                            <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="f_area">����</label></th>
                            <td>
                                <select class="select" name="p_home_addr1" id="f_area">
                                    <option value="����" <%--  home_addr[0].equals("����") ? "selected" : ""  --%>>����</option>
                                    <option value="���" <%--  home_addr[0].equals("���") ? "selected" : ""  --%>>���</option>
                                    <option value="�泲" <%--  home_addr[0].equals("�泲") ? "selected" : ""  --%>>�泲</option>
                                    <option value="���" <%--  home_addr[0].equals("���") ? "selected" : ""  --%>>���</option>
                                    <option value="����" <%--  home_addr[0].equals("����") ? "selected" : ""  --%>>����</option>
                                    <option value="�뱸" <%--  home_addr[0].equals("�뱸") ? "selected" : ""  --%>>�뱸</option>
                                    <option value="����" <%--  home_addr[0].equals("����") ? "selected" : ""  --%>>����</option>
                                    <option value="�λ�" <%--  home_addr[0].equals("�λ�") ? "selected" : ""  --%>>�λ�</option>
                                    <option value="����" <%--  home_addr[0].equals("����") ? "selected" : ""  --%>>����</option>
                                    <option value="���" <%--  home_addr[0].equals("���") ? "selected" : ""  --%>>���</option>
                                    <option value="��õ" <%--  home_addr[0].equals("��õ") ? "selected" : ""  --%>>��õ</option>
                                    <option value="����" <%--  home_addr[0].equals("����") ? "selected" : ""  --%>>����</option>
                                    <option value="����" <%--  home_addr[0].equals("����") ? "selected" : ""  --%>>����</option>
                                    <option value="����" <%--  home_addr[0].equals("����") ? "selected" : ""  --%>>����</option>
                                    <option value="�泲" <%--  home_addr[0].equals("�泲") ? "selected" : ""  --%>>�泲</option>
                                    <option value="���" <%--  home_addr[0].equals("���") ? "selected" : ""  --%>>���</option>
                                </select>
                            </td>
                        </tr>
                        //-->
                        <tr>
                            <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="f_dEmail">�̸���</label></th>
                            <td>
                                <input type="text" name="p_email1"  value="<%= email[0]%>" id="f_dEmail" class="inputText" size="17" title="�̸��� ���̵� �Է�"/> @
                                <input type="text" name="p_email2"  value="<%= email[1]%>" class="inputText" size="30" title="�̸��� ������ �Է�"/>
                                <select class="select" name="p_email3" onchange="emailChange();" title="�̸����ּ� ����">
                                    <option value="" >�����Է�</option>
                                    <option value="gmail.com" >gmail.com</option>
                                    <option value="hanmail.net">hanmail.net</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="hotmail.com">hotmail.com</option>
                                    <option value="nate.com">nate.com</option>
                                    <option value="naver.com">naver.com</option>
                                </select>
                            </td>
                        </tr>
                        <!--
                        <tr>
                            <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="f_dJob">����</label></th>
                            <td>
                                <select id="f_dJob" name="p_jikup" class="select">
                                    <option value="01" <%-- =v_jikup.equals("01") ? "selected" : "" --%> >����л� ����</option>
                                    <option value="02" <%-- =v_jikup.equals("02") ? "selected" : "" --%>>���л� (���п�)</option>
                                    <option value="03" <%-- =v_jikup.equals("03") ? "selected" : "" --%>>������ (����)</option>
                                    <option value="04" <%-- =v_jikup.equals("04") ? "selected" : "" --%>>�������</option>
                                    <option value="05" <%-- =v_jikup.equals("05") ? "selected" : "" --%>>��������</option>
                                    <option value="06" <%-- =v_jikup.equals("06") ? "selected" : "" --%>>���������</option>
                                    <option value="07" <%-- =v_jikup.equals("07") ? "selected" : "" --%>>ȸ���</option>
                                    <option value="08" <%-- =v_jikup.equals("08") ? "selected" : "" --%>>�ֺ�</option>
                                    <option value="09" <%-- =v_jikup.equals("09") ? "selected" : "" --%>>����</option>
                                    <option value="10" <%-- =v_jikup.equals("10") ? "selected" : "" --%>>������</option>
                                    <option value="11" <%-- =v_jikup.equals("11") ? "selected" : "" --%>>�Ƿ���</option>
                                    <option value="12" <%-- =v_jikup.equals("12") ? "selected" : "" --%>>������</option>
                                    <option value="13" <%-- =v_jikup.equals("13") ? "selected" : "" --%>>�����</option>
                                    <option value="14" <%-- =v_jikup.equals("14") ? "selected" : "" --%>>������</option>
                                    <option value="15" <%-- =v_jikup.equals("15") ? "selected" : "" --%>>������</option>
                                    <option value="16" <%-- =v_jikup.equals("16") ? "selected" : "" --%>>ü����</option>
                                    <option value="17" <%-- =v_jikup.equals("17") ? "selected" : "" --%>>����</option>
                                    <option value="18" <%-- =v_jikup.equals("18") ? "selected" : "" --%>>����</option>
                                    <option value="19" <%-- =v_jikup.equals("19") ? "selected" : "" --%>>�ڿ���</option>
                                    <option value="99" <%-- =v_jikup.equals("99") ? "selected" : "" --%>>��Ÿ</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="f_dJobpart">����о�</label></th>
                            <td>
                                <select id="f_dJobpart" name="p_workfieldcd" class="select">
                                    <option value=01 <%-- =v_workfieldcd.equals("01") ? "selected" : "" --%>>����</option>
                                    <option value=02 <%-- =v_workfieldcd.equals("02") ? "selected" : "" --%>>��ȭ</option>
                                    <option value=03 <%-- =v_workfieldcd.equals("03") ? "selected" : "" --%>>�����</option>
                                    <option value=04 <%-- =v_workfieldcd.equals("04") ? "selected" : "" --%>>���</option>
                                    <option value=05 <%-- =v_workfieldcd.equals("05") ? "selected" : "" --%>>�ִϸ��̼�</option>
                                    <option value=06 <%-- =v_workfieldcd.equals("06") ? "selected" : "" --%>>�������θ�Ʈ</option>
                                    <option value=07 <%-- =v_workfieldcd.equals("07") ? "selected" : "" --%>>��ȭ</option>
                                    <option value=08 <%-- =v_workfieldcd.equals("08") ? "selected" : "" --%>>����</option>
                                    <option value=09 <%-- =v_workfieldcd.equals("09") ? "selected" : "" --%>>ĳ����</option>
                                    <option value=10 <%-- =v_workfieldcd.equals("10") ? "selected" : "" --%>>����</option>
                                    <option value=11 <%-- =v_workfieldcd.equals("11") ? "selected" : "" --%>>�μ�</option>
                                    <option value=12 <%-- =v_workfieldcd.equals("12") ? "selected" : "" --%>>����</option>
                                    <option value=13 <%-- =v_workfieldcd.equals("13") ? "selected" : "" --%>>������</option>
                                    <option value=14 <%-- =v_workfieldcd.equals("14") ? "selected" : "" --%>>����</option>
                                    <option value=15 <%-- =v_workfieldcd.equals("15") ? "selected" : "" --%>>����</option>
                                    <option value=16 <%-- =v_workfieldcd.equals("16") ? "selected" : "" --%>>�̼�ǰ</option>
                                    <option value=17 <%-- =v_workfieldcd.equals("17") ? "selected" : "" --%>>����ǰ</option>
                                    <option value=18 <%-- =v_workfieldcd.equals("18") ? "selected" : "" --%>>�м�</option>
                                    <option value=19 <%-- =v_workfieldcd.equals("19") ? "selected" : "" --%>>����</option>
                                    <option value=20 <%-- =v_workfieldcd.equals("20") ? "selected" : "" --%>>SW</option>
                                    <option value=21 <%-- =v_workfieldcd.equals("21") ? "selected" : "" --%>>HW</option>
                                    <option value=22 <%-- =v_workfieldcd.equals("22") ? "selected" : "" --%>>�Ź�</option>
                                    <option value=99 <%-- =v_workfieldcd.equals("99") ? "selected" : "" --%>>��Ÿ</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="f_dGroup">�Ҽ�</label></th>
                            <td>
                                <input type="text" name="p_compnm"  value="<%=v_compnm %>" id="f_dGroup" class="inputText" size="45" />
                            </td>
                        </tr>
                        //-->

                        <tr>
                            <th scope="row">�������� ����</th>
                            <td>
                                <span class="rd0"><label><input type="checkbox" name="p_ismailing" onclick="checkYN();" value="<%= v_ismailing %>" <% if(v_ismailing.equals("Y")) out.println("checked='checked'");%> />&nbsp;&nbsp;���� �� �̺�Ʈ �ҽ��� E-Mail Ȥ�� SMS���� �����ϰڽ��ϴ�.</label></span>
                            </td>
                        </tr>
                        <!--
                        <tr>
                            <th scope="row"><label for="f_gamelicyn">�����ڰ���</label></th>
                            <td>
                                <select class="select" name="p_gamelicyn" id="f_gamelicyn">
                                    <option value="Y" <%-- =v_gamelicyn.equals("Y") ? "selected" : "" --%>>����</option>
                                    <option value="N" <%-- =v_gamelicyn.equals("N") ? "selected" : "" --%>>�̺���</option>
                                </select>
                            </td>
                        </tr>
                        //-->
                        </tbody>
                    </table>
                </div>
                <!-- //tableWrap -->

                <div class="btnArea">
                    <button type="button" onclick="javascript:Submit_Check();"class="btnText"><span>�� �������� �����մϴ�.</span></button>
                    <a href="javascript:history.go(-1);"  class="btnText2"><span>ȸ������ ������ ����մϴ�.</span></a>
                </div>

            </div>
            <!-- //#subCont -->

        </div>
    </form>

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>