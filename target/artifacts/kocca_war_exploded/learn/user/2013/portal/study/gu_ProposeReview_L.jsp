<%
//**********************************************************
//  1. ��      ��:
//  2. ���α׷���:
//  3. ��      ��:
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��:
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.course.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    ArrayList reviewList = null;
    reviewList = (ArrayList)request.getAttribute("reviewList");   //�������� ���� ����Ʈ

    String subj = "";
    String subjNm = "";
    String v_appdate = "";
    String contents = "";
    String areaNm = "";
    String reviewYn = "";
    int point = 0;
    int num = 0;

    int pageNo = ( box.getInt("p_pageno") == 0 ) ? 1 : box.getInt("p_pageno");
    int row = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int pageSize = ( box.getInt("p_pagesize") == 0 ) ? 10 : box.getInt("p_pagesize");
    int totalRowCount = 0;
    int totalPage = 0;
    int dispNum = 0;
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<script type="text/javascript">

    $(function(){
        $('#sample').modal({show:false});
        //$('[data-dismiss="modal"]').trigger('click');
    });

    /**
     * �ı� ��Ͽ��� ������ �̵� ó���� �Ѵ�.
     * ajax�� �̿��Ͽ� ���ο� ����� ��ȸ�ϰ� �ϴ��� ������ ��ɵ� ó���Ѵ�.
     */
    function goPage( pageNum ) {
        $("#oReviewManageForm input:hidden[name=page]").val(pageNum);
        var param = "p_process=selectReviewListForAjax&p_pageno=" + pageNum;

        var reviewListStr = "";
        var pagingStr = "";
        var idx = 0;
        var point = 0;

        var pageNo = 0;
        var pageSize = 3;
        var startPage = 0;
        var endPage = 0;
        var blockSize = 0;
        var pageBlock = 0;
        var blockCount = 0;

        // $.ajaxSetup({cache:false});
        $.ajax({
                type : "get"
            ,   url : "/servlet/controller.study.ProposeReviewServlet"
            ,   dataType : "json"
            ,   data : param
            ,   success : function (data) {

                    var currCnt = data.reviewList.length;
                    var k = 0;

                    // �ı� ��� ǥ��
                    if ( currCnt > 0 ) {
                        $("tr[name=reviewContents]").remove();

                        $.each( data.reviewList, function(){

                            point = Number(this.d_point);

                            reviewListStr += "<tr id=\"oReviewContents" + idx + "\" name=\"reviewContents\">\n";
                            reviewListStr += "  <td class=\"first\">" + this.d_dispnum + "</td>\n";
                            reviewListStr += "  <td>" + this.d_codenm + "</td>\n";
                            reviewListStr += "  <td>" + this.d_subjnm + "</td>\n";
                            reviewListStr += "  <td>\n";

                            if ( this.d_review_yn == "N") {
                                reviewListStr += "      <span class=\"btnBlue\"><a href=\"javascript:fnManageReview('" + this.d_subj + "', " + this.d_num + ", " + this.d_point + ", 'R');\">���</a></span>\n";

                            } else {
                                reviewListStr += "      <span class=\"btnPink\"><a href=\"javascript:fnManageReview('" + this.d_subj + "', " + this.d_num + ", " + this.d_point + ", 'M');\">����</a></span>\n";
                                reviewListStr += "      <input type=\"hidden\" id=\"oContentsText_" + this.d_subj + "\" name=\"contentsText\" value=\"" + this.d_contents + "\" />\n";
                            }
                            reviewListStr += "  </td>\n";
                            reviewListStr += "</tr>\n";

                            $("#oReviewTable tbody").append(reviewListStr);
                            reviewListStr = "";
                            idx++;

                            pageNo = this.d_pageno;
                            startPage = this.d_startpage;
                            endPage = this.d_endpage;
                            pageBlock = this.d_pageblock;
                            blockSize = this.d_blocksize;
                            blockCount = this.d_blockcount;
                        });

                        if ( pageBlock == 1 ) {
                            pagingStr += "<a href=\"javascript:void(0);\"><img src=\"/images/2013/common/btn_pre.jpg\" alt=\"����������\" /></a>";
                        } else {
                            pagingStr += "<a href=\"javascript:goPage(" + ( startPage - blockSize ) + ");\"><img src=\"/images/2013/common/btn_pre.jpg\" alt=\"����������\" /></a>";
                        }
                        pagingStr += "<span>";

                        for( var i = startPage ; i <= endPage ; i++ ) {
                            if (i == pageNo) {
                                pagingStr += "<strong>" + i + "</strong>";
                            } else {
                                pagingStr += "<a href=\"javascript:goPage('" + i + "');\">" + i + "</a>";
                            }
                        }

                        pagingStr += "</span>";

                        if ( pageBlock == blockCount ) {
                            pagingStr += "<a href=\"javascript:void(0);\"><img src=\"/images/2013/common/btn_next.jpg\" alt=\"����������\" /></a>";
                        } else {
                            pagingStr += "<a href=\"javascript:goPage(" + ( endPage + 1 ) + ");\"><img src=\"/images/2013/common/btn_next.jpg\" alt=\"����������\" /></a>";
                        }

                        $("#oPagingArea").empty();
                        $("#oPagingArea").append(pagingStr);
                        $("#oPagingArea").css("display", "block");

                    } else {
                        reviewListStr = "";
                        reviewListStr += "<tr>\n";
                        reviewListStr += "    <td colspan=\"4\" style=\"border-left: none;\">������û�� �̷��� �����ϴ�.</td>\n";
                        reviewListStr += "</tr>\n";

                        $("tr[name=reviewTitle]").remove();
                        $("tr[name=reviewContents]").remove();
                        $("#oReviewTable tbody").append(reviewListStr);
                        $("#oPagingArea").css("display", "none");
                    }

                }
            ,   complete : function(arg1, arg2) {
                    // alert("complete : " + arg1);
                }
            ,   error :  function(XMLHttpRequest, textStatus, errorThrown) {
                    // alert("error : " + errorThrown);
                    alert("������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���.");
                }
        });
    }

    /**
     * �ı� ���/���� �˾��� ����
     */
    function fnManageReview(subj, num, point, jobType) {
        $("#oReviewManageForm input:hidden[name=subj]").val(subj);
        $("#oReviewManageForm input:hidden[name=num]").val(num);
        $("#oReviewManageForm input:radio[name=point]").removeAttr("checked");
        $("#oReviewManageForm textarea[name=contents]").val("");

        if ( jobType == "R" ) {
            $(".modal-content .modal-btn").eq(0).text("���").attr("onclick", "fnRegisterReview();");
            $(".modal-content .modal-btn").eq(1).text("���").attr("onclick", "fnCloseRegisterPopup();");

        } else {
            $(".modal-content .modal-btn").eq(0).text("����").attr("onclick", "fnModifyReview();");
            $(".modal-content .modal-btn").eq(1).text("����").attr("onclick", "fnDeleteReview();");
            $("#oReviewManageForm input:radio[name=point][value=" + point + "]").prop("checked", true);
            $("#oReviewManageForm textarea[name=contents]").val( $("#oContentsText_" + subj).val() );
        }

        $("[data-toggle=\"modal\"]").trigger("click");
    }

    /**
     * �ı⸦ ����Ѵ�.
     */
    function fnRegisterReview(idx) {

        if ( $("#oReviewManageForm input:radio[name=point]:checked").length == 0 ) {
            alert("������ �������ּ���.");
            $("#oReviewManageForm input:radio[name=point]").eq(0).focus();
            return;

        } else if( $("#oReviewManageForm textarea[name=contents]").val() == "") {
            alert("�ı� ������ �Է��ϼ���.");
            $("#oReviewManageForm textarea[name=contents]").focus();
            return;

        } else if (confirm("�ı⸦ ����Ͻðڽ��ϱ�?")) {

            $("#oReviewManageForm input[name=process]").val("registerReview");
            var param = $("#oReviewManageForm").serialize();

            $.ajaxSetup({cache:false});
            $.ajax({
                    type : "post"
                ,   url : "/servlet/controller.mobile.onlineclass.OnlineClassReviewServlet"
                ,   dataType : "json"
                ,   data : param
                ,   success : function (data) {
                        $("[data-dismiss=\"modal\"]").trigger("click");

                        if ( data.resultCnt > 0 ) {
                            var pageNo = $("#oReviewManageForm input:hidden[name=page]").val();
                            alert("�ıⰡ ��ϵǾ����ϴ�.");
                            goPage(pageNo);
                            $("#oReviewManageForm textarea[name=contents]").val("");
                        } else {
                            alert("������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���.");
                        }
                    }
                ,   complete : function(arg1, arg2) {
                        // alert("complete : " + arg1);
                    }
                ,   error :  function(XMLHttpRequest, textStatus, errorThrown) {
                        // alert("error : " + errorThrown);
                        alert("������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���.");
                    }
            });
        }
    }

    /**
     * �ı⸦ �����Ѵ�.
     */
    function fnModifyReview() {

        if ( $("#oReviewManageForm input:radio[name=point]:checked").length == 0 ) {
            alert("������ �������ּ���.");
            $("#oReviewManageForm input:radio[name=point]").eq(0).focus();
            return;

        } else if( $("#oReviewManageForm textarea[name=contents]").val() == "") {
            alert("�ı� ������ �Է��ϼ���.");
            $("#oReviewManageForm textarea[name=contents]").focus();
            return;

        } else if (confirm("�ı⸦ �����Ͻðڽ��ϱ�?")) {

            $("#oReviewManageForm input[name=process]").val("modifyReview");
            var param = $("#oReviewManageForm").serialize();

            $.ajaxSetup({cache:false});
            $.ajax({
                    type : "post"
                ,   url : "/servlet/controller.mobile.onlineclass.OnlineClassReviewServlet"
                ,   dataType : "json"
                ,   data : param
                ,   success : function (data) {
                        $("[data-dismiss=\"modal\"]").trigger("click");

                        if ( data.resultCnt > 0 ) {
                            var pageNo = $("#oReviewManageForm input:hidden[name=page]").val();
                            alert("�ıⰡ �����Ǿ����ϴ�.");
                            goPage(pageNo);
                            $("#oReviewManageForm textarea[name=contents]").val("");
                        } else {
                            alert("������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���.");
                        }
                    }
                ,   complete : function(arg1, arg2) {
                        // alert("complete : " + arg1);
                    }
                ,   error :  function(XMLHttpRequest, textStatus, errorThrown) {
                        // alert("error : " + errorThrown);
                        alert("������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���.");
                    }
            });
        }
    }

    /**
     * �ı⸦ �����Ѵ�.
     */
    function fnDeleteReview(idx) {
        $("#oReviewManageForm input:hidden[name=process]").val("deleteReview");

        var param = $("#oReviewManageForm").serialize();

        if (confirm("�ı⸦ �����Ͻðڽ��ϱ�?")) {

            $.ajaxSetup({cache:false});
            $.ajax({
                    type : "post"
                ,   url : "/servlet/controller.mobile.onlineclass.OnlineClassReviewServlet"
                ,   dataType : "json"
                ,   data : param
                ,   success : function (data) {
                        $('[data-dismiss="modal"]').trigger("click");
                        if ( data.resultCnt > 0 ) {
                            var pageNo = $("#oReviewManageForm input:hidden[name=page]").val();
                            goPage(pageNo);
                            alert("�ıⰡ �����Ǿ����ϴ�.");
                            $("#oReviewManageForm textarea[name=contents]").val("");
                        } else {
                            alert("������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���.");
                        }
                    }
                ,   complete : function(arg1, arg2) {
                        // alert("complete : " + arg1);
                    }
                ,   error :  function(XMLHttpRequest, textStatus, errorThrown) {
                        // alert("error : " + errorThrown);
                        alert("������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���.");
                    }
            });
        }
    }

    /**
     * �ı⸦ �����Ѵ�.
     */
    function fnCloseRegisterPopup() {
        $("[data-dismiss=\"modal\"]").trigger("click");
    }

