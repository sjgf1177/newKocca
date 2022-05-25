<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page errorPage="/jsp/library/error.jsp" %>
<%@ page import = "com.credu.library.RequestBox" %>
<%@ page import = "com.credu.library.DataBox" %>
<%@ page import = "java.util.ArrayList" %>

<%@ include file="/mobile/jsp/include/init.jsp" %>
<%
    String titleTag = "";

    if ( isApp ) {
        titleTag = "���ǰ��ǽ�";
    } else if ( isWeb ) {
        titleTag = "�������� | ���ǰ��ǽ� | �ѱ���������ī����";
    }

    if ( !isLogin ) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<title><%= titleTag %></title>
<link href="/mobile/assets/css/style.css" rel="stylesheet">
<script src="/mobile/assets/js/jquery-1.11.1.min.js"></script>
<script src="/mobile/assets/js/common.js"></script>
<script src="/mobile/assets/js/json2.js"></script>
<script>
    var isApp = eval("<%= isApp %>");

    $(document).ready( function() {
        alert("�ش� �޴��� ����Ϸ��� �α����� �ؾ� �մϴ�.");
        if ( isApp ) {
            fnMoveNavi(1, "/servlet/controller.mobile.user.LoginServlet", location.href);
        } else {
            fnMoveNavi(2, "/servlet/controller.mobile.user.LoginServlet", location.href);
        }
    });
