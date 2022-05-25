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

    String v_genre = box.getStringDefault("p_genre","ALL");
    String v_genrenm = "";
    String v_subTit = "";

    String lectureCls = box.getStringDefault("p_lecture_cls","ALL");
    String lectureClsNm = "";

    String dirFlag = box.getStringDefault("p_dir_flag", "N");
    String seq = box.getStringDefault("p_seq", "");

    /*
    if(v_genre.equals("ALL")){
        v_genrenm = "��ü";
        v_subTit = "<img src=\"/images/2013/open_edu/openedu_title.gif\" alt=\"��������\" />";

    } else if (v_genre.equals("G01")) {
        v_genrenm = "��ۿ���";
        v_subTit = "<img src=\"/images/2013/open_edu/broadcast_title.gif\" alt=\"��ۿ���\" />";

    } else if (v_genre.equals("G02")) {
        v_genrenm = "��ȭ";
        v_subTit = "<img src=\"/images/2013/open_edu/movie_title.gif\" alt=\"��ȭ\" />";

    } else if (v_genre.equals("G03")) {
        v_genrenm = "��ť���͸�";
        v_subTit = "<img src=\"/images/2013/open_edu/document_title.gif\" alt=\"��ť���͸�\" />";

    } else if(v_genre.equals("G04")) {
        v_genrenm = "��ȭ����";
        v_subTit = "<img src=\"/images/2013/open_edu/art_title.gif\" alt=\"��ȭ����\" />";

    } else if(v_genre.equals("G06")) {
        v_genrenm = "����";
        v_subTit = "<img src=\"/images/2013/open_edu/game_title.gif\" alt=\"����\" />";

    } else if(v_genre.equals("G05")) {
        v_genrenm = "��Ÿ";
        v_subTit = "<img src=\"/images/2013/open_edu/etc_title.gif\" alt=\"��Ÿ\" />";
    }
    */


    if(lectureCls.equals("ALL")){
        lectureClsNm = "��ü";
        v_subTit = "<img src=\"/images/open_class/title_total.png\" alt=\"��ü\" />";

    } else if (lectureCls.equals("GC01")) {
        lectureClsNm = "��ۿ���";
        v_subTit = "<img src=\"/images/open_class/title_broad.png\" alt=\"��ۿ���\" />";

    } else if (lectureCls.equals("GC02")) {
        lectureClsNm = "����";
        v_subTit = "<img src=\"/images/open_class/title_game.png\" alt=\"����\" />";

    } else if (lectureCls.equals("GC03")) {
        lectureClsNm = "����ĳ";
        v_subTit = "<img src=\"/images/open_class/title_ani.png\" alt=\"��ȭ�ִ�ĳ����\" />";

    } else if(lectureCls.equals("GC04")) {
        lectureClsNm = "���ǰ���";
        v_subTit = "<img src=\"/images/open_class/title_music.png\" alt=\"����/����\" />";

    } else if(lectureCls.equals("GC05")) {
        lectureClsNm = "��Ÿ";
        v_subTit = "<img src=\"/images/open_class/title_etc.png\" alt=\"��Ÿ\" />";

    } else if(lectureCls.equals("GC06")) {
        lectureClsNm = "������ �λ���Ʈ";
        v_subTit = "<img src=\"/images/open_class/title_con.png\" alt=\"������ �λ���Ʈ\" />";

    } else if(lectureCls.equals("GC07")) {
        lectureClsNm = "������ Ŭ����";
        v_subTit = "<img src=\"/images/open_class/title_master.png\" alt=\"������ Ŭ����\" />";

    } else if(lectureCls.equals("GC08")) {
        lectureClsNm = "�޳ݿ�������";
        v_subTit = "<img src=\"/images/open_class/title_coalition_hunet.png\" alt=\"�޳ݿ�������\" />";
    }

    String v_subnavi = "";

    int[] v_seq = null;
    int i = 0;
    int j = 0;
    int v_viewcnt = 0;
    float v_checkpoin = 0;
    boolean flag = false;

    int totalPage = 0;
    int	totalRowCount = 0;
    int pageNo = box.getInt("pageNo"); 
    int pageSize = box.getInt("pageSize");

    String[] v_vodimg = new String[300];
    String[] v_lecnm = new String[300];
    String[] v_tutornm = new String[300];
    String[] v_lectime = new String[300];
    String[] v_creator = new String[300];
    String[] v_intro = new String[300];
    String[] v_width_s = new String[300];
    String[] v_height_s = new String[300];
    String[] v_vodurl = new String[300];
    String[] v_tutorimg = new String[300];
    String[] v_tutorcareer = new String[300];
    String[] v_tutorauthor = new String[300];
    String[] v_contents = new String[300];

    String v_creatyear = "";
    String v_openyn = "";

    String v_useyn = "";
    String v_img_save_file = "";
    String v_tutor_save_file = "";
    String v_bannerimg = "";

    ArrayList openClassList = (ArrayList)request.getAttribute("openClassList");
    DataBox openClassCnt = (DataBox)request.getAttribute("openClassCnt");

    String s_grcode = box.getStringDefault("tem_grcode", box.getSession("tem_grcode"));

    String s_userid = box.getSession("userid");

    if (v_bannerimg.equals("")) {
        v_bannerimg = "/images/2012/sub/page5/castimage/sample.gif";
    } else {
        v_bannerimg = "http://edu.kocca.or.kr/upload/bulletin/"+v_bannerimg;
    }

    box.put("title_str", lectureClsNm + ", ��������");
