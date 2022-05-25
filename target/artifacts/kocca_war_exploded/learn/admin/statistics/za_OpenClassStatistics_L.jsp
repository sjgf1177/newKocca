<%
//**********************************************************
//  1. ��      ��: Notice
//  2. ���α׷��� : za_Notice_L.jsp
//  3. ��      ��: �������� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 13
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType="text/html;charset=euc-kr" %>
<%@page errorPage="/learn/library/error.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Calendar" %>

<%@ page import="com.credu.library.DataBox" %>
<%@ page import="com.credu.library.FormatDate" %>
<%@ page import="com.credu.library.RequestBox" %>

<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String searchCondition = box.getStringDefault("searchCondition", "year");
    String searchStartDate = box.getString("searchStartDate");
    String searchEndDate = box.getString("searchEndDate");

    String subTitle = (searchCondition.equals("year")) ? "�⵵�� ���" : "�Ⱓ�� ���";

    DataBox dbox = null;

    // ArrayList<DataBox> viewCountTotalList = (ArrayList<DataBox>)request.getAttribute("selectViewCountTotList");
    ArrayList<DataBox> viewCountList = (ArrayList<DataBox>)request.getAttribute("selectViewCountList");
    ArrayList<DataBox> viewCountTotalListInPeriod = (ArrayList<DataBox>)request.getAttribute("selectViewCountTotalListInPeriod");

    Calendar oCalendar = Calendar.getInstance( );

    int currentYear = oCalendar.get(Calendar.YEAR);
