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

        ArrayList subjectLessonList = (ArrayList)request.getAttribute("subjectLessonList");
        DataBox dbox = null;

        String recommendProgress = (String)request.getAttribute("recommendProgress");
        String myProgress = (String)request.getAttribute("myProgress");

        String pageTitle = "���� ���ǽ�";
        String previousURL = "javascript:history.back();";

        String subj = request.getParameter("subj");
        String subjseq = request.getParameter("subjseq");
        String year = request.getParameter("year");
        String subjNm = request.getParameter("subjnm");
System.out.println("subjNm : " +subjNm);
        String lesson = "";
        String mobileURL = "";
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

/**
     * �н� ���۽� ȣ��Ǵ� �Լ�
     */
    function fnViewOnlineClass ( subj, year, subjseq, lesson, mobileURL, idx ) {
        // ������ ������ �����ϱ� ���� ����
        // mobileURL�� Ȯ���ڰ� '.ntc'�̸� NTools�� ���, �׷��� ���� ���� ���������� ���
        var isNTC = ( mobileURL.indexOf(".ntc") > -1 ) ? true : false;

        if ( mobileURL != null && mobileURL != "" ) {

            $("#oProcess").val("updateProgressStart");
            $("#oSubj").val(subj);
            $("#oYear").val(year);
            $("#oSubjseq").val(subjseq);
            $("#oLesson").val(lesson);

            var param = $("#oSubjStudyForm").serialize();

            // ������ ����� ���� ���� ���� ����
            $.ajax({
                    type : "get"
                ,   url : "/servlet/controller.mobile.myclass.StudySubjectServlet"
                ,   dataType : "json"
                ,   data : param
                ,   success : function (data) {

                        if ( Number(data.resultCnt) > 0 ) {
                            setTimeout(function() { fnGetMyProgress(subj, year, subjseq, idx); }, 1000);
                        } else {
                            // alert("�н� ���۽� �н����� ���� ����");
                        }
                    }
                ,   complete : function(arg1, arg2) {
                        // alert("�н� ���۽� ȣ��Ǵ� �Լ� callback : " + arg2);
                    }
            });

            // ������ ��� ����
            // ���� �������� ����μ��� �ǹ̰� ����.
            // ������ ��� ����� ȣ��� ����ó�� URL ������ �Ķ���� ������ ���� ������.
            // �Ʒ��� NTC ���� �������� ����� �� ���Ǵ� ����̴�.
            param = "subj=" + subj + "&year=" + year + "&subjseq=" + subjseq + "&lesson=" + lesson;

            if ( isNTC ) {
                mobileURL = (mobileURL.indexOf("m.edu.kocca.kr") > -1 ) ? mobileURL : "http://m.edu.kocca.kr" + mobileURL;

                var progress = {
                    "playNTC" : {
                        "url": mobileURL,
                        "page" : "1",
                        "notifyURL" : "http://m.edu.kocca.kr/servlet/controller.mobile.myclass.StudySubjectServlet?process=updateProgressEnd",
                        "customInfo" : param
                    }
                };
	            document.location = "newin:@" + JSON.stringify(progress);
            } else {
            	if(mobileURL.indexOf("ksp.credu.com") > 0){
            		$.ajax({
	           	            type : "post"
	           	        ,   url : "/servlet/controller.contents.EduStart"
	           	        ,   dataType : "json"
	           	        ,   data : {
	           	        	url : mobileURL,
	           	        	p_process : "creduSubj"
	           	        }
	           	        ,   success : function(ajaxData) {
				                var progress = {
				                    "playVideo" : {
				                        "url": ajaxData.videoURL,
				                        "startPlaybackTime" : "0",
				                        "notifyURL" : "http://m.edu.kocca.kr/servlet/controller.mobile.myclass.StudySubjectServlet?process=updateProgressEnd",
				                        "customInfo" : param
				                    }
				                };
				                document.location = "newin:@" + JSON.stringify(progress);
	           	        	}
	           	        ,   error :  function(arg1, arg2) {
	           	                alert("������ �߻��Ͽ� �÷��� �� �� �����ϴ�.");
	           	            }
	           	    });
            	}else{
            		
	                var progress = {
	                    "playVideo" : {
	                        "url": mobileURL,
	                        "startPlaybackTime" : "0",
	                        "notifyURL" : "http://m.edu.kocca.kr/servlet/controller.mobile.myclass.StudySubjectServlet?process=updateProgressEnd",
	                        "customInfo" : param
	                    }
	                };
		            document.location = "newin:@" + JSON.stringify(progress);
            	}
            }

        } else {
            alert("��ϵ� ���� ������ �����ϴ�.");
        }
    }

    /**
     * �н� ����� ȣ��Ǵ� �Լ�
     */
    function fnClolseOnlineClass () {
        $("#oProcess").val("updateProgressEnd");

        var param = $("#oSubjStudyForm").serialize();

        $.ajax({
                type : "get"
            ,   url : "/servlet/controller.mobile.myclass.StudySubjectServlet"
            ,   dataType : "json"
            ,   data : param
            ,   success : function (data) {

                    if ( Number(data.resultCnt) > 0 ) {
                        // alert("�н� ����� �н����� ���� ����");
                    } else {
                        // alert("�н� ����� �н����� ���� ����");
                    }
                }
            ,   complete : function(arg1, arg2) {
                    // alert("�н����� ���� callback : " + arg2);
                }
        });
    }

    function fnGetMyProgress(subj, year, subjseq, idx) {
        var param = "process=selectMyProgress&subj=" + subj + "&year=" + year + "&subjseq=" + subjseq;
        $.ajax({
                type : "get"
            ,   url : "/servlet/controller.mobile.myclass.StudySubjectServlet"
            ,   dataType : "json"
            ,   data : param
            ,   success : function (data) {
                    $("#oMyProgressBar").attr("style", "width:" + data.myProgress + "%;");
                    $("#oLessonList" + idx).addClass("visited");
                }
            ,   complete : function(arg1, arg2) {
                    // alert("�н� ������ ���� �� ȣ��Ǵ� �Լ� callback : " + arg2);
                }
        });
    }
