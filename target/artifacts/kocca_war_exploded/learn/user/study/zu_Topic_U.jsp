<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
//**********************************************************
//  1. ��      ��: TOPIC UPDATE
//  2. ���α׷���: zu_Topic_U.jsp
//  3. ��      ��: ��й� ���� ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 9. 02
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.contents.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
     //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_user_id   = box.getSession("userid");
    String  v_user_name = box.getSession("name");
    String  v_process   = box.getString("p_process");
    String  v_subj      = box.getString("p_subj");
    String  v_year      = box.getString("p_year");
    String  v_subjseq  = box.getString("p_subjseq");
    String  v_tpcode    = box.getString("p_tpcode");   
    String  v_started   = "";
    String  v_startedtime="";
    String  v_ended     = "";
    String  v_endedtime = "";
    String  v_title     = "";                
    String  v_addate    = "";
    String  v_adcontent = "";
    String  v_name      = "";
    String  v_userid    = "";
    int     v_cnt       =  0;
    int     i           =  0;
    ToronData data     = null;        
	//DEFINED class&variable END         	   

    // editor
    String content      = "";
    String width        = "600";
    String height       = "300";	      
    
      
	data = (ToronData)request.getAttribute("topicSelect");     
	v_started   = data.getStarted(); 
	v_ended     = data.getEnded();      
	v_title     = data.getTitle();      
	v_addate    = data.getAddate();     
	v_adcontent = data.getAdcontent();
	v_userid    = data.getAduserid();
	v_name      = data.getName();  		
	v_cnt       = data.getCnt();  		
    v_addate    = FormatDate.getFormatDate(v_addate,"yyyy.MM.dd"); 
    if(v_started.length() > 0){
        v_startedtime=v_started.substring(8);
        v_started   = v_started.substring(0,8);
    }
    if(v_ended.length() > 0){
        v_endedtime = v_ended.substring(8);
        v_ended     = v_ended.substring(0,8);
    }
    //content     = StringManager.replace(v_adcontent,"\n;","<br>");    
    
	SubjectBean		subjbean = new SubjectBean();
	SubjectData		subjdata = new SubjectData();
					subjdata = subjbean.SelectSubjectData(box);
	
	EduStartBean	bean		= new EduStartBean();
	EduScoreData    scoredata	= new EduScoreData();
					scoredata	= bean.SelectEduScore(box);

%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>��й�</title>
<link rel="stylesheet" type="text/css" href="/css/portal/base.css" />
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script type="text/javascript" src="/script/portal/common.js"></script>
<script type="text/javascript" src="/namo_cross/js/namo_scripteditor.js"></script> 
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script>
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type='text/javascript' src='/script/user_patch.js'></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>

