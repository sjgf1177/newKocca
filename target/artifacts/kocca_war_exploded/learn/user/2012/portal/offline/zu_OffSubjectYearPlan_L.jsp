<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.off.OffClassifySubjectBean" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

	box.put("topmenu","4");
	box.put("submenu","5");

    if (box == null) box = RequestManager.getBox(request);
    int row = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    
    GregorianCalendar   calendar    = new GregorianCalendar();
    String currentYear = Integer.toString(calendar.get(Calendar.YEAR));

    String  v_gyear         = box.getStringDefault("p_year", currentYear);           //�⵵
    String  v_month         = box.getStringDefault("p_month", "01");                  // ��
    String  v_upperclass    = box.getStringDefault("p_upperclass", "B01");            // ��з�
    String  v_middleclass   = box.getString("p_middleclass");                         // �ߺз�
    
    String v_subj           = "";
    String v_subjnm         = "";
    String v_edustart       = "";
    String v_eduend         = "";
    String v_propstart      = "";                          
    String v_propend        = "";
    String v_biyong         = "";
    String v_studentlimit   = "";                                              
    String v_status         = "";        
    String v_subjseq        = "";
    String v_year           = "";
    String v_classname      = "";
    String v_seq            = "";
    
    String v_menuid         = "";
    String v_type           = "";
    
    String v_edumonth  		= ""; 
    
    int    v_month_cnt   =  0;
    int    v_subj_cnt       =  0;

    ArrayList offSchlYearPlanList = (ArrayList)request.getAttribute("offSchlYearPlanList");
    int listSize    = offSchlYearPlanList != null ? offSchlYearPlanList.size() : 0 ;
    int subCnt      = offSchlYearPlanList != null && listSize > 0 ? ((DataBox)offSchlYearPlanList.get(0)).getInt("d_total_subj") : 0 ;
    	
    int     v_dispnum = 0;
    int     v_totalrowcount = offSchlYearPlanList != null &&  listSize > 0 ? ((DataBox)offSchlYearPlanList.get(0)).getInt("d_totalrowcount") : 0;
    int     v_totalpage = 0;  
    
    int		index = 0; 
    
    int v_pageno             = box.getInt("p_pageno"); 
    String s_userid          = box.getSession("userid");
    String s_usernm          = box.getSession("name");
    String s_grcode          = box.getStringDefault("tem_grcode", box.getSession("tem_grcode"));
    

    String v_classname1      = "end stxt";
    String v_classname2      = "end";
    
    DecimalFormat   dFormat = new DecimalFormat();
    
    ArrayList<DataBox> upperList = null;        // ���� ��з� ����Ʈ
    HashMap<String, String> upperMap = null;    // ��з� �� �޴�ID ���� �� HashMap<upperlcass, menuid>
    
    upperList  = OffClassifySubjectBean.getUpperClassList(box); 
    upperMap   = OffClassifySubjectBean.getMenuId(box);
                  
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ���� -->
<script language="JavaScript" type="text/JavaScript">
<!--

//������ �̵�
function go(index) {
    document.form1.p_pageno.value = index;
    document.form1.action = "/servlet/controller.course.EduScheduleHomePageServlet";
    document.form1.p_process.value = "offSchlYearPlanList";
    document.form1.submit();
}

//������ �̵�
function goPage(pageNum) {
     document.form1.p_pageno.value = pageNum;
     document.form1.action = "/servlet/controller.course.EduScheduleHomePageServlet";
     document.form1.p_process.value = "offSchlYearPlanList";
     document.form1.submit();
}

//������û
function whenSubjPropose(subj,year,subjseq, subjnm, seq) {
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
    document.form1.p_seq.value = seq;
    document.form1.action = "/servlet/controller.off.ProposeOffServlet";
    document.form1.submit();
    document.form1.target = "_self";
}

function changeMonth(month) {
    document.form1.target = "_self";
    document.form1.p_pageno.value = 1;
    document.form1.p_month.value = month;
    document.form1.action = '/servlet/controller.course.EduScheduleHomePageServlet';
    document.form1.p_process.value = "offSchlYearPlanList";
    document.form1.submit();
}

function moveTab(upperclass){
	 document.form1.p_upperclass.value = upperclass;
	 document.form1.p_middleclass.value = "";
     document.form1.action = "/servlet/controller.course.EduScheduleHomePageServlet";
     document.form1.p_process.value = "offSchlYearPlanList";
     document.form1.submit();
}
function changeYear(){
	document.form1.action = "/servlet/controller.course.EduScheduleHomePageServlet";
    document.form1.p_process.value = "offSchlYearPlanList";
    document.form1.submit();
}

