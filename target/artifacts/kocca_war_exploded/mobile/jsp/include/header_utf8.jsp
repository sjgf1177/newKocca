<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
    if ( isWeb ) {
        if ( !isCheckApp ) {
        	System.out.println("utf-8");
%>
<!-- topbanner -->
<div id="topbanner">
    <button type="button" class="topbanner-close">X</button>
    <div class="body">
        <a href="#"><img src="/mobile/assets/img/topbanner.png" alt="" width="320"></a>
    </div>
</div>
<!-- /topbanner -->
<%
        }
%>
<header id="header" class="header-fixed-top">
    <div class="logo">
        <a href="/servlet/controller.mobile.openclass.OpenClassPopularServlet"><img src="/mobile/assets/img/logo.png" alt="한국콘텐츠아카데미"></a>
    </div>
    <h1><%= pageTitle %></h1>
    <div class="offset-right">
         <form action="/servlet/controller.mobile.subj.SearchSubjectServlet"> 
        <!-- <form action="/mobile/jsp/subj/searchSubject.jsp"> -->
            <button type="button" class="icon btn-header-search">검색</button>
            <input type="text" id="oKeyword" name="keyword" class="input-header-search">
            <a href="#" class="btn btn-default btn-search-close">X</a>
        </form>
        <a href="#" class="icon btn-header-menu">메뉴</a>
    </div>
</header>

<%
    } else if ( isApp ) {
%>
<script>
    $(document).ready( function() {
        var j = {
            "setControl":{
                "backButton":"hide",
                // "homeButton":"show"
            }
        }

        document.location = "newin:@" + JSON.stringify(j);

    });
</script>
<%
    }
%>