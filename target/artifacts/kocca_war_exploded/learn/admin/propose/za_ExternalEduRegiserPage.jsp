<%
//**********************************************************
//  1. ��     ��: PROPOSE MEMBER LIST
//  2. ���α׷���: za_StudentMember_L.jsp
//  3. ��     ��: ��û�����ȸ
//  4. ȯ     ��: JDK 1.3
//  5. ��     ��: 1.0
//  6. ��     ��: 2004-02-04
//  7. ��     ��:
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
<!docTYpe html>
<html>
<head>
<title>�ܺα��� �ϰ��԰� - ��û�԰� - ������ - �ѱ���������ī����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="text/javascript" src="/script/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
<!--

    // top.document.title = document.title;

    $(function() {
        $("#oGrcode").bind("change", function(){
            var param = "type=sqlID&sqlID=selectBox.grYearList&param=" + $(this).val();
            $.ajaxSetup({cache:false});
            $.ajax({
                    type : "get"
                ,   url : "/learn/admin/common/za_GetSelectBoxAjaxResult.jsp"
                ,   dataType : "json"
                ,   data : param
                ,   success : fnSetGrYear
                ,   complete : function(arg1, arg2) {
                        // alert("complete : " + arg1);
                    }
                ,   error :  function(arg1, arg2) {
                        // alert("error : " + arg1);
                    }
            });
        });

        $("#oGyear").bind("change", function(){
            var grcode = $("#oGrcode").val();
            var param = "type=sqlID&sqlID=selectBox.grSeqList&param=" + grcode + "," + $(this).val();
            $.ajaxSetup({cache:false});
            $.ajax({
                    type : "get"
                ,   url : "/learn/admin/common/za_GetSelectBoxAjaxResult.jsp"
                ,   dataType : "json"
                ,   data : param
                ,   success : fnSetGrSeq
                ,   complete : function(arg1, arg2) {
                        // alert("complete : " + arg1);
                    }
                ,   error :  function(arg1, arg2) {
                        // alert("error : " + arg1);
                    }
            });
        });

    });

    /**
     * ���� �׷캰 ���� selectbox ����
     */
    function fnSetGrYear( result ) {
        $("#oGyear").empty();
        $("#oGrseq").empty();
        $("#oSubjcourse").empty();
        $("#oGyear").append("<option value=\"\">-- ���� --</option>");
        $("#oGrseq").append("<option value=\"\">-- ���� --</option>");

        if ( result.selectBoxList.length > 0 ) {
            $.each( result.selectBoxList, function() {
                $("#oGyear").append("<option value=\"" + this.d_code + "\">" + this.d_codenm + "</option>");
            });

        }
    }

    /**
     * ���� �׷� ������ �������� selectbox ����
     */
    function fnSetGrSeq( result ) {
        $("#oGrseq").empty();
        $("#oSubjcourse").empty();
        $("#oGrseq").append("<option value=\"\">-- ���� --</option>");

        if ( result.selectBoxList.length > 0 ) {
            $.each( result.selectBoxList, function() {
                $("#oGrseq").append("<option value=\"" + this.d_code + "\">" + this.d_codenm + "</option>");
            });
        }
    }

    function fnRegisterExternalEdu() {
        if( $("#oGrcode").val() == "" ) {
            alert("�����׷��� �����ϼ���.");
            $("#oGrcode").focus();
            return;
        } else if( $("#oGyear").val() == "" ) {
            alert("������ �����ϼ���.");
            $("#oGyear").focus();
            return;
        } else if( $("#oGrseq").val() == "" ) {
            alert("���������� �����ϼ���.");
            $("#oGrseq").focus();
            return;
        } else if( $("#oEduFile").val() == "" ) {
            alert("���� ������ ������ּ���.");
            $("#oEduFile").focus();
            return;
        }

        var fileExt = "";
        var idx = $("#oEduFile").val().lastIndexOf(".");

        fileExt = $("#oEduFile").val().substring(idx + 1, $("#oEduFile").val().length);

        if (fileExt.toLowerCase() != "xls" ) {
            alert("Ȯ���ڰ� xls�� ���� ������ ����� �ּ���.");
            $("#oEduFile").focus();
            return;
        }

        if ( confirm("������ �������� ����Ͻðڽ��ϱ�?") ) {
            $("#oProcess").val("register");
            $("#oExternalEduForm").attr("action", "/servlet/controller.propose.ExternalEduServlet").submit();
        } else {
            return;
        }
    }
