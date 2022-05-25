<%
//**********************************************************
// 1. ���ϸ� : za_UpdateMainCategoryPage.jsp
// 2. ���α׷��� : Ȩ������ ����ȭ�� �α�/��õ �׸� ���� ȭ��
// 3. ���� : Ȩ������ ����ȭ�� �α�/��õ ������ ǥ�õǴ� ī�װ� �׸��� ������ �� �ִ� �������̴�.
// 4. ȯ��: JDK 1.5
// 5. ����: 1.0
// 6. �ۼ� : 2015-01-30
// 7. ���� �̷� :
//          2015-01-30 ���� �ۼ�
//***********************************************************
%>

<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page errorPage="/learn/library/error.jsp" %>
<%@ page import="com.credu.library.DataBox" %>
<%@ page import="com.credu.library.RequestBox" %>
<%@ page import="com.credu.library.RequestManager" %>

<%@ taglib uri="/tags/KoccaTaglib" prefix="kocca" %>

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    DataBox mainCategoryInfo = (DataBox)request.getAttribute("mainCategoryInfo");

    int categorySeq = box.getInt("categorySeq");

    String categoryType = mainCategoryInfo.getString("d_category_type");
%>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />

<!DOCTYPE html>
<html>
<head>
<title>���� - ���� �α�/��õ ���� - Ȩ������ - ������ - �ѱ���������ī����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="text/javascript" src="/js/jquery/1.11.1/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
<!--
    /**
     * ���� ȭ�� �α�/��õ���� ī�װ� �׸��� ����Ѵ�.
     */
    function fnUpdateMainCategory() {
        if( $("#oCategoryNm").val() === "" ) {
            alert("ī�װ� ���� �Է��ϼ���.");
            $("#oCategoryNm").focus();
            return;

        } else if( $("#oCategoryType").val() === "" ) {
            alert("ī�װ� Ÿ���� �����ϼ���.");
            $("#oCategoryType").focus();
            return;

        } else if( $("input:radio[name=layoutType]:checked").length === 0 ) {
            alert("���̾ƿ� Ÿ���� �����ϼ���.");
            $("input:radio[name=layoutType]").eq(0).focus();
            return;

        } else if( $("#oSortOrder").val() === "" ) {
            alert("������ �����ϼ���.");
            $("#oSortOrder").focus();
            return;

        } else if( $("input:radio[name=useYn]:checked").length === 0 ) {
            alert("��뿩�θ� �����ϼ���.");
            $("input:radio[name=useYn]").eq(0).focus();
            return;

        } else if (confirm("�����Ͻðڽ��ϱ�?")) {
            $("#oMainCategoryRegForm").attr("action", "/servlet/controller.admin.homepage.MainCategoryServlet").submit();
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
            <h3 style="text-align:left; padding-left:16px">* ���� ī�װ� ����</h3>

            <table width="97%" cellspacing="1" cellpadding="5">
                <tr>
                    <td style="background-color:#fff; text-align:right;">* ��� �Է� �׸��� �ʼ��Դϴ�.</td>
                </tr>
            </table>
            <!-- �Է� form ���� //-->

            <form id="oMainCategoryRegForm" name="mainCategoryRegForm" method="post" action="">
                <input type="hidden" id="oProcess" name="process" value="update" />
                <input type="hidden" id="oCategorySeq" name="categorySeq" value="<%= categorySeq %>" />
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
                        <input type="text" id="oCategoryNm" name="categoryNm" placeholder="ī�װ� ���� �Է��ϼ���." style="width:80%;" value="<%= mainCategoryInfo.getString("d_category_nm") %>" />
                    </td>
                </tr>
                <tr>
                    <th height="25" class="table_title">ī�װ� Ÿ��</th>
                    <td class="table_02_2">
                        <kocca:selectBox name="categoryType" id="oCategoryType" type="code" isLoad="true" codeValue="0120" optionTitle="����" selectedValue="<%= categoryType %>" />
                    </td>
                </tr>
                <tr>
                    <th height="25" class="table_title">���̾ƿ� Ÿ��</th>
                    <td class="table_02_2">
                        <table width="98%">
                            <colgroup>
                                <col style="40%" />
                                <col style="10%" />
                                <col style="50%" />
                            <colgroup>
                            <tr>
                                <td>
                                    <input type="radio" id="oLayoutTypeA" name="layoutType" value="A" <%= mainCategoryInfo.getString("d_layout_type").equals("A") ? "checked=\"checked\"" : "" %>/> <label for="oLayoutTypeA">AŸ��</label>
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <input type="radio" id="oLayoutTypeB" name="layoutType" value="B" <%= mainCategoryInfo.getString("d_layout_type").equals("B") ? "checked=\"checked\"" : "" %> /> <label for="oLayoutTypeB">BŸ��</label>
                                </td>
                            </tr>
                            <tr>
                                <td><label for="oLayoutTypeA"><img src="/images/admin/maincategory/main_category_template_A.png" style="width:320px; height:181px; border:1px solid;" /></label></td>
                                <td>&nbsp;</td>
                                <td><label for="oLayoutTypeB"><img src="/images/admin/maincategory/main_category_template_B.png" style="width:320px; height:181px; border:1px solid;" /></label></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <th height="25" class="table_title">����</th>
                    <td class="table_02_2">
                        <select id="oSortOrder" name="sortOrder" style="font-family:����; font-size:13px;">
                            <option value="">����</option>
<%
        for ( int i = 1 ; i <= 6 ; i++ ) {
%>
                            <option value="<%= i %>" <%= (mainCategoryInfo.getInt("d_sort_order") == i ) ? "selected=\"selected\"" : "" %>><%= i %></option>
<%
        }
%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th height="25" class="table_title">��뿩��</th>
                    <td class="table_02_2">
                        <label><input type="radio" id="oUseYnY" name="useYn" value="Y" <%= mainCategoryInfo.getString("d_use_yn").equals("Y") ? "checked=\"checked\"" : "" %>/> ���</label>
                        <label><input type="radio" id="oUseYnN" name="useYn" value="N" <%= mainCategoryInfo.getString("d_use_yn").equals("N") ? "checked=\"checked\"" : "" %>/> �̻��</label>
                    </td>
                </tr>
            </table>
            </form>
            <!-- �Է� form �� //-->

            <br/>
            <!-- ����, ��� ��ư ���� //-->
            <table width="11%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="center"><a href="javascript:fnUpdateMainCategory();"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
                    <td align="center"><a href="javascript:history.back(-1)"><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
                </tr>
            </table>
            <!-- ����, ��� ��ư �� //-->
        </td>
    </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
