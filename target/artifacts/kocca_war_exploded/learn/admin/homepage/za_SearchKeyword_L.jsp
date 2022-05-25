<%
//**********************************************************
//  1. ��      �� : �˻��� ��� ��ȸ
//  2. ���α׷��� : za_SearchKeyword_L.jsp
//  3. ��      �� : �Ⱓ�� ���� �˻��� ����� ��ȸ�Ѵ�.
//  4. ȯ      �� : JDK 1.3
//  5. ��      �� : 1.0
//  6. ��      �� : 2014-04-18
//  7. ��      �� :
//***********************************************************
%>
<%@page contentType="text/html;charset=euc-kr" %>
<%@page errorPage="/learn/library/error.jsp" %>

<%@page import="java.util.*" %>
<%@page import="com.credu.homepage.*" %>
<%@page import="com.credu.library.*" %>
<%@page import="com.credu.common.*" %>
<%@page import="com.credu.course.*" %>
<%@page import="com.credu.system.*" %>
<%@page import="com.credu.scorm.DateUtil" %>

<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%

    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String processType = box.getString("processType");
    String searchStartDate = box.getString("searchStartDate");
    String searchEndDate = box.getString("searchEndDate");

    if ( searchStartDate != null && !searchStartDate.equals("")) {
        searchStartDate = searchStartDate.substring(0, 4) + "/" + searchStartDate.substring(4, 6) + "/" + searchStartDate.substring(6, 8);
    }
    if ( searchEndDate != null && !searchEndDate.equals(""))  {
        searchEndDate =  searchEndDate.substring(0, 4) + "/" + searchEndDate.substring(4, 6) + "/" + searchEndDate.substring(6, 8);
    }

    String searchKeyword = "";
    String rnk = "", cnt = "";
    int sort_seq = 0;
    String Keyword = "";

    processType = (processType == null || processType.equals("")) ? "selectSearchWordList" : processType;

    int v_dispnum = 0;      // �ѰԽù���
    int v_totalpage = 0;    // �Խù�����������

    ArrayList list = (ArrayList)request.getAttribute("searchKeywordList");
    ArrayList keylist = (ArrayList)request.getAttribute("selectKeywordList");

    int pageNo = box.getInt("pageNo");
    int pageSize = box.getInt("pageSize");
    int totalRowCnt = 0;
    int totalPage = 0;
