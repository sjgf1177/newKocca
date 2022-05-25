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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
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
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>

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
        <% if      ("B".equals(type)) { %> <td><img src="/images/portal/homepage_renewal/offline/stitle_02.gif" alt="��ۿ���" /></td><td class="h_road">Home &gt; �������� ����  &gt; <strong>��ۿ���</strong></td><% }
   else if ("G".equals(type)) { %> <td><img src="/images/portal/homepage_renewal/offline/stitle_03.gif" alt="��������" /></td><td class="h_road">Home &gt; �������� ����  &gt; <strong>��������</strong></td><% }
   else if ("K".equals(type)) { %> <td><img src="/images/portal/homepage_renewal/offline/stitle_04.gif" alt="��ȹâ��" /></td><td class="h_road">Home &gt; �������� ����  &gt; <strong>��ȹâ��</strong></td><% }      
%>
<%=box.get("d_year")%>
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
        <td width="23" height="40"><img src="/images/portal/homepage_renewal/common/icon_blue.jpg"/></td>
        <td width="135"><img src="/images/portal/homepage_renewal/online/sstitle_001.gif"/></td>
        <td width="468" class="h_road">
        	<%	if (isSeq && nflage.equals("Y")) { %>					<a href="javascript:whenSubjPropose()" class="btn_gr mg_t3">
        		<img src="/images/portal/homepage_renewal/online/btn_sct.jpg" width="87" height="25" />
        	</a><%	} %>
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
        <td width="100" class="tit_table">������</td>
        <td class="ct_tit_table_lright"><strong><%= subjectPreview.getString("d_subjnm") %></strong></td>
      </tr>
      <tr>
        <td class="tit_table">�������</td>
        <td class="ct_tit_table_lright"><% if(!subjectPreview.getString("d_subjtarget").equals("")){ %>
        											<%= subjectPreview.getString("d_subjtarget") %>
        											<%}else{ %>
        												&nbsp;
        											<%} %>
        											</td>
      </tr>
      <tr>
        <td class="tit_table">��������</td>
        <td class="ct_tit_table_lright"><% if(!subjectPreview.getString("d_intro").equals("")){ %>
        											<%= subjectPreview.getString("d_intro") %>
        											<%}else{ %>
        												&nbsp;
        											<%} %>
        											</td>
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
        <td><img src="/images/portal/homepage_renewal/online/sstitle_002.gif"/></td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
      	<td><%= subjectPreview.getString("d_explain") %></td>
      </tr>
      <tr>
        <td height="1" colspan="3" bgcolor="CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="3" bgcolor="F7F7F7"></td>
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
      <tr>
        <td width="150" class="tit_table">������û ������</td>
        <td class="ct_tit_table_left"><%= subjectPreview.getDate("d_propstart", ".") %></td>
        <td class="tit_table">������û ������</td>
        <td class="ct_tit_table_lright"><%= subjectPreview.getDate("d_propend", ".") %></td>
      </tr>
      <tr>
        <td class="tit_table">����������</td>
        <td class="ct_tit_table_left"><%= subjectPreview.getDate("d_edustart", ".") %></td>
        <td class="tit_table">����������</td>
        <td class="ct_tit_table_lright"><%= subjectPreview.getDate("d_eduend", ".") %></td>
      </tr>
      <tr>
      	<!--<td class="tit_table">��������</td>
        <td class="ct_tit_table_left"><%= subjectPreview.getCommaInt("d_studentlimit") %>��</td>-->
        <td class="tit_table">������</td>
        <td class="ct_tit_table_left">
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
		<td class="tit_table">��������</td>
        <td colspan="3" class="ct_tit_table_lright"><% if(!subjectPreview.getString("d_charger").equals("")){%>
        												<%=subjectPreview.getString("d_charger") %>
        												<%}else{ %>
        													&nbsp;
        												<%} %></td>
      </tr>
      <tr>
        <td height="1" colspan="4" bgcolor="CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="4" bgcolor="F7F7F7"></td>
      </tr>
    </table>
    <%} %>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
      	</td>
        <td width="626" class="h_road">
        	<%	if (isSeq && nflage.equals("Y")) { %>					<a href="javascript:whenSubjPropose()" class="btn_gr mg_t3">
        		<img src="/images/portal/homepage_renewal/online/btn_sct.jpg" width="87" height="25" />
        	</a><%} %>
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
<% if ("B".equals(type)) { %>			<h2><img src="/images/portal/online/h2_tit1.gif" alt="��ۿ���" class="fl_l" /><p class="category">Home &gt; �������ΰ��� &gt; <strong>��ۿ���</strong></p></h2><% }
else if ("G".equals(type)) { %>			<h2><img src="/images/portal/online/h2_tit2.gif" alt="���Ӱ���" class="fl_l" /><p class="category">Home &gt; �������ΰ��� &gt; <strong>���Ӱ���</strong></p></h2><% }
else if ("K".equals(type)) { %>			<h2><img src="/images/portal/online/h2_tit3.gif" alt="��ȭ������" class="fl_l" /><p class="category">Home &gt; �������ΰ��� &gt; <strong>��ȭ������</strong></p></h2><% } %>
<%=box.get("d_year")%>
			<h3 class="mg_tn">
				<img src="/images/portal/common/stit_corseintro.gif" alt="�����Ұ�" class="tit" />
				<p class="btn">
