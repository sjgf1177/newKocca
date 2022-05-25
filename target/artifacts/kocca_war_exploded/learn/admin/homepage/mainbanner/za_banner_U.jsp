<%@ page contentType="text/html;charset=euc-kr" %>
<%@page errorPage= "/learn/library/error.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "com.credu.homepage.*" %>
<%@ page import= "com.credu.library.*" %>
<%@ page import= "com.credu.common.*" %>
<%@ page import= "com.credu.course.*" %>
<%@ page import= "com.credu.system.*" %>

<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String v_process = box.getString("p_process");

    int v_seq = box.getInt("p_seq");

    int seq = 0;
    String onoff_flag= "";
    String title= "";
    String img_nm = "";
    String save_img_nm= "";
    String imgSize = "";
    String explain= "";
    String url= "";
    String url_target= "";
    int sort_order= 0;
    String start_dt= "";
    String end_dt = "";
    String reg_dt = "";
    String reg_id = "";
    String mod_dt = "";
    String mod_id = "";


    DataBox dbox = (DataBox)request.getAttribute("bannerData");

    if (dbox != null) {
        seq         = dbox.getInt("d_seq");
        onoff_flag  = dbox.getString("d_onoff_flag");
        title       = dbox.getString("d_title");
        img_nm      = dbox.getString("d_img_nm");
        save_img_nm = dbox.getString("d_save_img_nm");
        imgSize     = dbox.getString("d_img_size");
        explain     = dbox.getString("d_explain");
        url         = dbox.getString("d_url");
        url_target  = dbox.getString("d_url_target");
        sort_order  = dbox.getInt("d_sort_order");
        start_dt    = dbox.getString("d_start_dt").substring(0,4)+"/"+dbox.getString("d_start_dt").substring(4,6)+"/"+dbox.getString("d_start_dt").substring(6,8);
        end_dt      = dbox.getString("d_end_dt").substring(0,4)+"/"+dbox.getString("d_end_dt").substring(4,6)+"/"+dbox.getString("d_end_dt").substring(6,8);
        reg_dt      = dbox.getString("d_reg_dt");
        reg_id      = dbox.getString("d_reg_id");
        mod_dt      = dbox.getString("d_mod_dt");
        mod_id      = dbox.getString("d_mod_id");

    }
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/css" href="/css/admin_style.css">
<link rel="stylesheet" type="text/CSS" href="/css/jquery-ui-1.10.4.css">
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="text/javascript" src="/script/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/script/jquery-ui-1.10.4.js"></script>