%>
<!doctype html>
<html lang="ko">
<head>
<title>�˻��� ��� | �м�/��� | �ѱ���������ī���� ������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<link rel="stylesheet" type="text/CSS" href="/css/jquery-ui-1.10.4.css">
<script type="text/javascript" src = "/script/cresys_lib.js"></script>
<script type="text/javascript" src="/js/jquery/1.8.3/jquery.js"></script>
<script type="text/javascript" src="/js/jqueryui/1.10.0/jquery-ui.js"></script>
<SCRIPT type="text/javascript">
<!--

    function fnSearchKeywordList() {
        if ( $("#oSearchStartDate").val() == "" ) {
            alert("�������ڸ� �����ϼ���.");
            $("#oSearchStartDate").focus();
            return false;
        }

        if ( $("#oSearchEndDate").val() == "" ) {
            alert("�������ڸ� �����ϼ���.");
            $("#oSearchEndDate").focus();
            return false;
        }

        // $("#oSearchForm").action = "";
        $("#oSearchForm").submit();
    }

    /*
    function fnSearchKeywordDetail( keyword ) {
        $.ajax(
            type:   "POST",
            url:    "/servlet/controller.homepage.MainStatusticServlet";
        );
    }
    */

    function go(index) {
        $("#oPageNo").val(index);
        $("#oProcessType").val("selectSearchWordList");
        $("#oSearchForm").attr("action", "/servlet/controller.homepage.SearchWordAdminServlet").attr("target", "_self").submit();
    }

    function goPage(pageNo) {
        $("#oPageNo").val(pageNo);
        $("#oProcessType").val("selectSearchWordList");
        $("#oSearchForm").attr("action", "/servlet/controller.homepage.SearchWordAdminServlet").attr("target", "_self").submit();
    }

    function pagesize(pageSize) {
        $("#oPageNo").val(1);
        $("#oPageSize").val( pageSize );
        $("#oProcessType").val("selectSearchWordList");
        $("#oSearchForm").attr("action", "/servlet/controller.homepage.SearchWordAdminServlet").attr("target", "_self").submit();
    }

    $(document).ready( function() {

        $(document).title = "�˻��� ��� | ��� | �ѱ���������ī���� ������";

        // �޷� �ʱ�ȭ
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
            yearRange: "-15:", // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
            showButtonPanel: true, // Ķ���� �ϴܿ� ��ư �г��� ǥ���Ѵ�.
            currentText: "����" , // ���� ��¥�� �̵��ϴ� ��ư �г�
            closeText: "�ݱ�",  // �ݱ� ��ư �г�
            dateFormat: "yy/mm/dd", // �ؽ�Ʈ �ʵ忡 �ԷµǴ� ��¥ ����.
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
            dateFormat: "yy/mm/dd", // �ؽ�Ʈ �ʵ忡 �ԷµǴ� ��¥ ����.
            showAnim: "slideDown", //�ִϸ��̼��� �����Ѵ�.
            showMonthAfterYear: true , // ��, ����� ����Ʈ �ڽ��� ��,�� ������ �ٲ��ش�.
            dayNamesMin: ["��", "ȭ", "��", "��", "��", "��", "��"], // ������ �ѱ� ����.
            monthNamesShort: ["1��","2��","3��","4��","5��","6��","7��","8��","9��","10��","11��","12��"], // ���� �ѱ� ����.

            onClose: function( selectedDate ) {
                $("#oSearchStartDate" ).datepicker( "option", "maxDate", selectedDate );
            }
        });

    });

    function fnAppend(act, obj, s_key){
        var keytable =$("#oKeytable tbody"), lastrow = keytable.find("tr:last-child");
        var tr = $(obj).parent().parent();
        var rcnt = $("#oKeytable tbody tr").length - 1;

        var list ="";

        if(act == "add"){
            if( rcnt == 0 ){
                list = "<tr>";
                list += "    <td class=\"table_01\">1</td>";
                list += "    <td style=\"background-color:#ffffff;\"><input type=\"text\" id=\"os_keyword\" name = \"s_keyword\"  value=\"\" /></td>";
                list += "    <td style=\"background-color:#ffffff; text-align:center;\"><input type=\"button\" onclick=\"javascript:fnAppend('remove',this);\" value=\"����\"/></td>";
                list += "    <td style=\"background-color:#ffffff; text-align:center;\"><a href=\"javascript:fnChangeVal(1, 'up');\">��</a>&nbsp;&nbsp;<a href=\"javascript:fnChangeVal(1, 'down');\">��</a></td>";
                list += "</tr>";
                keytable.append(list);
                $("#oKeytable tr:last-child td:eq(1) :input").val(s_key);
                $("#oKeytable tr:last-child td:eq(0)").text(rcnt+1);
            // } else if (rcnt >= 7){
            //     alert("�˻���� 7�� �̻� ����� �� �����ϴ�.");
            //     return;
            } else {

                for(var i = 0; i <rcnt; i++){
                    var i_key = $("#oKeytable input[name='s_keyword']").eq(i).val();
                    if(i_key == s_key){
                        alert("�˻�� �ߺ��Ǿ����ϴ�.");
                        return;
                    }
                }

                keytable.append(lastrow.clone());
                $("#oKeytable tr:last-child td:eq(1) :input").val(s_key);
                $("#oKeytable tr:last-child td:eq(0)").text(rcnt+1);

                $("#oKeytable tr:last-child td:eq(3)").html("<a href=\"javascript:fnChangeVal(" + (rcnt+1) + ", 'up');\">��</a>&nbsp;&nbsp;<a href=\"javascript:fnChangeVal("+ (rcnt+1) +", 'down');\">��</a>");

            }
        } else {
            var currIdx = $(tr).find("td").eq(0).text();

            tr.remove();

            for( var k = currIdx ; k <= rcnt ; k++ ) {
                var tempObj = $("#oKeytable tr").eq(k);
                tempObj.find("td").eq(0).text(k);
                tempObj.find("td").eq(3).html("<a href=\"javascript:fnChangeVal(" + (k) + ", 'up');\">��</a>&nbsp;&nbsp;<a href=\"javascript:fnChangeVal("+ (k) +", 'down');\">��</a>");
            }
        }

    }

    function fnChangeVal(val, act){
        var rcnt =$("#oKeytable tbody tr").length - 1;
        $("#oKeytable tr:last-child td:eq(1) :input").val();

        var tempValue = "";
        var orgValue = $("#oKeytable input[name='s_keyword']").eq(val - 1).val();

        var maxLength = $("#oKeytable input[name='s_keyword']").length;

        if ( val > 1 && act == "up") {
            tempValue = $("#oKeytable input[name='s_keyword']").eq(val - 2).val();
            $("#oKeytable input[name='s_keyword']").eq(val - 2).val( orgValue );
            $("#oKeytable input[name='s_keyword']").eq(val - 1).val( tempValue );
        } else if ( val < maxLength && act == "down" ) {
            tempValue = $("#oKeytable input[name='s_keyword']").eq(val).val();
            $("#oKeytable input[name='s_keyword']").eq(val - 1).val( tempValue );
            $("#oKeytable input[name='s_keyword']").eq(val).val( orgValue );
        }
    }

    function fnkeywordReg() {
        if ($("#oKeytable input[name='s_keyword']").length > 0 ){
            if (confirm('���� ��� �Ͻðڽ��ϱ�?')) {
                document.keywordRegform.action = "/servlet/controller.homepage.SearchWordAdminServlet";
                document.keywordRegform.processType.value="insertKeywordList";
                document.keywordRegform.submit();
            }
        }else{
            alert("���� �� Ű���带 ����ϼ���.");
            return;
        }

    }


