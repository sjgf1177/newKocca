<%
/**
 * file name : za_ExamResult_L.jsp
 * date      : 
 * programmer:
 * function  : �򰡹����� ������ ��ȸ
 */
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.exam.*" %>
<%@ taglib uri="/tags/KoccaTaglib" prefix="kocca" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String  ss_grcode      = box.getStringDefault("s_grcode", "ALL");           //�����׷�
    String  ss_gyear       = box.getStringDefault("s_gyear", "ALL");            //�⵵
    String  ss_grseq       = box.getStringDefault("s_grseq", "ALL");            //��������
  
    String  ss_subjnm      = box.getStringDefault("s_subjnm","");      
    String  ss_upperclass  = box.getStringDefault("s_upperclass", "ALL");
    String  ss_middleclass = box.getStringDefault("s_middleclass","ALL");
    String  ss_lowerclass  = box.getStringDefault("s_lowerclass", "ALL");
    String  ss_subjcourse  = box.getStringDefault("s_subjcourse","ALL");    //����&�ڽ�
    String  ss_subjseq     = box.getStringDefault("s_subjseq","ALL");

    String ss_lesson       = box.getString("s_lesson");        // ������ 
    String ss_examtype     = box.getString("s_examtype");      // �򰡺з�     
    int ss_papernum        = box.getInt("s_papernum");         // ��������ȣ 
    String paperNumStr = String.valueOf(ss_papernum);
    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
    
    ArrayList  list = (ArrayList)request.getAttribute("ExamResultList");
    ExamResultData  data  = null;  
%>
<html>
<head>
<title>������ ��ȸ</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script language="JavaScript">
<!--
function whenSelection2(p_action, p_type) {
  if (p_type == 'selgubun') {
    document.form1.p_seltext.value = 'ALL';
  }
  whenSelection(p_action);
}  

// ��ȸ �˻�
function whenSelection(p_action) {
    v_grcode = document.form1.s_grcode.options[document.form1.s_grcode.selectedIndex].value;
    v_year = document.form1.s_gyear.value;
    v_subj = document.form1.s_subjcourse.value;
    v_subjseq = document.form1.s_subjseq.value;
    v_papernum = document.form1.s_papernum.value;

    if (document.form1.s_grcode.value == '') {
            alert("�����׷��� �����ϼ���.");
            return ;
    }
    if (p_action=="go") {
    
        //if (document.form1.s_grseq.value=="----"){
        //    alert("���������� �����ϼ���");
        //    return;
        //}    
        if (v_year==""){
            alert("������ �����ϼ���");
            return;
        }
        if (v_subj==""){
            alert("������ �����ϼ���");
            return;
        }
        if (v_subjseq==""){
            alert("������ �����ϼ���");
            return;
        }
        if (v_papernum== ""){
            alert("�򰡸� �����ϼ���");
            return;
        }
        top.ftop.setPam();
    }
  document.form1.p_process.value = 'ExamResultListPage';
  document.form1.p_action.value = p_action;
  document.form1.submit();
}

