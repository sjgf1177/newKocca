<%
//**********************************************************
//  1. ��	  ��: SUBJECT INSERT
//  2. ���α׷���: zu_Subject_L.jsp
//  3. ��	  ��: ������û
//  4. ȯ	  ��: JDK 1.3
//  5. ��	  ��: 1.0
//  6. ��	  ��: 2004.01.14
//  7. ��	  ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
	DataBox dbox = (DataBox)request.getAttribute("resultbox");
	List<DataBox> schoolList = (List<DataBox>) dbox.getObject("schoolList");
	List<DataBox> licenseList = (List<DataBox>) dbox.getObject("licenseList");
	List<DataBox> careerList = (List<DataBox>) dbox.getObject("careerList");
	List<DataBox> trainingINFOList = (List<DataBox>) dbox.getObject("trainingINFOList");
	String needinput = dbox.get("d_needinput");
	String[]hp = new String[3];
	int index = 0;
	StringTokenizer st = new StringTokenizer(dbox.get("d_handphone"), "-");
	while(st.hasMoreTokens()) {
		hp[index++] = st.nextToken();
	}

	//String type = box.get("type");
	String v_upperclass = box.get("p_upperclass");
	if (box == null) box = RequestManager.getBox(request);
	int i = 0;
	char[]token = needinput.toCharArray();
    String v_biyong=dbox.get("d_biyong");
    String v_private=dbox.get("d_private_yesno");
    String msg="";
    if(v_biyong.equals("0"))
        msg=dbox.get("d_subjnm") + " ������ ������û �Ͻðڽ��ϱ�?";
    else
        msg=dbox.get("d_subjnm") + " ������ ��ٱ��Ͽ� �����ðڽ��ϱ�?";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>������û</title>
