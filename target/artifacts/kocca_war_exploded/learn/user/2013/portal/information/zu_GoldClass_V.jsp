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

    DataBox dbox = (DataBox)request.getAttribute("selectOffExpert");

    DataBox openClassCnt = (DataBox)request.getAttribute("openClassCnt"); // �����¼�

    ArrayList nextSubjList = (ArrayList)request.getAttribute("nextSubjList"); // ���� ����
    ArrayList<DataBox> reviewList = (ArrayList<DataBox>)request.getAttribute("reviewList"); // ���� �ı�

    if (box == null) box = RequestManager.getBox(request);

    String v_genre = box.getStringDefault("p_genre","ALL");
    String v_genrenm = "";
    String v_subTit = "";

    String lectureCls = box.getStringDefault("p_lecture_cls","ALL");
    String gubun = lectureCls.substring(0,2);
    String lectureClsNm = "";

    String dirFlag = box.getStringDefault("p_dir_flag", "N");
    String seq = box.getStringDefault("p_seq", "");
    
    String loginUserId = box.getSession("userid");
    
    boolean isMyReviewReg = false;
    int totalRowCount = 0;
    int totalPage = 0;
    int pageNo = ( box.getInt("p_pageno") == 0 ) ? 1 : box.getInt("p_pageno");
    int pageSize = ( box.getInt("p_pagesize") == 0 ) ? 5 : box.getInt("p_pagesize");


    if(lectureCls.equals("ALL")){
        lectureClsNm = "��ü";
        v_subTit = lectureClsNm;

    } else if (lectureCls.equals("GC01")) {
        lectureClsNm = "��ۿ���";
        v_subTit = lectureClsNm;

    } else if (lectureCls.equals("GC02")) {
        lectureClsNm = "����";
        v_subTit = lectureClsNm;

    } else if (lectureCls.equals("GC03")) {
        lectureClsNm = "��ȭ�ִ�ĳ����";
        v_subTit = lectureClsNm;

    } else if(lectureCls.equals("GC04")) {
        lectureClsNm = "���ǰ���";
        v_subTit = lectureClsNm;

    } else if(lectureCls.equals("GC05")) {
        lectureClsNm = "��Ÿ";
        v_subTit = lectureClsNm;

    } else if(lectureCls.equals("GC06")) {
        lectureClsNm = "������ �λ���Ʈ";
        v_subTit = lectureClsNm;

    } else if(lectureCls.equals("GC07")) {
        lectureClsNm = "������ Ŭ����";
        v_subTit = lectureClsNm;

    } else if(lectureCls.equals("GC08")) {
        lectureClsNm = "�޳ݿ�������";
        v_subTit = lectureClsNm;
    }  else if (lectureCls.equals("OT01")) {
        lectureClsNm = "���Ư��";
        v_subTit = lectureClsNm;

    } else if (lectureCls.equals("OT02")) {
        lectureClsNm = "Ʈ����";
        v_subTit = lectureClsNm;

    } else if (lectureCls.equals("OT03")) {
        lectureClsNm = "��ų���Ͽ�";
        v_subTit = lectureClsNm;

    } else if(lectureCls.equals("OT04")) {
        lectureClsNm = "â������";
        v_subTit = lectureClsNm;

    } else if(lectureCls.equals("OT05")) {
        lectureClsNm = "����Ž��";
        v_subTit = lectureClsNm;

    } else if(lectureCls.equals("OT06")) {
        lectureClsNm = "������Ŭ����";
        v_subTit = lectureClsNm;

    } else if(lectureCls.equals("OT07")) {
        lectureClsNm = "�������λ���Ʈ";
        v_subTit = lectureClsNm;

    } else if(lectureCls.equals("OT08")) {
        lectureClsNm = "�濵/����";
        v_subTit = lectureClsNm;
    
    } else if(lectureCls.equals("OT09")) {
        lectureClsNm = "������";
        v_subTit = lectureClsNm;
    
    } else if(lectureCls.equals("OT10")) {
        lectureClsNm = "�����Ͻ� ��ų";
        v_subTit = lectureClsNm;
    }


    box.put("title_str",  dbox.getString("d_lecnm") + ", " + lectureClsNm + ", ��������" );

    box.put("og_title", dbox.getString("d_lecnm"));
    box.put("og_url", "http://edu.kocca.or.kr/servlet/controller.infomation.GoldClassHomePageServlet?p_process=" + box.get("p_process") + "&p_seq=" + box.get("p_seq") + "&p_lecture_cls=" + lectureCls);
    box.put("og_description", dbox.getString("d_intro"));
    box.put("og_image", "http://edu.kocca.or.kr" + dbox.getString("d_vodimg").replaceAll("\\\\","/") );

%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<style type="text/css">
    /* * {margin:0; padding:0;} */
    /* img {border:0; vertical-align:top;} */

    #divPopup       {position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; margin:0; auto; vertical-align:middle; text-align: center; z-index:5003; display: none; }
    #vodArea        {position: absolute; width:920px; height:540px; border-style:solid; border:6px solid #fff; background-color:#efefef; z-index:5004; display: none; }
    .vodWinCloseBtn {position: absolute; width:25px; height:25px; color:white; text-align:center; padding-top:10px; cursor:pointer; z-index:5005; display: none; }
    .divPopupMask   {position: fixed; left:0px; top:0px; width:100%; height:100%; background-image: url(/images/common/mask.png); z-index:5002; display: none; }
    .lecname a{ width:600px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis; }
    /* .divPopupMask   {position: fixed; top:0px; left:0px; width:100%; height:100%; background-image: url(/images/common/mask_transparency.png); z-index:5002; display: none; } */

</style>

<script language="JavaScript">

  $(function() {

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
                $(".vodWinCloseBtn").css( {"left": closeBtnPosX, "top": closeBtnPosY } );
            }
        });

        $("#oAnchorShareSns").on( {
            "click": function(e) {
                e.preventDefault();
                e.stopPropagation();
                var windowW = $(window).width();

                if ($("#oshareSns").is(":hidden")) {
                    $("#oshareSns").css("top", $("#oBtnList").position().top + 44);
                    $("#oshareSns").css("left", windowW / 2 + 366);
                    $("#oshareSns").show();
                } else {
                    $("#oshareSns").hide();
                }
            }
        });

        $(document).click(function(){
            $("#oshareSns").hide();
        });

        $("#oAnchorShareSns").click(function(e){
            e.stopPropagation();
        });

        $(window).resize(function () {
            var windowW = $(window).width();

            $("#oshareSns").css("left", windowW / 2 + 366);
        });

        $(".play_movie img").mouseover( function () {
            $(".play_movie img").attr("src", "/images/2013/btn/btn_playb.png");
        });
        $(".play_movie img").mouseout( function () {
            $(".play_movie img").attr("src", "/images/2013/btn/btn_playw.png");
        });


