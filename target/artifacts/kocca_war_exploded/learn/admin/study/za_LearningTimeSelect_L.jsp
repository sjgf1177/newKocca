<%
//**********************************************************
//  1. ��      ��: LEARNING TIME SELECT LIST
//  2. ���α׷���: za_LearningTimeSelect_L.jsp
//  3. ��      ��: �н��ð���ȸ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: lyh
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>

<%@ taglib uri="/tags/KoccaTaglib" prefix="kocca" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    int     v_pageno    = box.getInt("p_pageno");
	String  v_userid    = "";
    String  v_name      = "";
    String  v_membergubunnm  = "";
    String  v_course    = "";
    String  v_cyear     = "";
    String  v_courseseq = "";
    String  v_coursenm  = "";
    String  v_subj      = "";
    String  v_year      = "";
    String  v_subjseq   = "";
    String  v_subjseqgr = "";
    String  v_subjnm    = "";
    String  v_firstedu  = "";
    String  v_totaltime = "";
    String  v_totalminute="";
    String  v_ldatestart= "";
    String  v_ldateend  = "";
    String v_isnewcourse= "";
    String  v_isonoff   =  "";
    String  v_isonoff_value="";
	String v_isbelongcourse = "";		//���������� ����
    int v_subjcnt = 0;			// ������(�ڽ�)������ ���� ������

    int     v_edutotmin = 0;
    int     v_avg_time  =  0;
    int     v_rowspan   =  0;
    int     v_total     =  0;
    int     i           =  0;

    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
    String  v_orderColumn  = box.getString("p_orderColumn");           //������ �÷���

    ArrayList list      = null;
    //DEFINED class&variable END

    //DEFINED in relation to select START
    String  ss_grcode    = box.getString("s_grcode");           //�����׷�
    String  ss_gyear     = box.getString("s_gyear");            //�⵵
    String  ss_grseq     = box.getString("s_grseq");            //��������
    String  ss_grseqnm   = box.getString("s_grseqnm");          //����������
    String  ss_upperclass = box.getString("s_upperclass");      //������з�
    String  ss_middleclass = box.getString("s_middleclass");    //�����ߺз�
    String  ss_lowerclass = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse= box.getString("s_subjcourse");       //����&�ڽ�
    String  ss_subjseq   = box.getString("s_subjseq");          //���� ����
    String  ss_company   = box.getString("s_company");          //ȸ��
    String  ss_action    = box.getString("s_action");
    String  v_ongo      = "whenSelection('go')";

    //DEFINED in relation to select END

    if (ss_action.equals("go")) {    //go button ���ýø� list ���
        list = (ArrayList)request.getAttribute("LearningTimeSelectList");
    }
    
    //����¡
    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_totalrowcount	=  0;
    int v_pagesize = 10;

    if (v_pageno == 0)  v_pageno = 1;
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));


%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    // �˻�
    function whenSelection(p_action) {
        if (p_action=="go"){
            if (chkParam() == false) {
                return;
            }
            top.ftop.setPam();
        }
        document.form1.s_action.value = p_action;
        document.form1.p_pageno.value = 1;
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
        document.form1.p_process.value = 'LearningTimeSelectList';
        document.form1.submit();
    }

    // ����
    function whenOrder(column) {
        if (document.form1.p_orderType.value == " asc") {
            document.form1.p_orderType.value = " desc";
        } else {
            document.form1.p_orderType.value = " asc";
        }

        document.form1.p_orderColumn.value = column;
        whenSelection("go");
    }

    // ���� ���
    function whenExcel() {
       if(document.form1.s_action.value != "go"){
            alert('���� ��ȸ�� �ֽʽÿ�');
            return;
       }

       //������½� ��� ���ڵ尡 �������� �ϱ� ���� ������, �ѹ� �ӽ�����
       var temp_pagesize = document.form1.p_pagesize.value; 
       var temp_pageno   = document.form1.p_pageno.value; 

       //������½� ��� ���ڵ尡 �������� �ϱ� ���� ������, �ѹ�����
       document.form1.p_pagesize.value = 10000;
       document.form1.p_pageno.value = 1;
       
       //window.self.name = "LearningTimeSelectList";
       //open_window("openExcel","","100","100","700","400","yes","yes","yes","yes","yes");
       //document.form1.target = "openExcel";
       document.form1.target = "_self";
       document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
       document.form1.p_process.value = 'LearningTimeSelectExcel';
       document.form1.submit();

       //ȭ����½� ���� ���ڵ尡 �������� �ϱ� ���� ������, �ѹ� ������� ����
       document.form1.p_pagesize.value = temp_pagesize;
       document.form1.p_pageno.value = temp_pageno;
        
    }

    // �Ķ���� üũ
    function chkParam() {
        if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
            alert("�����׷��� �����ϼ���.");
            return false;
        }
        if (document.form1.s_grseq.value == 'ALL' || document.form1.s_grseq.value == '----') {
            alert("���������� �����ϼ���.");
            return false;
        }