<link rel="stylesheet" type="text/css" href="/css/portal/base.css" />
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script type="text/javascript" src="/script/portal/common.js"></script>
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script>
<script language="JavaScript">
<!--//
	//LIST
	function whenList(){
		document.form1.target = "_self";
		document.form1.action='/servlet/controller.propose.ProposeCourseServlet';
		document.form1.p_process.value = 'SubjectList';
		document.form1.p_rprocess.value = '';
		self.location.href = "/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList";
	}
	
	// ��ü�������� (����ȭ��)
	function whenSubjList() {
	
		document.form1.target = "_self";
		document.form1.p_process.value=document.form1.p_rprocess.value;
		document.form1.action=document.form1.p_actionurl.value;
		//alert(document.form1.p_actionurl.value);
		document.form1.submit();
	}
	
	function whenPropose() {

		if(!confirm("<%=msg%>"))  return;

        var r=$("[name='p_trainingnum']").attr("checked");
        var r1=$("[name='p_yeunsuno']").val();
        var r2=$("[name='p_yeonsunm']").val();

        var r3=$("[name='p_privatetyes']:checked").val();

        if(!r)
        {
            if(r1=="" || r2=="")
            {
                alert("���������ȣ�� �Ҽӱ���û�� �ݵ�� �Է� �Ǿ�� �մϴ�.");
                return;
            }
        }
        
        document.form1.p_process.value = "SubjectEduPropose";
        $("[name='p_privateYn']").val(r3);
        document.form1.target = "_self";
        document.form1.action = "/servlet/controller.propose.ProposeCourseServlet";
        document.form1.submit();
	}
	// ����������ȸ
	function whenSelSubjInfo(subjseq,year) {
		var url = "/servlet/controller.propose.ProposeCourseServlet";
	
		var new_Open = window.open(url,"seqInfo",'scrollbars=yes,width=680,height=600,resizable=no');
		document.form1.target = "seqInfo";
		document.form1.p_process.value = "SeqPreviewPage";
		document.form1.p_subjseq.value = subjseq;
		document.form1.p_year.value = year;
		document.form1.submit();
	}
	function whenCancel() {
		if (confirm('���� ����Ͻðڽ��ϱ�?')) {
			alert('������û�� ����Ͽ����ϴ�.');
			window.close();
		}
	}
	
	//������û
	function whenSubjPropose(subj,year,subjseq, subjnm, billYn) {
		if(!confirm(subjnm+"������ ��ٱ��Ͽ� �����ðڽ��ϱ�?")) {
		 return;
		}
		document.form1.p_process.value = "SubjectEduPropose";
		document.form1.target = "_self";
		document.form1.p_subj.value = subj;
		document.form1.p_year.value = year;
		document.form1.p_subjseq.value = subjseq;
		document.form1.action = "/servlet/controller.propose.ProposeCourseServlet";
		document.form1.submit();
	}
	//������ �̵�
	function go(index) {
		document.form1.p_action.value = "go";
		document.form1.p_pageno.value = index;
		document.form1.submit();
	}
	//������ �̵�
	function goPage(pageNum) {
		document.form1.p_action.value = "go";
		document.form1.p_pageno.value = pageNum;
		document.form1.submit();
	}
	function pagesize(pageSize) {
		document.form1.target = "_self";
		document.form1.p_pageno.value = 1;
		document.form1.p_pagesize.value = pageSize;
		document.form1.submit();
	}
	//����
	function whenSimpleDelete(deleteType, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10) {
		if(!confirm("���� �����Ͻðڽ��ϱ�?")) return;
		$.post("/servlet/controller.common.AjaxServlet"
			, {	  sqlNum:"propose.delete."+deleteType
				, rerurnFunction:"resultSimpleDelete"
				, p_subj:"<%=box.get("p_subj")%>"
				, p_subjseq:"<%=box.get("p_subjseq")%>"
				, p_userid:"<%= box.getSession("userid")%>"
				, param1:param1
				, param2:param2
				, param3:param3
				, param4:param4
				, param5:param5
				, param6:param6
				, param7:param7
				, param8:param8
				, param9:param9
				, param10:param10
			}
			, function(data) {
				if(data.indexOf('true') != -1)
					$('#'+deleteType+param1).remove();
				$("#ajaxDiv").html(data);
			});
	}
	function resultSimpleDelete(data) {
		if (data.result=='true') {
			 alert("�����߽��ϴ�.");
		}
		else alert("������ �����Ͽ����ϴ�.\n"+data.result);
		
	}
	//����
	function whenSimpleSave(saveType, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10) {
		if(saveType=='study') {
			if($('#p_schoolname').val() == '') {
				alert("�б����� �Է��Ͽ� �ֽʽÿ�");
				return;
			}
			if($('#p_place').val() == '') {
				alert("�������� �Է��Ͽ� �ֽʽÿ�");
				return;
			}
			if($('#p_major').val() == '') {
				alert("�а�/������ �Է��Ͽ� �ֽʽÿ�");
				return;
			}
			if($('#p_sstart').val() == '' || $('#p_send').val() == '') {
				alert("���бⰣ�� �Է��Ͽ� �ֽʽÿ�");
				return;
			}
		}
		else if(saveType=='license') {
			if($('#p_licensename').val() == '') {
				alert("�ڰ������� �Է��Ͽ� �ֽʽÿ�");
				return;
			}
			if($('#p_getdate').val() == '') {
				alert("������� �Է��Ͽ� �ֽʽÿ�");
				return;
			}
			if($('#p_publish').val() == '') {
				alert("����ó�� �Է��Ͽ� �ֽʽÿ�");
				return;
			}
		}
		else if(saveType=='workinfo') {
			var jik = $("#p_jikup").val() + $("#p_jikjong").val();
			if(jik=="") {
				alert("���������� �����Ͽ� �ֽʽÿ�");
				return;
			}
			if($('#p_officename').val() == '') {
				alert("ȸ����� �Է��Ͽ� �ֽʽÿ�");
				return;
			}
			if($('#p_workstart').val() == '') {
				alert("�����Ⱓ�� �������� �Է��Ͽ� �ֽʽÿ�");
				return;
			}
			if($("#p_workstatus option:selected").text() == "���" || $("#p_workstatus option:selected").text() == "����") {
				if ($('#p_workend').val() == '') {
					alert("�����Ⱓ �������� �Է��Ͽ� �ֽʽÿ�.");
					return;
				}
			}
            
		}

		$.post("/servlet/controller.common.AjaxServlet"
			, {	  sqlNum:"propose.insert."+saveType
				, rerurnFunction:"resultSimpleSave"
				, p_subj:"<%=box.get("p_subj")%>"
				, p_subjseq:"<%=box.get("p_subjseq")%>"
				, p_userid:"<%= box.getSession("userid")%>"
				, param1:param1
				, param2:param2
				, param3:param3
				, param4:param4
				, param5:param5
				, param6:param6
				, param7:param7
				, param8:param8
				, param9:param9
				, param10:param10
			}
			, function(data) {
				if(data.indexOf('true') != -1)
					 whenSimpleLoad(saveType);
				$("#ajaxDiv").html(data);
				if(saveType=='workinfo') {
					$('#p_officename').val('');
					$('#p_workstart').val('');
					$('#p_workend').val('');
				}
			});
	}
	function resultSimpleSave(data) {
		if (data.result=='true') {
			 alert("����߽��ϴ�.");
		}
		else alert("����� �����Ͽ����ϴ�."+data.result);
		
	}
	//�⼮������ȸ
	function whenSimpleLoad(saveType) {
		$.post("/servlet/controller.common.TagServlet"
				, {	  sqlNum:"propose.select."+saveType,rerurnFunction:"readData"+saveType, type:6
					, p_subj:"<%=box.get("p_subj")%>"
					, p_subjseq:"<%=box.get("p_subjseq")%>"
					, p_userid:"<%= box.getSession("userid")%>"
				}
				, function(data) {
					$("#ajaxDiv").html(data);
				});
	}
	function readDatastudy(data) {
		 $("#schoolList").html( $("#schoolList").html()+
				 "<tr><td>"+data.d_schoolname+"</td><td>"
				 +data.d_statusnm+"</td><td>"
				 +data.d_send+"</td><td>"
				 +data.d_major+"</td><td>"
				 +data.d_place+"</td><td><a href=\"javascript:whenSimpleDelete('study', "
				 +data.d_seq+");\"><img src=\"/images/admin/portal/stat_0.gif\"/></a></td></tr>");
		 $('#p_schoolname').val('');
		 $('#p_place').val('');
		 $('#p_major').val('');
		 $('#p_sstart').val('');
		 $('#p_send').val('');
	}
	function readDatalicense(data) {
		 $("#licenseList").html( $("#licenseList").html()+
				 "<tr><td>"+data.d_licensename+"</td><td>"
				 +data.d_getdate+"</td><td>"
				 +data.d_publish+"</td><td><a href=\"javascript:whenSimpleDelete('license', "
				 +data.d_seq+");\"><img src=\"/images/admin/portal/stat_0.gif\"/></a></td></tr>");
		 $('#p_licensename').val('');
		 $('#p_getdate').val('');
		 $('#p_publish').val('');
	}

	function readDataworkinfo(data) {
		 $("#workinfoList").html( $("#workinfoList").html()+"<tr id='workinfo"+data.d_seq+"'><td>"
				 +data.d_jikup+"</td><td>"
				 +data.d_jikjong+"</td><td>"
				 +data.d_officename+"</td><td>"
				 +data.d_position+"</td><td>"
				 +data.d_workstart+" ~ "
				 +data.d_workend+"</td><td>"
				 +data.d_workstatus+"</td><td><a href=\"javascript:whenSimpleDelete('workinfo', '"+data.d_seq+"');\"><img src=\"/images/admin/portal/stat_0.gif\"/></a></td></tr>");
	}
