<%
//**********************************************************
//  1. ��	  ��: SUBJECT LIST
//  2. ���α׷���: zu_Subject_L.jsp
//  3. ��	  ��: ������ȸ
//  4. ȯ	  ��: JDK 1.3
//  5. ��	  ��: 1.0
//  6. ��	  ��: 2004.01.14
//  7. ��	  ��:
//***********************************************************/
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import="java.util.*" %>
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
	String p_specials = box.get("p_specials");
	String p_action = box.get("p_action");
	String type = box.get("type");
	if (box == null) box = RequestManager.getBox(request);
	int v_pageno = box.getInt("p_pageno");
	if (v_pageno == 0)  v_pageno = 1;
	int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0;
	int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
	int v_pagesize = box.getInt("p_pagesize");
	int	 v_totalrowcount =  0;
	DataBox subjectPreview = (DataBox) request.getAttribute("subjectPreview");
	List<DataBox> selectChkUser = (List<DataBox>)request.getAttribute("selectChkUser");
	List<DataBox> tutorList = (List<DataBox>)request.getAttribute("tutorList");
	boolean isSeq = true;//���� �����ο��� �������� ����
	
	isSeq = subjectPreview.getString("d_flagyn").equals("Y") ? true : false; // ������û ��ư on/off ����, ��û�ο��� ���� flag ������(����)

     Date date = new Date();
     SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMddHHmm");
     String strdate = simpleDate.format(date).substring(0,10);
     String nflage="";
     if(subjectPreview.getString("d_propend").compareTo(strdate)>0)
        nflage="Y";
     else
        nflage="N";
     box.put("topmenu","4");
     String v_area = box.get("p_area");
 	if (v_area.equals("")) {
 		box.put("submenu","1");
 	} else if (v_area.equals("B0")) {
 		box.put("submenu","1");
 	} else if (v_area.equals("G0")) {
 		box.put("submenu","2");
 	}else if (v_area.equals("K0")) {
 		box.put("submenu","3");
 	}
 	
 	String sub_title_img ="";  // �����̹���
	String sub_title_name =""; // ���� �̹��� ����
	String sub_title_navi =""; // ���� �̹��� ����
	
	 if (type.equals("S01")) {
		box.put("submenu","1");
		sub_title_img = "/images/2012/sub/page3/title/offline_cast.gif";
		sub_title_name = "�������ΰ��� ��ۿ��� �о�";
		sub_title_navi = "��ۿ���";
	} else if (type.equals("S02")) {
		box.put("submenu","2");
		sub_title_img = "/images/2012/sub/page3/title/offline_making.gif";
		sub_title_name = "�������ΰ��� ���Ӱ��� �о�";
		sub_title_navi = "��������";
	} else if (type.equals("S03")) {
		box.put("submenu","3");
		sub_title_img = "/images/2012/sub/page3/title/offline_plan.gif";
		sub_title_name = "�������ΰ��� ��ȹâ�� �о�";
		sub_title_navi = "��ȹâ��";
	} else {
		box.put("submenu","1");
		sub_title_img = "/images/2012/sub/page3/title/offline_cast.gif";
		sub_title_name = "�������ΰ��� ��ۿ��� �о�";
		sub_title_navi = "��ü";
	}
	
	
	String full_toggle = "off";
	String sub1_toggle = "off";
	String sub2_toggle = "off";
	String sub3_toggle = "off";
	String sub4_toggle = "off";
	
	if ("001".equals(v_area))        { sub2_toggle = "on"; 
	} else if ("002".equals(v_area)) { sub3_toggle = "on"; 				
	} else if ("003".equals(v_area)) { sub4_toggle = "on"; 	
	} else if ("004".equals(v_area)) { sub1_toggle = "on"; 
	} else { full_toggle = "on"; 				
	}
	
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>

<!-- ��ũ��Ʈ���� -->
<script language="JavaScript">
<!--//
//LIST
function whenList(){
	document.form1.target = "_self";
	document.form1.action='/servlet/controller.off.ProposeOffServlet';
	document.form1.p_process.value = 'SubjectList';
	document.form1.p_rprocess.value = '';
	self.location.href = "/servlet/controller.off.ProposeOffServlet?p_process=SubjectList";
}

// �����˻� ����ó��
function search_enter(e)  {
	if (e.keyCode =='13'){  subjSearch();  }
}

// �����˻�
function subjSearch() {
	document.form1.p_process.value = "SubjectList";
	document.form1.submit();
}

// �α����
function whenSubjBest(){
	document.form1.target = "_self";
	document.form1.p_process.value= "SubjectListBest";
	document.form1.action= "/servlet/controller.off.ProposeOffServlet";
	document.form1.submit();
}



