<%
//**********************************************************
//  1. ��      ��: ����������
//  2. ���α׷���: za_TutorValuation_L.jsp
//  3. ��      ��: ���������� ��ȸ
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.11.11
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
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    int     v_pageno   = box.getInt("p_pageno");
    int     v_pagesize = box.getInt("p_pagesize");

    //��������
    if (v_pageno == 0)  v_pageno = 1;
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));

    //�������� ���ڵ��
    if (v_pagesize == 0)  v_pagesize = 10;
    
	String  v_course         = "";
    String  v_cyear          = "";
    String  v_courseseq      = "";
    String  v_coursenm       = "";
    String  v_grcodenm       = "";
    String  v_subj	         = "";
	String  v_year		     = "";
	String  v_subjnm         = "";
    String	v_subjseq        = "";
    String	v_subjseqgr      = "";
    String	v_userid         = "";
    String	v_name           = "";
    String	v_membergubunnm  = "";
    String	v_isonoff        = "";
    String	v_isbelongcourse = "";
    int     v_logincnt	     = 0;
    int		v_qnacnt	     = 0;
    int     v_toroncnt	     = 0;
    int		v_subjcnt	     = 0;
    double     v_etc1	     = 0d;
    double     v_etc2	     = 0d;
    double     v_wetc1	     = 0d;
    double     v_wetc2	     = 0d;
    double     v_avetc1	     = 0d;
    double     v_avetc2	     = 0d;

    int     v_totalpage		 = 0;
    int     v_rowcount		 = 1;
    int     v_totalrowcount	 = 0;
    int     v_rowspan		 = 0;
    int     v_total			 = 0;
    int		v_dispnum		 = 0;
    int     i				 = 0;

    String  v_orderColumn  = box.getString("p_orderColumn");           //������ �÷���
    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���

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
        list = (ArrayList)request.getAttribute("activitylist");
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
        document.form1.p_pageno.value = 1;
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.study.ActivityAdminServlet';
        document.form1.p_process.value = 'listPage';  
        document.form1.submit();
    }
       
    function whenOrder(column) {
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.study.ActivityAdminServlet';
        document.form1.p_process.value = 'listPage';   
        document.form1.p_orderColumn.value = column;
        document.form1.submit();
    }    
    
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
        
        //window.self.name = "ActivityList";     
        //open_window("openExcel","","100","0","600","400","yes","yes","yes","yes","yes");  
        //document.form1.target = "openExcel";               
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.study.ActivityAdminServlet';
        document.form1.p_process.value = 'listPageExcel';   
        document.form1.submit();

        //ȭ����½� ���� ���ڵ尡 �������� �ϱ� ���� ������, �ѹ� ������� ����
        document.form1.p_pagesize.value = temp_pagesize;
        document.form1.p_pageno.value = temp_pageno;
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
        document.form1.action = '/servlet/controller.study.ActivityAdminServlet';
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

    function whenActivityDetail(subj, year, subjseq, userid){
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.study.ActivityAdminServlet';
        document.form1.p_process.value = 'updatePage';   
        document.form1.p_subj.value = subj;
        document.form1.p_year.value = year;
        document.form1.p_subjseq.value = subjseq;
        document.form1.p_userid.value = userid;
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

	// ������ �̵�
    function go(index) {
         document.form1.target = "_self";
         document.form1.p_pageno.value = index;
         document.form1.action = '/servlet/controller.study.ActivityAdminServlet';
         document.form1.p_process.value = "listPage";
         document.form1.submit();
    }

	// ������ �̵�
    function goPage(pageNum) {
         document.form1.target = "_self";
         document.form1.p_pageno.value = pageNum;
         document.form1.action = '/servlet/controller.study.ActivityAdminServlet';
         document.form1.p_process.value = "listPage";
         document.form1.submit();
    }

	// ������ ������ ����
    function pagesize(pageSize) {
         document.form1.target = "_self";
         document.form1.p_pageno.value = 1;
         document.form1.p_pagesize.value = pageSize;
         document.form1.action = '/servlet/controller.study.ActivityAdminServlet';
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
<form name = "form1" method = "post" action="/servlet/controller.study.ActivityAdminServlet">
    <input type="hidden" name="p_process" value="<%=v_process%>">
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
    <input type="hidden" name="p_pageno" value="<%=v_pageno%>">
    <input type="hidden" name="p_pagesize" value="<%=v_pagesize%>">
	
<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top"> 
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/portal/s.1_40.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� --------------- -->
      <br>

      <!----------------- form ���� ----------------->
      <table class="form_table_out" cellspacing="0" cellpadding="1">
        <tr>
          <td bgcolor="#C6C6C6" align="center">
            <table cellspacing="0" cellpadding="0" class="form_table_bg">
              <tr>
                <td height="7" width="99%"></td>
              </tr>
              <tr>
                <td align="center" width="99%" valign="middle">
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
                <td height="7" width="99%"></td>
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
			<a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif" border="0"></a> 
		  </td>
        </tr>
      </table>
      <!----------------- ������� ��ư �� ----------------->
      <!----------------- ��������ȸ ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
          <tr> 
            <td colspan="23" class="table_top_line"></td>
          </tr>
          <tr> 
            <td class="table_title" width="5%" rowspan="2">No</td>
            <td class="table_title" width="10%" rowspan="2">�����׷�</td>
            <td class="table_title" rowspan="2">������</td>            
            <td class="table_title" width="5%" rowspan="2">��������</td>
			<td class="table_title" width="7%" rowspan="2">����</td>
			<td class="table_title" colspan="3">���׸�</td>
			<td class="table_title" colspan="2">������</td>
			<td class="table_title" colspan="2">��Ÿ</td>
          </tr>
          <tr> 
            <td class="table_title" width="8%">����Ƚ��</td>
            <td class="table_title" width="8%">����������</td>
            <td class="table_title" width="8%">��й�</td>
			<td class="table_title" width="8%">����</td>
			<td class="table_title" width="8%">��</td>
			<td class="table_title" width="8%">����</td>
			<td class="table_title" width="8%">��</td>
          </tr>
<%
/// ����Ʈ ���� ======================================================================
if (ss_action.equals("go")) {    //go button ���ýø� list ���

		for( i = 0 ; i < list.size() ; i++ ){
			DataBox dbox = (DataBox)list.get(i);		
			v_course         = dbox.getString("d_course");
			v_cyear          = dbox.getString("d_cyear");
			v_courseseq      = dbox.getString("d_courseseq");
			v_coursenm       = dbox.getString("d_coursenm");
			v_grcodenm       = dbox.getString("d_grcodenm");
			v_subj           = dbox.getString("d_subj");
			v_year           = dbox.getString("d_year");
			v_subjnm         = dbox.getString("d_subjnm");
			v_subjseq        = dbox.getString("d_subjseq");
			v_subjseqgr      = dbox.getString("d_subjseqgr");
			v_userid         = dbox.getString("d_userid");
			v_name           = dbox.getString("d_name");
			v_membergubunnm  = dbox.getString("d_membergubunnm");
			v_isonoff        = dbox.getString("d_isonoff");
			v_isbelongcourse = dbox.getString("d_isbelongcourse");
			v_logincnt       = dbox.getInt("d_logincnt");
			v_qnacnt         = dbox.getInt("d_qnacnt");
			v_toroncnt       = dbox.getInt("d_toroncnt");
			v_subjcnt        = dbox.getInt("d_subjcnt");
			v_etc1           = dbox.getDouble("d_etc1");
			v_etc2           = dbox.getDouble("d_etc2");
			v_wetc1          = dbox.getDouble("d_wetc1");
			v_wetc2          = dbox.getDouble("d_wetc2");
			v_avetc1         = dbox.getDouble("d_avetc1");
			v_avetc2         = dbox.getDouble("d_avetc2");

            //������ ������
			v_totalpage     = dbox.getInt("d_totalpage");
            v_rowcount      = dbox.getInt("d_rowcount");
            v_totalrowcount = dbox.getInt("d_totalrowcount");
            v_dispnum       = dbox.getInt("d_dispnum");

%>

      <tr> 
            <td class="table_01"><%= v_dispnum %></td>
            <td class="table_02_2"><%= v_grcodenm %></td>    
            <td class="table_02_2"><%= v_subjnm %></td>            
            <td class="table_02_1"><%= StringManager.cutZero(v_subjseqgr) %></td>
            <td class="table_02_1"><%= v_name %></td>
            <td class="table_02_1"><%= v_logincnt %></td>
            <td class="table_02_1"><%= v_qnacnt %></td>
            <td class="table_02_1"><%= v_toroncnt %></td>
            <td class="table_02_1"><%= v_wetc1 %></td>   
            <td class="table_02_1"><a href="javascript:whenActivityDetail('<%= v_subj %>','<%= v_year %>','<%= v_subjseq %>','<%= v_userid %>')"><%= v_avetc1 %></a></td>  
            <td class="table_02_1"><%= v_wetc2 %></td>   
            <td class="table_02_1"><a href="javascript:whenActivityDetail('<%= v_subj %>','<%= v_year %>','<%= v_subjseq %>','<%= v_userid %>')"><%= v_avetc2 %></a></td>           
         </tr>          
<%			
         }
}         
         if(i == 0 && ss_action.equals("go")){ 
%>
              <tr> 
                <td align="center" bgcolor="#F7F7F7" height="50" colspan="23">��ϵ� ������ �����ϴ�</td>
              </tr>
<% } else{ %>   
            </table> 
<% } %>
      <!----------------- ������ ��ȸ �� ----------------->
     <br>
     <!----------------- page navi ���� ----------------->
     <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td align="right" valign="absmiddle">
           <%= PageUtil.printPageSizeList(v_totalpage, v_pageno, row, v_pagesize, v_totalrowcount) %>
         </td>
       </tr>
     </table>
     <!----------------- page navi �� ----------------->
    </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>      
</table>
</form>
</body>
</html>