//-->

$(document).ready(function(){
	$("#p_militarystart").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_militaryend").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_sstart").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_send").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_getdate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_workstart").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_workend").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_jikup").show();
});
</script>
</head>
<body id="popup"><!-- popup size : 730* -->
<!-- ��ũ��Ʈ���� -->
<div id="ajaxDiv"></div>
<div id=minical OnClick="this.style.display='none';" oncontextmenu='return false'
ondragstart='return false' onselectstart='return false'
style="background : buttonface; margin: 5; margin-top: 2;border-top: 1
solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1
solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index: 99">
</div>
<!-- ��ũ��Ʈ�������� -->

<!-- form ���� -->
<form name="form1" action="/servlet/controller.propose.ProposeCourseServlet" method="post">
	<input type="hidden" name="p_upperclass"value="<%=v_upperclass%>"/>
	<input type="hidden" name="p_process"	value="<%=box.get("p_process")%>"/>
	<input type="hidden" name="p_rprocess"	value=""/>
	<input type="hidden" name="p_year"	    value="<%=box.get("p_year")%>"/>
	<input type="hidden" name="p_subj"	    value="<%=box.get("p_subj")%>"/>
	<input type="hidden" name="p_subjseq"	value="<%=box.get("p_subjseq")%>"/>
	<input type="hidden" name="p_chkfirst"	value="<%=dbox.get("d_autoconfirm")%>"/><%// �ڵ����ο��� %>
	<input type="hidden" name="p_subjnm"	value=""/>
	<input type="hidden" name="p_iscourseYn"	value=""/>
    <input type="hidden" name="p_privateYn"	value=""/>
    <input type="hidden" name="p_area"	    value="<%=box.get("p_area")%>"/>
    <input type="hidden" name="p_favoryn"	value="<%=box.get("p_favoryn")%>"/>
	<div id="pop_header">
		<h1><img src="/images/portal/online/pop_h1_tit3.gif" alt="������û" /></h1>
	</div>
	<div id="pop_container">
		<div id="contentwrap">
			<dl class="guide_list">
				<dt><img src="/images/portal/popup/tit_guide.gif" alt="GUIDE" /></dt>
				<dd>����ó(�ڵ���) �� �̸����� ������� �ʼ� �׸��̹Ƿ� ��Ȯ�� �Է��� �ֽʽÿ�</dd>
			</dl>

			<h3 class="pop_tit"><img src="/images/portal/common/stit_applystep.gif" alt="��û����" /></h3>
			<table class="view_bl">
			<colgroup><col width="18%" /><col width="32%" /><col width="18%" /><col width="32%" /></colgroup>
			<tr>
				<th>������</th>
				<td colspan="3" class="end"><strong><%= dbox.get("d_subjnm") %></strong></td>
			</tr>
			<tr>
				<th>�о�</th>
				<td><%= dbox.get("d_classname") %></td>
				<th>����</th>
				<td class="end"><%= dbox.get("d_subjseq") %>��</td>
			</tr>
			<tr>
				<th>��û�ڸ�</th>
				<td>
					<input type="hidden" name="p_name" value="<%=dbox.get("d_name")%>"/>
					<%= dbox.get("d_name") %>
				</td>
				<th>������</th>
				<td class="end">
					<input type="hidden" name="p_biyong" value="<%=dbox.get("d_biyong")%>"/>
					<%= dbox.getCommaInt("d_biyong1") %>��
				</td>
			</tr>
			<tr>
				<th>������û�Ⱓ</th>
				<td><%= dbox.getDate("d_propstart", "-") %> ~ <%= dbox.getDate("d_propend", "-") %></td>
				<th>���������Ⱓ</th>
				<td class="end"><%= dbox.getDate("d_edustart", "-") %> ~ <%= dbox.getDate("d_eduend", "-") %></td>
			</tr>
