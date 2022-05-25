<%@ page contentType = "text/html;charset=MS949" %>
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

	box.put("topmenu","3");
	
	
	String v_area = box.get("p_area");
	String sub_title_img ="";  // �����̹���
	String sub_title_name =""; // ���� �̹��� ����
	/*if (v_area.equals("")) {
		box.put("submenu","1");
	} else if (v_area.equals("B0")) {
		box.put("submenu","2");
	} else if (v_area.equals("G0")) {
		box.put("submenu","3");
	}else if (v_area.equals("K0")) {
		box.put("submenu","4");
	}
	*/
	
	if (v_area.equals("")) {
		box.put("submenu","1");  
		sub_title_img = "/images/2012/sub/page2/title/online.gif";
		sub_title_name ="��ü����";
	} else if (v_area.equals("B0")) {  // ���
		box.put("submenu","2");
		sub_title_img = "/images/2012/sub/page2/title/online_cast.gif";
		sub_title_name ="��ۿ���";
	} else if (v_area.equals("G0")) { // ����
		box.put("submenu","3");
		sub_title_img = "/images/2012/sub/page2/title/online_game.gif";
		sub_title_name ="���Ӱ���";
	}else if (v_area.equals("K0")) { // ��ȭ
		box.put("submenu","4");
		sub_title_img = "/images/2012/sub/page2/title/online_culture.gif";
		sub_title_name ="��ȭ������";
	}
	
	
	String p_specials = box.get("p_specials");
	String p_action = box.get("p_action");
	//String type = box.get("type");
	String v_upperclass = box.get("p_upperclass");
	if (box == null) box = RequestManager.getBox(request);
	int v_pageno = box.getInt("p_pageno");
	if (v_pageno == 0)  v_pageno = 1;
	int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0;
	int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
	int v_pagesize = box.getInt("p_pagesize");
	int	 v_totalrowcount =  0;
	DataBox subjectPreview = (DataBox) request.getAttribute("subjectPreview");
	List<DataBox> subjseqList = (List<DataBox>)request.getAttribute("subjseqList");
	List<DataBox> selectSubjChasiList = (List<DataBox>)request.getAttribute("selectSubjChasiList");
	List<DataBox> selectChkUser = (List<DataBox>)request.getAttribute("selectChkUser");
	List<DataBox> lessonList = (List<DataBox>)request.getAttribute("lessonList");
	List<DataBox> tutorList = (List<DataBox>)request.getAttribute("tutorList");
	//��������
	ArrayList listPre = (ArrayList)request.getAttribute("subjectPre");
	//�ļ�����
	ArrayList listNext = (ArrayList)request.getAttribute("subjectNext");
	boolean isSeq = subjseqList != null && subjseqList.size() != 0;
	String sugang_YN=subjectPreview.getString("d_sugang_YN");
    String grcode=box.getSession("tem_grcode");
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>

<!-- ��ũ��Ʈ���� -->
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

// �����˻� ����ó��
function search_enter(e)  {
	if (e.keyCode =='13'){  subjSearch();  }
}

// �����˻�
/* function subjSearch() {
	if (document.form1.p_lsearchtext.value=="") {
		alert("�˻�� �Է����ּ���");
		return;
	}
	document.form1.action = "/servlet/controller.propose.MainSubjSearchServlet";	//
	document.form1.p_process.value = "SubjSearch";
	document.form1.submit();
} */

function subjSearch() {
	document.form1.p_process.value = "SubjectList";
	document.form1.submit();
}



// �α����
function whenSubjBest(){
	document.form1.target = "_self";
	document.form1.p_process.value= "SubjectListBest";
	document.form1.action= "/servlet/controller.propose.ProposeCourseServlet";
	document.form1.submit();
}



// ��ü�������� (����ȭ��)
//function whenSubjList() {

//	document.form1.p_actionurl.value = "/servlet/controller.study.InterestServlet";
//	var actionurl = document.form1.p_actionurl.value;

