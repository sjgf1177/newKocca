<%
//**********************************************************
// 1. ���ϸ� : za_RetrieveMainCategoryDetailListA.jsp
// 2. ���α׷��� : Ȩ������ ����ȭ�� �α�/��õ �׸��� ���� ��� ���� ��� ��ȸ
// 3. ���� : Ȩ������ ����ȭ�� �α�/��õ ������ ǥ�õǴ� ī�װ��� ���� ��� ���� ����� ��ȸ�Ѵ�. ���԰���, �������¸� ��ȸ �� �����Ѵ�.
// 4. ȯ�� : JDK 1.5
// 5. ���� : 1.0
// 6. �ۼ� : 2015-02-03
// 7. ���� �̷� :
//      7.1. 2015-02-03 ���� �ۼ�
//***********************************************************
%>
<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page errorPage="/learn/library/error.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.credu.library.DataBox" %>
<%@ page import="com.credu.library.RequestBox" %>
<%@ page import="com.credu.library.RequestManager" %>
<%@ page import="com.credu.library.PageUtil" %>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    ArrayList<DataBox> mainCategoryDetailList = (ArrayList<DataBox>)request.getAttribute("mainCategoryDetailList");

    String process = box.getString("process");
    int categorySeq = box.getInt("categorySeq");
    String categoryNm = box.getString("categoryNm");
    String categoryType = box.getString("categoryType");
    String categoryTypeNm = box.getString("categoryTypeNm");
    String layoutType = box.getString("layoutType");
    String searchItemNm = box.getString("searchItemNm");
    String searchUseYn = box.getString("searchUseYn");

    int pageNo = box.getInt("pageNo");
    int pageSize = box.getInt("pageSize");
    int totalPage = 0;
    int totalRowCount = 0;
    int dispNum = 0;

    pageNo = pageNo == 0 ? 1 : pageNo;
    pageSize = pageSize == 0 ? 10 : pageSize;
%>
<!DOCTYPE html>
<html>
<head>
<title>��� - ���� �α�/��õ ���� ���� ���� - Ȩ������ - ������ - �ѱ���������ī����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="text/javascript" src="/js/jquery/1.11.1/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
<!--

    /**
     * ���� ��� ȭ������ �̵�
     */
    function fnGoToRegisterPage() {
        $("#oManageProcess").val("registerPage");
        $("#oManageForm").attr("action", "/servlet/controller.admin.homepage.MainCategoryDetailServlet").submit();
    }

    /**
     * ������ϰ����� ��ȭ������ �̵��Ѵ�.
     * @param seq - ������ϰ��� �Ϸù�ȣ
     */
    function fnViewMainCategoryDetailPage( seq ) {
        $("#oManageProcess").val("retrieveInfo");
        $("#oManageSeq").val(seq);
        $("#oManageForm").attr("action","/servlet/controller.admin.homepage.MainCategoryDetailServlet").submit();
    }

    /**
     * ������ �̵�
     */
    function goPage( pageNo ) {
        $("#oPageNo").val(pageNo);
        $("#oProcess").val("retrieveList");
        $("#oSearchForm").attr("action","/servlet/controller.admin.homepage.MainCategoryDetailServlet").submit();
    }

    /**
     *
     */
    function pagesize( pSize ) {
        $("#oPageSize").val(pSize);
        goPage(1);
    }

    /**
     *
     */
    function fnSearchMainCategoryDetailList() {
        $("#oSearchForm").attr("action","/servlet/controller.admin.homepage.MainCategoryDetailServlet").submit();
    }

    /**
     * ����ī�װ� ��� ȭ������ �̵��Ѵ�.
     */
    function fnGoMainCategoryList() {
        $("#oManageProcess").val("retrieveList");
        $("#oManageForm").attr("action","/servlet/controller.admin.homepage.MainCategoryServlet").submit();
    }

    /**
     *
     */
    function fnApplyUseYn() {
        var len = $("select[name=itemUseYn]").length;
        var applyCnt = 0;
        var maxRegCnt = <%= layoutType.equals("A") ? 5 : 4 %>;

        for ( var i = 0 ; i < len ; i++ ) {
            if ( $("select[name=itemUseYn]").eq(i).val().indexOf("Y") > -1 ) {
                applyCnt++;
            }
        }

        if ( applyCnt > maxRegCnt ) {
            alert("��� ������ �ִ� ������ " + maxRegCnt + "���Դϴ�.");
            return;
        } else if ( confirm("��� ���θ� �����Ͻðڽ��ϱ�?") ) {
            $("#oItemListProcess").val("updateUseYn");
            $("#oItemListForm").attr("action", "/servlet/controller.admin.homepage.MainCategoryDetailServlet");
            $("#oItemListForm").submit();
        } else {
            return;
        }
    }