<% if(i < token.length && token[i++] == '1') { %>
			<tr>
				<th>�޴���ȭ</th>
				<td class="in">
					<input type="hidden" id="p_handphone" name="p_handphone" value="<%= dbox.get("d_handphone") %>" />
					<!-- <input type="text" id="hp1" name="hp1" onchange="$('#p_handphone').val($('#hp1').val() + '-' + $('#hp2').val() + '-' + $('#hp3').val());"
						class="inbox" style="width:38px;" value="<%//= hp[0] == null ? "" : hp[0] %>" />-
					<input type="text" id="hp2" name="hp2" onchange="$('#p_handphone').val($('#hp1').val() + '-' + $('#hp2').val() + '-' + $('#hp3').val());"
						class="inbox" style="width:38px;" value="<%//= hp[1] == null ? "" : hp[1] %>" />-
					<input type="text" id="hp3" name="hp3" onchange="$('#p_handphone').val($('#hp1').val() + '-' + $('#hp2').val() + '-' + $('#hp3').val());"
						class="inbox" style="width:38px;" value="<%//= hp[2] == null ? "" : hp[2] %>" />-->
					<%= hp[0] == null ? "" : hp[0] %>-<%= hp[1] == null ? "" : hp[1] %>-<%= hp[2] == null ? "" : hp[2] %>
				</td>
				<th>�̸���</th>
				<td class="in end"><input type="hidden" id="p_email" name="p_email" class="inbox" style="width:162px;" value="<%= dbox.get("d_email") %>" /><%= dbox.get("d_email") %></td>
			</tr>
			</table>
<% } if(i < token.length && token[i++] == '1') { %>
<script language="javascript">
<!--
	
	function selectMilitary() {
		var s = $(":input:radio[name=p_militarystatus]:checked").val();
		if(!s || s=="") {
			$("#p_militarystart").val('');
			$("#p_militaryend").val('');
			$("#p_militarymemo").val('');
			$("#milliDate").hide();
			$("#milliMemo").hide();
		}
		else if(s.indexOf('1')!=-1) {
			$("#milliDate").show();
			$("#p_militarymemo").val('');
			$("#milliMemo").hide();
		}
		else if(s.indexOf('2')!=-1) {
			$("#p_militarystart").val('');
			$("#p_militaryend").val('');
			$("#p_militarymemo").val('');
			$("#milliDate").hide();
			$("#milliMemo").hide();
		}
		else {
			$("#p_militarystart").val('');
			$("#p_militaryend").val('');
			$("#milliDate").hide();
			$("#milliMemo").show();
		}
	}

	selectMilitary();
	
//-->
</script>
			<h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_army.gif" alt="��������" class="fl_l" /> <span class="ra_txt"><input type="radio" onclick='selectMilitary()' name="p_militarystatus" value="" <%= dbox.get("d_militarystatus").length()==0 ? "checked" : "" %>/><strong>�ش����</strong> (�ش������ ���� ��� üũ���ּ���)</span></h3>
			<table class="write">
			<tr>
				<td class="intxt end">
					<span><kocca_select:select sqlNum="0001" name="p_militarystatus" styleClass="mg_l10" param="0093" onChange="selectMilitary" selectedValue='<%= dbox.get("d_militarystatus") %>' isLoad="true" type="2.2"/></span>
					<span class="mg_l20" id="milliDate">
						�����Ⱓ
							<input name="p_militarystart" id="p_militarystart" type="text" class="inbox" style="width:65px;" value="<%= dbox.get("d_militarystart") %>"/>
							 ~
							<input name="p_militaryend" id="p_militaryend" type="text" class="inbox" style="width:65px;" value="<%= dbox.get("d_militaryend") %>"/>
					</span>
					<span class="mg_l15" id="milliMemo">�������� <input type="text" name="p_militarymemo" id="p_militarymemo" class="inbox" style="width:113px;"  value="<%= dbox.get("d_militarymemo") %>" /></span>
				</td>
			</tr>
			</table>
<%	}if(i < token.length && token[i++] == '1') {	%>
			<h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_curri.gif" alt="��������" class="fl_l" /></h3>
			<table class="write">
			<colgroup><col width="18%" /><col width="32%" /><col width="18%" /><col width="32%" /></colgroup>
			<tr>
				<th>�б���</th>
				<td><input type="text" name="p_schoolname" id="p_schoolname" value="" class="inbox" style="width:162px;" /></td>
				<th>������</th>
				<td class="end"><input type="text" class="inbox" name="p_place"  id="p_place"  style="width:162px;" /></td>
			</tr>
			<tr>
				<th>�а�/����</th>
				<td><input type="text" class="inbox" name="p_major" id="p_major" style="width:162px;" /></td>
				<th>��������</th>
				<td class="end"><span><kocca_select:select sqlNum="0001" name="p_status" styleClass="mg_l10" param="0094"	 selectedValue='<%= dbox.get("d_militarystatus") %>' isLoad="true" type="2.2"/></span></td>
			</tr>
			<tr>
				<th>���бⰣ</th>
				<td colspan="3" class="end">
					<input type="text" name="p_sstart" id="p_sstart" class="inbox" style="width:65px;" value=""/> ~
					<input type="text" name="p_send" id="p_send" class="inbox" style="width:65px;" value=""/>
				</td>
			</tr>
			</table>
			<p class="btn"><a href="javascript:whenSimpleSave('study',
															$('#p_schoolname').val(),
															$('#p_place').val(),
															$(':input:radio[name=p_status]:checked').val(),
															$('#p_major').val(),
															$('#p_sstart').val(),
															$('#p_send').val()	)" class="btn_gr"><span>���</span></a></p>
			<table class="ac_list">
			<colgroup><col width="114px" /><col width="101px" /><col width="147px" /><col /><col width="101px" /></colgroup>
			<thead>
			<tr>
				<th>�б���</th>
				<th>��������</th>
				<th>���бⰣ</th>
				<th>�а�/����</th>
				<th>������</th>
				<th>����</th>
			</tr>
			</thead>
			<tbody id="schoolList">
