<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    box.put("title_str", "Ȩ������ �����ǰ� - �̿�ȳ�");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
//�Էµ� ���� ����
function insert() {
    var f = document.form1;
    var v_email = f.p_email1.value+'@'+f.p_email2.value;

    if(f.p_title.value == ""){alert("������ �Է����ּ���");f.p_title.focus();return;}

    if(f.p_smsyn.checked){
        if(is_mail(v_email) == false){
            alert("��Ȯ�� E-Mail�� �Է��Ͻʽÿ�.");
            f.p_email1.focus();
            return;
        }
        f.p_smsyn.value = "Y";
    }else{
        f.p_smsyn.value = "N";
    }

    if (realsize(f.p_contents.value) < 1) {alert("������ �Է����ּ���");f.p_contents.focus();return;}

    f.p_email.value = v_email;
    f.action = "/servlet/controller.homepage.HomePageContactServlet";
    f.p_process.value = "insertWebReport";

    if(confirm("����Ͻðڽ��ϱ�?")){f.submit();}
}

//���ڼ� üũ
function realsize( value ) {
 var len = 0;
 if ( value == null ) return 0;
 for(var i=0;i<value.length;i++){
     var c = escape(value.charAt(i));
     if ( c.length == 1 ) len ++;
     else if ( c.indexOf("%u") != -1 ) len += 2;
     else if ( c.indexOf("%") != -1 ) len += c.length/3;
 }
 return len;
}


//-------------------------------------------------------
//�̸��� �� �̸������� ID�˻�
//-------------------------------------------------------
function is_mail(strEmail){
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

//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- container-new ���� //-->
<div id="container-new">

    <!-- Form ���� ���� -->
    <form name="form1" method = "post" action="/servlet/controller.homepage.HomePageContactServlet">
    <input type="hidden" name="p_process" />
    <input type="hidden" name="p_email" />

        <div id="mainMenu">
            <!-- �н����� -->
            <ul class="location">
                <li>Ȩ</li>
                <li>�̿�ȳ� 
                    <!--
                    <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>
                    -->
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <!--
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">FAQ</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
                        <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List">��������</a></li>
                        
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome" class="active">�̿�ȳ�</a></li>
                    </ul>
                    -->
                </li>
                <li>
                    Ȩ������ �����ǰ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
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
                        <!-- <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate">�� ���� ����</a></li> //-->
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=PersonalNew">��������ó����ħ</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=UserAgree">�̿���</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&amp;p_code=FOOTER_EMAIL">�̸��Ϲ��ܼ����ź�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport" class="active">Ȩ������ �����ǰ�</a></li>
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
                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport"><strong><u>Ȩ������ �����ǰ�</u></strong></a></li>
                </ul>
            </div>
        </div>
        <!-- //#mainMenu -->


        <!-- ������ ���� ���� -->
        <div id="contents">
            <h2 class="subTit">Ȩ������ �����ǰ�<!--<img src="../images/2013/support/webcare_title.gif" alt="Ȩ������ �����ǰ�" />//--></h2>

            <div id="subCont">
                <div class="webimgBox">
                    <h3 class="blind">�ѱ���������ī����  Ȩ������ �����ǰ�</h3>
                    �ѱ���������ī���� Ȩ�������� �湮�� �ּż� �����մϴ�.<br />
                    <strong>Ȩ������ �̿뿡 �����Ͽ� �����ǰ� ����</strong>�� �����ֽø� ���� �� �ݿ��ϰڽ��ϴ�.<br />
                    �̸��� �ּҸ� �Բ� �����ֽø� ó�� �����Ȳ�� �޾ƺ��� �� �ֽ��ϴ�.<br /><br />

                    ��Ÿ �Ϲ� �̿���� ��������� �н�����>�������Ǹ� �̿��� �ֽñ� �ٶ��ϴ�.
                </div>
                <input type="hidden" name="p_gubun" value="C1"/>
                <div class="tableWrap space2">
                    <table class="dataTable2" summary="�� ǥ�� Ȩ������ �����ǰ� ���� ǥ�� ����, ����ó(����), ����Ű������� �����Ǿ� �ֽ��ϴ�.">
                        <caption>Ȩ������ �����ǰ� ���� ǥ</caption>
                        <colgroup>
                            <col width="18%"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="title">����</label></th>
                            <td><input type="text" name="p_title" id="title"  class="inputText" size="98" /></td>
                        </tr>
                        <tr>
                            <th scope="row"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /><label for="report">����</label></th>
                            <td><textarea id="report" name="p_contents" class="textArea" rows="7" cols="13"></textarea></td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="f_dEmail">�̸���</label></th>
                            <td>
                                <input type="text" name="p_email1" id="f_dEmail" class="inputText" size="15" title="�̸��� ���̵� �Է�"/> @
                                <input type="text" name="p_email2" class="inputText" size="20" title="�̸��� ������ �Է�"/>
                                <select class="select" name="p_email3" title="�̸����ּ� ����" onchange="emailChange();">
                                    <option value="">�����Է�</option>
                                    <option value="naver.com" >naver.com</option>
                                    <option value="chol.com" >chol.com</option>
                                    <option value="dreamwiz.com" >dreamwiz.com</option>
                                    <option value="empal.com" >empal.com</option>
                                    <option value="freechal.com" >freechal.com</option>
                                    <option value="gmail.com" >gmail.com</option>
                                    <option value="hanafos.com" >hanafos.com</option>
                                    <option value="hanmail.net" >hanmail.net</option>
                                    <option value="hanmir.com" >hanmir.com</option>
                                    <option value="hitel.net" >hitel.net</option>
                                    <option value="hotmail.com" >hotmail.com</option>
                                    <option value="korea.com" >korea.com</option>
                                    <option value="lycos.co.kr" >lycos.co.kr</option>
                                    <option value="nate.com" >nate.com</option>
                                    <option value="netian.com" >netian.com</option>
                                    <option value="paran.com" >paran.com</option>
                                    <option value="yahoo.com" >yahoo.com</option>
                                    <option value="yahoo.co.kr" >yahoo.co.kr</option>
                                </select>
                                <span class="rd0">&nbsp;&nbsp;<input type="checkbox" name="p_smsyn" id="sms" /> <label for="sms">ó�������� E-mail�� �޾ƺ��ϴ�</label></span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //tableWrap -->

                <div class="btnArea wd3">
                    <a href="javascript:insert();" class="btnText"><span>����մϴ�</span></a>
                </div>

            </div>
            <!-- //#subCont -->
        </div>
        <!-- ������ ���� �� -->

    </form>

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>