</script>
<!-- container-new ���� //-->
<div id="container-new">
    <!-- �¶��� ���� -->
    <div id="mainMenu">
        <ul class="location">
            <li>���θ޴�</li>
            <li>�¶��� ���ǽ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage" class="active">�¶��� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage">���屳�� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=MINE" >�����ۼ��� ��</a></li>
                    <li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage">��㳻��</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate">��������</a></li>
                    <!-- 2015-01-09 ���� ����
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList">�����ȳ�</a></li>
                    <li><a href="#">Ŀ�´�Ƽ</a></li>
                    //-->
                </ul>
            </li>
        </ul>

        <!-- ������ο� -->
        <div class="introCategory">
            <ul>
                <!-- <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage"><strong><u>���� ���ǽ�</u></strong></a></li> //-->
                <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">���� ���ǽ�</a></li>
                <li><a href="/servlet/controller.study.FavorOpenClassServlet?p_process=favorOpenClassList" >����</a></li>
                <li><a href="/servlet/controller.research.SulmunSubjUserServlet?p_process=SulmunNew" >����</a></li>
                <li><a href="/servlet/controller.study.ProposeReviewServlet?p_process=selectReviewList" ><strong><u>�����ı�</u></strong></a></li>
                <!-- 2015-01-09 ���� ����
                <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList">�����ȳ�</a></li>
                <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage">Ŀ�´�Ƽ</a></li>
                //-->
            </ul>
        </div>
        <!-- //������ο� -->
        <!-- //�¶��� ���� -->
    </div>

    <!-- ������ ���� ���� -->
    <div id="contents">
        <h2 class="subTit">�����ı�</h2>

        <div id="subCont" class="myClass">

            <div class="tableWrap2 noclose">
                <table id="oReviewTable" class="layoutTable3 space3" summary="��ǥ�� ���� ���ǽ� �����ı� ǥ�� ��ȣ, �з�, ������, �ı� ���� ��ư���� �����Ǿ� �ֽ��ϴ� ">
                    <caption>�ı� ��� ������ ���� ���</caption>
                    <colgroup>
                        <col width="80"/>
                        <col width="13%"/>
                        <col width="65%"/>
                        <col width="106"/>
                        <col width="106"/>
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">��ȣ</th>
                        <th scope="col">�з�</th>
                        <th scope="col">������</th>
                        <th scope="col">�ı�</th>
                    </tr>
                    </thead>
                    <tbody>

