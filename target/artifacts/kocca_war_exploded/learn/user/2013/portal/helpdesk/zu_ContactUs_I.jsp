<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.cp.*" %>

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    box.put("title_str", "��ü ���� ��û - ���޹��� - ��ī���̼Ұ�");
%>
<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
function insert_check() {
    if(val_check()){
        document.form1.action = "/servlet/controller.homepage.HomePageContactServlet";
        document.form1.p_process.value = "insertContactUs";
        document.form1.submit();
    }
}

function val_check(){
    var f = document.form1;

    if(f.company.value == ""){
        alert("��ü���� �Է��� �ּ���.");
        f.company.focus();
        return false;
    }

    if(f.addr.value == ""){
        alert("�ּҸ� �Է��� �ּ���.");
        f.addr.focus();
        return false;
    }

    if(f.com_name.value == ""){
        alert("������ �Է��� �ּ���.");
        f.com_name.focus();
        return false;
    }

    if(f.tel1.value == "" || f.tel2.value == "" || f.tel3.value == ""){
        alert("������ȭ��ȣ�� �Է��� �ּ���.");
        if(f.tel1.value == ""){ f.tel1.focus();}
        if(f.tel2.value == ""){ f.tel2.focus();}
        if(f.tel3.value == ""){ f.tel3.focus();}
        return false;
    }

    if(f.mobile1.value == "" || f.mobile2.value == "" || f.mobile3.value == ""){
        alert("����Ϲ�ȣ�� �Է��� �ּ���.");
        if(f.mobile1.value == ""){ f.mobile1.focus();}
        if(f.mobile2.value == ""){ f.mobile2.focus();}
        if(f.mobile3.value == ""){ f.mobile3.focus();}
        return false;
    }

    if(f.email1.value == "" || f.email2.value == ""){
        alert("�̸��� �ּҸ� �Է��� �ּ���.");
        if(f.email1.value == ""){ f.email1.focus();}
        if(f.email2.value == ""){ f.email2.focus();}
        return false;
    }

    var category = $(':radio[name="category"]:checked').val();
    if(category == "" || category == undefined){
        alert("��û�о߸� ������ �ּ���.");
        f.category.focus();
        return false;
    }

    if(f.edustart.value == "" || f.eduend.value == ""){
        alert("������û�Ⱓ�� �Է��� �ּ���.");
        f.edustart.focus();
        return false;
    }

    if(f.edustartday.value == ""){
        alert("�н��������� �Է��� �ּ���.");
        f.edustartday.focus();
        return false;
    }

    if(f.edustudent.value == ""){
        alert("�����԰��ο��� �Է��� �ּ���.");
        f.edustudent.focus();
        return false;
    }

    var c_file = f.p_file.value;
    c_file = c_file.substring(c_file.lastIndexOf(".")+1).toLowerCase();
    if(c_file != "gif" && c_file != "jpg" && c_file != "png"){
        alert("LOGO�� gif, jpg, png ���ϸ� ��� �� �� �ֽ��ϴ�.");
        f.p_file.focus();
        return false;
    }

    if(f.apply_subj.value == ""){
        alert("��û������ �Է��� �ּ���.");
        f.apply_subj.focus();
        return false;
    }

    if(f.domain.value == ""){
        alert("�������� �Է��� �ּ���.");
        f.domain.focus();
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
<!-- ��ũ��Ʈ�������� -->

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
            <h2 class="subTit">���޹���<!--<img src="/images/2013/introduce/contactus_title.gif" alt="contact us" />//--></h2>

            <div id="subCont">
                <ul class="tabCus">
                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus"><img src="/images/2013/introduce/tabcus1_on.jpg" alt="��ü������û" /></a></li>
                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactetc"><img src="/images/2013/introduce/tabcus2_off.jpg" alt="���� �� ����" /></a></li>
                </ul>
                <h3 class="blind">��ü������û ������ġ</h3>

                <div class="noticBox">
                    �ѱ������������ ���̹���ī���̿����� ���,���,�б� ������� ��ü�������񽺸� �����ϰ� �ֽ��ϴ�.<br />
                    ����, ��ȭ, ��� �о��� 135�� ������ ����� �����˴ϴ�.<br />
                    ��������� ���������� ��ȯ���� Ȱ��ǰ�, �б������� ���� ���� �� �α����� ���� ���·� �̷������ �ֽ��ϴ�.<br />
                    ��ü�������񽺴� ��ü ���̹��������� �����ص帮�� ü������ ������ ���� ��������� ���� �������� �����˴ϴ�.<br />
                    �ѱ���������ī���� �Ұ� �ڷḦ ���� �� �ڼ��� ���� Ȯ�� �����ϸ�, �ñ��Ͻ� ���� �Ʒ� ��ȣ�� �������� �����ֽñ� �ٶ��ϴ�.
                    <a href="/upload/contactus/2014_kocca_academy_guide.pdf" target="_blank" class="innerspace" style="vertical-align:top; width:220px;">
                        <img src="/images/fileicon/pdf_file.png" width="21" height="21" alt="" />
                        �ѱ���������ī���� �Ұ� �ٷκ���
                    </a>
                    �ѱ���������ī���� ������� : 02-2161-0077 /  <a href="mailto::edu_kocca@naver.com" alt="edu_kocca@naver.com">edu_kocca@naver.com</a>
                </div>

                <form id="groupinsert" name="form1" method="post" enctype="multipart/form-data" action="/servlet/controller.homepage.HomePageContactServlet">
                <input type="hidden" name="p_process" value="insertContactUs">

                <h4 class="subTit">�⺻�����Է�</h4>
                <p class="sidetxt"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" />�� �ʼ� �Է� �׸��Դϴ�.</p>
                <div class="tableWrap space2">
                    <table class="dataTable" summary="�� ǥ�� �⺻�����Է� ǥ�� ��ü��,�ּ�,�����,�̸��� �������� ���� �Ǿ� �ֽ��ϴ�.">
                        <caption>�⺻�����Է� ǥ</caption>
                        <colgroup>
                            <col width="15%"/>
                            <col width="15%"/>
                            <col width="23%"/>
                            <col width="15%"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th><label for="memberName">��ü��</label><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /></th>
                            <td colspan="4"><input type="text" name="company" id="memberName" class="inputText" size="40" /></td>
                        </tr>
                        <tr>
                            <th><label for="dAddres">�ּ�</label><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /></th>
                            <td colspan="4"><input type="text" name="addr" id="dAddres" class="inputText" size="50" /></td>
                        </tr>
                        <tr>
                            <th rowspan="2">������</th>
                            <td class="tdbg"><label for="dCharge">�μ�/����</label></td>
                            <td><input type="text" name="com_dept" id="dCharge" class="inputText" size="20" /></td>
                            <td class="tdbg"><label for="phone">������ȭ</label><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /></td>
                            <td>
                                <select name="tel1" id="phone" class="select">
                                    <option value="">������ȣ ����</option>
                                    <option value="070">070</option>
                                    <option value="02">02</option>
                                    <option value="031">031</option>
                                    <option value="032">032</option>
                                    <option value="033">033</option>
                                    <option value="041">041</option>
                                    <option value="042">042</option>
                                    <option value="043">043</option>
                                    <option value="044">044</option>
                                    <option value="051">051</option>
                                    <option value="052">052</option>
                                    <option value="053">053</option>
                                    <option value="054">054</option>
                                    <option value="055">055</option>
                                    <option value="061">061</option>
                                    <option value="062">062</option>
                                    <option value="063">063</option>
                                    <option value="064">064</option>
                                </select>-
                                <input type="text" name="tel2" class="inputText" size="4" maxlength="4" title="������ȭ �߰��ڸ� �Է�" />-
                                <input type="text" name="tel3" class="inputText" size="4" maxlength="4" title="������ȭ ���ڸ� �Է�"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdbg"><label for="dName">����</label><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /></td>
                            <td><input type="text" name="com_name" id="dName" class="inputText" size="20" /></td>
                            <td class="tdbg"><label for="mobile">����Ϲ�ȣ</label><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /></td>
                            <td>
                                <select name="mobile1" id="mobile" class="select">
                                    <option value="">�̵���ȣ ����</option>
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                </select>-
                                <input type="text" name="mobile2" class="inputText" size="4" maxlength="4" title="�̵���ȣ �߰��ڸ� �Է�" />-
                                <input type="text" name="mobile3" class="inputText" size="4" maxlength="4" title="�̵���ȣ ���ڸ� �Է�" />
                            </td>
                        </tr>
                        <tr>
                            <th><label for="dEmail">�̸���</label><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /></th>
                            <td colspan="2">
                                <input type="text" name="email1" id="email1" class="inputText" size="12" title="�̸��� ���̵� �Է�"/> @
                                <input type="text" name="email2" id="inmeildomain" class="inputText" size="10" title="�̸��� �ּ� �Է�"/>
                                <select id="selectmailtype" name="email3" onchange="emailChange();" class="select" title="�̸����ּ� ����">
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
                            <td class="tdbg"><label for="homepage">Ȩ������</label></td>
                            <td><input type="text" name="homepage" id="homepage" class="inputText" size="31" value="http://" /></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //tableWrap -->

                <h4 class="subTit">�н������Է�</h4>
                <p class="sidetxt"><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" />�� �ʼ� �Է� �׸��Դϴ�.</p>
                <div class="tableWrap space2">
                    <table class="dataTable" summary="�� ǥ�� ���� �� ���� �ۼ� ǥ�� ����,����ó,�̸���,�з�,����,����,���ø�ũ, ����÷�� �������� ���� �Ǿ� �ֽ��ϴ�.">
                        <caption>���� �� ���� �ۼ� ǥ</caption>
                        <colgroup>
                            <col width="150"/>
                            <col width="*"/>
                            <col width="150"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row">��û�о�<img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /></th>
                            <td colspan="3">
                                <span class="rd2">
                                    <label><input type="radio" name="category" class="inputRadio first" title="���" value="1" /> ���</label>
                                    <label><input type="radio" name="category" class="inputRadio" title="����" value="2" /> ����</label>
                                    <label><input type="radio" name="category" class="inputRadio" title="��ȭ" value="3" /> ��ȭ</label>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="dPeriod">������û�Ⱓ</label><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /></th>
                            <td><input type="text" name="edustart" id="startdate" class="inputText" size="10"/> ~ <input type="text" name="eduend" id="enddate" class="inputText" size="10" title="������û�Ⱓ" /></td>
                            <th scope="row"><label for="dPeriod1">�н�������</label><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /></th>
                            <td><input type="text" name="edustartday" id="learningstart" class="inputText" size="10"/></td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="dPeriod2">�н��Ⱓ</label><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /></th>
                            <td>
                                <select name="eduperiod" id="dPeriod2" class="select">
                                    <option value="1">1����</option>
                                    <option value="2">2����</option>
                                    <option value="3">3����</option>
                                </select>
                            </td>
                            <th scope="row"><label for="dExpect">�����԰��ο�</label><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /></th>
                            <td>
                                <input type="text" name="edustudent" id="dExpect" class="inputText" size="10"/> ��
                            </td>
                        </tr>
                        <tr>
                            <th><label for="dSort">������������</label><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /></th>
                            <td colspan="3">
                                1�� �ִ�
                                <select name="edusubjcnt" id="dSort" class="select">
                                    <option value="1">1�� ����</option>
                                    <option value="2">2�� ����</option>
                                    <option value="3">3�� ����</option>
                                    <option value="4">4�� ����</option>
                                    <option value="5">5�� ����</option>
                                    <option value="6">6�� ����</option>
                                    <option value="7">7�� ����</option>
                                    <option value="8">8�� ����</option>
                                    <option value="9">9�� ����</option>
                                </select> �� ������ �� �ֵ��� �����մϴ�.
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="dfile">LOGO���ε�</label><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /></th>
                            <td colspan="3">
                                <input type="file" name="p_file" id="dfile" class="inputFile" size="30" />
                                <span class="tTxt">���Բ��� �Ҽ��Ͻ� ��ü(���,�б�,���)�� �ΰ��̹���(gif,jpg,png ��)�� ����� �ּ���.</span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">��û����<img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /></th>
                            <td colspan="3" id="requestbox">
                                <span class="rd0"><label><input name="apply_gubun" value="1" id="allcourse" type="checkbox" class="checkBox" /> ��ü����</label></span>
                                <span class="rd1"><label><input name="apply_gubun" value="2" id="boardcastcourse" type="checkbox" class="checkBox" title="��û���� üũ" /> ��ۺо� ����</label></span>
                                <span class="rd1"><label><input name="apply_gubun" value="3" id="gamecourse" type="checkbox" class="checkBox" title="��û���� üũ" /> ���Ӻо� ����</label></span>
                                <span class="rd1"><label><input name="apply_gubun" value="4" id="culturecourse" type="checkbox" class="checkBox" title="��û���� üũ" /> ��ȭ�о� ����</label></span>
                                <textarea name="apply_subj" class="textArea" rows="7" cols="13"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="dQues2">��Ÿ����</label></th>
                            <td colspan="3">
                                <textarea name="etc" id="dQues2" class="textArea" rows="7" cols="13"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="dDomain">��û������</label><img src="/images/2013/introduce/ess_img.png" alt="�ʼ��׸� �Է�ǥ��" /></th>
                            <td colspan="3">http:// <input type="text" name="domain" id="dDomain" class="inputText" size="20" /> .edukocca.or.kr</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //tableWrap -->

                <div class="btnArea">
                    <button type="button" onclick="insert_check();" class="btnText"><span>�� �������� ��û�մϴ�.</span></button>
                </div>
            </form>
            </div>
            <!-- //#subCont -->

        </div>
        <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

        <script type="text/javascript">
            $(window).load(function() {
                //JqueryUI �޷�
                $.datepicker.regional['ko'] = {
                   closeText: '�ݱ�',
                   prevText: '����',
                   nextText: '����',
                   currentText: '����',
                   monthNames: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
                   monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
                   dayNames: ['��','��','ȭ','��','��','��','��'],
                   dayNamesShort: ['��','��','ȭ','��','��','��','��'],
                   dayNamesMin: ['��','��','ȭ','��','��','��','��'],
                   weekHeader: 'Wk',
                   dateFormat: 'yy-mm-dd',
                   firstDay: 0,
                   isRTL:false,
                   showMonthAfterYear:true,
                   yearSuffix: ''};
                $.datepicker.setDefaults( $.datepicker.regional['ko'] );
                $('#startdate').datepicker({ numberOfMonths: 3, showButtonPanel: false });
                $('#enddate').datepicker({ numberOfMonths: 3, showButtonPanel: false });
                $('#learningstart').datepicker({ numberOfMonths: 3, showButtonPanel: false });

                //��û���� ��ü����&����
                $('#allcourse').click(function() {
                    $(this).attr('checked',$('#allcourse').is(':checked'));
                    $('#requestbox').find('input:checkbox').attr('checked',$('#allcourse').is(':checked'));
                });
            });
        </script>

<%@ include file="/learn/user/2013/portal/include/footer.html"%>