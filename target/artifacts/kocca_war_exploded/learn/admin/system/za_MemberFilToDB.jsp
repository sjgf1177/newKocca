<%
//**********************************************************
//  1. ��      ��: ȸ�� FileToDB
//  2. ���α׷��� : za_MemberFileToDB.jsp
//  3. ��      ��: ȸ�� FileToDB
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 0.1
//  6. ��      ��:
//  7. ��      ��: ������ 2005.07.19
//***********************************************************
%>
<%@ page contentType="text/html;charset=MS949" %>
<%@ page errorPage="/learn/library/error.jsp" %>

<%@ page import="com.credu.library.RequestBox" %>
<%@ page import="com.credu.library.RequestManager" %>

<%@ taglib uri="/tags/KoccaTaglib" prefix="kocca" %>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    if ( box == null ) {
        box = RequestManager.getBox(request);
    }
%>
<html>
<head>
<title>ȸ�� ������� | �ѱ���������ī���� ������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script type = "text/javascript" src = "/script/cresys_lib.js"></script>
<script type = "text/javascript" src = "/script/jquery-1.3.2.min.js"></script>
<script type = "text/javascript" >

    /**
     * ȸ�� �ϰ� ���
     */
    function fnRegisterMember() {
        var checkedVal = Number( $("input:radio[name='actType']:checked").val() );
        var process = ( checkedVal == 1) ? "insertMember" : "updateMemberPassword";

        fnDoAction(process);
    }

    /**
     * ȸ�� ��� �̸�����
     */
    function fnPreview() {
        var checkedVal = Number( $("input:radio[name='actType']:checked").val() );
        if ( checkedVal == 2) {
            alert("�̸������ ȸ����ϸ� ��� �����մϴ�.");
            return;
        }
        fnDoAction("previewFileToDB");
    }

    function fnDoAction(p_process) {

        var r = $.trim($("[name='p_grcode']").val());

        if(r == "") {
            alert("�����׷��� ���� �ϼ���.");
            return;
        }

        if( blankCheck( document.form3.p_file.value) ) {
            alert("����� ���� ������ ������ �ּ���");
            return;
        }

        if ( document.form3.p_file.value.length > 0 ) {
            var data = document.form3.p_file.value;
            data = data.toUpperCase(data);
            if (data.indexOf(".XLS") < 0) {
                alert("��� ���������� ���� ����(Ȯ���� xls)�� �����մϴ�.");
                return;
            }
        }

        var confirmMsg = "";
        if (p_process == "insertMember"){
            confirmMsg ="ȸ�� �ϰ� ����� �����Ͻðڽ��ϱ�?";
        }else if(p_process=="previewFileToDB"){
            confirmMsg = "�̸����⸦ �����Ͻðڽ��ϱ�?";
        }else{
            confirmMsg ="ȸ�� ��й�ȣ �ϰ� ������ �����Ͻðڽ��ϱ�?";

        }

        if ( confirm( confirmMsg ) ) {
            document.form3.action = "/servlet/controller.system.MemberAdminServlet";
            document.form3.p_process.value = p_process;
            document.form3.submit();
        }

    }

    $(document).ready( function() {
        $("input:radio[name='actType']").bind("click", function() {
            var checkVal = Number( $(this).val() );

            if (checkVal == 1) {
                $("#oWarnTable1").show();
                $("#oWarnTable2").hide();
            } else if (checkVal == 2) {
                $("#oWarnTable2").show();
                $("#oWarnTable1").hide();
            }
        });

        $("#oGrcode").bind("click", function() {
            $("[name='p_grcode']").val( $(this).val() );
        });
    });
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" valign="top">
            <!--title ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
                <tr>
                    <td><img src="/images/admin/system/unite_title18.gif" ></td>
                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
                </tr>
            </table>
            <!-- title �� //-->

            <!-- ã�ƺ��� ���� //-->
            <form name="form3" method="post" enctype="multipart/form-data">
                <input type="hidden" name="p_process" value="" />
                <input type="hidden" name="p_action" value="" />
                <input type="text" name="p_grcode" value="" />

            <br />

            <table width="97%" border="0" cellspacing="0" cellpadding="8" style="border:1px solid;">
                <colgroup>
                    <col style="width:80px;" />
                    <col style="width:120px;" />
                    <col style="width:80px;" />
                    <col style="width:*;" />
                    <col style="width:172px;" />
                </colgroup>
                <tr>
                    <th style="font-family:����; font-size:13px;">�۾�����</th>
                    <td width="220">
                        <input type="radio" id="oActType1" name="actType" value="1" checked="checked" /><label for="oActType1">ȸ�����</label>
                        <input type="radio" id="oActType2" name="actType" value="2" /><label for="oActType2">��й�ȣ����</label>
                    </td>
                    <th style="font-family:����; font-size:13px;">�����׷�</th>
                    <td style="vertical-align:middle;">
                        <kocca:selectBox name="s_grcode" id="oGrcode" optionTitle="-- ���� --" type="sqlID" sqlID="selectBox.grcodeList" isLoad="true" />
                    </td>
                    <td align="center" rowspan="2">
                        <span id="oPreviewBtn"><a href="#" onclick="javascript:fnPreview()"><img src="/images/admin/button/btn_preview.gif" alt="�̸�����" border="0"></a><span>
                        <a href="javascript:fnRegisterMember()"><img src="/images/admin/button/btn_apply.gif" alt="����" border="0"></a>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="4"><input name="p_file" type="file" class="input" style="width:636px; height:24px; border:1px solid;" /></td>
                </tr>
            </table>
            <!-- ã�ƺ��� �� //-->
            <br />

            </form>

            <div id="oWarnTable1">
                <!-- ���ǻ���1 ���� //-->
                <table width="97%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="dir_txt"><b><font size="3">(���ǻ��� - �ʵ�)</font></b></td>
                    </tr>
                    <tr>
                        <td height="8"></td>
                    </tr>

                    <tr>
                        <td height="20" class="dir_txt">1. �������� ����� ���� �������� �����Ͽ� ����� ��.</td>
                    </tr>
                    <tr>
                        <td height="20" class="dir_txt">
                            2. �������� �ۼ��� ���� ������ ������ ��.
                            ( <a href = "/servlet/controller.library.DownloadServlet?p_savefile=\upload\bulletin\member_sample.xls&p_realfile=member_sample.xls"><b>��������</b></a> )
                        </td>
                    </tr>
                    <!--
                    <tr>
                        <td height="20" class="dir_txt">3. �ڵ����� (���� : 0104, ����о� : 0103, ���԰�� : 0105)</td>
                    </tr>
                    //-->
                </table>
                <!-- ���ǻ���1 �� //-->
                <br />

                <table width="98%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="left">��������</td>
                    </tr>
                    <tr>
                        <td><img src="/images/admin/system/MemberExcel.jpg" border="0"></td>
                    </tr>
                </table>
            </div>

            <div id="oWarnTable2" style="display:none;">
            <!-- ���ǻ���2 ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="dir_txt"><b><font size="3">(���ǻ��� - �ʵ�)</font></b></td>
                </tr>
                <tr>
                    <td height="8"></td>
                </tr>

                <tr>
                    <td height="20" class="dir_txt">1. �������� ����� ���� �������� �����Ͽ� ����� ��.</td>
                </tr>
                <tr>
                    <td height="20" class="dir_txt">
                        2. �������� �ۼ��� ���� ������ ������ ��.
                        ( <a href = '/servlet/controller.library.DownloadServlet?p_savefile=\upload\bulletin\member_password_sample.xls&p_realfile=member_password_sample.xls'><b>��������</b></a> )
                    </td>
                </tr>
            </table>
            <!-- ���ǻ���1 �� //-->
            <br />

            <table width="98%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align='left'>��������</td>
                </tr>
                <tr>
                    <td><img src="/images/admin/system/member_password_excel.jpg" border="0"></td>
                </tr>
            </table>
            </div>

        </td>
    </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