</script>
</head>
<body>

<!-- header -->
<%@ include file="/mobile/jsp/include/sub_header.jsp" %>
<!-- /header -->

<%@ include file="/mobile/jsp/include/slidemenu.jsp" %>

<div class="page-header">
    <h2><%= subjNm %></h2>
    <div class="well well-sm mt10">
        <dl class="study-progress">
            <dt>�������</dt>
            <dd>
                <div class="bar"><div id="oMyProgressBar" style="width:<%= myProgress %>%;"></div></div>
            </dd>
        </dl>
    </div>
</div>
<ol class="lecture-step-list">
<%
    for (int i = 0; i < subjectLessonList.size(); i++ ) {
        dbox = (DataBox)subjectLessonList.get(i);
        lesson = dbox.getString("d_lesson");
        mobileURL = dbox.getString("d_new_mobile_url");
%>
    <li <%= dbox.getString("d_study_yn").equals("Y") ? "class=\"visited\"" : ""%> id="oLessonList<%= i %>">
        <a href="javascript:fnViewOnlineClass('<%= subj %>', '<%= year %>', '<%= subjseq %>', '<%= lesson %>', '<%= mobileURL %>', <%= i %>);">
            <strong><%= dbox.getString("d_lesson") %>����</strong>
            <%= dbox.getString("d_sdesc") %>
            <i class="icon-play"><i></i></i>
            <!-- <a href="javascript:fnClolseOnlineClass();">X</a> //-->
        </a>
    </li>
<%
    }
%>
</ol>

<form id="oSubjStudyForm" name="subjStudyForm">
    <input type="hidden" id="oProcess" name="process" value="">
    <input type="hidden" id="oSubj" name="subj" value="">
    <input type="hidden" id="oYear" name="year" value="">
    <input type="hidden" id="oSubjseq" name="subjseq" value="">
    <input type="hidden" id="oLesson" name="lesson" value="">
    <input type="hidden" id="oOid" name="oid" value="1">
</form>

</body>
</html>
<%
    }
%>