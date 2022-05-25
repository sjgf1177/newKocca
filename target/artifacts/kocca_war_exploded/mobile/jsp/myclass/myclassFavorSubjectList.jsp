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
        titleTag = "���Ѱ��� | ���ǰ��ǽ� | �ѱ���������ī����";
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
        ArrayList favorSubjectList = (ArrayList)request.getAttribute("favorSubjectList");
        DataBox dbox = null;

        String pageTitle = "���� ���ǽ�";

        int totCnt = 0;

        String subj = "";
        String year = "";
        String subjseq = "";
        String mobileUseYn = "";
        String mobilePreURL = "";
        String mobilePreURL2 = "";
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

    var gStep = "step1";
    /**
     * ������ �� �޴� �˾� ����
     */
    function fnOpenUtilMenu( subj, year, subjseq, mobileUseYn, previewURL, idx ) {

        $("#oSubj").val( subj );
        $("#oYear").val( year );
        $("#oSubjseq").val( subjseq );
        $("#oMobileUseYn").val( mobileUseYn );
        $("#oPreviewURL").val( previewURL );
        $("#oIdx").val( idx );

        var subjText = $('.btn-util-menu').eq(idx).parent().children("a").find(".name").text();
        $("#oSubjText").val( subjText );

        var utilMenu = $(".popover-util-menu");
        var utilMenuBtn = $(".btn-util-menu").eq(idx);
        var offset = utilMenuBtn.offset();

        if (utilMenuBtn.hasClass("toggle-in")) {
            $(".popover-util-menu").hide();
            $(".btn-util-menu").removeClass("toggle-in");

        } else {
            $(".btn-util-menu").removeClass("toggle-in");
            utilMenuBtn.addClass("toggle-in");
            $(".popover-util-menu").show();
        }

        $(".popover-util-menu").css({top:offset.top+20,left:offset.left-80});
        return false;
    }

    /**
     * ���� ���� ���
     *
     */
    function fnCancelFavor() {
        var subj = $("#oSubj").val();
        var idx = $("#oIdx").val();;
        var param = "classType=01&subj=" + subj + "&jobType=cancel";
        var successMsg = "";

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
                                // $(".thumb-list-lecture li").eq(idx).remove();
                                fnSelectFavorSujectList(gStep);
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
                        $(".popover-util-menu").hide();
                        $(".btn-util-menu").removeClass("toggle-in");
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
     * ���� ���� ����� ��ȸ�Ѵ�.
     */
    function fnSelectFavorSujectList(step) {
        gStep = step;

        var listArea = $(".thumb-list-lecture");
        var listStr = "";
        var i = 0;
        $.ajax({
                type: "get"
            ,   url: "/servlet/controller.mobile.myclass.FavorSubjectServlet?reqType=ajax"
            ,   dataType: "json"
            ,   data: "step=" + step
            ,   success: function(data){

                    var totCnt = 0;
                    var currCnt = data.favorSubjectList.length;

                    if ( currCnt > 0 ) {
                        $.each(data.favorSubjectList, function() {
                            listStr += "<li>\n";
                            listStr += "    <a>\n";
                            listStr += "        <span class=\"thumb\"><img src=" + this.d_introducefilenamenew + " alt=\"\"></span>\n";
                            listStr += "        <span class=\"body\">\n";





                            listStr += "            <span class=\"name\" style=\"font-size:14px; font-weight:bold; white-space:nowrap; overflow:hidden; text-overflow:ellipsis; width:94%;\">\n";

                            if (this.d_mobile_use_yn == "Y" ) {
                                listStr += "                <img src=\"/mobile/assets/img/mobile_icon.png\" style=\"width:13px; height:13px;\" alt=\"������н�����\" />\n";
                            }

                            listStr += "            " + this.d_subjnm + "</span>\n";
                            listStr += "            <span class=\"text\">\n";
                            listStr += "                ��û�Ⱓ " + this.d_propstart + " ~ " + this.d_propend + "\n";
                            listStr += "                �н��Ⱓ " + this.d_edustart + " ~ " + this.d_eduend + "\n";
                            listStr += "            </span>\n";
                            listStr += "        </span>\n";
                            listStr += "    </a>\n";
                            listStr += "    <a onclick=\"javascript:fnOpenUtilMenu('" + this.d_subj + "', '" + this.d_year + "', '" + this.d_subjseq + "', '" + this.d_mobile_use_yn + "', '" + this.d_mobile_preurl + "', " + i + ");\" class=\"btn-util-menu\"><i class=\"icon icon-sq3\"></i></a>\n";
                            listStr += "</li>\n";

                            $(".thumb-list-lecture").append( listStr );
                            i++;

                            totCnt = this.d_tot_cnt;

                        });
                    } else {
                        listStr = "<li class=\"no-data\">���� ���� ����� �����ϴ�.</li>";
                    }

                    listArea.empty();
                    listArea.html( listStr );


                    if( step == "step1" && totCnt > 10) {
                        // ������ ��ư ���̱�
                        $(".thumb-list-lecture > .btn-more").remove();
                        $(".thumb-list-lecture").append("<a onclick=\"fnSelectFavorSujectList('step2');\" class=\"btn-more\">������ <i class=\"icon icon-cir-plus\"></i></a>");
                    } else if ( step == "step2" ) {
                        if (totCnt > 20) {
                            // ��ü���� ��ư ���̱�
                            // ������ ��ư �����
                            $(".thumb-list-lecture > .btn-more").remove();
                            $(".thumb-list-lecture").append("<a onclick=\"fnSelectFavorSujectList('step3');\" class=\"btn-more\">������ <i class=\"icon icon-cir-plus\"></i></a>");
                        } else {
                            // ������/��ü ��ư �����
                            $(".thumb-list-lecture > .btn-more").remove();
                        }
                    } else if ( step == "step3" ) {
                        $(".thumb-list-lecture > .btn-more").remove();
                    }

                }
            ,   complete: function(arg1, arg2) {
                    // alert(arg1 + " : " + arg2);
                }
            ,   error: function(arg1, arg2) {
                }
        });
    }

    /**
     * ������ ����
     */
    function fnPreview() {
        var mobileUseYn = $("#oMobileUseYn").val();
        var mobilePreURL = $("#oPreviewURL").val();

        if (mobileUseYn != "Y" ) {
            alert("����Ͽ��� �������� �ʴ� �����Դϴ�.");
            return;
        } else if ( mobilePreURL == "Y" || mobilePreURL == "") {
            alert("��ϵ� ������ ���°� �����ϴ�.");
            return;
        } else {

            // ������ ��� ����
            // �Ʒ��� NTC ���� �������� ����� �� ���Ǵ� ����̴�.
            mobilePreURL = (mobilePreURL.indexOf("m.edu.kocca.kr") > -1 ) ? mobilePreURL : "http://m.edu.kocca.kr" + mobilePreURL;

            var preview = {
                "playNTC" : {
                    "url": mobilePreURL,
                    "page" : "1",
                    "notifyURL" : "",
                    "customInfo" : ""
                }
            };
            document.location = "newin:@" + JSON.stringify(preview);
        }
    }

    /**
     * ������û�ϱ�
     */
    function fnApplyOnlineClass() {
        var subj = $("#oSubj").val();
        var year = $("#oYear").val();
        var subjseq = $("#oSubjseq").val();
        var idx = $("#oIdx").val();
        var msg = "";

        if( confirm("������û�Ͻðڽ��ϱ�?") ) {
            $.ajax({
                    type : "get"
                ,   url : "/servlet/controller.mobile.onlineclass.ApplySubjectServlet"
                ,   dataType : "json"
                ,   data : "process=applyOnllineClass&subj=" + subj + "&year=" + year + "&subjseq=" + subjseq
                ,   success : function (data) {

                        if ( data.resultMsg == "apply.ok" ) {
                            msg = "������û �Ǿ����ϴ�";

                            // ���� ���� ��Ͽ��� �����ϴ� ����� �߰��Ǿ�� ��. ������ ������û�� �� �ٷ� �̷������, ȭ�鿡���� ��ϸ� ����ȸ ��.
                            fnSelectFavorSujectList(gStep);

                        } else {
                            if ( data.resultMsg == "monthly.limit.over" ) {
                                msg = "���� 3�� ���� �н����̹Ƿ� �߰� ������û�� �Ұ����մϴ�.\n(�н��Ⱓ ���� �� ��û ����)\n��1�� �ִ� 3�� �������� �н����� ����";

                            } else if ( data.resultMsg == "already.apply.ok" ) {
                                msg = "�̹� ������û�� �����Դϴ�.";

                            } else if ( data.resultMsg == "student.limit.full" ) {
                                msg = "������û �ο��� ������ �����Ͽ����ϴ�.";

                            } else if ( data.resultMsg == "apply.time.over" ) {
                                msg = "������û �Ⱓ�� �������ϴ�.";

                            } else if ( data.resultMsg == "apply.fail" ) {
                                msg = "������û�� �����Ͽ����ϴ�.\n�����ڿ��� �����Ͻʽÿ�.";

                            }
                        }

                        alert(msg);
                    }
                ,   complete : function(arg1, arg2) {
                        // alert("register apply ajax result : " + arg2);
                        $(".popover-util-menu").hide();
                        $(".btn-util-menu").removeClass("toggle-in");
                    }
            });
        } else {
            return;
        }
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
     * SNS ���� �˾� ����
     */
    function fnOpenSNSSharePopup() {
        $(".overlay").show();
        $("#oSNSShareModal").modal({show:true});

        var idx = $("#oIdx").val();
        var utilMenuBtn = $(".btn-util-menu").eq(idx);

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
    <li><a href="javascript:fnMoveNavi(2, '/servlet/controller.mobile.myclass.StudySubjectServlet', '');"><i class="icon icon-cir-ar-right"></i> �н���</a></li>
    <li><a href="javascript:fnMoveNavi(2, '/servlet/controller.mobile.myclass.NextSubjectServlet', '');"><i class="icon icon-cir-ar-right"></i> ��������</a></li>
    <li class="active"><a href="#"><i class="icon icon-cir-ar-right"></i> ���Ѱ���</a></li>
</ul>
<!-- /tabs -->

<div class="container">
    <div class="panel">
        <ul class="thumb-list thumb-list-lecture">
<%
        try {
            if ( favorSubjectList != null && favorSubjectList.size() > 0 ) {
                for( int i = 0; i < favorSubjectList.size() ; i++ ) {
                    dbox = (DataBox)favorSubjectList.get(i);
                    subj = dbox.getString("d_subj");
                    year = dbox.getString("d_year");
                    subjseq = dbox.getString("d_subjseq");
                    mobileUseYn = dbox.getString("d_mobile_use_yn");
                    mobilePreURL = dbox.getString("d_mobile_preurl");
                    mobilePreURL2 = dbox.getString("d_mobile_preurl2");

                    mobilePreURL = (mobilePreURL.equals("") || mobilePreURL.equals("Y")) ? mobilePreURL2 : mobilePreURL;
%>

            <li>
                <a>
                    <span class="thumb"><img src="<%= dbox.getString("d_introducefilenamenew") %>" alt=""></span>
                    <span class="body">
                        <span class="name" style="font-size:14px; font-weight:bold; white-space:nowrap; overflow:hidden; text-overflow:ellipsis; width:94%">
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
                            ��û�Ⱓ <%= dbox.getString("d_propstart") %> ~ <%= dbox.getString("d_propend") %><br/>
                            �н��Ⱓ <%= dbox.getString("d_edustart") %> ~ <%= dbox.getString("d_eduend") %>
                        </span>
                    </span>
                </a>
                <a onclick="fnOpenUtilMenu('<%= subj %>', '<%= year %>', '<%= subjseq %>', '<%= mobileUseYn %>', '<%= mobilePreURL %>', <%= i %>);" class="btn-util-menu"><i class="icon icon-sq3"></i></a>
            </li>
<%
                    totCnt = dbox.getInt("d_tot_cnt");
                }

                if ( totCnt > 10 ) {
%>
            <a href="javascript:fnSelectFavorSujectList('step2');" class="btn-more">������ <i class="icon icon-cir-plus"></i></a>
<%
                }
            } else {
%>
            <li class="no-data">���� ���� ����� �����ϴ�.</li>
<%
            }
        }catch(Exception e) {
            System.out.println(e.getMessage());
        }
%>
        </ul>
    </div>
</div>

<div class="popover bottom popover-util-menu">
    <div class="arrow"></div>
    <div class="popover-content">
        <ul>
            <li><a href="javascript:fnCancelFavor();"><i class="icon icon-u-cancel"></i> �����</a></li>
            <li><a href="javascript:fnPreview();"><i class="icon icon-u-play"></i> ������</a></li>
            <li><a href="javascript:fnApplyOnlineClass();"><i class="icon icon-u-star"></i> ��û�ϱ�</a></li>
            <li><a href="javascript:fnViewSubjectDetail();"><i class="icon icon-u-view"></i> �����󼼺���</a></li>
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

<form id="oFavorSubjectForm" name="favorSubjectForm">
    <input type="hidden" id="oSubj" name="subj" value="" />
    <input type="hidden" id="oYear" name="year" value="" />
    <input type="hidden" id="oSubjseq" name="subjseq" value="" />
    <input type="hidden" id="oMobileUseYn" name="mobileUseYn" value="" />
    <input type="hidden" id="oPreviewURL" name="previewURL" value="" />
    <input type="hidden" id="oIdx" name="idx" value="" />
    <input type="hidden" id="oSubjText" name="subjText" value="" />
</form>

</body>
</html>
<%
    }
%>