//-->
</SCRIPT>
</head>

<body bgcolor="#ffffff" text="#000000" topmargin="0" leftmargin="0">

<table width="1000" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td align="center" valign="top" style="background-color:#ffffff;" colspan="2">
            <!----------------- title ���� ----------------->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
                <tr>
                    <td align="left"><h2>�˻��� ����</h2></td>
                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
                </tr>
            </table>
            <!----------------- title �� ----------------->
            <br>
            <!----------------- form ���� ----------------->

            <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0" >
                <tr>
                    <td align="center" style="padding:1px; background-color: #bebebe;">
                        <!-- ���ǰ˻� ���� //-->
                        <table cellspacing="1" cellpadding="4" width="100%" style="border-style:none solid; background-color: #eef1f2;">
                            <tr>
                                <td>
                                    <form name="searchForm" id="oSearchForm" method="get">
                                        <input type="hidden" id="oProcessType" name="processType" value="<%= processType %>" />
                                        <input type="hidden" id="oPageNo" name="pageNo" value="" />
                                        <input type="hidden" id="oPageSize" name="pageSize" value="<%= pageSize %>" />
                                        <input type="hidden" id="oSeq" name="seq" value="" />

                                    <table border="0" cellspacing="0" cellpadding="0" width="99%" class="">
                                        <colgroup>
                                            <col width="8%"/>
                                            <col width="25%"/>
                                            <col width="*"/>
                                        </colgroup>
                                        <tr>
                                            <th style="text-align:left; padding-left:8px;">�˻��Ⱓ</td>
                                            <td style="text-align:left; padding-left:8px;">
                                                <input type="text" id="oSearchStartDate" name="searchStartDate" value="<%= searchStartDate %>" class="input" maxlength="10" size="10" /> ~
                                                <input type="text" id="oSearchEndDate" name="searchEndDate" value="<%= searchEndDate %>" class="input" maxlength="10" size="10" />
                                            </td>
                                            <td align="left">
                                                <a href="javascript:fnSearchKeywordList()"><img src="/images/admin/button/b_go.gif" border="0" align="absmiddle" alt="��ȸ" /></a>
                                            </td>
                                        </tr>
                                    </table>
                                    </form>

                                </td>
                            </tr>
                        </table>
                        <!-- ���ǰ˻� �� //-->
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td width="460" style="padding-top:8px; padding-left:14px; vertical-align:top; background-color:#ffffff;">

            <!----------------- �߰� ��ư ����
            <table cellpadding="0" cellspacing="0" class="table1">
                <tr>
                    <td align="right" height="20">
                        <a href="javascript:InsertSubjPage()"><img src="/images/admin/button/btn_cyberplus.gif" border="0"></a>
                    </td>
                </tr>
                <tr>
                    <td height="3"></td>
                </tr>
            </table>
            �߰� ��ư �� ----------------->

            <!-- �˻��� ���� ���� //-->
            <table cellspacing="1" cellpadding="5" border="0" style="border-style: none;background-color: #76ABE0; ">
                <colgroup>
                    <col width="60" />
                    <col width="240" />
                    <col width="80" />
                    <col width="80" />
                </colgroup>
                <tr>
                    <td class="table_title">����</td>
                    <td class="table_title">�˻���</td>
                    <td class="table_title">�˻��Ǽ�</td>
                    <td class="table_title">����</td>
                </tr>