function moveMonthList(month){
	document.form1.p_gyear.value = document.form1.p_year.value;
    document.form1.target = "_self";
    document.form1.p_pageno.value = 1;
    document.form1.menuid.value = "06";
    document.form1.p_month.value = month;
    document.form1.action = '/servlet/controller.course.EduScheduleHomePageServlet';
    document.form1.p_process.value = "offSchlMonthPlanList";
    document.form1.submit();
}

//���� ���뺸��
function whenSubjInfo(subj, subjseq, seq, menuid){
    document.form1.p_subj.value = subj;
    document.form1.p_subjseq.value = subjseq;
    document.form1.p_seq.value = seq;
    document.form1.menuid.value = menuid;
    document.form1.p_process.value = 'SubjectPreviewPage';
    document.form1.p_rprocess.value = 'SubjectList';
    document.form1.action='/servlet/controller.off.ProposeOffServlet';
    document.form1.target = "_self";
    document.form1.submit();
    }
//-->
</script>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->
<!-- form ���� -->
<form name = "form1" method = "post" action="">
      <input type = "hidden" name = "menuid"        value = "">
      <input type = "hidden" name = "p_process"     value = "">
      <input type = "hidden" name = "p_rprocess"     value = "">
      <input type = "hidden" name = "p_pageno"      value = "<%=v_pageno%>">
      <input type = "hidden" name = "p_seq"         value = "">
      <input type = "hidden" name = "p_userid"      value = "">
      <input type = "hidden" name = "p_month"       value = "<%=v_month %>">
      <input type = "hidden" name = "p_subj"        value = "">
      <input type = "hidden" name = "p_subjseq"     value = "">
      <input type = "hidden" name = "p_upperclass"  value = "<%=v_upperclass %>">
      <input type = "hidden" name = "type"          value = "<%=v_type %>">
      <input type = "hidden" name = "p_gyear"       value = "">
      
      <div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagetitle"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > �������ΰ��� > <u>��������</u></td>
			</tr>
		</table>
		<div class="concept c03">
			<div class="pagetitle"><img src="/images/2012/sub/page3/title/offline_schedule.gif" alt="�����ڷ��"></div>
			<ul class="pagetab">
				<li><a href="javascript:menuForward('2','05');" tabindex="11-1" title="�������� ���� ���������� �ȳ��մϴ�"><img src="/images/2012/sub/page3/tabmenu/yearschedule_on.png" alt="������������"></a></li>
				<li><a href="javascript:menuForward('2','06');" tabindex="11-2" title="�������� ���� ���������� �ȳ��մϴ�"><img src="/images/2012/sub/page3/tabmenu/monthschedule_off.png" alt="������������"></a></li>
			</ul>
		</div>
		<div class="offlinecourse">
			<ul class="curriculumlayout">
				<li>
					<img src="/images/2012/sub/page3/off_notice1.png" alt="������Ʈ �������Դϴ�." style="margin-top:30px;"/>
					<!--<table class="curriculum" cellspacing="0" cellpadding="0">
						<caption class="bgA">������ �ٽ� �η¾缺 ����</caption>
						<colgroup><col width="80"><col width="*"><col width="120"><col width="50"><col width="50"></colgroup>
						<thead>
							<tr>
								<th colspan="2">������</th>
								<th>��������</th>
								<th>�Ⱓ</th>
								<th>�ο�</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="4">��ۤ�����</td>
								<td class="coursename">VFX (Ư������)</td>
								<td>2012�� 3��~12��</td>
								<td>9����</td>
								<td>15��</td>
							</tr>
							<tr>
								<td class="coursename">��� �׷���</td>
								<td>2012�� 3��~12��</td>
								<td>9����</td>
								<td>15��</td>
							</tr>
							<tr>
								<td class="coursename">������ ��������</td>
								<td>2012�� 3��~8��</td>
								<td>6����</td>
								<td>30��</td>
							</tr>
							<tr>
								<td class="coursename">������ ��������</td>
								<td>2012�� 3��~8��</td>
								<td>6����</td>
								<td>10��</td>
							</tr>
							
							<tr class="division">
								<td rowspan="4">����</td>
								<td class="coursename">���� ������(��ȹ) </td>
								<td>2012�� 3��~12��</td>
								<td>10����</td>
								<td>12��</td>
							</tr>
							<tr class="division">
								<td class="coursename">���� ���α׷�</td>
								<td>2012�� 3��~12��</td>
								<td>10����</td>
								<td>18��</td>
							</tr>
							<tr class="division">
								<td class="coursename">���� �׷���</td>
								<td>2012�� 3��~12��</td>
								<td>10����</td>
								<td>15��</td>
							</tr>
							<tr class="division">
								<td class="coursename">���� ������Ʈ</td>
								<td>2012�� 3��~12��</td>
								<td>10����</td>
								<td>30��</td>
							</tr>
							<tr>
								<td>��ȹ��â��</td>
								<td class="coursename">������ ��ȹâ��</td>
								<td>2012�� 3��~12��</td>
								<td>10����</td>
								<td>20��</td>
							</tr>
							<tr class="division">
								<td>����Ͻ�</td>
								<td class="coursename">���������� ����Ͻ�</td>
								<td>2012�� 3��~11��</td>
								<td>9����</td>
								<td>15��</td>
							</tr>
							<tr>
								<td rowspan="3">3D��ü����</td>
								<td class="coursename">Pre-Production(��ȹ/����)</td>
								<td>2012�� 3��~12��</td>
								<td>10����</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">Production(�Կ�)</td>
								<td>2012�� 3��~12��</td>
								<td>10����</td>
								<td>15��</td>
							</tr>
							<tr>
								<td class="coursename">st-Production(����/VFX)</td>
								<td>2012�� 3��~12��</td>
								<td>10����</td>
								<td>20��</td>
							</tr>
						</tbody>
					</table>
					
					<table class="curriculum" cellspacing="0" cellpadding="0">
						<caption class="bgD">3D��ü������ �����η¾缺 ���� : <span>������ ��� 3D��ü ��ȯ �米��(�ܱ����)</span></caption>
						<colgroup><col width="80"><col width="*"><col width="90"><col width="40"></colgroup>
						<thead>
							<tr>
								<th>������</th>
								<th>������</th>
								<th>��������</th>
								<th>�ο�</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="11">���������ڿ�����<br>�߼ұ��<br>���ҽþ�<br>��������<br>(�뵿��)</td>
								<td class="coursename">Final Cut Pro����</td>
								<td>01.09 ~ 01.13</td>
								<td>5��</td>
							</tr>
							<tr>
								<td class="coursename">iPhone ���۰���</td>
								<td>01.09 ~ 01.13</td>
								<td>15��</td>
							</tr>
							<tr>
								<td class="coursename">������ ��ȹ�� �ۼ� ���� ����</td>
								<td>02.20 ~ 02.21</td>
								<td>15��</td>
							</tr>
							<tr>
								<td class="coursename">����Ͻ� ��ų�� ����</td>
								<td>02.01 ~ 02.02</td>
								<td>5��</td>
							</tr>
							<tr>
								<td class="coursename">Protools �������</td>
								<td>02.01 ~ 02.02</td>
								<td>5��</td>
							</tr>
							<tr>
								<td class="coursename">�����й̵�� ��ũ�÷ο� ����</td>
								<td>03.12 ~ 03.14</td>
								<td>5��</td>
							</tr>
							<tr>
								<td class="coursename">���� ������ ����� ����</td>
								<td>04.04 ~ 04.06</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">��������ȹ(��ȭ,���,����,�ִ�,����)����</td>
								<td>05.08 ~ 05.10</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">Avid MC 101����</td>
								<td>02.06 ~ 02.10</td>
								<td>5��</td>
							</tr>
							<tr>
								<td class="coursename">Final Cut Pro����</td>
								<td>02.20 ~ 02.24</td>
								<td>5��</td>
							</tr>
							<tr>
								<td class="coursename">��ǥ��, ���۱�, ���̼��� ��� ��� ����</td>
								<td>06.11 ~ 06.15</td>
								<td>10��</td>
							</tr>
							<tr class="division">
								<td rowspan="6">��ȭ������<br>��������</td>
								<td class="coursename">â���� ������ ����߰��� ���� ���̳�</td>
								<td>05.16 ~ 05.17</td>
								<td>15��</td>
							</tr>
							<tr class="division">
								<td class="coursename">�ٹ�ȭ ������ ������ ����</td>
								<td>5�� ��</td>
								<td>15��</td>
							</tr>
							<tr class="division">
								<td class="coursename">������ť���͸� �������� ���̵�</td>
								<td>06.19 ~ 06.20</td>
								<td>20��</td>
							</tr>
							<tr class="division">
								<td class="coursename">OSMU�� ���� �� â�۰���</td>
								<td>09.03 ~ 10.12</td>
								<td>10��</td>
							</tr>
							<tr class="division">
								<td class="coursename">��������, ��ȹ���� �������</td>
								<td>10.16 ~ 10.17</td>
								<td>20��</td>
							</tr>
							<tr class="division">
								<td class="coursename">û�ҳ��� ���� â�ǰ��� ���ǹ̵�� ����</td>
								<td>10�� ��</td>
								<td>15��</td>
							</tr>
						</tbody>
					</table>
					
					<table class="curriculum" cellspacing="0" cellpadding="0">
						<caption class="bgD">3D��ü������ �����η¾缺 ���� : <span>3D��ü������ �ؿܰ��� ��û ��ũ��</span></caption>
						<colgroup><col width="150"><col width="*"><col width="80"></colgroup>
						<thead>
							<tr>
								<th>������</th>
								<th>��������</th>
								<th>����</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>VFX���۹����� ����</td>
								<td class="coursename">�ؿ� ���� ���� ��û�� ���� 3D��ü VFX���̳�</td>
								<td rowspan="3">������������</td>
							</tr>
							<tr class="division">
								<td>S3D Director ��û ��ũ��</td>
								<td class="coursename">��ü������ ȿ������ ��ȹ�� ������ ���� ������ ��û ��ũ��</td>
							</tr>
							<tr>
								<td>S3D �����Ī ���̳�</td>
								<td class="coursename">3D��ü ������ �ؿ� ������ ���� �۷ι� ���� ���̵���� ���̳�</td>
							</tr>
						</tbody>
					</table>
					
					<table class="curriculum" cellspacing="0" cellpadding="0">
						<caption class="bgD">3D��ü������ �����η¾缺 ���� : <span>���к� 3D��ü������ ��ȯ �米��</span></caption>
						<colgroup><col width="150"><col width="*"><col width="120"></colgroup>
						<thead>
							<tr>
								<th>������</th>
								<th>��������</th>
								<th>����</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>�������л� 3D��ü������<br>��ȯ �米�� ����</td>
								<td class="coursename">
									- S3D Terminology<br>
									- 3D Design<br>
									- ��������
								</td>
								<td>���� �� �ܿ����</td>
							</tr>
						</tbody>
					</table>
					<h6>�� �� ������ ���� ���� ���� ����� �����Դϴ�.</h6>
				</li>
				<li class="marginspace">
					<table class="curriculum" cellspacing="0" cellpadding="0">
						<caption class="bgC">����� ���� �米��</caption>
						<colgroup><col width="*"><col width="85"><col width="35"></colgroup>
						<thead>
							<tr>
								<th>������</th>
								<th>��������</th>
								<th>�ο�</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="coursename">Smoke�� Ȱ���� 3D��ü ���� ���� 1��</td>
								<td>04.16 ~ 04.20</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">Avid�� Ȱ���� 3D��ü ���� ���� 1��</td>
								<td>04.23 ~ 04.27</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">���׷����׷��� ���� 1��</td>
								<td>04.23 ~ 04.27</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">3ALITY ���� ��ũ�ϼ� ���� 1��</td>
								<td>05.02 ~ 05.04</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">3D��ü Ư���Կ� ����</td>
								<td>05.14 ~ 05.18</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">P+S Technik ���� ��ũ�ϼ� ���� 1��</td>
								<td>05.14 ~ 05.18</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">Avid�� Ȱ���� 3D��ü ���� ���� 2��</td>
								<td>05.21 ~ 05.25</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">3ALITY Rig Technician Instructor</td>
								<td>05.29 ~ 05.31</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">Nuke�� Ocula�� Ȱ���� 3D��ü �������� ���� 1��</td>
								<td>05.29 ~ 05.31</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">Cinema4D�� Ȱ���� 3D��ü ���� ���� 1��</td>
								<td>06.11 ~ 06.15</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">3D��ü �����Կ� ����</td>
								<td>06.18 ~ 06.22</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">Avid�� Ȱ���� 3D��ü ���� ���� 3��</td>
								<td>06.25 ~ 06.29</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">3D��ü ������ũ��</td>
								<td>06.28 ~ 07.06</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">3ALITY ���� ��ũ�ϼ� ���� 2��</td>
								<td>07.04 ~ 07.06</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">Smoke�� Ȱ���� 3D��ü ���� ���� 2��</td>
								<td>07.09 ~ 07.13</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">Avid�� Ȱ���� 3D��ü ���� ���� 4��</td>
								<td>07.23 ~ 07.27</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">Nuke�� Ocula�� Ȱ���� 3D��ü �������� ���� 2��</td>
								<td>07.30 ~ 08.03</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">Avid�� Ȱ���� 3D��ü ���� ���� 5��</td>
								<td>08.20 ~ 08.24</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">After Effect�� Ȱ���� 3D��ü ��Ǳ׷��� 1��</td>
								<td>08.27 ~ 08.31</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">Nuke�� Ocula�� Ȱ���� 3D��ü �������� ���� 3��</td>
								<td>09.03 ~ 09.07</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">���׷����׷��� ���� 2��</td>
								<td>09.10 ~ 09.14</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">���׵�ķ �Կ� ����</td>
								<td>09.17 ~ 09.21</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">3D��ü ��� ���� ����</td>
								<td>09.24 ~ 09.28</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">3D��ü ��ť���͸� ���� ����</td>
								<td>10.08 ~ 10.12</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">Nuke�� Ocula�� Ȱ���� 3D��ü �������� ���� 4��</td>
								<td>10.08 ~ 10.12</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">�ؿ� ��ũ�� - �������� WETA</td>
								<td>����(��������)</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">Smoke�� Ȱ���� 3D��ü ���� ���� 3��</td>
								<td>10.15 ~ 10.19</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">3D��ü �װ� �Կ� ����</td>
								<td>10.22 ~ 10.26</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">P+S Technik���� ��ũ�ϼ� ���� 2��</td>
								<td>10.29 ~ 10.31</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">After Effect�� Ȱ���� 3D��ü ��Ǳ׷��� 2��</td>
								<td>10.29 ~ 10.31</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">3D��ü �Կ� ����</td>
								<td>11.07 ~ 11.09</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">Nuke�� Ocula�� Ȱ���� 3D��ü �������� ���� 5��</td>
								<td>11.12 ~ 11.16</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">Avid�� Ȱ���� 3D��ü ���� ���� 6��</td>
								<td>11.19 ~ 11.23</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">Frame Forge�� Ȱ���� 3D��ü ���� ����</td>
								<td>12.03 ~ 12.07</td>
								<td>10��</td>
							</tr>
							<tr>
								<td class="coursename">Avid�� Ȱ���� 3D��ü ���� ���� 7��</td>
								<td>12.17 ~ 12.21</td>
								<td>10��</td>
							</tr>
						</tbody>
					</table>
					
					<table class="curriculum" cellspacing="0" cellpadding="0">
						<caption class="bgD">3D��ü������ �����η¾缺 ���� : <span>3D��ü������ ���α׷� ���۰���</span></caption>
						<colgroup><col width="110"><col width="*"><col width="60"></colgroup>
						<thead>
							<tr>
								<th>������</th>
								<th>��������</th>
								<th>����</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>3D��ü ���<br>���α׷�<br>���� ����(4ȸ)</td>
								<td class="coursename">
									- 3D��ü ��� ���� ���, ���̽� ���͵�<br>
									- 3D��ü�� ī�޶� 2K, 4K, �̷����, �䷯����ĵ�<br>&nbsp; &nbsp;�Կ����<br>
									- 3D��ü ������ũ�ϼ�, Editing & Finishing, VFX<br>
									- ���� ��� ���� �ǽ�
								</td>
								<td>����</td>
							</tr>
							<tr class="division">
								<td>3D��ü ��ť���͸�<br>���α׷�<br>���� ����(6ȸ)</td>
								<td class="coursename">
									- 3D��ü ��ť���͸� ����, ���̽� ���͵�<br>
									- 3D��ü ��ť���͸� �۷ι� ������ ��Ȳ<br>
									- 3D��ü Ư�� �Կ� ���, ��ť���͸� 3D Editing ���<br>
									- �ڿ� �ι� ��ť���͸� ���� �ǽ� 
								</td>
								<td>����</td>
							</tr>
						</tbody>
					</table>
					<h6>�� �� ������ ���� ���� ���� ����� �����Դϴ�.</h6>
				--></li>
			</ul>
			<div class="clearL"></div>
		</div>
	</div>
</form>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
