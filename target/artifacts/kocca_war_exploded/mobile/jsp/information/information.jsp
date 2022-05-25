<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page errorPage="/jsp/library/error.jsp" %>

<%@ include file="/mobile/jsp/include/init.jsp" %>

<%
    String pageTitle = "������";

    String titleTag = "";

    if ( isApp ) {
        titleTag = "������";
    } else if ( isWeb ) {
        titleTag = "������ | �ѱ���������ī����";
    }
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
<script src="/mobile/assets/js/json2.js"></script>
<script src="/mobile/assets/js/common.js"></script>
<script>
    var isApp = eval("<%= isApp %>");
    /**
     * ȭ�� �ʱ�ȭ
     */
    $(document).ready(function() {
        $('.panel-category .panel-header a').click(function(){
            var panelBody = $(this).parent().parent().children('.panel-body');

            if (panelBody.length > 0) {
                if (panelBody.is(':hidden'))
                {
                    if ($(this).children('i').hasClass('icon-ar-down'))
                    {
                        $('.panel-category .panel-header a i').removeClass('icon-ar-up').addClass('icon-ar-down');
                        $(this).children('i').removeClass('icon-ar-down').addClass('icon-ar-up');
                    }
                    // $('.panel-body').hide();
                    panelBody.show();
                } else {
                    if ($(this).children('i').hasClass('icon-ar-down') || $(this).children('i').hasClass('icon-ar-up'))
                    {
                        $('.panel-category .panel-header a i').removeClass('icon-ar-up').addClass('icon-ar-down');
                    }
                    panelBody.hide();
                }
                return false;
            } else {
                return true;
            }
        });

    });

    /**
     * 1:1 ���� â ǥ��
     */
    function fnOpenContactUsPopup() {
        var isLogin = <%= isLogin %>;
        if ( isLogin ) {
            $("#oContactPopup").modal({show:true});

        } else {
            alert("�ش� �޴��� ����Ϸ��� �α����� �ؾ� �մϴ�.");
            fnMoveNavi(2, "/servlet/controller.mobile.user.LoginServlet", location.href)
        }
    }

    /**
     * 1:1 ���� ���� ���
     */
    function fnRegisterContactUs() {
        var isPopupOpen = $("#oContactPopup").is(":visible");

        if (isPopupOpen) {
            if ($("#oTitle").val() == "") {
                alert("������ �Է��ϼ���.");
                $("#oTitle").focus();
                return;
            } else if ($("#oContents").val() == "") {
                alert("������ �Է��ϼ���.");
                $("#oContents").focus();
                return;
            } else {
                // 1:1 ���� ���
                var param = $("#oContactUsForm").serialize();
                $.ajax({
                        type : "post"
                    ,   url : "/servlet/controller.mobile.information.InformationServlet"
                    ,   dataType : "json"
                    ,   data : param
                    ,   success : function( data ) {
                            if ( data.result == 1 ) {
                                alert("��ϵǾ����ϴ�.");
                            } else {
                                alert("���� ������� ���߽��ϴ�.\n�����ڿ��� �����ϼ���.");
                            }
                            $("body").removeClass("modal-open");
                            $(".overlay").hide();
                            $(".modal").hide();
                            $("#oTitle").val("");
                            $("#oContents").val("");
                    }
                    ,   complete : function(arg1, arg2) {
                            // alert("complete : " + arg1 + " : " + arg2);
                    }
                });

            }
        } else {
            return;
        }
    }

</script>
</head>
<body>

<!-- header -->
<%@ include file="/mobile/jsp/include/header.jsp" %>
<!-- /header -->

<%@ include file="/mobile/jsp/include/slidemenu.jsp" %>

<div class="container">
    <div class="panel panel-category">
        <div class="panel-header">
            <a href="tel:02-6310-0770">������ȭ : 02-6310-0770</a>
        </div>
    </div>
<%
    if ( isApp ) {
%>
    <div class="panel panel-category">
        <div class="panel-header">
            <a href="javascript:fnOpenContactUsPopup();">1:1 ����</a>
        </div>
    </div>
<%
    }
%>
</div>

<form id="oContactUsForm" name="contactUsForm">
    <input type="hidden" id="oProcess" name="process" value="registerContactUs">
<div id="oContactPopup" class="modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <a href="#" class="modal-close">X</a>
            <div class="modal-header">
                PC�������� �¶��α���&gt;���ǰ��ǽ�&gt;��㳻������ �亯�� Ȯ���Ͻ� �� �ֽ��ϴ�.
            </div>
            <div class="mb10">
                <input type="text" style="width:93%;" placeholder="����" id="oTitle" name="title">
            </div>
            <div class="mb10">
                <textarea style="width:98%; height:100px;" placeholder="����" id="oContents" name="contents"></textarea>
            </div>
            <button type="button" class="btn btn-block btn-primary btn-lg" onclick="fnRegisterContactUs();">���</button>
        </div>
    </div>
</div>
</form>
</body>
</html>