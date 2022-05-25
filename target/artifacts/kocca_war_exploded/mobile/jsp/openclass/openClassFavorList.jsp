<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page errorPage="/jsp/library/error.jsp" %>

<%@ page import="com.credu.library.DataBox" %>
<%@ page import="com.credu.library.StringManager" %>
<%@ page import="java.util.ArrayList" %>

<%@ include file="/mobile/jsp/include/init.jsp" %>
<%
    String titleTag = "";

    if ( isApp ) {
        titleTag = "���Ѱ���";
    } else if ( isWeb ) {
        titleTag = "���Ѱ��� | �ѱ���������ī����";
    }

    if ( !isLogin ) {
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

        // �������� ���� ���� ���
        ArrayList openClassFavorList = (ArrayList)request.getAttribute("openClassFavorList");
        DataBox dbox = null;

        int seq = 0;
        int totCnt = 0;
        String lecNm = "";
        String vodImg = "";
        String tutorNm = "";
        String intro = "";

        String pageTitle = "���Ѱ���";

%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%= titleTag %></title> 
<link href="/mobile/assets/css/style.css" rel="stylesheet">
<script src="/mobile/assets/js/jquery-1.11.1.min.js"></script>
<script src="/mobile/assets/js/common.js"></script>
<script src="/mobile/assets/js/json2.js"></script>
<script src="/mobile/assets/js/openclass.js"></script>
<script>

var gStep = "step1";

/**
 * ������ �� �޴� �˾� ����
 */
function fnOpenUtilMenu( seq, idx ) {
    $("#oSeq").val( seq );
    $("#oIdx").val( idx );

    var utilMenu = $('.popover-util-menu');
    var utilMenuBtn = $('.btn-util-menu').eq(idx);

    var offset = utilMenuBtn.offset();
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
 * ���� ���ϱ� ���
 */
function fnCancelSubjFavor() {
    var subj = $("#oSeq").val();
    var param = "classType=02&subj=" + subj + "&jobType=cancel";

    if ( confirm("���� ���� ��Ͽ��� �����Ͻðڽ��ϱ�?") ) {
        $.ajax({
                type : "get"
            ,   url : "/servlet/controller.mobile.subj.SubjFavorServlet"
            ,   dataType : "json"
            ,   data : param
            ,   success : function (data) {

                    if ( data.isLogin == true ) {
                        if ( data.resultCnt > 0) {
                            alert("���� ���¿��� �����Ǿ����ϴ�.");
                            $('.popover-util-menu').hide();

                            fnSelectFavorList( gStep );
                        } else {
                            alert("������ �߻��Ͽ����ϴ�.\n�����ڿ��� �����ϼ���.");
                            return;
                        }
                    } else {
                        alert("�ش� �޴��� ����Ϸ��� �α����� �ؾ� �մϴ�.");
                        fnMoveNavi(2, "/servlet/controller.mobile.user.LoginServlet?process=loginPage", location.href);
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
    } else {
        return;
    }
}

/**
 * ���� ���� ��� ��ȸ
 */
function fnSelectFavorList(step) {
    gStep = step;
    var param = "process=openClassFavorList&viewType=ajax&step=" + step;

    $.ajax({
            type : "get"
        ,   url : "/servlet/controller.mobile.openclass.OpenClassFavorServlet"
        ,   dataType : "json"
        ,   data : param
        ,   success : function( data ) {
                var listArea = $(".panel > .thumb-list");
                var listStr = "";

                var totCnt = 0;
                var currCnt = data.openClassFavorList.length;
                var k = 0;

                if ( currCnt > 0 ) {
                    $.each( data.openClassFavorList, function(){

                        listStr += "<li>\n";
                        listStr += "    <a href=\"#\">\n";
                        listStr += "    <span class=\"thumb\"><img src=\"" + this.d_vodimg + "\" alt=\"" + this.d_lecnm + "\"></span>\n";
                        listStr += "    <span class=\"body\">\n";
                        listStr += "        <span class=\"name\" style=\"width:158px; height:28px; white-space:auto; overflow:hidden; text-overflow:ellipsis;\">" + this.d_lecnm+ "</span>\n";
                        listStr += "        <span class=\"text\" style=\"font-weight:bold;color:#808080\">" + this.d_tutornm + " </span>\n";
                        listStr += "    </span>\n";
                        listStr += "    </a>\n";
                        listStr += "    <a onclick=\"javascript:fnOpenUtilMenu(" + this.d_seq + ", " + (k++) + ");\" class=\"btn-util-menu\"><i class=\"icon icon-sq3\"></i></a>\n";
                        listStr += "</li>\n";

                        totCnt = this.d_totcnt;

                    });
                } else {
                    listStr = "<li class=\"no-data\">���� ���� ����� �����ϴ�.</li>";
                }

                listArea.empty();
                listArea.html( listStr );

                if( step == "step1" && totCnt > 10) {
                    // ������ ��ư ���̱�
                    $(".panel > .btn-more").remove();
                    $(".panel > .btn-all").remove();
                    $(".panel").append("<a onclick=\"fnSelectFavorList('step2');\" class=\"btn-more\">������ <i class=\"icon icon-cir-plus\"></i></a>");
                } else if ( step == "step2" ) {
                    if (totCnt > 20) {
                        // ��ü���� ��ư ���̱�
                        // ������ ��ư �����
                        $(".panel > .btn-more").remove();
                        $(".panel > .btn-all").remove();
                        $(".panel").append("<a onclick=\"fnSelectFavorList('step3');\" class=\"btn-all\">��ü���� <i class=\"icon icon-cir-plus\"></i></a>");
                    } else {
                        // ������/��ü ��ư �����
                        $(".panel > .btn-more").remove();
                        $(".panel > .btn-all").remove();
                    }
                } else if ( step == "step3" ) {
                    $(".panel > .btn-more").remove();
                    $(".panel > .btn-all").remove();
                }
        }
        ,   complete : function(arg1, arg2) {
                // alert("complete : " + arg2);
        }
    });
}

/**
 * �������� �� ȭ������ �̵�
 */
function fnViewDetail() {
    var seq = $("#oSeq").val();

    fnOpenClassViewDetail(2, seq, "")

    $(".popover-util-menu").hide();
    $(".btn-util-menu").removeClass("toggle-in");
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
    var seq = $("#oSeq").val();
    var url = location.href;
    url = url.substring(0, url.indexOf("/servlet/"));
    url += "/servlet/controller.mobile.openclass.OpenClassViewServlet?process=openClassViewDetail&seq=" + seq;

    $("#oSNSShareModal").modal({show:false});
    $(".overlay").hide();

    fnSendSns( snsName, url, $("#oSubjText").val());
}
</script>
</head>
<body>

<!-- header -->
<%@ include file="/mobile/jsp/include/header.jsp" %>
<!-- /header -->

<%@ include file="/mobile/jsp/include/slidemenu.jsp" %>

<div class="container">

	<div class="panel">
		<ul class="thumb-list">
<%
    if ( openClassFavorList.size() > 0 ) {
        for ( int i = 0 ; i < openClassFavorList.size(); i++ ) {
            dbox = (DataBox)openClassFavorList.get(i);
            seq = dbox.getInt("d_seq");
            lecNm = dbox.getString("d_lecnm");
            vodImg = dbox.getString("d_vodimg");
            tutorNm = dbox.getString("d_tutornm");

            intro = dbox.getString("d_intro").replaceAll("\n", " ").replaceAll("\"", "'");
            intro = StringManager.subStringBytes( StringManager.getContentsHTMLRemoved( intro ), 100 );
%>
			<li>
                <span class="thumb"><img src="<%= vodImg %>" alt="<%= lecNm %>"></span>
                <span class="body">
                    <span class="name" style="width:158px;"><%= lecNm %></span>
                    <span class="text" style="font-weight:bold;color:#808080"><%= tutorNm %></span>
                </span>
				<a onclick="javascript:fnOpenUtilMenu(<%= seq %>, <%= i %>);" class="btn-util-menu"><i class="icon icon-sq3"></i></a>
			</li>
<%
            totCnt = dbox.getInt("d_tot_cnt");
        }
    } else {
%>
			<li class="no-data">
                ���� ���°� �����ϴ�.
			</li>
<%
    }
%>

		</ul>
<%
    if(totCnt > 10) {
%>
		<a href="javascript:fnSelectFavorList('step2');" class="btn-more">������ <i class="icon icon-cir-plus"></i></a>
<%
    }
%>
		<!-- <a href="#" class="btn-all">��ü����</a> //-->

	</div>
</div>

<div class="popover bottom popover-util-menu">
	<div class="arrow"></div>
	<div class="popover-content">
		<ul>
			<li><a href="javascript:fnCancelSubjFavor();"><i class="icon icon-u-cancel"></i> �� ���</a></li>
			<!-- <li><a href="#"><i class="icon icon-u-play"></i> ���º���</a></li> //-->
			<li><a href="javascript:fnViewDetail()"><i class="icon icon-u-view"></i> ���»󼼺���</a></li>
			<li><a href="javascript:fnOpenSNSSharePopup();"><i class="icon icon-u-share"></i> �����ϱ�</a></li>
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

<form id="oOpenClassForm" name="openClassForm">
    <input type="hidden" id="oSeq" name="seq" value="" />
    <input type="hidden" id="oIdx" name="idx" value="" />
    <input type="hidden" id="oSubjText" name="subjText" value="<%= lecNm %>" />
</form>

</body>
</html>
<%
    }
%>