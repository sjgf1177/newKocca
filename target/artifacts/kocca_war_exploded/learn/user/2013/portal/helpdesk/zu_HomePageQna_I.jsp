<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />


<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String v_title     = "";
    String v_content   = "";
    String v_usernm    = "";
    String v_userid    = "";
    String v_regdt     = "";

    int v_seq = box.getInt("p_seq");
    String v_searchtext = box.getString("p_searchtext");
    String v_select     = box.getString("p_select");
    String v_selCategory = box.getString("p_selCategory");
    int    v_pageno     = box.getInt("p_pageno");
    String s_usernm     = box.getSession("name");
    String content      = "";
    String width        = "650";
    String height       = "200";

    String s_userid     = box.getSession("userid");

    box.put("title_str", "�� �ۼ� - ���� ���ϱ� - �������� - ������");
%>
<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
    //����Ʈȭ������ �̵�
    function selectList() {
        document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
        document.form1.p_process.value = "";
        document.form1.submit();
    }

    //�����͸� �Է��Ѵ�.
    function insert() {

        var frm = document.form1;

        if (frm.p_categorycd.options[frm.p_categorycd.selectedIndex].value == "") {
            alert("�з��� �����ϼ���!");
            frm.p_categorycd.focus();
            return;
        }

        if (blankCheck(frm.p_title.value)) {
            alert("������ �Է��ϼ���!");
            frm.p_title.focus();
            return;
        }

        if (realsize(frm.p_title.value) > 100) {
            alert("������ �ѱ۱��� 50�ڸ� �ʰ����� ���մϴ�.");
            frmp_title.focus();
            return;
        }

        if (blankCheck(frm.p_content.value)) {
            alert("������ �Է��ϼ���!");
            frm.p_content.focus();
            return;
        }

        frm.p_searchtext.value    = "";
        frm.p_select.value        = "";
        frm.p_selCategory.value   = "";
        frm.p_pageno.value        =  1;

        document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
        document.form1.p_process.value = "insert";
        document.form1.submit();
    }

    //�Է� ������ ������ üũ
    function blankCheck( msg ) {
        var mleng = msg.length;
        chk=0;

        for (i=0; i<mleng; i++) {
            if ( msg.substring(i,i+1)!=' ' && msg.substring(i,i+1)!='\n' && msg.substring(i,i+1)!='\r') chk++;
        }
        if ( chk == 0 ) return (true);

        return (false);
    }
    function realsize( value ) {//���ڼ��� üũ
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


    function checkYN()
    {
        var r=$("[name='p_isopen']").val();
        if(r=="Y")
            $("[name='p_isopen']").val("N");
        else
            $("[name='p_isopen']").val("Y");

        //alert(document.form1.p_isopen.value);
    }


</script>
<!-- ��ũ��Ʈ�������� -->

<!-- container-new ���� //-->
<div id="container-new">

    <!-- Form ���� ���� -->
    <form name="form1" enctype = "multipart/form-data" method = "post" action="">
        <input type="hidden" name="p_seq"           value="<%= v_seq %>">
        <input type="hidden" name="p_searchtext"    value="<%=v_searchtext %>">
        <input type="hidden" name="p_select"        value="<%=v_select %>">
        <input type="hidden" name="p_selCategory"   value="<%=v_selCategory %>">
        <input type="hidden" name="p_pageno"        value="<%=v_pageno %>">
        <input type="hidden" name="p_process"       value="">

        <div id="mainMenu">
        <!-- �н����� -->
            <ul class="location">
                <li>Ȩ</li>
                <li>������</li>
                <li>
                    �������� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul style="z-index: 1;">
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=HelpHome">�н�����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">�����ϴ� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList" class="active">��������</a></li>
<!-- 2015-01-08 ���� ����
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp">����� ��</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">FAQ</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList" class="active">��������</a></li>
                        <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List">��������</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome">�̿�ȳ�</a></li>
-->
                    </ul>
                </li>
            </ul>
            <!-- //�н����� -->
<!-- 2015-01-08 �������
            <div class="introCategory">
                <ul>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp">����� ��</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">FAQ</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList"><strong><u>��������</u></strong></a></li>
                    <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List">��������</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome">�̿�ȳ�</a></li>
                </ul>
            </div>
-->
            <!-- //������ο� -->
        </div>
        <!-- //#mainMenu -->


        <!-- ������ ���� ���� -->
        <div id="contents">

            <h2 class="subTit">��������<!--<img src="/images/2013/support/studyask_title.gif" alt="��������" />//--></h2>

            <div id="subCont">
                <ul class="tabCus">
                    <li><a href="#"><img src="/images/2013/support/tabstudy1_on.jpg" alt="���� ���ϱ�" /></a></li>
                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=insertPage;"><img src="/images/2013/support/tabstudy2_off.jpg" alt="1:1����" /></a></li>
                </ul>
                <h3 class="blind">������ϱ� ������ġ</h3>


                <div class="tableWrap5 space1">
                    <table class="dataTable5" summary="�� ǥ�� �������� ǥ�� ����,����  �������� ���� �Ǿ� �ֽ��ϴ�.">
                        <caption>������ϱ� ǥ</caption>
                        <colgroup>
                            <col width="18%"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row"><label for="sel">�о�</label></th>
                            <td>
                                <select id="txtfield1" tabindex="176" name="p_categorycd" class="select">
                                    <option value="">�о߼���</option>
                                    <option value="A1">���Ӱ���</option>
                                    <option value="B1">��ۿ���</option>
                                    <option value="C1">��ȭ������</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">�ɼ�</th>
                            <td>
                                <span class="rd0"><input type="checkbox" name="p_isopen" id="ch1" value="Y" onclick="checkYN();" /> <label for="ch1">�� ���� �������� �ʽ��ϴ�.</label></span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="subject">����</label></th>
                            <td><input type="text" name="p_title" id="subject" class="inputText ipsz1" size="98" /></td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="subjectxt">����</label></th>
                            <td>
                                <textarea id="subjectxt" name="p_content" class="textArea" style="width:94%" rows="19" cols="13"></textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="btnArea">
                    <a href="javascript:insert();"><img src="/images/2013/btn/btn_regist.gif" alt="���" /></a>
                    <a href="javascript:history.go(-1);"><img src="/images/2013/btn/btn_cancel.gif" alt="���" /></a>
                </div>
            </div>
            <!-- //#subCont -->

        </div>
    </form>
    <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>