<%
//**********************************************************
//  1. ��      ��: LEARNING STATUS LIST BY SCORE
//  2. ���α׷���: za_StudyTotalStatus_L.jsp
//  3. ��      ��: ������ �н���Ȳ
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
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.system.*" %>

<%@ taglib uri="/tags/KoccaTaglib" prefix="kocca" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String v_process = box.getString("p_process");
    //String ems_url = conf.getProperty("ems.url.value");

    String v_subj = "";
    String v_course = "";
    String v_courseseq = "";
    String v_coursenm = "";
    String v_year = "";
    String v_subjseq = "";
    String v_subjnm = "";
    String v_subjseqgr = "";
    String v_userid = "";
    String v_name = "";
    String v_membergubunnm = "";
    String v_comptel = "";
    String v_email = "";
    String v_gradu_yn = "";
    String v_firstedu = "";
    String v_ldatestart = "";
    String v_ldateend = "";
    String v_totaltime = "";
    String v_totalminute = "";
    String v_sdate = "";
    String v_isgraduated = "";
    String v_isbelongcourse = "";       //���������� ����
    int v_avg_time = 0;
    int v_lessoncount = 0;
    int v_eduavgmin = 0;
    int v_edutotmin = 0;
    double v_tstep = 0;
    double v_report = 0;
    double v_act = 0;
    double v_mtest = 0;
    double v_ftest = 0;
    double v_htest = 0;
    double v_etc1 = 0;
    double v_etc2 = 0;
    double v_avtstep = 0;
    double v_avreport = 0;
    double v_avact = 0;
    double v_avmtest = 0;
    double v_avftest = 0;
    double v_avhtest = 0;
    double v_avetc1 = 0;
    double v_avetc2 = 0;
    double v_score = 0;
    int    v_point = 0;
    double v_avg_tstep = 0;
    double v_avg_report=  0;
    double v_avg_act = 0;
    double v_avg_mtest = 0;
    double v_avg_ftest = 0;
    double v_avg_htest = 0;
    double v_avg_etc1 = 0;
    double v_avg_etc2 = 0;
    double v_avg_avtstep= 0;
    double v_avg_avreport=  0;
    double v_avg_avact = 0;
    double v_avg_avmtest = 0;
    double v_avg_avftest = 0;
    double v_avg_avhtest = 0;
    double v_avg_avetc1 = 0;
    double v_avg_avetc2 = 0;
    double v_avg_score = 0;
    int v_total = 0;
    int v_samtotal = 0;
    int i = 0;
    int v_subjcnt = 0;        //�����������ϰ�� ���� ������

    String v_orderType = box.getStringDefault("p_orderType"," asc"); //���ļ���
    String v_orderColumn = box.getString("p_orderColumn");           //������ �÷���

    ArrayList list      = null;
    //DEFINED class&variable END

    //DEFINED in relation to select START
    String ss_grcode = box.getString("s_grcode");           //�����׷�
    String ss_gyear = box.getString("s_gyear");            //�⵵
    String ss_grseq = box.getString("s_grseq");            //��������
    String ss_grseqnm = box.getString("s_grseqnm");          //����������
    String ss_upperclass = box.getString("s_upperclass");      //������з�
    String ss_middleclass = box.getString("s_middleclass");    //�����ߺз�
    String ss_lowerclass = box.getString("s_lowerclass");      //�����Һз�
    String ss_subjcourse= box.getString("s_subjcourse");       //����&�ڽ�
    String ss_subjseq = box.getString("s_subjseq");          //���� ����
    String ss_selGubun = box.getString("s_selGubun");         //������ 1,������� 2
    String ss_selStart = box.getString("s_selStart");         //~����
    String ss_selEnd = box.getString("s_selEnd");           //~����
    String ss_samtotal = box.getString("s_samtotal");         // �����ƿ� Ƚ��
    String ss_goyong = box.getString("s_goyong");           // ��뺸��
    String ss_action = box.getString("s_action");
    String v_ongo = "whenSelection('go')";
    String ss_selExam = box.getString("s_selExam");           // ��������
    String ss_selProj = box.getString("s_selProj");           // ��������
    String ss_area=box.getString("s_area");
    String ss_idorname=box.getString("s_idorname");
    String ss_idornameinput=box.getString("s_idornameinput");
    String ss_biyong=box.getString("s_biyong");

    IncludeParam incparam = new IncludeParam();

    //DEFINED in relation to select END
    if (ss_action.equals("go")) {    //go button ���ýø� list ���
         list = (ArrayList)request.getAttribute("StudyTotalList");
    }
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
    function whenSelection(ss_action) {
        if (ss_action=="go"){
            top.ftop.setPam();
            if (chkParam() == false) {
                return;
            }
        }
        document.form1.s_action.value = ss_action;
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.study.StudyTotalStatusServlet';
        document.form1.p_process.value = 'StudyTotalList';
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
        //window.self.name = "StudyTotalList";
        //open_window("openExcel","","100","100","700","400","yes","yes","yes","yes","yes");
        //document.form1.target = "openExcel";
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.study.StudyTotalStatusServlet';
        document.form1.p_process.value = 'LearningStatusExcelByTotal';
        document.form1.submit();
    }

    // �Ķ���� üũ
    function chkParam() {
      if (document.form1.s_grcode.value == "" || document.form1.s_grcode.value == '----') {
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
/*
        if (document.form1.s_subjcourse.value == "" ) {
            alert("������ �����ϼ���.");
            return false;
        }
*/
    }

    // üũ�ڽ� üũ����
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

    // ��ü����
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

    // ��ü ���� ���
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

    // ��� ����
    function whenMemberInfo(userid) {
//        window.self.name = "ProposeMemberList";
        open_window("openMember","","100","100","600","460");
        document.form1.target = "openMember";
        document.form1.action='/servlet/controller.library.SearchServlet?p_userid='+userid;
        document.form1.p_process.value = 'memberInfo';
        document.form1.submit();
//        document.form1.target = window.self.name;
    }


    // ���ȭ�� (���)
    function whenCounsel(userid, subj, year, subjseq) {
        document.form1.p_userid.value = userid;
        document.form1.p_subj.value = subj+"/"+year+"/"+subjseq;

//        window.self.name = "ProposeMemberList";
        open_window("openCounsel","","50","50","800","650", false,false,true,true,true);
        document.form1.target = "openCounsel";
        document.form1.action='/servlet/controller.study.CounselAdminServlet';
        document.form1.p_process.value = 'CounselListPage';
        document.form1.submit();

//        document.form1.target = window.self.name;
    }

    // sms�߼۸���Ʈ
    function smsList(userid, subj, year, subjseq) {
        document.form1.p_userid.value = userid;
        document.form1.p_subj.value = subj;
        document.form1.p_year.value = year;
        document.form1.p_subjseq.value = subjseq;
        document.form1.p_ismail.value = "2";

//        window.self.name = "smsList";
        open_window("openSmsList","","50","50","660","540", false,false,true,true,true);
        document.form1.target = "openSmsList";
        document.form1.action='/servlet/controller.study.StudyTotalStatusServlet';
        document.form1.p_process.value = 'SmsListPage';
        document.form1.submit();

//        document.form1.target = window.self.name;
    }

    // mail�߼۸���Ʈ
    function mailList(userid, subj, year, subjseq) {
        document.form1.p_userid.value = userid;
        document.form1.p_subj.value = subj;
        document.form1.p_year.value = year;
        document.form1.p_subjseq.value = subjseq;
        document.form1.p_ismail.value = "1";

//        window.self.name = "mailList";
        open_window("openMailList","","50","50","660","540", false,false,true,true,true);
        document.form1.target = "openMailList";
        document.form1.action='/servlet/controller.study.StudyTotalStatusServlet';
        document.form1.p_process.value = 'MailListPage';
        document.form1.submit();

//        document.form1.target = window.self.name;
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

    // ������ �߼�
    function whenFormMail() {
        if (chkParam() == false) {
            return;
        }

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
      ff.p_touch.value = "11";

      document.form1.p_isMailing.value = "1";
      document.form1.target = "_self";

      //document.form1.action='/servlet/controller.study.StudentStatusAdminServlet';
      //document.form1.p_process.value = 'SendFormMail';
      //document.form1.p_isMailing.value = "1";
      //document.form1.submit();

      document.form1.action='/servlet/controller.study.StudyTotalStatusServlet';
      document.form1.p_process.value = 'SendFormMail';
      document.form1.p_isMailing.value = "1";
      document.form1.submit();
    }

    // �Ϲݸ��� �߼�
    function whenFreeMail() {
        if (chkParam() == false) {
            return;
        }
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
      ff.p_touch.value = "12";

//      window.self.name = "MemberList";
      open_window("openFreeMail","","10","10","800","650");
      document.form1.target = "openFreeMail";
      document.form1.action='/servlet/controller.study.StudyTotalStatusServlet';
      document.form1.p_process.value = 'SendFreeMail';
      document.form1.submit();

    }
    
    function fnChangeGrcode(){
		var param = "type=sqlID&sqlID=selectBox.grYearList&param=" + $('#s_grcode').val();
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
	}
    
    // select box ����
    $(function() {
        $("#s_grcode").bind("change", fnChangeGrcode);

        $("#oGyear").bind("change", function(){
            var grcode = $("#s_grcode").val();
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
            var grcode = $("#s_grcode").val();
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
                var grcode = $("#s_grcode").val();
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
        $("#oSubjseq").empty();
        $("#oGrseq").append("<option value=\"\">== ���� ==</option>");
        $("#oSubjcourse").append("<option value=\"ALL\">== ��ü ==</option>");
        $("#oSubjseq").append("<option value=\"ALL\">== ��ü ==</option>");


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
        $("#oSubjseq").empty();
        $("#oSubjcourse").append("<option value=\"ALL\">== ��ü ==</option>");
        $("#oSubjseq").append("<option value=\"ALL\">== ��ü ==</option>");


        if ( result.selectBoxList != null && result.selectBoxList.length > 0 ) {
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
        
        if ( result.selectBoxList != null && result.selectBoxList.length > 0 ) {
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
        $("#oLowerclass").append("<option value=\"\">== ��ü ==</option>");

        if ( result.selectBoxList != null && result.selectBoxList.length > 0 ) {
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
    <input type="hidden" name="p_rprocess" value="StudyTotalList">
    <input type="hidden" name="s_action"  value="<%=ss_action%>">    <!--in relation to select-->
    <input type="hidden" name="p_orderColumn" value="<%=v_orderColumn%>">
    <input type="hidden" name="p_orderType" value="<%=v_orderType%>">
    <input type="hidden" name="p_ismail" value="">
    <input type="hidden" name="p_isMailing" value=''>
    <input type="hidden" name="p_aid" value='34'>

    <!-- tz_humantouc insert parameter start-->
    <input type="hidden" name="p_touch" value=''>
    <input type="hidden" name="p_msubjnm" value=''>
    <input type="hidden" name="p_mseqgrnm" value=''>
    <input type="hidden" name="p_msubj" value=''>
    <input type="hidden" name="p_myear" value=''>
    <input type="hidden" name="p_msubjseq" value=''>
    <!-- tz_humantouc insert parameter end -->

    <!-- sms/mail list parameter start-->
    <input type="hidden" name="p_year" value=''>
    <input type="hidden" name="p_subjseq" value=''>
    <!-- sms/mail list parameter end -->

    <!-- ������-->
    <input type="hidden" name="p_userid"  value="">
    <input type="hidden" name="p_subj"    value="">
    <!-- ������-->

    <input type="hidden" name="userLoginID" value="<%=box.getSession("userid")%>">
    <input type="hidden" name="emsName" value="<%=box.getSession("name")%>">
    <input type="hidden" name="emsEmail" value="<%=box.getSession("email")%>">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" valign="top">

            <!----------------- title ���� ----------------->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
                <tr>
                    <td><img src="/images/admin/study/s_title10.gif" ></td>
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
                                                <table border="0" cellspacing="0" cellpadding="0" width="99%" >
                                                    <colgroup>
                                                        <col style="width:12%" />
                                                        <col style="width:25%" />
                                                        <col style="width:9%" />
                                                        <col style="width:*" />
                                                        <col style="width:10%" />
                                                        <col style="width:20%" />
                                                        <col style="width:10%" />
                                                    </colgroup>

                                                    <tr>
                                                        <td class="_tdT"><font color="red">��</font>�����׷�</td>
                                                        <td class="_tdS">
                                                        	<%if("H1".equals(box.getSession("gadmin"))){%>
																<kocca_select:select name="s_grcode" onChange="fnChangeGrcode();" sqlNum="course.0001" selectedValue="<%= ss_grcode %>" isLoad="true" all="false" />
																<%if(ss_gyear.equals("")){%>
																	<script>$(document).ready(function(){setTimeout(fnChangeGrcode, 300);});</script>
																<%}%>
															<%}else{%>
																<kocca:selectBox name="s_grcode" id="s_grcode" optionTitle="-- �����׷� --" type="sqlID" sqlID="selectBox.grcodeList" selectedValue="<%= ss_grcode %>" isLoad="true" />
															<%}%>
                                                        </td>
                                                        <td class="_tdT"><font color="red">��</font>����</td>
                                                        <td class="_tdS">
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
                                                        <td class="_tdT"><font color="red">��</font>��������</td>
                                                        <td class="_tdS" colspan="2">
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
                                                        <td  colspan="5" class="_tdS"> 
                                                            <select name="s_selGubun" class="input_01">
                                                                <option value="1" <% if(ss_selGubun.equals("1")){%> selected <%}%>>������</option>
                                                                <option value="2" <% if(ss_selGubun.equals("2")){%> selected <%}%>>�������</option>
                                                            </select>
                                                            <input name="s_selStart" type="text" class="input_01" size="5" value="<%=ss_selStart%>">����
                                                            <input name="s_selEnd" type="text" class="input_01" size="5"  value="<%=ss_selEnd%>">����&nbsp;
                                                            ����
                                                            <select name="s_selExam" class="input_01">
                                                                <option value="ALL" <% if(ss_selExam.equals("ALL")){%> selected <%}%>>ALL</option>
                                                                <option value="1" <% if(ss_selExam.equals("1")){%> selected <%}%>>����</option>
                                                                <option value="0" <% if(ss_selExam.equals("0")){%> selected <%}%>>������</option>
                                                            </select>&nbsp;
                                                            ����
                                                            <select name="s_selProj" class="input_01">
                                                                <option value="ALL" <% if(ss_selProj.equals("ALL")){%> selected <%}%>>ALL</option>
                                                                <option value="1" <% if(ss_selProj.equals("1")){%> selected <%}%>>����</option>
                                                                <option value="0" <% if(ss_selProj.equals("0")){%> selected <%}%>>������</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="_tdT">��������</td>
                                                        <td class="_tdS"><select name="s_area">
                                                            <option value="T" <% if(ss_area.equals("T")) out.print("selected"); %> >��ü</option>
                                                            <option value="G0" <% if(ss_area.equals("G0")) out.print("selected"); %> >����</option>
                                                            <option value="B0" <% if(ss_area.equals("B0")) out.print("selected"); %> >���</option>
                                                            <option value="K0" <% if(ss_area.equals("K0")) out.print("selected"); %> >����</option>
                                                        </select>
                                                        <td class="_tdT">
                                                            <select name="s_idorname">
                                                                <option value="id" <% if(ss_idorname.equals("id")) out.print("selected"); %> >�����ID</option>
                                                                <option value="name" <% if(ss_idorname.equals("name")) out.print("selected"); %> >����ڸ�</option>
                                                            </select>
                                                        </td>
                                                        <td class="_tdS">
                                                            <input name="s_idornameinput" type="text" class="input_01" size="20" value="<%=ss_idornameinput%>">
                                                        </td>
                                                        <td class="_tdT">������</td>
                                                        <td class="_tdS">
                                                            <select name="s_biyong">
                                                                <option value="T" <% if(ss_biyong.equals("T")) out.print("selected"); %> >��ü</option>
                                                                <option value="Z" <% if(ss_biyong.equals("Z")) out.print("selected"); %> >����</option>
                                                                <option value="P" <% if(ss_biyong.equals("P")) out.print("selected"); %> >����</option>
                                                            </select>
                                                        </td>
                                                        <td align="right" ><%@ include file="/learn/admin/include/za_GoButton.jsp" %></td>
                                                    </tr>
                                                </table>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="5"></td>
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
                    <!--td align="right" width="65">
                    <a href="javascript:whenAllSelect()"><img src="/images/admin/button/select1_butt.gif"  border="0"></a>
                    </td>
                    <td width=4></td>
                    <td align="right" width="65">
                    <a href="javascript:whenAllSelectCancel()"><img src="/images/admin/button/select_cancel1_butt.gif"  border="0"></a>
                    </td>
                    <td width=4></td-->
                    <td align="right" height="20">&nbsp;
                    <!--a href="javascript:whenFormMail()"><img src="/images/admin/button/btn_dogmail.gif"  border="0"></a-->
                    </td>
                    <td width="4"></td>
                    <td align="right" width="65">
                    <a href="javascript:whenSMS()"><img src="/images/admin/button/btn_sms.gif" border="0"></a>
                    </td>
                    <td width=4></td>
                    <td align="right" width="65">
                    <a href="javascript:whenFreeMail()"><img src="/images/admin/button/btn_mail.gif"  border="0"></a>
                    </td>
                    <td width=4></td>
                    <td align="right" width="65">
                    <a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif"  border="0"></a>
                    </td>
                </tr>
                <tr>
                    <td height="3"></td>
                </tr>
            </table>
            <!----------------- ��������, ���Ϲ߼�, �������, ��μ���, ��μ������  ��ư �� ----------------->
            <!----------------- ������ �н���Ȳ ���� ----------------->
            <table cellspacing="1" cellpadding="5" class="table_out">
                <tr>
                    <td colspan="27" class="table_top_line"></td>
                </tr>
                <tr>
                    <td  class="table_title" width="3%" >N0</td>
                    <td  class="table_title" colspan="2">������</td>
                    <td  class="table_title">ȸ������</td>
                    <td  class="table_title">ID</td>
                    <td  class="table_title">����</td>
                    <td  class="table_title">����<br>����</td>
                    <td  class="table_title">������<br>(����)</td>
                    <td  class="table_title">�߰���<br>(����)</td>
                    <td  class="table_title">������<br>(����)</td>
                    <td  class="table_title">������<br>(����)</td>
                    <td  class="table_title">����Ʈ<br>(����)</td>
                    <td  class="table_title">������<br>(����)</td>
                    <td  class="table_title">��Ÿ<br>(����)</td>
                    <td  class="table_title">����</td>
                    <td  class="table_title">����<br>Ƚ��</td>
                    <td  class="table_title">�н�<br>�ð�(��)</td>
                    <td  class="table_title">1ȸ<br>�н��ð�<br>(��)</td>
                    <td  class="table_title">SMS</td>
                    <td  class="table_title">E-mail</td>
                    <td  class="table_title">���</td>
                    <td  class="table_title">�������<br>����</td>
                    <td  class="table_title">�򰡹�����<br>����</td>
                    <td  class="table_title">����������<br>����</td>
                    <td  class="table_title">����<br>������<br>����</td>
                    <td  class="table_title">����<br>����</td>
                    <td  class="table_title"><%@ include file="/learn/admin/include/za_checkboxall.jsp" %></td>
                </tr>
<%
    int v_avg_edutotmin   = 0;
    int v_avg_lessoncount = 0;
    int v_avg_eduavgmin   = 0;
    int v_totsulcnt  = 0;
    int v_repsulcnt  = 0;
    int v_totexamcnt = 0;
    int v_repexamcnt = 0;
    int v_totprojcnt = 0;
    int v_repprojcnt = 0;
    int v_isretcnt   = 0; // ����Ʈ �ݷ�����
    int v_smsnum     = 0; // sms�߼ۼ�
    int v_mailnum    = 0; // mail�߼ۼ�
    int v_counselnum = 0; // ����

    DataBox dbox = null;
    String preCourse = "";          //������°��� - 000000�̸� �Ϲݰ����̰� �ܴ̿� ����������
    int l = 0;

if (ss_action.equals("go")&&(list != null)) {    //go button ���ýø� list ���


    //������ �ְ� ��������
    if( list.size() != 0 ){     // �˻��� ������ �ִٸ�

                v_total = list.size();
            for(i = 0; i < v_total; i++) {
                dbox = (DataBox)list.get(i);

                v_subj          = dbox.getString("d_subj");
                v_courseseq     = dbox.getString("d_courseseq");
                v_course        = dbox.getString("d_course");
                v_coursenm    = dbox.getString("d_coursenm");
                v_year          = dbox.getString("d_year");
                v_subjseq       = dbox.getString("d_subjseq");
                v_subjnm        = dbox.getString("d_subjnm");
                v_subjseqgr     = dbox.getString("d_subjseqgr");
                v_userid        = dbox.getString("d_userid");
                v_name          = dbox.getString("d_name");
                v_membergubunnm = dbox.getString("d_membergubunnm");
                v_email         = dbox.getString("d_email");

                v_tstep         = dbox.getDouble("d_tstep");
                v_avtstep       = dbox.getDouble("d_avtstep");
                v_report        = dbox.getDouble("d_report");
                v_avreport      = dbox.getDouble("d_avreport");

                //out.println(v_avreport);

                v_act           = dbox.getDouble("d_act");
                v_avact         = dbox.getDouble("d_avact");
                v_mtest         = dbox.getDouble("d_mtest");
                v_avmtest       = dbox.getDouble("d_avmtest");
                v_ftest         = dbox.getDouble("d_ftest");
                v_avftest       = dbox.getDouble("d_avftest");
                v_htest         = dbox.getDouble("d_htest");
                v_avhtest       = dbox.getDouble("d_avhtest");
                v_etc1          = dbox.getDouble("d_etc1");
                v_avetc1        = dbox.getDouble("d_avetc1");
                v_etc2          = dbox.getDouble("d_etc2");
                v_avetc2        = dbox.getDouble("d_avetc2");
                v_score         = dbox.getDouble("d_score");

                v_point     = dbox.getInt("d_point");
                v_isgraduated   = dbox.getString("d_isgraduated");

                v_smsnum         = dbox.getInt("d_smsnum");
                v_mailnum        = dbox.getInt("d_mailnum");

                /*

                v_firstedu      = dbox.getString("d_firstedu");
                v_lessoncount   = dbox.getInt("d_lessoncount");
                v_totaltime     = dbox.getString("d_totaltime");
                v_totalminute   = dbox.getString("d_totalminute");
                v_ldatestart    = dbox.getString("d_ldatestart");
                v_ldateend      = dbox.getString("d_ldateend");
                v_sdate          = dbox.getString("d_sdate");

                v_totsulcnt      = dbox.getInt("d_totsulcnt");
                v_repsulcnt      = dbox.getInt("d_repsulcnt");
                v_totexamcnt     = dbox.getInt("d_totexamcnt");
                v_repexamcnt     = dbox.getInt("d_repexamcnt");
                v_totprojcnt     = dbox.getInt("d_totprojcnt");
                v_repprojcnt     = dbox.getInt("d_repprojcnt");
                v_samtotal       = dbox.getInt("d_samtotal");
                v_isretcnt       = dbox.getInt("d_isretcnt");
                v_smsnum         = dbox.getInt("d_smsnum");
                v_mailnum        = dbox.getInt("d_mailnum");
                v_counselnum     = dbox.getInt("d_counselnum");
                */
                v_subjcnt    = dbox.getInt("d_subjcnt");            // ������������ �����
                v_isbelongcourse = dbox.getString("d_isbelongcourse");

                /*

                v_firstedu      = FormatDate.getFormatDate(v_firstedu,"yyyy/MM/dd-HH:mm:ss");
                v_ldatestart    = FormatDate.getFormatDate(v_ldatestart,"yyyy/MM/dd-HH:mm:ss");
                v_ldateend      = FormatDate.getFormatDate(v_ldateend,"yyyy/MM/dd-HH:mm:ss");
                // v_sdate         = FormatDate.getFormatDate(v_sdate ,"yyyy/MM/dd HH:mm:ss");
                v_sdate         = FormatDate.getFormatDate(v_sdate ,"yyyy/MM/dd");


                v_edutotmin = Integer.parseInt(v_totaltime)*60 + Integer.parseInt(v_totalminute);

                v_edutotmin = Integer.parseInt(v_totalminute);

                if(v_lessoncount != 0){
                    v_eduavgmin = v_edutotmin/v_lessoncount;
                }
                else{
                    v_eduavgmin = 0;
                }

                if(v_firstedu.length() > 0)  { v_firstedu = v_firstedu.substring(0,16);      }
                if(v_ldatestart.length() > 0){ v_ldatestart=v_ldatestart.substring(0,16);    }
                if(v_ldateend.length() > 0)  { v_ldateend = v_ldateend.substring(0,16);      }
                if(v_totaltime.length() > 0) {
                  v_avg_time += Integer.parseInt(v_totaltime);
                }
                */


%>
                <tr>
<%
            //�����������̶��
            if( v_isbelongcourse.equals("Y")){

                    if(l == v_subjcnt) preCourse = "";

                    if( !preCourse.equals("000000") && !preCourse.equals(v_course) ) {
                        l = 1;
%>

                    <td class="table_01"><%=v_total-i%></td>
                    <td class="table_02_1" rowspan="<%=v_subjcnt%>"><%=v_coursenm%><br><%=StringManager.cutZero(v_courseseq)%>��</td>
                    <td class="table_02_1">
                        <font class="text_color04" >
                        <CENTER><%=v_subjnm%></CENTER></font></td>
                    <td class="table_02_1"><%=v_membergubunnm%></td>
                    <td class="table_02_1"><a href="javascript:whenCounsel('<%=v_userid%>','<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>')" class="e"><%= v_userid %></a></td>
                    <td class="table_02_1"><%= v_name%></td>
                    <td class="table_02_1"><%=StringManager.cutZero(v_subjseqgr)%></td>
                    <td class="table_02_1"><%=v_tstep%>%(<%= v_avtstep %>)</td>
                    <td class="table_02_1"><%=v_mtest%>(<%= v_avmtest %>)</td>
                    <td class="table_02_1"><%=v_ftest%>(<%= v_avftest %>)</td>
                    <td class="table_02_1"><%=v_htest%>(<%= v_avhtest %>)</td>
                    <td class="table_02_1"><%=v_report%>(<%= v_avreport %>)</td>
                    <td class="table_02_1"><%=v_etc1%>(<%= v_avetc1 %>)</td>
                    <td class="table_02_1"><%=v_etc2%>(<%= v_avetc2 %>)</td>
                    <td class="table_02_1"><%=v_score%></td>
                    <td class="table_02_1"><%=v_lessoncount%></td>
                    <td class="table_02_1"><%=v_edutotmin%></td>
                    <td class="table_02_1"><%=v_eduavgmin%></td>
                    <td class="table_02_1"><a href="javascript:smsList('<%=v_userid%>','<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>')" class="e"><%=v_smsnum%></a></td>
                    <td class="table_02_1"><a href="javascript:mailList('<%=v_userid%>','<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>')" class="e"><%=v_mailnum%></a></td>
                    <td class="table_02_1"><a href="javascript:whenCounsel('<%=v_userid%>','<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>')" class="e"><%=v_counselnum%></a></td>
                    <td class="table_02_1"><%=v_sdate%></td>
                    <td class="table_02_1"><%if(v_totexamcnt>0){if((v_totexamcnt-v_repexamcnt) == 0){out.print("�Ϸ�");}else{out.print(v_totexamcnt-v_repexamcnt);;out.print("("+v_totexamcnt+")");}}else{out.println("-");}%></td>
                    <td class="table_02_1"><%if(v_totsulcnt>0){if((v_totsulcnt-v_repsulcnt) == 0){out.print("�Ϸ�");}else{out.print(v_totsulcnt-v_repsulcnt);out.print("("+v_totsulcnt+")");}}else{out.println("-");}%></td>
                    <td class="table_02_1"><%if(v_totprojcnt>0){if((v_totprojcnt-v_repprojcnt+v_isretcnt) == 0){out.print("�Ϸ�");}else{out.print(v_totprojcnt-v_repprojcnt+v_isretcnt);out.print("("+v_totprojcnt+")");if(v_isretcnt > 0){out.println("<font color='red'>�ݷ�</font>");}}}else{out.println("-");}%></td>
                    <td class="table_02_1"><%=v_isgraduated%></td>

                    <td class="table_02_1">
                    <input type="checkbox" name="p_checks" value="<%=v_userid%>,<%=v_subj%>,<%=v_year%>,<%=v_subjseq%>"></td>

<%
                    v_avg_tstep       += v_tstep;
                    v_avg_report      += v_report;
                    v_avg_act         += v_act;
                    v_avg_mtest       += v_mtest;
                    v_avg_ftest       += v_ftest;
                    v_avg_htest       += v_htest;
                    v_avg_etc1        += v_etc1;
                    v_avg_etc2        += v_etc2;
                    v_avg_avtstep     += v_avtstep;
                    v_avg_avreport    += v_avreport;
                    v_avg_avact       += v_avact;
                    v_avg_avmtest     += v_avmtest;
                    v_avg_avftest     += v_avftest;
                    v_avg_avhtest     += v_avhtest;
                    v_avg_avetc1      += v_avetc1;
                    v_avg_avetc2      += v_avetc2;
                    v_avg_score       += v_score;
                    v_avg_edutotmin   += v_edutotmin;
                    v_avg_lessoncount += v_lessoncount;
                    v_avg_eduavgmin   += v_eduavgmin;

                    preCourse = v_course;

                    }else{
                        l++;
%>

                    <td class="table_01"><%=v_total-i%></td>
                    <td class="table_02_1">
                    <font class="text_color04" >
                    <CENTER><%=v_subjnm%></CENTER></font></td>

                    <td class="table_02_1"><%=v_membergubunnm%></td>
                    <td class="table_02_1"><a href="javascript:whenCounsel('<%=v_userid%>','<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>')" class="e"><%= v_userid %></a></td>
                    <td class="table_02_1"><%=v_name %></td>
                    <td class="table_02_1"><%=StringManager.cutZero(v_subjseqgr)%></td>
                    <td class="table_02_1"><%=v_tstep%>%(<%= v_avtstep %>)</td>
                    <td class="table_02_1"><%=v_mtest%>(<%= v_avmtest %>)</td>
                    <td class="table_02_1"><%=v_ftest%>(<%= v_avftest %>)</td>
                    <td class="table_02_1"><%=v_htest%>(<%= v_avhtest %>)</td>
                    <td class="table_02_1"><%=v_report%>(<%= v_avreport %>)</td>
                    <td class="table_02_1"><%=v_etc1%>(<%= v_avetc1 %>)</td>
                    <td class="table_02_1"><%=v_etc2%>(<%= v_avetc2 %>)</td>
                    <td class="table_02_1"><%=v_score%></td>
                    <td class="table_02_1"><%=v_lessoncount%></td>
                    <td class="table_02_1"><%=v_edutotmin%></td>
                    <td class="table_02_1"><%=v_eduavgmin%></td>
                    <td class="table_02_1"><a href="javascript:smsList('<%=v_userid%>','<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>')" class="e"><%=v_smsnum%></a></td>
                    <td class="table_02_1"><a href="javascript:mailList('<%=v_userid%>','<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>')" class="e"><%=v_mailnum%></a></td>
                    <td class="table_02_1"><a href="javascript:whenCounsel('<%=v_userid%>','<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>')" class="e"><%=v_counselnum%></a></td>
                    <td class="table_02_1"><%=v_sdate%></td>
                    <td class="table_02_1"><%if(v_totexamcnt>0){if((v_totexamcnt-v_repexamcnt) == 0){out.print("�Ϸ�");}else{out.print(v_totexamcnt-v_repexamcnt);;out.print("("+v_totexamcnt+")");}}else{out.println("-");}%></td>
                    <td class="table_02_1"><%if(v_totsulcnt>0){if((v_totsulcnt-v_repsulcnt) == 0){out.print("�Ϸ�");}else{out.print(v_totsulcnt-v_repsulcnt);out.print("("+v_totsulcnt+")");}}else{out.println("-");}%></td>
                    <td class="table_02_1"><%if(v_totprojcnt>0){if((v_totprojcnt-v_repprojcnt+v_isretcnt) == 0){out.print("�Ϸ�");}else{out.print(v_totprojcnt-v_repprojcnt+v_isretcnt);out.print("("+v_totprojcnt+")");if(v_isretcnt > 0){out.println("<font color='red'>�ݷ�</font>");}}}else{out.println("-");}%></td>
                    <td class="table_02_1"><%=v_isgraduated%></td>

                    <td class="table_02_1">
                    <input type="checkbox" name="p_checks" value="<%=v_userid%>,<%=v_subj%>,<%=v_year%>,<%=v_subjseq%>"></td>



<%
                    v_avg_tstep       += v_tstep;
                    v_avg_report      += v_report;
                    v_avg_act         += v_act;
                    v_avg_mtest       += v_mtest;
                    v_avg_ftest       += v_ftest;
                    v_avg_htest       += v_htest;
                    v_avg_etc1        += v_etc1;
                    v_avg_etc2        += v_etc2;
                    v_avg_avtstep     += v_avtstep;
                    v_avg_avreport    += v_avreport;
                    v_avg_avact       += v_avact;
                    v_avg_avmtest     += v_avmtest;
                    v_avg_avftest     += v_avftest;
                    v_avg_avhtest     += v_avhtest;
                    v_avg_avetc1      += v_avetc1;
                    v_avg_avetc2      += v_avetc2;
                    v_avg_score       += v_score;
                    v_avg_edutotmin   += v_edutotmin;
                    v_avg_lessoncount += v_lessoncount;
                    v_avg_eduavgmin   += v_eduavgmin;

                    }


            }else{      //������������ �ƴϸ�
%>

                    <td class="table_01"><%=v_total-i%></td>
                    <td class="table_02_1" colspan="2">
                        <font class="text_color04" align="center">
                        <CENTER><%=v_subjnm%></CENTER></font></td>
                    <td class="table_02_1"><%=v_membergubunnm%></td>
                    <td class="table_02_1"><a href="javascript:whenCounsel('<%=v_userid%>','<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>')" class="e"><%= v_userid %></a></td>
                    <td class="table_02_1"><%=v_name %></td>
                    <td class="table_02_1"><%=StringManager.cutZero(v_subjseqgr)%></td>
                    <td class="table_02_1"><%=v_tstep%>%(<%= v_avtstep %>)</td>
                    <td class="table_02_1"><%=v_mtest%>(<%= v_avmtest %>)</td>
                    <td class="table_02_1"><%=v_ftest%>(<%= v_avftest %>)</td>
                    <td class="table_02_1"><%=v_htest%>(<%= v_avhtest %>)</td>
                    <td class="table_02_1"><%=v_report%>(<%= v_avreport %>)</td>
                    <td class="table_02_1"><%=v_etc1%>(<%= v_avetc1 %>)</td>
                    <td class="table_02_1"><%=v_etc2%>(<%= v_avetc2 %>)</td>
                    <td class="table_02_1"><%=v_score%></td>
                    <td class="table_02_1"><%=v_lessoncount%></td>
                    <td class="table_02_1"><%=v_edutotmin%></td>
                    <td class="table_02_1"><%=v_eduavgmin%></td>
                    <td class="table_02_1"><a href="javascript:smsList('<%=v_userid%>','<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>')" class="e"><%=v_smsnum%></a></td>
                    <td class="table_02_1"><a href="javascript:mailList('<%=v_userid%>','<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>')" class="e"><%=v_mailnum%></a></td>
                    <td class="table_02_1"><a href="javascript:whenCounsel('<%=v_userid%>','<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>')" class="e"><%=v_counselnum%></a></td>
                    <td class="table_02_1"><%=v_sdate%></td>
                    <td class="table_02_1"><%if(v_totexamcnt>0){if((v_totexamcnt-v_repexamcnt) == 0){out.print("�Ϸ�");}else{out.print(v_totexamcnt-v_repexamcnt);;out.print("("+v_totexamcnt+")");}}else{out.println("-");}%></td>
                    <td class="table_02_1"><%if(v_totsulcnt>0){if((v_totsulcnt-v_repsulcnt) == 0){out.print("�Ϸ�");}else{out.print(v_totsulcnt-v_repsulcnt);out.print("("+v_totsulcnt+")");}}else{out.println("-");}%></td>
                    <td class="table_02_1"><%if(v_totprojcnt>0){if((v_totprojcnt-v_repprojcnt+v_isretcnt) == 0){out.print("�Ϸ�");}else{out.print(v_totprojcnt-v_repprojcnt+v_isretcnt);out.print("("+v_totprojcnt+")");if(v_isretcnt > 0){out.println("<font color='red'>�ݷ�</font>");}}}else{out.println("-");}%></td>
                    <td class="table_02_1"><%=v_isgraduated%></td>

                    <td class="table_02_1">
                    <input type="checkbox" name="p_checks" value="<%=v_userid%>,<%=v_subj%>,<%=v_year%>,<%=v_subjseq%>"></td>


<%
                    v_avg_tstep       += v_tstep;
                    v_avg_report      += v_report;
                    v_avg_act         += v_act;
                    v_avg_mtest       += v_mtest;
                    v_avg_ftest       += v_ftest;
                    v_avg_htest       += v_htest;
                    v_avg_etc1        += v_etc1;
                    v_avg_etc2        += v_etc2;
                    v_avg_avtstep     += v_avtstep;
                    v_avg_avreport    += v_avreport;
                    v_avg_avact       += v_avact;
                    v_avg_avmtest     += v_avmtest;
                    v_avg_avftest     += v_avftest;
                    v_avg_avhtest     += v_avhtest;
                    v_avg_avetc1      += v_avetc1;
                    v_avg_avetc2      += v_avetc2;
                    v_avg_score       += v_score;
                    v_avg_edutotmin   += v_edutotmin;
                    v_avg_lessoncount += v_lessoncount;
                    v_avg_eduavgmin   += v_eduavgmin;

%>
                </tr>
<%
            }

        }//for


                    DecimalFormat df = new DecimalFormat("###.#");

                    v_avg_tstep     = v_avg_tstep/v_total;
                    v_avg_report    = v_avg_report/v_total;
                    v_avg_act       = v_avg_act/v_total;
                    v_avg_mtest     = v_avg_mtest/v_total;
                    v_avg_ftest     = v_avg_ftest/v_total;
                    v_avg_htest     = v_avg_htest/v_total;
                    v_avg_etc1      = v_avg_etc1/v_total;
                    v_avg_etc2      = v_avg_etc2/v_total;
                    v_avg_avtstep   = v_avg_avtstep/v_total;
                    v_avg_avreport  = v_avg_avreport/v_total;
                    v_avg_avact     = v_avg_avact/v_total;
                    v_avg_avmtest   = v_avg_avmtest/v_total;
                    v_avg_avftest   = v_avg_avftest/v_total;
                    v_avg_avhtest   = v_avg_avhtest/v_total;
                    v_avg_avetc1    = v_avg_avetc1/v_total;
                    v_avg_avetc2    = v_avg_avetc2/v_total;
                    v_avg_score     = v_avg_score/v_total;
                    v_avg_edutotmin   = v_avg_edutotmin/v_total;
                    v_avg_lessoncount = v_avg_lessoncount/v_total;
                    v_avg_eduavgmin   = v_avg_eduavgmin/v_total;
%>
                <tr>
                    <td class="table_02_3"  colspan="7">���</td>
                    <td class="table_02_3"><%=df.format(v_avg_tstep)%>%(<%=df.format(v_avg_avtstep)%>)</td>
                    <td class="table_02_3"><%=df.format(v_avg_mtest)%>(<%=df.format(v_avg_avmtest)%>)</td>
                    <td class="table_02_3"><%=df.format(v_avg_ftest)%>(<%=df.format(v_avg_avftest)%>)</td>
                    <td class="table_02_3"><%=df.format(v_avg_htest)%>(<%=df.format(v_avg_avhtest)%>)</td>
                    <td class="table_02_3"><%=df.format(v_avg_report)%>(<%=df.format(v_avg_avreport)%>)</td>
                    <td class="table_02_3"><%=df.format(v_avg_etc1)%>(<%=df.format(v_avg_avetc1)%>)</td>
                    <td class="table_02_3"><%=df.format(v_avg_etc2)%>(<%=df.format(v_avg_avetc2)%>)</td>
                    <td class="table_02_3"><%=df.format(v_avg_score)%></td>
                    <td class="table_02_3"><%=v_avg_lessoncount%></td>
                    <td class="table_02_3"><%=v_avg_edutotmin%></td>
                    <td class="table_02_3"><%=v_avg_eduavgmin%></td>
                    <td class="table_02_3">&nbsp;</td>
                    <td class="table_02_3">&nbsp;</td>
                    <td class="table_02_3">&nbsp;</td>
                    <td class="table_02_3">&nbsp;</td>
                    <td class="table_02_3">&nbsp;</td>
                    <td class="table_02_3">&nbsp;</td>
                    <td class="table_02_3">&nbsp;</td>
                    <td class="table_02_3">&nbsp;</td>
                    <td class="table_02_3">&nbsp;</td>
                </tr>

<%
    }else{      //������ ���ٸ�
%>
                <tr>
                    <td align="center" bgcolor="#F7F7F7" height="50" colspan="27">��ϵ� ������ �����ϴ�</td>
                </tr>
<%

    }
}
%>
            </table>
            <!----------------- ������ �н���Ȳ �� ----------------->
            <br>
        </td>
    </tr>
    <tr>
        <td><%@ include file = "/learn/library/getJspName.jsp" %></td>
    </tr>
</table>
</form>
</body>
</html>