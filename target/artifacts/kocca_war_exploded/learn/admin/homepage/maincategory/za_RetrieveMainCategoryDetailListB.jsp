<%
//**********************************************************
// 1. ���ϸ� : za_RetrieveMainCategoryDetailListB.jsp
// 2. ���α׷��� : Ȩ������ ����ȭ�� �α�/��õ �׸��� ���� ��� ���� ��� ��ȸ. 
// 3. ���� : Ȩ������ ����ȭ�� �α�/��õ ������ ǥ�õǴ� ī�װ��� ���� ��� ���� ����� ��ȸ�Ѵ�. �Խ��� ����(��ī���� �̾߱�, CMU)�� ��ȸ �� �����Ѵ�.
// 4. ȯ�� : JDK 1.5
// 5. ���� : 1.0
// 6. �ۼ� : 2015-02-24
// 7. ���� �̷� :
//      7.1. 2015-02-24 ���� �ۼ�
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
    String searchType = box.getString("searchType");
    String searchNm = box.getString("searchNm");
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
<style>
    .contentsPopup { display:none; width:966px; height:585px; background:#fff; color:#000; position:fixed; top:102px; left:15px; text-align:center; border:2px solid #000; }
    #oClosePopup { position:absolute; top:6px; left:927px; width:24px; cursor:pointer; border:1px solid #000; font-weight:bold;}
    #oContents { position:absolute; top:34px; left:14px; width:97%; height:92%; border:1px solid #000; overflow:hidden; overflow-y:scroll;}
</style>

<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="text/javascript" src="/js/jquery/1.11.1/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
<!--
    $(function() {
        $("#oClosePopup").click( function() {
            $("#oContentsPopup").hide();
        });
    });

    /**
     * �Խù� ������ ��ȸ�Ѵ�.
     * @param seq - �Խù� �Ϸù�ȣ
     */
    function fnViewContents( categoryType, seq ) {
        var param = "process=viewBoardContents&categoryType=" + categoryType + "&seq=" + seq;

        $.ajaxSetup({cache:false});
        $.ajax({
                type : "post"
            ,   url : "/servlet/controller.admin.homepage.MainCategoryDetailServlet"
            ,   dataType : "json"
            ,   data : param
            ,   success : function (data) {

                    $("#oTitle").html(data.contents.d_title);
                    $("#oContents").html(data.contents.d_cont);
                    $("#oContentsPopup").show();
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
     * ���α� ���� ���θ� �����Ѵ�.
     * @param flag - Y/N
     */
    function fnSetMainCategoryItem() {
        var applyCnt = $("input:checkbox[name=mainYn]:checked").length;
        var maxRegCnt = <%= layoutType.equals("A") ? 5 : 4 %>;

        
        if(applyCnt == 0) {
            alert("���α۷� ������ �Խù��� �����Ͻʽÿ�.");
            return;
        } else if ( applyCnt > maxRegCnt ) {
            alert("��� ������ �ִ� ������ " + maxRegCnt + "���Դϴ�.");
            return;
        } else if ( confirm("���õ� �Խù��� ���α۷� �����Ͻðڽ��ϱ�?") ) {

        	var console = window.console || {log:function(){}}; 
        	
            $("input:checkbox[name=mainYn]:checked").each( function() {
                console.log("checked value : " + $(this).val());
            });

            $("#oItemListProcess").val("updateMainItem");
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
            <h3 style="text-align:left; padding-left:16px">* ���� ���� ��� - �Խ��� ����</h3>

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
                        <th scope="cols">��뿩�� </th>
                        <td colspan="3" style="padding:4px;">
                            <label><input type="radio" id="oSearchUseYnAll" name="searchUseYn" value="A" <%= searchUseYn.equals("A") ? "checked=\"checked\"" : ""%> />��ü</label>
                            <label><input type="radio" id="oSearchUseYnY" name="searchUseYn" value="Y" <%= searchUseYn.equals("Y") ? "checked=\"checked\"" : ""%> />���</label>
                            <label><input type="radio" id="oSearchUseYnN" name="searchUseYn" value="N" <%= searchUseYn.equals("N") ? "checked=\"checked\"" : ""%> />�̻��</label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="cols">
                            <select id="oSearchType" name="searchType">
                                <option value="title" <%= searchType.equals("title") ? "selected=\"selected\"" : "" %>>����</option>
                                <option value="cont" <%= searchType.equals("cont") ? "selected=\"selected\"" : "" %>>����</option>
                            </select>
                        </th>
                        <td colspan="3" style="padding:4px;"><input type="text" id="oSearchNm" name="searchNm" style="width:520px;" value="<%= searchNm %>" /></td>
                    </tr>
                </table>
            </form>
            <!-- �˻� form �� //-->
            <br/>
            <!-- �����߰� ��ư ���� //-->
            <table class="table1" cellspacing="1" cellpadding="5">
                <tr>
                    <td style="width:100%; text-align:right;">
                        <a class="board_btn" onclick="fnSetMainCategoryItem();"><span style="font-size:12px;">���α� ����</span></a>
                        <!-- <a class="board_btn" onclick="fnSetMainCategoryItem('N');"><span style="font-size:12px;">���α� ���</span></a> //-->
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
                    <col style="width:8%;" />
                    <col style="width:*;" />
                    <col style="width:10%;" />
                    <col style="width:10%;" />
                    <col style="width:10%;" />
                    <col style="width:10%;" />
                </colgroup>

                <tr>
                    <td colspan="6" class="table_top_line" style="height:2px;"></td>
                </tr>
                <tr>
                    <th class="table_title" height="25">NO</th>
                    <th class="table_title">����</th>
                    <th class="table_title">�ۼ���</th>
                    <th class="table_title">�����</th>
                    <th class="table_title">��뿩��</th>
                    <th class="table_title">����</th>
                </tr>

<%
    if ( mainCategoryDetailList != null && mainCategoryDetailList.size() > 0 ) {
        DataBox dbox = null;
        for( int i = 0 ; i < mainCategoryDetailList.size() ; i++ ){
            dbox = (DataBox)mainCategoryDetailList.get(i);
%>
                <tr>
                    <td class="table_01"><%= dbox.getInt("d_dispNum") %></td>
                    <td class="table_02_2"><a href="javascript:fnViewContents('<%= categoryType %>', <%= dbox.getInt("d_seq") %>);"><%= dbox.getString("d_title") %></a></td>
                    <td class="table_02_1"><%= dbox.getString("d_reg_id") %></td>
                    <td class="table_02_1"><%= dbox.getString("d_reg_dt") %></td>
                    <td class="table_02_1"><%= dbox.getString("d_use_yn") %></td>
                    <td class="table_02_1"><input type="checkbox" id="oMainYn<%= i %>" name="mainYn" <%= dbox.getString("d_main_yn").equals("Y") ? "checked=\"checked\"" : "" %> value="<%= dbox.getString("d_seq")%>" /></td>
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

<div id="oContentsPopup" class="contentsPopup">
    <div id="oTitle" style="padding: 8px 0 0 15px; font-weight:bold; text-align:left;">���뺸��</div>
    <div id="oClosePopup">X</div>
    <div id="oContents">����� ������ ���ɴϴ�.</div>
</div>

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
