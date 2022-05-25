<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>

<!-- sidenav -->
<div class="overlay" style="display:none;"></div>
<div id="sidenav">
    <ul>
<%
    if ( isApp ) {
        if ( isLogin ) {
%>
        <li style="color:#efefef;">
            <i class="icon icon-s-cs"></i><a href="javascript:fnLogout();"><%= box.getSession("name") %>�� ȯ���մϴ�. �α׾ƿ�</a>
        </li>

        <li>
            <a href="javascript:fnMoveMenu(2, '/servlet/controller.mobile.myclass.LastSubjectServlet', false);"><i class="icon icon-s-myclass"></i>���� ���ǽ�</a>
        </li>
<%
        } else {
%>
        <li style="color:#efefef;">
            <i class="icon icon-s-cs"></i><a href="javascript:fnMoveNavi(2, '/servlet/controller.mobile.user.LoginServlet', '');">�α���</a>
        </li>
<%
        }
%>
        <li>
            <a href="javascript:fnMoveMenu(2, '/servlet/controller.mobile.onlineclass.OnlineClassCategoryServlet', false);"><i class="icon icon-s-online"></i>���԰���</a>
        </li>
        <li>
            <a href="javascript:fnMoveMenu(2, '/servlet/controller.mobile.openclass.OpenClassFavorServlet', true); "><i class="icon icon-s-favor"></i>���Ѱ���</a>
        </li>
<%
    }

    if ( isWeb || isApp ) {
%>
<li>
            <a href="javascript:fnMoveMenu(2, '/servlet/controller.mobile.onlineclass.OnlineClassCategoryServlet', false);"><i class="icon icon-s-online"></i>���԰���</a>
        </li>
        <li>
            <a href="javascript:fnMoveMenu(2, '/servlet/controller.mobile.openclass.OpenClassPopularServlet', false);"><i class="icon icon-s-open"></i>��������</a>
        </li>
        <li>
            <a href="javascript:fnMoveMenu(2, '/servlet/controller.mobile.information.FAQServlet', false);"><i class="icon icon-s-faq"></i>FAQ</a>
        </li>
        <li>
            <a href="javascript:fnMoveMenu(2, '/servlet/controller.mobile.information.NoticeServlet', false);"><i class="icon icon-s-notice"></i>��������</a>
        </li>
        <li>
            <a href="javascript:fnMoveMenu(2, '/servlet/controller.mobile.information.InformationServlet', false);""><i class="icon icon-s-intro"></i>��ī���̼Ұ�</a>
        </li>
        <li>
            <a href="javascript:fnMoveMenu(2, '/mobile/jsp/information/information.jsp', false);""><i class="icon icon-s-cs"></i>������</a>
        </li>
        <li>
            <a href="javascript:fnMoveMenu(2, 'https://edu.kocca.kr/edu/main/main.do?mobileTp=Y', false);" style="padding-left:12px;">PC ȭ��</a>
        </li>
<%
    }
%>
    </ul>
</div>
<!-- /sidenav -->
