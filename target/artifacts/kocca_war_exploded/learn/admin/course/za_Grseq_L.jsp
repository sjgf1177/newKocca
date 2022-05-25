<%
//**********************************************************
//  1. ��      ��: �������� ����Ʈ ��ȸȭ��
//  2. ���α׷���: za_Grseq_L.jsp
//  3. ��      ��: �������� ����Ʈ ��ȸȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 11
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page errorPage="/learn/library/error.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.credu.system.*" %>
<%@ page import="com.credu.library.*" %>
<%@ page import="com.credu.course.*" %>
<%@ page import="com.credu.common.*" %>

<%@ taglib uri="/tags/KoccaTaglib" prefix="kocca" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    String ss_grcode = box.getString("s_grcode");               //�����׷�
    String ss_gyear = box.getString("s_gyear");                //�⵵
    String ss_upperclass = box.getString("s_upperclass");          //������з�
    String ss_middleclass = box.getString("s_middleclass");        //�����ߺз�
    String ss_lowerclass = box.getString("s_lowerclass");          //�����Һз�
    String ss_subjcourse= box.getString("s_subjcourse");           //����&�ڽ�
    String ss_grseq = box.getString("s_grseq");                   //���� ����
    String s_subjsearchkey = box.getString("s_subjsearchkey");   //������
    // String s_biyong = box.getString("s_biyong");                  //��������
    // String s_area = box.getString("s_area");                     //��/����

    String v_area = box.getString("v_area");
    String v_biyong = box.getString("v_biyong");

    String v_gyear ="", v_grseq="", v_course="", v_cyear="", v_courseseq="", v_courseStr="";
    String v_subj="",v_year="",v_subjseq="";
    String v_subjnmlink = "";
    String v_precourse = "";
    String s_gadmin = box.getSession("gadmin");
    String v_gadmin = StringManager.substring(s_gadmin, 0, 1);

    String isExcel = "";

