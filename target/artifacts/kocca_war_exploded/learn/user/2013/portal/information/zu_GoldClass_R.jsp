<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.dunet.common.util.*" %>

<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String v_genre      = box.getStringDefault("p_genre","ALL");
    String v_genrenm    = "";
    String v_subTit     = "";
    if(v_genre.equals("ALL")){
        v_genrenm = "��ü";
        v_subTit = "<img src=\"/images/2013/open_edu/openedu_title.gif\" alt=\"��������\" />";
    }else if(v_genre.equals("G01")){
        v_genrenm = "��ۿ���";
        v_subTit = "<img src=\"/images/2013/open_edu/broadcast_title.gif\" alt=\"��ۿ���\" />";
    }
    else if(v_genre.equals("G02")){
        v_genrenm = "��ȭ";
        v_subTit = "<img src=\"/images/2013/open_edu/movie_title.gif\" alt=\"��ȭ\" />";
    }
    else if(v_genre.equals("G03")){
        v_genrenm = "��ť���͸�";
        v_subTit = "<img src=\"/images/2013/open_edu/document_title.gif\" alt=\"��ť���͸�\" />";
    }
    else if(v_genre.equals("G04")){
        v_genrenm = "��ȭ����";
        v_subTit = "<img src=\"/images/2013/open_edu/art_title.gif\" alt=\"��ȭ����\" />";
    }
    else if(v_genre.equals("G06")){
        v_genrenm = "����";
        v_subTit = "<img src=\"/images/2013/open_edu/game_title.gif\" alt=\"����\" />";
    }
    else if(v_genre.equals("G05")){
        v_genrenm = "��Ÿ";
        v_subTit = "<img src=\"/images/2013/open_edu/etc_title.gif\" alt=\"��Ÿ\" />";
    }
    String v_subnavi = "";

    int[]   v_seq       = new int[200];
    int     i           = 0;
    int     j           = 0;
    int     v_viewcnt   = 0;
    float   v_checkpoin = 0;
    boolean flag = false;

    int v_seq2          = 0;
    String v_vodimg2    = "";
    String v_lecnm2     = "";
    String v_tutornm2   = "";
    String v_lectime2   = "";
    String v_creator2   = "";
    String v_intro2     = "";
    String v_width_s2   = "";
    String v_height_s2  = "";
    int v_viewcnt2      = 0;
    float v_checkpoin2  = 0;
    String v_vodurl2    = "";
    String v_tutorimg2  = "";

    String v_creatyear  = "";
    String v_openyn = "";

    String v_useyn  = "";
    String v_img_save_file  = "";
    String v_tutor_save_file    = "";
    String v_bannerimg = "";

    String s_grcode          = box.getStringDefault("tem_grcode", box.getSession("tem_grcode"));

    String v_classname1      = "";
    String v_classname2      = "";

    String s_userid   = box.getSession("userid");

    if (v_bannerimg.equals("")) {
        v_bannerimg = "/images/2012/sub/page5/castimage/sample.gif";
    } else {
        v_bannerimg = "http://edu.kocca.or.kr/upload/bulletin/"+v_bannerimg;
    }

    box.put("title_str", v_genrenm + ", ��������");
%>

<%@ include file="/learn/user/2013/portal/include/top_sub.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script type="text/javascript">
$(function(){
    //���� ������ ���̾�
    var teacher = $(".movList .btn_teacher");
    teacher.each(function(){
        var btn = $(this)
        ,lyr = btn.attr("href")
        layerUI({
            btns       : btn //���̾� ���� ��ư
            ,layer     : lyr //���̾�
            ,closeBtn  : ".btn_layerClose" //���̾� ���� �ݱ� ��ư
            ,outCloseBtn  : ".lyrClose" //���̾� �ٱ��� �ݱ� ��ư
            ,evt       : "click" //�̺�Ʈ
            ,autoPosition  : false //�ڵ����� �߾� ��ġ ���� true || false
            ,evtPosition  : false //���콺 ��ġ�� ���� true || false
            ,winResize : false //������ ũ�� �ٲ�� ��ġ �缳�� true || false
            ,blurClose : false //��÷ ������ ������ true || false
            ,toggle : false //��ư�� Ŭ���ϸ� �����ٲ����ٷ� true || false
            ,fn        : function(){
                $(".movLayer:visible").hide();
                $(".currentview").removeClass("currentview")
                btn.addClass("currentview")
            } //�̺�Ʈ �߻��� ����� �Լ�
            ,fn_close    : function(){
                $(".currentview").removeClass("currentview")
                .find("img").attr("src",function(){
                    return $(this).attr("src").replace("_on","_off");
                });
            } //������ ����� �Լ�
        });

    });
});
</script>
<script language="JavaScript" type="text/JavaScript">
//�˻����뿡 �´� ����Ʈ �������� �̵�
function goPreGoldClass(){
    document.form1.action = "/servlet/controller.infomation.GoldClassHomePageServlet";
    document.form1.target="_self";
    document.form1.p_process.value = "selectPreGoldClassList";
    document.form1.submit();
    }

