<%
//**********************************************************
//  1. ��	  ��: SUBJECT LIST
//  2. ���α׷���: zu_Subject_L.jsp
//  3. ��	  ��: ������ȸ
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
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

<%@ include file="/learn/user/portal/include/top.jsp"%>

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
function subjSearch() {
	if (document.form1.p_lsearchtext.value=="") {
		alert("�˻�� �Է����ּ���");
		return;
	}
	document.form1.action = "/servlet/controller.propose.MainSubjSearchServlet";	//
	document.form1.p_process.value = "SubjSearch";
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

	if (confirm(subjnm + " ������ ���ɰ������� ����Ͻðڽ��ϱ�?")) {
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
	
	<%if( box.getSession("tem_grcode").equals("N000001")) { %>
	
	<table>
		<tr>
			<td>	
	
	<!--Ÿ��Ʋ�κ�-->
    <table width="672" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" colspan="2" class="h_road">&nbsp;</td>
      </tr>
      <tr>
        <% if      ("C01".equals(v_upperclass)) { %> <td><img src="/images/portal/homepage_renewal/online/stitle_02.gif" alt="��ȹ" /></td><td class="h_road">Home &gt; �¶��� ����  &gt; <strong>��ȹ</strong></td><% }
		   else if ("C02".equals(v_upperclass)) { %> <td><img src="/images/portal/homepage_renewal/online/stitle_03.gif" alt="����" /></td><td class="h_road">Home &gt; �¶��� ����  &gt; <strong>����</strong></td><% }
		   else if ("C03".equals(v_upperclass)) { %> <td><img src="/images/portal/homepage_renewal/online/stitle_04.gif" alt="����" /></td><td class="h_road">Home &gt; �¶��� ����  &gt; <strong>����</strong></td><% }
		   else if ("C04".equals(v_upperclass)) { %> <td><img src="/images/portal/homepage_renewal/online/stitle_05.gif" alt="�濵����" /></td><td class="h_road">Home &gt; �¶��� ����  &gt; <strong>�濵����</strong></td><% }   
		%>
      </tr>
      <tr>
        <td height="12" colspan="2"></td>
        </tr>
      <tr>
        <td height="1" colspan="2" bgcolor="E5E5E5"></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="20" height="40"><img src="/images/portal/homepage_renewal/common/icon_blue.jpg"/></td>
        <td width="116"><img src="/images/portal/homepage_renewal/online/sstitle_001.gif"/></td>
        <%	if (isSeq && "Y".equals(sugang_YN)) { %>        
			<td width="392" class="h_road">
				<a href="javascript:whenSubjPropose(
									'<%=box.get("p_subj")%>',
									'<%=box.get("p_year")%>',
									'<%=box.get("p_subjseq")%>',
									'<%=box.get("p_subjnm")%>');" class="btn_red">
					<img src="/images/portal/homepage_renewal/online/btn_sct.jpg" width="87" height="25" />
				</a>
			</td>		
		<%} %>
        <td width="98" class="h_road">
        	<a href="javascript:whenPreShow('<%= subjectPreview.get("d_preurl")%>','<%= box.get("p_subj")%>', '<%= box.get("p_wj_classkey")%>' )" class="btn_gr">
        		<img src="/images/portal/homepage_renewal/online/btn_study_view.jpg" width="98" height="25" />
        	</a>
        </td>
        <td width="46" class="h_road">
        	<a href="javascript:whenSubjList();" class="btn_gr">
        		<img src="/images/portal/homepage_renewal/online/btn_list.jpg" width="46" height="25" />
        	</a>
        </td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="1" colspan="2" bgcolor="#7692CB"></td>
      </tr>
      <tr>
        <td class="tit_table" width="10%">����</td>
        <td class="ct_tit_table_lright"><strong><%= subjectPreview.getString("d_subjnm") %></strong></td>
      </tr>
      <tr>
        <td class="tit_table">�������</td>
        <td class="ct_tit_table_lright"><%= subjectPreview.getHtmlString("d_edumans") %></td>
      </tr>
      <tr>
        <td class="tit_table">��������</td>
        <td class="ct_tit_table_lright"><%= subjectPreview.getHtmlString("d_intro") %></td>
      </tr>
      <tr>
        <td class="tit_table">��������</td>
        <td class="ct_tit_table_lright"><%= subjectPreview.getHtmlString("d_explain") %></td>
      </tr>
      <tr>
        <td class="tit_table">���Ǳ���/����</td>
        <td class="ct_tit_table_lright"><%= subjectPreview.getHtmlString("d_memo") %></td>
      </tr>

      <tr>
        <td height="1" colspan="2" bgcolor="CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="2" bgcolor="F7F7F7"></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="20" height="40"><img src="/images/portal/homepage_renewal/common/icon_blue.jpg"/></td>
        <td><img src="/images/portal/homepage_renewal/online/sstitle_003.gif"/></td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="tit_table">����</td>
        <td class="tit_table_right">��������</td>
        </tr>
<%	for (DataBox lessonListDataBox : lessonList) {	%>
      <tr>
        <td class="ct_tit_table"><%= lessonListDataBox.get("d_lesson")  %></td>
        <td class="ct_tit_table_lright"><%= lessonListDataBox.get("d_sdesc")  %></td>
      </tr>      
<%	} %>
      
      <tr>
        <td height="1" colspan="2" bgcolor="CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="2" bgcolor="F7F7F7"></td>
      </tr>
    </table>
    
<%	if (isSeq) { %>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="20" height="40"><img src="/images/portal/homepage_renewal/common/icon_blue.jpg"/></td>
        <td><img src="/images/portal/homepage_renewal/online/sstitle_004.gif"/></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="1" colspan="4" bgcolor="#7692CB"></td>
      </tr>
<%	for(DataBox subjseqListDataBox : subjseqList) {	%>
      <tr>
        <td width="150" class="tit_table">������û ������</td>
        <td class="ct_tit_table_left"><%= subjseqListDataBox.getDate("d_propstart") %></td>
        <td width="150" class="tit_table">������û ������</td>
        <td class="ct_tit_table_lright"><%= subjseqListDataBox.getDate("d_propend") %></td>
      </tr>
      <tr>
        <td class="tit_table">����������</td>
        <td class="ct_tit_table_left"><%= subjseqListDataBox.getDate("d_edustart") %></td>
        <td class="tit_table">����������</td>
        <td class="ct_tit_table_lright"><%= subjseqListDataBox.getDate("d_eduend") %></td>
      </tr>
      <tr>
        <td class="tit_table">��������</td>
        <td class="ct_tit_table_left">		
				<%
				String slimit = "";
				if( subjseqListDataBox.getInt("d_studentlimit") == 0 ) {
					slimit = "���Ѿ���";
				} else {
					slimit = subjseqListDataBox.getCommaInt("d_studentlimit") + " ��";
				}
				%>
				<%= slimit %>		
		</td>
        <td class="tit_table">������</td>
        <td class="ct_tit_table_lright">
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
        <td class="tit_table">��������</td>
        <td colspan="3" class="ct_tit_table_lright">
        	�¶��� ���� � ����� : 02-2161-0077 academy@kocca.kr</td>
        </tr>

      <tr>
        <td height="1" colspan="4" bgcolor="CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="4" bgcolor="F7F7F7"></td>
      </tr>
      <%} %>
    </table>
    <%{ 
    	DataBox subjseqListDataBox = subjseqList.get(subjseqList.size()-1);	%>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="20" height="40"><img src="/images/portal/homepage_renewal/common/icon_blue.jpg"/></td>
        <td><img src="/images/portal/homepage_renewal/online/sstitle_005.gif"/></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="tit_table">�������</td>
        <td class="tit_table">����</td>
        <td class="tit_table_right">������</td>
      </tr>
      <tr>
        <td class="ct_tit_table"> ����</td>
        <td class="ct_tit_table"><%= subjseqListDataBox.get("d_gradscore") %></td>
        <td class="ct_tit_table_right"><%= subjseqListDataBox.get("d_gradstep") %>% �̻�</td>
      </tr>

      <tr>
        <td height="1" colspan="3" bgcolor="CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="3" bgcolor="F7F7F7"></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="20" height="40"><img src="/images/portal/homepage_renewal/common/icon_blue.jpg"/></td>
        <td><img src="/images/portal/homepage_renewal/online/sstitle_006.gif"/></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="tit_table">�򰡱���</td>
        <td class="tit_table">������  </td>
        <td class="tit_table">�߰��� </td>
        <td class="tit_table">������ </td>
        <td class="tit_table">������ </td>
        <td class="tit_table">����Ʈ </td>
        <td class="tit_table">������</td>
        <td class="tit_table_right">��Ÿ</td>
      </tr>
      <tr>
        <td class="ct_tit_table">����ġ(%) </td>
        <td class="ct_tit_table"><%= subjseqListDataBox.get("d_wstep") %>%</td>
        <td class="ct_tit_table"><%= subjseqListDataBox.get("d_wmtest") %>%</td>
        <td class="ct_tit_table"><%= subjseqListDataBox.get("d_wftest") %>%</td>
        <td class="ct_tit_table"><%= subjseqListDataBox.get("d_whtest") %>%</td>
        <td class="ct_tit_table"><%= subjseqListDataBox.get("d_wreport") %>%</td>
        <td class="ct_tit_table"><%= subjseqListDataBox.get("d_wetc1") %>%</td>
        <td class="ct_tit_table_right"><%= subjseqListDataBox.get("d_wetc2") %>%</td>
      </tr>
      <tr>
        <td height="1" colspan="8" bgcolor="CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="8" bgcolor="F7F7F7"></td>
      </tr>
    </table>
    <%} } %>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <%	if (isSeq && "Y".equals(sugang_YN)) { %>        
			<td width="528" class="h_road">
				<a href="javascript:whenSubjPropose(
									'<%=box.get("p_subj")%>',
									'<%=box.get("p_year")%>',
									'<%=box.get("p_subjseq")%>',
									'<%=box.get("p_subjnm")%>');" class="btn_red">
					<img src="/images/portal/homepage_renewal/online/btn_sct.jpg" width="87" height="25" />
				</a>
			</td>		
		<%} %>
        <td width="98" class="h_road">
        	<a href="javascript:whenPreShow('<%= subjectPreview.get("d_preurl")%>','<%= box.get("p_subj")%>', '<%= box.get("p_wj_classkey")%>' )" class="btn_gr">
        		<img src="/images/portal/homepage_renewal/online/btn_study_view.jpg" width="98" height="25" />
        	</a>
        </td>
        <td width="46" class="h_road">
        	<a href="javascript:whenSubjList();" class="btn_gr">
        		<img src="/images/portal/homepage_renewal/online/btn_list.jpg" width="46" height="25" />
        	</a>
        </td>
      </tr>
    </table>
    <!--Ÿ��Ʋ�κ�//-->
    </td>
    <td width="20">&nbsp;</td>
    
  </tr>
</table>
	
	<%}else{ %>	

<% if      ("C01".equals(v_upperclass)) { %> <h2><img src="/images/portal/online/h2_tit01.gif" alt="��ȹ"     class="fl_l" /><p class="category">Home &gt; �¶��ΰ��� &gt; <strong>��ȹ</strong></p></h2><% }
   else if ("C02".equals(v_upperclass)) { %> <h2><img src="/images/portal/online/h2_tit02.gif" alt="����"     class="fl_l" /><p class="category">Home &gt; �¶��ΰ��� &gt; <strong>����</strong></p></h2><% }
   else if ("C03".equals(v_upperclass)) { %> <h2><img src="/images/portal/online/h2_tit03.gif" alt="����"     class="fl_l" /><p class="category">Home &gt; �¶��ΰ��� &gt; <strong>����</strong></p></h2><% }
   else if ("C04".equals(v_upperclass)) { %> <h2><img src="/images/portal/online/h2_tit04.gif" alt="�濵����" class="fl_l" /><p class="category">Home &gt; �¶��ΰ��� &gt; <strong>�濵����</strong></p></h2><% }
   else if ("C05".equals(v_upperclass)) { %> <h2><img src="/images/portal/online/h2_tit05.gif" alt="Ư��"     class="fl_l" /><p class="category">Home &gt; �¶��ΰ��� &gt; <strong>Ư��</strong></p></h2><% }
   else if ("B01".equals(v_upperclass)) { %> <h2><img src="/images/portal/online/h2_tit1.gif" alt="��ۿ���" class="fl_l" /><p class="category">Home &gt; �¶��ΰ��� &gt; <strong>��ۿ���</strong></p></h2><% }
   else if ("G01".equals(v_upperclass)) { %> <h2><img src="/images/portal/online/h2_tit2.gif" alt="���Ӱ���" class="fl_l" /><p class="category">Home &gt; �¶��ΰ��� &gt; <strong>���Ӱ���</strong></p></h2><% }
   else if ("K01".equals(v_upperclass)) { %> <h2><img src="/images/portal/online/h2_tit3.gif" alt="��ȭ������" class="fl_l" /><p class="category">Home &gt; �¶��ΰ��� &gt; <strong>��ȭ������</strong></p></h2><% } 
%>

			<h3 class="mg_tn">
				<img src="/images/portal/common/stit_corseintro.gif" alt="�����Ұ�" class="tit" />
				<p class="btn">
<%	if (isSeq && "Y".equals(sugang_YN)) { %>				<font id="existpropose1"><a href="javascript:whenSubjPropose(
									'<%=box.get("p_subj")%>',
									'<%=box.get("p_year")%>',
									'<%=box.get("p_subjseq")%>',
									'<%=box.get("p_subjnm")%>');" class="btn_red"><span>������û</span></a></font>	<%	} %>
				<a href="javascript:whenPreShow('<%= subjectPreview.get("d_preurl")%>','<%= box.get("p_subj")%>', '<%= box.get("p_wj_classkey")%>' )" class="btn_gr"><span>���� ������</span></a>
                    <% if(grcode.equals("N000001")) { %>
				<a href="javascript:fnInterestInsert('<%=box.get("p_subj")%>','<%=box.get("p_subjnm")%>')" class="btn_gr"><span>���ɰ������</span></a>
                    <%}%>
				<a href="javascript:whenSubjList();" class="btn_gr"><span>���</span></a></p></h3>
			<table class="view">
			<colgroup><col width="20%" /><col width="80%" /></colgroup>
			<tr>
				<th>������</th>
				<td class="end"><b>&lt;&lt;<%= subjectPreview.get("d_areaname") %>&gt;&gt;</b>&nbsp;&nbsp;<%= subjectPreview.getString("d_subjnm") %></td>
			</tr>
			<tr>
				<th>�з�</th>
				<td class="end"><%= subjectPreview.getString("d_lowerclassnm") %></td>
			</tr>
			<tr>
				<th>�о�</th>
				<td class="end"><%= subjectPreview.getString("d_middleclassnm") %> <a href="javascript:$('#s_mclassnm').val('<%=subjectPreview.getString("d_middleclass")%>');whenSubjList();" class="board_btn2"><span class="arrow">���ð�������</span></a></td>
			</tr>
			<tr>
				<th>��������</th>
				<td class="end"><%= subjectPreview.getString("d_subjtypenm") %></td>
			</tr>
<!--			<tr>
				<th>������</th>
				<td class="end"><%= subjectPreview.getString("d_biyong") %></td>
			</tr>  -->
			<tr>
				<th>�������</th>
				<td class="end"><%= subjectPreview.getHtmlString("d_edumans") %></td>
			</tr>
			<tr>
				<th>��������</th>
				<td class="end"><%= subjectPreview.getHtmlString("d_intro") %></td>
			</tr>
			<tr>
				<th>���Ǳ���/����</th>
				<td class="end"><%= subjectPreview.getHtmlString("d_memo") %></td>
			</tr>
			<tr>
				<th>��������</th>
				<td class="end">
	<%  if (listPre == null || listPre.size()==0) {
			out.println("���������� �����ϴ�.");
		} else {
			for(int p = 0; p < listPre.size(); p++) {
					DataBox dboxp = (DataBox)listPre.get(p);
					String v_subjnmp = dboxp.getString("d_subjnm");
					out.println(v_subjnmp);
					out.println("<br>");
			}
		}
	%>
				</td>
			</tr>
			<tr>
				<th>�ļ�����</th>
				<td class="end">
	<%  if (listNext == null || listNext.size()==0) {
			out.println("�ļ������� �����ϴ�.");
		} else {
			for(int n = 0; n < listNext.size(); n++) {
					DataBox dboxn = (DataBox)listNext.get(n);
					String v_subjnmn = dboxn.getString("d_subjnm");
					out.println(v_subjnmn);
					out.println("<br>");
			}
		}
	%>
				</td>
			</tr>
			</table>

			<h3><img src="/images/portal/common/stit_educon.gif" alt="�����ȳ�" /></h3>
			<table class="view">
			<colgroup><col width="20%" /><col width="80%" /></colgroup>
			<tr>
				<td class="end"><%= subjectPreview.getHtmlString("d_explain") %></td>
			</tr>
			</table>

			<h3><img src="/images/portal/common/stit_nxtinfo.gif" alt="��������" /></h3>
			<table class="list">
			<colgroup><col width="10%" /><col width="70%" /><col width="20%" /></colgroup>
			<thead>
			<tr>
				<th>����</th>
				<th>��������</th>
				<th class="end">����</th>
			</tr>
			</thead>
			<tbody>
<%	for (DataBox lessonListDataBox : lessonList) {	%>
			<tr>
				<td><%= lessonListDataBox.get("d_lesson")  %></td>
				<td class="ta_l"><%= lessonListDataBox.get("d_sdesc")  %></td>
				<td class="ta_l end"><%= lessonListDataBox.get("d_name")  %></td>
			</tr>
<%	} %>
			</tbody>
			</table>

<%	if (isSeq) { %>	
			<h3><img src="/images/portal/common/stit_classinfo.gif" alt="�����ȳ�" /></h3>
			<table class="view">
			<colgroup><col width="20%" /><col width="30%" /><col width="20%" /><col width="30%" /></colgroup>
<%	for(DataBox subjseqListDataBox : subjseqList) {	%>
			<tr>
				<th>������û ������</th>
				<td><%= subjseqListDataBox.getDate("d_propstart") %></td>
				<th>������û ������</th>
				<td class="end"><%= subjseqListDataBox.getDate("d_propend") %></td>
			</tr>
			<tr>
				<th>����������</th>
				<td><%= subjseqListDataBox.getDate("d_edustart") %></td>
				<th>����������</th>
				<td class="end"><%= subjseqListDataBox.getDate("d_eduend") %></td>
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
				<%= slimit %>
				</td>
				<th>������</th>
				<td class="end">
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
				<td colspan="3" class="end">
					�¶��� ���� � ����� : 
<%
	if (subjectPreview.getString("d_area").equals("B0")) out.println(" 02-6441-3258");
	/* else if (subjectPreview.getString("d_area").equals("G0")) out.println(" 02)3219-5720"); */
	else if (subjectPreview.getString("d_area").equals("G0")) out.println(" 02-6441-3258");
	else if (subjectPreview.getString("d_area").equals("K0")) out.println(" 02-6441-3258");
	else {
%>
					<%=subjseqListDataBox.getString("d_mastername")%><% if (subjseqListDataBox.getString("d_mastercomptel").length()>0) {  %> (<%=subjseqListDataBox.getString("d_mastercomptel")%>)<% } %><br/>
					<%=subjseqListDataBox.getString("d_masteremail")%>
<%	} %>
<%if(subjseqListDataBox.getBoolean("d_existpropose")) {%>
					<input type="hidden" name="d_existpropose" id="d_existpropose" value="1"/>
<%	}	%>
			  	</td>
			</tr>
<%	}	 %>
			</table>
<%	{
		DataBox subjseqListDataBox = subjseqList.get(subjseqList.size()-1);	%>
			<h3><img src="/images/portal/common/stit_completion.gif" alt="����" /></h3>
			<table class="list">
			<thead>
			<tr>
				<th>�������</th>
				<th>����</th>
				<th class="end">������</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>����</td>
				<td><%= subjseqListDataBox.get("d_gradscore") %></td>
				<td class="end"><%= subjseqListDataBox.get("d_gradstep") %>% �̻�</td>
			</tr>
			</tbody>
			</table>

			<h3><img src="/images/portal/common/stit_valuation.gif" alt="��" /></h3>
			<table class="list">
			<thead>
			<tr>
				<th>�򰡱���</th>
				<th>������</th>
				<th>�߰���</th>
				<th>������</th>
				<th>������</th>
				<th>����Ʈ</th>
				<th>������</th>
				<th class="end">��Ÿ</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>����ġ(%)</td>
				<td><%= subjseqListDataBox.get("d_wstep") %>%</td>
				<td><%= subjseqListDataBox.get("d_wmtest") %>%</td>
				<td><%= subjseqListDataBox.get("d_wftest") %>%</td>
				<td><%= subjseqListDataBox.get("d_whtest") %>%</td>
				<td><%= subjseqListDataBox.get("d_wreport") %>%</td>
				<td><%= subjseqListDataBox.get("d_wetc1") %>%</td>
				<td class="end"><%= subjseqListDataBox.get("d_wetc2") %>%</td>
			</tr>
			</tbody>
			</table>
<%	}	}	 %>
			<h3><img src="/images/portal/common/stit_profeinfo.gif" alt="��������" class="tit" /><p class="btn">
				<a href="javascript:whenTutorShow();" class="board_btn2" id="show"><span class="arrow">������ü����</span></a>
				<a href="javascript:whenTutorHide();" class="board_btn2" id="hide" style="display:none"><span class="arrow">�߰��������� �ݱ�</span></a>
			</p></h3>
			<table class="view">
			<colgroup><col width="20%" /><col width="80%" /></colgroup>
<% boolean isFirst = true;
	for (DataBox tutorListBox : tutorList) { %>
			<tr id='tutorList<%= isFirst %>' style="display:<%= isFirst?"" : "none" %>">
				<th>��������</th>
				<td colspan="3" class="end">
					<dl class="professor">
						<dt><img src="<%= tutorListBox.get("d_phototerms") %>" alt="��������"  width="85" height="113" /></dt>
						<dd class="mg_t6"><span class="tit">�̸� :</span><span class="con"><%= tutorListBox.get("d_name") %> </span></dd>
						<dd><span class="tit">�Ҽ� :</span><span class="con"><%= tutorListBox.get("d_comp") %></span></dd>
						<dd><span class="tit">�Ұ� :</span><span class="con"><%= tutorListBox.getHtmlString("d_career") %></span></dd>
					</dl>
				</td>
			</tr>
<%	} %>
			</table>

			<p class="f_btn">
<% if (isSeq && "Y".equals(sugang_YN)) { %><font id="existpropose2"><a href="javascript:whenSubjPropose(
									'<%=box.get("p_subj")%>',
									'<%=box.get("p_year")%>',
									'<%=box.get("p_subjseq")%>',
									'<%=box.get("p_subjnm")%>');" class="btn_red"><span>������û</span></a></font><% } %>
									<a href="javascript:whenPreShow('<%= subjectPreview.get("d_preurl")%>','<%= box.get("p_subj")%>', '<%= box.get("p_wj_classkey")%>' )" class="btn_gr"><span>���� ������</span></a>
                                    <% if(grcode.equals("N000001")) { %>
									    <a href="javascript:fnInterestInsert('<%=box.get("p_subj")%>','<%=box.get("p_subjnm")%>')" class="btn_gr"><span>���ɰ������</span></a>
                                    <%}%>
									<a href="javascript:whenSubjList();" class="btn_gr"><span>���</span></a></p>
									
	<%} %>
			</form>
<!-- form �� -->
<script>if($("#d_existpropose").val()==1)whenProposeHide();</script>

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->