/*
		if (document.form1.s_subjcourse.value == 'ALL' ) {
			alert("������ �����ϼ���.");
			return false;
		}
*/
    }

//function open_window(name, url, left, top, width, height, toolbar, menubar, statusbar, scrollbar, resizable) {

    // ���κ� �н�â ���� �α� �˾�
    function whenPersonalTimeList(subj, year, subjseq, userid) {
//        window.self.name = "LearningTimeList";
        open_window("PersonalTimeList","","100","100","800","600","no","no","yes","yes","yes");
        document.form1.p_subj.value = subj;
        document.form1.p_year.value = year;
        document.form1.p_subjseq.value = subjseq;
        document.form1.p_userid.value = userid;
        document.form1.p_process.value = 'PersonalTimeList';
        document.form1.target = "PersonalTimeList";
        document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
        document.form1.submit();
//        document.form1.target = window.self.name;
    }

    // ���κ� ���� ���� �α� �˾�
    function whenPersonalProgressList(subj, year, subjseq, userid) {
//        window.self.name = "LearningProgressList";
        open_window("PersonalProgressList","","100","100","800","600","no","no","yes","yes","yes");
        document.form1.p_subj.value = subj;
        document.form1.p_year.value = year;
        document.form1.p_subjseq.value = subjseq;
        document.form1.p_userid.value = userid;
        document.form1.p_process.value = 'PersonalProgressList';
        document.form1.target = "PersonalProgressList";
        document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
        document.form1.submit();
//        document.form1.target = window.self.name;
    }

    // �������
    function whenMemberInfo(userid) {
//        window.self.name = "ProposeMemberList";
        open_window("openMember","","100","100","600","460");
        document.form1.target = "openMember";
        document.form1.action='/servlet/controller.library.SearchServlet?p_userid='+userid;
        document.form1.p_process.value = 'memberInfo';
        document.form1.submit();
//        document.form1.target = window.self.name;
    }

      //������ �̵�
      function go(index) {
          document.form1.target = "_self";
          document.form1.p_action.value = "go";
          document.form1.p_pageno.value = index;
          document.form1.action = "/servlet/controller.study.StudyStatusAdminServlet";
          document.form1.p_process.value = "LearningTimeSelectList";
          document.form1.submit();
      }
      //������ �̵�
      function goPage(pageNum) {
           document.form1.target = "_self";
           document.form1.p_action.value = "go";
           document.form1.p_pageno.value = pageNum;
           document.form1.action = "/servlet/controller.study.StudyStatusAdminServlet";
           document.form1.p_process.value = "LearningTimeSelectList";
           document.form1.submit();
      }

    var startup = 0;
    function Main_s_grseq(){
        if (startup > 0)
            changes_grseq(document.form1.s_grcode.value, document.form1.s_gyear.value);
    }
    function Main_subjcourse(){
        var subjSearchKey = '';
        if(startup > 2) {
            if (document.form1.s_subjsearchkey == 'undefine')  subjSearchKey = '';
            else subjSearchKey = document.form1.s_subjsearchkey.value;
            changes_subjcourse(document.form1.s_grcode.value
                                            , document.form1.s_upperclass.value
                                            , document.form1.s_middleclass.value
                                            , document.form1.s_lowerclass.value
                                            , document.form1.s_grseq.value
                                            , subjSearchKey );
    //		alert(document.form1.s_grcode.value+ " , " + document.form1.s_upperclass.value+ " , " + document.form1.s_middleclass.value+ " , " + document.form1.s_lowerclass.value+ " , " + document.form1.s_subjseq.value+ " , " +'' );
        }
        startup++;
    }
    // select box ����
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
        $("#oGyear").append("<option value=\"\">== ���� ==</option>");
        $("#oGrseq").append("<option value=\"\">== ���� ==</option>");
        $("#oSubjcourse").append("<option value=\"ALL\">== ��ü ==</option>");
        $("#oSubjseq").append("<option value=\"ALL\">== ��ü ==</option>");

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
        $("#oGrseq").append("<option value=\"\">== ���� ==</option>");
        $("#oSubjcourse").append("<option value=\"ALL\">== ��ü ==</option>");
        $("#oSubjseq").append("<option value=\"ALL\">== ��ü ==</option>");


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
        $("#oSubjcourse").append("<option value=\"ALL\">== ��ü ==</option>");
        $("#oSubjseq").append("<option value=\"ALL\">== ��ü ==</option>");


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
        $("#oSubjseq").append("<option value=\"ALL\">== ��ü ==</option>");
        
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
        $("#oMiddleclass").append("<option value=\"\">== ��ü ==</option>");
        $("#oLowerclass").empty();
        $("#oLowerclass").append("<option value=\"\">== ��ü ==</option>");

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
        $("#oLowerclass").append("<option value=\"\">== ��ü ==</option>");

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
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
    <input type="hidden" name="p_process" value="<%=v_process%>">
    <input type="hidden" name="p_rprocess" value="LearningTimeSelectList">
    <input type="hidden" name="s_action"  value="<%=ss_action%>">    <!--in relation to select-->
    <input type="hidden" name="p_orderColumn" value="<%=v_orderColumn%>">
    <input type="hidden" name="p_orderType" value="<%=v_orderType%>">
    <input type="hidden" name="p_action"    value = "">
    <input type="hidden" name="p_pageno"    value = "<%=v_pageno%>">
    <input type="hidden" name="p_pagesize"  value="10">

    <input type="hidden" name="p_subj">
    <input type="hidden" name="p_year">
    <input type="hidden" name="p_subjseq">
    <input type="hidden" name="p_userid">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" valign="top">

            <!----------------- title ���� ----------------->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
                <tr>
                    <td><img src="/images/admin/study/s_title09.gif" ></td>
                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
                </tr>
            </table>
            <!----------------- title �� ----------------->
            <br>

            <!----------------- form ���� ----------------->
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
                                        <tr>
                                            <td  align="left" valign="middle">

                                                <!------------------- ���ǰ˻� ���� ------------------------->
                                                <table border="0" cellspacing="0" cellpadding="0" width="99%" >
                                                    <tr>
                                                        <td width="10%" class="_tdT"><font color="red">��</font>�����׷�</td>
                                                        <td width="15%" class="_tdS">
                                                            <kocca:selectBox name="s_grcode" id="oGrcode" optionTitle="-- �����׷� --" type="sqlID" sqlID="selectBox.grcodeList" selectedValue="<%= ss_grcode %>" isLoad="true" />
                                                        </td>
                                                        <td width="10%" class="_tdT"><font color="red">��</font>����</td>
                                                        <td width="15%" class="_tdS">