<script type="text/javascript">
<!--
    $(document).ready( function() {

        //$(document).title = "�˻��� ��� | ��� | �ѱ���������ī���� ������";

        // �޷� �ʱ�ȭ
        $("#oPostStartDate").datepicker({
            showOn: "both", // ��ư�� �ؽ�Ʈ �ʵ� ��� Ķ������ �����ش�.
            buttonImage: "/images/portal/ico/ico_calendar.gif", // ��ư �̹���
            buttonText: "�Խ� ��������",
            buttonImageOnly: true, // ��ư�� �ִ� �̹����� ǥ���Ѵ�.
            changeMonth: true, // ���� �ٲܼ� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
            changeYear: true, // ���� �ٲ� �� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
            // minDate: "-7d", // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
            // maxDate: "30d", // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
            nextText: "���� ��", // next �������� ����.
            prevText: "���� ��", // prev �������� ����.
            numberOfMonths: [1,1], // �ѹ��� �󸶳� ���� ���� ǥ���Ұ��ΰ�. [2,3] �� ���, 2(��) x 3(��) = 6���� ���� ǥ���Ѵ�.
            stepMonths: 1, // next, prev ��ư�� Ŭ�������� �󸶳� ���� ���� �̵��Ͽ� ǥ���ϴ°�.
            // yearRange: "-15:", // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
            showButtonPanel: true, // Ķ���� �ϴܿ� ��ư �г��� ǥ���Ѵ�.
            currentText: "����" , // ���� ��¥�� �̵��ϴ� ��ư �г�
            closeText: "�ݱ�",  // �ݱ� ��ư �г�
            dateFormat: "yy/mm/dd", // �ؽ�Ʈ �ʵ忡 �ԷµǴ� ��¥ ����.
            showAnim: "slideDown", //�ִϸ��̼��� �����Ѵ�.
            showMonthAfterYear: true , // ��, ����� ����Ʈ �ڽ��� ��,�� ������ �ٲ��ش�.
            dayNamesMin: ["��", "��", "ȭ", "��", "��", "��", "��"], // ������ �ѱ� ����.
            monthNamesShort: ["1��","2��","3��","4��","5��","6��","7��","8��","9��","10��","11��","12��"], // ���� �ѱ� ����.

            onClose: function( selectedDate ) {
                $("#oPostEndDate" ).datepicker( "option", "minDate", selectedDate );
            }
        });

        $("#oPostEndDate").datepicker({
            showOn: "both", // ��ư�� �ؽ�Ʈ �ʵ� ��� Ķ������ �����ش�.
            buttonImage: "/images/portal/ico/ico_calendar.gif", // ��ư �̹���
            buttonText: "�Խ� ��������",
            buttonImageOnly: true, // ��ư�� �ִ� �̹����� ǥ���Ѵ�.
            changeMonth: true, // ���� �ٲܼ� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
            changeYear: true, // ���� �ٲ� �� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
            // minDate: "0d", // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
            // maxDate: "30d",
            nextText: "���� ��", // next �������� ����.
            prevText: "���� ��", // prev �������� ����.
            numberOfMonths: [1,1], // �ѹ��� �󸶳� ���� ���� ǥ���Ұ��ΰ�. [2,3] �� ���, 2(��) x 3(��) = 6���� ���� ǥ���Ѵ�.
            stepMonths: 1, // next, prev ��ư�� Ŭ�������� �󸶳� ���� ���� �̵��Ͽ� ǥ���ϴ°�.
            //yearRange: "-15:", // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
            showButtonPanel: true, // Ķ���� �ϴܿ� ��ư �г��� ǥ���Ѵ�.
            currentText: "����" , // ���� ��¥�� �̵��ϴ� ��ư �г�
            closeText: "�ݱ�",  // �ݱ� ��ư �г�
            dateFormat: "yy/mm/dd", // �ؽ�Ʈ �ʵ忡 �ԷµǴ� ��¥ ����.
            showAnim: "slideDown", //�ִϸ��̼��� �����Ѵ�.
            showMonthAfterYear: true , // ��, ����� ����Ʈ �ڽ��� ��,�� ������ �ٲ��ش�.
            dayNamesMin: ["��", "��", "ȭ", "��", "��", "��", "��"], // ������ �ѱ� ����.
            monthNamesShort: ["1��","2��","3��","4��","5��","6��","7��","8��","9��","10��","11��","12��"], // ���� �ѱ� ����.

            onClose: function( selectedDate ) {
                $("#oPostStartDate" ).datepicker( "option", "maxDate", selectedDate );
            }
        });

        $("#oPostStartDate" ).datepicker( "option", "maxDate", "<%=end_dt%>" );

    });

    /**
     * ��� ����/update
     */
    function fnSaveBanner(){
        if ($("#oTitle").val() == "") {
            alert("������ �Է��ϼ���.");
            $("#oTitle").focus();
            return ;
        }
        if ($("#oOnoffFlag").val() == "") {
            alert("��/���� ������ �����Ͻʽÿ�.");
            $("#oOnoffFlag").focus();
            return ;
        }
        if ($("#oPostStartDate").val() == "" || $("#oPostEndDate").val() == "") {
            alert("�ԽñⰣ�� �Է��Ͻʽÿ�.");
            if ($("#oPostStartDate").val() == ""){
                $("#oPostStartDate").focus();
                return ;
            }else{
                $("#oPostEndDate").focus();
                return ;
            }            
        }
        if ($("#oExplain").val() == "") {
            alert("��� ������ �Է��Ͻʽÿ�.");
            $("#oExplain").focus();
            return ;
        }
        if ($("#oLinkUrl").val() == "") {
            alert("����� ��ũ Url�� �Է��Ͻʽÿ�.");
            $("#oExplain").focus();
            return ;
        }
        if ($("#oLinkUrl").val() == "") {
            alert("����� ��ũ Url�� �Է��Ͻʽÿ�.");
            $("#oExplain").focus();
            return ;
        }
        if ($("#oTarget").val() == "") {
            alert("����� Ÿ�� â�� �����Ͻʽÿ�.");
            $("#oTarget").focus();
            return ;
        }
        if (confirm('���� ���� �Ͻðڽ��ϱ�?')) {
            document.form1.action = "/servlet/controller.homepage.BannerAdminServlet";
            document.form1.submit();
        }
    }

    /**
     * ���/����Ʈ �ٷΰ���
     */
    function fnList(){
        document.form1.action = "/servlet/controller.homepage.BannerAdminServlet";
        document.form1.p_process.value ="selectList"
        document.form1.submit();
    }

    /**
     * ÷������ �ٿ�ε�
     */
    function fnDownlaodFile( saveFileNm, fileNm ) {
        var url = "/servlet/controller.library.DownloadServlet";
        var param = "?p_savefile=" + saveFileNm + "&p_realfile=" + fileNm;

        location.href = url + param;
    }