</script>
<body>
</body>
</html>
<%
    } else {

        ArrayList lastSubjectList = (ArrayList)request.getAttribute("lastSubjectList");
        DataBox dbox = null;

        String pageTitle = "���� ���ǽ�";

        String subj = "";
        String year = "";
        String subjseq = "";
        String isGraduated = "";
        String isAvailableReview = "";
        String isPossibleByDate = "";
        String graduateStatus = "";
        String mobileUseYn = "";

        int totCnt = 0;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<title><%= titleTag %></title>
<link href="/mobile/assets/css/style.css" rel="stylesheet">
<script src="/mobile/assets/js/jquery-1.11.1.min.js"></script>
<script src="/mobile/assets/js/common.js"></script>
<script src="/mobile/assets/js/onlineclass.js"></script>
<script>

    /**
     * ������ �� �޴� �˾� ����
     */
    function fnOpenUtilMenu( subj, year, subjseq, reviewOption, mobileUseYn, idx ) {
        $("#oSubj").val( subj );
        $("#oYear").val( year );
        $("#oSubjseq").val( subjseq );
        $("#oMobileUseYn").val( mobileUseYn );
        $("#oIdx").val( idx );

        var utilMenu = $('.popover-util-menu');
        var utilMenuBtn = $('.btn-util-menu').eq(idx);
        var offset = utilMenuBtn.offset();

        if ( reviewOption != "YYY" ) {
            $(".popover-content > ul > li").eq(0).hide();
        } else {
            $(".popover-content > ul > li").eq(0).show();
        }

        if (utilMenuBtn.hasClass('toggle-in')) {
            $('.popover-util-menu').hide();
            $('.btn-util-menu').removeClass('toggle-in');

        } else {
            $('.btn-util-menu').removeClass('toggle-in');
            utilMenuBtn.addClass('toggle-in');
            $('.popover-util-menu').show();
        }

        $('.popover-util-menu').css({top:offset.top+20,left:offset.left-80});
        return false;
    }

    /**
     * �� ȭ������ �̵�
     */
    function fnViewSubjectDetail() {
        var subj = $("#oSubj").val();
        var year = $("#oYear").val();
        var subjseq = $("#oSubjseq").val();

        // fnViewOnlineClassDetail(2, subj, year, subjseq);
        fnViewOnlineClassDetail(2, subj, "", "");

        $('.popover-util-menu').hide();
        $('.btn-util-menu').removeClass('toggle-in');
    }

    /**
     * �����ϱ� ȭ������ �̵�
     */
    function fnGotoReviewPage() {
        var mobileUseYn = $("#oMobileUseYn").val();
        if (mobileUseYn != "Y" ) {
            alert("����Ͽ��� �������� �ʴ� �����Դϴ�.");
        } else {

            var subj = $("#oSubj").val();
            var year = $("#oYear").val();
            var subjseq = $("#oSubjseq").val();

            var url = "/servlet/controller.mobile.myclass.LastSubjectServlet?process=reviewSubject&subj=" + subj + "&year=" + year + "&subjseq=" + subjseq;

            fnMoveNavi(2, url, location.href);

            $('.popover-util-menu').hide();
            $('.btn-util-menu').removeClass('toggle-in');
        } 
    }

    function fnViewMoreLastSubjectList() {
        var currentListCnt = $(".thumb-list-lecture").children("li").length;

        $.ajax({
                type : "get"
            ,   url : "/servlet/controller.mobile.myclass.LastSubjectServlet"
            ,   dataType : "json"
            ,   data : "process=selectLastSubjectList&reqType=ajax&currentListCnt=" + currentListCnt
            ,   success : function (data) {

                    var list = "";
                    var totalListCnt = 0;
                    var targetObj = $(".thumb-list-lecture");

                    var graduatedStatus = "";
                    var reviewOption = "";
                    k = currentListCnt;

                    $.each( data.lastSubjectList, function() {

                        if ( this.d_isgraduated == "A" ){
                            graduatedStatus = "-";
                        } else if ( this.d_isgraduated == "B" ){
                            graduatedStatus = "ó����";
                        } else if ( this.d_isgraduated == "N" ){
                            graduatedStatus = "�̼���";
                        } else if ( this.d_isgraduated == "Y" ){
                            graduatedStatus = "����";
                        }

                        reviewOption = this.d_isablereview + this.d_isgraduated + this.d_ispossible_by_date;

                        list = "<li>\n";
                        // list = "    <a href=\"#\">\n";
                        list += "        <span class=\"thumb\"><img src=\"" + this.d_introducefilenamenew + "\" alt=\"\"></span>\n";
                        list += "        <span class=\"body\">\n";
                        list += "            <span class=\"name\" style=\"font-size:14px; font-weight:bold; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;\">" + this.d_subjnm + "</span>\n";

                        if ( this.d_mobile_use_yn == "Y") {
                            list += "            <img src=\"/mobile/assets/img/mobile_icon.png\" style=\"width:13px; height:13px;\" alt=\"������н�����\" />";
                        }

                        list += "            <span class=\"text\">\n";
                        list += "                " + graduatedStatus + "<br>\n";
                        if ( this.d_isgraduated == "Y" ) {
                            list += "                �����Ⱓ " + this.d_review_fmt_date + "\n";
                        }
                        list += "            </span>\n";
                        list += "        </span>\n";
                        // list += "    </a>\n";
                        list += "    <a onclick=\"javascript:fnOpenUtilMenu( '" + this.d_subj + "', '" + this.d_year + "', '" + this.d_subjseq + "', '" + reviewOption + "', '" + this.d_mobile_use_yn + "', " + (k++) + " );\" class=\"btn-util-menu\"><i class=\"icon icon-sq3\"></i></a>\n";
                        list += "</li>\n";

                        targetObj.append(list);
                        totalListCnt = this.d_tot_cnt;
                    });

                    currentListCnt = targetObj.children("li").length;

                    if ( currentListCnt == totalListCnt ) {
                        $(".btn-more").hide();
                    }

                }
            ,   complete : function(arg1, arg2) {
                    // alert("ajax result : " + arg2);
                }
            ,   error :  function(arg1, arg2) {
                }
        });
    }

</script>

</head>
<body>

<!-- header -->
<%@ include file="/mobile/jsp/include/header.jsp" %>
<!-- /header -->

<%@ include file="/mobile/jsp/include/slidemenu.jsp" %>

<!-- tabs -->
<ul class="tabs tabs-auto-width tabs-fixed-top">
    <li class="active"><a href="#"><i class="icon icon-cir-ar-right"></i> ��������</a></li>
    <li><a href="javascript:fnMoveNavi(2, '/servlet/controller.mobile.myclass.StudySubjectServlet', '');"><i class="icon icon-cir-ar-right"></i> �н���</a></li>
    <li><a href="javascript:fnMoveNavi(2, '/servlet/controller.mobile.myclass.NextSubjectServlet', '');"><i class="icon icon-cir-ar-right"></i> ��������</a></li>
    <li><a href="javascript:fnMoveNavi(2, '/servlet/controller.mobile.myclass.FavorSubjectServlet', '');"><i class="icon icon-cir-ar-right"></i> ���Ѱ���</a></li>
</ul>
<!-- /tabs -->

<div class="container">

    <div class="panel">
        <ul class="thumb-list thumb-list-lecture">
<%
        try {
            if ( lastSubjectList != null && lastSubjectList.size() > 0 ) {
                for( int i = 0; i < lastSubjectList.size() ; i++ ) {
                    dbox = (DataBox)lastSubjectList.get(i);

                    subj = dbox.getString("d_subj");
                    year = dbox.getString("d_year");
                    subjseq = dbox.getString("d_subjseq");
                    isGraduated = dbox.getString("d_isgraduated");
                    isAvailableReview = dbox.getString("d_isablereview");
                    isPossibleByDate = dbox.getString("d_ispossible_by_date");
                    mobileUseYn = dbox.getString("d_mobile_use_yn");

                    if ( isGraduated.equals("A") ) {
                        graduateStatus = "-";
                    } else if ( isGraduated.equals("B") ) {
                        graduateStatus = "ó����";
                    } else if ( isGraduated.equals("N") ) {
                        graduateStatus = "�̼���";
                    } else if ( isGraduated.equals("Y") ) {
                        graduateStatus = "����";
                    }
%>
            <li>
                    <span class="thumb"><img src="<%= dbox.getString("d_introducefilenamenew") %>" alt=""></span>
                    <span class="body">
                        <span class="name" style="font-size:14px; font-weight:bold; white-space:nowrap; overflow:hidden; text-overflow:ellipsis; width:94%;">
<%
                    if ( mobileUseYn.equals("Y") ) {
%>
                            <img src="/mobile/assets/img/mobile_icon.png" style="width:13px; height:13px;" alt="������н�����" />
<%
                    }
%>
                            <%= dbox.getString("d_subjnm") %>
                        </span>
                        <span class="text">
                            <%= graduateStatus %><br>
<%
                    if ( isAvailableReview.equals("Y") && isGraduated.equals("Y") ) {
%>
                            �����Ⱓ <%= dbox.getString("d_review_fmt_date") %>
<%
                    }
%>
                        </span>
                    </span>
                <a onclick="javascript:fnOpenUtilMenu( '<%= subj %>', '<%= year %>', '<%= subjseq %>', '<%= isAvailableReview + isGraduated + isPossibleByDate %>', '<%= dbox.getString("d_mobile_use_yn") %>', <%= i %> );" class="btn-util-menu"><i class="icon icon-sq3"></i></a>
            </li>

<%
                    totCnt = dbox.getInt("d_tot_cnt");
                }

            } else {
%>
            <li class="no-data">���� ���� ����� �����ϴ�.</li>
<%
            }
%>

        </ul>
<%
            if ( totCnt > 10 ) {
%>
        <a href="javascript:fnViewMoreLastSubjectList();" class="btn-more">������ <i class="icon icon-cir-plus"></i></a>
<%
            }
        }catch(Exception e) {
            System.out.println(e.getMessage());
        }
%>
        <!-- <a href="#" class="btn-all">��ü����</a> //-->
    </div>
</div>

<div class="popover bottom popover-util-menu">
    <div class="arrow"></div>
    <div class="popover-content">
        <ul>
            <li><a href="javascript:fnGotoReviewPage();"><i class="icon icon-u-play"></i> �����ϱ�</a></li>
            <li><a href="javascript:fnViewSubjectDetail();"><i class="icon icon-u-view"></i> �����󼼺���</a></li>
        </ul>
    </div>
</div>

<form id="oLastSubjectForm" name="lastSubjectForm">
    <input type="hidden" id="oSubj" name="subj" value="" />
    <input type="hidden" id="oYear" name="year" value="" />
    <input type="hidden" id="oSubjseq" name="subjseq" value="" />
    <input type="hidden" id="oMobileUseYn" name="mobileUseYn" value="" />
    <input type="hidden" id="oIdx" name="idx" value="" />
</form>

</body>
</html>
<%
    }
%>