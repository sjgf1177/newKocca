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
        titleTag = "�н��� | ���ǰ��ǽ� | �ѱ���������ī����";
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
            fnMoveNavi(2, "/servlet/controller.mobile.user.LoginServlet", location.href);
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

        ArrayList studySubjectList = (ArrayList)request.getAttribute("studySubjectList");
        DataBox dbox = null;

        String pageTitle = "���� ���ǽ�";
        String mobileUseYn = "";
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
    function fnOpenUtilMenu( subj, year, subjseq, mobileUseYn, idx ) {

        $("#oSubj").val( subj );
        $("#oYear").val( year );
        $("#oSubjseq").val( subjseq );
        $("#oMobileUseYn").val( mobileUseYn );

        var subjText = $('.btn-util-menu').eq(idx).parent().children("a").find(".name").text();
        $("#oSubjText").val( subjText );

        var utilMenu = $('.popover-util-menu');
        var utilMenuBtn = $('.btn-util-menu').eq(idx);
        var offset = utilMenuBtn.offset();

        if (utilMenuBtn.hasClass('toggle-in')) {
            $(".popover-util-menu").hide();
            $(".btn-util-menu").removeClass("toggle-in");

        } else {
            $(".btn-util-menu").removeClass("toggle-in");
            utilMenuBtn.addClass("toggle-in");
            $(".popover-util-menu").show();
        }

        $('.popover-util-menu').css({top:offset.top+20,left:offset.left-80});
        return false;
    }

    /**
     * SNS ���� �˾� ����
     */
    function fnOpenSNSSharePopup() {
        $(".overlay").show();
        $("#oSNSShareModal").modal({show:true});

        var idx = $("#oIdx").val();
        var utilMenuBtn = $('.btn-util-menu').eq(idx);

        $(".popover-util-menu").hide();
        $(".btn-util-menu").removeClass("toggle-in");
    }

    /**
     * SNS �����ϱ�
     */
    function fnShareOnSNS( snsName ) {
        var subj = $("#oSubj").val();
        var year = $("#oYear").val();
        var subjseq = $("#oSubjseq").val();
        var url = location.href;

        url = url.substring(0, url.indexOf("/servlet/"));
        url += "/servlet/controller.mobile.onlineclass.OnlineClassDetailServlet?process=selectOnlineClassDetail&subj=" + subj + "&year=" + year + "&subjseq=" + subjseq;

        $("#oSNSShareModal").modal({show:false});
        $(".overlay").hide();

        fnSendSns( snsName, url, $("#oSubjText").val());
    }

    /**
     * �� ȭ������ �̵�
     */
    function fnViewSubjectDetail() {
        var subj = $("#oSubj").val();
        var year = $("#oYear").val();
        var subjseq = $("#oSubjseq").val();

        fnViewOnlineClassDetail(2, subj, year, subjseq);

        $(".popover-util-menu").hide();
        $(".btn-util-menu").removeClass("toggle-in");
    }

    /**
     * �н��ϱ� ȭ������ �̵�
     */
    function fnStudySubject() {

        var mobileUseYn = $("#oMobileUseYn").val();
        if (mobileUseYn != "Y") {
            alert("����Ͽ��� �������� �ʴ� �����Դϴ�.");
            $('.btn-util-menu').removeClass('toggle-in');
            $('.popover-util-menu').hide();
            return;
        } else {
            var subj = $("#oSubj").val();
            var year = $("#oYear").val();
            var subjseq = $("#oSubjseq").val();
            var subjnm = $("#oSubjText").val();

            var param = "process=selectStudySubjectInfo&subj=" + subj + "&year=" + year + "&subjseq=" + subjseq + "&subjnm=" + subjnm;

            fnMoveNavi(2, "/servlet/controller.mobile.myclass.StudySubjectServlet?" + param, "");

            $(".popover-util-menu").hide();
            $(".btn-util-menu").removeClass("toggle-in");

        }
    }

    function fnStudySubjectDirect( subj, year, subjSeq, mobileUseYn, subjNm ) {
        $("#oSubj").val(subj);
        $("#oYear").val(year);
        $("#oSubjseq").val(subjSeq);
        $("#oMobileUseYn").val(mobileUseYn);
        $("#oSubjText").val(subjNm);

        fnStudySubject();
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
    <li><a href="javascript:fnMoveNavi(2, '/servlet/controller.mobile.myclass.LastSubjectServlet', '');"><i class="icon icon-cir-ar-right"></i> ��������</a></li>
    <li class="active"><a href="#"><i class="icon icon-cir-ar-right"></i> �н���</a></li>
    <li><a href="javascript:fnMoveNavi(2, '/servlet/controller.mobile.myclass.NextSubjectServlet', '');"><i class="icon icon-cir-ar-right"></i> ��������</a></li>
    <li><a href="javascript:fnMoveNavi(2, '/servlet/controller.mobile.myclass.FavorSubjectServlet', '');"><i class="icon icon-cir-ar-right"></i> ���Ѱ���</a></li>
</ul>
<!-- /tabs -->

<div class="container">

    <div class="panel">
        <ul class="thumb-list thumb-list-lecture">
<%
        if ( studySubjectList != null && studySubjectList.size() > 0 ) {
            for ( int i = 0; i < studySubjectList.size(); i++ ) {
                dbox = (DataBox)studySubjectList.get(i);
                mobileUseYn = dbox.getString("d_mobile_use_yn");
%>
            <li>
                <a href="javascript:fnStudySubjectDirect('<%= dbox.getString("d_subj") %>', '<%= dbox.getString("d_year") %>', '<%= dbox.getString("d_subjseq") %>', '<%= dbox.getString("d_mobile_use_yn") %>', '<%= dbox.getString("d_subjnm") %>');">
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
                            �н��Ⱓ <%= dbox.getString("d_edustart") %> ~ <%= dbox.getString("d_eduend") %>
                        </span>
                    </span>
                </a>
                <a onclick="javascript:fnOpenUtilMenu( '<%= dbox.getString("d_subj") %>', '<%= dbox.getString("d_year") %>', '<%= dbox.getString("d_subjseq") %>', '<%= dbox.getString("d_mobile_use_yn") %>', <%= i %> );" class="btn-util-menu"><i class="icon icon-sq3"></i></a>
            </li>
<%
            }
    } else {
%>
            <li class="no-data">�н� �������� ������ �����ϴ�.</li>
<%
    }
%>

        </ul>
        <!--
        <a href="#" class="btn-more">������ <i class="icon icon-cir-plus"></i></a>
        <a href="#" class="btn-all">��ü����</a>
        //-->
    </div>
</div>

<div class="popover bottom popover-util-menu">
    <div class="arrow"></div>
    <div class="popover-content">
        <ul>
            <li><a href="javascript:fnStudySubject();"><i class="icon icon-u-play"></i> �н��ϱ�</a></li>
            <li><a href="javascript:fnViewSubjectDetail();""><i class="icon icon-u-view"></i> �����󼼺���</a></li>
            <li><a href="javascript:fnOpenSNSSharePopup();""><i class="icon icon-u-share"></i> �����ϱ�</a></li>
        </ul>
    </div>
</div>

<div id="oSNSShareModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<a href="#" class="modal-close">X</a>
			<div class="modal-header">
				�������� ����
			</div>
			<ul class="modal-share">
				<li><a href="javascript:fnShareOnSNS('facebook');"><i class="icon icon-facebook"></i>���̽���</a></li>
				<li><a href="javascript:fnShareOnSNS('twitter');"><i class="icon icon-twitter"></i>Ʈ����</a></li>
				<li><a href="javascript:fnShareOnSNS('kakaotalk');"><i class="icon icon-kakaotalk"></i>īī����</a></li>
			</ul>
		</div>
	</div>
</div>


<form id="oStudySubjectForm" name="studySubjectForm" method="post">
    <input type="hidden" id="oSubj" name="subj" value="" />
    <input type="hidden" id="oYear" name="year" value="" />
    <input type="hidden" id="oSubjseq" name="subjseq" value="" />
    <input type="hidden" id="oMobileUseYn" name="mobileUseYn" value="" />
    <input type="hidden" id="oIdx" name="idx" value="" />
    <input type="hidden" id="oSubjText" name="subjText" value="" />
</form>

</body>
</html>

<%
    }
%>