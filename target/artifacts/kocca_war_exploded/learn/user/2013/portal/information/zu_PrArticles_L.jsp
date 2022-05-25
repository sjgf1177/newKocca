<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    ArrayList list = null;

    int v_tabseq    = box.getInt("p_tabseq");

    String  v_process  = box.getString("p_process");

    // �˻�
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");

    String  v_selClsfCd   = box.getString("p_selClsfCd");
    String  v_selDtlCd   = box.getString("p_selDtlCd");

    int v_pageno    = box.getInt("p_pageno");
    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
    int v_rowcount  = 0;

    int    v_seq     = 0;              // �Ϸù�ȣ
    int    v_cnt     = 0;              // ��ȸ��

    String  v_typesnm   = "";
    String  v_title     = "";
    String  v_indate    = "";
    String  v_content   = "";
    String  v_codenm    = "";
    String  v_userid    = "";
    String  v_usernm    = "";
    String  v_position  = "";
    String  v_savefile  = "";

    String s_userid   = box.getSession("userid");
    String s_username = box.getSession("name");

    list = (ArrayList)request.getAttribute("selectList");

    box.put("title_str", "�����ڷ�, ��ī���̼Ұ�");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>

<script language="javascript">
function go(index) {
    document.nform1.p_pageno.value = index;
    document.nform1.target  =   "_self";
    document.nform1.action = "/servlet/controller.infomation.BriefingHomePageServlet";
    document.nform1.p_process.value = "selectList";
    document.nform1.submit();
}

//������ ����
function goPage(pageNum) {
    document.nform1.p_pageno.value = pageNum;
    document.nform1.target  =   "_self";
    document.nform1.action = "/servlet/controller.infomation.BriefingHomePageServlet";
    document.nform1.p_process.value = "selectList";
    document.nform1.submit();
}

//����Ʈ ��ȸ
function select() {
    document.nform1.p_pageno.value = 0;
    document.nform1.target  =   "_self";
    document.nform1.action = "/servlet/controller.infomation.BriefingHomePageServlet";
    document.nform1.p_process.value = "selectList";
    document.nform1.submit();
}

//�󼼺���
function selectView(seq) {
    document.nform1.target = "_self";
    document.nform1.action = "/servlet/controller.infomation.BriefingHomePageServlet";
    document.nform1.p_process.value = "selectView";
    document.nform1.p_seq.value= seq;
    document.nform1.submit();
}
</script>

<!-- ������ ���� ���� -->
        <div id="contents">
        <form name="nform1" method="post" onsubmit="javascript:select();">
            <input type = "hidden" name = "p_process">
            <input type = "hidden" name = "p_pageno"  value="<%=v_pageno%>">
            <input type = "hidden" name = "p_seq"    >
            <input type = "hidden" name = "p_tabseq" value="<%=v_tabseq %>" >
        </form>
            <div id="mainMenu">
                <!-- ��ī���� �Ұ� -->
                <ul class="location">
                    <li>Ȩ</li>
                    <li>��ī���̼Ұ�</li>
                    <li>
                        �����ڷ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                        <ul style="z-index: 1;">
                            <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                            <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage">������� �λ縻</a></li>
                            <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility">�ü��Ұ�</a></li>
                            <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu">������� �ȳ�</a></li>
                            <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=PR">ȫ������</a></li>
                            <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=COOPER">�������±��</a></li>
                            <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Direction">���ô� ��</a></li>
                            <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus">���޹���</a></li>
                            <li><a href="#" class="active">�����ڷ�</a></li>
                        </ul>
                    </li>
                </ul>
                <div class="introCategory">
                    <ul>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage">������� �λ縻</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility">�ü��Ұ�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu">������� �ȳ�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=PR">ȫ������</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=COOPER">�������±��</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Direction">���ô� ��</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus">���޹���</a></li>
                        <li><a href="/servlet/controller.infomation.BriefingHomePageServlet?p_process=selectList"><strong><u>�����ڷ�</u></strong></a></li>
                    </ul>
                </div>
            </div>


            <h2 class="subTit"><img src="/images/2013/introduce/bodo_title.gif" alt="�����ڷ�" /></h2>

            <div id="subCont">
                <div class="imgList">
                <%
                if(list.size() != 0){
                    for( int i = 0; i < list.size(); i++) {
                        DataBox dbox     = (DataBox)list.get(i);

                        v_seq           = dbox.getInt("d_seq");
                        v_cnt           = dbox.getInt("d_cnt");
                        v_title         = dbox.getString("d_title");
                        v_indate        = dbox.getString("d_indate");
                        v_userid        = dbox.getString("d_userid");
                        v_usernm        = dbox.getString("d_name");
                        v_content       = StringManager.formatTitle(StringManager.removeHTML(dbox.getString("d_content")), 200);
                        v_content       = v_content.replaceAll("(!/|\r|\n|&nbsp;|<br>|��|��|��)", "");

                        v_dispnum        = dbox.getInt("d_dispnum");
                        v_totalpage      = dbox.getInt("d_totalpage");
                        v_rowcount       = dbox.getInt("d_rowcount");
                        v_position       = dbox.getString("d_position");
                        v_savefile       = StringManager.replace(dbox.getString("d_savefile"),"\\","/");

                        if (!v_searchtext.equals("")) {
                            v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>");
                        }
                %>
                    <div class="listPrm">
                        <a href="javascript:selectView(<%=v_seq%>);" class="btn_viewDetail">�ڼ�������</a>
                        <dl>
                            <dt><a href="javascript:selectView(<%=v_seq%>);"><img src="<%=v_savefile%>" alt="��������̹���" /></a></dt>
                            <dd class="tit"><a href="javascript:selectView(<%=v_seq%>);"><%=v_title%></a></dd>
                            <dd class="txt"><a href="javascript:selectView(<%=v_seq%>);"><%=v_content%></a></dd>
                        </dl>
                    </div>
                <%
                    }
                }
                %>

                </div>

                <div class="paging">
                    <%= PageUtil.re2013_printPageListDiv(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
                </div>
                <!-- //paging -->

            </div>
            <!-- //#subCont -->




        </div>
        <!-- ������ ���� �� -->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>