function viewContentNew(seq) {
    document.form1.p_prePage.value   = "Main";
    document.form1.action = "/servlet/controller.infomation.GoldClassHomePageServlet";
    document.form1.target="_self";
    document.form1.p_process.value   = "mainPage";
    document.form1.p_seq.value       = seq;
    document.form1.submit();
}


function goGoldClassMain(){
    document.form1.target="_self";
    document.form1.action = "/servlet/controller.infomation.GoldClassHomePageServlet";
    document.form1.p_process.value = "mainPage";
    document.form1.submit();
}


//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->

<form name="form1" method = "post" action="">
      <input type="hidden" name="p_process"     value="" />
      <input type="hidden" name="p_seq"         value="" />
      <input type="hidden" name="p_prePage"     value="" />

            <div id="mainMenu">
                <!-- ��ī���� �Ұ� -->
                <ul class="location">
                    <li>Ȩ</li>
                    <li>���� ����</li>
                    <li>
                        <%=v_genrenm %> <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                        <ul style="z-index: 1;">
                            <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                            <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage" <%=v_genre.equals("ALL") ? "class=\"active\"" : "" %> >��ü</a></li>
                            <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G01" <%=v_genre.equals("G01") ? "class=\"active\"" : "" %>>��ۿ���</a></li>
                            <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G02" <%=v_genre.equals("G02") ? "class=\"active\"" : "" %>>��ȭ</a></li>
                            <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G03" <%=v_genre.equals("G03") ? "class=\"active\"" : "" %>>��ť���͸�</a></li>
                            <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G04" <%=v_genre.equals("G04") ? "class=\"active\"" : "" %>>��ȭ����</a></li>
                            <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G06" <%=v_genre.equals("G06") ? "class=\"active\"" : "" %>>����</a></li>
                            <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G05" <%=v_genre.equals("G05") ? "class=\"active\"" : "" %>>��Ÿ</a></li>
                        </ul>
                    </li>
                </ul>

                <!-- ������ο� -->
                <div class="introCategory">
                    <ul>
                        <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage"><%=v_genre.equals("ALL") ? "<strong><u>��ü</u></strong>" : "��ü" %></a></li>
                        <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G01"><%=v_genre.equals("G01") ? "<strong><u>��ۿ���</u></strong>" : "��ۿ���" %></a></li>
                        <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G02"><%=v_genre.equals("G02") ? "<strong><u>��ȭ</u></strong>" : "��ȭ" %></a></li>
                        <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G03"><%=v_genre.equals("G03") ? "<strong><u>��ť���͸�</u></strong>" : "��ť���͸�" %></a></li>
                        <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G04"><%=v_genre.equals("G04") ? "<strong><u>��ȭ����</u></strong>" : "��ȭ����" %></a></li>
                        <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G06"><%=v_genre.equals("G06") ? "<strong><u>����</u></strong>" : "����" %></a></li>
                        <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G05"><%=v_genre.equals("G05") ? "<strong><u>��Ÿ</u></strong>" : "��Ÿ" %></a></li>
                    </ul>
                </div>
                <!-- //������ο� -->
            </div>

      <!-- ������ ���� ���� -->
        <div id="contents">

            <h2 class="subTit"></h2>
            <div id="subCont">
                <div class="movList">
                    <ul>
                        <li>
                            <dl>
                                <dt>
                                    <span class="movieTime"><%=dbox.getString("d_lectime") %></span></dt>
                                <dd>
                                    <a href="javascript:openGoldClass(<%=dbox.getInt("d_seq") %>, '<%=dbox.getString("d_width_s") %>','<%=dbox.getString("d_height_s") %>');"><%=dbox.getString("d_lecnm") %></a>
                                    <a href="#profile" class="btn_teacher">����Ұ�</a>
                                </dd>
                            </dl>
                        </li>
                    </ul>
                    <!-- ������ ���̾� -->
                    <div id="profile" class="movLayer">
                        <a href="#" class="btn_layerClose"><img src="/images/2013/open_edu/btn_layer_close.gif" alt="�ݱ�" /></a>
                        <p class="tit"><%= v_lecnm %> <span style="font-size: 14px;font-weight: normal;"> - <%= v_tutornm %></span></p>
                        <dl>
                            <dt><img src="http://edu.kocca.or.kr<%=v_tutorimg %>" alt="�����ʻ���" /></dt>
                            <dd>
                                <span class="tit_history"><img src="/images/2013/open_edu/tit_history.gif" alt="���" /></span>
                                <ul>
                                    <li>&nbsp;&nbsp;<%= v_tutorcareer.replaceAll("\r\n","<br/>") %></li>
                                </ul>
                            </dd>
                            <dd class="last">
                                <span class="tit_history"><img src="/images/2013/open_edu/tit_major.gif" alt="�ֿ� ���� �� ����" /></span>
                                <ul>
                                    <li>&nbsp;&nbsp;<%= v_tutorauthor.replaceAll("\r\n","<br/>") %></li>
                                </ul>
                            </dd>
                        </dl>
                    </div>
                    <!--// ������ ���̾� -->
                </div>
            </div>
            <!-- //#subCont -->
        </div>
        <!-- //#contents -->
        <!-- ������ ���� �� -->

</form>
<%@ include file="/learn/user/2013/portal/include/footer.jsp"%>