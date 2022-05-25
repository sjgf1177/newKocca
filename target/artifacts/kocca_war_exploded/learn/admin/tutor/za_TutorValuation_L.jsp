<%
//**********************************************************
//  1. ��      ��: �����򰡰���
//  2. ���α׷���: za_TutorValuation_L.jsp
//  3. ��      ��: �����򰡰��� ��ȸ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.complete.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    String ems_url = conf.getProperty("ems.url.value");
    
    int     v_pageno        = box.getInt("p_pageno");
    int     v_pagesize      = box.getInt("p_pagesize");
    int     v_totalrowcount =  0;
    int     v_dispnum       = 0;           // �ѰԽù���
    int     v_totalpage     = 0;           // �Խù�����������

	String  v_subj      = "";
    String  v_year      = "";
    String  v_subjnm    = "";
    String  v_subjseq   = "";
    String  v_tuuserid	= "";
	String  v_name		= "";
	String  v_malevel	= "";
    String	v_isclosed = "";
    int     v_stucnt	=  0;
    int		v_grayncnt	= 0;
    int     i           =  0;

    ArrayList list      = null;
    //DEFINED class&variable END

    //DEFINED in relation to select START
    String  ss_grcode		= box.getString("s_grcode");        //�����׷�
    String  ss_gyear		= box.getString("s_gyear");         //�⵵
    String  ss_grseq		= box.getString("s_grseq");         //��������
    String  ss_upperclass	= box.getString("s_upperclass");      //������з�
    String  ss_middleclass	= box.getString("s_middleclass");    //�����ߺз�
    String  ss_lowerclass	= box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse	= box.getString("s_subjcourse");    //����&�ڽ�
    String  ss_subjseq		= box.getString("s_subjseq");       //���� ����

    String  ss_action		= box.getString("s_action");
    
    if (ss_action.equals("go")) {    //go button ���ýø� list ���
        list = (ArrayList)request.getAttribute("gradelist");
    }
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script> 
<SCRIPT LANGUAGE="JavaScript">
<!--          
    function whenSelection(p_action) {
	    if (p_action=="go"){
	    	if (chkParam() == false) {
                return;
            }
	        top.ftop.setPam();
	    }    
        document.form1.s_action.value = p_action;
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.tutor.TutorValuationAdminServlet';
        document.form1.p_process.value = 'listPage';  
        document.form1.submit();
    }
       
    function whenOrder(column) {
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.tutor.TutorValuationAdminServlet';
        document.form1.p_process.value = 'listPage';   
        document.form1.p_orderColumn.value = column;
        document.form1.submit();
    }    
    
    function whenExcel() {    
        if(document.form1.s_action.value != "go"){
            alert('���� ��ȸ�� �ֽʽÿ�');
            return;
      }        
        //window.self.name = "StudentMemberCountList";     
        //open_window("openExcel","","100","0","600","400","yes","yes","yes","yes","yes");  
        document.form1.target = "_self";               
        document.form1.action='/servlet/controller.tutor.TutorValuationAdminServlet';
        document.form1.p_process.value = 'listPageExcel';   
        document.form1.submit();
    }    

    function chkSelected() {
      var selectedcnt = 0;
      if(document.form1.all['p_checks'] == '[object]') {
        if (document.form1.p_checks.length > 0) {
          for (i=0; i<document.form1.p_checks.length; i++) {
            if (document.form1.p_checks[i].checked == true) {
    	      selectedcnt++;
    	    }
          }
        } else {
          if (document.form1.p_checks.checked == true) {
    	    selectedcnt++;
          }
        }
      }
      return selectedcnt; 
    }

    function whenAllSelect() {
      if(document.form1.all['p_checks'] == '[object]') {
        if (document.form1.p_checks.length > 0) {
          for (i=0; i<document.form1.p_checks.length; i++) {
            document.form1.p_checks[i].checked = true;
          }
        } else {
          document.form1.p_checks.checked = true;
        }
      } 
    }
    
    function whenAllSelectCancel() {
      if(document.form1.all['p_checks'] == '[object]') {
        if (document.form1.p_checks.length > 0) {
          for (i=0; i<document.form1.p_checks.length; i++) {
            document.form1.p_checks[i].checked = false;
          }
        } else {
          document.form1.p_checks.checked = false;
        }
      }
    }

    function whenTutorDetail(subj, year, subjseq, userid, name, subjnm, isclosed){
    	window.self.name = "TutorActionDetail";     
        open_window("openTutor","","100","0","730","700","N","yes","yes","yes","yes");  
        document.form1.target = "openTutor";               
        document.form1.action = '/servlet/controller.tutor.TutorValuationAdminServlet';
        document.form1.p_process.value = 'detailView';
        document.form1.p_subj.value = subj;
        document.form1.p_year.value = year;
        document.form1.p_subjseq.value = subjseq;
        document.form1.p_userid.value = userid;
        document.form1.p_name.value = name;
        document.form1.p_subjnm.value = subjnm;
        document.form1.p_isclosed.value = isclosed;
		
        document.form1.submit();
    }


    function chkSelected() {
      var selectedcnt = 0;
      if(document.form1.all['p_checks'] == '[object]') {
        if (document.form1.p_checks.length > 0) {
          for (i=0; i<document.form1.p_checks.length; i++) {
            if (document.form1.p_checks[i].checked == true) {
              selectedcnt++;
            }
          }
        } else {
          if (document.form1.p_checks.checked == true) {
            selectedcnt++;
          }
        }
      }
      return selectedcnt;
    }

    function whenFreeMail() {

      if (chkSelected() < 1) {
        alert('������ �߼��� �н��ڸ� �����ϼ���');
        return;
      }

      open_window("openFreeMail","","10","10","800","650");
      document.form1.target = "openFreeMail";
      ff =document.form1;

      ff.p_msubjnm.value=ff.s_subjcourse.options[ff.s_subjcourse.selectedIndex].text;
      ff.p_mseqgrnm.value=ff.s_subjseq.options[ff.s_subjseq.selectedIndex].text;
      ff.p_msubj.value=ff.s_subjcourse.value;
      ff.p_myear.value=ff.s_gyear.value;
      ff.p_msubjseq.value=ff.s_subjseq.value;
      ff.p_touch.value = "12";
      document.form1.action='/servlet/controller.tutor.TutorValuationAdminServlet';
      document.form1.p_process.value = 'SendFreeMail';
      document.form1.submit();

    }

    function go(index) {
        document.form1.p_pageno.value = index;
        document.form1.action = "/servlet/controller.tutor.TutorValuationAdminServlet";
        document.form1.p_process.value = "listPage";
        document.form1.submit();
   }
   function goPage(pageNum) {
        document.form1.p_pageno.value = pageNum;
        document.form1.action = "/servlet/controller.tutor.TutorValuationAdminServlet";
        document.form1.p_process.value = "listPage";
        document.form1.submit();
   }

    function pagesize(pageSize) {
        document.form1.target = "_self";
        document.form1.p_pageno.value = 1;
        document.form1.p_pagesize.value = pageSize;
        document.form1.action = '/servlet/controller.tutor.TutorValuationAdminServlet';
        document.form1.p_process.value = "listPage";
        document.form1.submit();
    }
    
  //�˻����� üũ
	function chkParam() {
	  if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
	    alert("�����׷��� �����ϼ���.");
	    return false;
	  }
	  if (document.form1.s_gyear.value == "" || document.form1.s_gyear.value == '----') {
	      alert("������ �����ϼ���.");
	      return false;
	    }
	  if (document.form1.s_grseq.value == "" || document.form1.s_grseq.value == '----') {
	    alert("���������� �����ϼ���.");
	    return false;
	  }
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
            var param;
            subjSearchKey = (subjSearchKey == "") ? "" : subjSearchKey;
            if(subjSearchKey == "")
            	param = "type=sqlID&sqlID=selectBox.subjListAll&param=" + grcode + "," + gyear + "," + $(this).val();
            else 
            	param = "type=sqlID&sqlID=selectBox.subjList&param=" + grcode + "," + gyear + "," + $(this).val() + "," + subjSearchKey;
            
            $.ajaxSetup({cache:false});
            $.ajax({
                    type : "post"
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
-->    	
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post" action="/servlet/controller.tutor.TutorValuationAdminServlet">
    <input type="hidden" name="p_process" value="<%=v_process%>">
    <input type="hidden" name="p_pageno" value="<%=v_pageno %>">    
    <input type="hidden" name="p_pagesize" value="<%=v_pagesize %>">
    <input type="hidden" name="s_action"  value="<%=ss_action%>">    <!--in relation to select-->   
    <input type="hidden" name="p_orderColumn">
    <input type="hidden" name="p_subj">
	<input type="hidden" name="p_year">
	<input type="hidden" name="p_subjseq">
	<input type="hidden" name="p_userid">
	<input type="hidden" name="p_name">
	<input type="hidden" name="p_subjnm">
    <input type="hidden" name="userLoginID" value="<%=box.getSession("userid")%>">
	<input type="hidden" name="p_isclosed">
	<!-- tz_humantouc insert parameter start-->
    <input type="hidden" name="p_touch" value=''>
    <input type="hidden" name="p_msubjnm" value=''>
    <input type="hidden" name="p_mseqgrnm" value=''>
    <input type="hidden" name="p_msubj" value=''>
    <input type="hidden" name="p_myear" value=''>
    <input type="hidden" name="p_msubjseq" value=''>
    <!-- tz_humantouc insert parameter end -->
	
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
 <tr>
    <td align="center" valign="top"> 
	 
  <!----------------- title ���� ----------------->
  <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
    <tr> 
      <td><img src="/images/admin/tutor/tit_new_05.gif"></td>
      <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
    </tr>
  </table>
  <!----------------- title �� --------------- -->
      <br>

      <!----------------- form ���� ----------------->
      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <tr><td align="center" valign="top"><tr>
          <td bgcolor="#C6C6C6" align="center">
            <table cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="center" valign="middle">
                  <table border="0" cellspacing="0" cellpadding="0" width="99%" class="form_table">
                    <tr>
                      <td colspan="2" align="left" valign="middle" rowspan='2'>
                        <!------------------- ���ǰ˻� ���� ------------------------->
					<script type="text/javascript">
					var startup = 0;
					function Main_s_grseq(){
						if (startup > 0)
							changes_grseq(document.form1.s_grcode.value, document.form1.s_gyear.value);
					}
					function Main_subjcourse(){
						var subjSearchKey = '';
						if (document.form1.s_subjsearchkey == 'undefine')  subjSearchKey = '';
						if(startup > 2) {
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
					</script>
<%@ taglib uri="/tags/KoccaTaglib" prefix="kocca" %>

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
                                <td class="_tdT">��з�</td>
                                <td class="_tdS">
                                    <kocca:selectBox name="s_upperclass" id="oUpperclass" optionTitle="== ��ü ==" type="sqlID" sqlID="selectBox.subjAttUpperList" selectedValue="<%= ss_upperclass %>" isLoad="true" />
                                </td>
                                <td class="_tdT">�ߺз�</td>
                                <td class="_tdS">
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
                                <td class="_tdT">�Һз�</td>
                                <td class="_tdS" colspan="2">
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
                                <td class="_tdT">�����˻�</td>
                                <td class="_tdS">
                                    <input type="text" id="oSubjSearchKey" name="s_subjsearchkey" id="oSubjSearchKey" size="17" onkeypress="if(event.keyCode=='13') fnSubjSearchByName();" value="<%=s_subjsearchkey%>">
                                    <a href="javascript:fnSubjSearchByName()" ><img src="/images/admin/button/search3_butt.gif" border="0" align="absmiddle"></a>                                                        </td>
                                <td class="_tdT">����</td>
                                <td colspan="4" class="_tdS">
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
                            	<td class="_tdT">��������</td>
                               	<td colspan = "3" class="_tdS">
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
			                    <td align="right"><%@ include file="/learn/admin/include/za_GoButton.jsp" %></td>
                                
                            </tr>	
						</table>
                      
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="7"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
	  <!----------------- form �� ----------------->

      <br>
      <br>

      <!----------------- ������� ��ư ���� ----------------->
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td align="right">&nbsp;</td>
		  <td align="right" valign="top">
			<a href="javascript:whenFreeMail()"><img src="/images/admin/button/btn_mail.gif" border="0"></a> 
			<a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif" border="0"></a> 
		  </td>
        </tr>
      </table>
      <!----------------- ������� ��ư �� ----------------->
      <!----------------- �԰������ȸ ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
          <tr> 
            <td colspan="23" class="table_top_line"></td>
          </tr>
          <tr> 
            <td class="table_title" width="5%">No</td>
            <td class="table_title"><font class="text_color04">������</font></td>            
            <td class="table_title" width="7%">��������</td>
            <td class="table_title" width="7%">�Ѱ����</td>
			<td class="table_title" width="7%">�����</td>
			<td class="table_title" width="7%">�԰��ο�</td>
			<td class="table_title" width="7%">�����ο�</td>
			<td class="table_title" width="8%">����������</td>
			<td class="table_title" width="8%">�����</td>
			<td class="table_title" width="10%">���ޱݾ�</td>
            <td class="table_title" width="5%"><%@ include file="/learn/admin/include/za_checkboxall.jsp" %></td>
          </tr>
<%
/// ����Ʈ ���� ======================================================================
if (ss_action.equals("go")) {    //go button ���ýø� list ���

		for( i = 0 ; i < list.size() ; i++ ){
			DataBox dbox = (DataBox)list.get(i);		
			v_subj		= dbox.getString("d_subj");  
			v_year		= dbox.getString("d_year");
			v_subjseq	= dbox.getString("d_subjseq");
			v_tuuserid	= dbox.getString("d_tuserid");
			v_name		= dbox.getString("d_name");
			v_subjnm	= dbox.getString("d_subjnm");
			v_stucnt	= dbox.getInt("d_stucnt");
			v_grayncnt  = dbox.getInt("d_grayncnt");
			v_malevel	= dbox.getString("d_malevel");
			v_isclosed  = dbox.getString("d_isclosed");
			
			v_dispnum   = dbox.getInt("d_dispnum");
            v_totalpage = dbox.getInt("d_totalpage");
            v_totalrowcount = dbox.getInt("d_totalrowcount");
%>

      <tr> 
            <td class="table_01"><%= v_dispnum %></td>
            <td class="table_02_2"><%=v_subjnm%></td>            
            <td class="table_02_1"><%=v_subjseq%></td>
            <td class="table_02_1"><%=dbox.getString("d_ctutorcnt")%></td>
            <td class="table_02_1"><%=v_name%></td>
            <td class="table_02_1"><%=dbox.getInt("d_stucnt")%></td>
            <td class="table_02_1"><%=v_isclosed.equals("Y")?v_grayncnt+"":"������"%></td>
            <td class="table_02_1"><%=dbox.getInt("d_sapoint")%></td>
            <td class="table_02_1"><a href="javascript:whenTutorDetail('<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>','<%=v_tuuserid%>','<%=v_name%>','<%=v_subjnm%>','<%=v_isclosed%>');" class="e"><%=v_malevel.equals("")?"<font color=red>ä��</font>":v_malevel%></a></td>           
            <td class="table_02_1"><%=NumberFormat.getInstance().format(dbox.getInt("d_jigubfee"))%></td>
            <td class="table_02_1"><input type="checkbox" name="p_checks" value="<%=v_tuuserid%>,<%=v_subj%>,<%=v_year%>,<%=v_subjseq%>"></td>
         </tr>          
<%			
         }
}         
         if(i == 0 && ss_action.equals("go")){ 
%>
              <tr> 
                <td align="center" bgcolor="#F7F7F7" height="50" colspan="23">��ϵ� ������ �����ϴ�</td>
              </tr>
<% } else{ %>   </table> <% } %>
                
      
      <!----------------- �԰���� ��ȸ �� ----------------->
       <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="right" valign="absmiddle">
              <%= PageUtil.printPageSizeList(v_totalpage, v_pageno, 0, v_pagesize, v_totalrowcount) %>
            </td>
          </tr>
        </table>
     <br>
    </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>      
</table>
</form>
</body>
</html>