<%	for(DataBox schoolListBox : schoolList) { %>
			<tr id="study<%= schoolListBox.get("d_seq") %>">
				<td><%= schoolListBox.get("d_schoolname") %></td>
				<td><%= schoolListBox.get("d_statusnm") %></td>
				<td><%= schoolListBox.get("d_sstart") %>~<%= schoolListBox.get("d_send") %></td>
				<td><%= schoolListBox.get("d_major") %></td>
				<td><%= schoolListBox.get("d_place") %></td>
				<td><a href="javascript:whenSimpleDelete('study', '<%= schoolListBox.get("d_seq") %>');"><img src="/images/admin/portal/stat_0.gif"/></a></td>
			</tr>
<%	} %>
			</tbody>
			</table>
<%	}if(i < token.length && token[i++] == '1') {	%>	

			<h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_certificate.gif" alt="�ڰ���" class="fl_l" /></h3>
			<table class="write">
			<colgroup><col width="18%" /><col width="32%" /><col width="18%" /><col width="32%" /></colgroup>
			<tr>
				<th>�ڰ�����</th>
				<td><input type="text" name="p_licensename" id="p_licensename" class="inbox" style="width:162px;" /></td>
				<th>�����</th>
				<td class="end">
				<input type="text" name="p_getdate" id="p_getdate" class="inbox" style="width:65px;" value=""/>
				</td>
			</tr>
			<tr>
				<th>����ó</th>
				<td colspan="3" class="end"><input type="text" name="p_publish" id="p_publish" class="inbox" style="width:162px;" /></td>
			</tr>
			</table>
			<p class="btn"><a href="javascript:whenSimpleSave('license',
																$('#p_licensename').val(),
																$('#p_getdate').val(),
																$('#p_publish').val()	)" class="btn_gr"><span>���</span></a></p>
			<table class="ac_list">
			<colgroup><col width="221px" /><col width="175px" /><col /></colgroup>
			<thead>
			<tr>
				<th>�ڰ�����</th>
				<th>�����</th>
				<th>����ó</th>
				<th>����</th>
			</tr>
			</thead>
			<tbody id="licenseList">
