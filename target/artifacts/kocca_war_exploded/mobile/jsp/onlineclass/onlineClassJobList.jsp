<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page errorPage="/jsp/library/error.jsp" %>

<%@ page import="com.credu.library.DataBox" %>
<%@ page import="java.util.ArrayList" %>

<%@ include file="/mobile/jsp/include/init.jsp" %>
<%
    // ���԰��� ������ ���
    ArrayList categoryList = (ArrayList)request.getAttribute("categoryList");
    DataBox dbox = null;

    String pageTitle = "���԰���";

    String clsCd = "";
    String clsNm = "";
    int cnt = 0;

    String titleTag = "";

    if ( isApp ) {
        titleTag = "���԰���";
    } else if ( isWeb ) {
        titleTag = clsNm + "������ ��� | ���԰��� | �ѱ���������ī����";
    }

    String containerStyle = (isCheckApp) ? "style=\"padding-top:93px;\"" : "";
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
<script src="/mobile/assets/js/onlineclass.js"></script>

<script>
/**
 * ���԰��� ������ �� ������� �̵�
 */
function fnSelectJobDetailList( clsCd, clsNm, totCnt ) {
    if ( Number(totCnt) == 0 ) {
        alert("��ϵ� ������ �����ϴ�.");
        return;
    } else {
        var url = "/servlet/controller.mobile.onlineclass.OnlineClassJobServlet?process=selectJobDetailList&clsCd=" + clsCd + "&clsNm=" + clsNm;

        fnMoveNavi( 2, url, "");
    }
}
</script>

</head>
<body>

<!-- header -->
<%@ include file="/mobile/jsp/include/header.jsp" %>
<!-- // header -->

<%@ include file="/mobile/jsp/include/slidemenu.jsp" %>

<!-- tabs -->
<ul class="tabs tabs-auto-width tabs-fixed-top">
    <li><a href="javascript:fnMoveNavi(2, '/servlet/controller.mobile.onlineclass.OnlineClassCategoryServlet');"><i class="icon icon-cir-ar-right"></i> �оߺ�</a></li>
    <li class="active"><a href="#"><i class="icon icon-cir-ar-right"></i> ������</a></li>
</ul>
<!-- // tabs -->

<div class="container" <%= containerStyle %>>
<%
    for ( int i = 0 ; i < categoryList.size() ; i++ ) {
        dbox = (DataBox)categoryList.get(i);
        clsCd = dbox.getString("d_cls_cd");
        clsNm = dbox.getString("d_cls_nm");
        cnt = dbox.getInt("d_cnt");
%>
    <div class="panel panel-theme">
        <div class="panel-header">
            <a href="javascript:fnSelectJobDetailList('<%= clsCd %>', '<%= clsNm %>', <%= cnt %>);"><%= clsNm %> (<%= cnt %>) <i class="icon icon-ar-right"></i></a>
        </div>
    </div>
<%
    }
%>

    <!--
    <div class="panel panel-theme">
        <div class="panel-header">
            <a href="#">�޳ݿ������� (1027) <i class="icon icon-text-box icon-primary">����</i> <i class="icon icon-ar-right"></i></a>
        </div>
    </div>
    //-->

</div>
</body>
</html>