//-->
</script>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<form ID="oSaveForm" name="form1" method="post" enctype="multipart/form-data">
    <input type = "hidden" name="p_process"    value = "update">
    <input type = "hidden" name="p_seq"    value = "<%=v_seq%>">
    <input type = "hidden" id="oOrgSaveImgNm" name="orgSaveImgNm" value="<%= save_img_nm %>">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" valign="top">

            <!-- title ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
                <tr>
                    <td style="padding-top:20px;"><h2>���ι�� ����</h2></td>
                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
                </tr>
            </table>
            <!-- title �� //-->

            <br />
            <br />
            <!-- ���ι�� ���� ���� //-->
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
                    <td height="25" class="table_title"><strong> �� �� </strong></td>
                    <td class="table_02_2" colspan="3">
                          <input type="text" id="oTitle" name="title" value="<%=title%>"size="100" class="input" maxlength="100">
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>�� / ���� ����</strong></td>
                    <td class="table_02_2" colspan="3">
                        <select id="oOnoffFlag" name="onoffFlag">
                            <option value="">-- ���� --</option>
                            <option value="ON" <%= onoff_flag.equals("ON") ? "selected='selected'" : "" %>>�¶���</option>
                            <option value="OFF" <%= onoff_flag.equals("OFF") ? "selected='selected'" : "" %>>��������</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td height="25" class="table_title"><strong>�ԽñⰣ</strong></td>
                    <td class="table_02_2" colspan="3">
                        <input type="text" id="oPostStartDate" name="postStartDate" value="<%=start_dt%>" class="input" maxlength="10" size="10" /> ~
                        <input type="text" id="oPostEndDate" name="postEndDate" value="<%=end_dt%>" class="input" maxlength="10" size="10" />
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>��� �̹���</strong></td>
                    <td class="table_02_2" colspan="3">
                          <input type="file" id="oImgFile" name="imgFile" size="84" class="input" />
<%
        if ( !img_nm.equals("") ) {
%>
                        <br/><br/>
                        <a href="javascript:fnDownlaodFile('<%= save_img_nm.replace("\\", "/") %>', '<%= img_nm %>');"><b><%= img_nm %></b></a>&nbsp;&nbsp;&nbsp;&nbsp;
                        (���ο� ������ ����ϸ� ���� ������ �����˴ϴ�.)
<%
        }
%>
                    </td>
                </tr>
<!--
                <tr id="oVodPathTr">
                    <td height="25" class="table_title"><strong>���ũ�� </strong></td>
                    <td class="table_02_2" colspan="3">
                        <input type="radio" name="imgSize" value='W3' <%= imgSize.equals("W3") ? "checked" : "" %>>860* 276&nbsp;
                        <input type="radio" name="imgSize" value='W2' <%= imgSize.equals("W2") ? "checked" : "" %>>570*276&nbsp;
                        <input type="radio" name="imgSize" value='W1' <%= imgSize.equals("W1") ? "checked" : "" %>>280*276&nbsp;
                    </td>
                </tr>
-->
                <tr>
                    <td height="25" class="table_title"><strong>��ʼ���(alt tag)</strong></td>
                    <td class="table_02_2" colspan="3">
                        <textarea id="oExplain" name="explain" cols="80" rows="5" style="width: 70%; height: 150;" ><%=explain%></textarea>
                    </td>
                </tr>
                <tr id="oVodUrlTr">
                    <td height="25" class="table_title"><strong>URL(��ũ)</strong></td>
                    <td class="table_02_2" colspan="3">
                          <input type="text" id="oLinkUrl" name="linkUrl" size="100" class="input" maxlength="400" value="<%=url%>" />
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>URL Ÿ��</strong></td>
                    <td class="table_02_2" colspan="3">
                        <select id="oTarget" name="target">
                            <option value="">-- ���� --</option>
                            <option value="_blank" <%= url_target.equals("_blank") ? "selected='selected'" : "" %>>��â</option>
                            <option value="_self" <%= url_target.equals("_self") ? "selected='selected'" : "" %>>����â</option>
                        </select>
                    </td>
                </tr>
            </table>
            <!-- ���ι�� �Է� ��� �� //-->

    <br />
    <!-- ��ư ���� //-->
    <table width="11%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td align="center"><a href="javascript:fnSaveBanner();"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
            <td align="center"><a href="javascript:fnList()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
        </tr>
    </table>
    <!-- ��ư �� //-->


      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
