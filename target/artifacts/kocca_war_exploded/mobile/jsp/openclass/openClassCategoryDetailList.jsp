<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page errorPage="/jsp/library/error.jsp" %>

<%@ page import = "com.credu.library.DataBox" %>
<%@ page import = "com.credu.library.StringManager" %>
<%@ page import = "java.util.ArrayList" %>

<%@ include file="/mobile/jsp/include/init.jsp" %>
<%
    request.setCharacterEncoding("euc-kr");

    // �������� �α⺰ ���
    ArrayList openClassCategoryDetailList = (ArrayList)request.getAttribute("openClassCategoryDetailList");

    int seq = 0;
    String lectureCls = request.getParameter("lectureCls");;
    String lectureClsNm = request.getParameter("lectureClsNm");;
    String vodImg = "";
    String tutorNm = "";
    String lecNm = "";
    String intro = "";
    String newYn = "";

    String previousURL = "/servlet/controller.mobile.openclass.OpenClassCategoryServlet";
    String pageTitle = "��������";

    String titleTag = "";

    if ( isApp ) {
        titleTag = "��������";
    } else if ( isWeb ) {
        titleTag = lectureClsNm + " | �з��� | �������� | �ѱ���������ī����";
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
    <script src="/mobile/assets/js/openclass.js"></script>
</head>
<body>

<!-- header -->
<%@ include file="/mobile/jsp/include/sub_header.jsp" %>
<!-- /header -->

<%@ include file="/mobile/jsp/include/slidemenu.jsp" %>

<div class="page-header">
    <h2><%= lectureClsNm %></h2>
</div>

<%
    DataBox dbox = null;
    if ( openClassCategoryDetailList.size() > 0) {
        for( int i = 0 ; i < openClassCategoryDetailList.size(); i++ ) {
            dbox = (DataBox)openClassCategoryDetailList.get(i);
            seq = dbox.getInt("d_seq");
            vodImg = dbox.getString("d_vodimg");
            tutorNm = dbox.getString("d_tutornm");
            lecNm = dbox.getString("d_lecnm");
            intro = StringManager.subStringBytes( dbox.getString("d_intro"), 132 );
            newYn = dbox.getString("d_new_yn");

            if ( i == 0) {
%>

<div class="category-detail-header">
    <a href="javascript:fnOpenClassViewDetail(2, <%= seq %>, 'categoryDetail', '<%= lectureCls %>', '<%= lectureClsNm %>');">
        <img src="<%= vodImg %>" alt="<%= lecNm %> �̹���">
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
        <a href="javascript:fnOpenClassViewDetail(2, <%= seq %>, 'categoryDetail', '<%= lectureCls %>', '<%= lectureClsNm %>');">
            <span class="thumb"><img src="<%= vodImg %>" alt="<%= lecNm %> �̹���" /></span>
            <span class="body">
                <span class="name"><%= lecNm %></span>
                <span class="text" style="font-weight:bold;color:#808080"><%= tutorNm %></span>
            </span>
<%
                if ( newYn.equals("Y") ) {
%>
            <span class="icon-group">
                <i class="icon icon-text-box icon-primary">�ű�</i>
                <!-- <i class="icon icon-text-box icon-info">�⺻</i> //-->
            </span>
<%
                }
%>
        </a>
    </li>
<%
            }
        }
    }
%>

</ul>

</body>
</html>