<%
    if ( !ss_gyear.equals("") ) {
%>
                                                            <kocca:selectBox name="s_gyear" id="oGyear" optionTitle="== ���� ==" type="sqlID" param="<%= ss_grcode %>" sqlID="selectBox.grYearList" selectedValue="<%= ss_gyear %>" isLoad="true" />
<%
    } else {
%>
                                                            <kocca:selectBox name="s_gyear" id="oGyear" optionTitle="== ���� ==" type="sqlID" isLoad="false" />
<%
    }
%>
                                                        </td>
                                                        <td width="10%" class="_tdT"><font color="red">��</font>��������</td>
                                                        <td width="15%" class="_tdS">
<%
    if ( !ss_grseq.equals("") ) {
%>
                                                            <kocca:selectBox name="s_grseq" id="oGrseq" optionTitle="== ���� ==" type="sqlID" param="<%= ss_grcode + ',' + ss_gyear %>" sqlID="selectBox.grSeqList" selectedValue="<%= ss_grseq %>" isLoad="true" />
<%
    } else {
%>
                                                            <kocca:selectBox name="s_grseq" id="oGrseq" optionTitle="== ���� ==" type="sqlID" isLoad="false" />
<%
    }
%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="10%" class="_tdT">��з�</td>
                                                        <td width="15%" class="_tdS">
                                                            <kocca:selectBox name="s_upperclass" id="oUpperclass" optionTitle="== ��ü ==" type="sqlID" sqlID="selectBox.subjAttUpperList" selectedValue="<%= ss_upperclass %>" isLoad="true" />
                                                       </td>
                                                        <td width="10%" class="_tdT">�ߺз�</td>
                                                        <td width="15%" class="_tdS">
