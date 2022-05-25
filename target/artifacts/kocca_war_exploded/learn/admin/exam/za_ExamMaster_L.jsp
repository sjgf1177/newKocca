<%
/**
 * file name : za_ExamMaster_L.jsp
 * date      : 
 * programmer:
 * function  : �򰡸����� ��ȸ
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
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

    String  ss_grcode    = box.getString("s_grcode");        //�����׷�
    String  ss_upperclass  = box.getStringDefault("s_upperclass", "ALL");
    String  ss_middleclass = box.getStringDefault("s_middleclass","ALL");
//   String  ss_lowerclass  = box.getStringDefault("s_lowerclass", "ALL");
    String  ss_subjcourse  = box.getString("s_subjcourse");    //����&�ڽ�


%>
<html>
<head>
<title>�򰡸�������ȸ</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script language="JavaScript">
<!--

// �� ������  �߰� 
function InsertMasterPage(p_subj) {
	if (document.form1.s_grcode.value == '') {
			alert("�����׷��� �����ϼ���.");
			return ;
	}
    if (document.form1.s_subjcourse.value==""){
            alert("������ �����ϼ���");
            return;
    }
//        window.self.name = "winSelectView";
        farwindow = window.open("", "openWinQuestion", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 1020, height = 667, top=0, left=0");
        document.form1.target = "openWinQuestion";
		document.form1.action = "/servlet/controller.exam.ExamMasterServlet";
		document.form1.p_process.value = "ExamMasterInsertPage";
        document.form1.p_subj.value = p_subj;
		document.form1.submit();

        farwindow.window.focus();
//        document.form1.target = window.self.name;

}

// �� ������ �󼼺���
function UpdateMasterPage(p_subj, p_lesson, p_examtype,p_ingstate) {
	if (document.form1.s_grcode.value == '') {
			alert("�����׷��� �����ϼ���.");
			return ;
	}
    if (document.form1.s_subjcourse.value==""){
            alert("������ �����ϼ���");
            return;
    }
//        window.self.name = "winSelectView";
        farwindow = window.open("", "openWinQuestion", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 1020, height = 667, top=0, left=0");
        document.form1.target = "openWinQuestion";
		document.form1.action = "/servlet/controller.exam.ExamMasterServlet";

    document.form1.p_process.value = 'ExamMasterUpdatePage';
    document.form1.p_subj.value    = p_subj;
    document.form1.p_lesson.value  = p_lesson;
    document.form1.p_examtype.value   = p_examtype;
    document.form1.p_ingstate.value    = p_ingstate;
    document.form1.submit();

        farwindow.window.focus();
//        document.form1.target = window.self.name;
}

// �˻�
function whenSelection(p_action) {
    var v_grcode, v_subj, v_upperclass, v_middleclass, v_lowerclass;

	v_grcode        = document.form1.s_grcode.options[document.form1.s_grcode.selectedIndex].value;
	
    v_subj        = document.form1.s_subjcourse.value;
//    v_upperclass  = document.form1.s_upperclass.value;
//    v_middleclass = document.form1.s_middleclass.value;
//    v_lowerclass  = document.form1.s_lowerclass.value;

    if (p_action=="go") {
        if (document.form1.s_grcode.value == '') {
                alert("�����׷��� �����ϼ���.");
                return ;
        }
        if (v_subj==""){
            alert("������ �����ϼ���");
            return;
        }
        top.ftop.setPam();
    }
    document.form1.p_process.value = 'ExamMasterListPage';
    document.form1.p_action.value  = p_action;
    document.form1.target ="_self";
    document.form1.submit();
        
}
function ReloadPage(p_action) {
  document.form1.p_process.value = 'ExamMasterListPage';
  document.form1.p_action.value  = p_action;
  document.form1.submit();
}
    // select box ����
    $(function() {
        $("#oGrcode").bind("change", function(){
            var param = "type=sqlID&sqlID=selectBox.grSubjList&param=" + $(this).val();
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
    });
    /**
     * ���������� ���� selectbox ����
     */
    function fnSetSubjList( result ) {
        $("#oSubjcourse").empty();
        $("#oSubjcourse").append("<option value=\"\">== ��ü ==</option>");

        if ( result.selectBoxList.length > 0 ) {
            $.each( result.selectBoxList, function() {
                $("#oSubjcourse").append("<option value=\"" + this.d_code + "\">" + this.d_codenm + "</option>");
            });
        }
    }