//-->
</script>
</head>

<body bgcolor="#ffffff" text="#000000" topmargin="0" leftmargin="0">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" valign="top">
            <!-- title ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
                <tr>
                    <td style="background-color:#fff; width:240px; font-size:20px; font-weight:bold;">���� �α�/��õ ����</td>
                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
                </tr>
            </table>
            <!-- title �� //-->

            <br/>
            <h3 style="text-align:left; padding-left:16px">* ���� ���� ��� - ���԰���/�������� ����</h3>

            <!-- �˻� form ���� //-->
            <form id="oSearchForm" name="searchForm" method="post">
                <input type="hidden" id="oProcess" name="process" value="retrieveList" />
                <input type="hidden" id="oPageNo" name="pageNo" value="<%= pageNo %>" />
                <input type="hidden" id="oPageSize" name="pageSize" value="<%= pageSize %>" />
                <input type="hidden" id="oCategorySeq" name="categorySeq" value="<%= categorySeq %>" />
                <input type="hidden" id="oCategoryNm" name="categoryNm" value="<%= categoryNm %>" />
                <input type="hidden" id="oCategoryType" name="categoryType" value="<%= categoryType %>" />
                <input type="hidden" id="oCategoryTypeNm" name="categoryTypeNm" value="<%= categoryTypeNm %>" />
                <input type="hidden" id="oLayoutType" name="layoutType" value="<%= layoutType %>" />

                <!-- �ڷΰ��� ��ư ���� //-->
                <table class="table1" cellspacing="1" cellpadding="5">
                    <tr>
                        <td style="width:100%; text-align:right;"><a class="board_btn" onclick="fnGoMainCategoryList();"><span style="font-size:12px;">&lt;&lt; �ڷΰ���</span></a></td>
                    </tr>
                </table>
                <!-- �ڷΰ��� ��ư �� //-->

                <table border="0" cellpadding="0" cellspacing="0" class="searchTable">
                    <colgroup>
                        <col style="width:12%;" />
                        <col style="width:32%;" />
                        <col style="width:12%;" />
                        <col style="width:32%;" />
                        <col style="width:12%;" />
                    </colgroup>
                    <tr>
                        <th scope="cols">ī�װ��� </th>
                        <td style="padding:4px;"><%= categoryNm %></td>
                        <th scope="cols">���̾ƿ� Ÿ�� </th>
                        <td style="padding:4px;"><%= layoutType %> Ÿ��</td>
                        <td rowspan="4" style="text-align:center;"><a href="javascript:fnSearchMainCategoryDetailList();"><img src="/images/admin/button/btn_inquiry.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <th scope="cols">ī�װ� Ÿ��</th>
                        <td colspan="3" style="padding:4px;"><%= categoryTypeNm %></td>
                    </tr>
                    <tr>
                        <th scope="cols">������ </th>
                        <td colspan="3" style="padding:4px;"><input type="text" id="oSearchItemNm" name="searchItemNm" style="width:520px;" value="<%= searchItemNm %>" /></td>
                    </tr>
                    <tr>
                        <th scope="cols">��뿩�� </th>
                        <td colspan="3" style="padding:4px;">
                            <label><input type="radio" id="oSearchUseYnAll" name="searchUseYn" value="A" <%= searchUseYn.equals("A") ? "checked=\"checked\"" : ""%> />��ü</label>
                            <label><input type="radio" id="oSearchUseYnY" name="searchUseYn" value="Y" <%= searchUseYn.equals("Y") ? "checked=\"checked\"" : ""%> />���</label>
                            <label><input type="radio" id="oSearchUseYnN" name="searchUseYn" value="N" <%= searchUseYn.equals("N") ? "checked=\"checked\"" : ""%> />�̻��</label>
                        </td>
                    </tr>
                </table>
            </form>
            <!-- �˻� form �� //-->
            <br/>
            <!-- �����߰� ��ư ���� //-->
            <table class="table1" cellspacing="1" cellpadding="5">
                <tr>
                    <td style="width:100%; text-align:right;">
                        <a class="board_btn" onclick="fnApplyUseYn();"><span style="font-size:12px;">��뿩�� ����</span></a>
                        <a class="board_btn" onclick="fnGoToRegisterPage();"><span style="font-size:12px;">�����߰�</span></a>
                    </td>
                </tr>
            </table>
            <!-- �����߰� ��ư �� //-->

            <!-- ���� ��ϵ� ���� ���  ���� //-->
            <form id="oItemListForm" name="itemListForm" method="post">
                <input type="hidden" id="oItemListProcess" name="process" value="" />
                <input type="hidden" id="oItemListPageNo" name="pageNo" value="<%= pageNo %>" />
                <input type="hidden" id="oItemListPageSize" name="pageSize" value="<%= pageSize %>" />
                <input type="hidden" id="oItemListCategorySeq" name="categorySeq" value="<%= categorySeq %>" />
                <input type="hidden" id="oItemListCategoryNm" name="categoryNm" value="<%= categoryNm %>" />
                <input type="hidden" id="oItemListCategoryType" name="categoryType" value="<%= categoryType %>" />
                <input type="hidden" id="oItemListCategoryTypeNm" name="categoryTypeNm" value="<%= categoryTypeNm %>" />
                <input type="hidden" id="oItemListLayoutType" name="layoutType" value="<%= layoutType %>" />
            <table class="table_out" cellspacing="1" cellpadding="5">
                <colgroup>
                    <col style="width:12%;" />
                    <col style="width:*;" />
                    <col style="width:16%;" />
                    <col style="width:16%;" />
                </colgroup>

                <tr>
                    <td colspan="4" class="table_top_line" style="height:2px;"></td>
                </tr>
                <tr>
                    <th class="table_title" height="25">NO</th>
                    <th class="table_title">������</th>
                    <th class="table_title">����</th>
                    <th class="table_title">��뿩��</th>
                </tr>