<%
    if ( !ss_middleclass.equals("") ) {
%>
                                                            <kocca:selectBox  name="s_middleclass" id="oMiddleclass" optionTitle="== ��ü ==" type="sqlID" sqlID="selectBox.subjAttMiddleList" param="<%= ss_upperclass %>" selectedValue="<%= ss_middleclass %>" isLoad="true" />
<%
    } else {
%>
                                                            <select name="s_middleclass" id="oMiddleclass">
                                                                <option value="">== ��ü ==</option>
                                                            </select>
<%
    }
%>
                                                        </td>
                                                        <td width="10%" class="_tdT">�Һз�</td>
                                                        <td width="15%" class="_tdS">
<%
    if ( !ss_lowerclass.equals("") ) {
%>
                                                            <kocca:selectBox name="s_lowerclass" id="oLowerclass" optionTitle="== ��ü ==" type="sqlID" sqlID="selectBox.subjAttLowerList" param="<%= ss_upperclass + ',' + ss_middleclass %>" selectedValue="<%= ss_lowerclass %>" isLoad="true" />
<%
    } else {
%>
                                                            <select name="s_lowerclass" id="oLowerclass">
                                                                <option value="">== ��ü ==</option>
                                                            </select>
<%
    }
%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <% String s_subjsearchkey = box.getString("s_subjsearchkey"); %>
                                                        <td width="10%" class="_tdT">�����˻�</td>
                                                        <td class="_tdS">
                                                            <input type="text" id="oSubjSearchKey" name="s_subjsearchkey" id="oSubjSearchKey" size="17" onkeypress="if(event.keyCode=='13') fnSubjSearchByName();" value="<%=s_subjsearchkey%>">
                                                            <a href="javascript:fnSubjSearchByName()" ><img src="/images/admin/button/search3_butt.gif" border="0" align="absmiddle"></a>
                                                        <td width="10%" class="_tdT">����</td>
                                                        <td colspan="3" class="_tdS">
<%
    if ( !ss_subjcourse.equals("") ) {
        s_subjsearchkey = ( s_subjsearchkey.equals("") ) ? "%" : s_subjsearchkey;
%>
                                                            <kocca:selectBox name="s_subjcourse" id="oSubjcourse" optionTitle="== ��ü ==" optionTitleValue="ALL" type="sqlID" param="<%= ss_grcode + ',' + ss_gyear + ',' + ss_grseq + ',' + s_subjsearchkey %>" sqlID="selectBox.subjList" selectedValue="<%= ss_subjcourse %>" isLoad="true" />
<%
    } else {
%>
                                                            <kocca:selectBox name="s_subjcourse" id="oSubjcourse" optionTitle="== ��ü ==" optionTitleValue="ALL" type="sqlID" isLoad="false" />
<%
    }
%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="10%" class="_tdT">��������</td>
                                                        <td width="15%" class="_tdS">