%>
<html>
<head>
<title>�������� ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<link rel="stylesheet" type="text/CSS" href="/css/jquery-ui-1.10.4.css">
<script type="text/javascript" src = "/script/cresys_lib.js"></script>
<script type="text/javascript" src="/script/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/script/jquery-ui-1.10.4.js"></script>
<script type="text/javascript">
<!--
    /**
     * ������ �ʱ�ȭ �Լ�
     */
    $(document).ready( function() {

        $(document).title = "�˻��� ��� | ��� | �ѱ���������ī���� ������";

        $("#oSearchStartDate").datepicker({
            showOn: "both", // ��ư�� �ؽ�Ʈ �ʵ� ��� Ķ������ �����ش�.
            buttonImage: "/images/portal/ico/ico_calendar.gif", // ��ư �̹���
            buttonText: "�˻� ��������",
            buttonImageOnly: true, // ��ư�� �ִ� �̹����� ǥ���Ѵ�.
            changeMonth: true, // ���� �ٲܼ� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
            changeYear: true, // ���� �ٲ� �� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
            // minDate: "-7d", // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
            maxDate: "0d", // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
            nextText: "���� ��", // next �������� ����.
            prevText: "���� ��", // prev �������� ����.
            numberOfMonths: [1,1], // �ѹ��� �󸶳� ���� ���� ǥ���Ұ��ΰ�. [2,3] �� ���, 2(��) x 3(��) = 6���� ���� ǥ���Ѵ�.
            stepMonths: 1, // next, prev ��ư�� Ŭ�������� �󸶳� ���� ���� �̵��Ͽ� ǥ���ϴ°�.
            yearRange: "-5:", // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
            showButtonPanel: true, // Ķ���� �ϴܿ� ��ư �г��� ǥ���Ѵ�.
            currentText: "����" , // ���� ��¥�� �̵��ϴ� ��ư �г�
            closeText: "�ݱ�",  // �ݱ� ��ư �г�
            dateFormat: "yymmdd", // �ؽ�Ʈ �ʵ忡 �ԷµǴ� ��¥ ����.
            showAnim: "slideDown", //�ִϸ��̼��� �����Ѵ�.
            showMonthAfterYear: true , // ��, ����� ����Ʈ �ڽ��� ��,�� ������ �ٲ��ش�.
            dayNamesMin: ["��", "ȭ", "��", "��", "��", "��", "��"], // ������ �ѱ� ����.
            monthNamesShort: ["1��","2��","3��","4��","5��","6��","7��","8��","9��","10��","11��","12��"], // ���� �ѱ� ����.

            onClose: function( selectedDate ) {
                $("#oSearchEndDate" ).datepicker( "option", "minDate", selectedDate );
            }
        });

        $("#oSearchEndDate").datepicker({
            showOn: "both", // ��ư�� �ؽ�Ʈ �ʵ� ��� Ķ������ �����ش�.
            buttonImage: "/images/portal/ico/ico_calendar.gif", // ��ư �̹���
            buttonText: "�˻� ��������",
            buttonImageOnly: true, // ��ư�� �ִ� �̹����� ǥ���Ѵ�.
            changeMonth: true, // ���� �ٲܼ� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
            changeYear: true, // ���� �ٲ� �� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
            // minDate: "-7d", // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
            maxDate: "0d",
            nextText: "���� ��", // next �������� ����.
            prevText: "���� ��", // prev �������� ����.
            numberOfMonths: [1,1], // �ѹ��� �󸶳� ���� ���� ǥ���Ұ��ΰ�. [2,3] �� ���, 2(��) x 3(��) = 6���� ���� ǥ���Ѵ�.
            stepMonths: 1, // next, prev ��ư�� Ŭ�������� �󸶳� ���� ���� �̵��Ͽ� ǥ���ϴ°�.
            yearRange: "-15:", // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
            showButtonPanel: true, // Ķ���� �ϴܿ� ��ư �г��� ǥ���Ѵ�.
            currentText: "����" , // ���� ��¥�� �̵��ϴ� ��ư �г�
            closeText: "�ݱ�",  // �ݱ� ��ư �г�
            dateFormat: "yymmdd", // �ؽ�Ʈ �ʵ忡 �ԷµǴ� ��¥ ����.
            showAnim: "slideDown", //�ִϸ��̼��� �����Ѵ�.
            showMonthAfterYear: true , // ��, ����� ����Ʈ �ڽ��� ��,�� ������ �ٲ��ش�.
            dayNamesMin: ["��", "ȭ", "��", "��", "��", "��", "��"], // ������ �ѱ� ����.
            monthNamesShort: ["1��","2��","3��","4��","5��","6��","7��","8��","9��","10��","11��","12��"], // ���� �ѱ� ����.

            onClose: function( selectedDate ) {
                $("#oSearchStartDate" ).datepicker( "option", "maxDate", selectedDate );
            }
        });
    });

    /**
     * �˻����ǿ� ������ ���غ��� ����ڷ� ����� ��ȸ�Ѵ�.
     */
    function fnOpenClassStatisticsList() {
        var searchCondtion = $("#oSearchCondition").val();
        if ( searchCondtion != "year" ) {
            if ( $("#oSearchStartDate").val() == "" ) {
                alert("��ȸ �������� �Է� Ȥ�� �����ϼ���");
                $("#oSearchStartDate").focus();
                return;
            } else if ( $("#oSearchEndDate").val() == "" ) {
                alert("��ȸ �������� �Է� Ȥ�� �����ϼ���");
                $("#oSearchEndDate").focus();
                return;
            }
        }

        $("#oProcess").val("selectOpenClassStatisticsList");
        $("#oOpenClassSearchForm").attr("action", "/servlet/controller.statistics.OpenClassStatisticServlet").submit();
    }

    /**
     *
     */
    function fnSetSearchCondition(searchCondition) {
        if ( searchCondition == "year" ) {
            $("#oYearSearchTable").show();
            $("#oPeriodSearchTable").hide();
        } else {
            $("#oYearSearchTable").hide();
            $("#oPeriodSearchTable").show();
        }
    }
    
    function goExcel(){
    	var searchCondtion = $("#oSearchCondition").val();
        if ( searchCondtion != "year" ) {
            if ( $("#oSearchStartDate").val() == "" ) {
                alert("��ȸ �������� �Է� Ȥ�� �����ϼ���");
                $("#oSearchStartDate").focus();
                return;
            } else if ( $("#oSearchEndDate").val() == "" ) {
                alert("��ȸ �������� �Է� Ȥ�� �����ϼ���");
                $("#oSearchEndDate").focus();
                return;
            }
        }

        $("#oProcess").val("selectOpenClassStatisticsExcel");
        $("#oOpenClassSearchForm").attr("action", "/servlet/controller.statistics.OpenClassStatisticServlet").submit();
    }