<%
    if ( mainCategoryDetailList != null && mainCategoryDetailList.size() > 0 ) {
        DataBox dbox = null;
        for( int i = 0 ; i < mainCategoryDetailList.size() ; i++ ){
            dbox = (DataBox)mainCategoryDetailList.get(i);
%>
                <tr>
                    <td class="table_01"><%= dbox.getInt("d_dispNum") %></td>
                    <td class="table_02_2"><a href="javascript:fnViewMainCategoryDetailPage(<%= dbox.getInt("d_seq") %>);"><%= dbox.getString("d_item_nm") %></a></td>
                    <td class="table_02_1"><%= dbox.getString("d_position_num") %></td>
                    <td class="table_02_1">
                        <select id="oItemUseYn_<%= dbox.getInt("d_seq") %>" name="itemUseYn">
                            <option value="<%= dbox.getInt("d_seq") %>|Y" <%= dbox.getString("d_use_yn").equals("Y") ? "selected=\"selected\"" : "" %>>Y</option>
                            <option value="<%= dbox.getInt("d_seq") %>|N" <%= dbox.getString("d_use_yn").equals("N") ? "selected=\"selected\"" : "" %>>N</option>
                        </select>
                    </td>
                </tr>
<%
            totalPage = dbox.getInt("d_totalPage");
            totalRowCount = dbox.getInt("d_totalRowCount");
        }
    } else {
%>
                <tr>
                    <td class="table_01" colspan="8" align="center">��ȸ�� ����� �����ϴ�.</td>
                    <!-- <td class="table_02_1"></td> //-->
                </tr>
<%
    }
%>
            </table>
            </form>
            <!-- ���� ��ϵ� ���� ��� �� //-->

            <!-- paging ���� //-->
            <br/>
            <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="right" valign="absmiddle">
                        <%= PageUtil.printPageSizeList(totalPage, pageNo, 0, pageSize, totalRowCount) %>
                    </td>
                </tr>
            </table>
            <!-- paging �� //-->
        </td>
    </tr>
</table>

<form id="oManageForm" name="manageForm" method="post">
    <input type="hidden" id="oManageProcess" name="process" value="" />
    <input type="hidden" id="oManageSeq" name="seq" value="" />
    <input type="hidden" id="oManageCategorySeq" name="categorySeq" value="<%= categorySeq %>" />
    <input type="hidden" id="oManageCategoryNm" name="categoryNm" value="<%= categoryNm %>" />
    <input type="hidden" id="oManageCategoryType" name="categoryType" value="<%= categoryType %>" />
    <input type="hidden" id="oManageCategoryTypeNm" name="categoryTypeNm" value="<%= categoryTypeNm %>" />
    <input type="hidden" id="oManageLayoutType" name="layoutType" value="<%= layoutType %>" />
    <input type="hidden" id="oManagePositionNum" name="positionNum" value="" />
</form>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