<script	language="JavaScript" type="text/JavaScript">
<!--	   
function whenTopicUpdate() {
    var checkcnt = 0;
    var st_date = make_date(form1.p_sdate.value);
    var ed_date = make_date(form1.p_ldate.value);

    if (blankCheck(document.form1.p_title.value)) {
        alert("��������� �Է��ϼ���!");
        document.form1.p_title.focus();
        return;
    }

    if (realsize(document.form1.p_title.value) > 100) {
        alert("��������� �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
        document.form1.p_title.focus();
        return;
    }

    if(blankCheck(document.form1.p_sdate.value)){
        alert("��� �������� �Է��ϼ���.");
        return;
    }

    if(blankCheck(document.form1.p_ldate.value)){
        alert("��� �������� �Է��ϼ���.");
        return;
    }

    if(st_date > ed_date) {
        alert("��н������� �����Ϻ��� Ů�ϴ�.");
        return;
    }

	//if(!CrossEditor.IsDirty()){ // ũ�ν������� ���� ������ �Է� Ȯ�� 
    //    alert("������ �Է��� �ּ��� !!"); 
    //    CrossEditor.SetFocusEditor();// ũ�ν������� Focus �̵� 
    //    return; 
    //} 

    document.getElementById("p_adcontent").value = CrossEditor.GetBodyValue();
    document.form1.target = "_self";
    document.form1.p_started.value = st_date;
    document.form1.p_ended.value   = ed_date;

    document.form1.action = "/servlet/controller.study.ToronServlet";
    document.form1.p_process.value = "TopicUpdate";
    document.form1.submit();
}

function cancel() {
    history.back(-1);
}
-->		

$(document).ready(function(){
	$("#p_sdate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_ldate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
</script>        
</head>
<body id="pop_study"><!-- popup size : 890* -->
<form name = "form1" method = "post">
    <input type="hidden" name="p_aduserid" value="<%=v_user_id%>"/>
    <input type="hidden" name="p_process"/>
    <input type="hidden" name="p_subj" value="<%=v_subj%>"/>
    <input type="hidden" name="p_year" value="<%=v_year%>"/>
    <input type="hidden" name="p_subjseq" value="<%=v_subjseq%>"/>    
    <input type="hidden" name="p_tpcode" value="<%=v_tpcode%>"/>
    <input type="hidden" name="p_started" value="<%=v_started%>"/>
	<input type="hidden" name="p_ended" value="<%=v_ended%>"/>

	<div id="pop_header">
		<h1><img src="/images/portal/myclass/study/pop_h1_tit11.gif" alt="��й�" /></h1>
	</div>
	<div id="pop_container">
		<div id="contentwrap">
			<div id="con_scoll">
			
<%	if (scoredata != null) { %>
				<div id="btn_close"><a href="javascript:top.window.close()"><img src="/images/portal/btn/btn_close.gif" alt="�ݱ�" /></a></div>
				<div class="study_tltle study_tltle_sub"><div class="study_tltle_left"><div class="study_tltle_right">
					<dl class="class_info"> 
						<dt><span>������</span></dt>
						<dd><%= subjdata.getSubjnm() %></dd>
					</dl>
					<dl class="class_info">
						<dt><span>�����Ⱓ</span></dt>
						<dd class="class_day"><%= FormatDate.getFormatDate(scoredata.getEdustart(),"yyyy.MM.dd") %> ~<%= FormatDate.getFormatDate(scoredata.getEduend(),"yyyy.MM.dd") %></dd>
					</dl>
				</div></div></div>
<%	} %>
				
				<div class="content">
					<h3><img src="/images/portal/myclass/study/pop_stit13.gif" alt="�������" /></h3>
					<table class="study_write">
					<!--[if ie]><colgroup><col width="60px" /><col width="125px" /><col width="50px" /><col width="130px" /><col width="60px" /><col width="360px" /></colgroup><![endif]-->
					<colgroup><col width="60px" /><col width="125px" /><col width="70px" /><col width="130px" /><col width="80px" /><col width="360px" /></colgroup>
					<tr class="bo">
						<th class="th">������</th>
						<td class="td txt"><%= v_name %></td>
						<th class="th">������</th>
						<td class="td stxt ff_t"><%= v_addate %></td>
						<th class="th">��бⰣ</th>
						<td class="td">
                   			<!-- <input name="p_sdate" id="p_sdate" type="text" class="inbox " style="width:65px;" value="<%= FormatDate.getFormatDate(v_started,"yyyy-MM-dd") %>"  OnClick="MiniCalById('p_sdate')" readonly /> <a href="javascript:MiniCalById('p_sdate')"><img src="/images/portal/ico/ico_calendar.gif" class="va_m"/></a> -->
                   			<input name="p_sdate" id="p_sdate" type="text" class="datepicker_input1" style="width:65px;" value="<%= FormatDate.getFormatDate(v_started,"yyyy-MM-dd") %>">
                            <select name="p_stime" style="vertical-align:-2px;">
	                            <option value="01" selected>1��</option>     
	                            <option value="02">2��</option>     
	                            <option value="03">3��</option>     
	                            <option value="04">4��</option>     
	                            <option value="05">5��</option>     
	                            <option value="06">6��</option>     
	                            <option value="07">7��</option>    
	                            <option value="08">8��</option>     
	                            <option value="09">9��</option>     
	                            <option value="10">10��</option>     
	                            <option value="11">11��</option>     
	                            <option value="12">12��</option>     
	                            <option value="13">13��</option>     
	                            <option value="14">14��</option>     
	                            <option value="15">15��</option>     
	                            <option value="16">16��</option>     
	                            <option value="17">17��</option>     
	                            <option value="18">18��</option>     
	                            <option value="19">19��</option>     
	                            <option value="20">20��</option>     
	                            <option value="21">21��</option>     
	                            <option value="22">22��</option>     
	                            <option value="23">23��</option>     
	                            <option value="24">24��</option>                          
                            </select>
                   			~
                    		<!-- <input name="p_ldate" id="p_ldate" type="text" class="inbox " style="width:65px;" value="<%= FormatDate.getFormatDate(v_ended,"yyyy-MM-dd") %>"  OnClick="MiniCalById('p_ldate')" readonly /> <a href="javascript:MiniCalById('p_ldate')"><img src="/images/portal/ico/ico_calendar.gif" class="va_m"/></a> -->
                    		<input name="p_ldate" id="p_ldate" type="text" class="datepicker_input1" style="width:65px;" value="<%= FormatDate.getFormatDate(v_ended,"yyyy-MM-dd") %>">
                            <select name="p_ltime" style="vertical-align:-2px;">
	                            <option value="01" selected>1��</option>     
	                            <option value="02">2��</option>     
	                            <option value="03">3��</option>     
	                            <option value="04">4��</option>     
	                            <option value="05">5��</option>     
	                            <option value="06">6��</option>     
	                            <option value="07">7��</option>    
	                            <option value="08">8��</option>     
	                            <option value="09">9��</option>     
	                            <option value="10">10��</option>     
	                            <option value="11">11��</option>     
	                            <option value="12">12��</option>     
	                            <option value="13">13��</option>     
	                            <option value="14">14��</option>     
	                            <option value="15">15��</option>     
	                            <option value="16">16��</option>     
	                            <option value="17">17��</option>     
	                            <option value="18">18��</option>     
	                            <option value="19">19��</option>     
	                            <option value="20">20��</option>     
	                            <option value="21">21��</option>     
	                            <option value="22">22��</option>     
	                            <option value="23">23��</option>     
	                            <option value="24">24��</option>                          
                            </select>
						</td>
					</tr>
					<tr>
						<th class="th">����</th>
						<td class="td" colspan="5"><input type="text" class="inbox" style="width:590px;" name="p_title" value="<%= StringManager.convertHtmlchars(v_title) %>" /></td>
					</tr>
					<tr>
						<td colspan="6" class="td con">
		                    <textarea id="p_adcontent" name="p_adcontent" style="display:none;"><%=StringManager.replace(v_adcontent, "&", "&amp") %></textarea>
							<script type="text/javascript">
							    var CrossEditor = new NamoSE("contents");
							    var contentValue = document.getElementById("p_adcontent").value; // Hidden �� ����
							    CrossEditor.editorStart();
							    CrossEditor.SetUISize("820","500");
							    CrossEditor.SetBodyValue(contentValue); // ������ ���� ������ ����
							</script>
						</td>
					</tr>
					</table>
					
					<p class="list_btn"><a href="javascript:whenTopicUpdate()" class="btn_gr"><span>���ǳ��� ����</span></a><a href="javascript:cancel()" class="btn_gr"><span>���</span></a></p>
					
					<div id=minical onclick="this.style.display='none';" style=" display:none;position: absolute;"></div>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>