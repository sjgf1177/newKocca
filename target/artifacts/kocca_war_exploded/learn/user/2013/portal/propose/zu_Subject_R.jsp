<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page errorPage="/learn/library/error.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.credu.propose.*" %>
<%@ page import="com.credu.common.*" %>
<%@ page import="com.credu.library.*" %>
<%@ page import="com.credu.system.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />
<jsp:useBean id="getCodenm" class="com.credu.common.GetCodenm" scope="page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    DataBox subjectPreview = (DataBox) request.getAttribute("subjectPreview");
    List<DataBox> subjseqList = (List<DataBox>)request.getAttribute("subjseqList");
    List<DataBox> lessonList = (List<DataBox>)request.getAttribute("lessonList");
    ArrayList nextSubjList = (ArrayList)request.getAttribute("nextSubjList"); // ���� ����
    ArrayList<DataBox> reviewList = (ArrayList<DataBox>)request.getAttribute("reviewList");

    String sugang_YN = subjectPreview.getString("d_sugang_YN");
    String propose_yn = subjectPreview.getString("d_propose_yn");
    String biyong = subjectPreview.getString("d_biyong");
    String grcode = box.getSession("tem_grcode");
    String pRprocess = box.get("p_rprocess");

    String v_area = box.get("p_area");
    String p_specials = box.get("p_specials");
    String p_action = box.get("p_action");
    String v_upperclass = box.get("p_upperclass");

    String loginUserId = box.getSession("userid");

    if (box == null) box = RequestManager.getBox(request);
    int pageNo = ( box.getInt("p_pageno") == 0 ) ? 1 : box.getInt("p_pageno");
    int row = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int pageSize = ( box.getInt("p_pagesize") == 0 ) ? 5 : box.getInt("p_pagesize");
    int totalRowCount = 0;
    int totalPage = 0;

    boolean isSeq = (subjseqList != null && subjseqList.size() != 0);
    boolean isMyReviewReg = false;

    pRprocess = (pRprocess == null || pRprocess.equals("")) ? "SubjectList" : pRprocess;

    box.put("title_str",  subjectPreview.getString("d_subjnm") + ", �����ȳ�, �¶��� ����" );

    box.put("og_title", subjectPreview.getString("d_subjnm"));
    box.put("og_url", "http://edu.kocca.or.kr/servlet/controller.propose.ProposeCourseServlet?p_process=" + box.get("p_process") + "&p_rprocess=" + pRprocess + "&p_subj=" + box.get("p_subj") + "&p_year=" + box.get("p_year") + "&p_subjseq=" + box.get("p_subjseq") );
    box.put("og_description", subjectPreview.getString("d_intro"));
    box.put("og_image", "http://edu.kocca.or.kr" + subjectPreview.getString("d_introducefilenamenew").replaceAll("\\\\","/") );

    String imgurl = subjectPreview.getString("d_introducefilenamenew");
    imgurl = imgurl.replaceAll("\\\\", "/");

    if (imgurl.equals("")) {
        imgurl = "/images/2012/common/not_image.gif";
    }

    
    //�н�â ȣ�� ����
             
    String eduUrl = "";
    int ieduurl = 0;
    String v_edulist_value= "";
    String isoutsourcing = "";
    String edulist_value= "";
    String subj = subjectPreview.getString("d_subj");
    String year = subjectPreview.getString("d_year");
    
    String subjSeq = subjectPreview.getString("d_subjseq");
    String cpsubj = subjectPreview.getString("d_cpsubj");
    String cpsubjseq = subjectPreview.getString("d_cpsubjseq");
    String company = subjectPreview.getString("d_company");
    String contenttype = subjectPreview.getString("d_contenttype");
 	
    // �н�url=������ ���..
    if(eduUrl.equals("")) { ieduurl = 0; }else{ ieduurl = 1; }

    // �н���Ȳ
    edulist_value = "/servlet/controller.contents.EduStart?p_process=eduList&p_subj="+ subj +"&p_year="+ year +"&p_subjseq="+ subjSeq+"&p_userid=" + loginUserId;

    if (isoutsourcing.equals("Y")) {                 //��Ź�����϶�

    	eduUrl = "/servlet/controller.contents.EduStart";
    	eduUrl += "?FIELD1=" + loginUserId + "&FIELD2=" + year + "&FIELD3=" + cpsubj + "&FIELD4=" + cpsubjseq + "&FIELD99=" + company+"&FIELD100=N"+ "&contenttype=" + contenttype+ "&p_subj=" + subj +"&p_year="+ year +"&p_subjseq="+subjSeq;
    } else {//�ܺΰ����� �ƴѰ��
         //���� ���� ���.. eduUrl = EduEtc1Bean.make_eduURL(v_subj,v_year,v_subjseq);
        if (eduUrl.equals("")){
        	eduUrl = "/servlet/controller.contents.EduStart?p_subj="+subj;
        }

        if (!year.equals(""))
        	eduUrl = eduUrl+"&p_year="+year+"&p_subjseq=";
        else
        	eduUrl = eduUrl+"&p_year=2000&p_subjseq=";

        if(!subjSeq.equals(""))
        	eduUrl = eduUrl+subjSeq;
        else eduUrl = eduUrl+"0001";
        eduUrl +=  "&contenttype=" + contenttype;
    }
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>