//	document.form1.target = "_self";
//	document.form1.p_process.value=document.form1.p_rprocess.value;
//	document.form1.p_process.value="InterestList";
//	if(actionurl != null && actionurl != "") {
//		document.form1.action=document.form1.p_actionurl.value;
//		document.form1.action = "/servlet/controller.study.InterestServlet";
//	}
//	document.form1.submit();
//}

function whenSubjList() {

	var actionurl = document.form1.p_actionurl.value;
    
	document.form1.target = "_self";

     <% if(!grcode.equals("N000001")) { %>
        document.form1.p_upperclass.value =""; //��ü��ȸ
     <%}%>

	document.form1.p_process.value=document.form1.p_rprocess.value;
	if(actionurl != null && actionurl != "")
		   document.form1.action=document.form1.p_actionurl.value;
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

//������û
function whenSubjPropose(subj,year,subjseq, subjnm) {
	if(<%= box.getSession("userid").length()==0 %>) {
		alert("�α����� �ʿ��մϴ�.");
		return;
	}
	if(!confirm(subjnm+"������ ������û�Ͻðڽ��ϱ�?")) {
	 return;
	}
	var new_Open = window.open("","proposeWindow",'scrollbars=yes,width=800,height=600,resizable=no');
	document.form1.p_process.value = "SubjectEduProposePage";
	document.form1.target = "proposeWindow";
	document.form1.p_subj.value = subj;
	document.form1.p_year.value = year;
	document.form1.p_subjseq.value = subjseq;
	document.form1.action = "/servlet/controller.propose.ProposeCourseServlet";
	document.form1.submit();
	document.form1.target = "_self";
}

//��ٱ��� ���
function whenSubjBasket(subj,year,subjseq, subjnm, billYn, price) {

	if(!confirm(subjnm+" ������ ��ٱ��Ͽ� �����ðڽ��ϱ�?")){
	 return;
	}

	document.form1.target = "_self";
	document.form1.p_subj.value = subj;
	document.form1.p_year.value = year;
	document.form1.p_subjseq.value = subjseq;
	document.form1.p_price.value = price;
	document.form1.p_process.value = "InsertBasketSubj";
	document.form1.action = "/servlet/controller.account.AccountManagerServlet";
	document.form1.submit();
}

//��ٱ��� ���(������û)
function whenSubjBasket2(subj,year,subjseq, subjnm, billYn, price) {

	if(!confirm(subjnm+" ������ ������û �Ͻðڽ��ϱ�?")){
	 return;
	}
	document.form1.target = "_self";
	document.form1.p_subj.value = subj;
	document.form1.p_year.value = year;
	document.form1.p_subjseq.value = subjseq;
	document.form1.p_price.value = price;
	document.form1.p_process.value = "InsertBasketSubj";
	document.form1.action = "/servlet/controller.account.AccountManagerServlet";
	document.form1.submit();
}

//������ �򰡺���
function ContentResearchInfo(){
  document.form1.target = "_self";
  document.form1.p_process.value = "ContentResearch";
  document.form1.action="/servlet/controller.propose.ProposeCourseServlet";
  document.form1.submit();
}

//���ǰ��ǽ�
function goPersonHistory(){
  document.form1.target = "_self";
  document.form1.p_process.value = "EducationSubjectPage";
  document.form1.action="/servlet/controller.study.MyClassServlet";
  document.form1.submit();
}

//���Ǹ�������
function whenLectureList(isoutsourcing, conturl){
	window.self.name = "LectureList";
	if(isoutsourcing == "N"){
	 var url = "/servlet/controller.propose.ProposeCourseServlet";
	 var new_Open = window.open(url,"LectureList1",'scrollbars=yes,width=746,height=550,resizable=no');
	 document.form1.target="LectureList1";
	 document.form1.p_process.value="LectureList";
	 document.form1.submit();
	}else{
	  if (conturl == '') {
		alert("���Ǹ��������� �����ϴ�.");
	 }
	 url = conturl;
	 var new_Open = window.open(url,"LectureList1",'scrollbars=yes,width=800,height=600,resizable=no');
	}
}

// ������
function whenPreShow(url, subj, d_wj_classkey) {    
    if (d_wj_classkey != '') {  //�濵��������(�����н���)
        if (<%=grcode.equals("N000031") %>)  {
            // �α�
            prelog_url = "/servlet/controller.propose.ProposeCourseServlet?p_process=insertPreviewLog&p_subj="+subj;
            open_window("openShow","http://samplezone.campus21.co.kr/classpreview.asp?classkey="+d_wj_classkey,"100","100","720","400","","","",true,true);
        }
        return;
     } else {
        // �α�
        prelog_url = "/servlet/controller.propose.ProposeCourseServlet?p_process=insertPreviewLog&p_subj="+subj;
        open_window("openShow",url,"100","100","<%= subjectPreview.get("d_prewidth", "800") %>","<%= subjectPreview.get("d_preheight", "600") %>","","","",true,true);
     }
}


// ������
function studyOpen(url,subj) {
	// �α�
	prelog_url = "/servlet/controller.propose.ProposeCourseServlet?p_process=insertPreviewLog&p_subj="+subj;

	open_window('openApp',url,0,0,800,600,false,false,true,true,true);
}
//���ɹ�ư Ŭ��
function fnInterestInsert(subj,subjnm) {

	if (confirm(subjnm + " ������ ���ɰ������� ����ϽÁٽ��ϱ�?")) {
			$.post("/servlet/controller.common.AjaxServlet"
					, {checkSqlNum:"interest.exist", sqlNum:"interest.insert", p_subj:subj,rerurnFunction:"resultInterest"}
					, function(data) {
						$("#ajaxDiv").html(data);
					});
	}
}
function resultInterest(data) {
	if (data.result=='true') alert("���ɰ������� ����߽��ϴ�."); 
	else alert(data.result);
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
	function whenTutorShow() {
		$('#show').hide();
		$('#hide').show();
		$('#tutorListfalse').show();
	}
	function whenTutorHide() {
		$('#show').show();
		$('#hide').hide();
		$('#tutorListfalse').hide();
	}
	function whenProposeHide() {
		$("#existpropose1").hide();
		$("#existpropose2").hide();
	}
//-->
</script>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->
<!-- form ���� -->
<form name="form1" action="/servlet/controller.propose.ProposeCourseServlet" method="post">
	<!--input type="hidden" name="type"	value="<%//=type%>"/-->
	<input type="hidden" name="p_process"	value="<%=box.get("p_process")%>"/>
	<input type="hidden" name="p_rprocess"	value="<%=box.getStringDefault("p_rprocess", box.get("p_process"))%>"/>
	<input type="hidden" name="p_actionurl" value="<%=box.get("p_actionurl")%>"/>
	<input type="hidden" name="p_year"	value=""/>
	<input type="hidden" name="p_subj"	value="<%=box.get("p_subj")%>"/>
	<input type="hidden" name="p_subjseq"	value="<%=box.get("p_subjseq")%>"/>
	<input type="hidden" name="p_subjnm"	value="<%=box.get("p_subjnm")%>"/>
	<input type="hidden" name="p_upperclass"	value="<%=box.get("p_upperclass")%>"/>
	<input type="hidden" name="p_upperclassnm"	value="<%=box.get("p_upperclassnm")%>"/>
	<input type="hidden" id="s_mclassnm" name="s_mclassnm"	value="<%=box.get("s_mclassnm")%>"/>
	<input type="hidden" name="p_action"	value="<%=p_action%>"/>
	<input type="hidden" name="p_pageno"	value="<%=v_pageno%>"/>
	<input type="hidden" name="p_pagesize"  value="<%=v_pagesize%>"/>
	<%
		String imgurl = subjectPreview.getString("d_introducefilenamenew");
							
		if (imgurl.equals("")) {
			imgurl = "/images/2012/common/not_image.gif";
		} else {
			imgurl = "http://edu.kocca.or.kr/upload/bulletin/"+imgurl;
		}
	%>
	
	<div class="content">
	
		<%
			String full_toggle = "off";
			String sub1_toggle = "off";
			String sub2_toggle = "off";
			String sub3_toggle = "off";
			String sub4_toggle = "off";
			
			if ("C01".equals(v_upperclass))        { sub1_toggle = "on"; //��ȹ �̹���ON
			} else if ("C02".equals(v_upperclass)) { sub2_toggle = "on"; //����				
			} else if ("C03".equals(v_upperclass)) { sub3_toggle = "on"; //����	
			} else if ("C04".equals(v_upperclass)) { sub4_toggle = "on"; //�濵����
			} else { full_toggle = "on"; 				
			}
		%>
			
		<table class="pageinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagetitle"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > �¶��ΰ��� > <u><%=sub_title_name %></u></td>
			</tr>
		</table>
		<div class="concept b01">
			<div><img src="<%=sub_title_img%>" alt="<%=sub_title_name%>"></div>
			
			<ul class="coursesearch">
				<li class="insert"><input type="text" tabindex="121" name="s_subjnm" class="insearch" onkeypress="search_enter(event);" onfocus="this.style.background='#ffffff'" title="�˻��� ������ �Է����ּ���"></li>
				<li class="output"><a href="javascript:subjSearch();" tabindex="122" title="�����˻��� �����մϴ�"><img src="/images/2012/sub/page2/btn_course_search.gif" alt="�����˻�"></a></li>
			</ul>
			<ul class="pagetabB">
				<li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList" tabindex="123" title="��ȹ ������ Ȯ���մϴ�"><img src="/images/2012/sub/page2/tabmenu/total_<%=full_toggle%>.png" alt="��ü"></a></li>
				<li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList&p_upperclass=C01" tabindex="124" title="��ȹ ������ Ȯ���մϴ�"><img src="/images/2012/sub/page2/tabmenu/plan_<%=sub1_toggle%>.png" alt="��ȹ"></a></li>
				<li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList&p_upperclass=C02" tabindex="125" title="���� ������ Ȯ���մϴ�"><img src="/images/2012/sub/page2/tabmenu/making_<%=sub2_toggle%>.png" alt="����"></a></li>
				<li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList&p_upperclass=C03" tabindex="126" title="���� ������ Ȯ���մϴ�"><img src="/images/2012/sub/page2/tabmenu/circulation_<%=sub3_toggle%>.png" alt="����"></a></li>
				<li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList&p_upperclass=C04" tabindex="127" title="�濵���� ������ Ȯ���մϴ�"><img src="/images/2012/sub/page2/tabmenu/operation_<%=sub4_toggle%>.png" alt="�濵����"></a></li>
			</ul>
		</div>
		<div class="onlinecourse">
			<div class="listback"><button type="button" tabindex="128" onclick="javascript:whenSubjList();" class="btn_small_gray" title="�����������">�������</button></div>
			<dl class="skipcontent">
				<dt>���� �ٷΰ���</dt>
				<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip01" tabindex="129" title="������ǥ�� �̵��մϴ�">������ǥ</a></dd>
				<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip02" tabindex="130" title="��������� �̵��մϴ�">��������</a></dd>
				<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip03" tabindex="131" title="��������� �̵��մϴ�">��������</a></dd>
				<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip04" tabindex="132" title="���������� �̵��մϴ�">��������</a></dd>
				<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip05" tabindex="133" title="�����ȳ��� �̵��մϴ�">�����ȳ�</a></dd>
			</dl>
			<br><br>
			<table class="linecolor" cellspacing="0" cellpadding="0" summary="4�� ����">
				<colgroup><col width="25%"><col width="25%"><col width="25%"><col width="*"></colgroup>
				<tr>
					<td class="color1"></td>
					<td class="color2"></td>
					<td class="color3"></td>
					<td class="color4"></td>
				</tr>
			</table>
			<table class="coursedetailheader" cellspacing="0" cellpadding="0" id="skip01" summary="������� ������ǥ�� �˰�, ������û�� �� �� �ֽ��ϴ�">
				<colgroup><col width="60%"><col width="*"></colgroup>
				<tr>
					<th>
						<h1><%= subjectPreview.getString("d_subjnm") %></h1>
						<h4><%= subjectPreview.getHtmlString("d_edumans") %></h4>
						<img src="/images/2012/sub/page2/subject_learning_target.gif" alt="������ǥ�� ���� �˾ƺ����?">
						<h6>
							<%= subjectPreview.getHtmlString("d_intro") %>
						</h6>
					</th>
					<td>
						<img src="<%=imgurl%>" class="courseimage" alt="<%= subjectPreview.getString("d_subjnm") %>">
						<div class="courseoption">
						<%	if (isSeq && "Y".equals(sugang_YN)) { %>
							<a href="javascript:whenSubjPropose(
									'<%=box.get("p_subj")%>',
									'<%=box.get("p_year")%>',
									'<%=box.get("p_subjseq")%>',
									'<%=box.get("p_subjnm")%>');" tabindex="209" title="�� ������ ���� ������û�� �� �� �ֽ��ϴ�"><img src="/images/2012/common/btn_request.gif" alt="������û"></a>
						<% }%>									
							<a href="javascript:whenPreShow('<%= subjectPreview.get("d_preurl")%>','<%= box.get("p_subj")%>', '<%= box.get("p_wj_classkey")%>' )" tabindex="210" title="�� ������ 1���ø� ü���� �� �ֽ��ϴ�"><img src="/images/2012/common/btn_sample.gif" alt="���ð���"></a>
						</div>
					</td>
				</tr>
			</table>
			<table class="learningcontent" cellspacing="0" cellpadding="0" id="skip02" summary="�������뿡 ���� �˾ƺ��ϴ�">
				<colgroup><col width="80"><col width="*"></colgroup>
				<tr>
					<th><img src="/images/2012/sub/page2/subject_learning_content.gif" alt="��������"></th>
					<td>
						<%= subjectPreview.getHtmlString("d_explain") %>
					</td>
				</tr>
			</table>
			<table class="learningcontent" cellspacing="0" cellpadding="0" id="skip03" summary="���ǿ� ��������� �˾ƺ��ϴ�">
				<colgroup><col width="80"><col width="*"></colgroup>
				<tr>
					<th><img src="/images/2012/sub/page2/subject_learning_other.gif" alt="��������"></th>
					<td>
						<%= subjectPreview.getHtmlString("d_memo") %>
					</td>
				</tr>
			</table>
			<img src="/images/2012/sub/page2/subject_course_step.gif" id="skip04" class="subject" alt="��������">
			<div class="coursestepbox">
				<table class="coursestep" cellspacing="0" cellpadding="0" summary="���������� �ȳ��մϴ�">
					<colgroup><col width="50"><col width="*"></colgroup>
					<thead>
						<tr>
							<th>����</th>
							<th>��������</th>
						</tr> 
					</thead>
					<tbody>
					<%	for (DataBox lessonListDataBox : lessonList) {	%>
					
						<tr onmouseover="this.style.borderBottom='1px solid #2979d3'" onmouseout="this.style.borderBottom='0px'">
							<td class="step"><%= lessonListDataBox.get("d_lesson")  %></td>
							<td class="stepname"><%= lessonListDataBox.get("d_sdesc")  %></td>
						</tr>					
										      
					<%	} %>

					</tbody>
				</table>
			</div>
			<img src="/images/2012/sub/page2/subject_course_guide.gif" id="skip05" class="subject" alt="�����ȳ�">
			<%	if (isSeq) { %>
			<div class="courseguidebox">
			<%	for(DataBox subjseqListDataBox : subjseqList) {	%>
				<div class="rable1">
					<img src="/images/2012/sub/page2/subject_course_about.gif" alt="��������">
					<table class="courseguide" cellspacing="0" cellpadding="0" summary="������û�Ⱓ, �����Ⱓ, ����, �������� ���� �˾ƺ��ϴ�">
						<colgroup><col width="120"><col width="130"><col width="120"><col width="*"></colgroup>
						<tr>
							<th>������û ������</th>
							<td><%= subjseqListDataBox.getDate("d_propstart") %></td>
							<th>������û ������</th>
							<td><%= subjseqListDataBox.getDate("d_propend") %></td>
						</tr>
						<tr>
							<th>����������</th>
							<td><%= subjseqListDataBox.getDate("d_edustart") %></td>
							<th>����������</th>
							<td><%= subjseqListDataBox.getDate("d_eduend") %></td>
						</tr>
						<tr>
							<th>��������</th>
							<td>
							<%
								String slimit = "";
								if( subjseqListDataBox.getInt("d_studentlimit") == 0 ) {
									slimit = "���Ѿ���";
								} else {
									slimit = subjseqListDataBox.getCommaInt("d_studentlimit") + " ��";
								}
								%>
								<%= slimit %></td>
							<th>������</th>
							<td>
								<% 
									String biyong = "";
									if( subjseqListDataBox.getInt("d_biyong") == 0 ) {
										biyong = "����";
									} else {
										biyong = subjseqListDataBox.getCommaInt("d_biyong") + " ��";
									}
								%>
								<%= biyong %>
							</td>
						</tr>
						<tr>
							<th>��������</th>
							<td colspan="3">�¶��� ���� � ����� : 02-2161-0077 academy@kocca.kr</td>
						</tr>
					</table>
				</div>
				<div class="rable2">
					<img src="/images/2012/sub/page2/subject_course_clear.gif" alt="��������">
					<table class="courseguide" cellspacing="0" cellpadding="0" summary="������ؿ� ���� �˾ƺ��ϴ�">
						<colgroup><col width="120"><col width="*"></colgroup>
						<tr>
							<th>�������</th>
							<td>����</td>
						</tr>
						<tr>
							<th>����</th>
							<td><%= subjseqListDataBox.get("d_gradscore") %></td>
						</tr>
						<tr>
							<th>������</th>
							<td><%= subjseqListDataBox.get("d_wstep") %>% �̻�</td>
						</tr>
					</table>
				</div>
				<div class="clearL"></div>
				<div class="rable3">
					<img src="/images/2012/sub/page2/subject_course_evaluation.gif" alt="������">
					<table class="courseguide" cellspacing="0" cellpadding="0" summary="�򰡱��ؿ� ���� �˾ƺ��ϴ�">
						<colgroup><col width="117"><col width="117"><col width="117"><col width="117"><col width="117"><col width="117"><col width="118"><col width="118"></colgroup>
						<tr>
							<th>�򰡱���</th>
							<th>������</th>
							<th>�߰���</th>
							<th>������</th>
							<th>������</th>
							<th>����Ʈ</th>
							<th>������</th>
							<th>��Ÿ</th>
						</tr>
						<tr>
							<td class="evaluation">����ġ(%)</td>
							<td class="evaluation"><%= subjseqListDataBox.get("d_wstep") %>%</td>
							<td class="evaluation"><%= subjseqListDataBox.get("d_wmtest") %>%</td>
							<td class="evaluation"><%= subjseqListDataBox.get("d_wmtest") %>%</td>
							<td class="evaluation"><%= subjseqListDataBox.get("d_wftest") %>%</td>
							<td class="evaluation"><%= subjseqListDataBox.get("d_wreport") %>%</td>
							<td class="evaluation"><%= subjseqListDataBox.get("d_wetc1") %>%</td>
							<td class="evaluation"><%= subjseqListDataBox.get("d_wetc2") %>%</td>
						</tr>
					</table>
				</div>
			</div>
			<% }} %>
		</div>
	</div>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