<%
    if ( !ss_subjseq.equals("") ) {
%>
                                                            <kocca:selectBox name="s_subjseq" id="oSubjseq" optionTitle="== ��ü ==" optionTitleValue="ALL" type="sqlID" param="<%= ss_grcode + ',' + ss_gyear + ',' + ss_grseq + ',' + ss_subjcourse %>" sqlID="selectBox.subjSeqList" selectedValue="<%= ss_subjseq %>" isLoad="true" />
<%
    } else {
%>
                                                            <select name="s_subjseq" id="oSubjseq">
                                                                <option value="">== ��ü ==</option>
                                                            </select>
<%
    }
%>
                                                        </td>
                                                        <td colspan="6" align="right"><%@ include file="/learn/admin/include/za_GoButton.jsp" %></td>
                                                    </tr>
                                                    <input type = "hidden" name="s_start">
                                                    <input type = "hidden" name="s_end">
                                                </table>

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
            <!----------------- form �� ----------------->

            <br>
            <br>

            <!----------------- ��������, ���Ϲ߼�, �������, ��μ���, ��μ������  ��ư ���� ----------------->
            <table width="97%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="right">
                        <a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif" border="0"></a>
                    </td>
                </tr>
                <tr>
                    <td height="3"></td>
                </tr>
            </table>
            <!----------------- ��������, ���Ϲ߼�, �������, ��μ���, ��μ������  ��ư �� ----------------->

            <!----------------- �н��ð���ȸ ���� ----------------->
            <table cellspacing="1" cellpadding="5" class="table_out">
                <tr>
                    <td colspan="12" class="table_top_line"></td>
                </tr>
                <tr>
                    <td width="5%" class="table_title">NO</td>
                    <td class="table_title" colspan="2">������</td>
                    <td class="table_title">ID</td>
                    <td class="table_title">����</td>
                    <td class="table_title">ȸ������</td>
                    <td class="table_title">����<br>����</td>
                    <!--td class="table_title">����</td-->
                    <td class="table_title">�����н���</td>
                    <td class="table_title">�ֱ��н�������</td>
                    <td class="table_title">�ֱ��н�������</td>
                    <td class="table_title">���н��ð�</td>
                    <td class="table_title">��������</td>
                </tr>