<style>
    .course-detail-tabs {border:4px solid #d1d1d1; border-top-width:3px;}
    .course-detail-tabs .header {height:31px; background:#d1d1d1;}
    .course-detail-tabs .header li {position:relative; float:left; line-height:18px; font-family:'�������','nanumgothic','���� ���','malgun gothic',sans-serif;}
    .course-detail-tabs .header li a {display:block; height:27px; padding:4px 40px 0 40px; color:#3d3d3d; font-size:14px; font-weight:600;}
    .course-detail-tabs .header li i {display:none; position:absolute; left:50%; bottom:-10px; width:13px; height:8px; margin-left:-7px; background:url(/images/common/icon-tabs-ar.png) no-repeat;}
    .course-detail-tabs .header li.active a {color:#ce0000; font-weight:bold; background:#fff;}
    .course-detail-tabs .header li.active i {display:block;}
    .course-detail-tabs .body {display:none; padding:59px;}
</style>
<script>
    $(function(){

        $("#oAnchorShareSns").on( {
            "click": function(e) {
                e.preventDefault();
                e.stopPropagation();
                var windowW = $(window).width();

                if ($("#oshareSns").is(":hidden")) {
                    $("#oshareSns").css("top", $("#oBtnList").position().top + 44);
                    $("#oshareSns").css("left", windowW / 2 + 357);
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

            $("#oshareSns").css("left", windowW / 2 + 357);
        });

        $(".course-detail-tabs").each(function(){
            var index = $(this).find(".header .active").index();
            var tabContent = $(this).find(".body");
            tabContent.eq(index).show();
        });
        $(".course-detail-tabs .header a").click(function(){
            var index = $(this).parent().index();
            var tabContent = $(this).parent().parent().parent().parent().find(".body");
            $(this).parent().parent().find("li").removeClass("active");
            $(this).parent().addClass("active");
            tabContent.hide();
            tabContent.eq(index).show();
            return false;
        });
    });

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
                                $("#oBtnList > a").eq(2).attr("href", "javascript:fnRegSubjFavor( '01', '" + subj + "', 'cancel' );").attr("title", "�� ������ ���� ���� ��Ͽ��� �����մϴ�.");// javascript �Լ� ����
                                $("#oBtnFavor").attr("src", "/images/2013/online_edu/btn_class_minex.gif");    // ��ư �̹��� ����
                                successMsg = "���� ���¿� �߰��Ǿ����ϴ�.";
                                $("input[name=p_favoryn]").val("Y");

                            } else {
                                $("#oBtnList > a").eq(2).attr("href", "javascript:fnRegSubjFavor( '01', '" + subj + "', 'register' );").attr("title", "�� ������ ���� ���� ��Ͽ� �߰��մϴ�.");// javascript �Լ� ����
                                $("#oBtnFavor").attr("src", "/images/2013/online_edu/btn_class_mine.gif");    // ��ư �̹��� ����
                                successMsg = "���� ���¿��� �����Ǿ����ϴ�.";
                                $("input[name=p_favoryn]").val("N");
                            }

                            alert( successMsg );
                            return;
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

    /**
     * ������û �˾�â�� ����.
     */
    function fnProposeSubj(subj, year, subjseq, subjnm) {
        if(<%= box.getSession("userid").length()==0 %>) {
            var frmURL = location.href;
            frmURL = frmURL.replace("http://", "");
            var idx = frmURL.indexOf("/");

            frmURL = frmURL.substr(idx, frmURL.length);

            alert("�α��� ��  �̿����ּ���.");
            location.href = "/learn/user/2013/portal/homepage/zu_MainLogin.jsp?p_frmURL=" + encodeURIComponent( frmURL );

            return;
        }

        var confirmMsg = subjnm + " ������ �н� �Ͻðڽ��ϱ�?"

        if ( subj == "CK15002" ) {
            confirmMsg = "�� �� ������ [�ѱ��缺���������] �������� �����޾� ��Ǵ� �������� �������� �߱޵��� �ʽ��ϴ�.\n\n �����ð����� �����Ǵ� ������ ���ϴ� ��쿡�� [�ѱ��缺���������(egenedu.kigepe.or.kr/)]���� ��û�Ͻñ� �ٶ��ϴ�.\n\n" + confirmMsg;
        }

        if( !confirm(confirmMsg) ) {
            return;
        }

        // ���� ��û ���� �� �н�â���� �̵�
        
        var new_Open = window.open("", "proposeWindow", "scrollbars=yes,width=10,height=10,resizable=no");
        document.form1.p_process.value = "SubjectEduPropose";
        document.form1.target = "proposeWindow";
        document.form1.p_subj.value = subj;
        document.form1.p_year.value = year;
        document.form1.p_subjseq.value = subjseq;
        document.form1.action = "/servlet/controller.propose.ProposeCourseServlet";
        document.form1.submit();
        document.form1.target = "_self";
    }

    /**
     * ������ ���¸� ����
     */
    function whenPreShow(url, subj, d_wj_classkey) {
        if (d_wj_classkey != '') {  //�濵��������(�����н���)
            if (<%=grcode.equals("N000031") %>)  {
                prelog_url = "/servlet/controller.propose.ProposeCourseServlet?p_process=insertPreviewLog&p_subj="+subj;
                open_window("openShow","http://samplezone.campus21.co.kr/classpreview.asp?classkey="+d_wj_classkey,"100","100","720","400","","","",true,true);
            }
            return;
         } else {
            prelog_url = "/servlet/controller.propose.ProposeCourseServlet?p_process=insertPreviewLog&p_subj="+subj;
            open_window("openShow",url,"100","100","<%= subjectPreview.get("d_prewidth", "800") %>","<%= subjectPreview.get("d_preheight", "600") %>","","","",true,true);
         }
    }


    /**
     * SNS �����ϱ�
     */
    function fnShareOnSNS( snsName ) {

        var url = location.href;

        if (url.indexOf("?") == -1 ) {
            url += "?p_process=<%= box.get("p_process") %>?year=<%= box.get("p_year") %>&subj=<%= box.get("p_subj") %>&subjseq=<%= box.get("p_subjseq") %>";
        }

        fnSendSns( snsName, url, "<%= subjectPreview.getString("d_subjnm") %>");

        $("#oshareSns").hide();
    }

    /**
     * ���� ���뺸��
     */
    function fnViewSubjInfo(subj,subjnm,courseyn,upperclass,upperclassnm, year, subjseq){
        var url = "/servlet/controller.propose.ProposeCourseServlet";
        var param = "?p_process=SubjectPreviewPage&p_subj=" + subj + "&p_year=" + year + "&p_subjseq=" + subjseq;

        location.href = url + param;
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
     *
     */

    /**
     * �ı� ��Ͽ��� ������ �̵� ó���� �Ѵ�.
     * ajax�� �̿��Ͽ� ���ο� ����� ��ȸ�ϰ� �ϴ��� ������ ��ɵ� ó���Ѵ�.
     */
    function goPage(pageNum) {
        var param = "p_process=selectReviewListForAjax&p_subj=" + $("#oSubj").val() + "&p_pageno=" + pageNum;

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
            ,   url : "/servlet/controller.propose.ProposeCourseServlet"
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

                            point = Number(this.d_point);
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
                            reviewListStr += "            <a href=\"javascript:fnViewReivewContents(" + idx + ");\" >" + this.d_contents + "</a>    \n";
                            reviewListStr += "        </div>    \n";
                            reviewListStr += "    </td> \n";
                            reviewListStr += "    <td>" + starRate + "</td> \n";
                            reviewListStr += "    <td style=\"text-align:center;\">" + this.d_name + "</td>  \n";
                            reviewListStr += "    <td>" + this.d_reg_dt + "</td>   \n";
                            reviewListStr += "</tr> \n";
                            reviewListStr += "<tr id=\"oReviewContents" + idx + "\" name=\"reviewContents\" style=\"display:none;\">  \n";
                            reviewListStr += "    <td colspan=\"5\" style=\"border-left:0; padding-left:90px;\"> \n";
                            reviewListStr += "        " + this.d_contents.replace(/\n/gi, "<br/>");  + " \n";
                            reviewListStr += "        <input type=\"hidden\" id=\"oContentsText" + idx + "\" name=\"contentsText" + idx + "\" value=\"" + this.d_contents + "\" /> \n";

                            if ( loginUserId != null && loginUserId != "" && loginUserId == this.d_userid ) {
                                reviewListStr += "        <div style=\"padding:10px 0 0 0; text-align:right;\">   \n";
                                reviewListStr += "            <a href=\"javascript:fnViewModifyPopup(" + this.d_num + ", " + this.d_point + ", " + idx + ");\"><img src=\"/images/2013/online_edu/btn_write_modify.gif\" alt=\"����\" /></a> \n";
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

        if ( $("input:radio[name=point]:checked").length == 0 ) {
            alert("������ �������ּ���.");
            $("input:radio[name=point]").eq(0).focus();
            return;

        } else if( $("#oReviewRegForm textarea[name=contents]").val() == "") {
            alert("�ı� ������ �Է��ϼ���.");
            $("#oReviewRegForm textarea[name=contents]").focus();
            return;

        } else if (confirm("�ı⸦ ����Ͻðڽ��ϱ�?")) {

            $("#oReviewRegForm input[name=process]").val("registerReview");
            var param = $("#oReviewRegForm").serialize();

            $.ajaxSetup({cache:false});
            $.ajax({
                    type : "post"
                ,   url : "/servlet/controller.mobile.onlineclass.OnlineClassReviewServlet"
                ,   dataType : "json"
                ,   data : param
                ,   success : function (data) {
                        $('[data-dismiss="modal"]').trigger("click");

                        if ( data.resultCnt > 0 ) {
                            $("#oReviewButton").hide();
                            goPage(1);
                            alert("�ıⰡ ��ϵǾ����ϴ�.");
                            $("#oReviewRegForm textarea[name=contents]").val("");
                            $("#oReviewRegForm input:radio[name=point]").removeAttr("checked");
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
    function fnViewModifyPopup(num, point, idx) {
        $("input:radio[name=point][value=\"" + point +"\"]").attr("checked", true);
        $("#oReviewRegForm textarea[name=contents]").val( $("#oContentsText" + idx).val() );
        $(".modal-content .modal-btn").eq(0).attr("onclick", "fnModifyReview(" + num + ");");
        $("[data-toggle=\"modal\"]").trigger("click");
    }

    /**
     * �ı� ������ �����Ѵ�.
     */
    function fnModifyReview( num ) {

        if ( $("input:radio[name=point]:checked").length == 0 ) {
            alert("������ �������ּ���.");
            $("input:radio[name=point]").eq(0).focus();
            return;

        } else if( $("#oReviewRegForm textarea[name=contents]").val() == "") {
            alert("�ı� ������ �Է��ϼ���.");
            $("#oReviewRegForm textarea[name=contents]").focus();
            return;

        } else if (confirm("�ı⸦ �����Ͻðڽ��ϱ�?")) {

            $("#oReviewRegForm input[name=process]").val("modifyReview");
            $("#oReviewRegForm input[name=num]").val(num);
            var param = $("#oReviewRegForm").serialize();

            $.ajaxSetup({cache:false});
            $.ajax({
                    type : "post"
                ,   url : "/servlet/controller.mobile.onlineclass.OnlineClassReviewServlet"
                ,   dataType : "json"
                ,   data : param
                ,   success : function (data) {
                        $('[data-dismiss="modal"]').trigger("click");

                        if ( data.resultCnt > 0 ) {
                            // $("#oReviewButton").hide();
                            goPage(1);
                            alert("�ıⰡ �����Ǿ����ϴ�.");
                            $("#oReviewRegForm textarea[name=contents]").val("");
                            $("#oReviewRegForm input:radio[name=point]").removeAttr("checked");
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
                ,   url : "/servlet/controller.mobile.onlineclass.OnlineClassReviewServlet"
                ,   dataType : "json"
                ,   data : param
                ,   success : function (data) {
                        $('[data-dismiss="modal"]').trigger("click");
                        if ( data.resultCnt > 0 ) {
                            $("#oReviewTitle" + idx).remove();
                            $("#oReviewContents" + idx).remove();
                            goPage(1);
                            alert("�ıⰡ �����Ǿ����ϴ�.");
                            $("#oReviewRegForm textarea[name=contents]").val("");
                            $("#oReviewRegForm input:radio[name=point]").removeAttr("checked");
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

 	// �н�â OPEN
    function studyOpen(url, iurl) {
        
        var f = document.form1;

        f.lessonReurl.value = url;
        f.lessonReiurl.value = iurl;
        var s_url = url+"&p_iurl="+iurl;
        
        if (url == '') {
            alert("������ �����ϴ�");
        } else {
            if (iurl == 0){
                open_window('openApp',s_url,0,0,0,0,false,false,false,true,true);
            }else{
                open_window('openApp',s_url,0,0,1024,768,false,false,false,'yes','yes');
            }
        }
	}
    
</script>
<!-- container-new -->
<div id="container-new">
    <div id="mainMenu">
        <ul class="location">
            <li>Ȩ</li>
            <li>�¶��� ����</li>
            <li>
                �оߺ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList" class="active">�оߺ�</a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectListJikup" >������</a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=EduSystem" >����ü�赵</a></li>
<%
        if ( currDate < 20160401 ) {
%>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=LiteratureSubjectList" >�޳��ι���</a></li>
                    <!-- �޳� �ι����� 2015�⵵ ��Ź ��ü ���� ���ο� ���� ���񽺰� �� ����, ���� ���� ���� ����. �̿� ���� 2015�� 3�� 1�Ϻ��� �޴��� ������ ���� ������ //-->
<%
        }
%>

    <!--
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">���� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=EduSystem" class="active">�����ȳ�</a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage">Ŀ�´�Ƽ</a></li>
    -->
                </ul>
            </li>
        </ul>
    </div>
    <!-- online_box -->
    <div class="online_box">
        <div class="smart_device">
            <div class="sdleft"  style="width:400px;">
                <div>
                    <p><img src="<%=imgurl%>" class="courseimage" alt="<%= subjectPreview.getString("d_subjnm") %>" style="width:400px; height:229px;" ></p>
                </div>
            </div>
            <div>
<%
                String mobileUseYn = subjectPreview.getString("d_mobile_use_yn");
                String isnewYn = subjectPreview.getString("d_isnew");
                String ishitYn = subjectPreview.getString("d_ishit");
                String isrecomYn= subjectPreview.getString("d_isrecom");

                if(mobileUseYn.equals("Y")) {
%>
                <img src="/images/2013/online_edu/detail_mbile.png" style="float:right; margin-right:5px;" alt="�����" />
<%
                }
                if(ishitYn.equals("Y")) {
%>
                <img src="/images/2013/online_edu/detail_popular.png" style="float:right; margin-right:5px;" alt="�α�" />
<%
                }
                if(isrecomYn.equals("Y")) {
%>
                <img src="/images/2013/online_edu/detail_recommend.png" style="float:right; margin-right:5px;" alt="��õ" />
<%
                }
                if(isnewYn.equals("Y")) {
%>
                <img src="/images/2013/online_edu/detail_new.png" style="float:right; margin-right:5px;" alt="�ű�" />
<%
                        }
%>
            </div>

            <!--�� ��ɹ�ư ����-->
            <div class="title" style="height:125px; width:450px; padding-left:16px; margin-top:-30px;">

                <%= subjectPreview.getString("d_subjnm") %>
                <ul class="sublist">
                    <li><%= subjectPreview.getHtmlString("d_edumans") %></li>
                </ul>
            </div>

            <div>
                <div>
                    <img src="/images/2013/online_edu/dot.gif" style="margin:16px 0px 0px 20px; width:508px; height:1px;" alt="" />
                </div>
                <div id="oBtnList" style="float:right; margin:10px;">
                    <!--<a class="first" href="javascript:whenPreShow('<%= subjectPreview.get("d_preurl") %>','<%= box.get("p_subj") %>', '<%= box.get("p_wj_classkey") %>' );" title="�� ������ 1���ø� ü���� �� �ֽ��ϴ�."><img src="/images/2013/online_edu/btn_class_tasty.gif" alt="������" /></a>-->
<%
                    if (isSeq && "Y".equals(sugang_YN) && "N".equals(propose_yn)) {
%>
                    <a href="javascript:fnProposeSubj('<%= box.get("p_subj") %>', '<%= box.get("p_year") %>', '<%= box.get("p_subjseq") %>', '<%= subjectPreview.getString("d_subjnm") %>');" title="�� ������ ���� ������û�� �� �� �ֽ��ϴ�."><img src="/images/2013/online_edu/btn_class_study.gif" style="margin-left:10px;" alt="������û�ϱ�" /></a>
<%
                    } else {
%>
					<a href="javascript:studyOpen( '<%= eduUrl %>', '<%= ieduurl %>');" title="�� ������ ���� �н��� ���� �մϴ�."><img src="/images/2013/online_edu/btn_class_study.gif" style="margin-left:10px;" alt="�н��ϱ�" /></a>
<%                    	
                    }
%>

<%
                    if ("N".equals(propose_yn)){
                        if ("N".equals(subjectPreview.getString("d_favor_yn"))){

%>
                    <!--<a href="javascript:fnRegSubjFavor( '01', '<%= box.get("p_subj") %>', 'register' );" title="�� ������ ���� ���� ��Ͽ� �߰��մϴ�."><img id="oBtnFavor" src="/images/2013/online_edu/btn_class_mine.gif" style="margin-left:10px;" alt="���ϱ�" /></a>-->
<%
                        }else{
%>
                    <!-- <a href="javascript:fnRegSubjFavor( '01', '<%= box.get("p_subj") %>', 'cancel' );" title="�� ������ ���� ���� ��Ͽ��� �����մϴ�."><img id="oBtnFavor" src="/images/2013/online_edu/btn_class_minex.gif" style="margin-left:10px;" alt="�����" /></a>-->
<%
                        }
                    }
%>
                    <!-- <a onclick="javascript:fnShareSns();"><img src="/images/2013/online_edu/btn_class_share.gif" style="margin-left:10px;" alt="�����ϱ�" /></a> //-->
                    <a href="javascript:void(0);" id="oAnchorShareSns" title="�� ������ �н����� SNS �������� �����մϴ�."><img src="/images/2013/online_edu/btn_class_share.gif" style="margin-left:10px;" alt="�����ϱ�" /></a>
                </div>

                <!-- �����ϱ� -->
                <div class="share" id="oshareSns" style="position: absolute;top: 666px; left: 1278px; width:100px; height:70px; border:solid 1px #d1d1d1; background-color:#ffffff; display:none;">
                    <dl style="margin:10px;">
                        <dt><a onclick="javascript:fnShareOnSNS('facebook');"><img src="/images/2013/online_edu/logo_facebook.png"  style="margin-right:5px; vertical-align:middle;" alt="���̽���" />���̽���</a></dt>
                    </dl>
                    <dl style="margin:10px;">
                        <dt><a onclick="javascript:fnShareOnSNS('twitter');"><img src="/images/2013/online_edu/logo_twitter.png" style="margin-right:5px; vertical-align:middle;" alt="Ʈ����" />Ʈ����</a></dt>
                    </dl>
                </div>

            </div>
            <!--�� ��ɹ�ư ��-->
        </div>
    </div>

	<!-- ���� ����Ʈ ���� �״�� �� //-->

	<!-- course-detail-tabs -->
	<div class="course-detail-tabs">
		<!-- header -->
		<div class="header">
			<ul>
				<li class="active"><a href="#">��������<i></i></a></li>
				
				<li><a href="#">�����ı�<i></i></a></li>
			</ul>
		</div>
		<!-- header //-->
		<!-- �������� ���� //-->
		<div class="body">

			<p class="tit1"><img src="http://edu.kocca.or.kr/images/2013/online_edu/online_tit_5.gif" alt="�����ȳ�" /></p><br/>
            <ul>
                <li>- ������    : ����</li>
                <li>- �������� : �¶��� ���� � �����: 02-2161-0077 academy@kocca.kr</li>
                <li>- �������� : ������ 60% �̻�</li>
            </ul>
            <br/>
            <p class="tit1"><img src="http://edu.kocca.or.kr/images/2013/online_edu/online_tit_1.gif" alt="������ǥ" /></p><br/>
            <ul>
                <li><%= subjectPreview.getHtmlString("d_intro") %></li>
            </ul>
            <br/>
            <p class="tit1"><img src="http://edu.kocca.or.kr/images/2013/online_edu/online_tit_2.gif" alt="��������" /></p><br/>
            <ul>
                <li><%= subjectPreview.getHtmlString("d_explain") %></li>
            </ul>
            <br/>
            <p class="tit1"><img src="http://edu.kocca.or.kr/images/2013/online_edu/online_tit_3.gif" alt="��������" /></p><br/>
            <ul>
                <li><%= subjectPreview.getHtmlString("d_memo").equals("")? "����":subjectPreview.getHtmlString("d_memo") %></li>
            </ul>
            <br/>
            <p class="tit2"><img src="http://edu.kocca.or.kr/images/2013/online_edu/online_tit_4.gif" alt="��������" /></p>
            <div class="tableWrap10 space2">
                <table class="dataTable10" summary="�� ǥ�� �������� ǥ�� ����,�������� �������� ���� �Ǿ� �ֽ��ϴ�.">
                    <caption>�������� ǥ</caption>
                    <colgroup>
                        <col width="12%"/>
                        <col width="*"/>
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">����</th>
                            <th scope="col">��������</th>
                        </tr>
                    </thead>
                    <tbody>
<%
                            for (DataBox lessonListDataBox : lessonList) {
%>
                    <tr>
                        <th scope="row"><%= lessonListDataBox.get("d_lesson")  %></th>
                        <td><%= lessonListDataBox.get("d_sdesc")  %></td>
                    </tr>
<%
                            }
%>
                    </tbody>
                </table>
            </div>

            <!-- �������� ���� //-->
            <p class="tit2"><img src="/images/2013/online_edu/online_tit_7.gif" style="margin-top:20px;" alt="��������" /></p>
<%
         // �������� ����Ʈ
         DataBox dnbox = null;
         if(nextSubjList != null && nextSubjList.size() >0) {
%>
            <div class="movList2">
<%
            for (int i=0 ; i < nextSubjList.size() ; i++) {
                dnbox = (DataBox)nextSubjList.get(i);
                String mobileuseYn= dnbox.getString("d_mobile_use_yn");
                imgurl = dnbox.getString("d_introducefilenamenew");
                imgurl = imgurl.replaceAll("\\\\", "/");
%>
                <dl style="height:80px">
                    <dt>
                        <img src="<%= imgurl %>" width="126" height="80" alt="<%= dnbox.getString("d_subjnm") %>" />
                    </dt>
                    <dd class="title"><a href="javascript:fnViewSubjInfo('<%=dnbox.get("d_subj") %>', '<%=dnbox.get("d_subjnm") %>', '<%=dnbox.get("d_isonoff") %>', '<%=dnbox.get("d_scupperclass") %>', '<%=dnbox.get("d_uclassnm") %>', '<%=dnbox.get("d_year") %>', '<%=dnbox.get("d_subjseq") %>')"><%= dnbox.getString("d_subjnm") %></a>

                        <span class="img_mobile" style="float:right; margin-top:-6px;">
<%
                if(mobileuseYn.equals("Y")){
%>
                            <img src="/images/2013/online_edu/detail_mbile.png" style="float:right; margin-right:5px;" alt="�����"/>
<%
                }
%>
                        </span>

                    </dd>

                    <dd class="txt"><%=dnbox.getString("d_intro") %></dd>
                        <div class="mvLayer" id="CK10071"></div>
                    </dd>
                </dl>
<%
            }
%>
            </div>
<%
        } else {
%>
            <div class="movList2" style="min-height:36px;padding: 20px 0 0 32px;">
                <span style="font-size: 14px; font-weight: bold;">���� ������ �����ϴ�.</span>
            </div>
<%
        }
%>
		</div>
		<!-- �������� �� //-->


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
            DataBox dbox = null;
            String regUserId = "";
            int point = 0;
            String starRate = "";
            for ( int i = 0 ; i < reviewList.size(); i++ ) {
                dbox = (DataBox)reviewList.get(i);
                regUserId = dbox.getString("d_userid");

                point = dbox.getInt("d_point");
                starRate = "";
                for ( int k = 1; k <= point; k++ ) {
                    starRate += "��";
                }
                for ( int j = 1; j <= 5 - point; j++ ) {
                    starRate += "��";
                }
%>
                    <tr id="oReviewTitle<%= i %>" name="reviewTitle">
                        <th scope="row"><%= dbox.getString("d_dispNum") %></th>
                        <td>
                            <div style="width:420px; height:16px; overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">
                                <a href="javascript:fnViewReivewContents(<%= i %>);" ><%= dbox.getString("d_contents") %></a>
                            </div>
                        </td>
                        <td><%= starRate %></td>
                        <td style="text-align:center;"><%= dbox.getString("d_name") %></td>
                        <td><%= dbox.getString("d_reg_dt") %></td>
                    </tr>
                    <tr id="oReviewContents<%= i %>" name="reviewContents" style="display:none;">
                        <td colspan="5" style="border-left:0; padding-left:90px;">
                            <%= dbox.getString("d_contents").replaceAll("\\n", "<br/>") %>
                            <input type="hidden" id="oContentsText<%= i %>" name="contentsText<%= i %>" value="<%= dbox.getString("d_contents") %>" />

<%
                if ( loginUserId != null && !loginUserId.equals("") && loginUserId.equals(regUserId) ) {
                    isMyReviewReg = true;
%>
                            <div style="padding:10px 0 0 0; text-align:right;">
                                <a href="javascript:fnViewModifyPopup(<%= dbox.getInt("d_num") %>, <%= point %>, <%= i %>);" ><img src="/images/2013/online_edu/btn_write_modify.gif" alt="����" /></a>
                                <a href="javascript:fnDeleteReview(<%= dbox.getInt("d_num") %>, <%= i %>);"><img src="/images/2013/online_edu/btn_delete.gif" alt="����" /></a>
                            </div>
<%
                }
%>
                        </td>
                    </tr>
<%
                totalRowCount = dbox.getInt("d_tot_cnt");
                totalPage = dbox.getInt("d_totalPage");
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

	</div>
	<!-- /course-detail-tabs -->
<!-- /container-new -->
</div>

<form name="form1" action="/servlet/controller.propose.ProposeCourseServlet" method="post">
    <!--input type="hidden" name="type" value="<%//=type%>"/-->
    <input type="hidden" name="p_process" value="<%= box.get("p_process") %>"/>
    <input type="hidden" name="p_rprocess" value="<%= box.getStringDefault("p_rprocess", box.get("p_process"))%>"/>
    <input type="hidden" name="p_actionurl" value="<%= box.get("p_actionurl") %>"/>
    <input type="hidden" name="p_year" value=""/>
    <input type="hidden" id="oSubj" name="p_subj" value="<%= box.get("p_subj") %>"/>
    <input type="hidden" name="subj" value="<%= box.get("p_subj") %>"/>
    <input type="hidden" name="p_subjseq" value="<%= box.get("p_subjseq") %>"/>
    <input type="hidden" name="p_subjnm" value="<%= box.get("p_subjnm") %>"/>
    <input type="hidden" name="p_upperclass" value="<%= box.get("p_upperclass") %>"/>
    <input type="hidden" name="p_upperclassnm" value="<%= box.get("p_upperclassnm") %>"/>
    <input type="hidden" id="s_mclassnm" name="s_mclassnm"  value="<%= box.get("s_mclassnm") %>"/>
    <input type="hidden" name="p_action" value="<%= p_action %>"/>
    <input type="hidden" name="p_pageno" value="<%= pageNo %>"/>
    <input type="hidden" name="p_pagesize" value="<%= pageSize %>"/>
    <input type="hidden" name="p_favoryn" value="<%= subjectPreview.getString("d_favor_yn") %>"/>
    <input type="text" name="p_biyong" value="<%= biyong %>"/>
    <input type="hidden" name="lessonReurl" value="" />
    <input type="hidden" name="lessonReiurl" value="" /> 
</form>

<!-- �ı� ��� ��� �˾� ���� //-->
<form id="oReviewRegForm" name="reviewRegForm">
    <input type="hidden" name="process" value="" />
    <input type="hidden" name="subj" value="<%= box.get("p_subj") %>" />
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
				<label><input type="radio" id="oPoint5" name="point" value="5" /> <img src="/images/common/icon-star5.png" alt="������ 5��"></label>
				<label><input type="radio" id="oPoint4" name="point" value="4" /> <img src="/images/common/icon-star4.png" alt="������ 4��"></label>
				<label><input type="radio" id="oPoint3" name="point" value="3" /> <img src="/images/common/icon-star3.png" alt="������ 3��"></label>
				<label><input type="radio" id="oPoint2" name="point" value="2" /> <img src="/images/common/icon-star2.png" alt="������ 2��"></label>
				<label><input type="radio" id="oPoint1" name="point" value="1" /> <img src="/images/common/icon-star1.png" alt="������ 1��"></label>
			</div>
			<textarea class="modal-review-textarea" placeholder="�ִ� 500byte���� �ۼ������ϸ�, �弳�̳� ������ ������ �� �ֽ��ϴ�." maxlength="500" id="oContents" name="contents"></textarea>
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