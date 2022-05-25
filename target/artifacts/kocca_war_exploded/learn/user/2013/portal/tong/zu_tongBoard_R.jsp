<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.credu.research.*" %>
<%@ page import="com.credu.library.*" %>
<%@ page import="com.credu.system.*" %>
<%@ page import="com.credu.common.*" %>
<%@ page import="com.credu.homepage.*" %>
<%@ page import="com.dunet.common.util.*" %>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    int seq = box.getInt("seq");
    int pageNo = box.getInt("p_pageno");
    int pageSize = box.getInt("p_pagesize");

    String searchType = box.getString("searchType");
    String searchKeyword = box.getString("searchKeyword");
    String board_type = box.getString("p_board_type");

    String userid = box.getSession("userid");

    DataBox tongBoard = (DataBox)request.getAttribute("tongBoard");

    int viewCount = 0;
    String title = "";
    String cont = "";
    String regId = "";
    String regNm = "";
    String regDt = "";
    String useYn = "";
    String fileNm = "";
    String saveFileNm = "";
    String fileSize = "";

    if (tongBoard != null) {
        title = tongBoard.getString("d_title").replaceAll("\'\'", "\'");
        cont = tongBoard.getString("d_cont");
        viewCount = tongBoard.getInt("d_view_count");
        regId = tongBoard.getString("d_reg_id");
        regNm = tongBoard.getString("d_reg_nm");
        regDt = tongBoard.getString("d_reg_fmt_dt");
        useYn = tongBoard.getString("d_use_yn");
        fileNm = tongBoard.getString("d_file_nm");
        saveFileNm = tongBoard.getString("d_save_file_nm");
        fileSize = tongBoard.getString("d_file_size");
    }

    box.put("title_str", "��ī���� �̾߱� - ���ҽ�");
%>
<%@ include file="/learn/user/2013/portal/include/header.jsp"%>

<script type="text/javascript">
    $(function() {
        $(document.body).css("font-family", "����,Dotum,AppleGothic,sans-serif").css("font-size", "12px");
    });

    /**
     * ��� ȭ������ �̵�
     */
    function fnGoToList() {
        $("#oProcess").val("list");
        $("#oTongBoardForm").attr("action", "/servlet/controller.homepage.TongBoardServlet");
        $("#oTongBoardForm").submit();
    }
</script>
<!-- container-new ���� //-->
<div id="container-new">

    <form id="oTongBoardForm" name="tongBoardForm" method="get" action="">
    <input type="hidden" id="oProcess" name="p_process" value="" />
    <input type="hidden" id="oBoardType" name="p_board_type" value="<%=board_type%>" />
    <input type="hidden" id="oPageNo" name="p_pageno" value="<%= pageNo %>" />
    <input type="hidden" id="oPageSize" name="p_pagesize" value="<%= pageSize %>" />
    <input type="hidden" id="oSearchType" name="searchType" value="<%= searchType %>" />
    <input type="hidden" id="oSearchKeyword" name="searchKeyword" value="<%= searchKeyword %>" />
    <input type="hidden" id="oSeq" name="seq" value="" />

    <div id="mainMenu">
        <!-- �¶��� ���� -->
        <ul class="location">
            <li>Ȩ</li>
            <li>���ҽ�</li>
            <li>
                ��ī���� �̾߱� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List" >��������</a></li>
                    <li><a href="/servlet/controller.homepage.TongBoardServlet?p_process=list" class="active">��ī���� �̾߱�</a></li>
                    <li><a href="/servlet/controller.homepage.CMUBoardServlet?p_process=list" >CMU ���丮</a></li>
                    <!-- 2015-01-09 ���� ����
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">���� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList" class="active">�����ȳ�</a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage">Ŀ�´�Ƽ</a></li>
                    //-->
                </ul>
            </li>
        </ul>
        <!-- ������ο� -->
        <!-- 2015-01-09 ���� ����
        <div class="introCategory">
            <ul>
                <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">���� ���ǽ�</a></li>
                <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList">�����ȳ�</a></li>
                <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage"><strong><u>Ŀ�´�Ƽ</u></strong></a></li>
            </ul>
        </div>
        //-->
        <!-- //������ο� -->
    </div>

    <!-- ������ ���� ���� -->
    <div id="contents">
        <h2 class="subTit">��ī���� �̾߱�<!--<img src="/images/2013/online_edu/academy_title.gif" alt="��ī�����̾߱�" />//--></h2>
        
        <div id="subCont">
            <!--
            <ul class="tabCus">
                <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage"><img src="/images/2013/online_edu/community_tab_1_off.gif" alt="��ü" /></a></li>
                <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=B0"><img src="/images/2013/online_edu/community_tab_2_off.gif" alt="��ۿ���" /></a></li>
                <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=G0"><img src="/images/2013/online_edu/community_tab_3_off.gif" alt="���Ӱ���" /></a></li>
                <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=K0"><img src="/images/2013/online_edu/community_tab_4_off.gif" alt="��ȭ������" /></a></li>
                <li><a href="/servlet/controller.homepage.CMUBoardServlet?p_process=list"><img src="/images/2013/online_edu/community_tab_6_off.gif" alt="cmu ��������" /></a></li>
<%
        if ( !topWarp_userid.equals("") ) {
%>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=MINE"><img src="/images/2013/online_edu/community_tab_5_off.gif" alt="���� �ۼ��� ��" /></a></li>
<%
        }
%>

            </ul>
            //-->
            <h3 class="blind">��ü ������ġ</h3>

            <div class="article">
                <div class="info">
                    <p class="title"><%= title %></p>
                    <p class="date"><%= regDt %></p>
                    <!-- <p class="curriculum"></p> //-->
                </div>
                <div class="info2">
                    <!-- <p class="name"><%= regNm %></p> //-->
<%
        if ( !fileNm.equals("") ) {
%>
                    <p class="file"><a href="/servlet/controller.library.DownloadServlet?p_savefile=<%= saveFileNm %>&p_realfile=<%= fileNm %>"><%= fileNm %></a><input type="hidden" name="p_savefile" value="<%= saveFileNm %>" /></p>
<%
        }
%>
                </div>

                <div class="inner">
                    <%= cont %>
                </div>

            </div>
            <!-- //article -->

            <div class="btnArea right">
                <a href="javascript:fnGoToList();"><img src="/images/2013/btn/btn_list.gif" alt="���" /></a>
            </div>

        </div>
        <!-- //#subCont -->
    </div>
    <!-- //#contents -->
    </form>

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>