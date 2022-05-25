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

    box.put("title_str", "1:1����-��������, �н�����");

    int    v_tabseq     = box.getInt("p_tabseq");
    String v_process    = box.getString("p_process");
    int    v_pageno     = box.getInt("p_pageno");
    String v_searchtext = box.getString("p_searchtext");
    String v_search     = box.getString("p_search");
    int    v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�
    String v_indate     = "";
    String s_userid     = box.getSession("userid");
    String s_username   = box.getSession("name");
    String s_email      = box.getSession("email");
    String content      = "";
    String width        = "650";
    String height       = "200";

    box.put("title_str", "1:1����-��������, �н�����");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
//�Էµ� ���� ����
function insert() {

    if( document.form1.p_title.value == '' ) {
        alert("������ �Է��ϼ���.");
        document.form1.p_title.focus();
        return;
    }

    if (realsize(document.form1.p_title.value) > 200) {
        alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
        document.form1.p_title.focus();
        return;
    }

    if (realsize(document.form1.p_content.value) < 1) {
        alert("������ �Է����ּ���");
        document.form1.p_content.focus();
        return;
    }

    //document.getElementById("p_content").value = CrossEditor.GetBodyValue();

    document.form1.p_pageno.value = "1";
    document.form1.p_search.value     = "";
    document.form1.p_searchtext.value = "";
    document.form1.action = "/servlet/controller.homepage.HomePageContactServlet";
    document.form1.p_process.value = "insert";
    document.form1.submit();
}

//�󳻿� üũ
function blankCheck( msg ) {
    var mleng = msg.length;
    chk=0;

    for (i=0; i<mleng; i++) {
        if ( msg.substring(i,i+1)!=' ' && msg.substring(i,i+1)!='\n' && msg.substring(i,i+1)!='\r') chk++;
    }
    if ( chk == 0 ) return (true);

    return (false);
}

//�����Է��� ����ϰ� ����Ʈ�� �̵�
function cancel() {
     document.form1.action = "/servlet/controller.homepage.MainServlet";
     //document.form1.p_process.value = "selectList";
     document.form1.submit();
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

//-->
</script>
<!-- ��ũ��Ʈ�������� -->
<!-- container-new ���� //-->
<div id="container-new">

    <!-- Form ���� ���� -->
    <form name="form1" enctype = "multipart/form-data" method = "post" action="">
        <input type="hidden" name="p_tabseq"    value="<%=v_tabseq %>">
        <input type="hidden" name="p_pageno"     value="<%=v_pageno %>">
        <input type="hidden" name="p_search"     value="<%=v_search %>">
        <input type="hidden" name="p_searchtext" value="<%=v_searchtext %>">
        <input type="hidden" name="p_process" value="">

        <div id="mainMenu">
        <!-- �н����� -->
            <ul class="location">
                <li>Ȩ</li>
                <li>������</li>
                <li>�������� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul style="z-index: 1;">
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=HelpHome">�н�����</a></li>
<!--
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp">����� ��</a></li>
-->
                        <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">�����ϴ� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList" class="active">��������</a></li>
<!--
                        <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List">��������</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome">�̿�ȳ�</a></li>
-->
                    </ul>
                </li>
            </ul>
            <!-- //�н����� -->
            <!--
            <div class="introCategory">
                <ul>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp">����� ��</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
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
                    <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList"><img src="/images/2013/support/tabstudy1_off.jpg" alt="���� ���ϱ�" /></a></li>
                    <li><a href="#"><img src="/images/2013/support/tabstudy2_on.jpg" alt="1:1����" /></a></li>
                </ul>
                <h3 class="blind">1:1���� ������ġ</h3>

                <div class="noticBox">
                    ������ϱ�ʹ� �޸� ������� ����Ǵ� ���ǰ����Դϴ�. ������ ������ ������ ���� ��� 1:1���Ǹ� ���� �����ο� ������ �����ּ���.<br />
                    <strong>���θ޴� > ��㳻��</strong>���� <strong>�亯</strong>�� <strong>Ȯ��</strong>�Ͻ� �� �ֽ��ϴ�
                </div>

                <div class="tableWrap space1">
                    <table class="dataTable" summary="�� ǥ�� �������� ǥ�� ����,����  �������� ���� �Ǿ� �ֽ��ϴ�.">
                        <caption>1:1���� ǥ</caption>
                        <colgroup>
                            <col width="18%"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row"><label for="subject">����</label></th>
                            <td><input type="text" name="p_title" id="subject" class="inputText ipsz1" size="98" /></td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="subjectxt">����</label></th>
                            <td>
                                <textarea name="p_content" id="subjectxt" class="textArea" style="width:94%" rows="19" cols="13"></textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="btnArea">
                    <a href="javascript:insert();"><img src="/images/2013/btn/btn_regist.gif" alt="Ȯ��" /></a>
                    <a href="javascript:history.go(-1);"><img src="/images/2013/btn/btn_cancel.gif" alt="���" /></a>
                </div>
            </div>
            <!-- //#subCont -->

        </div>

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>