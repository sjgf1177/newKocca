<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page errorPage="/learn/library/error.jsp" %>
<%@ page import="com.credu.library.DataBox" %>
<%@ page import="com.credu.library.RequestBox" %>
<%@ page import="com.credu.library.RequestManager" %>
<%@ page import="java.util.ArrayList" %>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    if (box == null) {
        box = RequestManager.getBox(request);
    }

    DataBox dbox = (DataBox)request.getAttribute("subjClassify");;

    String upperClsCd = box.getString("upperClsCd");
    String clsCd = box.getString("clsCd");
    String tabName = ( upperClsCd.equals("1000") ) ? "�оߺ�" : "������";
%>

<html>
<head>
<title>���� | �����з� ���� | ���� | ������ | �ѱ���������ī����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="/css/admin_style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">

<style type="text/css">
    button{display:inline-block; padding:2px 4px 0px 4px; margin-bottom:0; font-size:12px; font-weight:bold; text-align:center; white-space:nowrap; vertical-align:middle; border-style: solid 1px; }
    button.btn_reg {width:80px; height:24px; background-color:#efefef; color:#000000; border-color:#808080; border-width:1px;}
    button.btn_basic {width:80px; height:20px; background-color:#efefff; color:#000000; border-color:#808090; border-width:1px;}
</style>

<script type="text/javascript" src="/script/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="text/javascript">
<!--

/**
 * �з� ������ �����Ѵ�.
 */
function fnModifySubjectClassify() {

    if ( $("#oClsNm").val() == "" ) {
        alert("�з����� �Է��ϼ���.");
        $("#oClsNm").focus();
        return;
    } else if ( $("#oSortOrder").val() == "" ) {
        alert("���ļ����� �Է��ϼ���.");
        $("#oSortOrder").focus();
        return;
    } else {
        $("#oSubjClassifyRegisterForm").action = "/servlet/controller.course.SubjectClassifyServlet";

        $("#oSubjClassifyRegisterForm").submit();
    }
}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<form id="oSubjClassifyRegisterForm" name="subjClassifyRegisterForm" method="post">
    <input type="hidden" id="oProcess" name="process"  value="update" />
    <input type="hidden" id="oUpperClsCd" name="upperClsCd"  value="<%= upperClsCd %>" />
    <input type="hidden" id="oClsCd" name="clsCd"  value="<%= clsCd %>" />

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" valign="top">
            <!-- title ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
                <tr>
                    <td style="font-size:14pt; font-weight:bold; padding-top:16px;">���� �з� ����</td>
                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
                </tr>
            </table>
            <!-- title �� //-->
            <br/>

            <!-- tab ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="12%">
                        <table cellspacing="0" cellpadding="0" class="s_table">
                            <tr>
                                <td rowspan="3" class="blue_butt_left" id="oTb1Td1"></td>
                                <td class="blue_butt_top" id="oTb1Td2"></td>
                                <td rowspan="3" class="blue_butt_right" id="oTb1Td3"></td>
                            </tr>
                            <tr>
                                <td class="blue_butt_middle" id="oTb1Td4"><%= tabName %></td>
                            </tr>
                            <tr>
                                <td class="blue_butt_bottom" id="oTb1Td5"></td>
                            </tr>
                        </table>
                    <td width="87%">&nbsp;</td>
                </tr>
                <tr>
                    <td height="2" colspan="4" bgcolor="#6699CC"></td>
                </tr>
            </table>
            <!-- tab �� //-->

            <!-- ��� ȭ�� ���� //-->
            <table class="table_out" cellspacing="1" cellpadding="5">
                <colgroup>
                    <col width="120px;" />
                    <col width="200px;" />
                    <col width="120px;" />
                    <col width="*;" />
                </colgroup>
                <tr>
                    <td colspan="4" class="table_top_line"></td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>�з���</strong></td>
                    <td class="table_02_2" colspan="3">
                        <input type="text" id="oClsNm" name="clsNm" size="120" class="input" value="<%= dbox.getString("d_cls_nm") %>" />
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>��뿩��</strong></td>
                    <td class="table_02_2" colspan="3">
                        <select id="oUseYn" name="useYn">
                            <option value="Y" <%= dbox.getString("d_use_yn").equals("Y") ? "selected='selected'" : "" %>>��</option>
                            <option value="N" <%= dbox.getString("d_use_yn").equals("N") ? "selected='selected'" : "" %>>�ƴϿ�</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>���ļ���</strong></td>
                    <td class="table_02_2" colspan="3">
                        <input type="text" id="oSortOrder" name="sortOrder" size="20" class="input" maxlength="2" onkeydown="currency(this);" value="<%= dbox.getString("d_sort_order") %>" />
                    </td>
                </tr>
            </table>
            <br/>
            <br/>
            <button id="oRegisterBtn" name="registerBtn" class="btn_reg" onclick="fnModifySubjectClassify();" >����</button>&nbsp;&nbsp;
            <button id="oCancelBtn" name="cancelBtn" class="btn_reg" onclick="history.back(-1);" >���</button>

        </td>
    </tr>
</table>
</form>

</body>
</html>