//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">


<table width="1000" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td align="center" valign="top">
            <!-- title ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
                <tr>
                    <td><h3>�������� ���</h3></td>
                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" /></td>
                </tr>
            </table>
            <!-- title �� //-->

            <!-- �˻� ���� ���� //-->
            <form id="oOpenClassSearchForm" name="openClassSearchForm" method="get">
                <input type="hidden" id="oProcess" name="p_process" value="" />
            <table cellspacing="0" cellpadding="1" class="form_table_out">
                <tr>
                    <td bgcolor="#C6C6C6" align="center">

                        <table cellspacing="0" cellpadding="0" class="form_table_bg" >
                            <tr>
                                <td height="7"></td>
                            </tr>
                            <tr>
                                <td align="center">

                                    <table border="0" cellspacing="0" cellpadding="0" width="99%" class="form_table">
                                        <colgroup>
                                            <col width="9%" /></col>
                                            <col width="30%" /></col>
                                            <col width="50%" /></col>
                                            <col width="*" /></col>
                                        </colgroup>
                                        <tr>
                                            <th align="left" valign="middle">�˻�����</th>
                                            <td>
                                                <select id="oSearchCondition" name="searchCondition" onchange="fnSetSearchCondition(this.value);">
                                                    <option value="year" <%= box.getString("searchCondition").equals("year") ? "selected=\"selected\"" : "" %>>�⵵��</option>
                                                    <option value="period" <%= box.getString("searchCondition").equals("period") ? "selected=\"selected\"" : "" %>>�Ⱓ��</option>
                                                    <option value="daily" <%= box.getString("searchCondition").equals("daily") ? "selected=\"selected\"" : "" %>>�Ϻ�</option>
                                                </select>
                                            </td>
                                            <td>
                                                <table width="98%" id="oYearSearchTable" <%= searchCondition.equals("year") ? "style=\"display:block;\"" : "style=\"display:none;\"" %>>
                                                    <colgroup>
                                                        <col width="20%"></col>
                                                        <col width="80%"></col>
                                                    </colgroup>
                                                    <tr>
                                                        <th>��ȸ�⵵</th>
                                                        <td>
                                                            <select id="oSearchYear" name="searchYear">
<%
        for( int startYear = currentYear; startYear >= 2012 ; startYear-- ) {
%>
                                                                <option value="<%= startYear %>" <%= (box.getInt("searchYear") == startYear) ? " selected" : "" %>><%= startYear %></option>
<%
        }
%>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table width="98%" id="oPeriodSearchTable"  <%= !searchCondition.equals("year") ? "style=\"display:block;\"" : "style=\"display:none;\"" %>>
                                                    <colgroup>
                                                        <col width="20%"></col>
                                                        <col width="80%"></col>
                                                    </colgroup>
                                                    <tr>
                                                        <th>��ȸ�Ⱓ</th>
                                                        <td>
                                                            <input type="text" id="oSearchStartDate" name="searchStartDate" value="<%= box.getString("searchStartDate") %>" class="input" maxlength="10" size="12" /> ~
                                                            <input type="text" id="oSearchEndDate" name="searchEndDate" value="<%= box.getString("searchEndDate") %>" class="input" maxlength="10" size="12" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="10%" align="right">
                                                <a href = "javascript:fnOpenClassStatisticsList('go')"><img src = "/images/admin/button/b_go.gif" border = "0" align="absmiddle"></a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="9"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            </form>
            <!-- �˻� ���� �� //-->
            
            <!----------------- ������� ��ư ���� ----------------->
            <table cellpadding="0" cellspacing="0" class="table1">
	            <tr>
            		<td align="right"><a href="javascript:goExcel('go')" class="c"><img src="/images/admin/button/btn_excelprint.gif"  border="0"></a></td>
	            </tr>
	            <tr>
             		<td height="3"></td>
	            </tr>
            </table>
            <!----------------- ������� ��ư �� ----------------->

