<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.cp.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    box.put("title_str", "���� �� ���� - ���޹��� - ��ī���̼Ұ�");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<script>

function insert_check() {
    if(val_check()){
        document.form1.action = "/servlet/controller.homepage.HomePageContactServlet";
        document.form1.p_process.value = "insertContactEtc";
        document.form1.submit();
    }
}

function val_check(){
    var f = document.form1;

    if(f.username.value == ""){
        alert("������ �Է��� �ּ���.");
        f.username.focus();
        return false;
    }

    if(f.tel1.value == "" || f.tel2.value == "" || f.tel3.value == ""){
        alert("����ó�� �Է��� �ּ���.");
        if(f.tel1.value == ""){ f.tel1.focus();}
        if(f.tel2.value == ""){ f.tel2.focus();}
        if(f.tel3.value == ""){ f.tel3.focus();}
        return false;
    }

    if(f.email1.value == "" || f.email2.value == ""){
        alert("�̸��� �ּҸ� �Է��� �ּ���.");
        if(f.email1.value == ""){ f.email1.focus();}
        if(f.email2.value == ""){ f.email2.focus();}
        return false;
    }

    if(f.title.value == ""){
        alert("������ �Է��� �ּ���.");
        f.title.focus();
        return false;
    }

    if(f.content.value == ""){
        alert("������ �Է��� �ּ���.");
        f.content.focus();
        return false;
    }
    return true;
}


function emailChange() {
    var r=$("[name='email3']").val();
    $("[name='email2']").val(r);
    if(r == ""){
        $("[name='email2']").attr("readonly",false);
    }else{
        $("[name='email2']").attr("readonly",true);
    }
}
</script>
<!-- container-new ���� //-->
<div id="container-new">

        <div id="mainMenu">
                <!-- ��ī���� �Ұ� -->
            <ul class="location">
                <li>Ȩ</li>
                <li>��ī���̼Ұ�</li>
                <li>
                    ���޹��� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul style="z-index: 1;">
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Vision">��ī���̼Ұ�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage">�λ縻</a></li>
                        <!-- 2015-03-18 ����
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility">�ü��Ұ�</a></li>
                        //-->
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu">������� �ȳ�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=PR">ȫ������</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=COOPER">�������±��</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus" class="active">���޹���</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Direction">���ô� ��</a></li>
<!-- 2015-01-08 �������
                        <li><a href="/servlet/controller.infomation.BriefingHomePageServlet?p_process=selectList">�����ڷ�</a></li>
-->

                    </ul>
                </li>
            </ul>
            <!-- 2015-01-08 ���� ����
            <div class="introCategory">
                <ul>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage">������� �λ縻</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility">�ü��Ұ�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu">������� �ȳ�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=PR">ȫ������</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=COOPER">�������±��</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Direction">���ô� ��</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus"><strong><u>���޹���</u></strong></a></li>
                    <li><a href="/servlet/controller.infomation.BriefingHomePageServlet?p_process=selectList">�����ڷ�</a></li>
                </ul>
            </div>
            //-->
        </div>

        <!-- ������ ���� ���� -->
        <div id="contents">
        <form name="form1" method="post" enctype="multipart/form-data" action="/servlet/controller.homepage.HomePageContactServlet">
        <input type = "hidden" name="p_process"    value = "insertContactEtc">
            <h2 class="subTit">���޹���<!--<img src="/images/2013/introduce/contactus_title.gif" alt="contact us" />//--></h2>
            <div id="subCont">
                <ul class="tabCus">
                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus"><img src="/images/2013/introduce/tabcus1_off.jpg" alt="��ü������û" /></a></li>
                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactetc"><img src="/images/2013/introduce/tabcus2_on.jpg" alt="���� �� ����" /></a></li>
                </ul>
                <h3 class="blind">���� �� ���� ������ġ</h3>

                <div class="noticBox nbox1">
                    �ѱ���������ī���̴� �� �������� ��� �ǰ��� �����ϰ� �赵�� �ϰڽ��ϴ�.
                </div>

                <h4 class="subTit">���� �� ���� �ۼ�</h4>
                <p class="sidetxt"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" />�� �ʼ� �Է� �׸��Դϴ�.</p>
                <div class="tableWrap space2">
                    <table class="dataTable" summary="�� ǥ�� ���� �� ���� �ۼ� ǥ�� ����,����ó,�̸���,�з�,����,����,���ø�ũ, ����÷�� �������� ���� �Ǿ� �ֽ��ϴ�.">
                        <caption>���� �� ���� �ۼ� ǥ</caption>
                        <colgroup>
                            <col width="18%"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row"><label for="dName">����</label><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /></th>
                            <td><input type="text" name="username" id="dName" class="inputText" size="40" /></td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="tel">����ó</label><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /></th>
                            <td><input type="text" name="tel1" maxlength="3" id="tel" class="inputText" size="3" title="�� 3�ڸ� �Է�"/>-<input type="text" name="tel2" maxlength="4" class="inputText" size="4" title="��� �ڸ� �Է�" />-<input type="text" name="tel3" maxlength="4" class="inputText" size="4" title="�� 4�ڸ��Է�" /></td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="dEmail">�̸���</label><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /></th>
                            <td>
                                <input type="text" name="email1" id="dEmail" class="inputText" size="17" title="�̸��� ���̵� �Է�"/> @
                                <input type="text" name="email2" class="inputText" size="10" title="�̸��� �ּ� �Է�"/>
                                <select class="select" name="email3" title="�̸����ּ� ����" onclick="emailChange()">
                                    <option value="">�����Է�</option>
                                    <option value="naver.com" >naver.com</option>
                                    <option value="chol.com" >chol.com</option>
                                    <option value="empal.com" >empal.com</option>
                                    <option value="gmail.com" >gmail.com</option>
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
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="dSort">�з�</label><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /></th>
                            <td>
                                <select name="category" id="dSort" class="select">
                                    <option value="1">�Ϲݹ���</option>
                                    <option value="2">�������</option>
                                    <option value="3">������</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="dSubject">����</label><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /></th>
                            <td><input type="text" name="title" id="dSubject" class="inputText" size="100" /></td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="dsubs">����</label><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /></th>
                            <td>
                                <textarea name="content" id="dsubs" class="textArea" rows="18" cols="10"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="dlinks">���ø�ũ</label></th>
                            <td><input type="text" name="link" id="dlinks" class="inputText"  value="http://" /></td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="dfile">����÷��</label></th>
                            <td><input type="file" name ="p_file" id="dfile" class="inputFile" size="30" /></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //tableWrap -->

                <div class="btnArea">
                    <button type="submit" class="btnText" onclick=""><span>�� �������� ����մϴ�.</span></button>
                </div>

            </div>
            <!-- //#subCont -->
        </form>
        </div>

</div>
<!--  //container-new �� //-->
<%@ include file="/learn/user/2013/portal/include/footer.html"%>
