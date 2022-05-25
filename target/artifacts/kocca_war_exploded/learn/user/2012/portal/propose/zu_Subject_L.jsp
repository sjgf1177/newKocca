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
	List<DataBox> subjList = (List<DataBox>)request.getAttribute("SubjectList");		 // ���� ����Ʈ
	int v_pageno = box.getInt("p_pageno");
	if (v_pageno == 0)  v_pageno = 1;
	int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0;
	int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
	int v_pagesize = box.getInt("p_pagesize");
	int	 v_totalrowcount =  0;
	
	String p_order = box.getString("p_order");
%>
<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!-- ��ũ��Ʈ���� -->
<script language="JavaScript">
<!--//
// �����˻� ����ó��
function search_enter(e)  {
	if (e.keyCode =='13'){  subjSearch();  }
}

// �����˻�
function subjSearch() {
	document.form1.p_process.value = "SubjectList";
	document.form1.submit();
}

//���� ���뺸��
function whenSubjInfo(subj,subjnm,courseyn,upperclass,upperclassnm, year, subjseq){
document.form1.p_subj.value = subj;
document.form1.p_subjnm.value = subjnm;
document.form1.p_iscourseYn.value = courseyn;
document.form1.p_upperclass.value = upperclass;
document.form1.p_upperclassnm.value = upperclassnm;
document.form1.p_year.value = year;
document.form1.p_subjseq.value = subjseq;
document.form1.p_process.value = 'SubjectPreviewPage';
document.form1.p_rprocess.value = 'SubjectList';
document.form1.action='/servlet/controller.propose.ProposeCourseServlet';
document.form1.target = "_self";
document.form1.submit();
}
//������
function whenPreShow(url, subj, d_preheight, d_prewidth) {
	// �α�
	prelog_url = "/servlet/controller.propose.ProposeCourseServlet?p_process=insertPreviewLog&p_subj="+subj;

	open_window("openShow",url,"100","100",d_preheight,d_prewidth,"","","",true,true);
}

