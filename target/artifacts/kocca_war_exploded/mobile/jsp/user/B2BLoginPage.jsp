<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page errorPage="/jsp/library/error.jsp" %>

<%@ page import = "com.credu.library.DataBox" %>
<%@ page import = "com.credu.library.StringManager" %>
<%@ page import = "java.util.ArrayList" %>

<%@ include file="/mobile/jsp/include/init.jsp" %>

<%
    ArrayList commonCodeList = (ArrayList)request.getAttribute("commonCodeList");
    DataBox dbox = null;

    String retUrl = box.getString("retUrl");

    String pageTitle = "��������";

    String titleTag = "";
    if ( isApp ) {
        titleTag = "�α���";
    } else if ( isWeb ) {
        titleTag = "�׷�ȸ�� �α��� | �ѱ���������ī����";
    }
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
<script>
/**
 * �з��� �׷��ڵ� ��� ��ȸ
 */
function fnSelectEduGrp( groupType ) {
    $("#oSelectGrcode").empty();
    $("#oSelectGrcode").append("<option value=''>����</option>");

    if ( groupType != "") {
        $.ajax({
                type : "get"
            ,   url : "/servlet/controller.mobile.common.CodeServlet"
            ,   dataType : "json"
            ,   data : "process=groupCodeList&groupType=" + groupType
            ,   success : function (data) {

                    $.each( data, function(){
                        $("#oSelectGrcode").append("<option value='" + this.grcode + "'>" + this.grcodenm + "</option>");
                    });

                }
            ,   complete : function(arg1, arg2) {
                }
            ,   error :  function(arg1, arg2) {
                }

        });
    }
}

/**
 * ����� �α��� üũ
 */