<%	if (isSeq && nflage.equals("Y")) { %>					<a href="javascript:whenSubjPropose()" class="btn_gr mg_t3"><span>������û</span></a><%	} %>
				<a href="javascript:whenSubjList();" class="btn_gr"><span>���</span></a></p></h3>
			<table class="view">
			<colgroup><col width="20%" /><col width="30%" /><col width="20%" /><col width="30%" /></colgroup>
			<tr>
				<th>������</th>
				<td class="end" colspan="3"><% if(subjectPreview.get("d_areaname").length()>0) out.println("<b>[" + subjectPreview.get("d_areaname") + "]</b>"); %><%= subjectPreview.getString("d_subjnm") %></td>
			</tr>
			<tr>
				<th>�������</th>
				<td class="end" colspan="3"><%= subjectPreview.getBrString("d_subjtarget") %></td>
			</tr>
			<tr>
				<th>��������</th>
				<td class="end" colspan="3"><%= subjectPreview.getBrString("d_intro") %></td>
			</tr>
			</table>

			<h3><img src="/images/portal/common/stit_educon.gif" alt="��������" /></h3>
			<table class="view">
			
			<tr>
				<td class="end"><%= subjectPreview.getString("d_explain") %></td>
			</tr>
			</table>

<%	if (isSeq) { %>	
			<h3><img src="/images/portal/common/stit_classinfo.gif" alt="�����ȳ�" /></h3>
			<table class="view">
			<colgroup><col width="20%" /><col width="30%" /><col width="20%" /><col width="30%" /></colgroup>
			<tr>
				<th>������û ������</th>
				<td><%= subjectPreview.getDate("d_propstart", ".") %></td>
				<th>������û ������</th>
				<td class="end"><%= subjectPreview.getDate("d_propend", ".") %></td>
			</tr>
			<tr>
				<th>����������</th>
				<td><%= subjectPreview.getDate("d_edustart", ".") %></td>
				<th>����������</th>
				<td class="end"><%= subjectPreview.getDate("d_eduend", ".") %></td>
			</tr>
			<tr>
				<th>��������</th>
				<td><%= subjectPreview.getCommaInt("d_studentlimit") %>��</td>
				<th>������</th>
				<td class="end"><%= subjectPreview.getCommaInt("d_biyong") %> ��</td>
			</tr>
<%	if(subjectPreview.getBoolean("d_isgoyong")) { %>
			<tr>
				<th>��뺸�� ȯ�޾�</th>
				<td colspan="3" class="end">���� : <%= subjectPreview.getCommaInt("d_goyongpricemajor") %>��, �켱��� : <%= subjectPreview.getCommaInt("d_goyongpriceminor") %>��</td>
			</tr>
<%	} %>
			<tr>
				<th>�������</th>
				<td colspan="3" class="end"><%= subjectPreview.getString("d_place")%></td>
			</tr>
			<tr>
				<th>��������</th>
				<td colspan="3" class="end">
					<%=subjectPreview.getString("d_charger")%>
			  	</td>
			</tr>
			</table>
    <% if(subjectPreview.getString("d_suryo_hideshow_yn").equals("Y")) { %>
			<h3><img src="/images/portal/common/stit_completion.gif" alt="����" /></h3>
			<table class="list">
			<thead>
			<tr>
				<th>�������</th>
				<th  class="end">����</th>
				<%--<th class="end">������</th>--%>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>����</td>
				<td class="end"><%= subjectPreview.get("d_gradscore") %>�� �̻�</td>
				<%--<td class="end"><%= subjectPreview.get("d_wstep") %>% �̻�</td>--%>
			</tr>
			</tbody>
			</table>
    <%}%>
<% if(1==0) { %>

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
				<td><%= subjectPreview.get("d_wstep") %>%</td>
				<td><%= subjectPreview.get("d_wmtest") %>%</td>
				<td><%= subjectPreview.get("d_wftest") %>%</td>
				<td><%= subjectPreview.get("d_whwest") %>%</td>
				<td><%= subjectPreview.get("d_wreport") %>%</td>
				<td><%= subjectPreview.get("d_wetc1") %>%</td>
				<td class="end"><%= subjectPreview.get("d_wetc2") %>%</td>
			</tr>
			</tbody>
			</table>
<%	}}	%>
<% if(1==0) { %>
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
						<dt><img src="<%= tutorListBox.get("d_phototerms") %>" alt="��������" /></dt>
						<dd class="mg_t6"><span class="tit">�̸� :</span><span class="con"><%= tutorListBox.get("d_name") %> </span></dd>
						<dd><span class="tit">�Ҽ� :</span><span class="con"><%= tutorListBox.get("d_comp") %></span></dd>
						<dd><span class="tit">�Ұ� :</span><span class="con"><%= tutorListBox.getHtmlString("d_career") %></span></dd>
					</dl>
				</td>
			</tr>
<%	isFirst = false;	}} %>
			</table>

			<p class="f_btn">
					<% if (isSeq && nflage.equals("Y")) { %><a href="javascript:whenSubjPropose()" class="btn_gr mg_t3"><span>������û</span></a><% } %>
									<a href="javascript:whenSubjList();" class="btn_gr"><span>���</span></a></p>
	<%} %>
			</form>
<!-- form �� -->

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->