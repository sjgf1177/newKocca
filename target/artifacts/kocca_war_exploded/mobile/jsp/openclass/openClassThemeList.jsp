<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page errorPage="/jsp/library/error.jsp" %>

<%@ page import = "com.credu.library.DataBox" %>
<%@ page import = "java.util.ArrayList" %>

<%@ include file="/mobile/jsp/include/init.jsp" %>
<%
    // �������� �α⺰ ���
    ArrayList openClassThemeList = (ArrayList)request.getAttribute("openClassThemeList");

    // String deviceType = box.getString("device_type");

    int cnt = 0;
    String themeNm = "";
    String code = "";

    String pageTitle = "��������";

    String titleTag = "";
    if ( isApp ) {
        titleTag = "��������";
    } else if ( isWeb ) {
        titleTag = "�׸��� | �������� | �ѱ���������ī����";
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
<script src="/mobile/assets/js/openclass.js"></script>
<script>
    /**
     * �������� �׸��� ��� ȭ������ �̵��Ѵ�.
     * @param type : app / web ����
     * @param lectureTheme : ���� �׸� �ڵ�
     * @param themeNm : �׸� ����
     */
    function fnOpenClassThemeDetailList ( type, lectureTheme,  themeNm, cnt) {
        if ( cnt == 0 ) {
            alert("��ϵ� ���°� �����ϴ�.");
            return;
        } else {
            var url = "/servlet/controller.mobile.openclass.OpenClassThemeServlet?process=openClassThemeDetailList&lectureTheme=" + lectureTheme + "&themeNm=" + themeNm;

            fnMoveNavi( type, url)
        }
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
    <li><a href="javascript:fnMoveNavi(2, '/servlet/controller.mobile.openclass.OpenClassPopularServlet');"><i class="icon icon-cir-ar-right"></i> �α⺰</a></li>
    <li class="active"><a href="#"><i class="icon icon-cir-ar-right"></i> �׸���</a></li>
    <li><a href="javascript:fnMoveNavi(2, '/servlet/controller.mobile.openclass.OpenClassCategoryServlet');"><i class="icon icon-cir-ar-right"></i> �з���</a></li>
</ul>
<!-- /tabs -->

<div class="container" <%= containerStyle %>>
<%
    DataBox dbox = null;
    for ( int i = 0 ; i < openClassThemeList.size() ; i++ ) {
        dbox = (DataBox)openClassThemeList.get(i);
        themeNm = dbox.getString("d_codenm");
        code = dbox.getString("d_code");
        cnt = dbox.getInt("d_cnt");

        if ( cnt > 0 ) {
%>
    <div class="panel panel-theme">
        <div class="panel-header">
            <a href="javascript:fnOpenClassThemeDetailList(2, '<%= code %>', '<%= themeNm %>', <%= cnt %>);"><%= themeNm %> (<%= cnt %>) <i class="icon icon-ar-right"></i></a>
        </div>
    </div>
<%
        }
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