<%
    if (ss_action.equals("go")){    //go button ���ýø� list ���

                String preCourse = "";			//������°��� - 000000�̸� �Ϲݰ����̰� �ܴ̿� ����������
                int l = 0;

        //������ �ְ� ��������
        if( list.size() != 0 ){		// �˻��� ������ �ִٸ�

            v_total = list.size();
            for(i = 0; i < v_total; i++) {
                
                DataBox dbox = (DataBox)list.get(i);
                
                v_course         = dbox.getString("d_course");
                v_cyear          = dbox.getString("d_cyear");
                v_courseseq      = dbox.getString("d_courseseq");
                v_coursenm       = dbox.getString("d_coursenm");
                v_subj           = dbox.getString("d_subj");
                v_year           = dbox.getString("d_year");
                v_subjnm         = dbox.getString("d_subjnm");
                v_subjseq        = dbox.getString("d_subjseq");
                v_subjseqgr      = dbox.getString("d_subjseqgr");
                v_userid         = dbox.getString("d_userid");
                v_name           = dbox.getString("d_name");
                v_membergubunnm  = dbox.getString("d_membergubunnm");
                v_firstedu       = dbox.getString("d_first_edu");
                v_totaltime      = dbox.getString("d_total_time");
                v_totalminute    = dbox.getString("d_total_minute");
                v_ldatestart     = dbox.getString("d_ldate_start");
                v_ldateend       = dbox.getString("d_ldate_end");
                v_isnewcourse    = dbox.getString("d_isnewcourse");
                v_rowspan        = dbox.getInt("d_rowspan");
                v_isonoff        = dbox.getString("d_isonoff");
                v_isbelongcourse = dbox.getString("d_isbelongcourse");
                v_subjcnt	     = dbox.getInt("d_subjcnt");
                
                v_totalpage     = dbox.getInt("d_totalpage");
                v_rowcount      = dbox.getInt("d_rowcount");
                v_totalrowcount = dbox.getInt("d_totalrowcount");
                v_dispnum       = dbox.getInt("d_dispnum");

                
                //StudyStatusData data  = (StudyStatusData)list.get(i);
                //v_course        = data.getCourse();
                //v_cyear         = data.getCyear();
                //v_courseseq     = data.getCourseseq();
                //v_coursenm      = data.getCoursenm();
                //v_subj          = data.getSubj();
                //v_year          = data.getYear();
                //v_subjnm        = data.getSubjnm();
                //v_subjseq       = data.getSubjseq();
                //v_subjseqgr     = data.getSubjseqgr();
                //v_userid        = data.getUserid();
                //v_name          = data.getName();
                //v_membergubunnm = data.getMembergubunnm();
                //v_firstedu      = data.getFirstedu();
                //v_totaltime     = data.getTotaltime();
                //v_totalminute   = data.getTotalminute();
                //v_ldatestart    = data.getLdatestart();
                //v_ldateend      = data.getLdateend();
                //v_isnewcourse   = data.getIsnewcourse();
                //v_rowspan       = data.getRowspan();
                //v_isonoff       = data.getIsonoff();
                //v_isbelongcourse = data.getIsbelongcourse();
                //v_subjcnt	= data.getSubjcnt();

                //if(v_isonoff.equals("ON")){     v_isonoff_value="���̹�";   }
                //else                      {     v_isonoff_value="����";     }
                v_firstedu      = FormatDate.getFormatDate(v_firstedu,"yyyy/MM/dd-HH:mm:ss");
                v_ldatestart    = FormatDate.getFormatDate(v_ldatestart,"yyyy/MM/dd-HH:mm:ss");
                v_ldateend      = FormatDate.getFormatDate(v_ldateend,"yyyy/MM/dd-HH:mm:ss");
                if(v_firstedu.length() > 0)  { v_firstedu = v_firstedu.substring(0,16);      }
                if(v_ldatestart.length() > 0){ v_ldatestart=v_ldatestart.substring(0,16);    }
                if(v_ldateend.length() > 0)  { v_ldateend = v_ldateend.substring(0,16);      }
                if(!(v_totaltime.length() > 0) ) {      v_totaltime = "0";     }
                if( ! (v_totalminute.length() >0)){     v_totalminute = "0";   }

                v_edutotmin = Integer.parseInt(v_totaltime)*60 + Integer.parseInt(v_totalminute);

%>
                <tr>
<%
			//�����������̶��
                if( v_isbelongcourse.equals("Y")){

					if(l == v_subjcnt) preCourse = "";

					if( !preCourse.equals("000000") && !preCourse.equals(v_course) ) {
						l = 1;
%>

					<td class="table_01"><%=v_totalrowcount - v_pagesize * v_pageno + v_pagesize - i%></td>
                    <td class="table_02_1" rowspan="<%=v_subjcnt%>"> <%=v_coursenm%><br><%=StringManager.cutZero(v_courseseq)%>��</td>
					<td class="table_02_2"><font class="text_color04" align="center"><CENTER><%=v_subjnm%></CENTER></font></td>
					<td class="table_02_1"><a href="javascript:whenMemberInfo('<%=v_userid%>')" class="e"><%= v_userid %></a></td>
					<td class="table_02_1"><%= v_name %></td>
					<td class="table_02_1"><%=v_membergubunnm%></td>
					<td class="table_02_1"><%=StringManager.cutZero(v_subjseqgr)%></td>
					<!--td class="table_02_1"><%//=v_isonoff_value%></td-->
					<td class="table_02_1"><%if(v_firstedu.equals("")){out.print("-");}else{out.print(v_firstedu);}%></td>
					<td class="table_02_1"><%if(v_ldatestart.equals("")){out.print("-");}else{out.print(v_ldatestart);}%></td>
					<td class="table_02_1"><%if(v_ldateend.equals("")){out.print("-");}else{out.print(v_ldateend);}%></td>
					<td class="table_02_1"><a href="javascript:whenPersonalTimeList('<%=v_subj%>', '<%=v_year%>', '<%=v_subjseq%>', '<%=v_userid%>')"><%=v_edutotmin%> min</td>


<%
						preCourse = v_course;
					}else{
						l++;
%>

					<td class="table_01"><%=v_totalrowcount - v_pagesize * v_pageno + v_pagesize - i%></td>
					<td class="table_02_2"><font class="text_color04" align="center"><CENTER><%=v_subjnm%></CENTER></font></td>
					<td class="table_02_1"><a href="javascript:whenMemberInfo('<%=v_userid%>')" class="e"><%= v_userid %></a></td>
					<td class="table_02_1"><%= v_name %></td>
					<td class="table_02_1"><%=v_membergubunnm%></td>
					<td class="table_02_1"><%=StringManager.cutZero(v_subjseqgr)%></td>
					<!--td class="table_02_1"><%//=v_isonoff_value%></td-->
					<td class="table_02_1"><%if(v_firstedu.equals("")){out.print("-");}else{out.print(v_firstedu);}%></td>
					<td class="table_02_1"><%if(v_ldatestart.equals("")){out.print("-");}else{out.print(v_ldatestart);}%></td>
					<td class="table_02_1"><%if(v_ldateend.equals("")){out.print("-");}else{out.print(v_ldateend);}%></td>
					<td class="table_02_1"><a href="javascript:whenPersonalTimeList('<%=v_subj%>', '<%=v_year%>', '<%=v_subjseq%>', '<%=v_userid%>')"><%=v_edutotmin%> min</td>

<%
					}


			}else{		//������������ �ƴϸ�
%>

					<td class="table_01"><%=v_totalrowcount - v_pagesize * v_pageno + v_pagesize - i%></td>
					<td class="table_02_2" colspan="2"><font class="text_color04" align="center"><CENTER><%=v_subjnm%></CENTER></font></td>
					<td class="table_02_1"><a href="javascript:whenMemberInfo('<%=v_userid%>')" class="e"><%= v_userid %></a></td>
					<td class="table_02_1"><%= v_name %></td>
					<td class="table_02_1"><%=v_membergubunnm%></td>
					<td class="table_02_1"><%=StringManager.cutZero(v_subjseqgr)%></td>
					<!--td class="table_02_1"><%//=v_isonoff_value%></td-->
					<td class="table_02_1"><%if(v_firstedu.equals("")){out.print("-");}else{out.print(v_firstedu);}%></td>
					<td class="table_02_1"><%if(v_ldatestart.equals("")){out.print("-");}else{out.print(v_ldatestart);}%></td>
					<td class="table_02_1"><%if(v_ldateend.equals("")){out.print("-");}else{out.print(v_ldateend);}%></td>
					<td class="table_02_1"><a href="javascript:whenPersonalTimeList('<%=v_subj%>', '<%=v_year%>', '<%=v_subjseq%>', '<%=v_userid%>')"><%=v_edutotmin%> min</td>
<%
			}
%>
					<td class="table_02_1"><a href="javascript:whenPersonalProgressList('<%=v_subj%>', '<%=v_year%>', '<%=v_subjseq%>', '<%=v_userid%>')">��������</td>
                </tr>

<%
		}//for

	} else if( list.size() == 0){		//  ������ ���ٸ�
%>

                <tr>
                    <td align="center" bgcolor="#F7F7F7" height="50" colspan="13">��ϵ� ������ �����ϴ�</td>
                </tr>
<%
	}

}
%>

            </table>
            <!----------------- �н��ð���ȸ �� ----------------->
            <br>
            <!----------------- total ���� ----------------->
            <br>
            <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="right" valign="absmiddle">
                        <%= PageUtil.printPageList(v_totalpage, v_pageno, row) %>
                    </td>
                </tr>
            </table>
            <!----------------- total �� ----------------->
        </td>
    </tr>
    <tr>
        <td><%@ include file = "/learn/library/getJspName.jsp" %>
        </td>
    </tr>
</table>
</form>
</body>
</html>
