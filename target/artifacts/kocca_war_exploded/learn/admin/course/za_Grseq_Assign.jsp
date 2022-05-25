<%
//**********************************************************
//  1. ��	  ��: �������� ����/�ڽ����� ȭ��
//  2. ���α׷���: za_Grseq_Assign.jsp
//  3. ��	  ��: �������� ����/�ڽ����� ȭ��
//  4. ȯ	  ��: JDK 1.4
//  5. ��	  ��: 1.0
//  6. ��	  ��: ���� 2004. 11. 11
//  7. ��	  ��:
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
	RequestBox box = null;
	box = (RequestBox)request.getAttribute("requestbox");
	if (box == null) {
		box = RequestManager.getBox(request);
	}
	String v_grcode = box.getString("p_grcode");
	String v_gyear = box.getString("p_gyear");
	String v_grseq = box.getString("p_grseq");
	String  ss_upperclass = box.getString("s_upperclass");	  //������з�
	String  ss_middleclass = box.getString("s_middleclass");	//�����ߺз�
	String  ss_lowerclass = box.getString("s_lowerclass");	//�����Һз�
	String  s_subjsearchkey = box.getString("s_subjsearchkey");	//�����ߺз�
	String  ss_subjcourse = box.getString("ss_subjcourse");	//�����Һз�
	box.put("s_grcode", v_grcode);

	String  v_orderType	= box.getStringDefault("p_orderType"," asc"); //���ļ���

	GrseqBean grseqbean= new GrseqBean();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script>
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language="JavaScript">
$(document).ready(function(){
	$("#p_startcanceldate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_endcanceldate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_propstart1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_propend1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_edustart1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_eduend1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_sulstartdate1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_sulenddate1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_sulstartdate2").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_sulenddate2").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
<!--

// �������� ���� ����
function whenSubmit(){
	var cnt_chked=0;

	dateChk()
	for(var i=0;i<document.form1.length;i++){
		if(document.form1.elements[i].name=="p_chk" && document.form1.elements[i].checked==true)	cnt_chked++;
	}

	if (cnt_chked==0){
		alert("���õ� ���������� �����ϴ�");
		return;
	}
	document.form1.p_process.value = "assignSave";
	document.form1.submit();
}

	// �������ĺ�ȯ
	function dateChk(){
		ff = document.form1;

		if(ff.p_propstart1.value != null){
			ff.p_propstart.value=make_date(ff.p_propstart1.value)+ff.p_propstart2.options[ff.p_propstart2.selectedIndex].value;
		}
		if(ff.p_propend1.value != null){
			ff.p_propend.value=make_date(ff.p_propend1.value)+ff.p_propend2.options[ff.p_propend2.selectedIndex].value;
		}

		if(ff.p_edustart1.value != null){
			ff.p_edustart.value=make_date(ff.p_edustart1.value)+ff.p_edustart2.options[ff.p_edustart2.selectedIndex].value;
		}
		if(ff.p_eduend1.value != null){
			ff.p_eduend.value=make_date(ff.p_eduend1.value)+ff.p_eduend2.options[ff.p_eduend2.selectedIndex].value;
		}


		return true;
	}

// ����
function whenOrder(column) {
	if (document.form1.p_orderType.value == " asc") {
		document.form1.p_orderType.value = " desc";
	} else {
		document.form1.p_orderType.value = " asc";
	}

	document.form1.p_orderColumn.value = column;
	document.form1.p_process.value = "assignPage";
	document.form1.submit();

}

// select �ڽ� ������ �˻�
function whenSelection(ss_action) {
	document.form1.p_process.value="assignPage";

	document.form1.submit();
}


// ���� �ִ��н��� ����
function whenEdulimit() {

	document.form1.p_process.value="edulimit";
	document.form1.submit();
}

// ���� ����(�޷�)
function whenclick(caldate) {
	caldate.value = "";
}

// ��ü����
function whenAllSelect() {
  if(document.form1.all['p_chk'] == '[object]') {
	if (document.form1.p_chk.length > 0) {
	  for (i=0; i<document.form1.p_chk.length; i++) {
		document.form1.p_chk[i].checked = true;
	  }
	} else {
	  document.form1.p_chk.checked = true;
	}
  }
}

// ��ü�������
function whenAllSelectCancel() {
  if(document.form1.all['p_chk'] == '[object]') {
	if (document.form1.p_chk.length > 0) {
	  for (i=0; i<document.form1.p_chk.length; i++) {
		document.form1.p_chk[i].checked = false;
	  }
	} else {
	  document.form1.p_chk.checked = false;
	}
  }
}



//select box ����
$(function() {
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
//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<form name = "form1" method = "post" action="/servlet/controller.course.GrseqServlet">
	<input type="hidden" name="p_process"   value="assignSave">
	<input type="hidden" name="s_grcode"	value="<%=v_grcode%>">
	<input type="hidden" name="p_grcode"	value="<%=v_grcode%>">
	<input type="hidden" name="p_gyear"	 value="<%=v_gyear%>">
	<input type="hidden" name="p_grseq"	 value="<%=v_grseq%>">

	<input type="hidden" name="p_orderColumn">
	<input type="hidden" name="p_orderType" value="<%=v_orderType%>">


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td align="center" valign="top">
	  <!----------------- title ���� ----------------->
	  <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
		<tr>
		  <td><img src="/images/admin/course/c_title02.gif" ></td>
		  <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
		</tr>
	  </table>
	  <!----------------- title �� ----------------->
		<br>
		<br>

		<!----------------- �����׷�, (��з�, �ߺз�, �Һз�, ����) �˻� ----------------->
		<table class="table_out" cellspacing="1" cellpadding="5">
		  <tr>
			<td colspan="2" class="table_top_line"></td>
		  </tr>
		  <tr>
			<td width="16%" height="25" class="table_title"><b>�����׷�</b></td>
			<td class="table_02_1" width="81%"> <b><%=GetCodenm.get_grcodenm(v_grcode)%></b></td>
		  </tr>
		  <tr>
			<td class="table_title" height="25"><b>��������</b></td>
			<td class="table_02_1"> <b><%=GetCodenm.get_grseqnm(v_grcode, v_gyear, v_grseq)%> (<%=v_gyear%>�� <%=v_grseq%>��)</b></td>
		  </tr>

		  <tr>
			<td colspan=2 align="center" class="table_02_1">
				<table border="0" cellspacing="0" cellpadding="0" width="99%" class="form_table">
				  <tr>
					<td width="100%" colspan="3">
<script type="text/javascript">
var startup = 0;
function Main_subjcourse(){
	if(startup > 1)
		changes_subjcourse('<%=v_grcode %>', document.form1.s_upperclass.value,document.form1. s_middleclass.value, document.form1.s_lowerclass.value, "<%=v_grseq %>",document.form1.s_subjsearchkey.value );
	startup++;
}
</script>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
	<%@ taglib uri="/tags/KoccaTaglib" prefix="kocca" %>	
	
	��з� 
	<kocca:selectBox name="s_upperclass" id="oUpperclass" optionTitle="== ��ü ==" type="sqlID" sqlID="selectBox.subjAttUpperList" selectedValue="<%= ss_upperclass %>" isLoad="true" />
	�ߺз� 
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
	�Һз�
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
					   <td height="5" colspan=3></td>
					</tr>
					<tr>
					  <td align="left" width="28%">

						�����˻�&nbsp;<input type="text" name="s_subjsearchkey" size="17" onkeypress="searchSubjnmKeyEvent(event)" value="<%=box.getString("s_subjsearchkey")%>">
						<a href="javascript:goSearchSubjnm()" ><img src="/images/admin/button/search3_butt.gif" border="0" align="absmiddle"></a>


						<input type="hidden" name="p_returnurlkey" value="<%=request.getRequestURI()%>">
						<script>
						  document.form1.s_subjsearchkey.focus();
						  function searchSubjnmKeyEvent(e){
							if (e.keyCode =='13'){  goSearchSubjnm();  }
						  }
						  function goSearchSubjnm(){
							if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
								alert("�����׷��� �����ϼ���.");
								return;
							}
							document.form1.p_process.value = 'assignPage';
							document.form1.submit();
						  }
						</script>

						<% //@ include file="/incmenu/search_subjnm.jsp" %>



					  </td>
					  <td width="72%">
						&nbsp;&nbsp;
<!-- ���� ������ ����.��ũ��Ʈ ���� -->						
<%--  <kocca_select:select name="s_subjcourse" sqlNum="subjlist1|subjlist2|subjlist3|subjlist4|subjlist5|subjlist6|subjlist7|subjlist8|subjlist9"
				param="<%=v_grcode %>"param4="<%=ss_upperclass%>"param5="<%=ss_middleclass%>"param6="<%=ss_lowerclass%>"
				param7="<%=v_grseq %>" param9="<%= s_subjsearchkey %>"
				onChange="" 
				 attr=" " selectedValue="<%= ss_subjcourse %>" isLoad="true" all='<%= box.getSession("isSubjAll") %>' />
 --%>
<kocca_select:select name="s_upperclass" sqlNum="subjlist1|subjlist2|subjlist3|subjlist4|subjlist5|subjlist6|subjlist7|subjlist8|subjlist9"  
param="<%=v_grcode %>"
				param7="<%=v_grseq %>" param9="<%= s_subjsearchkey %>"
				onChange="changes_subjseq(s_grcode.value, s_grseq.value, s_subjcourse.value, s_gyear.value);"
		attr=" " selectedValue="<%= ss_upperclass %>" isLoad="true" all="true" /> 				 
				 <!-- onChange="changes_subjseq(s_grcode.value, s_grseq.value, s_subjcourse.value, s_gyear.value);" -->
						<!--%= SelectSubjBean.getSubj(box, true, true)%--><!-- getSubj(RequestBox, isChange, isALL)	����  -->
						&nbsp;&nbsp;<%@ include file="/learn/admin/include/za_GoButton.jsp" %></td><!-- whenSelection('go') -->
					  </td>
					</tr>
				</table>
			  </td>
			</tr>
		  </table>
		  <br>
<!--		   
				<table class="table_out" cellspacing="1" cellpadding="5">
				  <tr>
					<td align="center" class="table_02_1" width ="30%">1�� �ִ��н���</td>
					<td class="table_02_2"><input name="p_edulimit" type="text" class="input" size="3" maxlength="3" value="0">
			  %&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:whenEdulimit()"><img src="/images/admin/button/btn_save.gif" align="absmiddle" border="0"></a></td>
				  </tr>
				</table>
		  <br>
-->		  
		   <!----------------- ������û������,������,�н�������,������, ���������� ----------------->
				<table class="table_out" cellspacing="1" cellpadding="5">
		  <tr>
			<td colspan=2 align="center" class="table_02_1">
			   <table border="0" cellspacing="0" cellpadding="0" width="99%" class="form_table">
				  <tr>
					<td colspan="2" align="center" class="table_01">����</td>
					<td class="table_02_2">
						<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
						<kocca_select:select name="p_charger" sqlNum="adminList"  param=" "
						onChange="" attr=" " selectedValue="" isLoad="true" all="false" />
					</td>
					<td colspan="2" align="center" class="table_01">������û��ұⰣ</td>
					<td class="table_02_2">
				<input name="p_startcanceldate" id="p_startcanceldate" type="text" class="datepicker_input1" size="10" value="" onMouseover="if(this.value=='') this.value=p_propstart1.value"> ��
				- <input name="p_endcanceldate" id="p_endcanceldate" type="text" class="datepicker_input1" size="10" value="" onMouseover="if(this.value=='') this.value=p_propend1.value"> ��
<!--					�н������Ϸκ��� <input type="text" name="p_canceldays" value="0" size="5" class="input"> ��-->
					</td>
				  </tr>

				<tr>
					<td colspan="2" align="center" class="table_01">������û�����Ͻ�</td>
					<td class="table_02_2"><input name="p_propstart1" id="p_propstart1" type="text" class="datepicker_input1" size="10" value="">
					  ��&nbsp;&nbsp;
					  <select name="p_propstart2">
						<%=FormatDate.getDateOptions(0,23,0)%>
					  </select>
					  ��&nbsp;
					  <a href="javascript:whenclick(document.form1.p_propstart1)"> <img src="/images/admin/button/btn_del.gif" align="absmiddle" border="0"></a>
					  <input type=hidden name="p_propstart" value="">
					</td>
					<td colspan="2" align="center" class="table_01">������û�����Ͻ�</td>
					<td class="table_02_2"> <input name="p_propend1" id="p_propend1" type="text" class="datepicker_input1" size="10" value="">
					  ��&nbsp;&nbsp;
					  <select name="p_propend2">
						<%=FormatDate.getDateOptions(0,23,23)%>
					  </select>
					  ��&nbsp;
					  <a href="javascript:whenclick(document.form1.p_propend1)"> <img src="/images/admin/button/btn_del.gif" align="absmiddle" border="0"></a>
					  <input type=hidden name="p_propend"  value="">
					</td>
				  </tr>
				  <tr>
					<td colspan="2" align="center" class="table_01">�н� �����Ͻ�</td>
					<td class="table_02_2"><input name="p_edustart1" id="p_edustart1" type="text" class="datepicker_input1" size="10" value="">
					  ��&nbsp;&nbsp;
					  <select name="p_edustart2">
						<%=FormatDate.getDateOptions(0,23,0)%>
					  </select>
					  ��&nbsp;
					  <a href="javascript:whenclick(document.form1.p_edustart1)"> <img src="/images/admin/button/btn_del.gif" align="absmiddle" border="0"></a>
					  <input type=hidden name="p_edustart"  value="">
					</td>
					<td colspan="2" align="center" class="table_01">�н� �����Ͻ�</td>
					<td class="table_02_2"> <input name="p_eduend1" id="p_eduend1" type="text" class="datepicker_input1" size="10" value="">
					  ��&nbsp;&nbsp;
					  <select name="p_eduend2">
						<%=FormatDate.getDateOptions(0,23,23)%>
					  </select>
					  ��&nbsp;
					  <a href="javascript:whenclick(document.form1.p_eduend1)"> <img src="/images/admin/button/btn_del.gif" align="absmiddle" border="0"></a>
					  <input type=hidden name="p_eduend" value="">
					</td>
				  </tr>

				  <tr>
					<td colspan="2" align="center" class="table_01">��������</td>
					<td class="table_02_2">
						<%=grseqbean.selectSulPaper("p_sulpaper1",v_grcode, "",1)%>
						  <br><br>
						  �����Ⱓ : <input type="text" name="p_sulstartdate1" id="p_sulstartdate1" class="datepicker_input1" size="10" value="">
						  ~ <input type="text" name="p_sulenddate1" id="p_sulenddate1" class="datepicker_input1" size="10" value="">
					</td>
					<td colspan="2" align="center" class="table_01">���ļ���</td>
					<td class="table_02_2">
					  <%=grseqbean.selectSulPaper("p_sulpaper2",v_grcode, "",1)%>
					  <br><br>
					  �����Ⱓ : <input type="text" name="p_sulstartdate2" id="p_sulstartdate2" class="datepicker_input1" size="10" value="">
					  ~ <input type="text" name="p_sulenddate2" id="p_sulenddate2" class="datepicker_input1" size="10" value="">
					</td>
				  </tr>

<!--				   <tr>
					<td colspan="2" align="center" class="table_01">����������</td>
					<td class="table_02_2">
						<%=grseqbean.selectSulPaper("p_sulpaper", "",1)%>
					</td>
					<td colspan="2" align="center" class="table_01"></td>
				  </tr> -->

				</table>
						</td>
			</tr>
		  </table>
		<br>

		<table width="97%" border="0" cellspacing="1" cellpadding="5">
		  <tr>
			<td align=right class=dir_txt><!--(������ ������������ ȭ���̿�)<!--></td>
		  </tr>
		</table>

		<table class="table_out" cellspacing="1" cellpadding="5">
		  <tr>
			<td colspan="7" class="table_top_line"></td>
		  </tr>
		  <tr>
			<td width="6%" height="25" class="table_title"><b>NO</b></td>
			<td width="9%" class="table_title"><a href="javascript:whenOrder('ldateyear')" class="e"><b>�����⵵</b></a></td>
			<td width="15%" class="table_title"><a href="javascript:whenOrder('classname')" class="e"><b>�����з�</b></a></td>
			<td class="table_title"><a href="javascript:whenOrder('subjnm')" class="e"><b>������</b></a></td>
			<td class="table_title" width="14%"><a href="javascript:whenOrder('subjcourse')" class="e"><b>�ڵ�</b></a></td>
			<td class="table_title" width="8%">
<script language='javascript'>
function chkeckall(){
	if(document.form1.p_chkeckall.checked){
	  whenAllSelect();
	}
	else{
	  whenAllSelectCancel();
	}
}
</script>
<input type="checkbox" name="p_chkeckall" onClick="javascript:chkeckall()">
</td>
			</td>
		  </tr>
<%
		ArrayList  list = (ArrayList)request.getAttribute("GrseqAssignData");
		DataBox dbox = null;

		for (int i=0; i<list.size(); i++) {
			dbox  = (DataBox)list.get(i);

%>
		<tr>
			<td align="center" bgcolor="#EEEEEE" height="25"><%=i+1%></td>
			<td class="table_02_1" align="center"><b><%=dbox.getString("d_ldateyear")%></b></td>
			<td class="table_02_1" align="center"><b><%=dbox.getString("d_classname")%></b></td>
			<td class="table_02_2"><%=dbox.getString("d_subjcoursenm")%></td>
			<td class="table_02_1" align="center"> <b><%=dbox.getString("d_subjcourse")%></b></td>
			<td class="table_02_1" align="center">
<%
			if (dbox.getInt("d_cnt_using") > 0){
%>			  <%=dbox.getInt("d_cnt_using")%>��
<%		  }else{
%>
				  <input type="checkbox" name="p_chk" value="<%=dbox.getString("d_subjcourse")%>|<%=dbox.getString("d_iscourse")%>">
<%
			}
%>
			</td>
		</tr>
<%
		}
%>
		</table>
		<!----------------- �������� �������� �� ----------------->
		<br>
		<!----------------- ����, ��� ��ư ���� ----------------->
		<table border="0" cellspacing="0" cellpadding="0">
		 <tr onMouseover="if(p_startcanceldate.value=='') p_startcanceldate.value=p_propstart1.value;if(p_endcanceldate.value=='') p_endcanceldate.value=p_propend1.value">
			<td align="center"><a href="javascript:whenSubmit()"><img src="/images/admin/button/btn_save.gif" align="absmiddle"  border="0"></a></td>
			<td width=8></td>
			<td align="center"><a href="javascript:window.close()"><img src="/images/admin/button/btn_close.gif" border="0"></a></td>
		  </tr>
		</table>
		<!----------------- ����, ��� ��ư �� ----------------->

		<br>
	  </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>