-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<form name="form1" method="post" action="/servlet/controller.exam.ExamMasterServlet">
    <input type="hidden" name="p_process" value="">
    <input type="hidden" name="p_action"  value="">
    <input type="hidden" name="p_subj"    value="">
    <input type="hidden" name="p_lesson"  value="">
    <input type="hidden" name="p_examtype"   value="">
    <input type="hidden" name="p_ingstate"   value="">
	

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/exam/e_title02.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
      <!----------------- form ���� ----------------->
      <table class="form_table_out" cellspacing="0" cellpadding="1">
        <tr>
          <td align="center">
            <table border="0" class="form_table_bg" cellspacing="0" cellpadding="5px">
              <tr>
                <td width = "10%">
                  <font color="red">��</font>�����׷�</td>
                        <td>
                    <kocca:selectBox name="s_grcode" id="oGrcode" optionTitle="-- �����׷� --" type="sqlID" sqlID="selectBox.grcodeList" selectedValue="<%= ss_grcode %>" isLoad="true" />
                    <%//= SelectSubjBean.getUpperClass(box, true, true, false)%><!-- getUpperclass(RequestBox, isChange, isALL, isStatisticalPage)    ������з�  -->
                	<%//= SelectSubjBean.getMiddleClass(box, true, true, false)%><!-- getMiddleclass(RequestBox, isChange, isALL, isStatisticalPage)    �����ߺз�  -->
				    <%//= SelectSubjBean.getLowerClass(box, true, true, false)%><!-- getLowerclass(RequestBox, isChange, isALL, isStatisticalPage)    �����Һз�  -->
                  </td>
                  <td rowspan="2" align="right">
                    <%@ include file="/learn/admin/include/za_GoButton.jsp" %>
                  </td>
                </tr>
                <tr>
                <td>
                        <font color="red">��</font>��  ��</td>
                        <td>
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
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <!----------------- form �� ----------------->
      <br>
      <br>


      <!----------------- �򰡸����� ��ȸ ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr>
          <td colspan="7" class="table_top_line"></td>
        </tr>
        <tr>
          <td width="6%" class="table_title">NO</td>
          <td class="table_title">������</td>
          <td class="table_title">��Ÿ��</td>
          <td class="table_title">������</td>
          <td class="table_title">�ѹ�����</td>
          <td class="table_title">������</td>
          <td class="table_title">�򰡹���</td>
          <!--td class="table_title">�򰡽��۽ð�</td>
          <td class="table_title">������ð�</td-->
          <!--td class="table_title">����</td-->
        </tr>
<%
         ArrayList blist = (ArrayList)request.getAttribute("ExamMasterList");

    if(blist.size() > 0) {
        for (int i=0; i<blist.size(); i++) {
            DataBox dbox = (DataBox)blist.get(i);   


    
	    if (i==0){
%>
        <tr>
          <td rowspan="<%=String.valueOf(blist.size())%>" class="table_01">1</td>
          <td rowspan="<%=String.valueOf(blist.size())%>" class="table_02_1">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td><%=dbox.getString("d_subjnm")%></td>
                <td align="right" width="42"><a href="javascript:InsertMasterPage('<%=dbox.getString("d_subj")%>')" class="c"><img src="/images/admin/button/b_add.gif" border="0"></a></td>
              </tr>
            </table>
          </td>
<%        }

            if (!dbox.getString("d_lesson").equals("")) { 

			   //long v_start = Long.parseLong(dbox.getString("d_startdt"));
			   //long v_end = Long.parseLong(dbox.getString("d_enddt"));

					 java.util.Date d_now = new java.util.Date();
					 String d_year = String.valueOf(d_now.getYear()+1900);
					 String d_month = String.valueOf(d_now.getMonth()+1);
					 String d_day = String.valueOf(d_now.getDate());
					 String d_hour = String.valueOf(d_now.getHours());
					 String d_minute = String.valueOf(d_now.getMinutes());

					 if(d_month.length() == 1){
							d_month = "0" + d_month; 
					 }
					 if (d_day.length() == 1){
							d_day = "0" + d_day; 				 
					 }
					 if (d_hour.length() == 1){
							d_hour = "0" + d_hour; 				 
					 }
					 if (d_minute.length() == 1){
							d_minute = "0" + d_minute; 				 
					 }
					 long v_now = Long.parseLong(d_year+d_month+d_day+d_hour+d_minute); 

			   String v_ing = "";
			   int v_update = 0;

				/*
			   if (v_start > v_now){
						v_ing = "<font color='red'>������</font>"; 
						v_update = 1;
			   } else if (v_now > v_end){
						v_ing = "����Ϸ�";
						v_update = 3;
			   } else if (v_start <= v_now || v_now < v_end){
						v_ing = "������"; 
						v_update = 2;
			   } 
				*/
				
				v_update = 1;
				%>


          <td class="table_02_1"><%=dbox.getString("d_examtypenm")%></td>
          <td class="table_02_1"><a href="javascript:UpdateMasterPage('<%=dbox.getString("d_subj")%>', '<%=dbox.getString("d_lesson")%>', '<%=dbox.getString("d_examtype")%>','<%=v_update%>')" class="a"><%=dbox.getString("d_lesson")%> ����</a></td>
          <td class="table_02_1"><%=dbox.getInt("d_examcnt")%></td>
          <td class="table_02_1"><%=dbox.getInt("d_totalscore")%></td>
          <td class="table_02_1"><%=dbox.getString("d_lessonstart")%>���� - <%=dbox.getString("d_lessonend")%>����</td>
          <!--td class="table_02_1"><%//=FormatDate.getFormatDate(dbox.getString("d_startdt"),"yyyy/MM/dd HH:mm")%></td>
          <td class="table_02_1"><%//=FormatDate.getFormatDate(dbox.getString("d_enddt"),"yyyy/MM/dd HH:mm")%></td>
          <td class="table_02_1"><%=v_ing%></td-->

<%          } else {  %>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td>
          <!--td class="table_02_1"></td>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td-->
<%          }  %>
        </tr>
<%
	   }		
    } else {

		if (box.getString("p_action").equals("go")) {
%>
        <tr>
          <td class="table_01">1</td>
          <td class="table_02_2">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td><%=GetCodenm.get_subjnm(box.getString("s_subjcourse"))%></td>
                <td align="right" width="42"><a href="javascript:InsertMasterPage('<%=box.getString("s_subjcourse")%>')" class="c"><img src="/images/admin/button/b_add.gif" border="0"></a></td>
              </tr>
            </table>
          </td>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td>
          <!--td class="table_02_1"></td>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td-->
        </tr>
<%
		}
	}
%>
      </table>
      <!----------------- �򰡸����� ��ȸ �� ----------------->
      <br>
    </td>
  </tr>
</table>

</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