%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<style>
th {font-size:12px;}
</style>
<script type="text/javascript" src="/script/jquery-1.3.2.min.js"></script>
<script type="text/javascript">

    function MM_jumpMenu(targ,selObj,restore){ //v3.0
      eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
      if (restore) selObj.selectedIndex=0;
    }

    /**
     * ��� ��ȸ
     * @param ss_action
     */
    function fnSearchSubjList( actType ) {
        if (actType == "go")    {
            if ( $("#oGrcode").val() == "") {
                alert("�����׷��� �����ϼ���.");
                $("#oGrcode").focus();
                return ;
            } else if ( $("#oGyear").val() == "") {
                alert("������ �����ϼ���.");
                $("#oGyear").focus();
                return ;
            } else if ( $("#oGrseq").val() == "") {
                alert("���������� �����ϼ���.");
                $("#oGrseq").focus();
                return ;
            }
            // top.ftop.setPam();
        }
        $("input[name=p_process]").val("listPage");
        $("input[name=p_action]").val(actType);
        $("form[name=form1]").submit();;
    }

    function elementForm() {
      var form = document.form1;
      var s_url = "";
      s_url += "&s_upperclass="+form.s_upperclass.value;
      s_url += "&s_middleclass="+form.s_middleclass.value;
      s_url += "&s_lowerclass="+form.s_lowerclass.value;
      s_url += "&s_subjsearchkey="+form.s_subjsearchkey.value;
      s_url += "&s_subjcourse="+form.s_subjcourse.value;
      return s_url;
    }

    //�������� �߰�
    function addGrseq(){
    <%  if (ss_grcode.equals("") || ss_grcode.equals("ALL")) {            %>
        alert ("�����׷� ������ go��ư�� ���� �������� ������ �߰��Ͻʽÿ�")
        return
    <%  } else {                             %>
        var url=document.form1.action+'?p_process=insertPage&p_grcode=<%=ss_grcode%>';
        window.open(url,'insert','width=620,height=600, scrollbars=yes');
    <%  }                                    %>
    }

    //�������� ��ȭ��
    function whenGrseq(gyear,grseq){
        var url=document.form1.action+'?p_process=updatePage&p_grcode=<%=ss_grcode%>&p_gyear='+gyear+'&p_grseq='+grseq+elementForm();
        window.open(url,'insert','width=600,height=580');
    }

    //��������ȭ������ �̵�
    function assignSubjCourse(gyear,grseq){
        var url=document.form1.action+'?p_process=assignPage&p_grcode=<%=ss_grcode%>&p_gyear='+gyear+'&p_grseq='+grseq+elementForm();
        window.open(url,'insert','toolbar=no, location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600');
    }

    //�����ϰ� ����ȭ������ �̵�
    function updateSubjCourse(gyear,grseq){
        var url=document.form1.action+'?p_process=updatePageSubjCourse&p_grcode=<%=ss_grcode%>&p_gyear='+gyear+'&p_grseq='+grseq;
        window.open(url,'insert','toolbar=no, location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600');
    }

    //���������ϰ� ����ȭ������ �̵�
    function updateSubjScore(gyear,grseq){
        var url=document.form1.action+'?p_process=updatePageSubjScore&p_grcode=<%=ss_grcode%>&p_gyear='+gyear+'&p_grseq='+grseq;
        window.open(url,'insert','toolbar=no, location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600');
    }



    function delCourse(gyear,grseq,course,cyear,courseq){
        if(!confirm("��� �н������ͱ��� �����Ǿ� ������ �� �����ϴ�.\n\n�����Ͻðڽ��ϱ�?")) return;
        setHiddenVals("delCourse",gyear,grseq,course,cyear,courseq);
        document.form1.submit();
    }
    function addCourse(coursenm,gyear,grseq,course){
        if(!confirm("["+coursenm+"] �ڽ��� ������ �߰��մϴ�.\n\n�߰��Ͻðڽ��ϱ�?")) return;
        setHiddenVals("addCourse",gyear,grseq,course,"","");
        document.form1.submit();
    }
    function delSubj(gyear,grseq,subj,year,subjseq){
        if(!confirm("��� �н������ͱ��� �����Ǿ� ������ �� �����ϴ�.\n\n�����Ͻðڽ��ϱ�?")) return;
        setHiddenVals("delSubj",gyear,grseq,subj,year,subjseq);
        document.form1.submit();
    }
    function addSubj(subjnm,gyear,grseq,subj){
        if(!confirm("["+subjnm+"] ������ ������ �߰��մϴ�.\n\n�߰��Ͻðڽ��ϱ�?")) return;
        setHiddenVals("addSubj",gyear,grseq,subj,"","");
        document.form1.submit();
    }

    function setHiddenVals(process, gyear,grseq,subjcourse,year,seq){
        document.form1.p_action.value = "go";
        document.form1.p_process.value= process;
        document.form1.p_mgyear.value=gyear;
        document.form1.p_mgrseq.value=grseq;
        document.form1.p_msubjcourse.value=subjcourse;
        document.form1.p_myear.value=year;
        document.form1.p_mseq.value=seq;
    }

    function whenSubjseq(grcode,gyear,grseq,subj,year,subjseq,isonoff){
        var url=document.form1.action+'?p_process=updateSubjseqPage&p_grcode='+grcode+'&p_gyear='+gyear+'&p_grseq='+grseq+'&p_subj='+subj+'&p_year='+year+'&p_subjseq='+subjseq+'&p_isonoff='+isonoff;
        window.open(url,'insert','resizable=yes,scrollbars=yes,status=yes,width=800,height=700');
    }
    function whenCourseseq(grcode,gyear,grseq,course,cyear,courseseq){
        var url='/servlet/controller.course.CourseServlet?p_process=updateCourseseqPage&p_grcode='+grcode+'&p_gyear='+gyear+'&p_grseq='+grseq+'&p_course='+course+'&p_cyear='+cyear+'&p_courseseq='+courseseq;
        window.open(url,'insert','resizable=yes,scrollbars=yes,status=yes,width=800,height=700');
    }

    //�����ٿ�
    function whenExcel(ss_action) {
        /*alert("�غ� �� �Դϴ�.");*/

        if(ss_action != "go"){
            alert('���� ��ȸ�� �ֽʽÿ�');
            return;
      }

        document.form1.action='/servlet/controller.course.GrseqServlet';
        document.form1.p_process.value = 'listPage';
        document.form1.p_action.value = ss_action;
        document.form1.isExcel.value = "ok";
        document.form1.submit();

    }

    // ���԰��н��� ����
    function delGrseq() {
    	var check = chkSelected();
      if (check == 1) {
        alert('���԰� ������ �����ϼ���');
        return;
      }
      if(!confirm("��� �н������ͱ��� �����Ǿ� ������ �� �����ϴ�.\n\n�����Ͻðڽ��ϱ�?")) return;

      document.form1.p_mgyear.value=document.form1.s_gyear.value;
      document.form1.p_mgrseq.value=document.form1.s_grseq.value;
      document.form1.p_action.value = "go";
      document.form1.p_process.value= "delSubjArr";
      document.form1.submit();
    }
    
    function chkSelected(){
    	var result = 0;
    	if($('input:checkbox[name=p_checks]:checked').size() == 0){
    		result = 1; 
    	}
    	
    	$('input:checkbox[name=p_checks]:checked').each(function(){
    		
    	});
    	
    	
    	return result;
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

        /*
        $("#oSubjcourse").bind("change", function(){

            if ( $(this).val() == "ALL" ) {
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
        */

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

        $("#oCheckAll").bind("click", function() {
        	var checked = $(this).is(":checked");
        	$("input:checkbox[name=p_checks]").each(function(){
        		if(!$(this).is(':disabled')){
        			$(this).attr("checked", checked);
        		}
        	});
        });

        $("input:checkbox[name=p_checks]").bind("click", function() {
            var allCnt = $("input:checkbox[name=p_checks]").length;
            var checkedCnt = $("input:checkbox[name=p_checks]:checked").length;

            if ( allCnt == checkedCnt ) {
                $("#oCheckAll").attr("checked", true);
            } else {
                $("#oCheckAll").attr("checked", false);
            }
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
        $("#oSubjcourse").append("<option value=\"ALL\">-- ��ü --</option>");

        if ( result.selectBoxList != null && result.selectBoxList.length > 0 ) {
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
        $("#oSubjcourse").append("<option value=\"ALL\">-- ��ü --</option>");

        if ( result.selectBoxList != null && result.selectBoxList.length > 0 ) {
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
        $("#oSubjcourse").append("<option value=\"ALL\">-- ��ü --</option>");

        if ( result.selectBoxList != null && result.selectBoxList.length > 0 ) {
            $.each( result.selectBoxList, function() {
                $("#oSubjcourse").append("<option value=\"" + this.d_code + "\">" + this.d_codenm + "</option>");
            });
        }
    }

    /**
     * ���������� ���� selectbox ����
     */
    /*
    function fnSetSubjSeqList( result ) {
        if ( result.selectBoxList.length > 0 ) {
            $("#oSubjseq").val( result.selectBoxList[0].d_code );
        }
    }
    */

    /**
     * ?
     */
    function fnSubjSearchByName() {
        if ( $("#oGrseq").val() == "" ) {
            alert("���� ������ ���� �����ϼ���.");
            $("#oGrseq").focus();
            return;
        } else {
            $("#oGrseq").trigger("change");
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

        if ( result.selectBoxList != null && result.selectBoxList.length > 0 ) {
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

        if ( result.selectBoxList != null && result.selectBoxList.length > 0 ) {
            $.each( result.selectBoxList, function() {
                $("#oLowerclass").append("<option value=\"" + this.d_code + "\">" + this.d_codenm + "</option>");
            });

        }
    }
    
    // �������� �������ε�
    function fnExcelUpload(){
    	$("input[name=p_process]").val("excelUpload");
        $("form[name=form1]").submit();;
    }

</script>
</head>
<body bgcolor="#ffffff" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post" action="/servlet/controller.course.GrseqServlet">
    <input type="hidden" name="p_process" value="listPage" />
    <input type="hidden" name="p_action" value="" />
    <input type="hidden" name="p_grcode" value="<%=ss_grcode%>" />
    <input type="hidden" name="p_mgyear" value="" />
    <input type="hidden" name="p_mgrseq" value="" />
    <input type="hidden" name="p_msubjcourse" value="" />
    <input type="hidden" name="p_myear" value="" />
    <input type="hidden" name="p_mseq" value="" />
    <input type="hidden" name="p_subj" value="" />
    <input type="hidden" name="p_subjnm" value="" />
    <input type="hidden" name="isExcel" value="" />

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" valign="top">

            <!-- title ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
                <tr>
                    <td><img src="/images/admin/course/c_title02.gif" alt="asdf"></td>
                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
                </tr>
            </table>
            <!-- title �� //-->
            <br/>
            <!-- form ���� //-->
            <table cellspacing="0" cellpadding="1" class="form_table_out">
                <tr>
                    <td bgcolor="#C6C6C6" align="center">

                        <table cellspacing="0" cellpadding="4" class="form_table_bg" >
                            <colgroup>
                                <col style="width:8%;" />
                                <col style="width:27%;" />
                                <col style="width:8%" />
                                <col style="width:10%;" />
                                <col style="width:8%;" />
                                <col style="width:33%;" />
                                <col style="width:6%;" />
                            </colgroup>
                            <tr>
                                <th class="_tdT"><font color="red">��</font>�����׷�</th>
                                <td class="_tdS">
                                    <kocca:selectBox name="s_grcode" id="oGrcode" optionTitle="-- ���� --" type="sqlID" sqlID="selectBox.grcodeList" selectedValue="<%= ss_grcode %>" isLoad="true" />
                                </td>
                                <th class="_tdT">����</th>
                                <td class="_tdS">
<%
    if ( !ss_gyear.equals("") ) {
%>
                                    <kocca:selectBox name="s_gyear" id="oGyear" optionTitle="-- ���� --" type="sqlID" param="<%= ss_grcode %>" sqlID="selectBox.grYearList" selectedValue="<%= ss_gyear %>" isLoad="true" />
<%
    } else {
%>
                                    <select name="s_gyear" id="oGyear">
                                        <option value="">-- ���� --</option>
                                    </select>
<%
    }
%>
                                </td>
                                <th class="_tdT">��������</th>
                                <td class="_tdS">
<%
    if ( !ss_grseq.equals("") ) {
%>
                                    <kocca:selectBox name="s_grseq" id="oGrseq" optionTitle="-- ���� --" type="sqlID" param="<%= ss_grcode + ',' + ss_gyear %>" sqlID="selectBox.grSeqList" selectedValue="<%= ss_grseq %>" isLoad="true" />
<%
    } else {
%>
                                    <select name="s_grseq" id="oGrseq">
                                        <option value="">-- ���� --</option>
                                    </select>
<%
    }
%>

                                </td>
                                <td rowspan="3" style="text-align:left;">
                                    <a href="javascript:fnSearchSubjList('go');"><img src = "/images/admin/button/b_go.gif" border = "0" align="absmiddle"></a>
                                </td>
                            </tr>
                            <tr>
                                <th class="_tdT">��з�</th>
                                <td class="_tdS">
                                    <kocca:selectBox name="s_upperclass" id="oUpperclass" optionTitle="-- ��ü --" type="sqlID" sqlID="selectBox.subjAttUpperList" selectedValue="<%= ss_upperclass %>" isLoad="true" />
                                </td>
                                <th class="_tdT">�ߺз�</th>
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
                                <th class="_tdT">�Һз�</th>
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
                                <th class="_tdT">�����˻�</th>
                                <td class="_tdS">
                                    <input type="hidden" name="p_returnurlkey" value="<%=request.getRequestURI()%>" />
                                    <input type="text" name="s_subjsearchkey" id="oSubjSearchKey" size="17" onkeypress="if(event.keyCode == '13') fnSubjSearchByName();" value="<%= s_subjsearchkey %>" />
                                    <input type="text" name="s_temp" id="oTemp" style="display:none;" />
                                    <a href="javascript:fnSubjSearchByName();"><img src="/images/admin/button/search3_butt.gif" border="0" align="absmiddle" /></a>
                                </td>
                                <th class="_tdT">����</th>
                                <td class="_tdS" colspan="3">
<%
        if ( !ss_grseq.equals("") ) {
            s_subjsearchkey = ( s_subjsearchkey.equals("") ) ? "%" : s_subjsearchkey;
%>
                                    <kocca:selectBox name="s_subjcourse" id="oSubjcourse" optionTitle="-- ��ü --" optionTitleValue="ALL" type="sqlID" param="<%= ss_grcode + ',' + ss_gyear + ',' + ss_grseq + ',' + s_subjsearchkey %>" sqlID="selectBox.subjList" selectedValue="<%= ss_subjcourse %>" isLoad="true" />
<%
    } else {
%>
                                    <select name="s_subjcourse" id="oSubjcourse">
                                        <option value="">-- ��ü --</option>
                                    </select>
<%
    }
%>
                                </td>
                            </tr>
                            <tr>
                                <th class="_tdT">��������</th>
                                <td class="_tdS">
                                    <select name="p_area">
                                        <option value="">-��ü-</option>
                                        <option value="G0" <% if(v_area.equals("G0")){ %>selected<% } %> >����</option>
                                        <option value="K0" <% if(v_area.equals("B0")){ %>selected<% } %> >���</option>
                                        <option value="B0" <% if(v_area.equals("K0")){ %>selected<% } %> >��ȭ</option>
                                    </select>
                                </td>
                                <th class="_tdT">��/����</th>
                                <td class="_tdS" colspan="2">
                                    <select name="pp_biyong">
                                        <option value="">-��ü-</option>
                                        <option value="Y"  <% if(v_biyong.equals("Y")){ %>selected<% } %> >����</option>
                                        <option value="N"  <% if(v_biyong.equals("N")){ %>selected<% } %> >����</option>
                                    </select>
                                </td>
                                <td class="_tdS" colspan="2" align="right">
                                	<input type="button" onclick="javascript:fnExcelUpload();" value="�������� �������ε�"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <!-- form �� //-->
            <br/>

<%
    if (!ss_grcode.equals("")) {
%>
            <!-- ���������߰� ��ư ���� //-->
            <table width="970" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="right" height="20">
                        <a href="javascript:delGrseq()"><img src="/images/admin/button/mdel_btn.gif"  border=0 alt="���԰� ����"></a>&nbsp;
                        <a href="javascript:addGrseq()"><img src="/images/admin/button/btn_eduplus.gif"  border=0 alt="���������߰�"></a>&nbsp;
                        <a href="javascript:whenExcel('go')"><img src="/images/admin/button/btn_excelprint.gif" border="0" alt="�����ٿ�"></a></td>
                    </td>
                </tr>
                <tr>
                    <td height="3"></td>
                </tr>
            </table>
            <!-- ���������߰� ��ư �� //-->
<%
    }
%>
            <!-- �������� ���� ���� //-->
            <table width="970" class="table_out" cellspacing="1" cellpadding="5">
                <tr>
                    <td colspan="14" class="table_top_line"></td>
                </tr>
                <tr height="25">
                    <td width="9%" class="table_title"><b>��������</b></td>
                    <td width="23%" class="table_title"><b>����</b></td>
                    <!--td width="5%" class="table_title"><b>����</b></td-->
                    <td width="9%" class="table_title"><b>�����׷쳻<br/>��������</b></td>
                    <td width="10%" class="table_title"><b>��û�Ⱓ</b></td>
                    <td width="10%" class="table_title"><b>�����Ⱓ</b></td>
                    <td width="4%" class="table_title"><b>����</b></td>
                    <td width="4%" class="table_title"><b>��û�ο�</b></td>
                    <td width="4%" class="table_title"><b>�����ο�</b></td>
                    <td width="4%" class="table_title"><b>�����ο�</b></td>
                    <td width="4%" class="table_title"><b>������</b></td>
                    <td width="4%" class="table_title"><b>�ڵ����ο���</b></td>
                    <td width="4%" class="table_title"><b>�����Ⱓ</b></td>
                    <td width="5%" class="table_title">
                        <input type="checkbox" name="p_chkeckall" id="oCheckAll" />
                    </td>
                    <td width="13%" class="table_title"><b>���</b></td>
                </tr>
<%
    if (box.getString("p_action").equals("go")) {
        ArrayList  list = (ArrayList)request.getAttribute("GrseqList");

        for (int i = 0; i < list.size(); i++) {
            DataBox dbox = (DataBox)list.get(i);

            int subjcnt = dbox.getInt("d_subjcnt");

            if( subjcnt >= 4){
                subjcnt = 3;
            }

            v_subjnmlink = "<a href=\"javascript:whenSubjseq('"+ ss_grcode +"','"+ dbox.getString("d_gyear") +"','"+ dbox.getString("d_grseq") +"','"+ dbox.getString("d_subj") +"','"+ dbox.getString("d_year") +"','"+ dbox.getString("d_subjseq") +"','"+ dbox.getString("d_isonoff") +"')\" class='b'>"+ dbox.getString("d_subjnm") +"</a>";
%>
                <tr height="25">
<%
            if (!v_grseq.equals(dbox.getString("d_grseq")) || !v_gyear.equals(dbox.getString("d_gyear")) ){
                v_grseq = dbox.getString("d_grseq");
                v_gyear = dbox.getString("d_gyear");

%>
                    <td align="center" bgcolor="#eeeeee" rowspan="<%=dbox.getInt("d_rowspan_grseq")%>">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td align="center"><b><%=v_gyear%>-<%=v_grseq%></b>
                                    <br/>
                                    <a href="javascript:whenGrseq('<%=v_gyear%>','<%=v_grseq%>')"><%=dbox.getString("d_grseqnm")%></a>
                                </td>
                            </tr>
                            <tr>
                                <td height="5"></td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <a href="javascript:assignSubjCourse('<%=v_gyear%>','<%=v_grseq%>')"><img src="/images/admin/course/appointment1_butt.gif" width="58" height="18" border=0></a>
                                </td>
                            </tr>
<%
                if(!dbox.getString("d_subj").equals("")) {
%>
                            <tr>
                                <td align="center">
                                    <a href="javascript:updateSubjCourse('<%=v_gyear%>','<%=v_grseq%>')"><img src="/images/admin/course/modify1_butt.gif" border=0></a>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <a href="javascript:updateSubjScore('<%=v_gyear%>','<%=v_grseq%>')"><img src="/images/admin/course/editscore_butt.gif" border=0></a>
                                </td>
                             </tr>
<%
                }
%>
                        </table>
                    </td>
<%
            }

            //if (dbox.getString("d_subj") == null || (dbox.getString("d_subj").equals(""))){
            if (dbox.getString("d_grseqnm") == null || (dbox.getString("d_grseqnm").equals(""))){
%>
                    <td class="table_02_1" colspan="14" align="center">��ϵ� ������ �����ϴ�.</td>
<%
            } else {
                v_courseStr = dbox.getString("d_course") + dbox.getString("d_cyear") + dbox.getString("d_courseseq");
                if (!dbox.getString("d_course").equals("") && !dbox.getString("d_course").equals("000000") && !v_courseStr.equals(v_course+v_cyear+v_courseseq)){
                    v_course    = dbox.getString("d_course");
                    v_cyear     = dbox.getString("d_cyear");
                    v_courseseq = dbox.getString("d_courseseq");
%>
                    <!--<td class="table_02_2" align="center">-</td>-->
                    <td class="table_02_1" align="center" rowspan="  <%=subjcnt %> ">
                        <font class="text_color03">[������] <%=v_courseseq%><br/>
                        <a href="javascript:whenCourseseq('<%=ss_grcode%>','<%=dbox.getString("d_gyear")%>','<%=dbox.getString("d_grseq")%>','<%=v_course%>','<%=v_cyear%>','<%=v_courseseq%>')"><%=dbox.getString("d_coursenm")%></a></font>
                    </td>
                    <td class="table_02_2"><font class="text_color04"><%=v_subjnmlink%></font></td>
 <%
                } else if (dbox.getString("d_course").equals("000000")) {
                    v_course    = dbox.getString("d_course");
                    v_cyear     = dbox.getString("d_cyear");
                    v_courseseq = dbox.getString("d_courseseq");
%>
                    <!--<td class="table_02_2" align="center">-</td>-->
                    <td class="table_02_2"><font class="text_color04"><%=v_subjnmlink%></font></td>
<%
                } else {
%>
                    <!--<td class="table_02_2" align="center">-</td>-->
                    <td class="table_02_2"><font class="text_color04"><%=v_subjnmlink%></font></td>
<%
                }
%>
                    <!--td class="table_02_1" align="center"><%=dbox.getString("d_isonoffnm")%></td-->
                    <td class="table_02_1" align="center"><%=!dbox.getString("d_subj").equals("") ? StringManager.cutZero(dbox.getString("d_subjseqgr")) : "&nbsp;"%></td>
                    <td class="table_02_1" align="center"><%=!dbox.getString("d_subj").equals("") ? FormatDate.getFormatDate(dbox.getString("d_propstart"), "yyyy/MM/dd") + " ~ " + FormatDate.getFormatDate(dbox.getString("d_propend"), "yyyy/MM/dd") : "&nbsp;"%></td>
                    <td class="table_02_1" align="center"><%=!dbox.getString("d_subj").equals("") ? FormatDate.getFormatDate(dbox.getString("d_edustart"),"yyyy/MM/dd")   + " ~ " + FormatDate.getFormatDate(dbox.getString("d_eduend")  ,"yyyy/MM/dd") : "&nbsp;"%></td>
                    <td class="table_02_1" align="center"><%=!dbox.getString("d_subj").equals("") ? dbox.getInt("d_studentlimit") : "&nbsp;"%></td>
                    <td class="table_02_1" align="center"><%=!dbox.getString("d_subj").equals("") ? dbox.getInt("d_cnt_propose")  : "&nbsp;"%><!--d_proposecnt--></td>
                    <td class="table_02_1" align="center"><%=!dbox.getString("d_subj").equals("") ? dbox.getInt("d_cnt_student")  : "&nbsp;"%><!--d_studentcnt--></td>
                    <td class="table_02_1" align="center"><%=!dbox.getString("d_subj").equals("") ? dbox.getInt("d_cnt_stold")    : "&nbsp;"%><!--d_stoldcnt--></td>
                    <td class="table_02_1" align="center"><%=!dbox.getString("d_subj").equals("") ? dbox.getInt("d_biyong")       : "&nbsp;"%><!--d_biyong--></td>
                    <td class="table_02_1" align="center"><%=!dbox.getString("d_subj").equals("") ? dbox.getString("d_autoconfirm")  : "&nbsp;"%><!--d_autoconfirm--></td>
                    <td class="table_02_1" align="center"><%=!dbox.getString("d_subj").equals("") ? dbox.getInt("d_reviewdays")  : "&nbsp;"%><!--d_reviewdays--></td>
                    <td class="table_02_1" align="center">
<%
                //int i4Cnt = dbox.getInt("d_studentlimit") + dbox.getInt("d_cnt_propose") + dbox.getInt("d_cnt_student") + dbox.getInt("d_cnt_stold");
				int i4Cnt = dbox.getInt("d_cnt_propose") + dbox.getInt("d_cnt_student") + dbox.getInt("d_cnt_stold");
                if (!dbox.getString("d_subj").equals("")) {
%>
                        <input type="checkbox" name="p_checks" id="oChecks<%= i %>" value="<%=ss_grcode%>,<%=dbox.getString("d_gyear")%>,<%=dbox.getString("d_grseq")%>,<%=dbox.getString("d_subj")%>,<%=dbox.getString("d_year")%>,<%=dbox.getString("d_subjseq")%>,<%=dbox.getString("d_isonoff")%>" <% if(i4Cnt == 0) { out.print("checked"); }else{ out.print("disabled"); } %>>
<%
                }
%>
                    </td>
 <%
                if (!dbox.getString("d_subj").equals("") && v_course.equals("000000")){
                    v_subj = dbox.getString("d_subj");
                    v_year = dbox.getString("d_year");
                    v_subjseq = dbox.getString("d_subjseq");
%>
                    <td class="table_02_1" align="center">
                        <table width="96%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td align="center">
                                    <a href="javascript:delSubj('<%=v_gyear%>','<%=v_grseq%>','<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>')"><img src="/images/admin/button/btn_del.gif"  border="0"></a>
                                </td>
                                <td align="center">
                                    <a href="javascript:addSubj('<%=dbox.getString("d_subjnm")%>','<%=v_gyear%>','<%=v_grseq%>','<%=v_subj%>')"><img src="/images/admin/button/btn_add.gif"  border="0"></a>
                                </td>
                            </tr>
                        </table>
                    </td>
<%
                } else if (!dbox.getString("d_subj").equals("") && !dbox.getString("d_course").equals("000000") && !v_courseStr.equals(v_precourse)){
                    v_precourse = v_courseStr;
%>
                    <td class="table_02_1" align="center" rowspan="<%=subjcnt%>">
                        <table width="96%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td align="center">
                                    <a href="javascript:delCourse('<%=v_gyear%>','<%=v_grseq%>','<%=v_course%>','<%=v_cyear%>','<%=v_courseseq%>')"><img src="/images/admin/button/btn_del.gif"  border="0"></a>
                                </td>
                                <td align="center">
                                    <a href="javascript:addCourse('<%=dbox.getString("d_coursenm")%>','<%=v_gyear%>','<%=v_grseq%>','<%=v_course%>')"><img src="/images/admin/button/btn_add.gif"  border="0"></a>
                                </td>
                            </tr>
                        </table>
                    </td>
<%
                } else {
%>
                    <td class="table_02_1">&nbsp;</td>
<%
                }
%>
                </tr>
<%

            }    // end if
        }       // end for

        if (list.size()==0) {
%>
                <tr><td colspan="14" class="table_02_1">��ϵ� ���������� �����ϴ�.</td></tr>
<%
        }
    }  // end if : if (box.getString("p_action").equals("go")) {
%>
            </table>
            <br/>
        </td>
    </tr>
</table>
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
