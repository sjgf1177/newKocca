<%
//**********************************************************
//  1. ��      ��: �԰� FileToDB
//  2. ���α׷��� : za_ProposeFileToDB.jsp
//  3. ��      ��: �԰� FileToDB
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 0.1
//  6. ��      ��:
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="com.credu.system.*" %>
<%@ page import="com.credu.library.*" %>
<%@ page import="com.credu.common.*" %>
<%@ page import="com.credu.propose.*" %>

<%@ taglib uri="/tags/KoccaTaglib" prefix="kocca" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet"  scope="page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String ss_grcode = box.getString("s_grcode");           //�����׷�
    String ss_gyear = box.getString("s_gyear");            //�⵵
    String ss_grseq = box.getString("s_grseq");            //��������
    String ss_grseqnm = box.getString("s_grseqnm");          //����������
    String ss_upperclass = box.getString("s_upperclass");      //������з�
    String ss_middleclass = box.getString("s_middleclass");    //�����ߺз�
    String ss_lowerclass = box.getString("s_lowerclass");      //�����Һз�
    String ss_subjcourse = box.getString("s_subjcourse");       //����&�ڽ�
    String ss_subjseq = box.getString("s_subjseq");          //���� ����
    String s_subjsearchkey = box.getString("s_subjsearchkey");
    String v_stuoverlap = box.getStringDefault("p_stuoverlap", "Y");
    String v_isgraduated = box.getStringDefault("p_isgraduated", "Y");

    String v_file1 = box.getString("p_file");