<%
    if ( searchCondition.equals("year") || searchCondition.equals("period") ) {
%>
            <table class="table_out" cellspacing="1" cellpadding="5" style="margin-left:15px;">
                <tr>
                    <td colspan="17" class="table_top_line"></td>
                </tr>
                <tr>
                    <td colspan="17" style="font-weight:bold; font-size:15pt; background-color:#abcdef;"><%= subTitle %></td>
                </tr>
                <tr>
                    <td class="table_title" width="3%"><b>seq</b></td>
                    <td class="table_title" width="10%"><b>����1</b></td>
                    <td class="table_title" width="8%"><b>����2</b></td>
                    <td class="table_title"><b>������</b></td>
                    <td class="table_title" width="4%"><b>1��</b></td>
                    <td class="table_title" width="4%"><b>2��</b></td>
                    <td class="table_title" width="4%"><b>3��</b></td>
                    <td class="table_title" width="4%"><b>4��</b></td>
                    <td class="table_title" width="4%"><b>5��</b></td>
                    <td class="table_title" width="4%"><b>6��</b></td>
                    <td class="table_title" width="4%"><b>7��</b></td>
                    <td class="table_title" width="4%"><b>8��</b></td>
                    <td class="table_title" width="4%"><b>9��</b></td>
                    <td class="table_title" width="4%"><b>10��</b></td>
                    <td class="table_title" width="4%"><b>11��</b></td>
                    <td class="table_title" width="4%"><b>12��</b></td>
                    <td class="table_title" width="4%"><b>�հ�</b></td>
                </tr>
<%
        if ( viewCountTotalListInPeriod != null && viewCountTotalListInPeriod.size() > 0 ) {
            dbox = null;
            String styleTotal = "";
            for(int i = 0; i < viewCountTotalListInPeriod.size(); i++) {
                dbox = (DataBox)viewCountTotalListInPeriod.get(i);
                styleTotal = dbox.getString("d_seq").equals("99999") ? "style=\"font-weight:bold;\"" : "";
%>
                <tr>
                    <td class="table_01" <%= styleTotal %>><%= dbox.getString("d_seq").equals("99999") ? "*" : dbox.getString("d_seq") %></td>
                    <td class="table_01" <%= styleTotal %>><%= dbox.getString("d_areanm") %></td>
                    <td class="table_01" <%= styleTotal %>><%= dbox.getString("d_lecture_clsnm") %></td>
                    <td class="table_02_1" align="left;" <%= styleTotal %>><%= dbox.getString("d_lecnm") %></td>
                    <td class="table_02_1" <%= styleTotal %>><%= new java.text.DecimalFormat("##,###,##0").format(dbox.getInt("d_jan")) %></td>
                    <td class="table_02_1" <%= styleTotal %>><%= new java.text.DecimalFormat("##,###,##0").format(dbox.getInt("d_feb")) %></td>
                    <td class="table_02_1" <%= styleTotal %>><%= new java.text.DecimalFormat("##,###,##0").format(dbox.getInt("d_mar")) %></td>
                    <td class="table_02_1" <%= styleTotal %>><%= new java.text.DecimalFormat("##,###,##0").format(dbox.getInt("d_apr")) %></td>
                    <td class="table_02_1" <%= styleTotal %>><%= new java.text.DecimalFormat("##,###,##0").format(dbox.getInt("d_may")) %></td>
                    <td class="table_02_1" <%= styleTotal %>><%= new java.text.DecimalFormat("##,###,##0").format(dbox.getInt("d_jun")) %></td>
                    <td class="table_02_1" <%= styleTotal %>><%= new java.text.DecimalFormat("##,###,##0").format(dbox.getInt("d_jul")) %></td>
                    <td class="table_02_1" <%= styleTotal %>><%= new java.text.DecimalFormat("##,###,##0").format(dbox.getInt("d_aug")) %></td>
                    <td class="table_02_1" <%= styleTotal %>><%= new java.text.DecimalFormat("##,###,##0").format(dbox.getInt("d_sep")) %></td>
                    <td class="table_02_1" <%= styleTotal %>><%= new java.text.DecimalFormat("##,###,##0").format(dbox.getInt("d_oct")) %></td>
                    <td class="table_02_1" <%= styleTotal %>><%= new java.text.DecimalFormat("##,###,##0").format(dbox.getInt("d_nov")) %></td>
                    <td class="table_02_1" <%= styleTotal %>><%= new java.text.DecimalFormat("##,###,##0").format(dbox.getInt("d_dec")) %></td>
                    <td class="table_02_1" <%= styleTotal %>><%= new java.text.DecimalFormat("##,###,##0").format(dbox.getInt("d_tot_cnt")) %></td>
                </tr>
<%
            }
        } else {
%>
                <tr>
                    <td class="table_01" colspan="17">��ȸ�� �ڷᰡ �����ϴ�.</td>
                </tr>
<%
        }
%>
            </table>

<%
    }

    if( searchCondition.equals("daily") ) {
%>
            <table class="table_out" cellspacing="1" cellpadding="5" style="margin-left:15px;">
                <tr>
                    <td colspan="6" class="table_top_line"></td>
                </tr>
                <tr>
                    <td colspan="6"style="font-weight:bold; font-size:15pt; background-color:#abcdef;">�Ϻ� ��ȸ �Ǽ�</td>
                </tr>
                <tr>
                    <td class="table_title" width="5%" height="25"><b>seq</b></td>
                    <td class="table_title" width="10%"><b>����1</b></td>
                    <td class="table_title" width="10%"><b>����2</b></td>
                    <td class="table_title"><b>������</b></td>
                    <td class="table_title" width="10%"><b>��¥</b></td>
                    <td class="table_title" width="10%"><b>��ȸ��</b></td>
                </tr>
<%
        String c_seq = "";
        String c_lecnm = "";
        String c_viewdate = "";
        String c_cnt = "";

        if ( viewCountList != null && viewCountList.size() > 0 ) {
            for(int i = 0; i < viewCountList.size(); i++) {

                DataBox cbox = (DataBox)viewCountList.get(i);
                c_seq = cbox.getString("d_seq");
                c_lecnm = cbox.getString("d_lecnm");
                c_viewdate = cbox.getString("d_viewdate");
                c_cnt = cbox.getString("d_cnt");
%>
                <tr>
                    <td class="table_01"><%=c_seq.equals("0") ? "*" : c_seq%></td>
                    <td <%=c_seq.equals("0") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%= cbox.getString("d_areanm") %></td>
                    <td <%=c_seq.equals("0") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%= cbox.getString("d_lecture_clsnm") %></td>
                    <td <%=c_seq.equals("0") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=c_seq.equals("0") ? "�հ�" : c_lecnm%></td>
                    <td <%=c_seq.equals("0") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=FormatDate.getFormatDate(c_viewdate,"yyyy/MM/dd")%></td>
                    <td <%=c_seq.equals("0") ? "class='table_02_5' style='font-weight:bold;'" : "class='table_02_1'"%>><%=c_cnt%></td>
                </tr>
<%
            }
        } else {
%>
                <tr>
                    <td class="table_01" colspan="6">��ȸ�� �ڷᰡ �����ϴ�.</td>
                </tr>
<%
        }
%>
            </table>

        </td>
    </tr>
</table>
<%
    }
%>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