// ��������
function whenExcel() {  
    v_grcode = document.form1.s_grcode.options[document.form1.s_grcode.selectedIndex].value;
    v_year = document.form1.s_gyear.value;
    v_subj = document.form1.s_subjcourse.value;
    v_subjseq = document.form1.s_subjseq.value;
    v_papernum = document.form1.s_papernum.value;

    if (document.form1.s_grcode.value == "") {
            alert("�����׷��� �����ϼ���.");
            return ;
    }
    if (v_year==""){
        alert("������ �����ϼ���");
        return;
    }

    if (v_subj==""){
        alert("������ �����ϼ���");
        return;
    }
    if (v_subjseq==""){
        alert("������ �����ϼ���");
        return;
    }
    if (v_papernum== ""){
        alert("�򰡸� �����ϼ���");
        return;
    }      
    //window.self.name = "ResultListExcel";
    //open_window("openExcel","","100","100","800","600","yes","yes","yes","yes","yes");
    //document.form1.target = "openExcel";             
    document.form1.target = "_self";
    document.form1.p_action.value = "go";
    document.form1.p_process.value = 'ResultListExcel';
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

// ��ä�� ��ũ
function IndividualResult(p_subj, p_year, p_subjseq, p_lesson, p_examtype, p_branch, p_papernum, p_userid, p_subjnm, p_average, p_personcnt) {
  window.self.name = "winIndividualResult";
  farwindow = window.open("", "openIndividualResult", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes, resizable=yes,copyhistory=no, width=800, height=600, top=0, left=0");
  document.form3.target = "openIndividualResult";
  document.form3.action = "/servlet/controller.exam.ExamUserServlet";
  //document.form3.p_process.value = "ExamUserPaperResult";
  document.form3.p_process.value = "ExamUserReRatingSelect";
  
  document.form3.p_subj.value    = p_subj; 
  document.form3.p_gyear.value    = p_year; 
  document.form3.p_subjseq.value = p_subjseq; 
  document.form3.p_lesson.value  = p_lesson; 
  document.form3.p_examtype.value   = p_examtype; 
  document.form3.p_papernum.value= p_papernum; 
  document.form3.p_userid.value  = p_userid;

  document.form3.p_subjnm.value  = p_subjnm; 
  document.form3.p_average.value  = p_average; 
  document.form3.p_personcnt.value  = p_personcnt; 
 
  document.form3.submit();

  farwindow.window.focus();
  document.form3.target = window.self.name;
}


// ������ Ƚ�� ����
function UpdateRetry(p_subj, p_year, p_subjseq, p_lesson, p_examtype, p_branch, p_papernum, p_userid, p_subjnm, p_userretry, p_retry) {
  window.self.name = "winUpdateRetry";
  farwindow = window.open("", "openUpdateRetry", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes, resizable=yes,copyhistory=no, width=520, height=300, top=0, left=0");
  document.form3.target = "openUpdateRetry";
  document.form3.action = "/servlet/controller.exam.ExamUserServlet";
  document.form3.p_process.value = "ExamUserRetrySetPage";
  
  document.form3.p_subj.value    = p_subj; 
  document.form3.p_gyear.value    = p_year; 
  document.form3.p_subjseq.value = p_subjseq; 
  document.form3.p_lesson.value  = p_lesson; 
  document.form3.p_examtype.value   = p_examtype; 
  document.form3.p_papernum.value= p_papernum; 
  document.form3.p_userid.value  = p_userid;

  document.form3.p_subjnm.value   = p_subjnm; 
  document.form3.p_userretry.value= p_userretry; 
  document.form3.p_retry.value    = p_retry; 
 
  document.form3.submit();

  farwindow.window.focus();
  document.form3.target = window.self.name;
}


    
// ȭ�� ���ε�
function ReloadPage(p_action) {
  document.form1.p_process.value = 'ExamResultListPage';
  document.form1.p_action.value  = p_action;
  document.form1.submit();
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
            var param = "type=sqlID&sqlID=selectBox.grSubjList&param=" + grcode;
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
            var grcode = $("#oGrcode").val();
            var gyear = $("#oGyear").val();
            var param = "type=sqlID&sqlID=selectBox.subjSeqList2&param=" + grcode + "," + gyear + "," + $(this).val();
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
        });
        $("#oSubjseq").bind("change", function(){
            var grcode = $("#oGrcode").val();
            var gyear = $("#oGyear").val();
            var subjcourse = $("#oSubjcourse").val();
            var param = "type=sqlID&sqlID=selectBox.paperList&param=" + subjcourse + "," + gyear + "," + $(this).val();
            $.ajaxSetup({cache:false});
            $.ajax({
                    type : "get"
                ,   url : "/learn/admin/common/za_GetSelectBoxAjaxResult.jsp"
                ,   dataType : "json"
                ,   data : param
                ,   success : fnSetPaperList
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
        $("#oSubjcourse").append("<option value=\"\">== ��ü ==</option>");
        $("#oSubjseq").append("<option value=\"\">== ��ü ==</option>");

        if ( result.selectBoxList.length > 0 ) {
            $.each( result.selectBoxList, function() {
                $("#oGyear").append("<option value=\"" + this.d_code + "\">" + this.d_codenm + "</option>");
            });

        }
    }
    /**
     * ���������� ���� selectbox ����
     */
    function fnSetSubjList( result ) {
        $("#oSubjcourse").empty();
        $("#oSubjseq").empty();
        $("#oSubjcourse").append("<option value=\"\">== ��ü ==</option>");
        $("#oSubjseq").append("<option value=\"\">== ��ü ==</option>");


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
        $("#oSubjseq").append("<option value=\"\">== ��ü ==</option>");
        
        if ( result.selectBoxList.length > 0 ) {
            $.each( result.selectBoxList, function() {
                $("#oSubjseq").append("<option value=\"" + this.d_code + "\">" + this.d_codenm + "</option>");
            });

        }
    }
    /**
     * ���Ǻ� �� selectbox ����
     */
    function fnSetPaperList( result ) {
        $("#oPapernum").empty();
        $("#oPapernum").append("<option value=\"\">== ���� ==</option>");

        if ( result.selectBoxList.length > 0 ) {
            $.each( result.selectBoxList, function() {
                $("#oPapernum").append("<option value=\"" + this.d_code + "\">" + this.d_codenm + "</option>");
            });

        }
    }

//-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top"> 
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/exam/e_title04.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
      <!----------------- form ���� ----------------->
      <table cellspacing="0" cellpadding="1" class="form_table_out">
      <form name="form1" method="post" action="/servlet/controller.exam.ExamResultServlet">
        <input type="hidden" name="p_process"    value="">
        <input type="hidden" name="p_action"     value="">
        <input type="hidden" name="p_orderColumn">
        <input type="hidden" name="p_orderType" value="<%=v_orderType%>">        
        <tr> 
          <td bgcolor="#C6C6C6" align="center"> 
            <table cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr> 
                <td height="7"></td>
              </tr>
              <tr> 
                <td align="center"> 
				  <table border="0" cellspacing="0" cellpadding="2" width="99%" class="form_table">
					<tr>
					  <td width="35%" align="left" valign="middle">
                         <font color="red">��</font>�����׷�
                         <kocca:selectBox name="s_grcode" id="oGrcode" optionTitle="-- �����׷� --" type="sqlID" sqlID="selectBox.grcodeList" selectedValue="<%= ss_grcode %>" isLoad="true" />
					  </td>
					  <td width="73%" colspan="2">
                         <font color="red">��</font>����
<%
    if ( !ss_gyear.equals("") || !ss_grcode.equals("") ) {
%>
                            <kocca:selectBox name="s_gyear" id="oGyear" optionTitle="== ���� ==" type="sqlID" param="<%= ss_grcode %>" sqlID="selectBox.grYearList" selectedValue="<%= ss_gyear %>" isLoad="true" />
<%
    } else {
%>
                            <kocca:selectBox name="s_gyear" id="oGyear" optionTitle="== ���� ==" type="sqlID" isLoad="false" />
<%
    }
%>

						<!--<font color="red">��</font> <%= SelectEduBean.getGrseq(box, true, false)%><!-- getGrseq(RequestBox, isChange, isALL)   ��������  -->
						<!--input type= "hidden" name="s_grseq" value="0001"-->
						<%//= SelectSubjBean.getUpperClass(box, true, true, true)%><!-- getUpperclass(RequestBox, isChange, isALL, isStatisticalPage)    ������з�  -->
						<%//= SelectSubjBean.getMiddleClass(box, true, true, true)%><!-- getMiddleclass(RequestBox, isChange, isALL, isStatisticalPage)    �����ߺз�  -->
						<%//= SelectSubjBean.getLowerClass(box, true, true, true)%><!-- getLowerclass(RequestBox, isChange, isALL, isStatisticalPage)    �����Һз�  -->
					  </td>
					</tr>
					<tr>
					  <td align="left" colspan="2">
                        <font color="red">��</font>��  ��
<%
    if ( !ss_grcode.equals("") ) {
%>
                        <kocca:selectBox name="s_subjcourse" id="oSubjcourse" optionTitle="-- ���� --" param="<%= ss_grcode%>" type="sqlID" sqlID="selectBox.grSubjList" selectedValue="<%= ss_subjcourse %>" isLoad="true" />
<%
    } else {
%>
                        <kocca:selectBox name="s_subjcourse" id="oSubjcourse" optionTitle="-- ���� --" optionTitleValue="ALL" type="sqlID" isLoad="false" />
<%
    }
%>

                        <%//= SelectSubjBean.getSubj(box, true, false)%><!-- getSubj(RequestBox, isChange, isALL)    ����  -->
				         <font color="red">��</font> ����
<%
    if ( !ss_subjseq.equals("")) {
%>
                           <kocca:selectBox name="s_subjseq" id="oSubjseq" optionTitle="== ��ü ==" optionTitleValue="" type="sqlID" param="<%= ss_grcode + ',' + ss_gyear + ',' + ss_subjcourse %>" sqlID="selectBox.subjSeqList2" selectedValue="<%= ss_subjseq %>" isLoad="true" />
<%
    } else {
%>
                           <select name="s_subjseq" id="oSubjseq">
                             <option value="">== ��ü ==</option>
                           </select>
<%
    }
%>

<%   
        int classdepth = conf.getInt("subj.class.depth");
        SelectSubjBean selectSubj = new SelectSubjBean();                    
%>
                <!--        ������
                        <select name = "s_lesson"  class="inputpsearch"  onChange = "javascript:whenSelection('change')">-->
                        <%//    ArrayList lessonList = selectSubj.getSubjLesson2(box);    %>
                    <!--        <option value='----' <%// if (box.getString("s_lesson").equals("ALL")) out.println(" selected"); %> >==����==</option> -->
                        <%      
                            //for(int k = 0; k < lessonList.size(); k++) {
                            //  DataBox dboxlesson = (DataBox)lessonList.get(k);  
                        %>
                        <!--    <option value = "<%//= dboxlesson.getString("d_lesson")%>" <%// if ((box.getString("s_lesson").equals(dboxlesson.getString("d_lesson")))) out.print("selected"); %>><%//= dboxlesson.getString("d_sdesc")%></option>-->
                        <%//  } %>
                <!--        </select>-->
                          <font color="red">��</font> ��
<%
    if ( !ss_subjseq.equals("") || !ss_subjcourse.equals("----")) {
%>
                           <kocca:selectBox name="s_papernum" id="oPapernum" optionTitle="== ���� ==" optionTitleValue="" type="sqlID" param="<%= ss_subjcourse + ',' + ss_gyear + ',' + ss_subjseq %>" sqlID="selectBox.paperList" selectedValue="<%= paperNumStr %>" isLoad="true" />
<%
    } else {
%>
                           <select name="s_papernum" id="oPapernum">
                             <option value="">== ���� ==</option>
                           </select>
<%
    }
%>
                          <%//= ExamResultBean.getPaperSelect (ss_subjcourse, ss_gyear, ss_subjseq, ss_lesson, "s_papernum", ss_papernum, "")%>
					  </td>
					  <td width="10%" align="right"><%@ include file="/learn/admin/include/za_GoButton.jsp" %></td><!-- whenSelection('go') -->
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
      </form>  
      </table>
      <!----------------- form �� ----------------->
      <br>
      <br>
<%
    Vector  v_average = (Vector)request.getAttribute("ExamResultAverage");     
    if(v_average.size() > 0){
%>
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr> 
          <td colspan="13" class="table_top_line"></td>
        </tr>
        <tr> 
          <td width="10%" class="table_title">������</td>
          <td class="table_title">����</td>
          <td class="table_title">����ڼ�</td>
          <td class="table_title">�����ڼ�</td>
          <td class="table_title">�������ڼ�</td>
          <td class="table_title">��ü���</td>
        </tr>

        <tr> 
          <td class="table_02_1"><%=(String)v_average.get(0)%></td>
          <td class="table_02_1">100��</td>
          <td class="table_02_1"><%=list.size()%></td>
          <td class="table_02_1"><%=(String)v_average.get(1)%></td>
          <td class="table_02_1"><%=list.size()-Integer.parseInt((String)v_average.get(1))%></td>
          <td class="table_02_1"><%=(String)v_average.get(2)%></td>
        </tr>
      </table>
      <br>
      <br>
<%
    }   
%>
<%
    Vector  v_average1 = (Vector)request.getAttribute("ExamResultAverage");     
    int start = 0;
    int end = 10;
    int rate = 0;
    if(v_average1.size() > 0){
%>      
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr> 
          <td colspan="13" class="table_top_line"></td>
        </tr>
        <tr> 
          <td width="10%" class="table_title">��������</td>
          <td colspan="2" class="table_title">�ο�</td>
        </tr>
<%
        for (int i = 5; i < v_average1.size(); i++){
            rate = (Integer.parseInt((String)v_average1.get(i))/Integer.parseInt((String)v_average.get(1))) * 100;

%>
        <tr> 
          <td class="table_02_1" width = "10%"><%=start%>�� ~ <%=end%>��</td>
          <td class="table_02_1" width="10%"><%=(String)v_average1.get(i)%>��</td>
          <td class="table_02_2" align="left"><img src="/images/admin/research/statistics_line.gif" height="14" width="<%=rate*5%>"><%=rate%>%</td>
        </tr>
<%
            if(i==5){
              start += 11;
            }else{
              start += 10; 
            } 
            end += 10;
        }
%>
      </table><br>

<%
    }   
%>     

      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="right" height="20">&nbsp;</td>
            <td align="right">
            <a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif"  border="0"></a>
            </td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>
           
<%
    if(list.size()>0){
%>     
        <!--��ä��-->  
      <table width="97%" cellspacing="0" cellpadding="5" >        
        <tr> 
          <td align=right valign=middle >
          <a href="javascript:IndividualResult('<%=ss_subjcourse%>','<%=ss_gyear%>','<%=ss_subjseq%>','<%=ss_lesson%>','','','<%=ss_papernum%>','','<%=ss_subjnm%>','0','0')" class="b"><img src="/images/admin/button/btn_exrerating.gif" border="0" align=absmiddle></a>
          (����ȸ�� �н��ڵ��� ��ä���˴ϴ�.)
          </td>
        </tr>
      </table>        
<%
    }
%>      
      <!----------------- ������ ��ȸ ���� ----------------->
      <table border=0 cellspacing="1" cellpadding="5" class="table_out">
      <form name="form3" method="post" action="/servlet/controller.exam.ExamUserServlet">
        <input type="hidden" name="p_process"  value="">
        <input type="hidden" name="p_action"   value="">
            <input type="hidden" name="p_subj"     value="">
              <input type="hidden" name="p_gyear"     value="">
              <input type="hidden" name="p_subjseq"  value="">
              <input type="hidden" name="p_lesson"   value="">
              <input type="hidden" name="p_examtype"    value="">
              <input type="hidden" name="p_papernum" value="">
              <input type="hidden" name="p_userid"   value="">
              <input type="hidden" name="p_subjnm"   value="">
              <input type="hidden" name="p_average"   value="">
              <input type="hidden" name="p_personcnt"   value="">
              <input type="hidden" name="p_examtypenm"  value="">
              <input type="hidden" name="p_flag"  value="1">

            <input type="hidden" name="p_userretry"  value="">
            <input type="hidden" name="p_retry"  value="">
            
            </form>  
        <tr> 
          <td colspan="12" class="table_top_line"></td>
        </tr>
        <tr> 
          <td width="6%" class="table_title">NO</td>
          <td class="table_title"><a href="javascript:whenOrder('membergubun')" class="e">ȸ������</a></td>
          <td class="table_title"><a href="javascript:whenOrder('d.userid')" class="e">ID(��ä��)</a></td>
          <td class="table_title"><a href="javascript:whenOrder('d.name')" class="e">����</a></td>
   <!--   <td class="table_title">��������</td>
          <td class="table_title">��������</td>-->   				          
          <td class="table_title"><a href="javascript:whenOrder('c.answer')" class="e">����</a></td>
          <td class="table_title">������</td>  
          <td width="120" class="table_title"><a href="javascript:whenOrder('a.eduend')" class="e">�Ϸ��Ͻ�</a></td>
          <td width="50" class="table_title"><a href="javascript:whenOrder('c.score')" class="e">����</a></td>
          <td width="60" align=center class="table_title"><a href="javascript:whenOrder('c.userretry')" class="e">�����<br>����Ƚ��<br>(������)</a></td>          
        </tr>
                
<%  for (int i=0; i<list.size(); i++) {
        data  = (ExamResultData)list.get(i); %>
        <tr> 
          <td class="table_01"><%=(i+1)%></td>
          <td class="table_02_1"><%=data.getMembergubunnm()%></td>
           <td class="table_02_1">
          <% if (data.getStatus().equals("�Ϸ�")) { 
                    if(v_average.size() > 0){
          %>
          <a href="javascript:IndividualResult('<%=data.getSubj()%>','<%=data.getYear()%>','<%=data.getSubjseq()%>','<%=data.getLesson()%>','<%=data.getExamtype()%>','','<%=data.getPapernum()%>','<%=data.getUserid()%>','<%=data.getSubjnm()%>','<%=(String)v_average.get(2)%>','<%=(String)v_average.get(1)%>')" class="b">
          <%    }  else { %>
          <a href="javascript:IndividualResult('<%=data.getSubj()%>','<%=data.getYear()%>','<%=data.getSubjseq()%>','<%=data.getLesson()%>','<%=data.getExamtype()%>','','<%=data.getPapernum()%>','<%=data.getUserid()%>','<%=data.getSubjnm()%>','0','0')" class="b">
          <% } }%>
          <%=data.getUserid()%>
          <% if (data.getStatus().equals("�Ϸ�")) { %>
          </a>   
          <% } %>
          </td>
          <td class="table_02_1"><%=data.getName()%></td>
   <!--   <td class="table_02_1"><%//=data.getYear()%></td>
          <td class="table_02_1"><%//=StringManager.cutZero(data.getSubjseqgr())%>��</td> -->
          <td class="table_02_1"><%=data.getStatus()%></td>
		  <td class="table_02_1"><%=data.getLesson()%></td>
          <td class="table_02_1"><%=FormatDate.getFormatDate(data.getEnded(),"yyyy/MM/dd HH:mm")%></td>
          <td class="table_02_1"><%=data.getScore()%></td>
          <td class="table_02_1">
          <% if (data.getStatus().equals("�Ϸ�")) { %>
          <a href="javascript:UpdateRetry('<%=data.getSubj()%>','<%=data.getYear()%>','<%=data.getSubjseq()%>','<%=data.getLesson()%>','<%=data.getExamtype()%>','','<%=data.getPapernum()%>','<%=data.getUserid()%>','<%=data.getSubjnm()%>','<%=data.getUserretry()%>','<%=data.getRetrycnt()%>');" class="b">
          <%=data.getUserretry()%>
          </a>
          <%}else{%>
          <%=data.getRetrycnt()%>
          <%}%>
          (<%=data.getRetrycnt()%>)</td>
        </tr>
             
<%  } %>
      </table>
      <!----------------- ������ ��ȸ �� ----------------->
      <br>
    </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