<%
        if(reviewList.size() != 0){
            DataBox dbox = null;
            for(int i = 0; i < reviewList.size(); i++) {
                dbox = (DataBox)reviewList.get(i);
                subj = dbox.getString("d_subj");
                subjNm = dbox.getString("d_subjnm");
                // v_appdate = dbox.getString("d_appdate");
                // v_appdate = FormatDate.getFormatDate(v_appdate,"yyyy.MM.dd");
                num = dbox.getInt("d_num");
                point = dbox.getInt("d_point");
                contents = dbox.getString("d_contents");
                areaNm = dbox.getString("d_codenm");
                reviewYn = dbox.getString("d_review_yn");

                dispNum = dbox.getInt("d_dispNum");
                totalRowCount = dbox.getInt("d_tot_cnt");
                totalPage = dbox.getInt("d_totalPage");
%>
                        <tr id="oReviewContents<%= i %>" name="reviewContents">
                            <td class="first"><%= dispNum %></td>
                            <td><%= areaNm %></td>
                            <td><%= subjNm %></td>
                            <td>
<%
        if ( reviewYn.equals("N") ) {
%>
                                <span class="btnBlue"><a href="javascript:fnManageReview('<%= subj %>', <%= num %>, <%= point %>, 'R');">���</a></span>
<%
        } else {
%>
                                <span class="btnPink"><a href="javascript:fnManageReview('<%= subj %>', <%= num %>, <%= point %>, 'M');">����</a></span>
                                <input type="hidden" id="oContentsText_<%= subj %>" name="contentsText" value="<%= contents %>" />
<%
        }
%>
                            </td>
                        </tr>
<%
            }
        } else {
%>
                        <tr>
                            <td colspan="4" style="border-left: none;">������û�� �̷��� �����ϴ�.</td>
                        </tr>
<%
        }
