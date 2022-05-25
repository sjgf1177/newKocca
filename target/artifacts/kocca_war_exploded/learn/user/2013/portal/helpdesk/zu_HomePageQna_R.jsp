<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    int    v_seq        = box.getInt("p_seq");
    int    v_pageno     = box.getInt("p_pageno");
    String v_searchtext = box.getString("p_searchtext");
    String v_select     = box.getString("p_select");
    String v_selCategory = box.getString("p_selCategory");

    String s_userid     = box.getSession("userid");

    String v_title      = "";
    String v_contents   = "";
    String v_inuserid   = "";
    String v_indate     = "";
    String v_types      = "";
    String v_name       = "";
    String v_categorycd = "";
    String v_categorynm = "";
    String v_isopen     = "";
    String v_repstatus  = "";
    int    v_cnt        = 0;

    //����
    int    u_seq        = box.getInt("p_seq")+1;
    String u_title      = "";
    String u_name       = "";
    String u_indate     = "";
    String u_types      = "";
    String u_inuserid   = "";
    String u_isopen     = "";

    //�Ʒ���
    int    d_seq        = box.getInt("p_seq")-1;
    String d_title      = "";
    String d_name       = "";
    String d_indate     = "";
    String d_types      = "";
    String d_inuserid   = "";
    String d_isopen     = "";

    DataBox dbox        = (DataBox)request.getAttribute("selectQna");
    DataBox upbox        = (DataBox)request.getAttribute("selectUpQna");//����
    DataBox downbox        = (DataBox)request.getAttribute("selectDownQna");//�Ʒ���

    if(dbox != null) {
        v_inuserid          = dbox.getString("d_inuserid");
        v_name              = dbox.getString("d_name");
        v_types             = dbox.getString("d_types");
        v_indate            = dbox.getString("d_indate");
        v_title             = dbox.getString("d_title");
        v_seq               = dbox.getInt("d_seq");
        v_cnt               = dbox.getInt("d_cnt");
        v_contents          = dbox.getString("d_contents");
        v_categorycd        = dbox.getString("d_categorycd");
        v_categorynm        = dbox.getString("d_categorynm");
        v_isopen            = dbox.getString("d_isopen");
        v_repstatus         = dbox.getString("d_okyn1");
    }

    if(downbox != null) {
        d_inuserid          = downbox.getString("d_inuserid");
        d_name              = downbox.getString("d_name");
        d_types             = downbox.getString("d_types");
        d_indate            = downbox.getString("d_indate");
        d_title             = downbox.getString("d_title");
        d_seq               = downbox.getInt("d_seq");
        d_isopen            = downbox.getString("d_isopen");
    }

    box.put("title_str", v_title + " - ���� ���ϱ� - �������� - ������");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">

    //����Ʈ�������� �̵�
    function selectList() {
        document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
        document.form1.p_process.value = "";
        document.form1.submit();
    }

    function searchList() {
        if (form1.p_searchtext.value == ""){
            alert("�˻� �� ������ �Է��� �ּ���");
        }else{
        document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
        document.form1.p_process.value = "";
        document.form1.submit();
        }
    }

    //������������ �̵�
    function updatePage() {
        document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

    //�亯 ��� �������� �̵�
    function replyPage() {
        document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
        document.form1.p_process.value = "replyPage";
        document.form1.submit();
    }

    //������ ���
    function insertcomment() {
        if(document.form2.commentqna.value==""){
            alert("�������� ����ϼ���");
            return;
        }
        document.form2.p_categorycd.value = document.form1.p_categorycd.value; // ī�װ�
        document.form2.action = "/servlet/controller.homepage.HomePageQNAServlet";
        document.form2.p_process.value = "commentInsertPage";
        document.form2.submit();
    }


    //�� ȭ�� ����
    function deleteAction() {
        if (confirm("������ �����Ͻðڽ��ϱ�?")) {
            document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
            document.form1.p_process.value = "delete";
            document.form1.submit();
        }
        else {
            return;
        }
    }

    //������ ����
    function deleteComment(v_commentseq) {
        if (confirm("������ �����Ͻðڽ��ϱ�?")) {
            document.form2.p_commentseq.value = v_commentseq;
            document.form2.action = "/servlet/controller.homepage.HomePageQNAServlet";
            document.form2.p_process.value = "deleteComment";
            document.form2.submit();
        }
        else {
            return;
        }
    }

    //��,�Ʒ� �������� �̵�
    function select(seq, upfilecnt, userid, types) {
        document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
        document.form1.p_process.value   = "selectView";
        document.form1.p_seq.value       = seq;
        document.form1.p_userid.value    = userid;
        document.form1.p_types.value     = types;
        document.form1.p_upfilecnt.value = upfilecnt;
        document.form1.submit();
    }

</script>
<!-- ��ũ��Ʈ�������� -->

<!-- container-new ���� //-->
<div id="container-new">

    <!-- Form ���� ���� -->
    <form name="form1" method = "post" action="">
        <input type="hidden" name="p_seq"         value="<%= v_seq %>">
        <input type="hidden" name="p_pageno"      value="<%= v_pageno %>">
        <input type="hidden" name="p_selCategory" value="<%= v_selCategory %>">
        <input type="hidden" name="p_process"     value="">
        <input type="hidden" name="p_userid"      value="<%= v_inuserid %>">
        <input type="hidden" name="p_types"       value="<%=v_types%>">
        <input type="hidden" name="p_upfilecnt"   value="">

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
<!-- 2015-01-08 ���� ����
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

                <div class="noticBox">
                    ���� �� ����� �亯�� �Ϸ�Ǹ� ȸ������ ����������� �亯�Ϸ� �ȳ� SMS�� �߼۵˴ϴ�.
                </div>

                <div class="article">
                    <div class="info">
                        <p class="title"><%= v_title %></p>
                        <p class="date"><%= FormatDate.getFormatDate(v_indate, "yyyy.MM.dd") %></p>
                    </div>

                    <div class="inner">
                        <%=v_contents.replace("\n","<BR>")%>
                    </div>
                </div>

                <%
                if(v_repstatus.equals("3")){
                    ArrayList list = (ArrayList)request.getAttribute("selectAns");
                    String v_anstitle      = "";
                    String v_anscontents   = "";
                    String v_ansinuserid   = "";
                    String v_ansindate     = "";
                    String v_ansname       = "";
                    String v_anscategorynm = "";

                    if(list.size() != 0) {

                        for(int i = 0; i < list.size(); i++) {
                        DataBox Ansbox = (DataBox)list.get(i);
                        v_ansinuserid          = Ansbox.getString("d_inuserid");
                        v_ansname              = Ansbox.getString("d_name");
                        v_ansindate            = Ansbox.getString("d_indate");
                        v_anstitle             = Ansbox.getString("d_title");
                        v_anscontents          = Ansbox.getString("d_contents");
                        v_anscategorynm        = Ansbox.getString("d_categorynm");

                %>
                <p class="answer"><a href="#">�亯</a></p>

                <div class="article">
                    <div class="info3">
                        <p class="name">�ۼ���</p>
                        <p class="date"><%=FormatDate.getFormatDate(v_ansindate, "yyyy.MM.dd HH:mm") %></p>
                    </div>
                    <div class="inner2">
                        <%=StringManager.removeHTMLHead(v_anscontents)%>
                    </div>
                </div>
                <%
                }}}
                %>

                <table class="bbsNavi">
                    <colgroup>
                        <col width="70">
                        <col>
                        <col width="70">
                        <col width="70">
                    </colgroup>
                    <%
                    if(upbox != null) {
                        u_inuserid          = upbox.getString("d_inuserid");
                        u_name              = upbox.getString("d_name");
                        u_types             = upbox.getString("d_types");
                        u_indate            = upbox.getString("d_indate");
                        u_title             = upbox.getString("d_title");
                        u_seq               = upbox.getInt("d_seq");
                        u_isopen            = upbox.getString("d_isopen");
                    %>
                    <tr>
                        <td class="pre">����</td>
                        <td>
                        <%if (u_isopen.equals("N")){%>
                            <img src="/images/2013/common/ico_rock.gif" alt="��� ǥ��" />
                        <% } %>
                        <%if (u_isopen.equals("N") && !s_userid.equals(u_inuserid)){%>
                            <a href="javascript:alert('��б��� �ۼ��ڸ� �� �� �ֽ��ϴ�.');"><%=StringManager.removeHTML(u_title) %></a>
                        <%}else{ %>
                            <a href="javascript:select('<%=u_seq%>','0','<%=u_inuserid%>','<%=u_types%>');"><%=StringManager.removeHTML(u_title) %></a>
                        <%} %>
                        </td>
                        <td><%=u_name %></td>
                        <td><%=FormatDate.getFormatDate(u_indate, "yyyy.MM.dd") %></td>
                    </tr>
                    <%} %>

                    <%
                    if(downbox != null) {
                        d_inuserid          = downbox.getString("d_inuserid");
                        d_name              = downbox.getString("d_name");
                        d_types             = downbox.getString("d_types");
                        d_indate            = downbox.getString("d_indate");
                        d_title             = downbox.getString("d_title");
                        d_seq               = downbox.getInt("d_seq");
                        d_isopen            = downbox.getString("d_isopen");
                    %>
                    <tr>
                        <td class="next">�Ʒ���</td>
                        <td>
                        <%if (d_isopen.equals("N")){%>
                                    <img src="/images/2013/common/ico_rock.gif" alt="��� ǥ��" />
                        <% } %>
                        <%if (d_isopen.equals("N") && !s_userid.equals(d_inuserid)){%>
                            <a href="javascript:alert('��б��� �ۼ��ڸ� �� �� �ֽ��ϴ�.');"><%=StringManager.removeHTML(d_title) %></a>
                        <%}else{ %>
                            <a href="javascript:select('<%=d_seq%>','0','<%=d_inuserid%>','<%=d_types%>');"><%=StringManager.removeHTML(d_title) %></a>
                        <%} %>
                        </td>
                        <td><%=d_name %></td>
                        <td><%=FormatDate.getFormatDate(d_indate, "yyyy.MM.dd") %></td>
                    </tr>
                    <%} %>
                </table>

                <div class="btnArea right">
                <%if(v_inuserid.equals(box.getSession("userid")) && !v_repstatus.equals("3")){%>
                    <a href="javascript:updatePage();"><img src="/images/2013/btn/btn_retouch.gif" alt="����" /></a>
                    <a href="javascript:deleteAction();"><img src="/images/2013/btn/btn_delete.gif" alt="����" /></a>
                <% } %>
                    <a href="javascript:selectList();"><img src="/images/2013/btn/btn_list.gif" alt="���" /></a>
                </div>

            </div>
            <!-- //#subCont -->


        </div>
    </form>

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>