function fnLogin() {
    var groupType = $("#oGroupType").val();
    var grcode = $("#oGrcode").val();
    var grPrefix = $("#oGrPrefix").val();
    var userId = $("#oUserid").val();
    var pwd = $("#oPwd").val();

    var param = "process=loginProc&grcode=" + grcode + "&userid=" + userId + "&pwd=" + pwd + "&grPrefix=" + grPrefix;

    if ( groupType == "" ) {
        alert("�з��� �����ϼ���.");
        $("#oGroupType").focus();
        return false;

    } else  if ( grcode == "" ) {
        alert("�����׷��� �����ϼ���.");
        $("#oSelectGrcode").focus();
        return false;

    } else if ( userId == "" ) {
        alert("����� ���̵� �Է��ϼ���.");
        $("#oUserid").focus();
        return false;

    } else if ( pwd == "" ) {
        alert("����� ��й�ȣ�� �Է��ϼ���.");
        $("#oPwd").focus();
        return false;
    } else {
        $.ajax({
            type : "post"
        ,   url : "/servlet/controller.mobile.user.LoginServlet"
        ,   dataType : "json"
        ,   data : param
        ,   success : function (data) {
                if ( data.loginResult || data.loginResult == "true" ) { // �α��� ����

                    $("#oLoginForm").attr("action", "/mobile/jsp/user/loginOk.jsp");
                    $("#oUserName").val(data.userName);
                    $("#oLoginForm").attr("onsubmit", "return true");
                    $("#oLoginForm").submit();

                } else { // �α��� ���н�
                    alert("���̵� �Ǵ� ��й�ȣ�� �߸��Ǿ����ϴ�.");
                    return false;
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
 * �׷��ڵ� ���û���(oSelectGrcode)�� ���� "|"�� �и��Ͽ� �׷��ڵ�(oGrcode)�� �׷캰 ���ξ�(oGrPrefix) �׸� ���� �����Ѵ�.
 * @param selectedValue - ���õ� ��
 */
function fnSetGrcode( selectedValue ) {
    var temp = "";
    if (selectedValue.indexOf("|") > -1) {
        temp = selectedValue.split("|");
        $("#oGrcode").val( temp[0] );
        $("#oGrPrefix").val( temp[1] );
    } else {
        $("#oGrcode").val(selectedValue);
        $("#oGrPrefix").val( "" );
    }
}

/**
 * �α��� ������ �ڵ� �α��� üũ���� ���� �� �Է� �׸��� ���� ��Ű�� �����Ѵ�.
 */
function fnSetValue( userName ) {

    if( $("input:checkbox[name=autologin]").is(":checked")) {
        fnSetCookie ('userid', $("#oUserid").val(), 365, true);
        fnSetCookie ('username', userName, 365, false);
		fnSetCookie ('pwd', $("#oPwd").val(), 365, true);
        fnSetCookie ('groupType', $("#oGroupType").val(), 365, false);
        fnSetCookie ('selectGrcode', $("#oSelectGrcode").val(), 365, false);
		fnSetCookie ('autologin', true, 365, true);
    } else {
        fnSetCookie ('userid', $("#oUserid").val(), 1, true);
        fnSetCookie ('username', userName, 1, false);
        fnSetCookie ('pwd', $("#oPwd").val(), 1, true);
        fnSetCookie ('groupType', $("#oGroupType").val(), 1, false);
        fnSetCookie ('selectGrcode', $("#oSelectGrcode").val(), 1, true);
		fnSetCookie ('autologin', false, 365, true);
    }
}

/**
 * ������ �ε��� ��Ű ���� üũ�� ��, ��Ű ���� �����ϸ� �ش� �׸� ���� �����Ѵ�.
 */
function fnGetValue() {

    var userid = fnGetCookie("userid", true);
	var pwd = fnGetCookie("pwd", true);
    var groupType = fnGetCookie("groupType", true);
	var selectGrcode = fnGetCookie("selectGrcode", true);
	var autologin = eval(fnGetCookie("autologin", true));

	if(typeof(userid) == "undefined") {
	    userid = "";
    }

    if(typeof(pwd) == "undefined") {
	    pwd = "";
    }

	if(typeof(grcode) == "undefined") {
	    grcode = "";
    }

    if(userid != null && userid != "") {
        $("#oUserid").val( userid );
    }

	if(pwd != null && pwd != "") {
        $("#oPwd").val( pwd );
    }

    if(groupType != null && groupType != "") {
        $("#oGroupType").val( groupType );
    }

    if(selectGrcode != null && selectGrcode != "") {
        $("#oSelectGrcode").val( selectGrcode );
    }

    if ( autologin ) {
        $("input:checkbox[name=autologin]").attr("checked", true);
    }

    if ( userid != "" && pwd != "" && autologin) {
        fnLogin();
    }
}

$(function() {
    // fnGetValue();
});
</script>
</head>
<body>
<form id="oLoginForm" name="loginForm" method="post" action="/servlet/controller.mobile.user.LoginServlet" onsubmit="return false;">
    <input type="hidden" id="oProcess" name="process" value="loginProc" />
    <input type="hidden" id="oRetUrl" name="retUrl" value="<%= retUrl %>" />
    <input type="text" id="oGrcode" name="grcode" value="" />
    <input type="text" id="oGrPrefix" name="grPrefix" value="" />
    <input type="hidden" id="oUserName" name="username" value="" />

<div class="login-form">
	<div class="body2">
		<ul class="category-field">
			<li>
				<label>�з�</label>
				<select id="oGroupType" name="groupType" onchange="fnSelectEduGrp(this.value);">
					<option value=""> ���� </option>
<%
    for ( int i = 0 ; i < commonCodeList.size() ; i++ ) {
        dbox = (DataBox)commonCodeList.get(i);
%>
					<option value="<%= dbox.getString("d_code") %>"><%= dbox.getString("d_codenm") %></option>
<%
    }
%>
				</select>
			</li>
			<li>
				<label>�׷�</label>
				<select id="oSelectGrcode" name="selectGrcode" onchange="fnSetGrcode(this.value);">
					<option value="">����</option>
				</select>
			</li>
		</ul>
		<div class="login-field">
			<ul>
				<li><input type="text" id="oUserid" name="userid" placeholder="���̵�"></li>
				<li><input type="password" id="oPwd" name="pwd" placeholder="��й�ȣ"></li>
			</ul>
			<button type="submit" class="btn btn-primary" onclick="javascript:fnLogin();">�α���</button>
		</div>
	</div>
	<div class="footer">
		<p><i class="icon icon-cir-check"></i> ���̹� ������ ����Ʈ�� ������ ���̵�� ��й�ȣ�� �α��� �Ͻ� �� �ֽ��ϴ�.</p>
		<p><i class="icon icon-cir-check"></i> ȸ������ �� ���̵�/��й�ȣ ã��� PC�������� �̿��Ͻ� �� �ֽ��ϴ�</p>
	</div>
<%
    if ( isWeb ) {
%>
	<a href="javascript:history.back(-1);" class="close">X</a>
<%
    }
%>

</div>
</body>
</html>