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
            // minDate: "-7d", // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
            // maxDate: "30d",
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
                $("#oPostStartDate" ).datepicker( "option", "maxDate", selectedDate );
            }
        });

    });

    /**
    * ��� ����ϱ�
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
        if ($("#oImgFile").val() == "") {
            alert("��� �̹����� �����Ͻʽÿ�.");
            $("#oImgFile").focus();
            return ;
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
        if (confirm('���� ��� �Ͻðڽ��ϱ�?')) {
            document.form1.action = "/servlet/controller.homepage.BannerAdminServlet";
            document.form1.p_process.value="insert";
            document.form1.submit();
        }
    }
    
    /**
    * ��Ϻ���
    */
    function fnList(){
        document.form1.action = "/servlet/controller.homepage.BannerAdminServlet";
        document.form1.p_process.value="selectList";
        document.form1.submit();
    }
//-->
</script>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<form ID="oSaveForm" name="form1" method="post" enctype="multipart/form-data">
    <input type = "hidden" name="p_process"    value = "">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" valign="top">

            <!-- title ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
                <tr>
                    <td style="padding-top:20px;"><h2>���ι�� ���</h2></td>
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
                <tr>* ��� �׸��� �ʼ� �Է»����Դϴ�.
                    <td colspan="4" class="table_top_line"></td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong> �� �� </strong></td>
                    <td class="table_02_2" colspan="3">
                          <input type="text" id = "oTitle" name="title" size="100" class="input" maxlength="100">
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>�� / ���� ����</strong></td>
                    <td class="table_02_2" colspan="3">
                        <select id="oOnoffFlag" name="onoffFlag">
                            <option value="">-- ���� --</option>
                            <option value="ON">�¶���</option>
                            <option value="OFF">��������</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td height="25" class="table_title"><strong>�ԽñⰣ</strong></td>
                    <td class="table_02_2" colspan="3">
                        <input type="text" id="oPostStartDate" name="postStartDate" value="" class="input" maxlength="10" size="10" /> ~
                        <input type="text" id="oPostEndDate" name="postEndDate" value="" class="input" maxlength="10" size="10" />
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>��� �̹���</strong></td>
                    <td class="table_02_2" colspan="3">
                          <input type="file" id= "oImgFile" name="imgFile" size="84" class="input" />
                    </td>
                </tr>
<!--
                <tr id="oVodPathTr">
                    <td height="25" class="table_title"><strong>���ũ�� </strong></td>
                    <td class="table_02_2" colspan="3">
                        <input type="radio" name="imgSize" value='W3' >860* 276&nbsp;
                        <input type="radio" name="imgSize" value='W2' checked >570*276&nbsp;
                        <input type="radio" name="imgSize" value='W1'  >280*276&nbsp;
                    </td>
                </tr>

//-->
                <tr>
                    <td height="25" class="table_title"><strong>��ʼ���(alt tag)</strong></td>
                    <td class="table_02_2" colspan="3">
                        <textarea id="oExplain" name="explain" cols="80" rows="5" style="width: 70%; height: 150;"></textarea>
                    </td>
                </tr>
                <tr id="oVodUrlTr">
                    <td height="25" class="table_title"><strong>URL(��ũ)</strong></td>
                    <td class="table_02_2" colspan="3">
                          <input type="text" id = "oLinkUrl" name="linkUrl" size="100" class="input" maxlength="400" value="" />
                    </td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>URL Ÿ��</strong></td>
                    <td class="table_02_2" colspan="3">
                        <select id="oTarget" name="target">
                            <option value="">-- ���� --</option>
                            <option value="_blank">��â</option>
                            <option value="_self">����â</option>
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
