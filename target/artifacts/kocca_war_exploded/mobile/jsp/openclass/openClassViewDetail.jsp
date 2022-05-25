<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page errorPage="/jsp/library/error.jsp" %>

<%@ page import="com.credu.library.DataBox" %>
<%@ page import="com.credu.library.StringManager" %>
<%@ page import="java.util.ArrayList" %>

<%@ include file="/mobile/jsp/include/init.jsp" %>
<%
    request.setCharacterEncoding("euc-kr");
    // �������� ��
    ArrayList openClassDetail = (ArrayList)request.getAttribute("openClassDetail");
    ArrayList relatedLectureList = (ArrayList)request.getAttribute("relatedLecutreList");
    ArrayList reviewList = (ArrayList)request.getAttribute("reviewList");

    DataBox dbox = null;

    dbox = (DataBox)openClassDetail.get(0);

    int seq = dbox.getInt("d_seq");
    int movieNum = dbox.getInt("d_num");

    String tutorNm = dbox.getString("d_tutornm");
    String tutorAuthor = dbox.getString("d_tutorauthor");
    String tutorCareer = dbox.getString("d_tutorcareer").replaceAll("\n", "<br/>");
    String lecNm = dbox.getString("d_lecnm");
    String newYn = dbox.getString("d_new_yn");
    String vodImg = dbox.getString("d_vodimg").replaceAll("\\\\", "/");
    String intro = dbox.getString("d_intro");
    String favorYn = dbox.getString("d_favor_yn");
    String mobileURL = dbox.getString("d_mobileurl");
    String lecTime = dbox.getString("d_lectime");
    String vodPath = dbox.getString("d_vod_path");

    String lectureTheme = dbox.getString("d_lecture_theme");
    String lectureThemeNm = request.getParameter("themeNm");
    String lectureCls = request.getParameter("lectureCls");
    String lectureClsNm = request.getParameter("lectureClsNm");

    String prevPage = box.getString("prevPage");
    String previousURL = "";

    if ( prevPage.equals("popular") ) {
        previousURL = "/servlet/controller.mobile.openclass.OpenClassPopularServlet";

    } else if ( prevPage.equals("theme") ) {
        previousURL = "/servlet/controller.mobile.openclass.OpenClassThemeServlet?process=openClassThemeDetailList&lectureTheme=" + lectureTheme + "&themeNm=" + lectureThemeNm;

    } else if ( prevPage.equals("category") ) {
        previousURL = "/servlet/controller.mobile.openclass.OpenClassCategoryServlet";

    } else if ( prevPage.equals("categoryDetail") ) {
        previousURL = "/servlet/controller.mobile.openclass.OpenClassCategoryServlet?process=openClassCategoryDetailList&step=step3&lectureCls=" + lectureCls + "&lectureClsNm=" + lectureClsNm;
    } else {
        previousURL = "javascript:history.back(-1);";
    }

    String userid = box.getSession("userid");
    String pageTitle = "��������";

    String titleTag = "";
    if ( isApp ) {
        titleTag = "��������";
    } else if ( isWeb ) {
        titleTag = lecNm + " | �׸��� | �������� | �ѱ���������ī����";
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta property="og:title" content="<%= lecNm %>">
<meta property="og:url" content="http://m.edu.kocca.kr/servlet/controller.mobile.openclass.OpenClassViewServlet?seq=<%= seq %>">
<meta property="og:description" content="<%= intro %>">
<meta property="og:image" content="http://m.edu.kocca.kr<%= vodImg %>">

<title><%= titleTag %></title>
<link href="/mobile/assets/css/style.css" rel="stylesheet">
<script src="/mobile/assets/js/jquery-1.11.1.min.js"></script>
<script src="/mobile/assets/js/common.js"></script>
<script src="/mobile/assets/js/json2.js"></script>
<script src="/mobile/assets/js/openclass.js"></script>
<script>

    var isLogin = <%= isLogin %>;

    /**
     * ����(���԰���/��������) ���ϱ�
     *
     */
    function fnRegSubjFavor( classType, subj, jobType ) {

        var param = "classType=" + classType + "&subj=" + subj + "&jobType=" + jobType;
        var successMsg = "";

        $.ajax({
                type : "get"
            ,   url : "/servlet/controller.mobile.subj.SubjFavorServlet"
            ,   dataType : "json"
            ,   data : param
            ,   success : function (data) {

                    if ( data.isLogin == true ) {
                        if ( data.resultCnt > 0) {

                            if (jobType == "register" ) {
                                $(".mb20 > a").eq(0).attr("onclick", "javascript:fnRegSubjFavor( '02', '" + subj + "', 'cancel' );").text("�����");
                                successMsg = "���� ���¿� �߰��Ǿ����ϴ�.";
                            } else {
                                $(".mb20 > a").eq(0).attr("onclick", "javascript:fnRegSubjFavor( '02', '" + subj + "', 'register' );").text("���ϱ�");
                                successMsg = "���� ���¿��� �����Ǿ����ϴ�.";
                            }

                            alert( successMsg );
                        } else {
                            alert("������ �߻��Ͽ����ϴ�.\n�����ڿ��� �����ϼ���.");
                            return;
                        }
                    } else {
                        alert("�ش� �޴��� ����Ϸ��� �α����� �ؾ� �մϴ�.");
                        fnMoveNavi(2, "http://m.edu.kocca.kr/servlet/controller.mobile.user.LoginServlet?process=loginPage", location.href, "Y");
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


    $(document).ready(function() {
        $(".tabs-auto-width > li").bind("click", function() {

            $(".tabs-auto-width > li").removeClass("active");
            $(this).addClass("active");

            $("#oLecturecontents").hide();
            $("#oTutorInfo").hide();
            $("#oReview").hide();
            $("#oRelatedLecture").hide();

            if( $(this).index() == 0 ) {
                $("#oLecturecontents").show();
                $("#oTutorInfo").show();
            } else if( $(this).index() == 1 ) {
                $("#oReview").show();
            } else if( $(this).index() == 2 ) {
                $("#oRelatedLecture").show();
            }
        });


        $(".star-select > a").bind("click", function() {
            var checkpoin = $(this).index() + 1;

            if ( isLogin ) {
                $("#oCheckpoin").val( checkpoin );
                $("#oReviewModal").modal({show:true});
                $("#oRegisterButton").show();
                $("#oModifyButton").hide();
                $("#oCont").focus();
                $(".modal-star-rating > .star > a").removeClass("icon-star-on").addClass("icon-star-off");
                $("#oCont").val("");

                if ( checkpoin == 5 ) {
                    $(".modal-star-rating > .star > a").removeClass("icon-star-off").addClass("icon-star-on");
                } else {
                    $(".modal-star-rating > .star > a").eq(checkpoin).prevAll().removeClass("icon-star-off").addClass("icon-star-on");
                }
            } else {
                alert("�ش� �޴��� ����Ϸ��� �α����� �ؾ� �մϴ�.");
                fnMoveNavi(2, "/servlet/controller.mobile.user.LoginServlet?process=loginPage", location.href);
                return;
            }
            /*
            $.ajax({
                    type : "get"
                ,   url : "/mobile/jsp/common/checkLoginStatus.jsp"
                ,   dataType : "json"
                ,   success : function( data ) {
                        isLogin = data.isLogin;

                        if ( isLogin ) {
                            $("#oCheckpoin").val( checkpoin );
                            $("#oReviewModal").modal({show:true});
                            $("#oRegisterButton").show();
                            $("#oModifyButton").hide();
                            $("#oCont").focus();
                            $(".modal-star-rating > .star > a").removeClass("icon-star-on").addClass("icon-star-off");
                            $("#oCont").val("");

                            if ( checkpoin == 5 ) {
                                $(".modal-star-rating > .star > a").removeClass("icon-star-off").addClass("icon-star-on");
                            } else {
                                $(".modal-star-rating > .star > a").eq(checkpoin).prevAll().removeClass("icon-star-off").addClass("icon-star-on");
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
            });
            */

        }) ;

        $(".modal-star-rating > .star > a").bind("click", function() {
            $("#oCheckpoin").val( $(this).index() + 1);
            $(".modal-star-rating > .star > a").removeClass("icon-star-on").addClass("icon-star-off");
            $(this).removeClass("icon-star-off").addClass("icon-star-on");
            $(this).prevAll().removeClass("icon-star-off").addClass("icon-star-on");
        });

    });

    /**
     * �ı� ���� �˾� ����
     * @param num - ���� �ı� ��ȣ
     * @param checkPoin - ���� ����
     */
    function fnOpenReviewModifyPopup( num, checkPoin ) {
        var cont = $("#oCont_" + num).val();
        $("#oNum").val(num);
        $("#oCheckpoin").val(checkPoin);

        $("#oReviewModal").modal({show:true});
        $("#oCont").focus();
        $(".modal-star-rating > .star > a").removeClass("icon-star-on").addClass("icon-star-off");
        $("#oCont").val( cont );
        $("#oRegisterButton").hide();
        $("#oModifyButton").show();

        if ( checkPoin == 5 ) {
            $(".modal-star-rating > .star > a").removeClass("icon-star-off").addClass("icon-star-on");
        } else {
            $(".modal-star-rating > .star > a").eq(checkPoin).prevAll().removeClass("icon-star-off").addClass("icon-star-on");
        }
    }

    /**
     * �ı� ���
     */
    function fnRegisterReview() {
        if ($("#oCheckpoin").val() == "") {
            alert("�� ������ �������ּ���.");
            return;
        }
        if ($("#oCont").val() == "") {
            alert("�� ������ �Է����ּ���.");
            $("#oCont").focus();
            return;
        }

        $("#oRegBtn").attr("disabled", true);
        $("#oProcess").val("registerReview");
        var param = $("#oReviewForm").serialize().replace(/%/g, '%25');

        $.ajax({
                type : "post"
            ,   url : "/servlet/controller.mobile.openclass.OpenClassReviewServlet"
            ,   dataType : "json"
            ,   data : param
            ,   success : function( data ) {
                    $("#oReview > .panel-body > ul").empty();
                    $('body').removeClass('modal-open');
                    $('.overlay').hide();
                    $('.modal').hide();

                    alert("��ϵǾ����ϴ�.");

                    $("#oRegBtn").attr("disabled", false);
                    $("#oReview > .panel-header").hide();
                    fnSelectReviewList( "step1" );
            }
            ,   complete : function(arg1, arg2) {
                    // alert("complete : " + arg1 + " : " + arg2);
            }
        });

    }

    /**
     * �ı� ����
     */
    function fnModifyReview() {
        if ($("#oCheckpoin").val() == "") {
            alert("�� ������ �������ּ���.");
            return;
        }
        if ($("#oCont").val() == "") {
            alert("�� ������ �Է����ּ���.");
            $("#oCont").focus();
            return;
        }

        if ( confirm("�ı� �� ������ �����Ͻðڽ��ϱ�?") ) {
            $("#oProcess").val("modifyReview");
            var param = $("#oReviewForm").serialize().replace(/%/g, '%25');

            $.ajax({
                    type : "post"
                ,   url : "/servlet/controller.mobile.openclass.OpenClassReviewServlet"
                ,   dataType : "json"
                ,   data : param
                ,   success : function( data ) {
                        $("#oReview > .panel-body > ul").empty();
                        $('body').removeClass('modal-open');
                        $('.overlay').hide();
                        $('.modal').hide();

                        alert("�����Ǿ����ϴ�.");
                        fnSelectReviewList( "step1" );
                }
                ,   complete : function(arg1, arg2) {
                        // alert("complete : " + arg1 + " : " + arg2);
                }
            });
        }
    }


    /**
     * �ı� ����
     */
    function fnDeleteReview() {

        if ( confirm("�ı⸦ �����Ͻðڽ��ϱ�?") ) {

            $("#oProcess").val("deleteReview");
            var param = $("#oReviewForm").serialize();
            $.ajax({
                    type : "post"
                ,   url : "/servlet/controller.mobile.openclass.OpenClassReviewServlet"
                ,   dataType : "json"
                ,   data : param
                ,   success : function( data ) {
                        $("#oReview > .panel-body > ul").empty();
                        $('body').removeClass('modal-open');
                        $('.overlay').hide();
                        $('.modal').hide();

                        alert("�����Ǿ����ϴ�.");
                        $("#oReview > .panel-header").show();
                        fnSelectReviewList( "step1" );
                }
                ,   complete : function(arg1, arg2) {
                        // alert("complete : " + arg1);
                }
            });
        }
    }

    /**
     * �ı� ��� ��������
     */
    function fnSelectReviewList( step ) {
        $("#oProcess").val("selectReviewList");
        $("#oStep").val( step );
        var param = $("#oReviewForm").serialize();

        $.ajax({
                type : "post"
            ,   url : "/servlet/controller.mobile.openclass.OpenClassReviewServlet"
            ,   dataType : "json"
            ,   data : param
            ,   success : function( data ) {
                    var reviewArea = $("#oReview > .panel-body > ul");
                    var reviewListStr = "";
                    var title = "";
                    var cont = "";
                    var maxLength = 0;
                    var currCnt = data.length;
                    var totCnt = 0;

                    if ( currCnt > 0 ) {
                        $.each( data, function(){
                            reviewListStr += "<li>\n";
                            reviewListStr += "<div class=\"author\">" + this.name + "\n";
                            if ( this.userRnk == "1") {
                                reviewListStr += "<div class=\"offset-right\">\n";
                                reviewListStr += "  <a href=\"javascript:fnOpenReviewModifyPopup(" + this.num + ", " + this.checkpoin + ");\" class=\"btn-modify\">| ����</a>\n";
                                reviewListStr += "</div>\n";
                            }
                            reviewListStr += "</div>\n";
                            reviewListStr += "<div class=\"star\">\n";

                            for( var i = 0 ; i < Number(this.checkpoin); i++ ) {
                                reviewListStr += "  <i class=\"icon icon-star-on-sm\"></i>\n";
                            }

                            for( var i = 0 ; i < (5 - Number(this.checkpoin)); i++ ) {
                                reviewListStr += "  <i class=\"icon icon-star-off-sm\"></i>\n";
                            }

                            reviewListStr += "  <span class=\"date\">" + this.regdt + "</span>\n";

                            cont = this.cont;
                            maxLength = (cont.length > 20) ? 20 : cont.length;
                            title = cont.substring(0, maxLength);
                            cont = ( maxLength <= 20 ) ? cont.substring(maxLength, cont.length) : "";

                            reviewListStr += "<div class=\"text\">\n";
                            reviewListStr += "  <strong>" + title + "</strong>" + cont +"\n";
                            reviewListStr += "  <input type=\"hidden\" name=\"cont_"+ this.num + "\" id=\"oCont_" + this.num + "\" value=\"" + title + cont + "\"/>\n";
                            reviewListStr += "</div>\n";
                            reviewListStr += "</li>\n";

                            totCnt = this.cnt;

                        });
                    } else {
                        reviewListStr = "<li class=\"no-data\">��ϵ� �ıⰡ �����ϴ�.</li>";
                    }

                    reviewArea.empty();
                    reviewArea.html( reviewListStr );

                    if( step == "step1" && totCnt > 3) {
                        // ������ ��ư ���̱�
                        $("#oReview > .panel-body > .btn-more").remove();
                        $("#oReview > .panel-body > .btn-all").remove();
                        $("#oReview > .panel-body").append("<a onclick=\"fnSelectReviewList('step2');\" class=\"btn-more\">������ <i class=\"icon icon-cir-plus\"></i></a>");
                    } else if ( step == "step2" ) {
                        if (totCnt > 5) {
                            // ��ü���� ��ư ���̱�
                            // ������ ��ư �����
                            $("#oReview > .panel-body > .btn-more").remove();
                            $("#oReview > .panel-body > .btn-all").remove();
                            $("#oReview > .panel-body").append("<a onclick=\"fnSelectReviewList('step3');\" class=\"btn-all\">��ü�ı� <i class=\"icon icon-cir-plus\"></i></a>");
                        } else {
                            // ������/��ü ��ư �����
                            $("#oReview > .panel-body > .btn-more").remove();
                            $("#oReview > .panel-body > .btn-all").remove();
                        }
                    } else if ( step == "step3" ) {
                        $("#oReview > .panel-body > .btn-more").remove();
                        $("#oReview > .panel-body > .btn-all").remove();
                    }
            }
            ,   complete : function(arg1, arg2) {
                    // alert("complete : " + arg2);
            }
        });
    }

    /**
     * �������� ����
     * ������ ������ �������鼭 ��ȸ���� �����Ѵ�.
     */
    /* 2014-08-23 �ǹ̰� ����.
    function fnViewOpenClass(seq, num) {
        $.ajax({
                type : "get"
            ,   url : "/servlet/controller.mobile.openclass.OpenClassViewServlet"
            ,   dataType : "json"
            ,   data : "process=updateViewCount&seq=" + seq +"&num=" + num
            ,   success : function(data) {
                    if ( data.mobileURL == null || data.mobileURL == "") {
                        alert("��ϵ� �������� �����ϴ�.");
                    } else {
                        var moviePop = window.open("", "_blank");
                        location.target = moviePop;
                        location.href = data.mobileURL;
                    }
                    return;
            }
            ,   complete : function (arg1, arg2) {
                // alert(arg1 + " : " + arg2);
            }
        });
    }
    */

    /**
     * �������� ����
     */
    function fnViewOpenClass(seq, mobileURL) {
    		
        if ( mobileURL == "" ) {
            alert("��ϵ� �������� �����ϴ�.");
            return;
        } else {
            // var moviePop = window.open(mobileURL, "_blank");
            // moviePop.focus();
            
            if(mobileURL.indexOf("ksp.credu.com") > 0 ){
	    		creduURL(seq, mobileURL);
            }else{
	            fnUpdateViewCount(seq);
	            location.href = mobileURL;
            }

        }
    }
    
 	// ũ���� ���ް��� ��ũ���� ��������
    function creduURL(seq, mobileURL){
    	$.ajax({
	            type : "post"
	        ,   url : "/servlet/controller.contents.EduStart"
	        ,   dataType : "json"
	        ,   data : {
	        	url : mobileURL,
	        	p_process : "creduSubj"
	        }
	        ,   success : function(ajaxData) {
	        		fnUpdateViewCount(seq);
	        		location.href = ajaxData.videoURL;
	        	}
	        ,   error :  function(arg1, arg2) {
	                alert("������ �߻��Ͽ� �÷��� �� �� �����ϴ�.");
	            }
	    });
    }

    /**
     *
     */
    function fnUpdateViewCount(seq) {
        $.ajax({
                type : "get"
            ,   url : "/servlet/controller.mobile.openclass.OpenClassViewServlet"
            ,   dataType : "json"
            ,   data : "process=updateViewCount&seq=" + seq
        });
    }


    /**
     * SNS �����ϱ�
     */
    function fnShareOnSNS( snsName ) {

        var url = location.href;

        $("#oSNSShareModal").modal({show:false});
        $(".overlay").hide();

        fnSendSns( snsName, url, $("#oSubjText").val());
    }

</script>
</head>

 
<body>

<!-- header -->
<%@ include file="/mobile/jsp/include/sub_header.jsp" %>
<!-- /header -->

<%@ include file="/mobile/jsp/include/slidemenu.jsp" %>
<div class="container">
    <div class="view-header-subject">
        <h2>
<%
    if ( newYn.equals("Y") ) {
%>
            <i class="icon icon-text-box icon-primary">�ű�</i>
<%
    }
%>
            <%= tutorNm %> : <%= lecNm %>
        </h2>
    </div>
    <div class="view-movie-frame">
        <a href="javascript:fnViewOpenClass(<%= seq %>, '<%= mobileURL %>');">
            <img src="<%= vodImg %>" alt="<%= lecNm %>">
            <i class="icon-play"><i></i></i>
        </a>
        <span style="width:42px; height:16px; font-size:12px; font-weight:bold; color: #fff; background:#000; text-align:center; padding: 6px 0 2px 0; position: absolute; top:80%; left:85%;"><%= lecTime %></span>
    </div>

<%
    if ( openClassDetail.size() > 1 ) {
        for ( int i = 1; i < openClassDetail.size(); i++ ) {
            dbox = (DataBox)openClassDetail.get(i);
            movieNum = dbox.getInt("d_num");
            mobileURL = dbox.getString("d_mobileurl");
%>

	<div class="panel panel-theme">
		<div class="panel-header">
			<a href="javascript:fnViewOpenClass(<%= seq %>, '<%= mobileURL %>');"><%= dbox.getString("d_content") %> <i class="icon-play"><i></i></i></a>
		</div>
	</div>
<%
        }
    }
%>

    <div class="mb20">
<%
    if( isApp ) {
        if ( favorYn.equals("N") || favorYn.equals("") ) {
%>
        <a onclick="javascript:fnRegSubjFavor( '02', <%= seq %>, 'register' );" class="btn btn-default">���ϱ�</a>
<%
        } else {
%>
        <a onclick="javascript:fnRegSubjFavor( '02', <%= seq %>, 'cancel' );" class="btn btn-default">�����</a>
<%
        }
    }
%>
        <a onclick="javascript:fnOpenSharePopup();" class="btn btn-default">�����ϱ�</a>
        
        <%if(sUserId.equals("kkj9699")){%>
        <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
        <a id="kakao-link-btn" href="javascript:;">
			<img src="//dev.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
		</a>
		<script type='text/javascript'>
		  //<![CDATA[
		    // // ����� ���� JavaScript Ű�� ������ �ּ���.
		    Kakao.init('8b4b93280f31d20036f5aff59fb6134d');
		    // // īī���� ��ũ ��ư�� �����մϴ�. ó�� �ѹ��� ȣ���ϸ� �˴ϴ�.
		    Kakao.Link.createTalkLinkButton({
		      container: '#kakao-link-btn',
		      label: '<%= lecNm %>',
		      image: {
		        src: 'http://m.edu.kocca.kr<%= vodImg %>',
		        width: '300',
		        height: '200'
		      },
		      webButton: {
		        text: '�ѱ���������ī����',
		        url: 'http://m.edu.kocca.kr/servlet/controller.mobile.openclass.OpenClassViewServlet?seq=<%= seq %>' // �� ������ �� �÷����� ����� �������� URL�̾�� �մϴ�.
		      }
		    });
		  //]]>
		</script>
        <%}%>
    </div>

    <ul class="tabs tabs-view tabs-auto-width">
        <li class="active"><a>�Ұ�</a></li>
        <li><a>�ı�</a></li>
        <li><a>��������</a></li>
    </ul>

    <!--
    <div class="panel" id="oLecturecontents">
        <div class="panel-header">
            <h3>�� ���¿� ���Ͽ� </h3>
        </div>
        <div class="panel-body panel-body-info">
            <%= intro %>
        </div>
    </div>
    //-->
    <div class="panel" id="oLecturecontents">
        <div class="panel-header">
            <a href="#" data-toggle="collapse">�� ���¿� ���Ͽ� <i class="icon icon-ar-up"></i></a>
        </div>
        <div class="panel-body panel-body-collapse panel-body-info" style="display:block;">
            <%= intro.replaceAll("\r\n", "<br/>") %>
        </div>
    </div>

    <div class="panel" id="oTutorInfo">
        <div class="panel-header">
            <a href="#" data-toggle="collapse">����� <i class="icon icon-ar-up"></i></a>
        </div>
        <div class="panel-body panel-body-collapse panel-body-info" style="display:block;">
            <%= tutorNm %><br />
            <%= tutorAuthor %><br />
            <%= tutorCareer %>
        </div>
    </div>


<%
    int userRnk = 0;
    int totCnt = 0;
    if ( reviewList != null && reviewList.size() > 0 ) {
        dbox = (DataBox)reviewList.get(0);
        userRnk = dbox.getInt("d_user_rnk");
        totCnt = dbox.getInt("d_cnt");
    }
%>

    <div class="panel panel-star-rating" style="display:none;" id="oReview">
<%
    if ( isApp && userRnk == 0 ) {
%>
        <div class="panel-header">
            <h3>��</h3>
            <div class="star-select">
                <a href="#" class="icon icon-star-off"></a>
                <a href="#" class="icon icon-star-off"></a>
                <a href="#" class="icon icon-star-off"></a>
                <a href="#" class="icon icon-star-off"></a>
                <a href="#" class="icon icon-star-off"></a>
            </div>
        </div>
<%
    }
%>
        <div class="panel-body">
<%
    if ( reviewList == null || reviewList.size() == 0 ) {
%>
            <ul>
                <li class="no-data">��ϵ� �ıⰡ �����ϴ�.</li>
            </ul>
<%
    } else {
%>
            <ul>
<%
        String title = "";
        String cont = "";
        String regid = "";
        int num = 0;
        int checkPoin = 0;
        int maxLength = 0;
        for ( int i = 0 ; i < reviewList.size() ; i++ ) {
            dbox = (DataBox)reviewList.get(i);
            regid = dbox.getString("d_regid"); 
            cont = dbox.getString("d_cont");
            num = dbox.getInt("d_num");
            checkPoin = dbox.getInt("d_checkpoin");

            // title = StringManager.cutText( cont, 40, false);

            maxLength = (cont.length() > 20) ? 20 : cont.length();

            title = cont.substring(0, maxLength);
            cont = ( maxLength <= 20 ) ? cont.substring(maxLength, cont.length()) : "";
%>
                <li>
                    <div class="author">
                        <%= dbox.getString("d_name") %>
<%
            if ( isLogin && regid.equals( userid ) ) {
%>
                        <div class="offset-right">
                            <a href="javascript:fnOpenReviewModifyPopup(<%= num %>, <%= checkPoin %>);" class="btn-modify">| ����</a>
                        </div>
<%
            }
%>
                    </div>
                    <div class="star">
<%
            for( int j = 0; j < checkPoin ; j++ ) {
%>
                        <i class="icon icon-star-on-sm"></i>
<%
            }

            for( int j = 0; j < (5 - checkPoin ) ; j++ ) {
%>
                        <i class="icon icon-star-off-sm"></i>
<%
            }
%>
                        <span class="date"><%= dbox.getString("d_regdt") %></span>
                    </div>
                    <div class="text" >
                        <strong><%= title %></strong><%= cont.replaceAll("\r\n", "<br/>") %>
                        <input type="hidden" name="cont_<%= num %>" id="oCont_<%= num %>" value="<%= title + cont %>" />
                    </div>
                </li>
<%
        }
%>
            </ul>

<%
        if ( totCnt > 5 ) {
%>
            <a onclick="fnSelectReviewList('step2');" class="btn-more">������ <i class="icon icon-cir-plus"></i></a>
            <!-- <a href="#" class="btn-all">��ü�ı�</a> //-->
<%
        }
    }
%>
        </div>

    </div>

    <div class="panel" style="display:none;" id="oRelatedLecture">
        <div class="panel-header">
            <h3>���� ����</h3>
        </div>
        <div class="panel-body">
            <ul class="thumb-list thumb-list-lecture">
<%
    if ( relatedLectureList != null && relatedLectureList.size() > 0 ) {
        for( int i = 0 ; i < relatedLectureList.size(); i++) {
            dbox = (DataBox)relatedLectureList.get(i);
%>
                <li>
                    <a href="javascript:fnOpenClassViewDetail(2, <%= dbox.getInt("d_seq") %>, '');">
                        <span class="thumb"><img src="<%= dbox.getString("d_vodimg").replaceAll("\\\\", "/") %>" alt=""></span>
                        <span class="body">
                            <span class="name"><%= dbox.getString("d_tutornm") + " : " + dbox.getString("d_lecnm") %></span>
                            <span class="text">
                            </span>
                        </span>
                    </a>
                </li>
<%
        }
    } else {
%>
                <li>
                    <div style="width:100%; font-size:10pt; text-align: center; padding-top:28px;">
                    ���� ���°� �����ϴ�.
                    </div>
                </li>
<%
    }
%>

            </ul>
        </div>
    </div>

</div>

<%@ include file="/mobile/jsp/include/shareonsns.jsp" %>
<input type="hidden" id="oSubjText" name="subjText" value="<%= lecNm %>" />

<form id="oReviewForm" name="reviewForm">
    <input type="hidden" id="oProcess" name="process" value="" />
    <input type="hidden" id="oSeq" name="seq" value="<%= seq %>" />
    <input type="hidden" id="oNum" name="num" value="" />
    <input type="hidden" id="oCheckpoin" name="checkpoin" value="" />
    <input type="hidden" id="oStep" name="step" value="" />
<div id="oReviewModal" class="modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <a href="#" class="modal-close">X</a>
            <div class="modal-header">
                <strong><%= box.getSession("name") %></strong>���� ��
            </div>
            <div class="modal-star-rating">
                <div class="star">
                    <a href="#" class="icon icon-star-off"></a>
                    <a href="#" class="icon icon-star-off"></a>
                    <a href="#" class="icon icon-star-off"></a>
                    <a href="#" class="icon icon-star-off"></a>
                    <a href="#" class="icon icon-star-off"></a>
                </div>
                <div class="textarea">
                    <textarea id="oCont" name="cont" maxlength="150"></textarea>
                </div>
                <div class="row" id="oRegisterButton">
                    <button type="button" class="btn btn-block btn-primary btn-lg" id="oRegBtn" onclick="fnRegisterReview();">���</button>
                </div>
                <div class="row" id="oModifyButton" style="display:none;">
                    <button type="button" class="btn btn-primary btn-lg pull-left" style="width:49%;" id="oDelBtn" onclick="fnDeleteReview();">����</button>
                    <button type="button" class="btn btn-primary btn-lg pull-right" style="width:49%;" id="oModBtn" onclick="fnModifyReview();">����</button>
                </div>
            </div>
        </div>
    </div>
</div>
</form>

</body>
</html>