<%	for(DataBox licenseListBox : licenseList) { %>
			<tr id="license<%= licenseListBox.get("d_seq") %>">
				<td><%= licenseListBox.get("d_licensename") %></td>
				<td><%= licenseListBox.get("d_getdate") %></td>
				<td><%= licenseListBox.get("d_publish") %></td>
				<td><a href="javascript:whenSimpleDelete('license', '<%= licenseListBox.get("d_seq") %>');"><img src="/images/admin/portal/stat_0.gif"/></a></td>
			</tr>
<%	} %>
			</tbody>
			</table>
<%	}if(i < token.length && token[i++] == '1') {	%>	

			<h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_trainnum.gif" alt="���������ȣ" class="fl_l" /> 
			<span class="ra_txt">
				<input type="checkbox" name="p_trainingnum" id="p_trainingnum" value="true" <% if(dbox.get("d_yeunsuno").length()==0) out.println("checked='checked')");%>
						 onclick="if(!this.checked) $('#trainTable').fadeIn(500); else $('#trainTable').fadeOut(500);"/>
				<strong>�ش����</strong> (�ش������ ���� ��� üũ���ּ���)
			</span>
			</h3>
			<table class="write" id="trainTable" <% if(dbox.get("d_yeunsuno").length()==0) out.println("style='display:none'");%>>
			<colgroup><col width="18%" /><col width="32%" /><col width="18%" /><col width="32%" /></colgroup>
			<tr>
				<th>���������ȣ</th>
				<td><input type="text" class="inbox" style="width:162px;" onkeyup="getObjectLength(this.name)" onchange="getObjectLength(this.name, 30)" name="p_yeunsuno" id="p_yeunsuno" value="<%=dbox.get("d_yeunsuno")%>"/> <font id="p_yeunsuno_length" FONT-FAMILY="Tahoma" font-size="10px" color="#CB1F02"></font></td>
				<th>�Ҽӱ���û</th>
				<td class="end"><input type="text" name="p_yeonsunm" id="p_yeonsunm" onkeyup="getObjectLength(this.name)" onchange="getObjectLength(this.name, 50)" class="inbox" style="width:65px;" value="<%=dbox.get("d_yeonsunm")%>" /> <font id="p_yeonsunm_length" FONT-FAMILY="Tahoma" font-size="10px" color="#CB1F02"></font></td>
			</tr>
			</table>

<%	}if(i < token.length && token[i++] == '1') {	%>	

			<h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_career.gif" alt="���" class="fl_l" /></h3>
			<table class="write">
			<colgroup><col width="16%" /><col width="38%" /><col width="16%" /><col width="20%" /></colgroup>
			<tr>
				<th>����</th>
				<td >
                    <input type="hidden" name="p_jikGubun" id="p_jikGubun" value="0091">
                    <input type="radio" onclick="$('#p_jikjong').hide();$('#p_jikup').show();$('#p_jikGubun').val('0091');" name="jikGubun" checked/>��ȭ���������&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="jikGubun" onclick="$('#p_jikup').hide();$('#p_jikjong').show();$('#p_jikGubun').val('0092');"/>��ȭ���������&nbsp;&nbsp;

					<%--<input type="radio" onclick="changep_jikup('0091');$('#p_jikjong').hide();$('#p_jikup').show();$('#p_jikGubun').val('0091');" name="jikGubun" checked/>��ȭ���������&nbsp;&nbsp;&nbsp;&nbsp;--%>
					<%--<input type="radio" name="jikGubun" onclick="changep_jikjong('0092');$('#p_jikup').hide();$('#p_jikjong').show();$('#p_jikGubun').val('0092');"/>��ȭ���������&nbsp;&nbsp;--%>
                <th>����</th>
                <td class="end">
					<kocca_select:select sqlNum="0001" name="p_jikup" attr=" style='display:none'" styleClass="mg_l10" param="0091" selectedValue='' isLoad="true" type="1" all="no"/>
					<kocca_select:select sqlNum="0001" name="p_jikjong" attr=" style='display:none'" styleClass="mg_l10" param="0092" selectedValue='' isLoad="true" type="1" all="no"/>
				</td>
			</tr>
			<tr>
				<th>ȸ���</th>
				<td><input type="text" class="inbox" style="width:162px;" name="p_officename" id="p_officename" /></td>
				<th>����/����</th>
				<td class="end"><input type="text" class="inbox" style="width:162px;" name="p_position" id="p_position" /></td>
			</tr>
			<tr>
				<th>�����Ⱓ</th>
				<td>
					 <input type="text" name="p_workstart" id="p_workstart" class="inbox" style="width:65px;" value=""/>
					 ~ <input type="text" name="p_workend" id="p_workend" class="inbox" style="width:65px;" value=""/>
					 </td>
				<th>��������</th>
				<td class="end"><kocca_select:select sqlNum="0001" name="p_workstatus" styleClass="mg_l10" param="0095" selectedValue='' isLoad="true" type="1" all="none"/></td>
			</tr>
			</table>
			<p class="btn"><a href="javascript:whenSimpleSave('workinfo',
																$('#p_jikGubun').val(),
																$('#p_jikup').val(),
																$('#p_officename').val(),
																$('#p_position').val(),
																$('#p_workstart').val(),
																$('#p_workend').val(),
																$('#p_workstatus').val()
																)" class="btn_gr"><span>���</span></a></p>

			<table class="ac_list">
			<colgroup><col width="67px" /><col width="108px" /><col width="135px" /><col /><col width="150px" /><col width="80px" /></colgroup>
			<thead>
			<tr>
				<th>����</th>
				<th>����</th>
				<th>ȸ���</th>
				<th>����/����</th>
				<th>�����Ⱓ</th>
				<th>�������� </th>
				<th>����</th>
			</tr>
			</thead>
			<tbody id="workinfoList">