// ��ü�������� (����ȭ��)
function whenSubjList() {
    var actionurl = document.form1.p_actionurl.value;

    document.form1.target = "_self";
    document.form1.p_process.value = document.form1.p_rprocess.value;
    if(actionurl != null && actionurl != "") {
		document.form1.action = document.form1.p_actionurl.value;
    }
    document.form1.submit();
}

// ����������ȸ
function whenSelSubjInfo(subjseq,year) {
	var url = "/servlet/controller.off.ProposeOffServlet";

	var new_Open = window.open(url,"seqInfo",'scrollbars=yes,width=680,height=600,resizable=no');
	document.form1.target = "seqInfo";
	document.form1.p_process.value = "SeqPreviewPage";
	document.form1.p_subjseq.value = subjseq;
	document.form1.p_year.value = year;
	document.form1.submit();
}

//������û
function whenSubjPropose() {
	if(<%= box.getSession("userid").length()==0 %>) {
		alert("�α����� �ʿ��մϴ�.");
		return;
	}
	if(!confirm("<%= subjectPreview.getString("d_subjnm") %> ������ ������û�Ͻðڽ��ϱ�?")) {
	 return;
	}
	var new_Open = window.open("","proposeWindow",'scrollbars=yes,width=800,height=600,resizable=no');
	document.form1.p_process.value = "SubjectEduProposePage";
	document.form1.target = "proposeWindow";
	document.form1.action = "/servlet/controller.off.ProposeOffServlet";
	document.form1.submit();
	document.form1.target = "_self";
}

