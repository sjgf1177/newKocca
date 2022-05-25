<%
//**********************************************************
//  1. ��      ��: PROPOSE MEMBER LIST
//  2. ���α׷���: za_ProposeMember_L.jsp
//  3. ��      ��: ��û�����ȸ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004-02-04
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    int     v_pageno    = box.getInt("p_pageno");
    String ems_url = conf.getProperty("ems.url.value");

	if(v_pageno == 0) v_pageno = 1;

    String  v_grseq     =  "";
    String  v_grseqnm   =  "";
    String  v_course    =  "";
    String  v_cyear     =  "";
    String  v_courseseq =  "";
    String  v_coursenm  =  "";
    String  v_subj      =  "";
    String  v_year      =  "";
    String  v_subjnm    =  "";
    String  v_subjseq   =  "";
    String  v_subjseqgr =  "";
    String  v_userid    =  "";
    String  v_name      =  "";
    String  v_appdate   =  "";
    String  v_edustart  =  "";
    String  v_eduend    =  "";
    String  v_isproposeapproval =  "";
    String  v_chkfirst  =  "";
    String  v_chkfinal  =  "";
    String  v_email     =  "";
    String  v_ismailing =  "";
    String  v_isnewcourse= "";
    String  v_chkfirst_value  =  "";
    String  v_chkfinal_value  =  "";
    String  v_mapproval_value  =  "";
    String  v_isonoff   =  "";
    String  v_isonoff_value="";

	String v_membergubun = "";
	String v_dispnum	= "";
	String v_tmp_subj	= "";
	String v_iscourseYn	= "";

    int     v_totalpage = 0;
    int     v_rowcount  = 0;
    int     v_rowspan   = 0;
    int     v_total     = 0;
    int     i           = 0;
    int     j           = 0;
	int		v_subjcnt	= 0;
	int		v_total_row_count = 0;
	int		v_usercnt	= 0;

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
    String  ss_selgubun  = box.getString("s_selgubun");
    String  ss_seltext   = box.getString("s_seltext");
    String  ss_edustart  = box.getString("s_start");            //����������
    String  ss_eduend    = box.getString("s_end");              //����������

    String  ss_action    = box.getString("s_action");
    String  v_ongo      = "whenSelection('go')";


    if (ss_action.equals("go")) {    //go button ���ýø� list ���
        list = (ArrayList)request.getAttribute("ProposeMemberList");
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
	//�˻�
    function whenSelection(p_action) {
        if (p_action=="go"){
        	if (chkParam() == false) {
        		return;
        	}
        	top.ftop.setPam();
        }
        document.form1.s_action.value = p_action;
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.propose.ProposeStatusAdminServlet';
        document.form1.p_process.value = 'ProposeMemberList';
        document.form1.submit();
    }

	//�˻�
    function whenSelection2(p_action, p_type) {
        if (p_action=="go"){
            if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '') {
                alert("�����׷��� �����ϼ���.");
                return ;
            }
            var st_date = make_date(form1.s_start.value);
            var ed_date = make_date(form1.s_end.value);

            if((st_date.length > 0 && ed_date.length > 0) && st_date > ed_date) {
                alert("������������ ���������Ϻ��� Ů�ϴ�.");
                return;
            }
            document.form1.s_edustart.value = st_date;
            document.form1.s_eduend.value   = ed_date;
            top.ftop.setPam();
        }
        if (p_type == 'selgubun')
        document.form1.s_seltext.value = 'ALL';
        document.form1.s_action.value = p_action;
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.propose.ProposeStatusAdminServlet';
        document.form1.p_process.value = 'ProposeMemberList';
        document.form1.submit();
    }
 	
	// �˻����� üũ
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

	// �������
    function whenExcel() {
        if(document.form1.s_action.value != "go"){
            alert('���� ��ȸ�� �ֽʽÿ�');
            return;
      }
        //window.self.name = "ProposeMemberList";
        //open_window("openExcel","","100","100","700","400","yes","yes","yes","yes","yes");
        //document.form1.target = "_blank";
        document.form1.action='/servlet/controller.propose.ProposeStatusAdminServlet';
        document.form1.p_process.value = 'ProposeMemberExcel';
        document.form1.p_action.value = 'go';
        document.form1.submit();
    }

	//üũ�ڽ� üũ
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

	//��ü����
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

	// ��ü���� ���
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
    // SMS ����
    function whenSMS() {
      if (chkSelected() < 1) {
        alert('SMS�� �߼��� �н��ڸ� �����ϼ���');
        return;
      }

      ff =document.form1;

      ff.p_msubjnm.value=ff.s_subjcourse.options[ff.s_subjcourse.selectedIndex].text;
      ff.p_mseqgrnm.value=ff.s_subjseq.options[ff.s_subjseq.selectedIndex].text;
      ff.p_msubj.value=ff.s_subjcourse.value;
      ff.p_myear.value=ff.s_gyear.value;
      ff.p_msubjseq.value=ff.s_subjseq.value;
      ff.p_touch.value = "09";

//      window.self.name = "StudentMemberList";
      open_window("openSMS","","100","100","620","354");
      document.form1.target = "openSMS";
      document.form1.action='/servlet/controller.study.StudentStatusAdminServlet';
      document.form1.p_process.value = 'SendSMS';
      document.form1.submit();
    }

	// �����Ϲ߼�
    function whenFormMail() {
      if (chkSelected() < 1) {
        alert('������ �߼��� �н��ڸ� �����ϼ���');
        return;
      }

      document.form1.target = "_self";
      document.form1.action='/servlet/controller.propose.ProposeStatusAdminServlet';
      document.form1.p_process.value = 'SendFormMail';
      document.form1.submit();
    }

	//�Ϲݸ��� �߼�
    function whenFreeMail() {
      if (chkSelected() < 1) {
        alert('������ �߼��� �н��ڸ� �����ϼ���');
        return;
      }

      ff =document.form1;

      ff.p_msubjnm.value=ff.s_subjcourse.options[ff.s_subjcourse.selectedIndex].text;
      ff.p_mseqgrnm.value=ff.s_subjseq.options[ff.s_subjseq.selectedIndex].text;
      ff.p_msubj.value=ff.s_subjcourse.value;
      ff.p_myear.value=ff.s_gyear.value;
      ff.p_msubjseq.value=ff.s_subjseq.value;



//      window.self.name = "ProposeMemberList";
      //open_window("openFreeMail","","100","100","640","550");
      open_window("openFreeMail","","10","10","800","650");
      document.form1.target = "openFreeMail";
     document.form1.action='/servlet/controller.propose.ProposeStatusAdminServlet';
      document.form1.p_process.value = 'SendFreeMail';
      document.form1.submit();
    }

	// �������̵�
    function go(index) {
        document.form1.target = "_self";
         document.form1.p_pageno.value = index;
         document.form1.action = '/servlet/controller.propose.ProposeStatusAdminServlet';
         document.form1.p_process.value = "ProposeMemberList";
         document.form1.submit();
    }

	// �������̵�
    function goPage(pageNum) {
        document.form1.target = "_self";
         document.form1.p_pageno.value = pageNum;
         document.form1.action = '/servlet/controller.propose.ProposeStatusAdminServlet';
         document.form1.p_process.value = "ProposeMemberList";
         document.form1.submit();
    }

	// ��� ����
    function whenMemberInfo(userid) {
//        window.self.name = "ProposeMemberList";
        open_window("openMember","","100","100","600","260");
        document.form1.target = "openMember";
        document.form1.action='/servlet/controller.library.SearchServlet?p_userid='+userid;
        document.form1.p_process.value = 'memberInfo';
        document.form1.submit();
//        document.form1.target = window.self.name;
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
 function fnSubjSearchByName() {
     $("#oGrseq").trigger("change");
 }
-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<div id=minical OnClick="this.style.display='none';" oncontextmenu='return false'
ondragstart='return false' onselectstart='return false'
style="background : buttonface; margin: 5; margin-top: 2;border-top: 1
solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1
solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index: 99">
</div>
<form name = "form1" method = "post">
    <input type="hidden" name="p_process" value="<%=v_process%>">
    <input type="hidden" name="p_pageno" value="<%=v_pageno%>">
    <input type="hidden" name="s_action"  value="<%=ss_action%>">    <!--in relation to select-->
    <input type="hidden" name="p_rprocess" value="ProposeMemberList">
    <input type="hidden" name="p_orderColumn" value="<%=v_orderColumn%>">
    <input type="hidden" name="p_orderType" value="<%=v_orderType%>">
    <input type="hidden" name="p_action">
    <input type="hidden" name="s_edustart">
    <input type="hidden" name="s_eduend">


    <!-- tz_humantouc insert parameter start-->
    <input type="hidden" name="p_touch" value='04'>
    <input type="hidden" name="p_msubjnm" value=''>
    <input type="hidden" name="p_mseqgrnm" value=''>
    <input type="hidden" name="p_msubj" value=''>
    <input type="hidden" name="p_myear" value=''>
    <input type="hidden" name="p_msubjseq" value=''>
    <!-- tz_humantouc insert parameter end -->

    <input type="hidden" name="userLoginID" value="<%=box.getSession("userid")%>">
    <input type="hidden" name="emsName" value="<%=box.getSession("name")%>">
	<input type="hidden" name="emsEmail" value="<%=box.getSession("email")%>">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
       <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/propose/p_title08.gif" ></td>
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
            <td width=9></td>
            <td width="32" align="right" >
            </td>
            <td width=7></td>
            <td width="32" align="right" >
            <!--a href="javascript:whenAllSelectCancel()"><img src="/images/admin/button/select_cancel1_butt.gif" border="0"></a-->
            </td>
            <td width="5" height="20" align="right">&nbsp;</td>
            <!-- <td width="119" align="right" >
            <a href="javascript:whenFormMail()"><img src="/images/admin/complete/encourage_mail1_butt.gif" width="58" height="18" border="0"></a>
            </td> -->
            <td width=8>&nbsp;</td>
            <td  width="726" align="right">
            <a href="javascript:whenSMS()"><img src="/images/admin/button/btn_sms.gif" border="0"></a>
            </td>
            <td width=8>&nbsp;</td>
            <td width="32" align="right" >
            <a href="javascript:whenFreeMail()"><img src="/images/admin/button/btn_mail.gif" border="0"></a>
            </td>
            <td width=8>&nbsp;</td>
            <td width="32" align="right">
            <a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif" border="0"></a>
            </td>
            
        </tr>
        <tr>
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- ��������, ���Ϲ߼�, �������, ��μ���, ��μ������  ��ư �� ----------------->
      <!----------------- ��û�����ȸ ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
          <tr>
            <td colspan="12" class="table_top_line"></td>
          </tr>
          <tr>
            <td class="table_title">No</td>
            <td class="table_title" width="20%"><a href="javascript:whenOrder('subj')" class="e">����</a></td>
            <td class="table_title" width="10%"><a href="javascript:whenOrder('grseq')" class="e">��������</a></td>
            <td class="table_title" width="13%">ȸ������</td>
            <td class="table_title" width="5%"><a href="javascript:whenOrder('userid')" class="e">ID</a></td>
            <td class="table_title" width="7%"><a href="javascript:whenOrder('name')" class="e">����</a></td>
            <td class="table_title" width="5%">����<br>����</td>
            <td class="table_title" width="7%">����</td>
            <!--td class="table_title" width="5%"><a href="javascript:whenOrder('cono')" class="e">���</a></td-->
            <td class="table_title">��û��</td>
            <td class="table_title">�����Ⱓ</td>
            <!--<td class="table_title" width="6%">�������</td>-->
            <td class="table_title" width="7%">��������</td>
            <td class="table_title"><%@ include file="/learn/admin/include/za_checkboxall.jsp" %></td>
          </tr>
        <%
			int membernum = 0;
            if (ss_action.equals("go")) {    //go button ���ýø� list ���
                for(i = 0; i < list.size(); i++)
				{
					DataBox dbox = (DataBox)list.get(i);

                    v_grseq         = dbox.getString("d_grseq");
                    v_grseqnm       = dbox.getString("d_grseqnm");
                    v_course        = dbox.getString("d_course");
                    v_cyear         = dbox.getString("d_cyear");
                    v_courseseq     = dbox.getString("d_courseseq");
                    v_coursenm      = dbox.getString("d_coursenm");
                    v_subj          = dbox.getString("d_subj");
                    v_year          = dbox.getString("d_year");
                    v_subjnm        = dbox.getString("d_subjnm");
                    v_subjseq       = dbox.getString("d_subjseq");
                    v_subjseqgr     = dbox.getString("d_subjseqgr");
                    v_userid        = dbox.getString("d_userid");
                    v_name          = dbox.getString("d_name");
                    v_appdate       = dbox.getString("d_appdate");
                    v_edustart      = dbox.getString("d_edustart");
                    v_eduend        = dbox.getString("d_eduend");
                    v_chkfirst      = dbox.getString("d_chkfirst");
                    v_chkfinal      = dbox.getString("d_chkfinal");
                    v_email         = dbox.getString("d_email");
                    v_ismailing     = dbox.getString("d_ismailing");
                    v_isnewcourse   = dbox.getString("d_isnewcourse");
                    v_isonoff       = dbox.getString("d_isonoff");
                    v_membergubun	= dbox.getString("d_membergubun");
					v_iscourseYn	= dbox.getString("d_isbelongcourse");
                    v_subjcnt	    = dbox.getInt("d_subjcnt");

					v_dispnum		= dbox.getString("d_dispnum");
                    v_totalpage     = dbox.getInt("d_totalpage");
                    v_rowcount      = dbox.getInt("d_rowcount");
					v_total_row_count = dbox.getInt("d_total_row_count");


                    v_appdate    = FormatDate.getFormatDate(v_appdate,"yyyy/MM/dd HH:mm:ss");
                    v_edustart   = FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd");
                    v_eduend     = FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd");

					//ȸ������
					if(v_membergubun.equals("C")) {v_membergubun = "���";}
					else if(v_membergubun.equals("U")) {v_membergubun = "����";}
					else  {v_membergubun = "����";}

                    if(v_chkfirst.equals("Y"))               {  v_chkfirst_value = "����";    }
                    else if(v_chkfirst.equals("N"))          {  v_chkfirst_value = "�̽���";  }

                    if(v_chkfinal.equals("Y"))               {  v_chkfinal_value = "����";    }
                    else if(v_chkfinal.equals("N"))          {  v_chkfinal_value = "�̽���";  }
                    else if(v_chkfinal.equals("B"))          {  v_chkfinal_value = "��ó��";  }
                    else if(v_chkfinal.equals("M"))          {  v_chkfinal_value = "-";  }

                    if(v_isonoff.equals("ON"))               {     v_isonoff_value="���̹�";   }
                    else                                     {     v_isonoff_value="����";     }
               %>
<%
	if(v_iscourseYn.equals("Y"))
	{
	   if(j == v_subjcnt) v_tmp_subj = "";

		if(!v_tmp_subj.equals(v_course) && !v_tmp_subj.equals("000000"))
		{
			v_usercnt++;
			 j = 1;
			%>

        <tr>
            <td class="table_01"><%= v_usercnt + (v_pageno - 1) * v_rowcount %></td>
            <td class="table_02_2" ><font class="text_color01"><%=v_coursenm%></font></td>
			<!--td class="table_02_2" ><font class="text_color04"><%//=v_subjnm%></font></td-->
			<td class="table_02_1" ><%= v_grseqnm %></td>
            <td class="table_02_1" ><%= v_membergubun %></td>
            <td class="table_02_1" ><a href="javascript:whenMemberInfo('<%=v_userid%>')" class="e"><%= v_userid %></a></td>
            <td class="table_02_1" ><%= v_name %></td>
            <td class="table_02_1" ><%=StringManager.cutZero(v_subjseqgr)%></td>
            <td class="table_02_1" ><%=v_isonoff_value%></td>
            <td class="table_02_1" ><%= v_appdate %></td>
            <td class="table_02_1" ><%= v_edustart %>~ <%= v_eduend %></td>
            <td class="table_02_1" ><%= v_chkfinal_value %></td>
            <td class="table_02_1" >
              <input type="checkbox" name="p_checks" value="<%=v_userid%>,<%=v_subj%>,<%=v_year%>,<%=v_subjseq%>,<%=v_course%>">
            </td>
            <input type="hidden" name="p_subj" value="<%=v_subj%>">
            <input type="hidden" name="p_year" value="<%=v_year%>">
            <input type="hidden" name="p_subjseq" value="<%=v_subjseq%>">
        </tr>
	<%
			v_tmp_subj = v_course;
		}else{
			j++;
		%>
			<!--td class="table_02_2"><font class="text_color04"><%//=v_subjnm%></font></td>
            <td class="table_02_1" ><%//= v_appdate %></td>
            <td class="table_02_1" ><%//= v_edustart %>~ <%= v_eduend %></td-->
<%		}
	} else { v_usercnt++; %>

        <tr>
            <td class="table_01"><%= v_usercnt + (v_pageno - 1) * v_rowcount %></td>
            <td class="table_02_2"><font class="text_color04"><%=v_subjnm%></font></td>
			<td class="table_02_1"><%= v_grseqnm %></td>
            <td class="table_02_1"><%= v_membergubun %></td>
            <td class="table_02_1"><a href="javascript:whenMemberInfo('<%=v_userid%>')" class="e"><%= v_userid %></a></td>
            <td class="table_02_1"><%= v_name %></td>
            <td class="table_02_1"><%=StringManager.cutZero(v_subjseqgr)%></td>
            <td class="table_02_1"><%=v_isonoff_value%></td>
            <!--td class="table_02_1"><a href="javascript:whenMemberInfo('<%=v_userid%>')" class="e"><%  //= v_cono %></a></td //-->
            <td class="table_02_1"><%= v_appdate %></td>
            <td class="table_02_1"><%= v_edustart %>~ <%= v_eduend %></td>
            <!--<td class="table_02_1"><%= v_mapproval_value %></td>-->
            <td class="table_02_1"><%= v_chkfinal_value %></td>
            <td class="table_02_1">
              <input type="checkbox" name="p_checks" value="<%=v_userid%>,<%=v_subj%>,<%=v_year%>,<%=v_subjseq%>,<%=v_course%>">
            </td>
            <input type="hidden" name="p_subj" value="<%=v_subj%>">
            <input type="hidden" name="p_year" value="<%=v_year%>">
            <input type="hidden" name="p_subjseq" value="<%=v_subjseq%>">
        </tr>

<% } %>

         <%
               }
            }
         if(i == 0 && ss_action.equals("go")){ %>
              <tr>
                <td class="table_02_1" colspan="12">��ϵ� ������ �����ϴ�</td>
              </tr>
        <% } else{ %>   </table> <% } %>


       <%  if(i > 0){ %>
        <table class="table1" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><%= PageUtil.printPageList(v_totalpage, v_pageno, v_rowcount) %></td>
          </tr>
        </table>
        <br>
        <table class="table1" cellspacing="0" cellpadding="0">
          <tr>
            <td align="right">��<b> TOTAL : <%=v_total_row_count%>��</b></td>
          </tr>
        </table>
        <% } %>
      </table>
      <!----------------- ��û��� ��ȸ �� ----------------->
     <br>
    </td>
  </tr>
</table>
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
