<%
//**********************************************************
// 1. ���α׷���: CMU �Խ��� �����ȸ
// 2. ��  ��  ��: za_CMUBoard_L.jsp
// 3. ��      ��: CMU �Խ��� �����ȸ
// 4. ȯ      ��: JDK 1.?
// 5. ��      ��: saderaser
// 6. ��  ��  ��: 2014-08-21
// 7. �� �� �� ��:
//***********************************************************
%>
<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page errorPage="/learn/library/error.jsp" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.credu.library.*" %>

<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />
<%

    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    ArrayList cmuBoardList = (ArrayList)request.getAttribute("cmuBoardList");

    DataBox dbox = null;

    int pageNo = box.getInt("p_pageno");
    int pageSize = box.getInt("p_pagesize");
    int totalPage = 0;
    int totalRowCount = 0;

    pageNo = pageNo == 0 ? 1 : pageNo;
    pageSize = pageSize == 0 ? 10 : pageSize;

    String process = box.getString("p_process");
    String searchType = box.getString("searchType");
    String searchKeyword = box.getString("searchKeyword");

    int seq = 0;
    int dispNum = 0;
    int viewCount = 0;
    String title = "";
    String regNm = "";
    String regDt = "";
    String useYn = "";
%>
<html>
<head>
<title>�����ȸ | CMU �Խ��� | Ȩ������ | ������ | �ѱ���������ī����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script type="text/javascript" src = "/script/cresys_lib.js"></script>
<script type="text/javascript" src="/script/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
<!--
    /**
     * ������ �̵�
     */
    function goPage(pageNum) {
         $("#oPageNo").val(pageNum);
         $("#oProcess").val("list");
         $("#oCMUBoardForm").attr("action", "/servlet/controller.homepage.CMUBoardAdminServlet");
         $("#oCMUBoardForm").submit();
    }

    /**
     * ���� ����
     */
    function fnView(seq) {
        $("#oSeq").val(seq);
        $("#oProcess").val("view");
        $("#oCMUBoardForm").submit();
    }

    /**
     * ���ȭ������ �̵�
     */
    function fnInsert() {
        $("#oProcess").val("insertPage");
        $("#oCMUBoardForm").submit();
    }

    /**
     * �Խù� �˻�
     */
    function fnSearch() {
        if ( $("#oSearchKeyword").val() == "" ) {
            alert("�˻�� �Է��ϼ���.");
            $("#oSearchKeyword").focus();
            return false;
        }

        $("#oProcess").val("list");
        $("#oCMUBoardForm").submit();
    }



    function pagesize(pageSize) {
        $("#oCMUBoardForm").target = "_self";
        $("#oProcess").val("list");
        $("#oPageNo").val(1);
        $("#oPageSize").val(pageSize);
        $("#oCMUBoardForm").attr("action", "/servlet/controller.homepage.CMUBoardAdminServlet");
        $("#oCMUBoardForm").submit();
    }
//-->
</script>
</head>

<body bgcolor="#ffffff" text="#000000" topmargin="0" leftmargin="0">

<form id="oCMUBoardForm" name="cmuBoardForm" method="get" action="/servlet/controller.homepage.CMUBoardAdminServlet" onsubmit="return fnSearch();">
    <input type="hidden" id="oProcess" name="p_process" value="" />
    <input type="hidden" id="oPageNo" name="p_pageno" value="<%= pageNo %>" />
    <input type="hidden" id="oPageSize" name="p_pagesize" value="<%= pageSize %>" />
    <input type="hidden" id="oSeq" name="seq" value="" />


<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" valign="top">
            <!-- title ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
                <tr>
                    <td style="padding-top:20px;"><h2>CMU ���������Խ���</h2></td>
                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
                </tr>
            </table>
            <!-- title �� //-->

            <br />

            <!-- �˻� ���� �� ��� ��ư ���� //-->
            <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="250">&nbsp;</td>
                    <td width="670" align="right">
                        <select id="oSearchType" name="searchType">
                            <option value="title" <%= (searchType.equals("title")) ? "selected='selected'" : ""  %>>����</option>
                            <option value="cont" <%= (searchType.equals("cont")) ? "selected='selected'" : ""  %>>����</option>
                        </select>
                        <input type="text" id="oSearchKeyword" name="searchKeyword" class="input" value="<%= searchKeyword %>" />
                    </td>
                    <td width="100" align="right" valign="middle">
                        <input type="image" src="/images/admin/button/btn_inquiry.gif" border="0" />
                        <a href="javascript:fnInsert()"><img src="/images/admin/button/btn_add.gif" border="0"></a>
                    </td>
                </tr>
                <tr>
                    <td height="3" colspan="3"></td>
                </tr>
            </table>
            <!-- �˻� ���� �� ��� ��ư �� //-->


            <!-- �Խù� ��� ���� //-->
            <table class="table_out" cellspacing="1" cellpadding="5">
                <tr>
                    <td colspan="6" class="table_top_line"></td>
                </tr>
                <tr>
                    <td class="table_title" width="5%" height="25"><b>NO</b></td>
                    <td class="table_title" ><b>����</b></td>
                    <td class="table_title" width="10%"><b>�ۼ���</b></td>
                    <td class="table_title" width="16%"><b>�����</b></td>
                    <td class="table_title" width="8%"><b>��뿩��</b></td>
                    <td class="table_title" width="8%" ><b>��ȸ��</b></td>
                </tr>
<%

        if ( cmuBoardList == null || cmuBoardList.size() == 0 ) {
%>
                <tr>
                    <td class="table_02_5" colspan="6">��ϵ� ������ �����ϴ�.</td>
                </tr>
<%
        } else {

            for(int i = 0; i < cmuBoardList.size(); i++) {

                dbox = (DataBox)cmuBoardList.get(i);
                seq = dbox.getInt("d_seq");
                dispNum = dbox.getInt("d_dispnum");
                title = dbox.getString("d_title");
                regNm = dbox.getString("d_reg_nm");
                regDt = dbox.getString("d_reg_dt");
                useYn = dbox.getString("d_use_yn");
                viewCount = dbox.getInt("d_view_count");
                regDt   = FormatDate.getFormatDate(regDt,"yyyy/MM/dd");

                totalPage = dbox.getInt("d_totalPage");
                totalRowCount = dbox.getInt("d_totalRowCount");

%>

                <tr>
                    <td class="table_01" ><%= dispNum %></td>
                    <td class="table_02_2"><a href="javascript:fnView(<%= seq %>);"><%= title %></a></td>
                    <td class="table_02_1"><%= regNm %></td>
                    <td class="table_02_1"><%= regDt %></td>
                    <td class="table_02_1"><%= useYn %></td>
                    <td class="table_02_1" ><%= viewCount %></td>
                </tr>
<%
            }
%>
            </table>
            <!-- �Խù� ��� �� //-->

            <!-- ����¡ ���� //-->
            <br />
            <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="right" valign="absmiddle">
                        <%= PageUtil.printPageSizeList(totalPage, pageNo, 0, pageSize, totalRowCount) %>
                    </td>
                </tr>
            </table>
            <!-- ����¡ �� //-->
<%
        }
%>

            <br />
        </td>
    </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