//������ �򰡺���
function ContentResearchInfo(){
  document.form1.target = "_self";
  document.form1.p_process.value = "ContentResearch";
  document.form1.action="/servlet/controller.off.ProposeOffServlet";
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
	 var url = "/servlet/controller.off.ProposeOffServlet";
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

//-->
</script>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->
<!-- form ���� -->
<form name="form1" action="/servlet/controller.off.ProposeOffServlet" method="post">
	<input type="hidden" name="type"	value="<%=type%>"/>
	<input type="hidden" name="p_process"	value="<%=box.get("p_process")%>"/>
	<input type="hidden" name="p_rprocess" value="<%=box.getStringDefault("p_rprocess", box.get("p_process"))%>"/>
	<input type="hidden" name="p_actionurl" value="<%=box.get("p_actionurl")%>"/>
	<input type="hidden" name="p_year"	value="<%=box.get("p_year")%>"/>
	<input type="hidden" name="p_subj"	value="<%=box.get("p_subj")%>"/>
	<input type="hidden" name="p_subjseq"	value="<%=box.get("p_subjseq")%>"/>
	<input type="hidden" name="p_seq"	value="<%=box.get("p_seq")%>"/>
	<input type="hidden" name="p_subjnm"	value="<%=box.get("p_subjnm")%>"/>
	<input type="hidden" name="p_iscourseYn"	value=""/>
	<input type="hidden" name="p_upperclass"	value="<%= box.get("p_upperclass") %>"/>
	<input type="hidden" name="p_upperclassnm"	value="<%=box.get("p_upperclassnm")%>"/>
	<input type="hidden" name="p_action"	value="<%=p_action%>"/>
	<input type="hidden" name="p_pageno"	value="<%=v_pageno%>"/>
	<input type="hidden" name="p_pagesize"  value="<%=v_pagesize%>"/>
	
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0" summary="���� ������ �������� ��ġ�� �ȳ��մϴ�">
			<tr>
				<td class="pagetitle"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > �������ΰ��� > <u><%=sub_title_navi%></u></td>
			</tr>
		</table>
		<div class="concept c01">
			<div><img src="<%=sub_title_img%>" alt="<%=sub_title_name%>"></div>
			<ul class="coursesearch">
				<li class="insert"><input type="text" tabindex="121" name="s_subjnm" class="insearch" onfocus="this.style.background='#ffffff'" title="�˻��� ������ �Է����ּ���"></li>
				<li class="output"><a href="javascript:subjSearch();" tabindex="122" title="�˻��� �����մϴ�"><img src="/images/2012/sub/page2/btn_course_search.gif" alt="�����˻�"></a></li>
			</ul>
			<ul class="pagetabC">
				<li><a href="javascript:selectArea('004','');" tabindex="123" title="3D ��ü������ �����η¾缺 �ι��� Ȯ���մϴ�"><img src="/images/2012/sub/page3/tabmenu/3dsolid_<%=sub1_toggle%>.png" alt="3D ��ü������ �����η¾缺"></a></li>
				<li><a href="javascript:selectArea('001','');" tabindex="124" title="����� ���� �米�� �ι��� Ȯ���մϴ�"><img src="/images/2012/sub/page3/tabmenu/industry_<%=sub2_toggle%>.png" alt="����� ���� �米��"></a></li>
				<li><a href="javascript:selectArea('002','');" tabindex="125" title="������ ����缺���� �ι��� Ȯ���մϴ�"><img src="/images/2012/sub/page3/tabmenu/talent_<%=sub3_toggle%>.png" alt="������ ����缺����"></a></li>
				<li><a href="javascript:selectArea('003','');" tabindex="126" title="��Ź���� �ι��� Ȯ���մϴ�"><img src="/images/2012/sub/page3/tabmenu/brokerage_<%=sub4_toggle%>.png" alt="��Ź����"></a></li>
			</ul>
		</div>
		<div class="onlinecourse">
			<div class="listback"><button type="button" tabindex="127" onclick="javascript:whenSubjList();" class="btn_small_gray" title="�����������">�������</button></div>
			<dl class="skipcontent">
				<dt>���� �ٷΰ���</dt>
				<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip01" tabindex="128" title="������ǥ�� �̵��մϴ�">������ǥ</a></dd>
				<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip02" tabindex="129" title="��������� �̵��մϴ�">��������</a></dd>
				<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip03" tabindex="130" title="�����ȳ��� �̵��մϴ�">�����ȳ�</a></dd>
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
			<table class="coursedetailheader" cellspacing="0" cellpadding="0" id="skip01">
				<colgroup><col width="65%"><col width="*"></colgroup>
				<tr>
					<th>
						<h1 style="font-size: 28px;"><%= subjectPreview.getString("d_subjnm") %> </h1>
						<h4><%= subjectPreview.getString("d_subjtarget") %> </h4>
						<img src="/images/2012/sub/page2/subject_learning_target.gif" alt="������ǥ�� ���� �˾ƺ����?">
						<h6>
							<%= subjectPreview.getString("d_intro") %>
						</h6>
					</th>
					<td>
						<img src="/images/2012/sub/page2/sample_offcourse.gif" class="courseimage" alt="�����ǹ�">
						<div class="offlinecourseoption">
							<%	if (isSeq && nflage.equals("Y")) { %>
							<a href="javascript:whenSubjPropose()" tabindex="208" title="�� ������ ���� ������û�� �� �� �ֽ��ϴ�"><img src="/images/2012/common/btn_request.gif" alt="������û"></a>
							<% } %>
						</div>
					</td>
				</tr>
			</table>
			<table class="learningcontent" cellspacing="0" cellpadding="0" id="skip02">
				<colgroup><col width="80"><col width="*"></colgroup>
				<tr>
					<th><img src="/images/2012/sub/page3/subject_learning_about.gif" alt="��������"></th>
					<td>
						<%= StringManager.removeHTMLHead(subjectPreview.getString("d_explain")) %>
					</td>
				</tr>
			</table>
			<%	if (isSeq) { %>	
			<img src="/images/2012/sub/page2/subject_course_guide.gif" class="subject" alt="�����ȳ�">
			<div class="courseguidebox" id="skip03">
				<div class="rable4">
					<img src="/images/2012/sub/page2/subject_course_about.gif" alt="��������">
					<table class="courseguide" cellspacing="0" cellpadding="0" summary="�����ȳ�">
						<colgroup><col width="120"><col width="350"><col width="120"><col width="*"></colgroup>
						<tr>
							<th>������û ������</th>
							<td><%= subjectPreview.getDate("d_propstart", ".") %></td>
							<th>������û ������</th>
							<td><%= subjectPreview.getDate("d_propend", ".") %></td>
						</tr>
						<tr>
							<th>����������</th>
							<td><%= subjectPreview.getDate("d_edustart", ".") %></td>
							<th>����������</th>
							<td><%= subjectPreview.getDate("d_eduend", ".") %></td>
						</tr>
						<tr>
							<th>��������</th>
							<td><%= subjectPreview.getCommaInt("d_studentlimit") %>��</td>
							<th>������</th>
							<td>
							<% 
								String biyong = "";
								if( subjectPreview.getCommaInt("d_biyong").equals("0") ) {
									biyong = "����";
								} else {
									biyong = subjectPreview.getCommaInt("d_biyong") + " ��";
								}
								%>
							<%= biyong %>
						</td>
						</tr>
						<tr>
							<th>��������</th>
							<td colspan="3">
							<% if(!subjectPreview.getString("d_charger").equals("")){%>
								<%=subjectPreview.getString("d_charger") %>
								<%}else{ %>
									-
								<%} %>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<%} %>
		</div>
	</div>
</form>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