<%
    if ( dirFlag.equals("Y") ) {
%>
        fnViewOpenClassDirect(<%= seq %>);
<%
    }
%>
    });

    //���� ���뺸��
    function whenSubjInfo(subj,subjnm,courseyn,upperclass,upperclassnm, year, subjseq){
        var url = "/servlet/controller.propose.ProposeCourseServlet";
        var param = "?p_process=SubjectPreviewPage&p_subj=" + subj + "&p_year=" + year + "&p_subjseq=" + subjseq;

        location.href = url + param;
    }

    // �� ��ȭ�� �������� �̵�
    function fnViewContent(seq) {
        var formObj = document.openClassForm;
        formObj.method = "get";
        formObj.p_prePage.value = "Main";
        formObj.action = "/servlet/controller.infomation.GoldClassHomePageServlet";
        formObj.target="_self";
        formObj.p_process.value = "selectView";
        formObj.p_seq.value = seq;
        formObj.seq.value = seq;
        formObj.submit();
    }


    /**
     * SNS �����ϱ�
     */
    function fnShareOnSNS( snsName ) {
        var url = location.href;

        if (url.indexOf("?") == -1 ) {
            url += "?p_process=<%=box.get("p_process")%>&year=<%=box.get("p_year")%>&subj=<%=box.get("seq")%>&p_seq=<%=box.get("p_seq")%>&p_lecture_cls=<%=box.getString("p_lecture_cls")%>";
          //url += "?p_process=<%=box.get("p_process")%>?year=<%=box.get("p_year")%>&subj=<%=box.get("p_subj")%>&subjseq=<%=box.get("p_seq")%>";
        }

        fnSendSns( snsName, url, "<%= dbox.getString("d_lecnm") %>");

        $("#oshareSns").hide();

    }

    /**
     * ����(���԰���/��������) ���ϱ�
     *20161006
     */
    var isLogin = "<%= box.getSession("userid") %>";

    function fnRegSubjFavor( classType, subj, jobType ) {
        if ( <%= box.getSession("userid").length() == 0 %>) {
            var frmURL = location.href;
            frmURL = frmURL.replace("http://", "");
            var idx = frmURL.indexOf("/");

            frmURL = frmURL.substr(idx, frmURL.length);

            alert("�α��� ��  �̿����ּ���.");
            location.href = "/learn/user/2013/portal/homepage/zu_MainLogin.jsp?p_frmURL=" + encodeURIComponent( frmURL );

            return;
        } else {

            var param = "classType=" + classType + "&subj=" + subj + "&jobType=" + jobType;
            var successMsg = "";

            $.ajax({
                    type : "get"
                ,   url : "/servlet/controller.mobile.subj.SubjFavorServlet"
                ,   dataType : "json"
                ,   data : param
                ,   success : function (data) {

                        if ( data.resultCnt > 0) {

                            if (jobType == "register" ) {
                                $("#oBtnList > a").eq(0).attr("onclick", "javascript:fnRegSubjFavor( '02', '" + subj + "', 'cancel' );").attr("title", "�� ���¸� ���� ���� ��Ͽ��� �����մϴ�.");// javascript �Լ� ����
                                $("#oBtnFavor").attr("src", "/images/2013/online_edu/btn_class_minex.gif");    // ��ư �̹��� ����

                                successMsg = "���� ���¿� �߰��Ǿ����ϴ�.";
                                $("input[name=p_favoryn]").val("Y");

                            } else {
                                $("#oBtnList > a").eq(0).attr("onclick", "javascript:fnRegSubjFavor( '02', '" + subj + "', 'register' );").attr("title", "�� ���¸� ���� ���� ��Ͽ� �߰��մϴ�.");// javascript �Լ� ����
                                $("#oBtnFavor").attr("src", "/images/2013/online_edu/btn_class_mine.gif");    // ��ư �̹��� ����

                                successMsg = "���� ���¿��� �����Ǿ����ϴ�.";
                                $("input[name=p_favoryn]").val("N");
                            }

                            alert( successMsg );
                        } else {
                            alert("������ �߻��Ͽ����ϴ�.\n�����ڿ��� �����ϼ���.");
                            return;
                        }
                    }
                ,   complete : function(arg1, arg2) {
                        // alert("complete : " + arg1);
                    }
                ,   error :  function(arg1, arg2) {
                        // alert("error : " + arg1);
                    }

            });
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
        // file = "http://edu.kocca.or.kr" + file;

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
        $(".divPopupMask, #divPopup, #vodArea, .vodWinCloseBtn").hide();
        $(".play_movie > a").focus();
    }

    /**
     * �Ӻ��� ������ �������� ��ȸ�� ���� (ajax)
     */
    function fnUpdateViewCount(seq) {
        $.ajaxSetup({cache:false});
        $.ajax({
                type : "get"
            ,   url : "/servlet/controller.infomation.GoldClassHomePageServlet"
            ,   dataType : "text"
            ,   data : "p_process=updateViewCount&seq=" + seq
            ,   success : function(data) { }
            ,   complete : function(arg1, arg2) {}
            ,   error :  function(arg1, arg2) {}
        });
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

            if ( $("#vodArea").is(":hidden") ) {

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
                $(".vodWinCloseBtn").css( {"left": closeBtnPosX, "top": closeBtnPosY } );
                $(".divPopupMask, #divPopup, #vodArea, .vodWinCloseBtn").show();

                $(".vodWinCloseBtn > a").focus();

                $.get(
                    vodUrl,
                    function( data ) {
                        $("#oHiddenFlashArea").html( data.substr(data.indexOf("<body"), data.lastIndexOf("</body>") ) );

                        fnLoadSWF(vodPath, width, height, true, "vodURL=" + $("#oFlashVar").val());

                        fnUpdateViewCount(seq);
                    }
                );
            } else {
                return;
            }
        }
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

    function fnUpdateCountCallback(data) {
        alert("fnUpdateCountCallback : " + data);
    }

	function scriptAct(){
		window.open('/contents/openclass/<%= seq %>/script/script.html','','width=600,height=540');
	}

    /**
     * �ı� ������ Ȯ���Ѵ�.
     */
    function fnViewReivewContents( idx ) {
        var contObj = $("#oReviewContents" + idx);
        var hiddenYn = contObj.is(":hidden");

        $("tr[name=reviewContents]").hide();

        if ( hiddenYn ) {
            contObj.show();
        } else {
            contObj.hide();
        }
    }

    /**
     * �ı� ��Ͽ��� ������ �̵� ó���� �Ѵ�.
     * ajax�� �̿��Ͽ� ���ο� ����� ��ȸ�ϰ� �ϴ��� ������ ��ɵ� ó���Ѵ�.
     */
    function goPage(pageNum) {
        var param = "p_process=selectReviewListForAjax&p_seq=" + $("#oSeq").val() + "&p_pageno=" + pageNum;

        var reviewListStr = "";
        var pagingStr = "";
        var idx = 0;
        var starRate = "";
        var point = 0;
        var loginUserId = "<%= box.getSession("userid") %>";

        var pageNo = 0;
        var pageSize = 3;
        var startPage = 0;
        var endPage = 0;
        var blockSize = 0;
        var pageBlock = 0;
        var blockCount = 0;

        $.ajaxSetup({cache:false});
        $.ajax({
                type : "get"
            ,   url : "/servlet/controller.infomation.GoldClassHomePageServlet"
            ,   dataType : "json"
            ,   data : param
            ,   success : function (data) {

                    var currCnt = data.reviewList.length;
                    var k = 0;

                    // �ı� ��� ǥ��
                    if ( currCnt > 0 ) {
                        $("tr[name=reviewTitle]").remove();
                        $("tr[name=reviewContents]").remove();

                        $.each( data.reviewList, function(){

                            point = Number(this.d_checkpoin);
                            for ( var i = 1; i <= point; i++ ) {
                                starRate += "��";
                            }
                            for ( var j = 1; j <= 5 - point; j++ ) {
                                starRate += "��";
                            }

                            reviewListStr += "<tr id=\"oReviewTitle" + idx + "\" name=\"reviewTitle\"> \n";
                            reviewListStr += "    <th scope=\"row\">" + this.d_dispnum + "</th> \n";
                            reviewListStr += "    <td>  \n";
                            reviewListStr += "        <div style=\"width:420px; height:16px; overflow:hidden; white-space:nowrap; text-overflow:ellipsis;\">    \n";
                            reviewListStr += "            <a href=\"javascript:fnViewReivewContents(" + idx + ");\" >" + this.d_cont + "</a>    \n";
                            reviewListStr += "        </div>    \n";
                            reviewListStr += "    </td> \n";
                            reviewListStr += "    <td>" + starRate + "</td> \n";
                            reviewListStr += "    <td style=\"text-align:center;\">" + this.d_name + "</td>  \n";
                            reviewListStr += "    <td>" + this.d_regdt + "</td>   \n";
                            reviewListStr += "</tr> \n";
                            reviewListStr += "<tr id=\"oReviewContents" + idx + "\" name=\"reviewContents\" style=\"display:none;\">  \n";
                            reviewListStr += "    <td colspan=\"5\" style=\"border-left:0; padding-left:131px;\"> \n";
                            reviewListStr += "        " + this.d_cont.replace(/\n/gi, "<br/>");  + " \n";
                            reviewListStr += "        <input type=\"hidden\" id=\"oContentsText" + idx + "\" name=\"contentsText" + idx + "\" value=\"" + this.d_cont + "\" /> \n";

                            if ( loginUserId != null && loginUserId != "" && loginUserId == this.d_regid ) {
                                reviewListStr += "        <div style=\"padding:10px 0 0 0; text-align:right;\">   \n";
                                reviewListStr += "            <a href=\"javascript:fnViewModifyPopup(" + this.d_num + ", " + this.d_checkpoin + ", " + idx + ");\"><img src=\"/images/2013/online_edu/btn_write_modify.gif\" alt=\"����\" /></a> \n";
                                reviewListStr += "             <a href=\"javascript:fnDeleteReview(" + this.d_num + ", " + idx + ");\"><img src=\"/images/2013/online_edu/btn_delete.gif\" alt=\"����\" /></a>   \n";
                                reviewListStr += "        </div>  \n";
                            }
                            reviewListStr += "    </td> \n";
                            reviewListStr += "</tr> \n";

                            $("#oReviewTable tbody").append(reviewListStr);
                            reviewListStr = "";
                            starRate = "";
                            idx++;

                            pageNo = this.d_pageno;
                            startPage = this.d_startpage;
                            endPage = this.d_endpage;
                            pageBlock = this.d_pageblock;
                            blockSize = this.d_blocksize;
                            blockCount = this.d_blockcount;
                        });

                        if ( pageBlock == 1 ) {
                            pagingStr += "<a href=\"javascript:void(0);\"><img src=\"/images/2013/common/btn_pre.jpg\" alt=\"����������\" /></a>";
                        } else {
                            pagingStr += "<a href=\"javascript:goPage(" + ( startPage - blockSize ) + ");\"><img src=\"/images/2013/common/btn_pre.jpg\" alt=\"����������\" /></a>";
                        }
                        pagingStr += "<span>";

                        for( var i = startPage ; i <= endPage ; i++ ) {
                            if (i == pageNo) {
                                pagingStr += "<strong>" + i + "</strong>";
                            } else {
                                pagingStr += "<a href=\"javascript:goPage('" + i + "');\">" + i + "</a>";
                            }
                        }

                        pagingStr += "</span>";

                        if ( pageBlock == blockCount ) {
                            pagingStr += "<a href=\"javascript:void(0);\"><img src=\"/images/2013/common/btn_next.jpg\" alt=\"����������\" /></a>";
                        } else {
                            pagingStr += "<a href=\"javascript:goPage(" + ( endPage + 1 ) + ");\"><img src=\"/images/2013/common/btn_next.jpg\" alt=\"����������\" /></a>";
                        }

                        $("#oPagingArea").css("display", "block");
                        $("#oPagingArea").empty();
                        $("#oPagingArea").append(pagingStr);

                    } else {
                        reviewListStr = "";
                        reviewListStr += "<tr name=\"reviewTitle\"> \n";
                        reviewListStr += "    <td style=\"text-align:center; border-left:1px;\" colspan=\"5\">��ϵ� �ıⰡ �����ϴ�.</td>  \n";
                        reviewListStr += "</tr> \n";
                        $("tr[name=reviewTitle]").remove();
                        $("tr[name=reviewContents]").remove();
                        $("#oPagingArea").css("display", "none");
                        $("#oReviewTable tbody").append(reviewListStr);
                    }

                }
            ,   complete : function(arg1, arg2) {
                    // alert("complete : " + arg1);
                }
            ,   error :  function(XMLHttpRequest, textStatus, errorThrown) {
                    // alert("error : " + errorThrown);
                    alert("������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���.");
                }

        });

    }
    /**
     * �ı� ������ ����Ѵ�.
     */
    function fnRegisterReview() {

        if ( $("input:radio[name=checkpoin]:checked").length == 0 ) {
            alert("������ �������ּ���.");
            $("input:radio[name=checkpoin]").eq(0).focus();
            return;

        } else if( $("#oReviewRegForm textarea[name=cont]").val() == "") {
            alert("�ı� ������ �Է��ϼ���.");
            $("#oReviewRegForm textarea[name=cont]").focus();
            return;

        } else if (confirm("�ı⸦ ����Ͻðڽ��ϱ�?")) {

            $("#oReviewRegForm input[name=process]").val("registerReview");
            var param = $("#oReviewRegForm").serialize();

            $.ajaxSetup({cache:false});
            $.ajax({
                    type : "post"
                ,   url : "/servlet/controller.mobile.openclass.OpenClassReviewServlet"
                ,   dataType : "json"
                ,   data : param
                ,   success : function (data) {
                        $('[data-dismiss="modal"]').trigger("click");

                        if ( data.resultCnt > 0 ) {
                            $("#oReviewButton").hide();
                            goPage(1);
                            alert("�ıⰡ ��ϵǾ����ϴ�.");
                            $("#oReviewRegForm textarea[name=cont]").val("");
                            $("#oReviewRegForm input:radio[name=checkpoin]").removeAttr("checked");
                        } else {
                            alert("������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���.");
                        }
                    }
                ,   complete : function(arg1, arg2) {
                        // alert("complete : " + arg1);
                    }
                ,   error :  function(XMLHttpRequest, textStatus, errorThrown) {
                        // alert("error : " + errorThrown);
                        alert("������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���.");
                    }
            });
        }
    }

    /**
     * �ı� ���� ���� �˾��� ����.
     */
    function fnViewModifyPopup(num, checkpoin, idx) {
        $("input:radio[name=checkpoin][value=\"" + checkpoin +"\"]").attr("checked", true);
        $("#oReviewRegForm textarea[name=cont]").val( $("#oContentsText" + idx).val() );
        $(".modal-content .modal-btn").eq(0).attr("onclick", "fnModifyReview(" + num + ");");
        $("[data-toggle=\"modal\"]").trigger("click");
    }

    /**
     * �ı� ������ �����Ѵ�.
     */
    function fnModifyReview( num ) {

        if ( $("input:radio[name=checkpoin]:checked").length == 0 ) {
            alert("������ �������ּ���.");
            $("input:radio[name=checkpoin]").eq(0).focus();
            return;

        } else if( $("#oReviewRegForm textarea[name=cont]").val() == "") {
            alert("�ı� ������ �Է��ϼ���.");
            $("#oReviewRegForm textarea[name=cont]").focus();
            return;

        } else if (confirm("�ı⸦ �����Ͻðڽ��ϱ�?")) {

            $("#oReviewRegForm input[name=process]").val("modifyReview");
            $("#oReviewRegForm input[name=num]").val(num);
            var param = $("#oReviewRegForm").serialize();

            $.ajaxSetup({cache:false});
            $.ajax({
                    type : "post"
                ,   url : "/servlet/controller.mobile.openclass.OpenClassReviewServlet"
                ,   dataType : "json"
                ,   data : param
                ,   success : function (data) {
                        $('[data-dismiss="modal"]').trigger("click");

                        if ( data.resultCnt > 0 ) {
                            // $("#oReviewButton").hide();
                            goPage(1);
                            alert("�ıⰡ �����Ǿ����ϴ�.");
                            $("#oReviewRegForm textarea[name=cont]").val("");
                            $("#oReviewRegForm input:radio[name=checkpoin]").removeAttr("checked");
                        } else {
                            alert("������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���.");
                        }
                    }
                ,   complete : function(arg1, arg2) {
                        // alert("complete : " + arg1);
                    }
                ,   error :  function(XMLHttpRequest, textStatus, errorThrown) {
                        // alert("error : " + errorThrown);
                        alert("������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���.");
                    }
            });
        }
    }

    /**
     * �ı� ������ �����Ѵ�.
     */
    function fnDeleteReview(num, idx) {
        $("#oReviewRegForm input[name=process]").val("deleteReview");
        $("#oReviewRegForm input[name=num]").val(num);
        var param = $("#oReviewRegForm").serialize();

        if (confirm("�ı⸦ �����Ͻðڽ��ϱ�?")) {

            $.ajaxSetup({cache:false});
            $.ajax({
                    type : "post"
                ,   url : "/servlet/controller.mobile.openclass.OpenClassReviewServlet"
                ,   dataType : "json"
                ,   data : param
                ,   success : function (data) {
                        $('[data-dismiss="modal"]').trigger("click");
                        if ( data.resultCnt > 0 ) {
                            $("#oReviewTitle" + idx).remove();
                            $("#oReviewContents" + idx).remove();
                            goPage(1);
                            alert("�ıⰡ �����Ǿ����ϴ�.");
                            $("#oReviewRegForm textarea[name=cont]").val("");
                            $("#oReviewRegForm input:radio[name=checkpoin]").removeAttr("checked");
                            $(".modal-content .modal-btn").eq(0).attr("onclick", "fnRegisterReview();");
                            $("#oReviewButton").show();
                        } else {
                            alert("������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���.");
                        }
                    }
                ,   complete : function(arg1, arg2) {
                        // alert("complete : " + arg1);
                    }
                ,   error :  function(XMLHttpRequest, textStatus, errorThrown) {
                        // alert("error : " + errorThrown);
                        alert("������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���.");
                    }
            });
        }
    }
</script>
<!-- Common �������� -->

<!-- container-new ���� //-->
<div id="container-new">

<form name="openClassForm" method="post" action="">
    <input type="hidden" name="p_process" value="" />
    <input type="hidden" id="oSeq" name="p_seq" value="<%= box.get("p_seq") %>" />
    <input type="hidden" name="seq" value="<%= box.get("p_seq") %>" />
    <input type="hidden" name="p_prePage" value="" />
    <input type="hidden" name="p_genre" value="" />
    <input type="hidden" name="p_lecture_cls" value="<%= lectureCls %>" />
    <input type="hidden" name="pageNo" value="">


    <div id="mainMenu">
        <% if(gubun.equals("GC")){ %>
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
		<% } else if (gubun.equals("OT")) { %>
		<ul class="location">
            <li>Ȩ</li>
            <li>���� ����</li>
            <li>
                <%= lectureClsNm %> <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul style="z-index: 1;">
                    <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <li><a href="javascript:fnOpenClassThemeList('ALL');" <%= lectureCls.equals("ALL") ? "class=\"active\"" : "" %> >��ü</a></li>
                    <li><a href="javascript:fnOpenClassThemeList('OT01');" <%= lectureCls.equals("OT01") ? "class=\"active\"" : "" %>>���Ư��</a></li>
                    <li><a href="javascript:fnOpenClassThemeList('OT02');" <%= lectureCls.equals("OT02") ? "class=\"active\"" : "" %>>Ʈ����</a></li>
                    <li><a href="javascript:fnOpenClassThemeList('OT03');" <%= lectureCls.equals("OT03") ? "class=\"active\"" : "" %>>��ų���Ͽ�</a></li>
                    <li><a href="javascript:fnOpenClassThemeList('OT04');" <%= lectureCls.equals("OT04") ? "class=\"active\"" : "" %>>â������</a></li>
                    <li><a href="javascript:fnOpenClassThemeList('OT05');" <%= lectureCls.equals("OT05") ? "class=\"active\"" : "" %>>����Ž��</a></li>
                    <li><a href="javascript:fnOpenClassThemeList('OT06');" <%= lectureCls.equals("OT06") ? "class=\"active\"" : "" %>>������Ŭ����</a></li>
                    <li><a href="javascript:fnOpenClassThemeList('OT07');" <%= lectureCls.equals("OT07") ? "class=\"active\"" : "" %>>�������λ���Ʈ</a></li>
                    <li><a href="javascript:fnOpenClassThemeList('OT08');" <%= lectureCls.equals("OT08") ? "class=\"active\"" : "" %>>�濵/����</a></li>
                    <li><a href="javascript:fnOpenClassThemeList('OT09');" <%= lectureCls.equals("OT09") ? "class=\"active\"" : "" %>>������</a></li>
                    <li><a href="javascript:fnOpenClassThemeList('OT10');" <%= lectureCls.equals("OT10") ? "class=\"active\"" : "" %>>�����Ͻ� ��ų</a></li>
                </ul>
            </li>
        </ul>

        <!-- ������ο� -->
        <div class="introCategory">
            <ul>
                <li><a href="javascript:fnOpenClassThemeList('ALL');"><%= lectureCls.equals("ALL") ? "<strong><u>��ü</u></strong>" : "��ü" %> (<%= openClassCnt.getString("d_all_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassThemeList('OT01');"><%= lectureCls.equals("OT01") ? "<strong><u>���Ư��</u></strong>" : "���Ư��" %> (<%= openClassCnt.getString("d_ot01_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassThemeList('OT02');"><%= lectureCls.equals("OT02") ? "<strong><u>Ʈ����</u></strong>" : "Ʈ����" %></a> (<%= openClassCnt.getString("d_ot02_cnt") %>)</li>
                <li><a href="javascript:fnOpenClassThemeList('OT03');"><%= lectureCls.equals("OT03") ? "<strong><u>��ų���Ͽ�</u></strong>" : "��ų���Ͽ�" %> (<%= openClassCnt.getString("d_ot03_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassThemeList('OT04');"><%= lectureCls.equals("OT04") ? "<strong><u>Ī������</u></strong>" : "â������" %> (<%= openClassCnt.getString("d_ot04_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassThemeList('OT05');"><%= lectureCls.equals("OT05") ? "<strong><u>����Ž��</u></strong>" : "����Ž��" %> (<%= openClassCnt.getString("d_ot05_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassThemeList('OT06');"><%= lectureCls.equals("OT06") ? "<strong><u>������Ŭ����</u></strong>" : "������Ŭ����" %> (<%= openClassCnt.getString("d_ot06_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassThemeList('OT07');"><%= lectureCls.equals("OT07") ? "<strong><u>�������λ���Ʈ</u></strong>" : "�������λ���Ʈ" %> (<%= openClassCnt.getString("d_ot07_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassThemeList('OT08');"><%= lectureCls.equals("OT08") ? "<strong><u>�濵/����</u></strong>" : "�濵/����" %> (<%= openClassCnt.getString("d_ot08_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassThemeList('OT09');"><%= lectureCls.equals("OT09") ? "<strong><u>������</u></strong>" : "������" %> (<%= openClassCnt.getString("d_ot09_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassThemeList('OT10');"><%= lectureCls.equals("OT10") ? "<strong><u>�����Ͻ� ��ų</u></strong>" : "�����Ͻ� ��ų" %> (<%= openClassCnt.getString("d_ot10_cnt") %>)</a></li>
            </ul>
        </div>
        
        <!-- //������ο� -->
		<% } %>
    </div>

    <!-- ������ ���� ���� -->
    <div id="contents">
        <h2 class="subTit"><%=v_subTit%></h2>
        <div id="subCont">


            <!-- online_box -->
            <div class="online_box">
                <div class="smart_device">
                    <div class="sdleft" style="width:938px">
                        <p>
                            <a href="javascript:fnViewOpenClass('<%= dbox.getString("d_seq") %>', '<%= dbox.getString("d_vod_path") %>', '<%=dbox.getString("d_width_s") %>','<%=dbox.getString("d_height_s") %>', '<%= dbox.getString("d_lecture_type") %>', '<%= dbox.getString("d_vodurl") %>');">
                            <img src="<%= dbox.getString("d_vodimg").replaceAll("\\\\","/") %>" style="width:938px; height:457px" alt="���º���" /></a>
                        </p>
                    </div>
                    <div class="play_movie">
                        <a href="javascript:fnViewOpenClass('<%= dbox.getString("d_seq") %>', '<%= dbox.getString("d_vod_path") %>', '<%=dbox.getString("d_width_s") %>','<%=dbox.getString("d_height_s") %>', '<%= dbox.getString("d_lecture_type") %>', '<%= dbox.getString("d_vodurl") %>');"><img src="/images/2013/btn/btn_playw.png" alt=""/></a>
                    </div>
                    <div style="width:938px">
<%
                        if("Y".equals(dbox.getString("d_hit_yn"))){
%>
                        <img src="/images/2013/online_edu/detail_popular.gif" style="margin-right:5px;" alt="�α�" />
<%
                        }
                        if("Y".equals(dbox.getString("d_recom_yn"))){
%>
                        <img src="/images/2013/online_edu/detail_recommend.gif" style="margin-right:5px;" alt="��õ" />
<%
                        }
                        if("Y".equals(dbox.getString("d_new_yn"))){
%>
                        <img src="/images/2013/online_edu/detail_new.gif" style="margin-right:5px;" alt="�ű�" />
<%
                        }
%>
                    </div>
					
                    <div id="divPopup">
                        <div id="vodArea"></div>
                        <div class="vodWinCloseBtn"><a href="javascript:fnCloseViewWin();"><img src="/images/common/close.png" alt="������â �ݱ�" /></a></div>
                    </div>
                    <div id="oHiddenFlashArea" style="display:none;"></div>

                    <div class="title" style="width:938px; margin-top:-40px;">
                        <%=dbox.getString("d_lecnm")%>
                    </div>
                    <div>
                        <div>
                            <img src="/images/2013/online_edu/dot2.gif" width= "100%" style="margin-top:10px" alt="���м�" />
                        </div>
                        <div id="oBtnList" style="float:right; margin-top:10px;" >
<%
                            if ("N".equals(dbox.getString("d_favor_yn"))){

%>
                            <a href="javascript:fnRegSubjFavor( '02', '<%= dbox.get("d_seq") %>', 'register' );" title="�� ���¸� ���� ���� ��Ͽ� �߰��մϴ�."><img id="oBtnFavor" src="/images/2013/online_edu/btn_class_mine.gif" style="margin-left:10px;" alt="���ϱ�" /></a>
<%
                            }else{
%>
                            <a href="javascript:fnRegSubjFavor( '02', '<%= dbox.get("d_seq") %>', 'cancel' );" title="�� ���¸� ���� ���� ��Ͽ��� �����մϴ�."><img id="oBtnFavor" src="/images/2013/online_edu/btn_class_minex.gif" style="margin-left:10px;" alt="�����" /></a>
<%
                            }
%>
                            <a href="javascript:void(0);" id="oAnchorShareSns" title="�� ���¸� �н����� SNS �������� �����մϴ�."><img src="/images/2013/online_edu/btn_class_share.gif" style="margin-left:10px;" alt="�����ϱ�" /></a>
                        </div>
                    </div>
                </div>

                <!-- �����ϱ� -->
                <div class="share" id="oshareSns" style="position: absolute;top: 952px;left: 735px; width:100px; height:70px; border:solid 1px #d1d1d1; background-color:#ffffff; display:none;">
                    <dl style="margin:10px;">
                        <dt><a href="javascript:fnShareOnSNS('facebook');"><img src="/images/2013/online_edu/logo_facebook.png"  style="margin-right:5px; vertical-align:middle;" alt="���̽���" />���̽���</a></dt>
                    </dl>
                    <dl style="margin:10px;">
                        <dt><a href="javascript:fnShareOnSNS('twitter');"><img src="/images/2013/online_edu/logo_twitter.png" style="margin-right:5px; vertical-align:middle;" alt="Ʈ����" />Ʈ����</a></dt>
                    </dl>
                </div>

                <p class="tit1"><img src="/images/2013/online_edu/online_tit_8.gif" alt="�� ���¿� ���Ͽ�" /></p>
                <ul class="list1">
                    <li><%=dbox.getString("d_intro")%></li>
                    <li></li>
                </ul>

                <p class="tit1"><img src="/images/2013/online_edu/online_tit_9.gif" alt="����Ұ�" /></p>
                <ul class="list1">
                    <li><%= dbox.getString("d_tutornm") %></li>
                    <li><%= dbox.getString("d_tutorcareer").replaceAll("\n", "<br/>") %></li>
                    <li><%= dbox.getString("d_tutorauthor").replaceAll("\r\n", "<br/>") %></li>
                </ul>

                <!--
                <p class="tit2"><img src="/images/2013/online_edu/online_tit_6.gif" alt="�ı�" /></p>
                <div class="tableWrap2 space5">
                    <table class="board" summary="">
                        <caption>�ı� ���</caption>
                        <colgroup>
                            <col width="6%"/>
                            <col width="*"/>
                            <col width="15%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col">��ȣ</th>
                            <th scope="col">����</th>
                            <th scope="col">��</th>
                            <th scope="col">�ۼ���</th>
                            <th scope="col">�ۼ���</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="first">5</td>
                            <td class="bldnone left"><a href="notice_view.html">������, ����� �߽� Ȩ������ ������</a></td>
                            <td class="bldnone">�ڡڡڡڡ�</td>
                            <td>�Ѿƹ�</td>
                            <td>2014.08.18</td>
                        </tr>
                        <tr>
                            <td class="first">4</td>
                            <td class="bldnone left"><a href="notice_view.html">������, ����� �߽� Ȩ������ ������</a></td>
                            <td class="bldnone">�ڡڡڡڡ�</td>
                            <td>�Ѿƹ�</td>
                            <td>2014.08.18</td>
                        </tr>

                        <tr>
                            <td colspan="5" style="padding:15px 15px 15px 62px; border-color:#e0e0e0; border-left:0px;" >
                                <div style="text-align:left">
                                    �����̶� �����ϱ� ������µ�, �����ִ� �о� ���ǵ��� �ѱ���������ī���̿� �־� ���п� ������ ����ϰ� �н��� �� �־ �ʹ� ���ƿ�. ���� ���뵵 ������ �ְ���!!
                                    �����̶� �����ϱ� ������µ�, �����ִ� �о� ���ǵ��� �ѱ���������ī���̿� �־� ���п� ������ ����ϰ� �н��� �� �־ �ʹ� ���ƿ�. ���� ���뵵 ������ �ְ���!!
                                </div>
                                <div style="float:right; margin-top:15px;">
                                    <a href="#"><img src="/images/2013/online_edu/btn_write_modify.gif" alt="����" /></a>
                                    <a href="#"><img src="/images/2013/online_edu/btn_write_close.gif" alt="�ݱ�" /></a>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="first">3</td>
                            <td class="bldnone left"><a href="notice_view.html">������, ����� �߽� Ȩ������ ������</a></td>
                            <td class="bldnone">�ڡڡڡڡ�</td>
                            <td>�Ѿƹ�</td>
                            <td>2014.08.18</td>
                        </tr>
                        <tr>
                            <td class="first">2</td>
                            <td class="bldnone left"><a href="notice_view.html">������, ����� �߽� Ȩ������ ������</a></td>
                            <td class="bldnone">�ڡڡڡڡ�</td>
                            <td>�Ѿƹ�</td>
                            <td>2014.08.18</td>
                        </tr>
                        <tr>
                            <td class="first">1</td>
                            <td class="bldnone left"><a href="notice_view.html">������, ����� �߽� Ȩ������ ������</a></td>
                            <td class="bldnone">�ڡڡڡڡ�</td>
                            <td>�Ѿƹ�</td>
                            <td>2014.08.18</td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="paging">
                    <a href="#_"><img src="/images/2013/common/btn_pre.jpg" alt="����������" /></a>
                    <span>
                        <strong>1</strong>
                        <a href="#_">2</a>
                        <a href="#_">3</a>
                        <a href="#_">4</a>
                        <a href="#_">5</a>
                        <a href="#_">6</a>
                        <a href="#_">7</a>
                        <a href="#_">8</a>
                        <a href="#_">9</a>
                        <a href="#_">10</a>
                    </span>
                    <a href="#_"><img src="/images/2013/common/btn_next.jpg" alt="����������" /></a>

                    <a href="#"><img src="/images/2013/online_edu/btn_write.gif" style="float:right; margin-top:-10px;" alt="�ı��ۼ�" /></a>
                </div>
                //-->
                <!-- //tableWrap2 -->

        <!-- �����ı� ���� //-->
		<div class="body">

			<p class="tit1" style="margin-bottom:20px;"><img src="/images/2013/online_edu/online_tit_6.gif" alt="�����ı�" /></p>
            <div class="tableWrap10 space2">
                <table id="oReviewTable" class="dataTable10" summary="�� ǥ�� �ı� ǥ�� ��ȣ,����,��,�ۼ���,�ۼ��Ϸ� ���� �Ǿ� �ֽ��ϴ�.">
                    <caption>�ı� ǥ</caption>
                    <colgroup>
                        <col style="width:110px;"/>
                        <col style="width:427px;"/>
                        <col style="width:110px;"/>
                        <col style="width:110px;"/>
                        <col style="width:110px;"/>
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">��ȣ</th>
                            <th scope="col">����</th>
                            <th scope="col">��</th>
                            <th scope="col">�ۼ���</th>
                            <th scope="col">�ۼ���</th>
                        </tr>
                    </thead>
                    <tbody>

<%
        if ( reviewList.size() == 0 || reviewList == null ) {
%>
                        <tr name="reviewTitle">
                            <td style="text-align:center; border-left:1px;" colspan="5">��ϵ� �ıⰡ �����ϴ�.</td>
                        </tr>
<%
        } else {
            DataBox rdbox = null;
            String regUserId = "";
            int point = 0;
            String starRate = "";
            for ( int i = 0 ; i < reviewList.size(); i++ ) {
                rdbox = (DataBox)reviewList.get(i);
                regUserId = rdbox.getString("d_regid");

                point = rdbox.getInt("d_checkpoin");
                starRate = "";
                for ( int k = 1; k <= point; k++ ) {
                    starRate += "��";
                }
                for ( int j = 1; j <= 5 - point; j++ ) {
                    starRate += "��";
                }
%>
                    <tr id="oReviewTitle<%= i %>" name="reviewTitle">
                        <th scope="row"><%= rdbox.getString("d_dispNum") %></th>
                        <td>
                            <div style="width:420px; height:16px; overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">
                                <a href="javascript:fnViewReivewContents(<%= i %>);" ><%= rdbox.getString("d_cont") %></a>
                            </div>
                        </td>
                        <td><%= starRate %></td>
                        <td style="text-align:center;"><%= rdbox.getString("d_name") %></td>
                        <td><%= rdbox.getString("d_regdt") %></td>
                    </tr>
                    <tr id="oReviewContents<%= i %>" name="reviewContents" style="display:none;">
                        <td colspan="5" style="border-left:0; padding-left:131px;">
                            <%= rdbox.getString("d_cont").replaceAll("\\n", "<br/>") %>
                            <input type="hidden" id="oContentsText<%= i %>" name="contentsText<%= i %>" value="<%= rdbox.getString("d_cont") %>" />

<%
                if ( loginUserId != null && !loginUserId.equals("") && loginUserId.equals(regUserId) ) {
                    isMyReviewReg = true;
%>
                            <div style="padding:10px 0 0 0; text-align:right;">
                                <a href="javascript:fnViewModifyPopup(<%= rdbox.getInt("d_num") %>, <%= point %>, <%= i %>);" ><img src="/images/2013/online_edu/btn_write_modify.gif" alt="����" /></a>
                                <a href="javascript:fnDeleteReview(<%= rdbox.getInt("d_num") %>, <%= i %>);"><img src="/images/2013/online_edu/btn_delete.gif" alt="����" /></a>
                            </div>
<%
                }
%>
                        </td>
                    </tr>
<%
                totalRowCount = rdbox.getInt("d_tot_cnt");
                totalPage = rdbox.getInt("d_totalPage");
            }
        }
%>
                    </tbody>
                </table>
            </div>

            <div id="oReviewButton" style="text-align:right; margin-top:15px; <%= (!isMyReviewReg && !loginUserId.equals("") ) ? "display:block;" : "display:none;"%>">
                <a href="#" data-toggle="modal" data-target="#sample"><img src="/images/2013/online_edu/btn_write.gif" alt="�ı��ۼ�" /></a>
            </div>

            <div class="paging" id="oPagingArea">
<%
        if ( reviewList != null && reviewList.size() > 0 ) {
%>
                <%= PageUtil.re2013_printPageListDiv(totalPage, pageNo, 5, pageSize, totalRowCount) %>
<%
        }

%>
                    <!-- <a href="#" data-toggle="modal" data-target="#sample"><img src="/images/2013/online_edu/btn_write.gif" alt="�ı��ۼ�" /></a> //-->
<%
        // }
%>
            </div>
		</div>
		<!-- �����ı� �� //-->

                <!-- movList2 ��������-->
                <p class="tit2"><img src="/images/2013/online_edu/online_tit_7.gif" style="margin-top:50px;" alt="��������" /></p>
                <div class="movList2">
<%
                            /*
                             * ��������.. ������������Ʈ
                             */
                            DataBox dnbox = null;
                            if(nextSubjList != null && nextSubjList.size() >0){
                                for (int i=0 ; i < nextSubjList.size() ; i++) {
                                    dnbox = (DataBox)nextSubjList.get(i);
                                    int bWidth=600;
                                    String mobileuseYn= dnbox.getString("d_mobile_use_yn");
                                    String imgurl = dnbox.getString("d_vodimg");
                                    imgurl = imgurl.replaceAll("\\\\", "/");

                                    if ( dnbox.getString("d_new_yn").equals("Y") ) { bWidth -= 35;}
                                    if ( dnbox.getString("d_recom_yn").equals("Y") ) { bWidth -= 35;}
                                    if ( dnbox.getString("d_hit_yn").equals("Y") ) { bWidth -= 35;}
%>

                    <dl style="height:80px">
                        <dt>
                            <a href="javascript:fnViewContent('<%= dnbox.getString("d_seq") %>');"><img src="<%=imgurl%>" width="126" height="80" alt="<%=  dnbox.getString("d_lecnm") %>" /></a>
<!--                            <span class="btn_threeWrap">-->
<!--                                <span class="btn_three1"><a href="#"> ���� ������ : 90</a></span>-->
<!--                            </span>-->
                        </dt>
                        <dd class="title">
                            <div class="lecname">
                            <a href="javascript:fnViewContent('<%= dnbox.getString("d_seq") %>');" style="padding-bottom:8px;width:<%=bWidth%>px;"><%=  dnbox.getString("d_lecnm") %></a>
                            </div>
                            <span class="img_mobile" style="float:right; margin-top:-6px;">
<%
                if( dnbox.getString("d_hit_yn").equals("Y") ) {
%>
                                <img src="/images/2013/online_edu/detail_popular.png" style="float:right; margin-right:5px;" alt="�α�" />
<%
                }
                if( dnbox.getString("d_recom_yn").equals("Y") ) {
%>
                                <img src="/images/2013/online_edu/detail_recommend.png" style="float:right; margin-right:5px;" alt="��õ" />
<%
                }
                if( dnbox.getString("d_new_yn").equals("Y") ) {
%>
                                <img src="/images/2013/online_edu/detail_new.png" style="float:right; margin-right:5px;" alt="�ű�" />
<%
                }
%>
                            </span>

                        </dd>
                        <dd style="margin-top:10px;"><%=dbox.getString("d_tutornm")%></dd>
                        <dd class="txt" style="white-space:auto; overflow:hidden; text-overflow:ellipsis;"><%=dnbox.getString("d_intro")%></dd>

                    </dl>
<%
                                }
                            }else{
%>
                    <dl><dd>���� ������ �����ϴ�.</dd></dl>
<%
                            }
%>
                </div>
                <!--// movList2 -->
            </div>

        </div>
        <!-- //#subCont -->
    </div>
    <!-- ������ ���� �� -->
</form>

</div>
<!--  //container-new �� //-->

<div class="divPopupMask"></div>
<!-- �ı� ��� ��� �˾� ���� //-->
<form id="oReviewRegForm" name="reviewRegForm">
    <input type="hidden" name="process" value="" />
    <input type="hidden" name="seq" value="<%= box.get("p_seq") %>" />
    <input type="hidden" name="num" value="" />
<div id="sample" class="modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<button type="button" data-dismiss="modal" class="modal-close">X</button>
			<div class="header">
				<h4>�ı�</h4>
			</div>
			<div class="modal-review-star">
				<strong>�����ֱ� :</strong>
				<label><input type="radio" id="oPoint5" name="checkpoin" value="5" /> <img src="/images/common/icon-star5.png" alt="������ 5��"></label>
				<label><input type="radio" id="oPoint4" name="checkpoin" value="4" /> <img src="/images/common/icon-star4.png" alt="������ 4��"></label>
				<label><input type="radio" id="oPoint3" name="checkpoin" value="3" /> <img src="/images/common/icon-star3.png" alt="������ 3��"></label>
				<label><input type="radio" id="oPoint2" name="checkpoin" value="2" /> <img src="/images/common/icon-star2.png" alt="������ 2��"></label>
				<label><input type="radio" id="oPoint1" name="checkpoin" value="1" /> <img src="/images/common/icon-star1.png" alt="������ 1��"></label>
			</div>
			<textarea class="modal-review-textarea" placeholder="�ִ� 500byte���� �ۼ������ϸ�, �弳�̳� ������ ������ �� �ֽ��ϴ�." maxlength="500" id="oContents" name="cont"></textarea>
			<div class="footer">
				<button type="button" class="modal-btn modal-btn-default" onclick="fnRegisterReview();">Ȯ��</button>
				<button type="button" class="modal-btn modal-btn-default" data-dismiss="modal">���</button>
			</div>
		</div>
	</div>
</div>
</form>
<!-- �ı� ��� ��� �˾� �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>