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

<%@ page import="com.credu.library.DataBox" %>
<%@ page import="com.credu.library.FormatDate" %>
<%@ page import="com.credu.library.RequestBox" %>
<%@ page import="com.credu.library.PageUtil" %>
<%@ page import="com.credu.library.StringManager" %>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet"  scope="page" />
<%

    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process = box.getString("p_process");

    //String  ss_grcode   = box.getString("s_grcode");            //�����׷�
    String  s_gadmin = box.getSession("gadmin");
    String  v_gadmin = StringManager.substring(s_gadmin, 0, 1);
    String  isAll = !v_gadmin.equals("A") ? "false" : "true";
    //String  v_selGroup  = box.getStringDefault("p_selGroup", "ALL");

    //int v_tabseq          = box.getInt("p_tabseq");

    int v_pageno = box.getInt("p_pageno");
    int v_pagesize = box.getInt("p_pagesize");
    v_pagesize = ( v_pagesize == 0 ) ? 20 : v_pagesize;
    int v_totalrowcount =  0;

    String v_searchtext = box.getString("p_searchtext");
    String v_search = box.getString("p_search");

    int v_seq = 0;              // �Ϸù�ȣ
    int v_cnt = 0;              // ��ȸ��

    String v_lecnm = "";
    String v_toturnm = "";
    String v_vodurl = "";
    String v_tutorcareer = "";
    String v_lectime = "";
    String v_genre = "";
    String v_openyn = "";
    String v_userid = "";
    String v_name="";
    String v_indate = "";
    String v_viewcnt = "";
    String v_useyn = "";

    int v_dispnum = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������

    DataBox dbox = null;

    ArrayList<DataBox> list = (ArrayList<DataBox>)request.getAttribute("selectList");
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
    /*
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
    */


    /**
     * ��Ͽ��� ������ �̵� - ������� �ʴ� ������ ������
     */
    function go(index) {
         document.form1.p_pageno.value = index;
         document.form1.action = "/servlet/controller.infomation.GoldClassAdminServlet";
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }

    /**
     * ��Ͽ��� ������ �̵�
     */
    function goPage(pageNum) {
         document.form1.p_pageno.value = pageNum;
         document.form1.action = "/servlet/controller.infomation.GoldClassAdminServlet";
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }

    /**
     * ������ ȭ������ �̵�
     */
    function view(seq, pageNo) {
        document.form1.action = "/servlet/controller.infomation.GoldClassAdminServlet";
        document.form1.p_seq.value = seq;
        document.form1.p_pageno.value = pageNo;
        document.form1.p_process.value = "selectView";
        document.form1.submit();
    }

    /**
     * ��� ȭ������ �̵�
     */
    function insert() {
        document.form1.action = "/servlet/controller.infomation.GoldClassAdminServlet";
        document.form1.p_process.value = "insertPage";
        document.form1.submit();
    }

    /**
     * �������� �˻�
     */
    function search() {
        document.form1.action = "/servlet/controller.infomation.GoldClassAdminServlet";
        document.form1.p_pageno.value = "";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

    /**
     * ������ ������ ����
     */
    function pagesize(pageSize) {
        document.form1.target = "_self";
        document.form1.p_pageno.value = 1;
        document.form1.p_pagesize.value = pageSize;
        document.form1.action = "/servlet/controller.infomation.GoldClassAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

    /**
     * �������� �α���� �˾�â�� ����.
     */
    function fnOpenClassHitfn() {

        var url = "/servlet/controller.infomation.GoldClassAdminServlet";
        var param = "?p_process=ManageOpenClassPage&p_hit_yn=Y&p_recom_yn=N";

        var new_Open = window.open(url + param, "openclassWindow", 'scrollbars=yes,width=1000,height=600,resizable=no');
    }

    /**
     * �������� ��õ���� �˾�â�� ����.
     */
    function fnOpenClassRecomfn() {

        var url = "/servlet/controller.infomation.GoldClassAdminServlet";
        var param = "?p_process=ManageOpenClassPage&p_hit_yn=N&p_recom_yn=Y";

        var new_Open = window.open(url + param, "openclassWindow", 'scrollbars=yes,width=1000,height=600,resizable=no');
    }
    
    //�ڸ� ���Ϸ� �߰�
    function excelAdd() {
    	
    	var url = "/servlet/controller.infomation.GoldClassAdminServlet";
    	
        window.self.name = "winInsertPage";
        farwindow = window.open(url, "openWinAdd", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 520, height = 220, top=0, left=0");
        document.form1.target = "openWinAdd"
        document.form1.p_process.value = "subtitleUpdatePage";
        document.form1.p_action.value = "go";
        document.form1.submit();

        farwindow.window.focus();
        document.form1.target = window.self.name;
    }

//-->
</script>
</head>

<body bgcolor="#ffffff" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="get">
    <input type="hidden" name="p_process" value="<%= v_process %>" />
    <input type="hidden" name="p_pageno" value="" />
    <input type="hidden" name="p_pagesize" value="<%=v_pagesize%>" />
    <input type="hidden" name="p_seq" value="" />
    <input type="hidden" name="p_hit_yn" value="" />
    <input type="hidden" name="p_recom_yn" value="" />
    <input type="hidden" name="p_action" value="" />


<table width="1000" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td align="center" valign="top">
            <!-- title ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
                <tr>
                    <td><img src="/images/admin/portal/s.1_19.gif" /></td>
                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" /></td>
                </tr>
            </table>
            <!-- title �� //-->

            <br />
            <!-- form ���� //-->
            <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="250">
                        <input type="button" value="�α����" onclick="javascript:fnOpenClassHitfn();"/>
                        <input type="button" value="��õ����" onclick="javascript:fnOpenClassRecomfn();"/>
                    </td>
                    <td width="670" align="right">
                        <select name="p_search" >
                            <option value='lecnm'   <% if (v_search.equals("lecnm")) out.println("selected"); %>>���Ǹ�</option>
                            <option value='tutornm' <% if (v_search.equals("tutornm")) out.println("selected"); %>>�����</option>
                        </select>
                        <input name="p_searchtext" type="text" class="input" value="<%=v_searchtext%>">
                    </td>

                    <td width="240" align="right" valign="middle">
                        <a href='javascript:search()'><img src="/images/admin/button/btn_inquiry.gif" border="0" /></a>
                        <a href='javascript:insert()'><img src="/images/admin/button/btn_add.gif" border="0" /></a>
                        <a href="javascript:excelAdd()"><img src="/images/admin/button/btn_fileplus.gif" alt="�ڸ� ���Ϸ��߰�" /></a>
                    </td>
                </tr>
                <tr>
                    <td height="3"></td>
                </tr>
            </table>
            <!-- form �� //-->


            <!-- �������� ���� ����  //-->
            <table class="table_out" cellspacing="1" cellpadding="5">
                <tr>
                    <td colspan="7" class="table_top_line"></td>
                </tr>
                <tr>
                    <td class="table_title" width="5%" height="25"><b>NO</b></td>
                    <td class="table_title"><b>���Ǹ�</b></td>
                    <td class="table_title" width="10%"><b>�����</b></td>
                    <td class="table_title" width="10%"><b>�ۼ���</b></td>
                    <td class="table_title" width="10%"><b>�����</b></td>
                    <td class="table_title" width="10%"><b>��뿩��</b></td>
                    <td class="table_title" width="5%" ><b>��ȸ��</b></td>
                </tr>
<%

            for(int i = 0; i < list.size(); i++) {

                dbox = (DataBox)list.get(i);

                v_seq = dbox.getInt("d_seq");
                v_lecnm = dbox.getString("d_lecnm");
                v_toturnm = dbox.getString("d_tutornm");
                v_vodurl = dbox.getString("d_vodurl");
                v_tutorcareer = dbox.getString("d_tutorcareer");
                v_lectime = dbox.getString("d_lectime");
                v_genre = dbox.getString("d_genre");
                v_openyn = dbox.getString("d_openyn");
                v_userid = dbox.getString("d_userid");
                v_name=dbox.getString("d_name");
                v_indate = dbox.getString("d_indate");
                v_viewcnt = dbox.getString("d_viewcnt");
                v_useyn = dbox.getString("d_useyn");

                v_dispnum = dbox.getInt("d_dispnum");
                v_totalpage = dbox.getInt("d_totalpage");
                v_totalrowcount = dbox.getInt("d_totalrowcount");
%>
                <tr>
                    <td class="table_01"><%= v_openyn.equals("Y") ? "*" : v_dispnum%></td>
                    <td <%=v_openyn.equals("Y") ? "class='table_02_6'" : "class='table_02_2'"%>><a href="javascript:view(<%=v_seq%>, <%= v_pageno %>)"><%=v_lecnm%></a></td>
                    <td <%=v_openyn.equals("Y") ? "class='table_02_5'" : "class='table_02_1'"%>><%=v_toturnm%></td>
                    <td <%=v_openyn.equals("Y") ? "class='table_02_5'" : "class='table_02_1'"%>><%=v_name%></td>
                    <td <%=v_openyn.equals("Y") ? "class='table_02_5'" : "class='table_02_1'"%>><%=FormatDate.getFormatDate(v_indate,"yyyy/MM/dd")%></td>
                    <td <%=v_openyn.equals("Y") ? "class='table_02_5'" : "class='table_02_1'"%>><%=v_useyn%></td>
                    <td <%=v_openyn.equals("Y") ? "class='table_02_5'" : "class='table_02_1'"%>><%=v_viewcnt%></td>
                </tr>
<%
        }
%>

            </table>
            <!-- �������� ��� ��  //-->

            <!-- total ���� //-->
            <br />
            <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="right" valign="absmiddle">
                        <%= PageUtil.printPageSizeList(v_totalpage, v_pageno, 0, v_pagesize, v_totalrowcount) %>
                    </td>
                </tr>
            </table>
            <!-- total �� //-->

            <br />
        </td>
    </tr>
</table>
</form>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