<%
        if ( list.size() > 0 ) {
            DataBox dbox = null;
            for(int i = 0; i < list.size(); i++) {

                dbox = (DataBox)list.get(i);

                rnk = dbox.getString("d_rnk");
                searchKeyword = dbox.getString("d_search_word");
                cnt = dbox.getString("d_cnt");

                if ( i == list.size() - 1 ) {
                    totalRowCnt = dbox.getInt("totalRowCnt");
                    totalPage = dbox.getInt("totalPage");
                }
%>
            <tr>
                <td class="table_01"><%= rnk %></td>
                <td style="background-color:#ffffff;"><%= searchKeyword %></td>
                <td style="background-color:#ffffff; text-align:center;"><%= cnt %></td>
                <td style="background-color:#ffffff; text-align:center;"><input type="button" onclick="javascript:fnAppend('add',this,'<%= searchKeyword %>');" value="�߰�"/></td>
            </tr>
<%
            }
        } else {
%>
            <tr>
                <td class="table_01" colspan="3">��ȸ�� ����� �����ϴ�.</td>
            </tr>
<%
        }
%>

            </table>
            <!-- �˻��� ���� �� //-->

            <br />

            <table width="460" cellspacing="1" cellpadding="2" border="0">
                <tr>
                    <td align="center" width="300">
                        <%= PageUtil.printPageList(totalPage, pageNo, pageSize) %>
                    </td>
                    <td align="right">
                        �� <%= totalRowCnt %>��
                        <select id="oSelectPageSize" name="selectPageSize" onchange="pagesize(this.value);">
                            <option value="10" <%= (pageSize == 10) ? "selected='selected'" : "" %>>10���� ����</option>
                            <option value="20" <%= (pageSize == 20) ? "selected='selected'" : "" %>>20���� ����</option>
                            <option value="30" <%= (pageSize == 30) ? "selected='selected'" : "" %>>30���� ����</option>
                            <option value="50" <%= (pageSize == 50) ? "selected='selected'" : "" %>>50���� ����</option>
                            <option value="100" <%= (pageSize == 100) ? "selected='selected'" : "" %>>100���� ����</option>
                        </select>
                    </td>
                </tr>
            </table>

        </td>
        <td width="460" style="padding-top:8px; vertical-align:top; background-color:#ffffff;">

            <form id="oKeywordform" name="keywordRegform" method="post">
                <input type="hidden" id="oProcessType" name="processType" value="" />
                <input type="hidden" id="oSearchStartDate" name="searchStartDate" value="<%= searchStartDate %>" />
                <input type="hidden" id="oSearchEndDate"   name="searchEndDate" value="<%= searchEndDate %>" />
                <table id="oKeytable" cellspacing="1" cellpadding="5" border="0" style="border-style: none;background-color: #76ABE0; ">
                    <colgroup>
                        <col width="60" />
                        <col width="240" />
                        <col width="80" />
                        <col width="80" />
                    </colgroup>
                    <tr>
                        <td class="table_title">����</td>
                        <td class="table_title">���� �˻���</td>
                        <td colspan="2" class="table_title">����</td>
                    </tr>
<%
        if ( keylist !=null && keylist.size() > 0 ) {
            DataBox kdbox = null;

            for(int i = 0; i < keylist.size(); i++) {

                kdbox = (DataBox)keylist.get(i);

                sort_seq = kdbox.getInt("d_sort_seq");
                Keyword = kdbox.getString("d_keyword");

%>
                    <tr>
                        <td class="table_01"><%=sort_seq%></td>
                        <td style="background-color:#ffffff;"><input type="text" id="os_keyword" name = "s_keyword" value="<%=Keyword%>" /></td>
                        <td style="background-color:#ffffff; text-align:center;"><input type="button" onclick="javascript:fnAppend('remove',this, '');" value="����"/></td>
                        <td style="background-color:#ffffff; text-align:center;">
                            <a href="javascript:fnChangeVal(<%=sort_seq%>, 'up');">��</a>&nbsp;&nbsp;<a href="javascript:fnChangeVal(<%=sort_seq%>, 'down');">��</a>
                        </td>
                    </tr>
<%
            }
        }
%>

                </table>
            </form>
        </td>
    </tr>
    <tr>
        <td colspan="2"></td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <input type="button" onclick="javascript:fnkeywordReg();" value="����" />
        </td>
    </tr>
</table>


<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>

