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
    String  searchType = box.getString("searchType");
    String  searchKeyword = box.getString("searchKeyword");

    ArrayList<DataBox> tongBoardList = (ArrayList<DataBox>)request.getAttribute("tongBoardList");
    DataBox dbox = null;

    int pageNo = box.getInt("p_pageno");
    int pageSize = box.getInt("p_pagesize");
    int totalPage = 0;
    int totalRowCount = 0;

    pageNo = pageNo == 0 ? 1 : pageNo;
    pageSize = pageSize == 0 ? 10 : pageSize;

    box.put("title_str", "��ī���� �̾߱�, ���ҽ�");

    int seq = 0;
    int dispNum = 0;
    int viewCount = 0;

    String title = "";
    String newYn = "";
    String regDt = "";
    String regNm = "";
%>
<%@ include file="/learn/user/2013/portal/include/header.jsp"%>

<script type="text/javascript">

    /**
     * ���� ���� ȭ������ �̵�
     */
    function fnViewArticle(seq) {
        $("#oSeq").val(seq);
        $("#oProcess").val("view");
        $("#oTongBoardForm").attr("action", "/servlet/controller.homepage.TongBoardServlet");
        $("#oTongBoardForm").submit();
    }

    /**
     * ����Ű�� �Է��ϸ� �Խ��� �˻�
     */
    function fnSearchByKey(e)  {
        if (e.keyCode == "13") {
            goPage(1);
        }
    }

    /**
     * �Խù� �˻�
     */
    function goPage(pageNum) {
        $("#oPageNo").val( pageNum );
        $("#oProcess").val("list");
        $("#oTongBoardForm").attr("action", "/servlet/controller.homepage.TongBoardServlet");
        $("#oTongBoardForm").submit();
    }

</script>

<!-- container-new ���� //-->
<div id="container-new">

    <form id="oTongBoardForm" name="TongBoardForm" method="get" action="">
    <input type="hidden" id="oProcess" name="p_process" value="" />
    <input type="hidden" id="oPageNo" name="p_pageno" value="<%= pageNo %>" />
    <input type="hidden" id="oPageSize" name="p_pagesize" value="<%= pageSize %>" />
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
        <!--
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
            <!-- 2015-01-09 �������
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
            <!--
            <ul class="bbsType">
                <li><a href="community_list_webzine.html"><img src="/images/2013/common/ico_webzine.gif" alt="" /> ������</a></li>
                <li class="on"><a href="community_list_bbs.html"><img src="/images/2013/common/ico_bbs.gif" alt="" /> �Խ�����</a></li>
            </ul>
            //-->

            <!--  ������ �� �˻� -->
            <div class="search">
                <fieldset>
                    <legend>���� �˻�</legend>
                    <select id="oSearchType" name="searchType" title="�˻� �з�">
                        <option value="title" <%= searchType.equals("title") ? "selected='selected'" : "" %>>����</option>
                        <option value="cont" <%= searchType.equals("cont") ? "selected='selected'" : "" %>>����</option>
                    </select>
                    <input type="text" id="oSearchKeyword" name="searchKeyword" value="<%= searchKeyword %>" title="�˻���" class="keyword" onkeypress="fnSearchByKey(event);" />
                    <input type="image" src="/images/2013/btn/btn_src2.gif" alt="�˻�" class="btn" onclick="javascript:selectList();" />
                </fieldset>
            </div>
            <!-- ������ �� �˻� ��//-->

            <div class="board2">
                <table summary="�۹�ȣ, �з�, ����, ����, �ۼ���, ����� ��ȸ�� �����Ǿ��ֽ��ϴ�.">
                    <colgroup>
                        <col width="8%"/>
                        <col width="*"/>
                        <!-- <col width="8%"/> //-->
                        <col width="14%"/>
                        <!-- <col width="8%"/> //-->
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">
                            <div class="divide">
                                <!--
                                <select class="category" title="�з�">
                                    <option>�ı�</option>
                                    <option>�ڷ�</option>
                                    <option>����</option>
                                    <option>����</option>
                                    <option>���</option>
                                </select>
                                //-->
                                ����
                            </div>
                        </th>

                        <!-- <th scope="col">�ۼ���</th> //-->
                        <th scope="col">�����</th>
                        <!-- <th scope="col">��ȸ</th> //-->
                    </tr>
                    </thead>
                    <tbody>
                    <!-- ������
                    <img src="/images/factory/ico_review.gif" alt="�ı�" />
                    <img src="/images/2013/common/ico_pds.gif" alt="�ڷ�" />
                    <img src="/images/2013/common/ico_info.gif" alt="����" />
                    <img src="/images/2013/common/ico_question.gif" alt="����" />
                    <img src="/images/2013/common/ico_discussion.gif" alt="���" />
                    -->
<%
        if ( tongBoardList == null || tongBoardList.size() == 0 ) {
%>
                    <tr>
                        <td class="left bldnone" colspan="3" style="text-align:center;"><b>��ϵ� �Խù��� �����ϴ�.</b></td>
                    </tr>
<%
        } else {
            for ( int i = 0 ; i < tongBoardList.size(); i++) {
                dbox = (DataBox)tongBoardList.get(i);
                seq = dbox.getInt("d_seq");
                dispNum = dbox.getInt("d_dispnum");
                title = dbox.getString("d_title").replaceAll("\'\'", "\'");
                newYn = dbox.getString("d_new_yn");
                regDt = dbox.getString("d_reg_date");
                regNm = dbox.getString("d_reg_nm");
                viewCount = dbox.getInt("d_view_count");

                totalPage = dbox.getInt("d_totalPage");
                totalRowCount = dbox.getInt("d_totalRowCount");

%>
                    <tr>
                        <td class="first"><%= dispNum %></td>
                        <td class="left bldnone">
                            <a href="javascript:fnViewArticle(<%= seq %>);"><%= title %></a>
<%
                if ( newYn.equals("Y") ) {
%>
                            <img src="/images/2013/common/ico_new3.gif" alt="���� �ö�� �� ǥ��" />
<%
                }
%>
                        </td>
                        <!-- <td><%= regNm %></td> //-->
                        <td><%= regDt %></td>
                        <!-- <td><%-- viewCount --%></td> //-->
                    </tr>
<%
            }
        }
%>
                    </tbody>
                </table>
                <!--
                <div class="btnArea right">
                    <a href="community_write.html"><img src="/images/2013/btn/bnt_write.gif" alt="���ۼ�" /></a>
                </div>
                -->
            </div>
            <!-- //tableWrap2 -->

            <div class="paging pgSpace">
                <%= PageUtil.re2013_printPageListDiv(totalPage, pageNo, 0, pageSize, totalRowCount) %>
            </div>

            <!-- //paging -->

        </div>
        <!-- //#subCont -->
    </div>
    <!-- //#contents -->

    </form>
    
</div>
<!--  //container-new �� //-->
<%@ include file="/learn/user/2013/portal/include/footer.html"%>