%>
<html>
<head>
<title>�԰�FileToDB11</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="text/javascript" src="/script/jquery-1.3.2.min.js"></script>
<script language="VBScript" src = "/script/cresys_lib.vbs"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

    /**
     * �ϰ� �԰�ó�� (���)
     */
    function fnRegGroupPropose() {
        action("insertFileToDB");
    }

    /**
     * �ϰ� �԰�ó�� �̸����� (���)
     */
    function fnPreview() {
        action("previewFileToDB");
    }


    function action(p_process) {
        var docForm = document.form3;

        if(blankCheck(docForm.p_file.value)){
            alert("���ε��� ���� ������ ������ �ֽñ� �ٶ��ϴ�.");
            return;
        }

        if (docForm.p_file.value.length > 0 ){
            var data = docForm.p_file.value;
            data = data.toUpperCase(data);
            if (data.indexOf(".XLS") < 0) {
                alert("���������� XLS ���ϸ� �����մϴ�.");
                return;
            }
        }

        if (document.form1.s_grcode.value == "ALL") {
            alert("�����׷��� �����ϼ���.");
            return;
        }

        if (document.form1.s_grseq.value == "ALL") {
            alert("���������� �����ϼ���.");
            return;
        }

        top.ftop.setPam();

        /*if (document.form1.grcodeText.value == '') {
        alert("ȸ���ڵ带 �Է� �ϼ���");
        document.form1.grcodeText.focus();
        return;
        }*/
        /*
        if(docForm.p_stuoverlap.checked == true) {
        docForm.p_stuoverlap.value = "Y";
        }else{
        docForm.p_stuoverlap.value = "N";
        }*/


        if(docForm.p_isgraduated.checked == true) {
            docForm.p_isgraduated.value = "Y";
        }else{
            docForm.p_isgraduated.value = "N";
        }

        docForm.s_subjnm.value = document.form1.s_subjcourse.options[document.form1.s_subjcourse.selectedIndex].text;
        docForm.s_grcodenm.value = document.form1.s_grcode.options[document.form1.s_grcode.selectedIndex].text;
        docForm.s_subjseqgrnm.value = document.form1.s_subjseq.options[document.form1.s_subjseq.selectedIndex].text;

        docForm.s_grcode.value = document.form1.s_grcode.value;
        docForm.s_gyear.value = document.form1.s_gyear.value;
        docForm.s_grseq.value = document.form1.s_grseq.value;
        docForm.s_upperclass.value = document.form1.s_upperclass.value;
        docForm.s_middleclass.value = document.form1.s_middleclass.value;
        docForm.s_subjcourse.value = document.form1.s_subjcourse.value;
        docForm.s_subjseq.value = document.form1.s_subjseq.value;
        docForm.s_usergrcode.value =  document.form1.grcodeText.value;

        docForm.action = "/servlet/controller.propose.AcceptServlet";
        docForm.p_process.value = p_process;                              //insertFileToDB,previewFileToDB
        docForm.submit();
    }

    function whenSelection(p_action) {
        document.form1.p_process.value = "proposeFileToDB";
        document.form1.p_action.value = p_action;
        document.form1.submit();
    }


    // �˻����� üũ
    function chkParam() {
        if (document.form1.s_grcode.value == "" || document.form1.s_grcode.value == '----') {
            alert("�����׷��� �����ϼ���.");
            return false;
        }

        if (document.form1.s_grseq.value == "" || document.form1.s_grseq.value == '----') {
            alert("���������� �����ϼ���.");
            return false;
        }

        if (document.form1.s_subjcourse.value != "" && document.form1.s_subjcourse.value != '----') {
            if (document.form1.s_subjseq.value == "" || document.form1.s_subjseq.value == '----') {
                alert("���������� �����ϼ���.");
                return false;
            }
        }
    }

    // �����ڵ� ��������
    function whenExcel() {
        if (chkParam() == false) {
            return;
        }

//        window.self.name = "proposeExcel";
        open_window("openExcel","","100","100","700","400","yes","yes","yes","yes","yes");
        document.form1.target = "openExcel";
        document.form1.action='/servlet/controller.propose.AcceptServlet';
        document.form1.p_process.value = 'proposeListExcel';
        document.form1.submit();

//        document.form1.target = window.self.name;
    }

    var startup = 0;
    function Main_s_grseq(){
        if (startup > 0) {
            changes_grseq(document.form1.s_grcode.value, document.form1.s_gyear.value);
        }
    }

    function Main_subjcourse(){
        var subjSearchKey = '';
        if(startup > 2) {
            if (document.form1.s_subjsearchkey == "undefine") {
                subjSearchKey = "";
            } else {
                subjSearchKey = document.form1.s_subjsearchkey.value;
            }

            changes_subjcourse(document.form1.s_grcode.value, document.form1.s_upperclass.value, document.form1.s_middleclass.value, document.form1.s_lowerclass.value, document.form1.s_grseq.value , subjSearchKey );
            // alert(document.form1.s_grcode.value+ " , " + document.form1.s_upperclass.value+ " , " + document.form1.s_middleclass.value+ " , " + document.form1.s_lowerclass.value+ " , " + document.form1.s_subjseq.value+ " , " +'' );
        }
        startup++;
    }

    function searchTaxBill() {
        var url = "/servlet/controller.library.SearchServlet?p_process=taxBill&s_grcode=<%=ss_grcode%>&s_gyear=<%=ss_gyear%>&s_grseq=<%=ss_grseq%>&p_searchtext=";
        open_window("",url,"100","70","595","455",'','','','true');
    }

    function returnTaxBill(data) {
        $("#tid").val(data.d_tid);
        $("#taxBillName").html("<b>��꼭��</b> : " + data.d_goodname);
    }

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

        $("#oGrseq").bind("change", function(){
            var grcode = $("#oGrcode").val();
            var gyear = $("#oGyear").val();
            var subjSearchKey = $("#oSubjSearchKey").val();
            subjSearchKey = (subjSearchKey == "") ? "%" : subjSearchKey;
            var param = "type=sqlID&sqlID=selectBox.subjList&param=" + grcode + "," + gyear + "," + $(this).val() + "," + subjSearchKey;
            $.ajaxSetup({cache:false});
            $.ajax({
                    type : "get"
                ,   url : "/learn/admin/common/za_GetSelectBoxAjaxResult.jsp"
                ,   dataType : "json"
                ,   data : param
                ,   success : fnSetSubjList
                ,   complete : function(arg1, arg2) {
                        // alert("complete : " + arg1);
                    }
                ,   error :  function(arg1, arg2) {
                        // alert("error : " + arg1);
                    }
            });
        });

        $("#oSubjcourse").bind("change", function(){

            if ( $(this).val() == "" ) {
                $("#oSubjseq").val("");
            } else {
                var grcode = $("#oGrcode").val();
                var gyear = $("#oGyear").val();
                var grseq = $("#oGrseq").val();
                var param = "type=sqlID&sqlID=selectBox.subjSeqList&param=" + grcode + "," + gyear + "," + grseq + "," + $(this).val();

                $.ajaxSetup({cache:false});
                $.ajax({
                        type : "get"
                    ,   url : "/learn/admin/common/za_GetSelectBoxAjaxResult.jsp"
                    ,   dataType : "json"
                    ,   data : param
                    ,   success : fnSetSubjSeqList
                    ,   complete : function(arg1, arg2) {
                            // alert("complete : " + arg1);
                        }
                    ,   error :  function(arg1, arg2) {
                            // alert("error : " + arg1);
                        }
                });
            }
        });

        $("#oUpperclass").bind("change", function(){
            var param = "type=sqlID&sqlID=selectBox.subjAttMiddleList&param=" + $(this).val();
            $.ajaxSetup({cache:false});
            $.ajax({
                    type : "get"
                ,   url : "/learn/admin/common/za_GetSelectBoxAjaxResult.jsp"
                ,   dataType : "json"
                ,   data : param
                ,   success : fnSetMiddleClass
                ,   complete : function(arg1, arg2) {
                        // alert("complete : " + arg1);
                    }
                ,   error :  function(arg1, arg2) {
                        // alert("error : " + arg1);
                    }
            });
        });

        $("#oMiddleclass").bind("change", function(){
            var param = "type=sqlID&sqlID=selectBox.subjAttLowerList&param=" + $("#oUpperclass").val() + "," + $(this).val();
            $.ajaxSetup({cache:false});
            $.ajax({
                    type : "get"
                ,   url : "/learn/admin/common/za_GetSelectBoxAjaxResult.jsp"
                ,   dataType : "json"
                ,   data : param
                ,   success : fnSetLowerClass
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
        $("#oSubjseq").empty();
        $("#oGyear").append("<option value=\"\">-- ���� --</option>");
        $("#oGrseq").append("<option value=\"\">-- ���� --</option>");
        $("#oSubjcourse").append("<option value=\"ALL\">-- ��ü --</option>");
        $("#oSubjseq").append("<option value=\"ALL\">-- ��ü --</option>");

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
        $("#oSubjseq").empty();
        $("#oGrseq").append("<option value=\"\">-- ���� --</option>");
        $("#oSubjcourse").append("<option value=\"ALL\">-- ��ü --</option>");
        $("#oSubjseq").append("<option value=\"ALL\">-- ��ü --</option>");


        if ( result.selectBoxList.length > 0 ) {
            $.each( result.selectBoxList, function() {
                $("#oGrseq").append("<option value=\"" + this.d_code + "\">" + this.d_codenm + "</option>");
            });
        }
    }

    /**
     * ���������� ���� selectbox ����
     */
    function fnSetSubjList( result ) {
        $("#oSubjcourse").empty();
        $("#oSubjseq").empty();
        $("#oSubjcourse").append("<option value=\"ALL\">-- ��ü --</option>");
        $("#oSubjseq").append("<option value=\"ALL\">-- ��ü --</option>");


        if ( result.selectBoxList.length > 0 ) {
            $.each( result.selectBoxList, function() {
                $("#oSubjcourse").append("<option value=\"" + this.d_code + "\">" + this.d_codenm + "</option>");
            });
        }
    }

    /**
     * ������ �������� selectbox ����
     */
    function fnSetSubjSeqList( result ) {
        $("#oSubjseq").empty();
        $("#oSubjseq").append("<option value=\"ALL\">-- ��ü --</option>");
        if ( result.selectBoxList.length > 0 ) {
            $.each( result.selectBoxList, function() {
                $("#oSubjseq").append("<option value=\"" + this.d_code + "\">" + this.d_codenm + "</option>");
            });

        }
    }

    /**
     * �˻����ǿ��� ��з� ���ý� callback function
     */
    function fnSetMiddleClass( result ) {
        $("#oMiddleclass").empty();
        $("#oMiddleclass").append("<option value=\"\">-- ��ü --</option>");
        $("#oLowerclass").empty();
        $("#oLowerclass").append("<option value=\"\">-- ��ü --</option>");

        if ( result.selectBoxList.length > 0 ) {
            $.each( result.selectBoxList, function() {
                $("#oMiddleclass").append("<option value=\"" + this.d_code + "\">" + this.d_codenm + "</option>");
            });

        }
    }

    /**
     * �˻����ǿ��� �ߺз� ���ý� callback function
     */
    function fnSetLowerClass( result ) {
        $("#oLowerclass").empty();
        $("#oLowerclass").append("<option value=\"\">-- ��ü --</option>");

        if ( result.selectBoxList.length > 0 ) {
            $.each( result.selectBoxList, function() {
                $("#oLowerclass").append("<option value=\"" + this.d_code + "\">" + this.d_codenm + "</option>");
            });

        }
    }
    /**
     * ?
     */
    function fnSubjSearchByName() {
        $("#oGrseq").trigger("change");
    }

//-->
</script>
</head>
<body bgcolor="#ffffff" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" valign="top">
        <!-- title ���� //-->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
            <tr>
                <td><img src="/images/admin/propose/p_title06.gif" ></td>
                <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
            </tr>
        </table>
        <!-- title �� //-->

        <br/>
        <!-- form ���� //-->
        <form name="form1" method="post" action="/servlet/controller.propose.AcceptServlet">
            <input type="hidden" name="p_process" value="">
            <input type="hidden" name="p_action"  value="">
        <table cellspacing="0" cellpadding="1" class="form_table_out">
            <tr>
                <td bgcolor="#C6C6C6" align="center">
                    <table cellspacing="0" cellpadding="0" class="form_table_bg" >
                        <colgroup>
	                        <col style="width:8%" />
	                        <col style="width:31%" />
	                        <col style="width:8%" />
	                        <col style="width:10%" />
	                        <col style="width:8%" />
	                        <col style="width:30%" />
	                        <col style="width:5%" />
	                    </colgroup>
                        <tr>
                               <td width="12%" class="_tdT">
                                   <font color="red">��</font>�����׷�
                               </td>
                               <td width="22%" class="_tdS">
                                   <kocca:selectBox name="s_grcode" id="oGrcode" optionTitle="-- �����׷� --" type="sqlID" sqlID="selectBox.grcodeList" selectedValue="<%= ss_grcode %>" isLoad="true" />
                               </td>
                               <td width="12%" class="_tdT">
                                   <font color="red">��</font>����
                               </td>
                               <td width="14%" class="_tdS">
<%
if ( !ss_gyear.equals("") ) {
%>
                                   <kocca:selectBox name="s_gyear" id="oGyear" optionTitle="-- ���� --" type="sqlID" param="<%= ss_grcode %>" sqlID="selectBox.grYearList" selectedValue="<%= ss_gyear %>" isLoad="true" />
<%
} else {
%>
                                   <kocca:selectBox name="s_gyear" id="oGyear" optionTitle="-- ���� --" type="sqlID" isLoad="false" />
<%
}
%>
                               </td>
                               <td width="12%" class="_tdT">
                                   <font color="red">��</font>��������
                               </td>
                               <td width="28%" class="_tdS">
<%
if ( !ss_grseq.equals("") ) {
%>
                                   <kocca:selectBox name="s_grseq" id="oGrseq" optionTitle="-- ���� --" type="sqlID" param="<%= ss_grcode + ',' + ss_gyear %>" sqlID="selectBox.grSeqList" selectedValue="<%= ss_grseq %>" isLoad="true" />
<%
} else {
%>
                                   <kocca:selectBox name="s_grseq" id="oGrseq" optionTitle="-- ���� --" type="sqlID" isLoad="false" />
<%
}
%>
                               </td>
                           </tr>
                           <tr>
                               <td class="_tdT">��з�</td>
                               <td class="_tdS">
                                   <kocca:selectBox name="s_upperclass" id="oUpperclass" optionTitle="-- ��ü --" type="sqlID" sqlID="selectBox.subjAttUpperList" selectedValue="<%= ss_upperclass %>" isLoad="true" />
                               </td>
                               <td class="_tdT">�ߺз�</td>
                               <td class="_tdS">
<%
if ( !ss_middleclass.equals("") ) {
%>
                                   <kocca:selectBox  name="s_middleclass" id="oMiddleclass" optionTitle="-- ��ü --" type="sqlID" sqlID="selectBox.subjAttMiddleList" param="<%= ss_upperclass %>" selectedValue="<%= ss_middleclass %>" isLoad="true" />
<%
} else {
%>
                                   <select name="s_middleclass" id="oMiddleclass">
                                       <option value="">-- ��ü --</option>
                                   </select>
<%
}
%>
                               </td>
                               <td class="_tdT">�Һз�</td>
                               <td class="_tdS">
<%
if ( !ss_lowerclass.equals("") ) {
%>
                                   <kocca:selectBox name="s_lowerclass" id="oLowerclass" optionTitle="-- ��ü --" type="sqlID" sqlID="selectBox.subjAttLowerList" param="<%= ss_upperclass + ',' + ss_middleclass %>" selectedValue="<%= ss_lowerclass %>" isLoad="true" />
<%
} else {
%>
                                   <select name="s_lowerclass" id="oLowerclass">
                                       <option value="">-- ��ü --</option>
                                   </select>
<%
}
%>
                               </td>
                           </tr>
                           <tr>
                               <td class="_tdT">�����˻�</td>
                               <td class="_tdS">
                                   <input type="text" name="s_subjsearchkey" id="oSubjSearchKey" size="17" onkeypress="if(event.keyCode=='13') fnSubjSearchByName();" value="<%=s_subjsearchkey%>">
                                   <a href="javascript:fnSubjSearchByName()" ><img src="/images/admin/button/search3_butt.gif" border="0" align="absmiddle"></a>
                               </td>
                               <td class="_tdT">����</td>
                               <td colspan="3" class="_tdS">
<%
if ( !ss_subjcourse.equals("") ) {
    s_subjsearchkey = ( s_subjsearchkey.equals("") ) ? "%" : s_subjsearchkey;
%>
                                   <kocca:selectBox name="s_subjcourse" id="oSubjcourse" optionTitle="-- ��ü --" optionTitleValue="ALL" type="sqlID" param="<%= ss_grcode + ',' + ss_gyear + ',' + ss_grseq + ',' + s_subjsearchkey %>" sqlID="selectBox.subjList" selectedValue="<%= ss_subjcourse %>" isLoad="true" />
<%
} else {
%>
                                   <kocca:selectBox name="s_subjcourse" id="oSubjcourse" optionTitle="-- ��ü --" optionTitleValue="ALL" type="sqlID" isLoad="false" />
<%
}
%>
                             </td>
                           </tr>
                           <tr>
                               <td class="_tdT">��������</td>
                               <td class="_tdS">
                                   <kocca:selectBox name="s_subjseq" id="oSubjseq" optionTitle="-- ��ü --" optionTitleValue="ALL" type="sqlID" isLoad="false" />
                               </td>
                               <td class="_tdT"><!--<font color="red">��</font>-->ȸ���ڵ�</td>
                               <td class="_tdS"><input type="text" id="grcodeText" name="grcodeText" ></td>
                               <td colspan="2" align="right"><a href="javascript:whenExcel()"><img src="/images/admin/button/btn_course_numexcel.gif" border="0"></a></td>
                           </tr>

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
            <!-- form �� //-->

            <br/>
            <!-- ã�ƺ��� ���� //-->
            <form name="form3" method="post" action="/servlet/controller.propose.AcceptServlet" enctype="multipart/form-data">
                <input type="hidden" name="p_process" value="">
                <input type="hidden" name="p_action" value="">
                <input type="hidden" name="s_grcode" value="">
                <input type="hidden" name="s_gyear" value="">
                <input type="hidden" name="s_grseq" value="">
                <input type="hidden" name="s_upperclass" value="">
                <input type="hidden" name="s_middleclass" value="">
                <input type="hidden" name="s_subjcourse" value="">
                <input type="hidden" name="s_subjseq" value="">
                <input type="hidden" name="s_subjnm" value="">
                <input type="hidden" name="s_grcodenm" value="">
                <input type="hidden" name="s_subjseqgrnm" value="">
                <input type="hidden" name="s_usergrcode" value="">
                <input type="hidden" name="p_inputlevel" value="student">

            <table width="97%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="center">
                        <table width="21%" height="26" border="0" cellpadding="0" cellspacing="0">
                            <tr id="billneedbutton" style="display:none">
                                <td>
                                    <input type="hidden" name="tid" id="tid" disabled/><font id="taxBillName"><b>��꼭��</b> : </font>
                                </td>
                                <td align="right">
                                    <a href="javascript:searchTaxBill()"><img src="/images/admin/button/search3_butt.gif" border=0/></a>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <input name="p_file" type="FILE" class="input" size="145">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <!-- ã�ƺ��� �� //-->
            <br/>
            <!-- �̸�����, Ȯ��, ��� ��ư ���� //-->
            <table width="97%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td colspan="2" height="20">
                        <b>��꼭�߱�</b>
                        <input type="radio" name="billYn" value="true" onclick="$('#billneedbutton').fadeIn(300);$('#tid').attr('disabled','')"> Yes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="billYn" value="false" onclick="$('#billneedbutton').fadeOut(200);$('#tid').attr('disabled','true');" checked> No
                    </td>
                </tr>
                <tr>
                    <td width=10></td>
                    <td height="20" align="right"><a href="javascript:fnRegGroupPropose()"><img src="/images/admin/button/btn_add.gif"  border="0"></a></td>
                    <td width=10></td>
                    <td align="right" width="32"><a href="javascript:fnPreview()"><img src="/images/admin/button/btn_preview.gif" border="0"></a></td>
                </tr>
            </table>

            <table width="97%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="928" height="20" align="left">������üũ ��������</td>
                </tr>
                <tr>
                    <td width="928" height="20" align="left"><input type="checkbox" disabled checked>�������� ��(�⺻ : ������ ������ ������ ����ó��)</td>
                </tr>
                <tr>
                    <td width="928" height="20" align="left"><input type="checkbox" disabled checked>ȸ�� DB ��ȸ(�⺻ : ȸ�� DB�� �������� ������ ����ó��)</td>
                </tr>
                <tr>
                    <td width="928" height="20" align="left"><input type="checkbox" disabled checked>������û��/�н���üũ(�⺻ : �ش� ���������� ����ڰ� ������û�� �ѱ���� ������ ����ó��)</td>
                </tr>
                <tr>
                    <td width="928" height="20" align="left"><input type="checkbox" name="p_isgraduated" <%if(v_isgraduated.equals("Y")){%>checked<%}%>>�̼�(����)��üũ (�ش���� �̼��� ����ó��)</td>
                </tr>
            </table>
            </form>
            <!-- �̸�����, Ȯ��, ��� ��ư �� //-->
            <br/><br/><br/>

            <!-- ���ǻ��� ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="dir_txt"><b><font size="3">(���ǻ��� - �ʵ�)</font></b></td>
                </tr>
                <tr>
                    <td height="8"></td>
                </tr>
                <tr>
                    <td height="20" class="dir_txt">1. <font color="#E60873">�����׷�� ����, ���������� ������ �� "����/�����ڵ� �����ٿ�ε�"�� ������ ����� �ٿ�ε�</font></td>
                </tr>
                <tr>
                    <td height="20" class="dir_txt">2. <font color="#E60873">�ٿ�ε� �� ������ �������� �����ID�� �߰��Ͽ� �ݵ�� "Excel" ������ �����Ѵ�.</font></td>
                </tr>
                <tr>
                    <td height="20" class="dir_txt">3. �������� �ۼ��� <font color="#A661D7">[<b>�н���ID,( ���� ), ( ���� )</b>]</font>�� ������ ���� ��.</td>
                </tr>
            </table>
            <!-- ���ǻ��� �� //-->

            <br/>
            <table width="97%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="left">����</td>
                </tr>
                <tr>
                    <td><img src="/images/admin/propose/PropExcel3.gif" border="0"></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td><%@ include file = "/learn/library/getJspName.jsp" %></td>
    </tr>
</table>
</body>
</html>