%>
                    </tbody>
                </table>
            </div>
            <!-- //tableWrap2 -->
            <div class="paging" id="oPagingArea">
                <%= PageUtil.re2013_printPageListDiv(totalPage, pageNo, 5, pageSize, totalRowCount) %>
            </div>
            <!-- //paging -->
        </div>
        <!-- //#subCont -->
    </div>
</div>
<!--  //container-new �� //-->

<div data-toggle="modal" data-target="#sample" style="display:none;"></div>

<!--  // ��� �˾� ����//-->
<form id="oReviewManageForm" name="reviewManageForm">
    <input type="hidden" name="process" value="" />
    <input type="hidden" name="subj" value="" />
    <input type="hidden" name="num" value="" />
    <input type="hidden" name="page" value="" />
<div id="sample" class="modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <button type="button" data-dismiss="modal" class="modal-close">X</button>
            <div class="header">
                <h4>�ı�</h4>
            </div>
            <div class="modal-review-star">
                <strong>�����ֱ� :</strong>
				<label><input type="radio" id="oPoint5" name="point" value="5" /> <img src="/images/common/icon-star5.png" alt="������ 5��"></label>
				<label><input type="radio" id="oPoint4" name="point" value="4" /> <img src="/images/common/icon-star4.png" alt="������ 4��"></label>
				<label><input type="radio" id="oPoint3" name="point" value="3" /> <img src="/images/common/icon-star3.png" alt="������ 3��"></label>
				<label><input type="radio" id="oPoint2" name="point" value="2" /> <img src="/images/common/icon-star2.png" alt="������ 2��"></label>
				<label><input type="radio" id="oPoint1" name="point" value="1" /> <img src="/images/common/icon-star1.png" alt="������ 1��"></label>
            </div>
            <textarea class="modal-review-textarea" placeholder="�ִ� 500byte���� �ۼ������ϸ�, �弳�̳� ������ ������ �� �ֽ��ϴ�." maxlength="500" id="oContents" name="contents"></textarea>
            <div class="footer">
                <button type="button" class="modal-btn modal-btn-default" onclick="">Ȯ��</button>
                <button type="button" class="modal-btn modal-btn-default" onclick="">���</button>
            </div>
        </div>
    </div>
</div>
</form>
<!--  // ��� �˾� �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>
