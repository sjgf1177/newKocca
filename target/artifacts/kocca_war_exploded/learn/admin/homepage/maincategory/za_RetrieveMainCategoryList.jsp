<%
//**********************************************************
// 1. ���ϸ� : za_RetrieveMainCategoryList.jsp
// 2. ���α׷��� : Ȩ������ ����ȭ�� �α�/��õ �׸� ��� ��ȸ
// 3. ���� : Ȩ������ ����ȭ�� �α�/��õ ������ ǥ�õǴ� ī�װ� ����� ��ȸ�Ѵ�.
// 4. ȯ��: JDK 1.5
// 5. ����: 1.0
// 6. �ۼ� : 2015-01-27
// 7. ���� �̷� :
//          2015-01-27 ���� �ۼ�
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

    ArrayList<DataBox> mainCategoryList = (ArrayList<DataBox>)request.getAttribute("mainCategoryList");

    String process = box.getString("process");
    String searchCategoryNm = box.getString("searchCategoryNm");
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
<title>��� - ���� �α�/��õ ���� - Ȩ������ - ������ - �ѱ���������ī����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="text/javascript" src="/js/jquery/1.11.1/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
<!--
    /**
     * ���ȭ������ �̵�
     */
    function fnGoToRegisterPage() {
        location.href = "/learn/admin/homepage/maincategory/za_RegisterMainCategoryPage.jsp";
    }

    function fnViewMainCategoryPage( categorySeq ) {
        $("#oCategorySeq").val(categorySeq);
        $("#oSearchProcess").val("retrieveInfo");
        $("#oMainCategorySearchForm").attr("action","/servlet/controller.admin.homepage.MainCategoryServlet").submit();
    }

    /**
     * ������ �̵�
     * @param pageNo �̵��� ������ ��ȣ
     */
    function goPage( pageNo ) {
        $("#oPageNo").val(pageNo);
        $("#oSearchProcess").val("retrieveList");
        $("#oMainCategorySearchForm").attr("action","/servlet/controller.admin.homepage.MainCategoryServlet").submit();
    }

    /**
     * �� ȭ�鿡 ������ ����� ũ�⸦ �����Ѵ�.
     * @param pSize ������ ũ��
     */
    function pagesize( pSize ) {
        $("#oPageSize").val(pSize);
        goPage(1);
    }

    /**
     * �˻��������� ��ȸ
     */
    function fnSearchMainCategoryList() {
        $("#oMainCategorySearchForm").attr("action","/servlet/controller.admin.homepage.MainCategoryServlet").submit();
    }

    /**
     * ī�װ��� ���� ��� ���� ȭ������ �̵��Ѵ�.
     * @pararm categorySeq ī�װ� �Ϸù�ȣ
     */
    function fnManageMainCategoryPage(categorySeq, categoryNm, categoryType, categoryTypeNm, layoutType) {
        $("#oManageProcess").val("retrieveList");
        $("#oManageCategorySeq").val(categorySeq);
        $("#oManageCategoryNm").val(categoryNm);
        $("#oManageCategoryType").val(categoryType);
        $("#oManageCategoryTypeNm").val(categoryTypeNm);
        $("#oManageLayoutType").val(layoutType);
        $("#oManageForm").attr("action", "/servlet/controller.admin.homepage.MainCategoryDetailServlet").submit();
    }

    /**
     * ��뿩�θ� �ϰ� �����Ѵ�. �ִ� ������ ��� �Ǽ��� 6���̴�.
     */
    function fnApplyUseYn() {
        var len = $("select[name=categoryUseYn]").length;
        var applyCnt = 0;

        for ( var i = 0 ; i < len ; i++ ) {
            if ( $("select[name=categoryUseYn]").eq(i).val().indexOf("Y") > -1 ) {
                applyCnt++;
            }
        }

        if ( applyCnt > 6 ) {
            alert("��� ������ �ִ� ������ 6���Դϴ�.");
            return;
        } else if ( confirm("��� ���θ� �����Ͻðڽ��ϱ�?") ) {
            $("#oCategoryListProcess").val("updateUseYn");
            $("#oCategoryListForm").attr("action", "/servlet/controller.admin.homepage.MainCategoryServlet");
            $("#oCategoryListForm").submit();
        } else {
            return;
        }
    }