<%	for(DataBox careerListbox : careerList) { %>
			<tr id="workinfo<%= careerListbox.get("d_seq") %>">
				<td><%= careerListbox.get("d_jikup") %></td>
				<td><%= careerListbox.get("d_jikjong") %></td>
				<td><%= careerListbox.get("d_officename") %></td>
				<td><%= careerListbox.get("d_position") %></td>
				<td><%= careerListbox.get("d_workstart") %>~<%= careerListbox.get("d_workend") %></td>
				<td><%= careerListbox.get("d_workstatus") %></td>
				<td><a href="javascript:whenSimpleDelete('workinfo', '<%= careerListbox.get("d_seq") %>');"><img src="/images/admin/portal/stat_0.gif"/></a></td>
			</tr>
<%	} %>
			</tbody>
			</table>
<%	}if(i < token.length && token[i++] == '1') {	%>	

			<h3 class="pop_tit"><img src="/images/portal/common/stit_resume.gif" alt="�ڱ�Ұ���" /></h3>
			<table class="write">
			<colgroup><col width="18%" /><col /></colgroup>
			<tr>
				<th>���μҰ�</th>
				<td><textarea class="inbox" name="p_intro" id="p_intro" onkeyup="getObjectLength('p_intro')" onchange="getObjectLength('p_intro', 4000)" style="width:80%; height:30px;"><%= dbox.get("d_intro") %></textarea> <font id="p_intro_length" FONT-FAMILY="Tahoma" font-size="10px" color="#CB1F02"></font></td>
			</tr>
			<tr>
				<th>��������</th>
				<td><textarea class="inbox" name="p_motive" id="p_motive" onkeyup="getObjectLength('p_motive')" onchange="getObjectLength('p_motive', 4000)" style="width:80%; height:30px;"><%= dbox.get("d_motive") %></textarea> <font id="p_motive_length" FONT-FAMILY="Tahoma" font-size="10px" color="#CB1F02"></font></td>
			</tr>
			<tr>
				<th>���İ�ȹ</th>
				<td><textarea class="inbox" name="p_vision" id="p_vision" onkeyup="getObjectLength('p_vision')" onchange="getObjectLength('p_vision', 4000)" style="width:80%; height:30px;"><%= dbox.get("d_vision") %></textarea> <font id="p_vision_length" FONT-FAMILY="Tahoma" font-size="10px" color="#CB1F02"></font></td>
			</tr>
			<tr>
				<th>��Ÿ</th>
				<td><textarea class="inbox" name="p_etc" id="p_etc" onkeyup="getObjectLength('p_etc')" onchange="getObjectLength('p_etc', 4000)" style="width:80%; height:30px;"><%= dbox.get("d_etc") %></textarea> <font id="p_etc_length" FONT-FAMILY="Tahoma" font-size="10px" color="#CB1F02"></font></td>
			</tr>
			</table>
<%	}	%>
        <% if(!v_private.equals("Y")) {%>
        <br><br>
        <span style="font-size:12px;">
            <table border="1 solid #d4d9ee" cellpadding="0" cellspacing="0" width="100%" style="background-color:#f4f6fe;border-collapse:separate;">
                <tr>
                    <td style="padding-left:10px;padding-top:10px;padding-right:10px">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td>�������� Ȱ�� ����</td>
                            </tr>
                            <tr>
                                <td height="10px"></td>
                            </tr>
                            <tr>
                                <td>�ų� ��ȹ�����ο��� �ǽ��ϰ� �ִ� ������� �������� ���翡 ���� ����ڷ� ������ �� ������, ��ϵ� �������� �� ����,����,����ó�� Ȱ��ɼ� �ֽ��ϴ�.</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td ><input type="radio" name="p_privatetyes" value="Y"/>�����մϴ�.</td>
                                            <td width="150px"><input type="radio" name="p_privatetyes" value="N"/>�������� �ʽ��ϴ�.</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </span>
        <%}%>
		</div>
	</div>
	<div id="pop_footer">
        <% if(v_biyong.equals("0")) { %>
		    <p class="f_btn"><a href="javascript:whenPropose();" class="btn_red"><span>������û</span></a><a href="javascript:whenCancel();" class="btn_gr"><span>���</span></a></p>
        <% } else {%>
            <p class="f_btn"><a href="javascript:whenPropose();" class="btn_red"><span>��ٱ��ϴ��</span></a><a href="javascript:whenCancel();" class="btn_gr"><span>���</span></a></p>
        <%}%>
	</div>
</form>
</body>
</html>
