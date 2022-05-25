<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page errorPage="/jsp/library/error.jsp" %>
<%@ page import="com.credu.library.RequestBox" %>
<%@ page import="com.credu.library.DataBox" %>
<%@ page import="java.util.ArrayList" %>

<%@ include file="/mobile/jsp/include/init.jsp" %>
<%
    // ���԰��� �оߺ� ���
    request.setCharacterEncoding("euc-kr");
    ArrayList jobDetailList = (ArrayList)request.getAttribute("jobDetailList");
    DataBox dbox = null;

    String pageTitle = "���԰���";
    String previousURL = "javascript:history.back(-1);";

    String clsNm = request.getParameter("clsNm");

    String titleTag = "";

    if ( isApp ) {
        titleTag = "���԰���";
    } else if ( isWeb ) {
        titleTag = clsNm + " ��ü��� | ���԰��� | �ѱ���������ī����";
    }

    String mobileUseYn = "";
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
</head>
<body>

<!-- header -->
<%@ include file="/mobile/jsp/include/sub_header.jsp" %>
<!-- // header -->

<%@ include file="/mobile/jsp/include/slidemenu.jsp" %>

<div class="page-header">
    <h2><%= clsNm %></h2>
</div>

<ul class="thumb-list thumb-list-lecture">
<%
    for ( int i = 0 ; i < jobDetailList.size() ; i++ ) {
        dbox = (DataBox)jobDetailList.get(i);
        mobileUseYn = dbox.getString("d_mobile_use_yn");
%>
    <li>
        <a href="javascript:fnViewOnlineClassDetail(2, '<%= dbox.getString("d_subj") %>', '<%= dbox.getString("d_year") %>', '<%= dbox.getString("d_subjseq") %>');">
            <span class="thumb"><img src="<%= dbox.getString("d_subjfilenamenew") %>" alt=""></span>
            <span class="body">
                <span class="name" style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis; width:94%;">
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
                    ��û�Ⱓ <%= dbox.getString("d_propstart") %> ~ <%= dbox.getString("d_propend") %><br>
                    �����Ⱓ <%= dbox.getString("d_edustart") %> ~ <%= dbox.getString("d_eduend") %>
                </span>
            </span>
            <span class="icon-group">
<%
        if (dbox.getString("d_new_yn").equals("Y")) {
%>
                <i class="icon icon-text-box icon-primary">�ű�</i>
<%
        }
        if ( dbox.getString("d_biz_type").equals("F01") ) {
%>
				<i class="icon icon-text-box icon-info">�⺻</i>
<%
        } else if ( dbox.getString("d_biz_type").equals("F02") ) {
%>
				<i class="icon icon-text-box icon-info">�ǹ�</i>
<%
        }
%>
            </span>
        </a>
    </li>
<%
    }
%>

</ul>
</body>
</html>