//��ü��������
function whenSubjectListAll() {
document.form1.p_process.value = 'SubjectListAll';
document.form1.p_rprocess.value = 'SubjectList';
document.form1.action='/servlet/controller.propose.ProposeCourseServlet';
document.form1.submit();
}
//������û
function whenSubjPropose(subj,year,subjseq, subjnm, billYn) {

	if(<%= box.getSession("userid").length()==0 %>) {
		alert("�α����� �ʿ��մϴ�.");
		return;
	}
	if(!confirm(subjnm+"������ ������û�Ͻðڽ��ϱ�?")){
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

//���ɹ�ư Ŭ��
function fnInterestInsert(subj,year,subjseq,courseyn,subjnm) {

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
	else alert("���ɰ��� ����� �����Ͽ����ϴ�.\n"+data.result);
}
	//������ �̵�
	function go(index) {
		document.form1.p_action.value = "go";
		document.form1.p_pageno.value = index;
		document.form1.p_process.value = "SubjectList";
		document.form1.submit();
	}
	//������ �̵�
	function selectArea(area) {
		$("#p_area").val(area);
		document.form1.p_action.value = "go";
		document.form1.p_process.value = "SubjectList";
		document.form1.p_pageno.value = 0;
		document.form1.submit();
	}
	//������ �̵�
	function goPage(pageNum) {
		document.form1.p_action.value = "go";
		document.form1.p_pageno.value = pageNum;
		document.form1.p_process.value = "SubjectList";
		document.form1.submit();
	}
	function pagesize(pageSize) {
		document.form1.target = "_self";
		document.form1.p_pageno.value = 1;
		document.form1.p_pagesize.value = pageSize;
		document.form1.p_process.value = "SubjectList";
		document.form1.submit();
	}

	function goSort(tmp) {
        $("[name='p_order']").val(tmp);
		document.form1.p_process.value = "SubjectList";
		document.form1.submit();
	}

	 // ��������� ����/���ο� �������� ������ �ٷ� ����
    function gotoOffLineCoin() {
       document.form1.action = "/servlet/controller.study.MyClassBillServlet";
       document.form1.p_process.value = "MyOffClassBillListPage";
       document.form1.menuid.value = "19";
       document.form1.gubun.value = "3";
//       document.form1.p_seq.value= seq;
       document.form1.target = "_self";
       document.form1.submit();
    }

 // �α���
    function login() {
        	document.form1.p_process.value   = "login";
        	document.form1.p_topuserid.value = document.getElementById('p_userid').value;
        	document.form1.p_toppwd.value =  document.getElementById('p_pwd').value;

        	document.form1.action            = "/servlet/controller.homepage.LoginServlet";
        	document.form1.submit();        
    }

    function usermark(){        
		document.getElementById('p_userid').value = "";
        
	}
	function usermark_none(){
		if(document.getElementById('p_userid').value == ""){
		document.getElementById('p_userid').value = "���̵�";
		}
	}
	function pwmark(){
		document.getElementById('p_pwd').value = "";	
	}
	function pwmark_none(){
		if(document.getElementById('p_pwd').value == ""){
		document.getElementById('p_pwd').value = "��й�ȣ";
		}
	}
//-->
</script>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->
<!-- form ���� -->
<form name="form1" action="/servlet/controller.propose.ProposeCourseServlet" method="post">
	<input type="hidden" name="p_process"	value="<%=box.get("p_process")%>">
	<input type="hidden" name="p_rprocess"	value="">
	<input type="hidden" name="p_year"	value="">
	<input type="hidden" name="p_subj"	value="">
	<input type="hidden" name="p_subjseq"	value="">
	<input type="hidden" name="p_subjnm"	value="">
	<input type="hidden" name="p_order"	value="<%=p_order %>">
	<input type="hidden" name="p_iscourseYn"	value="">
	<input type="hidden" name="p_upperclass"	value="<%=v_upperclass %>">
	<input type="hidden" name="p_upperclassnm"	value="">
	<input type="hidden" name="p_action"	value="<%=p_action%>">
	<input type="hidden" name="p_pageno"	value="<%=v_pageno%>">
	<input type="hidden" name="p_pagesize"  value="<%=v_pagesize%>">
	<input type="hidden" name="p_area" id="p_area" value="<%= box.get("p_area") %>">	
  <input type="hidden" name="menuid" value="">
  <input type="hidden" name="gubun" value="">
  <input type="hidden" name="p_topuserid"	value="">
  <input type="hidden" name="p_toppwd"	value="">
	
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagetitle"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > �¶��ΰ��� > <u><%=sub_title_name %></u></td>
			</tr>
		</table>
		<div class="concept b01">
			<div><img src="<%=sub_title_img%>" alt="<%=sub_title_name%>"></div>
			<ul class="coursesearch">
				<li class="insert"><input type="text" name="s_subjnm" class="insearch" tabindex="201" onkeypress="search_enter(event);" onfocus="this.style.background='#ffffff'" title="�˻��� ������ �Է����ּ���"></li>
				<li class="output"><a href="javascript:subjSearch();" tabindex="202"><img src="/images/2012/sub/page2/btn_course_search.gif" title="�˻�� �Է� �� Ŭ�����ּ���" alt="�����˻�"></a></li>
			</ul>
			<%
				String full_toggle = "off";
				String sub1_toggle = "off";
				String sub2_toggle = "off";
				String sub3_toggle = "off";
				String sub4_toggle = "off";
				
				if ("C01".equals(v_upperclass))        { sub1_toggle = "on"; 
				} else if ("C02".equals(v_upperclass)) { sub2_toggle = "on"; 				
				} else if ("C03".equals(v_upperclass)) { sub3_toggle = "on"; 	
				} else if ("C04".equals(v_upperclass)) { sub4_toggle = "on"; 
				} else { full_toggle = "on"; 				
				}
			%>
			
			<ul class="pagetabB">
				<li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList&p_area=<%=v_area%>" tabindex="211" title="��ü������ Ȯ���մϴ�"><img src="/images/2012/sub/page2/tabmenu/total_<%=full_toggle%>.png" alt="��ü"></a></li>
				<li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList&p_upperclass=C01&p_area=<%=v_area%>" tabindex="212" title="��ȹ ������ Ȯ���մϴ�"><img src="/images/2012/sub/page2/tabmenu/plan_<%=sub1_toggle%>.png" alt="��ȹ"></a></li>
				<li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList&p_upperclass=C02&p_area=<%=v_area%>" tabindex="213" title="���� ������ Ȯ���մϴ�"><img src="/images/2012/sub/page2/tabmenu/making_<%=sub2_toggle%>.png" alt="����"></a></li>
				<li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList&p_upperclass=C03&p_area=<%=v_area%>" tabindex="214" title="���� ������ Ȯ���մϴ�"><img src="/images/2012/sub/page2/tabmenu/circulation_<%=sub3_toggle%>.png" alt="����"></a></li>
				<li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList&p_upperclass=C04&p_area=<%=v_area%>" tabindex="215" title="�濵���� ������ Ȯ���մϴ�"><img src="/images/2012/sub/page2/tabmenu/operation_<%=sub4_toggle%>.png" alt="�濵����"></a></li>
			</ul>
		</div>
		<div class="myclass">
			<div class="listbar">
				<table class="listrable" cellpadding="0" cellspacing="0" summary="�¶��ΰ��� ����Դϴ�">
					<colgroup><col width="125"><col width="*"><col width="80"><col width="140"><col width="140"><col width="100"></colgroup>
					<tr class="listhead">
						<th colspan="2">������</th>
						<th>������</th>
						<th>��û�Ⱓ</th>
						<th>�����Ⱓ</th>
						<th>������û</th>
					</tr>
					<%
					int i = 0;
					for(DataBox dbox : subjList) { 
					String biyong = "";
					String slimit = "";
					String propyn = dbox.getString("d_propyn");
					String imgurl = dbox.getString("d_introducefilenamenew");
					String ismobile = dbox.getString("d_mobile_preurl");

					if (imgurl.equals("")) {
						imgurl = "/images/2012/common/not_image.gif";
					} else {
						imgurl = "http://edu.kocca.or.kr/upload/bulletin/"+imgurl;
					}
				
					if( dbox.getInt("d_biyong") == 0 ) {
						biyong = "����";
					} else {
						biyong = dbox.getCommaInt("d_biyong") + "��";
					}
					if( dbox.getInt("d_studentlimit") == 0 ) {
						slimit = "���Ѿ���";
					} else {
						slimit = dbox.getCommaInt("d_studentlimit") + "��";
					}
					%>
					<tr class="listmiddle" onmouseover="this.style.background='#fbfbfb'" onmouseout="this.style.background=''">
						<td class="linefirst courseimg"><img src="<%=imgurl%>" class="course" alt="<%=dbox.get("d_subjnm")%>"></td>
						<td class="title courselist" id="bboardfocus<%=i%>">
							<a href="javascript:whenSubjInfo(
								'<%=dbox.get("d_subj")%>',
								'<%=dbox.get("d_subjnm")%>',
								'<%=dbox.get("d_isonoff")%>',
								'<%=dbox.get("d_scupperclass")%>',
								'<%=dbox.get("d_uclassnm")%>',
								'<%=dbox.get("d_scyear")%>',
								'<%=dbox.get("d_subjseq")%>')" onfocus="boardfocus('b',<%=i%>)" onblur="boardfocus('b',<%=i%>)" tabindex="<%="3"+i+"1"%>" title="[<%=dbox.get("d_edustart").substring(0,10)%>~<%=dbox.get("d_eduend").substring(0,10)%>] <%=dbox.get("d_subjnm")%>"><%=dbox.get("d_subjnm")%></a>
							<br>
							<img src="/images/2012/common/icon/icon_pc2.gif" alt="PC�н�">
							<% if (ismobile.equals("Y")) {%>
							<img src="/images/2012/common/icon/icon_mobile.gif" alt="������н�">
							<% } %>
							<% if (dbox.get("d_isnew").equals("Y")) {%>
							<img src="/images/2012/common/icon/new.gif" alt="�ű԰���">
							<% } %>
						</td>
						<td><%= biyong %></td>
						<td><%=dbox.get("d_propstart").substring(0,10)%>~<%=dbox.get("d_propend").substring(0,10)%></td>
						<td><%=dbox.get("d_edustart").substring(0,10)%>~<%=dbox.get("d_eduend").substring(0,10)%></td>
						<td class="learnactive">
							<button type="button" tabindex="<%="3"+i+"2"%>" onClick="whenPreShow('<%= dbox.get("d_preurl")%>','<%= dbox.get("d_subj")%>', '<%= dbox.get("d_prewidth", "800") %>'
							,'<%= dbox.get("d_preheight", "600") %>' )" class="btn_nomal_white" title="[<%=dbox.get("d_subjnm")%>]������ ���н����� 1���ø� �޾ƺ� �� �ֽ��ϴ�">������</button><br>
							
							<%if(dbox.getBoolean("d_existpropose")) {%> ��û�Ϸ� <%	}	else { if( propyn.equals("Y") ) {%>
							<button type="button" tabindex="<%="3"+i+"3"%>" onClick="javascript:whenSubjPropose(
								'<%=dbox.get("d_subj")%>',
								'<%=dbox.get("d_scyear")%>',
								'<%=dbox.get("d_subjseq")%>',
								'<%=dbox.get("d_subjnm")%>')" class="btn_nomal_darkmint" title="[<%=dbox.get("d_subjnm")%>]������ ��û�մϴ�">������û</button>
							<% }
								 i++;
							} %>
						</td>
					</tr>
					
					<%	
						v_totalpage	 = dbox.getInt("d_totalpage");// for ���� �ȿ� ����
						v_totalrowcount = dbox.getInt("d_totalrowcount");
						v_rowcount	  = dbox.getInt("d_rowcount");
					}	 					
					
					if( subjList.size() < 1) {	%>
						<tr><td colspan="5" align="center">��ϵ� ������ �����ϴ�.</td></tr>
					<% } %>        
				</table>
			</div>
			<div class="pageset">
				<%= PageUtil.re2012_printPageListDiv(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
			</div>
		</div>
	</div>
</form>	
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>