%>

<%@ include file="/learn/user/2013/portal/include/top_sub.jsp"%>
<!-- Common �������� -->

<style type="text/css">
    /* * {margin:0; padding:0;} */
    /* img {border:0; vertical-align:top;} */

    #divPopup       {position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; margin:0; auto; vertical-align:middle; text-align: center; z-index:5003; display: none; }
    #vodArea        {position: absolute; width:920px; height:540px; border-style:solid; border:6px solid #fff; background-color:#efefef; z-index:5004; display: none; }
    .closeBtn       {position: absolute; width:25px; height:25px; color:white; text-align:center; padding-top:10px; cursor:pointer; z-index:5005; display: none; }
    .divPopupMask   {position: fixed; left:0px; top:0px; width:100%; height:100%; background-image: url(/images/common/mask.png); z-index:5002; display: none; }
    /* .divPopupMask   {position: fixed; top:0px; left:0px; width:100%; height:100%; background-image: url(/images/common/mask_transparency.png); z-index:5002; display: none; } */

</style>

<!-- ��ũ��Ʈ�������� -->
<script type="text/javascript">

    $(function() {
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

<%
    if ( dirFlag.equals("Y") ) {
%>
        fnViewOpenClassDirect(<%= seq %>);
<%
    }
%>

        $(window).bind("resize", function () {
            var docHeight = $(document).height();
            var docWidth = $(document).width();
            var vodWidth = $("#vodArea").width();

            if ( $(".divPopupMask").css("display") == "block") {

                var vodAreaPosX = 0;
                var vodAreaPosY = 100;
                var closeBtnPosX = 0;
                var closeBtnPosY = vodAreaPosY - 28;

                vodAreaPosX = (docWidth / 2) - (vodWidth / 2) - 40;
                closeBtnPosX = vodAreaPosX + vodWidth;

                $("#vodArea").css( { "left": vodAreaPosX } );
                $(".divPopupMask").css( {"width": docWidth, "height:": docHeight} );
                $(".closeBtn").css( {"left": closeBtnPosX, "top": closeBtnPosY } );
            }
        });

    });


    //�˻����뿡 �´� ����Ʈ �������� �̵�
    function goPreGoldClass(){
        var formObj = document.openClassForm;
        formObj.action = "/servlet/controller.infomation.GoldClassHomePageServlet";
        formObj.target="_self";
        formObj.p_process.value = "selectPreopenClassList";
        formObj.submit();
    }

    //��ȭ�� �������� �̵�
    function viewContent(seq) {
        var formObj = document.openClassForm;
        formObj.p_prePage.value = "Main";
        formObj.action = "/servlet/controller.infomation.GoldClassHomePageServlet";
        formObj.target="_self";
        formObj.p_process.value = "selectView";
        formObj.p_seq.value = seq;
        formObj.submit();
    }

    /**
     * �������� ����
     * @param seq �������� �Ϸù�ȣ
     * @param vodPath �������� ���� ������ ���
     * @param width �������� ������ ����
     * @param height �������� ������ ����
     * @param lectureType ���� ���� (P: �˾�(���� ������ popup), E: �Ӻ���)
     */
    function fnViewOpenClass(seq, vodPath, width, height, lectureType, vodUrl) {
        lectureType = (lectureType == "") ? "P" : lectureType;

        if ( lectureType == "P" ) {
            fnViewOpenClassByPopup(seq, width, height);
        } else {

            var docHeight = $(document).height();
            var docWidth = $(document).width();

            width = Number(width)

            var vodAreaPosX = 0;
            var vodAreaPosY = 100;
            var closeBtnPosX = 0;
            var closeBtnPosY = vodAreaPosY - 28;

            vodAreaPosX = (docWidth / 2) - (width / 2) - 40;
            closeBtnPosX = vodAreaPosX + width;

            $(".divPopupMask").css( { "width": docWidth, "height": docHeight } );
            $("#vodArea").css( { "width": width, "height": height, "left": vodAreaPosX, "top": vodAreaPosY } );
            $(".closeBtn").css( {"left": closeBtnPosX, "top": closeBtnPosY } );

            $(".divPopupMask, #divPopup, #vodArea, .closeBtn").show();
            // $("#divPopup").css( {"top":0, "left":40 } );

            $.get(
                vodUrl,
                function( data ) {
                    $("#oHiddenFlashArea").html( data.substr(data.indexOf("<body"), data.lastIndexOf("</body>") ) );

                    fnLoadSWF(vodPath, width, height, true, "vodURL=" + $("#oFlashVar").val());

                    fnUpdateViewCount(seq);
                }
            );
        }
    }

    function returnFLV(str){
        returnVal = document.getElementById("oFlashVar").value;
        return returnVal;
    }

    /**
     * �Ӻ��� ������ �������� ����
     */
    function fnLoadSWF(file, width, height, trans, flashVars){
        var tagObj = "";
        tagObj += "<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0' width='" + width + "' height='" + height + "' id='objOpenClass' align='middle'>\n";
        tagObj += "<param name='allowScriptAccess' value='always' />\n";
        tagObj += "<param name='movie' value='" + file + "' />\n";
        tagObj += "<param name='menu' value='false' />\n";
        tagObj += "<param name='flashvars' value='" + flashVars + "'>\n";
        if (trans == true){
            tagObj += "<param name='wmode' value='window' />\n";
        }
        tagObj += "<embed src='" + file + "' quality='high' bgcolor='#ffffff' width='" + width + "' height='" + height + "' name='embOpenClass' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer' />\n";
        tagObj += "</object>";

        $("#vodArea").html( tagObj );

    }

    /**
     * �Ӻ��� ������ �������� �ݱ�
     */
    function fnCloseViewWin() {
        $("#vodArea").html( "" );
        $(".divPopupMask, #divPopup, #vodArea, .closeBtn").hide();
    }

    /**
     * �Ӻ��� ������ �������� ��ȸ�� ���� (ajax)
     */
    function fnUpdateViewCount(seq) {
        $.ajax({
                type : "get"
            ,   url : "/servlet/controller.infomation.GoldClassHomePageServlet"
            ,   dataType : "text"
            ,   data : "p_process=updateViewCount&seq=" + seq
            // ,   success : fnOnSuccess
            // ,   complete : fnOnComplete
            // ,   error :  fnOnError
        });
    }

    /**
     * �ܺ� ��ũ�� Ÿ�� ���� ��� �ش� ���� ���� ������ ��ȸ�Ͽ� �ٷ� ������.
     */
    function fnViewOpenClassDirect(seq) {

        $.ajax({
                type : "get"
            ,   url : "/servlet/controller.infomation.GoldClassHomePageServlet"
            ,   dataType : "xml"
            ,   data : "p_process=getOpenClassInfo&seq=" + seq
            ,   success : function (xml) {
                    var xmlDoc = $(xml).find("ROOT");
                    var vodPath = $(xmlDoc).find("d_vod_path").text();
                    var vodUrl = $(xmlDoc).find("d_vodurl").text();
                    var width = $(xmlDoc).find("d_width_s").text();
                    var height = $(xmlDoc).find("d_height_s").text();
                    var lectureType = $(xmlDoc).find("d_lecture_type").text();

                    fnViewOpenClass(seq, vodPath, width, height, lectureType, vodUrl);

                }
            // ,   complete : fnOnComplete
            ,   error :  fnOnError
        });
    }

    /*
    function fnOnSuccess(data) {
    }
    function fnOnComplete(data) {
    }
    */
    function fnOnError(data) {
        alert("�߸��� �����Դϴ�. ��ڿ��� �����ϼ���.");
        location.href = "/";
        // alert("fnOnError : " + data);
    }


    /**
     * �˾� ������ �������� ����.
     * ���� ����� �̿��ϹǷ� ������ ��ȸ�� ���� �Լ��� ȣ���� �ʿ䰡 ����.
     * @param seq �������� �Ϸù�ȣ
     * @param w ������ ����
     * @param h ������ ����
     */
    function fnViewOpenClassByPopup(seq, w, h) {
        if (w.length > 0) {
            window.open("", "ViewVod", "top=0, left=0, width="+w+", height="+h+", status=no, resizable=no");

        } else {
            window.open("", "ViewVod", "top=0, left=0, width=1008, height=570, status=no, resizable=no");
        }

        var formObj = document.openClassForm;
        formObj.action = "/servlet/controller.infomation.GoldClassHomePageServlet";
        formObj.p_process.value = "popUpVod";
        formObj.p_seq.value = seq;
        formObj.target = "ViewVod";
        formObj.submit();
        formObj.target = "_self";
    }


    /**
     * ������ �̵�
     */
    function goPage(pageNum) {
        var formObj = document.openClassForm;
        formObj.pageNo.value = pageNum;
        formObj.target="_self";
        formObj.action = "/servlet/controller.infomation.GoldClassHomePageServlet";
        formObj.p_process.value = "mainPage";
        formObj.submit();
    }

    /* ���� �̻��
    function goReply(seq){

        window.open("about:blank", "replyList", "top=0, left=0, width=637, height=530, status=no, resizable=no");

        document.form1.action="/servlet/controller.infomation.GoldClassHomePageServlet";
        document.form1.p_process.value = "insertReplyPage";
        document.form1.p_seq.value = seq;
        document.form1.target="replyList";
        document.form1.submit();

        document.form1.target="_self";
    }
    */