//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

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
            <h3 style="text-align:left; padding-left:16px">* ���� ī�װ� ����</h3>
            <!-- form ���� //-->
            <form id="oMainCategorySearchForm" name="mainCategorySearchForm" method="post">
                <input type="hidden" id="oSearchProcess" name="process" value="<%= process %>" />
                <input type="hidden" id="oPageNo" name="pageNo" value="<%= pageNo %>" />
                <input type="hidden" id="oPageSize" name="pageSize" value="<%= pageSize %>" />
                <input type="hidden" id="oCategorySeq" name="categorySeq" value="" />
            <table border="0" cellpadding="0" cellspacing="0" class="searchTable">
                <colgroup>
                    <col style="width:12%;" />
                    <col style="width:*;" />
                    <col style="width:20%;" />
                </colgroup>
                <tr>
                    <th scope="cols">ī�װ��� : </th>
                    <td style="padding:4px;"><input type="text" id="oSearchCategoryNm" name="searchCategoryNm" style="width:520px;" value="<%= searchCategoryNm %>" /></td>
                    <td rowspan="2" style="text-align:center;"><a href="javascript:fnSearchMainCategoryList();"><img src="/images/admin/button/btn_inquiry.gif" border="0"></a></td>
                </tr>
                <tr>
                    <th scope="cols">��뿩�� : </th>
                    <td style="padding:4px;">
                        <label><input type="radio" id="oSearchUseYnAll" name="searchUseYn" value="A" <%= searchUseYn.equals("A") ? "checked=\"checked\"" : ""%> />��ü</label>
                        <label><input type="radio" id="oSearchUseYnY" name="searchUseYn" value="Y" <%= searchUseYn.equals("Y") ? "checked=\"checked\"" : ""%> />���</label>
                        <label><input type="radio" id="oSearchUseYnN" name="searchUseYn" value="N" <%= searchUseYn.equals("N") ? "checked=\"checked\"" : ""%> />�̻��</label>
                    </td>
                </tr>
            </table>
            </form>
            <!-- form �� //-->
            <br/>
            <!-- ��ư ���� //-->
            <table class="table1" cellspacing="1" cellpadding="5">
                <tr>
                    <td style="width:100%; text-align:right;">
                        <a class="board_btn" onclick="fnApplyUseYn();"><span style="font-size:12px;">��뿩�� ����</span></a>
                        <a class="board_btn2" onclick="fnGoToRegisterPage();"><span style="font-size:12px;">ī�װ� ���</span></a>
                    </td>
                </tr>
            </table>
            <!-- ��ư �� //-->

            <!-- ���  ���� //-->
            <form id="oCategoryListForm" name="categoryListForm" method="post">
                <input type="hidden" id="oCategoryListProcess" name="process" value="" />
            <table class="table_out" cellspacing="1" cellpadding="5">
                <colgroup>
                    <col style="width:6%;" />
                    <col style="width:*;" />
                    <col style="width:16%;" />
                    <col style="width:12%;" />
                    <col style="width:7%;" />
                    <col style="width:9%;" />
                    <col style="width:7%;" />
                    <col style="width:12%;" />
                </colgroup>

                <tr>
                    <td colspan="8" class="table_top_line" style="height:2px;"></td>
                </tr>
                <tr>
                    <th class="table_title" height="25">NO</th>
                    <th class="table_title">ī�װ���</th>
                    <th class="table_title">ī�װ� Ÿ��</th>
                    <th class="table_title">���̾ƿ� Ÿ��</th>
                    <th class="table_title">����</th>
                    <th class="table_title">��ϰ��� ��</th>
                    <th class="table_title">��뿩��</th>
                    <th class="table_title">�������</th>
                </tr>

<%
    String btnClassName = "";
    String btnTitle = "";

    if ( mainCategoryList != null && mainCategoryList.size() > 0 ) {
        DataBox dbox = null;
        for( int i = 0 ; i < mainCategoryList.size() ; i++ ){
            dbox = (DataBox)mainCategoryList.get(i);

            if ( dbox.getString("d_category_type").indexOf("B_") > -1 ) {
                btnClassName = dbox.getInt("d_reg_item_cnt") == 0 ? "btn_violet" : "board_green";
                btnTitle = dbox.getInt("d_reg_item_cnt") == 0 ? "&nbsp;�� ����&nbsp;" : "&nbsp;�� ����&nbsp;";
            } else {
                btnClassName = dbox.getInt("d_reg_item_cnt") == 0 ? "btn_violet" : "board_green";
                btnTitle = dbox.getInt("d_reg_item_cnt") == 0 ? "���� ���" : "���� ����";
            }

%>
                <tr>
                    <td class="table_01"><%= dbox.getInt("d_dispNum") %></td>
                    <td class="table_02_2"><a href="javascript:fnViewMainCategoryPage(<%= dbox.getInt("d_category_seq") %>);"><%= dbox.getString("d_category_nm") %></a></td>
                    <td class="table_02_1"><%= dbox.getString("d_category_type_nm") %></td>
                    <td class="table_02_1"><%= dbox.getString("d_layout_type") %></td>
                    <td class="table_02_1"><%= dbox.getString("d_sort_order") %></td>
                    <td class="table_02_1"><%= dbox.getInt("d_reg_item_cnt") %></td>
                    <td class="table_02_1">
                        <select id="oCategoryUseYn_<%= dbox.getInt("d_category_seq") %>" name="categoryUseYn">
                            <option value="<%= dbox.getInt("d_category_seq") %>|Y" <%= dbox.getString("d_use_yn").equals("Y") ? "selected=\"selected\"" : "" %>>Y</option>
                            <option value="<%= dbox.getInt("d_category_seq") %>|N" <%= dbox.getString("d_use_yn").equals("N") ? "selected=\"selected\"" : "" %>>N</option>
                        </select>
                    </td>
                    <td class="table_02_1"><a class="<%= btnClassName %>" onclick="fnManageMainCategoryPage(<%= dbox.getInt("d_category_seq") %>, '<%= dbox.getString("d_category_nm") %>', '<%= dbox.getString("d_category_type") %>', '<%= dbox.getString("d_category_type_nm") %>', '<%= dbox.getString("d_layout_type") %>');"><span><%= btnTitle %></span></a></td>
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
            <!-- ��� �� //-->

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
    <input type="hidden" id="oManageCategorySeq" name="categorySeq" value="" />
    <input type="hidden" id="oManageCategoryNm" name="categoryNm" value="" />
    <input type="hidden" id="oManageCategoryType" name="categoryType" value="" />
    <input type="hidden" id="oManageCategoryTypeNm" name="categoryTypeNm" value="" />
    <input type="hidden" id="oManageLayoutType" name="layoutType" value="" />
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
