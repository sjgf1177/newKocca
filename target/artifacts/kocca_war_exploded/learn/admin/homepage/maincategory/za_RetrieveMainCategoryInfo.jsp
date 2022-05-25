<%
//**********************************************************
// 1. ���ϸ� : za_RetrieveMainCategoryInfo.jsp
// 2. ���α׷��� : Ȩ������ ����ȭ�� �α�/��õ �׸� ��� ȭ��
// 3. ���� : Ȩ������ ����ȭ�� �α�/��õ ������ ǥ�õǴ� ī�װ� �׸� ������ ��ȸ�ϴ� �������̴�.
// 4. ȯ��: JDK 1.5
// 5. ����: 1.0
// 6. �ۼ� : 2015-01-29
// 7. ���� �̷� :
//          2015-01-29 ���� �ۼ�
//***********************************************************
%>

<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page errorPage="/learn/library/error.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.credu.library.DataBox" %>
<%@ page import="com.credu.library.RequestBox" %>
<%@ page import="com.credu.library.RequestManager" %>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    DataBox mainCategoryInfo = (DataBox)request.getAttribute("mainCategoryInfo");
    ArrayList<DataBox> mainCategoryDetailList = (ArrayList<DataBox>)request.getAttribute("mainCategoryDetailList");
    DataBox dbox = null;

    int categorySeq = box.getInt("categorySeq");
%>
<!DOCTYPE html>
<html>
<head>
<title>�󼼺��� - ���� �α�/��õ ���� - Ȩ������ - ������ - �ѱ���������ī����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="text/javascript" src="/js/jquery/1.11.1/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
<!--
    /**
     * ���� ȭ������ �̵��Ѵ�.
     */
    function fnGoToUpdatePage(categorySeq) {
        $("#oProcess").val("updatePage");
        $("#oMainCategoryInfoForm").attr("action", "/servlet/controller.admin.homepage.MainCategoryServlet").submit();
    }

    /**
     * ī�װ� �׸��� �����Ѵ�.
     * �ش� �׸��� �����ϸ� ������ ��ϵ� ���� �������� ��� �����Ѵ�.
     */
    function fnDeleteMainCategory(categorySeq) {
        if ( confirm("�ش� ī�װ��� �����ϸ� ������ ��ϵ� ��� ������ �Բ� �����˴ϴ�.\n�����Ͻðڽ��ϱ�?") ) {
            $("#oProcess").val("delete");
            $("#oMainCategoryInfoForm").attr("action", "/servlet/controller.admin.homepage.MainCategoryServlet").submit();
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
            <h3 style="text-align:left; padding-left:16px">* ���� ī�װ� ����</h3>

            <table class="table_out" cellspacing="1" cellpadding="5">
                <colgroup>
                    <col style="width:15%;" />
                    <col style="width:*;" />
                </colgroup>
                <tr>
                    <td colspan="2" class="table_top_line"></td>
                </tr>
                <tr>
                    <th height="25" class="table_title">ī�װ� ��</th>
                    <td class="table_02_2">
                        <%= mainCategoryInfo.getString("d_category_nm") %>
                    </td>
                </tr>
                <tr>
                    <th height="25" class="table_title">��� ����</th>
                    <td class="table_02_2">
<%
        if ( mainCategoryDetailList != null && mainCategoryDetailList.size() > 0) {
            for ( int i = 0 ; i < mainCategoryDetailList.size() ; i++ ) {
                dbox = (DataBox)mainCategoryDetailList.get(i);
%>
                <a href="<%= dbox.getString("d_item_url") %>" target="_blank"><%= dbox.getString("d_item_nm") %></a><br/>
<%
            }
        } else {
            out.println("��ϵ� ������ �����ϴ�.");
        }
%>
                    </td>
                </tr>
                <tr>
                    <th height="25" class="table_title">ī�װ� Ÿ��</th>
                    <td class="table_02_2">
                        <%= mainCategoryInfo.getString("d_category_type_nm") %>
                    </td>
                </tr>
                <tr>
                    <th height="25" class="table_title">���̾ƿ� Ÿ��</th>
                    <td class="table_02_2">
                        <%= mainCategoryInfo.getString("d_layout_type") %> Ÿ��
                        <br/>
                        
                    </td>
                </tr>
                <tr>
                    <th height="25" class="table_title">����</th>
                    <td class="table_02_2">
                        <%= mainCategoryInfo.getString("d_sort_order") %>
                    </td>
                </tr>
                <tr>
                    <th height="25" class="table_title">��뿩��</th>
                    <td class="table_02_2">
                        <%= mainCategoryInfo.getString("d_use_yn").equals("Y") ? "���" : "�̻��" %>
                    </td>
                </tr>
            </table>

            <br/>
            <!-- ����, ��� ��ư ���� //-->
            <table width="22%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="center"><a href="javascript:fnGoToUpdatePage();"><img src="/images/admin/button/btn_modify.gif" border="0"></a></td>
                    <td align="center"><a href="javascript:fnDeleteMainCategory();"><img src="/images/admin/button/btn_del.gif" border="0"></a></td>
                    <td align="center"><a href="javascript:history.back(-1)"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
                </tr>
            </table>
            <!-- ����, ��� ��ư �� //-->
        </td>
    </tr>
</table>

<form id="oMainCategoryInfoForm" name="mainCategoryInfoForm" method="get" action="">
    <input type="hidden" id="oProcess" name="process" value="" />
    <input type="hidden" id="oCategorySeq" name="categorySeq" value="<%= categorySeq %>" />
    <input type="hidden" id="oRegItemCnt" name="regItemCnt" value="<%= mainCategoryInfo.getString("d_reg_item_cnt") %>" />
</form>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