//-->
</script>
</head>
<body bgcolor="#ffffff" text="#000000" style="margin-left:0px; margin-top:0px;">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" valign="top">

            <!-- title ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
                <tr>
                    <td style="font-size:20px; font-weight:bold; padding-top:12px;">�ܺα��� �ϰ��԰�</td>
                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
                </tr>
            </table>
            <!-- title �� //-->
            <br/>

            <form id="oExternalEduForm" name="externalEduForm" method="post" enctype="multipart/form-data">
                <input type="hidden" id="oProcess" name="process" value="" />
            <table class="table_out" cellspacing="1" cellpadding="5">
                <colgroup>
                    <col style="width:12%" />
                    <col style="width:32%" />
                    <col style="width:12%" />
                    <col style="width:44%" />
                </colgroup>
                <tr>
                    <td colspan="4" class="table_top_line"></td>
                </tr>
                <tr>
                    <th class="table_title">�����׷�</th>
                    <td class="table_02_2" colspan="3">
                        <kocca:selectBox name="grcode" id="oGrcode" optionTitle="-- �����׷� --" type="sqlID" sqlID="selectBox.grcodeList" isLoad="true" />
                    </td>
                </tr>
                <tr>
                    <th class="table_title">����</th>
                    <td class="table_02_2">
                        <select name="gyear" id="oGyear">
                            <option value="">-- ���� --</option>
                        </select>
                    </td>
                    <th class="table_title">��������</th>
                    <td class="table_02_2">
                        <select name="grseq" id="oGrseq">
                            <option value="">-- ���� --</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th class="table_title">���� ����</th>
                    <td class="table_02_2" colspan="3">
                        <input type="file" id="oEduFile" name="p_eduFile" style="width:570px; border:1px solid;"/>
                        <a href="/servlet/controller.library.DownloadServlet?p_savefile=\upload\bulletin\b2b_edu_list_sample.xls&p_realfile=b2b_edu_list_sample.xls" style="font-weight:bold; color:#D02D9C;">���� ���� �ٿ�ε�</a>
                    </td>
                </tr>
            </table>
            </form>
            <br/>

            <!-- ����, ��� ��ư ���� //-->
            <table width="11%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="center"><a href="javascript:fnRegisterExternalEdu();"><img src="/images/admin/button/btn_register.gif" border="0"></a></td>
                </tr>
            </table>
            <!-- ����, ��� ��ư �� //-->

            <!-- ���ǻ��� ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="dir_txt"><b><font size="3">(���ǻ��� - �ʵ�)</font></b></td>
                </tr>
                <tr>
                    <td height="8"></td>
                </tr>
                <tr>
                    <td height="20" class="dir_txt">1. <font color="#e60873"><a href="/servlet/controller.library.DownloadServlet?p_savefile=\upload\bulletin\b2b_edu_list_sample.xls&p_realfile=b2b_edu_list_sample.xls" style="font-weight:bold; color:#D02D9C;">���� ���� �ٿ�ε�</a>�� Ŭ���Ͽ� �Ʒ��� �׸��� ���� ����� ������ �ٿ�ε� �Ѵ�.</font></td>
                </tr>
                <tr>
                    <td height="20" class="dir_txt">2. <font color="#E60873">�ٿ�ε� �� ����� �������� �ڷḦ �ۼ��� �� Excel ������ �����Ѵ�.</font></td>
                </tr>
                <tr>
                    <td height="20" class="dir_txt">3. ��� �ڷ� �ۼ� �� <font color="#A661D7">[<b>����, �����ڵ�, ���Ῡ��</b>]</font>�� ������ �ݵ�� ���Ѿ� �Ѵ�.</td>
                </tr>
                <tr>
                    <td height="20" class="dir_txt">4. �ڷ� �ۼ� �Ϸ� ��, ����� ��� ������ �����׷�, ����, ���������� �ݵ�� �����ϰ�, ���� ������ �����Ѵ�.</td>
                </tr>
                <tr>
                    <td height="20" class="dir_txt">5. ������ Ȯ�� �� ��� ��ư�� Ŭ���Ͽ� �ϰ��԰� ó���� �����Ѵ�.</td>
                </tr>
            </table>
            <!-- ���ǻ��� �� //-->

            <br/>
            <table width="97%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="left">
                        ���� => <a href="/servlet/controller.library.DownloadServlet?p_savefile=\upload\bulletin\b2b_edu_list_sample.xls&p_realfile=b2b_edu_list_sample.xls" style="font-weight:bold; color:#f00;">�ٿ�ε�</a>
                    </td>
                </tr>
                <tr>
                    <td><img src="/images/admin/propose/b2b_edu_list_sample.jpg" border="0"></td>
                </tr>
            </table>
            <br/><br/>

        </td>
    </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