//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->

<form name="openClassForm" method="post" action="">
    <input type="hidden" name="p_process"       value="" />
    <input type="hidden" name="p_seq"           value="" />
    <input type="hidden" name="p_prePage"       value="" />
    <input type="hidden" name="p_genre"         value="" />
    <input type="hidden" name="p_lecture_cls"   value="<%= lectureCls %>" />
    <input type="hidden" name="pageNo"          value="<%= pageNo %>">

    <div id="mainMenu">
        <!-- ��ī���� �Ұ� -->
        <ul class="location">
            <li>Ȩ</li>
            <li>���� ����</li>
            <li> 
                <%= lectureClsNm %> <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul style="z-index: 1;">
                    <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <li><a href="javascript:fnOpenClassList('ALL');" <%= lectureCls.equals("ALL") ? "class=\"active\"" : "" %> >��ü</a></li>
                    <li><a href="javascript:fnOpenClassList('GC01');" <%= lectureCls.equals("GC01") ? "class=\"active\"" : "" %>>��ۿ���</a></li>
                    <li><a href="javascript:fnOpenClassList('GC02');" <%= lectureCls.equals("GC02") ? "class=\"active\"" : "" %>>����</a></li>
                    <li><a href="javascript:fnOpenClassList('GC03');" <%= lectureCls.equals("GC03") ? "class=\"active\"" : "" %>>��ȭ�ִ�ĳ����</a></li>
                    <li><a href="javascript:fnOpenClassList('GC04');" <%= lectureCls.equals("GC04") ? "class=\"active\"" : "" %>>����/����</a></li>
                    <li><a href="javascript:fnOpenClassList('GC05');" <%= lectureCls.equals("GC05") ? "class=\"active\"" : "" %>>��Ÿ</a></li>
                    <li><a href="javascript:fnOpenClassList('GC06');" <%= lectureCls.equals("GC06") ? "class=\"active\"" : "" %>>�������λ���Ʈ</a></li>
                    <li><a href="javascript:fnOpenClassList('GC07');" <%= lectureCls.equals("GC07") ? "class=\"active\"" : "" %>>������Ŭ����</a></li>
                    <li><a href="javascript:fnOpenClassList('GC08');" <%= lectureCls.equals("GC08") ? "class=\"active\"" : "" %>>�޳ݿ�������</a></li>
                </ul>
            </li>
            <!--
            <li> 
                <%=v_genrenm %> <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul style="z-index: 1;">
                    <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage" <%= v_genre.equals("ALL") ? "class=\"active\"" : "" %> >��ü</a></li>
                    <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G01" <%= v_genre.equals("G01") ? "class=\"active\"" : "" %>>��ۿ���</a></li>
                    <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G02" <%= v_genre.equals("G02") ? "class=\"active\"" : "" %>>��ȭ</a></li>
                    <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G03" <%= v_genre.equals("G03") ? "class=\"active\"" : "" %>>��ť���͸�</a></li>
                    <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G04" <%= v_genre.equals("G04") ? "class=\"active\"" : "" %>>��ȭ����</a></li>
                    <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G06" <%= v_genre.equals("G06") ? "class=\"active\"" : "" %>>����</a></li>
                    <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G05" <%= v_genre.equals("G05") ? "class=\"active\"" : "" %>>��Ÿ</a></li>
                </ul>
            </li>
            //-->
        </ul>

        <!-- ������ο� -->
        <div class="introCategory">
            <ul>
                <li><a href="javascript:fnOpenClassList('ALL');"><%= lectureCls.equals("ALL") ? "<strong><u>��ü</u></strong>" : "��ü" %> (<%= openClassCnt.getString("d_all_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassList('GC01');"><%= lectureCls.equals("GC01") ? "<strong><u>��ۿ���</u></strong>" : "��ۿ���" %> (<%= openClassCnt.getString("d_gc01_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassList('GC02');"><%= lectureCls.equals("GC02") ? "<strong><u>����</u></strong>" : "����" %></a> (<%= openClassCnt.getString("d_gc02_cnt") %>)</li>
                <li><a href="javascript:fnOpenClassList('GC03');"><%= lectureCls.equals("GC03") ? "<strong><u>��ȭ�ִ�ĳ����</u></strong>" : "��ȭ�ִ�ĳ����" %> (<%= openClassCnt.getString("d_gc03_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassList('GC04');"><%= lectureCls.equals("GC04") ? "<strong><u>����/����</u></strong>" : "����/����" %> (<%= openClassCnt.getString("d_gc04_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassList('GC05');"><%= lectureCls.equals("GC05") ? "<strong><u>��Ÿ</u></strong>" : "��Ÿ" %> (<%= openClassCnt.getString("d_gc05_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassList('GC06');"><%= lectureCls.equals("GC06") ? "<strong><u>�������λ���Ʈ</u></strong>" : "�������λ���Ʈ" %> (<%= openClassCnt.getString("d_gc06_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassList('GC07');"><%= lectureCls.equals("GC07") ? "<strong><u>������Ŭ����</u></strong>" : "������Ŭ����" %> (<%= openClassCnt.getString("d_gc07_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassList('GC08');"><%= lectureCls.equals("GC08") ? "<strong><u>�޳ݿ�������</u></strong>" : "�޳ݿ�������" %> (<%= openClassCnt.getString("d_gc08_cnt") %>)</a></li>
            </ul>
        </div>
        <!--
        <div class="introCategory">
            <ul>
                <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage"><%= v_genre.equals("ALL") ? "<strong><u>��ü</u></strong>" : "��ü" %></a></li>
                <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G01"><%= v_genre.equals("G01") ? "<strong><u>��ۿ���</u></strong>" : "��ۿ���" %></a></li>
                <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G02"><%= v_genre.equals("G02") ? "<strong><u>��ȭ</u></strong>" : "��ȭ" %></a></li>
                <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G03"><%= v_genre.equals("G03") ? "<strong><u>��ť���͸�</u></strong>" : "��ť���͸�" %></a></li>
                <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G04"><%= v_genre.equals("G04") ? "<strong><u>��ȭ����</u></strong>" : "��ȭ����" %></a></li>
                <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G06"><%= v_genre.equals("G06") ? "<strong><u>����</u></strong>" : "����" %></a></li>
                <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G05"><%= v_genre.equals("G05") ? "<strong><u>��Ÿ</u></strong>" : "��Ÿ" %></a></li>
            </ul>
        </div>
        //-->
        <!-- //������ο� -->
    </div>

    <!-- ������ ���� ���� -->
    <div id="contents">

        <h2 class="subTit"><%= v_subTit %></h2>
<%
        if ( lectureCls.equals("GC06") || lectureCls.equals("GC07")) {
%>
        <!--
        <div class="noticBox nbox1">
            �������λ���Ʈ / ������Ŭ���� �ȳ������Դϴ�.
        </div>
        //-->
<%
        }
%>
        <div id="subCont">
            <div class="movList">
<%
        if(openClassList.size() != 0) {
            v_seq = new int[ openClassList.size() ];
            for(i = 0; i < openClassList.size(); i++) {
                DataBox dbox = (DataBox)openClassList.get(i);

                v_seq[i] = dbox.getInt("d_seq");
                v_vodimg[i] = dbox.getString("d_vodimg");
                v_lecnm[i] = dbox.getString("d_lecnm");
                v_tutornm[i] = dbox.getString("d_tutornm");
                v_lectime[i] = dbox.getString("d_lectime");
                v_creator[i] = dbox.getString("d_creator");
                v_intro[i] = dbox.getString("d_intro");
                v_width_s[i] = dbox.getString("d_width_s");
                v_height_s[i] = dbox.getString("d_height_s");
                v_vodurl[i] = dbox.getString("d_vodurl");
                v_tutorimg[i] = ( dbox.getString("d_tutorimg").equals("") ) ? "/images/common/no_profile_img.png" : StringManager.replace(dbox.getString("d_tutorimg"),"\\","/");
                v_tutorcareer[i] = dbox.getString("d_tutorcareer");
                v_tutorauthor[i] = dbox.getString("d_tutorauthor");
                v_contents[i] = dbox.getString("d_contents");

                totalPage = dbox.getInt("d_totalPage");
                totalRowCount = dbox.getInt("d_totalRowCount");

                if((i+1)%3 == 1) {
%>
                <ul>
<%
                }
%>
                    <li>
                        <dl>
                            <dt><a href="javascript:fnViewOpenClass('<%= dbox.getString("d_seq") %>', '<%= dbox.getString("d_vod_path") %>', '<%=dbox.getString("d_width_s") %>','<%=dbox.getString("d_height_s") %>', '<%= dbox.getString("d_lecture_type") %>', '<%= dbox.getString("d_vodurl") %>');"><img src="<%=StringManager.replace(dbox.getString("d_vodimg"),"\\","/") %>" alt="" /></a>
                            <span class="movieTime"><%=dbox.getString("d_lectime") %></span></dt>
                            <dd>
<%
                String newYnImgStr = "";
                if ( dbox.getString("d_new_yn").equals("Y") ) {
                    newYnImgStr = "<img src=\"/images/common/open_new2.gif\" alt=\"\" style='vertical-align:middle;' />";
                }
%>
                                <a href="javascript:fnViewOpenClass('<%= dbox.getString("d_seq") %>', '<%= dbox.getString("d_vod_path") %>', '<%=dbox.getString("d_width_s") %>','<%=dbox.getString("d_height_s") %>', '<%= dbox.getString("d_lecture_type") %>', '<%= dbox.getString("d_vodurl") %>');"  style="padding-bottom:8px;"><%= newYnImgStr + " " + dbox.getString("d_lecnm") %></a>
                                <a href="#profile_<%=dbox.getInt("d_seq") %>" class="btn_teacher">����Ұ�</a>
                            </dd>
                        </dl>
                    </li>
<%
                if((i+1) % 3 == 0 || (i+1) == openClassList.size()) {
%>
                </ul>
<%
                    if(openClassList.size() < 3) {
                        j = 1;
                    } else {
                        j = (i-2);
                    }
                    for(; j < (i+1); j++){
%>
                <!-- ������ ���̾� -->
                <div id="profile_<%= v_seq[j] %>" class="movLayer">
                    <a href="#" class="btn_layerClose"><img src="/images/2013/open_edu/btn_layer_close.gif" alt="�ݱ�" /></a>
                    <p class="tit"><%= v_lecnm[j] %> <span style="font-size: 14px;font-weight: normal;"> - <%= v_tutornm[j] %></span></p>
                    <dl>
                        <dt><img src="<%= v_tutorimg[j] %>" alt="�����ʻ���" />
<!--                                        <a href="javascript:fnViewOpenClassByPopup(<%=v_seq[j] %>, '<%=v_width_s[j] %>','<%=v_height_s[j] %>')"><img src="/images/2013/open_edu/btn_play.gif" alt="���Ǻ���" /></a>-->
                        </dt>
                        <dd>
                            <span class="tit_history"><img src="/images/2013/open_edu/tit_history.gif" alt="���" /></span>
                            <ul>
                                <li>&nbsp;&nbsp;<%=v_tutorcareer[j].replaceAll("\r\n","<br/>") %></li>
                            </ul>
                        </dd>
                        <dd class="last">
                            <span class="tit_history"><img src="/images/2013/open_edu/tit_major.gif" alt="�ֿ� ���� �� ����" /></span>
                            <ul>
                                <li>&nbsp;&nbsp;<%=v_tutorauthor[j].replaceAll("\r\n","<br/>") %></li>
                            </ul>
                        </dd>
                    </dl>
                </div>
                <!--// ������ ���̾� -->
<%
                    }
                }
            }
%>
            <div class="paging pgSpace">
                <%= PageUtil.re2013_printPageListDiv(totalPage, pageNo, 0, pageSize, totalRowCount) %>
            </div>

<%
        } else {
%>
                <ul>
                    <li>��ϵ� ���°� �����ϴ�.</li>
                </ul>
<%
        }
%>

            </div>
        </div>
        <!-- //#subCont -->


    </div>
    <!-- //#contents -->
    <!-- ������ ���� �� -->

</form>

    <div class="divPopupMask"></div>
    <div id="divPopup">
        <div id="vodArea"></div>
        <div class="closeBtn"><img src="/images/common/close.png" id="" onclick="fnCloseViewWin();" /></div>
    </div>
    <div id="oHiddenFlashArea" style="display:none;"></div>


<%@ include file="/learn/user/2013/portal/include/footer.jsp"%>
