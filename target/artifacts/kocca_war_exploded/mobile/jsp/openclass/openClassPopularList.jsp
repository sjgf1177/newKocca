<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page errorPage="/jsp/library/error.jsp" %>

<%@ page import = "com.credu.library.DataBox" %>
<%@ page import = "com.credu.library.StringManager" %>
<%@ page import = "java.util.ArrayList" %>

<%@ include file="/mobile/jsp/include/init.jsp" %>
<%
    // �������� �α⺰ ���
    ArrayList openClassPopularList = (ArrayList)request.getAttribute("openClassPopularList");

    // String deviceType = box.getString("device_type");

    int seq = 0;
    int rnk = 0;
    String vodImg = "";
    String tutorNm = "";
    String lecNm = "";
    String intro = "";

    String pageTitle = "��������";

    String titleTag = "";

    if ( isApp ) {
        titleTag = "��������";
    } else if ( isWeb ) {
        titleTag = "�α⺰ | �������� | �ѱ���������ī����";
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
<script src="/mobile/assets/js/json2.js"></script>
<script src="/mobile/assets/js/common.js"></script>
<script src="/mobile/assets/js/openclass.js"></script>
</head>
<body>

<!-- header -->
<%@ include file="/mobile/jsp/include/header.jsp" %>
<!-- /header -->

<%@ include file="/mobile/jsp/include/slidemenu.jsp" %>

<!-- tabs -->
<ul class="tabs tabs-auto-width tabs-fixed-top">
    <li class="active"><a href="#"><i class="icon icon-cir-ar-right"></i> �α⺰</a></li>
    <li><a href="javascript:fnMoveNavi(2, '/servlet/controller.mobile.openclass.OpenClassThemeServlet');"><i class="icon icon-cir-ar-right"></i> �׸���</a></li>
    <li><a href="javascript:fnMoveNavi(2, '/servlet/controller.mobile.openclass.OpenClassCategoryServlet');"><i class="icon icon-cir-ar-right"></i> �з���</a></li>
</ul>
<!-- /tabs -->

<%
    DataBox dbox = null;
    if ( openClassPopularList.size() > 0) {
        for( int i = 0 ; i < openClassPopularList.size(); i++ ) {
            dbox = (DataBox)openClassPopularList.get(i);
            seq = dbox.getInt("d_seq");
            rnk = dbox.getInt("d_rnk");
            vodImg = dbox.getString("d_vodimg");
            vodImg = vodImg.replaceAll("\\\\", "/");
            tutorNm = dbox.getString("d_tutornm");
            lecNm = dbox.getString("d_lecnm");
            intro = StringManager.subStringBytes( dbox.getString("d_intro"), 132 );
            intro = intro.replaceAll("\r\n", "<br/>");

            if ( rnk == 1) {
%>
<div class="category-detail-header">
    <a href="javascript:fnOpenClassViewDetail(2, <%= seq %>, 'popular');">
        <img src="<%= vodImg %>" alt="<%= lecNm %> �̹���" />
        <span class="caption">
            <span>
                <%= tutorNm + " | " +  lecNm %>
            </span>
        </span>
    </a>
</div>
<ul class="thumb-list">
<%
            } else {
%>
    <li>
        <a href="javascript:fnOpenClassViewDetail(2, <%= seq %>, 'popular');">
            <span class="thumb"><img src="<%= vodImg %>" alt="<%= lecNm %> �̹���" /></span>
            <span class="body">
                <span class="name"><%= lecNm %></span>
                <span class="text" style="font-weight:bold;color:#808080"><%= tutorNm %></span>
            </span>
        </a>
    </li>
<%
            }
        }
    }
%>
</ul>
<div id="oOpenClassPopular"></div>
</body>
</html>
