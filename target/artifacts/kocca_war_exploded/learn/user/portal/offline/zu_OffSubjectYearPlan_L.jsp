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

<%@ include file="/learn/user/portal/include/top.jsp"%>
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
<form name = "form1" method = "post">
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
        <td><img src="/images/portal/homepage_renewal/offline/stitle_06.gif" alt="�������� ����" /></td>
        <td class="h_road">Home &gt; �������� ����  &gt; <strong>�������� ����</strong></td>
      </tr>
      <tr>
        <td height="12" colspan="2"></td>
        </tr>
      <tr>
        <td height="1" colspan="2" bgcolor="E5E5E5"></td>
      </tr>
    </table>
    
    
       
<!-- content start -->
<br/>
<p><img src="/images/portal/homepage_renewal/offline/off_title01.gif" alt="������ �ٽ� �η¾缺 ����"></p><br>
   <table width="100%" border="0" cellspacing="0" cellpadding="0">

      <tr>
        <td colspan="2" class="tit_table">������</td>
        <td class="tit_table">��������</td>
        <td class="tit_table">�Ⱓ</td>
        <td class="tit_table_right">�ο�</td>
      </tr>

      <tr>
        <td rowspan="4" class="ct_tit_table">��ۤ�����</td>
        <td class="ct_tit_table_left">VFX (Ư������)</td>
        <td class="ct_tit_table">2012�� 3��~12��</td>
        <td class="ct_tit_table">9����</td>
        <td class="ct_tit_table_right">15��</td>
      </tr>

      <tr>
        <td class="ct_tit_table_left">��� �׷���</td>
        <td class="ct_tit_table">2012�� 3��~12��</td>
        <td class="ct_tit_table">9���� </td>
        <td class="ct_tit_table_right">15��</td>        
      </tr>

      <tr>
        <td class="ct_tit_table_left">������ ��������</td>
        <td class="ct_tit_table">2012�� 3��~8��</td>
        <td class="ct_tit_table">6����</td>
        <td class="ct_tit_table_right">30��</td>        
      </tr>

      <tr>
        <td class="ct_tit_table_left">������ ��������</td>
        <td class="ct_tit_table">2012�� 3��~8��</td>
        <td class="ct_tit_table">6����</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>



      <tr>
        <td rowspan="4" class="ct_tit_table">����</td>
        <td class="ct_tit_table_left">���� ������(��ȹ) </td>
        <td class="ct_tit_table">2012�� 3��~12��</td>
        <td class="ct_tit_table">10����</td>
        <td class="ct_tit_table_right">12��</td>        
      </tr>
      <tr>
        <td class="ct_tit_table_left">���� ���α׷�</td>
        <td class="ct_tit_table">2012�� 3��~12��</td>
        <td class="ct_tit_table">10����</td>
        <td class="ct_tit_table_right">18��</td>        
      </tr>
      <tr>
        <td class="ct_tit_table_left">���� �׷���</td>
        <td class="ct_tit_table">2012�� 3��~12��</td>
        <td class="ct_tit_table"> 10����</td>
        <td class="ct_tit_table_right">15��</td>
        
      </tr>
      <tr>
        <td class="ct_tit_table_left">���� ������Ʈ</td>
        <td class="ct_tit_table">2012�� 3��~12��</td>
        <td class="ct_tit_table"> 10����</td>
        <td class="ct_tit_table_right">30��</td>        
      </tr>



      <tr>
        <td class="ct_tit_table">��ȹ��â��</td>
        <td class="ct_tit_table_left">������ ��ȹâ��</td>
        <td class="ct_tit_table">2012�� 3��~12��</td>
        <td class="ct_tit_table"> 10����</td>
        <td class="ct_tit_table_right">20��</td>        
      </tr>

	  <tr>
        <td class="ct_tit_table">����Ͻ�</td>
        <td class="ct_tit_table_left">���������� ����Ͻ�</td>
        <td class="ct_tit_table">2012�� 3��~11��</td>
        <td class="ct_tit_table"> 9����</td>
        <td class="ct_tit_table_right">15��</td>
      </tr>


      <tr>
        <td rowspan="3" class="ct_tit_table">3D��ü����</td>
        <td class="ct_tit_table_left">Pre-Production(��ȹ/����)</td>
        <td class="ct_tit_table">2012�� 3��~12��</td>
        <td class="ct_tit_table">10����</td>
        <td class="ct_tit_table_right">10��</td>
        
      </tr>

      <tr>
        <td class="ct_tit_table_left">Production(�Կ�)</td>
        <td class="ct_tit_table">2012�� 3��~12��</td>
        <td class="ct_tit_table"> 10����</td>
        <td class="ct_tit_table_right">15��</td>
        
      </tr>

      <tr>
        <td class="ct_tit_table_left">Post-Production(����/VFX)</td>
        <td class="ct_tit_table">2012�� 3��~12��</td>
        <td class="ct_tit_table"> 10����</td>
        <td class="ct_tit_table_right">20��</td>
        
      </tr>


      <tr>
        <td height="1" colspan="5" bgcolor="#CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="5" bgcolor="#F7F7F7"></td>
      </tr>

    </table>


<br><br>
<p><img src="/images/portal/homepage_renewal/offline/off_title02.gif" alt="����� ���� �米��"></p><br>

  <table width="100%" border="0" cellspacing="0" cellpadding="0">

      <tr>
        <td class="tit_table">����</td>
        <td class="tit_table">������</td>
        <td class="tit_table">��������</td>
        <td class="tit_table_right">�ο�</td>        
      </tr>

      <tr>
        <td rowspan="11" class="ct_tit_table">���������ڿ�����<br>
�߼ұ��<br>
���ҽþ�<br>
��������<br>
(�뵿��)<br>
</td>
        <td class="ct_tit_table_left">Final Cut Pro����</td>
        <td class="ct_tit_table">01.09 ~ 01.13</td>
        <td class="ct_tit_table_right">5��</td>        
      </tr>

      <tr>
        <td class="ct_tit_table_left">iPhone ���۰���</td>
        <td class="ct_tit_table">01.09 ~ 01.13</td>
        <td class="ct_tit_table_right">15��</td>
        
      </tr>

      <tr>
        <td class="ct_tit_table_left">������ ��ȹ�� �ۼ� ����  ����</td>
        <td class="ct_tit_table">02.20 ~ 02.21</td>
        <td class="ct_tit_table_right">15��</td>        
      </tr>

	  <tr>
        <td class="ct_tit_table_left">����Ͻ� ��ų�� ����</td>
        <td class="ct_tit_table">02.01 ~ 02.02</td>
        <td class="ct_tit_table_right">5��</td>        
      </tr>


      <tr>
        <td class="ct_tit_table_left">Protools �������</td>
        <td class="ct_tit_table">02.13 ~ 02.17</td>
        <td class="ct_tit_table_right">5��</td>        
      </tr>


	  <tr>
        <td class="ct_tit_table_left">�����й̵�� ��ũ�÷ο� ����</td>
        <td class="ct_tit_table">03.12 ~ 03.14</td>
        <td class="ct_tit_table_right">5��</td>        
      </tr>

      <tr>
        <td class="ct_tit_table_left">���� ������ ����� ����</td>
        <td class="ct_tit_table">04.04 ~ 04.06</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>

      <tr>
        <td class="ct_tit_table_left">��������ȹ(��ȭ,���,����,�ִ�,����)����</td>
        <td class="ct_tit_table">05.08 ~ 05.10</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>

	  <tr>
        <td class="ct_tit_table_left">Avid MC 101����</td>
        <td class="ct_tit_table">02.06 ~ 02.10</td>
        <td class="ct_tit_table_right">5��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">Final Cut Pro����</td>
        <td class="ct_tit_table">02.20 ~ 02.24</td>
        <td class="ct_tit_table_right">5��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">��ǥ��, ���۱�, ���̼���  ��� ��� ����</td>
        <td class="ct_tit_table">06.11 ~ 06.15</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>

      <tr>
        <td rowspan="6" class="ct_tit_table">��ȭ������<br>��������
		</td>
        <td class="ct_tit_table_left">â���� ������ ����߰��� ���� ���̳�</td>
        <td class="ct_tit_table">05.16 ~ 05.17</td>
        <td class="ct_tit_table_right">15��</td>        
      </tr>

	  <tr>
        <td class="ct_tit_table_left">�ٹ�ȭ ������ ������ ����</td>
        <td class="ct_tit_table">5�� ��</td>
        <td class="ct_tit_table_right">15��</td>
      </tr>
	  <tr>
        <td class="ct_tit_table_left">������ť���͸� �������� ���̵�</td>
        <td class="ct_tit_table">06.19 ~ 06.20</td>
        <td class="ct_tit_table_right">20��</td>
      </tr>
	  <tr>
        <td class="ct_tit_table_left">OSMU�� ���� �� â�۰���</td>
        <td class="ct_tit_table">09.03 ~ 10.12</td>
        <td class="ct_tit_table_right">10��</td>
      </tr>
	  <tr>
        <td class="ct_tit_table_left">��������, ��ȹ���� �������</td>
        <td class="ct_tit_table">10.16 ~ 10.17</td>
        <td class="ct_tit_table_right">20��</td>
      </tr>
	  <tr>
        <td class="ct_tit_table_left">û�ҳ��� ���� â�ǰ��� ���ǹ̵�� ����</td>
        <td class="ct_tit_table">10�� ��</td>
        <td class="ct_tit_table_right">15��</td>
      </tr>

      <tr>
        <td height="1" colspan="5" bgcolor="#CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="5" bgcolor="#F7F7F7"></td>
      </tr>

    </table>


<br><br>
<p><img src="/images/portal/homepage_renewal/offline/off_title03.gif" alt="3D��ü������ �����η¾缺 ����"></p>
<p style="padding:35px 0px 10px 10px;">
	<img src="/images/portal/homepage_renewal/offline/off_dot.gif"><b style="padding-left:5px; color:#5f7292; font-size:13px;">������ ��� 3D��ü ��ȯ �米��(�ܱ����)</b>
</p>


<table width="100%" border="0" cellspacing="0" cellpadding="0">

      <tr>        
        <td colspan="2" class="tit_table">������</td>
        <td class="tit_table">��������</td>
        <td class="tit_table_right">�ο�</td>        
      </tr>

      <tr>
        <td rowspan="35" class="ct_tit_table">3D��ü������<br>�����η¾缺</td>
        <td class="ct_tit_table_left">Smoke�� Ȱ���� 3D��ü ���� ���� 1��</td>
        <td class="ct_tit_table">04.16  ~ 04.20</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
      <tr>
        <td class="ct_tit_table_left">Avid�� Ȱ���� 3D��ü ���� ���� 1��</td>
        <td class="ct_tit_table">04.23  ~ 04.27</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
      <tr>
        <td class="ct_tit_table_left">���׷����׷��� ���� 1��</td>
        <td class="ct_tit_table">04.23  ~ 04.27</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">3ALITY ���� ��ũ�ϼ� ���� 1��</td>
        <td class="ct_tit_table">05.02  ~ 05.04</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
      <tr>
        <td class="ct_tit_table_left">3D��ü Ư���Կ� ����</td>
        <td class="ct_tit_table">05.14  ~ 05.18</td>
        <td class="ct_tit_table_right">10��</td>
      </tr>
	  <tr>
        <td class="ct_tit_table_left">P+S Technik ���� ��ũ�ϼ� ���� 1��</td>
        <td class="ct_tit_table">05.14  ~ 05.18</td>
        <td class="ct_tit_table_right">10��</td>
      </tr>
	  <tr>
        <td class="ct_tit_table_left">Avid�� Ȱ���� 3D��ü ���� ���� 2��</td>
        <td class="ct_tit_table">05.21  ~ 05.25</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">3ALITY Rig Technician Instructor</td>
        <td class="ct_tit_table">05.29  ~ 05.31</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">Nuke�� Ocula�� Ȱ���� 3D��ü �������� ���� 1��</td>
        <td class="ct_tit_table">05.29  ~ 05.31</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">Cinema4D��  Ȱ���� 3D��ü ���� ���� 1��</td>
        <td class="ct_tit_table">06.11  ~ 06.15</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">3D��ü �����Կ� ����</td>
        <td class="ct_tit_table">06.18  ~ 06.22</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">Avid�� Ȱ���� 3D��ü ���� ���� 3��</td>
        <td class="ct_tit_table">06.25  ~ 06.29</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">3D��ü ������ũ��</td>
        <td class="ct_tit_table">06.28  ~ 07.06</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">3ALITY ���� ��ũ�ϼ� ���� 2��</td>
        <td class="ct_tit_table">07.04  ~ 07.06</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">Smoke�� Ȱ���� 3D��ü ���� ���� 2��</td>
        <td class="ct_tit_table">07.09  ~ 07.13</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">Avid�� Ȱ���� 3D��ü ���� ���� 4��</td>
        <td class="ct_tit_table">07.23  ~ 07.27</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">Nuke�� Ocula�� Ȱ���� 3D��ü �������� ���� 2��</td>
        <td class="ct_tit_table">07.30  ~ 08.03</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">Avid��  Ȱ���� 3D��ü ���� ���� 5��</td>
        <td class="ct_tit_table">08.20  ~ 08.24</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">After Effect�� Ȱ���� 3D��ü ��Ǳ׷��� 1��</td>
        <td class="ct_tit_table">08.27  ~ 08.31</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">Nuke��  Ocula�� Ȱ���� 3D��ü �������� ���� 3��</td>
        <td class="ct_tit_table">09.03  ~ 09.07</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">���׷����׷��� ���� 2��</td>
        <td class="ct_tit_table">09.10  ~ 09.14</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">���׵�ķ �Կ� ����</td>
        <td class="ct_tit_table">09.17  ~ 09.21</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">3D��ü ��� ���� ����</td>
        <td class="ct_tit_table">09.24  ~ 09.28</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">3D��ü  ��ť���͸� ���� ����</td>
        <td class="ct_tit_table">10.08  ~ 10.12</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">Nuke�� Ocula�� Ȱ���� 3D��ü �������� ���� 4��</td>
        <td class="ct_tit_table">10.08  ~ 10.12</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">�ؿ� ��ũ�� - �������� WETA</td>
        <td class="ct_tit_table">����(��������)</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">Smoke�� Ȱ���� 3D��ü ���� ���� 3��</td>
        <td class="ct_tit_table">10.15  ~ 10.19</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">3D��ü �װ� �Կ� ����</td>
        <td class="ct_tit_table">10.22  ~ 10.26</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">P+S Technik���� ��ũ�ϼ� ���� 2��</td>
        <td class="ct_tit_table">10.29  ~ 10.31</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">After Effect�� Ȱ���� 3D��ü ��Ǳ׷��� 2��</td>
        <td class="ct_tit_table">10.29  ~ 10.31</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">3D��ü  �Կ� ����</td>
        <td class="ct_tit_table">11.07  ~ 11.09</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">Nuke�� Ocula�� Ȱ���� 3D��ü �������� ���� 5��</td>
        <td class="ct_tit_table">11.12  ~ 11.16</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">Avid�� Ȱ���� 3D��ü ���� ���� 6��</td>
        <td class="ct_tit_table">11.19  ~ 11.23</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">Frame  Forge�� Ȱ���� 3D��ü ���� ����</td>
        <td class="ct_tit_table">12.03  ~ 12.07</td>
        <td class="ct_tit_table_right">10��</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table_left">Avid�� Ȱ���� 3D��ü ���� ���� 7��</td>
        <td class="ct_tit_table">12.17  ~ 12.21</td>
        <td class="ct_tit_table_right">10��</td>
      </tr>



      <tr>
        <td height="1" colspan="5" bgcolor="#CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="5" bgcolor="#F7F7F7"></td>
      </tr>

    </table>

<p style="padding:45px 0px 10px 10px;">
	<img src="/images/portal/homepage_renewal/offline/off_dot.gif"><b style="padding-left:5px; color:#5f7292; font-size:13px;">3D��ü������ �ؿܰ��� ��û ��ũ��</b>
</p>
<table width="100%" border="0" cellspacing="0" cellpadding="0">

      <tr>
        <td class="tit_table">������</td>
        <td class="tit_table">��������</td>
        <td class="tit_table_right">����</td>
      </tr>

      <tr>
        <td class="ct_tit_table">VFX���۹����� ����</td>
        <td class="ct_tit_table_left">�ؿ� ���� ���� ��û�� ���� 3D��ü VFX���̳�</td>
        <td rowspan="3" class="ct_tit_table_right">������������</td>        
      </tr>
      <tr>
		<td class="ct_tit_table">S3D Director ��û ��ũ��</td>
        <td class="ct_tit_table_left">��ü������ ȿ������ ��ȹ�� ������ ���� ������ ��û ��ũ��</td>           
      </tr>
      <tr>
	    <td class="ct_tit_table">S3D �����Ī ���̳�</td>
        <td class="ct_tit_table_left">3D��ü ������ �ؿ� ������ ���� �۷ι� ���� ���̵���� ���̳�</td>        
      </tr>

      <tr>
        <td height="1" colspan="3" bgcolor="#CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="3" bgcolor="#F7F7F7"></td>
      </tr>

    </table>

<p style="padding:45px 0px 10px 10px;">
	<img src="/images/portal/homepage_renewal/offline/off_dot.gif"><b style="padding-left:5px; color:#5f7292; font-size:13px;">���к� 3D��ü������ ��ȯ �米��</b>
</p>


<table width="100%" border="0" cellspacing="0" cellpadding="0">

      <tr>
        <td class="tit_table">������</td>
        <td class="tit_table">��������</td>
        <td class="tit_table_right">����</td>
      </tr>
      <tr>
        <td class="ct_tit_table">�������л� 3D��ü������<br>��ȯ �米�� ����</td>
        <td class="ct_tit_table_left">
			-S3D Terminology<br>
			-3D Design<br>
			-��������<br>
		</td>
        <td class="ct_tit_table_right">���� �� �ܿ����</td>        
      </tr>

      <tr>
        <td height="1" colspan="3" bgcolor="#CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="3" bgcolor="#F7F7F7"></td>
      </tr>

    </table>
	<p style="color:#5f7292; font-size:12px;">�� �� ������ ���� ���� ���� ����� �����Դϴ�.</p>

<p style="padding:45px 0px 10px 10px;">
	<img src="/images/portal/homepage_renewal/offline/off_dot.gif"><b style="padding-left:5px; color:#5f7292; font-size:13px;">3D��ü������ ���α׷� ���۰���</b>
</p>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="tit_table">������</td>
        <td class="tit_table">��������</td>
        <td class="tit_table_right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      </tr>
      <tr>
        <td class="ct_tit_table">3D��ü ���<br>���α׷� ����  ����(4ȸ)</td>
        <td class="ct_tit_table_left">
			-3D��ü ��� ���� ���, ���̽� ���͵�<br>
			-3D��ü�� ī�޶� 2K, 4K, �̷����, �䷯����ĵ� �Կ����<br>
			-3D��ü ������ũ�ϼ�, Editing & Finishing, VFX<br>
			-���� ��� ���� �ǽ�
		</td>
        <td class="ct_tit_table_right">����</td>        
      </tr>
	  <tr>
        <td class="ct_tit_table">3D��ü ��ť���͸�<br>���α׷� ���� ����(6ȸ)</td>
        <td class="ct_tit_table_left">
			-3D��ü ��ť���͸� ����, ���̽� ���͵�<br>
			-3D��ü ��ť���͸� �۷ι� ������ ��Ȳ<br>
			-3D��ü Ư�� �Կ� ���, ��ť���͸� 3D Editing ���<br>
			-�ڿ� �ι� ��ť���͸� ���� �ǽ�
		</td>
        <td class="ct_tit_table_right">����</td>        
      </tr>

      <tr>
        <td height="1" colspan="3" bgcolor="#CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="3" bgcolor="#F7F7F7"></td>
      </tr>
   </table>
	<p style="color:#5f7292; font-size:12px;">�� �� ������ ���� ���� ���� ����� �����Դϴ�.</p><br>
	<!-- content end -->
    <!--Ÿ��Ʋ�κ�//-->
    
    </td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
      		      
		      </tr>		
		</table>
    
            
      
     
      <%}else{ %>      
      
            <h2><img src="/images/portal/online/h2_tit5.gif" alt="������������" class="fl_l" /><p class="category">Home > �������ΰ��� > <strong>������������</strong></p></h2>                                     
                                                                                                                                                                                                 
            <p><img src="/images/portal/online/year_txt.gif" alt="�¶��� ���� �������������Դϴ�. ������������ Ŭ���Ͻø� ���������� ���� �� ������, ���� Ŭ���Ͻø� �ش���� ���������� ���� �� �ֽ��ϴ� " /></p>

            <ul class="tabwrap mg_t30">
            <%  if(upperList != null && upperList.size() > 0) {
                    for(int i = 0 ; i < upperList.size() ; i++){ 
                           DataBox dbox = upperList.get(i); %>
                <li><a <%=v_upperclass.equals(dbox.get("d_upperclass")) ?  "class=\"tab_online tab_online_on\"" : "href=\"javascript:moveTab('"+dbox.get("d_upperclass")+"');\" class=\"tab_online\""%>><span><%=dbox.get("d_classname") %></span></a></li>
            <%      if(v_upperclass.equals(dbox.get("d_upperclass"))) v_classname =  dbox.get("d_classname");
                    }
                } %>
            </ul>
            
            <p class="board_top_search">
                <img src="/images/portal/board/serbox_category.gif"> <kocca_select:select name="p_middleclass" sqlNum="off.0003"  param="<%= v_upperclass %>"
                                                    onChange="changeYear()" styleClass="mg_r12" attr=" " selectedValue="<%= v_middleclass %>" isLoad="true" all="true" />
                <img src="/images/portal/board/serbox_year.gif  ">
                    <select name="p_year" class="mg_r12" onchange="changeYear();">
                        <option value="<%=Integer.parseInt(currentYear)+1 %>" <%=v_gyear.equals(""+(Integer.parseInt(currentYear)+1)) ? "selected" : ""%>><%=Integer.parseInt(currentYear)+1 %></option>
                        <option value="<%=currentYear %>"   <%=v_gyear.equals(currentYear) ? "selected" : ""%>><%=currentYear %></option>
                        <option value="<%=Integer.parseInt(currentYear)-1 %>" <%=v_gyear.equals(""+(Integer.parseInt(currentYear)-1)) ? "selected" : ""%>><%=Integer.parseInt(currentYear)-1 %></option>
                    </select>
            </p>
            
            <table class="row_list_prg" >
            <colgroup>
                <col width="138px" />
                <col width="45px" />
                <col width="45px" />
                <col width="45px" />
                <col width="45px" />
                <col width="45px" />
                <col width="45px" />
                <col width="45px" />
                <col width="45px" />
                <col width="45px" />
                <col width="49px" />
                <col width="49px" />
                <col width="49px" />
            </colgroup>
            <thead>
            <tr>
                <th>��������<br /><span class="stit">(�� <%=subCnt %>�� ����)</span></th>
                <th><a href="javascript:moveMonthList('01');" class="btn_wred"><span>1��</span></a></th>
                <th><a href="javascript:moveMonthList('02');" class="btn_wred"><span>2��</span></a></th>
                <th><a href="javascript:moveMonthList('03');" class="btn_wred"><span>3��</span></a></th>
                <th><a href="javascript:moveMonthList('04');" class="btn_wred"><span>4��</span></a></th>
                <th><a href="javascript:moveMonthList('05');" class="btn_wred"><span>5��</span></a></th>
                <th><a href="javascript:moveMonthList('06');" class="btn_wred"><span>6��</span></a></th>
                <th><a href="javascript:moveMonthList('07');" class="btn_wred"><span>7��</span></a></th>
                <th><a href="javascript:moveMonthList('08');" class="btn_wred"><span>8��</span></a></th>
                <th><a href="javascript:moveMonthList('09');" class="btn_wred"><span>9��</span></a></th>
                <th><a href="javascript:moveMonthList('10');" class="btn_wred"><span>10��</span></a></th>
                <th><a href="javascript:moveMonthList('11');" class="btn_wred"><span>11��</span></a></th>
                <th><a href="javascript:moveMonthList('12');" class="btn_wred"><span>12��</span></a></th>
            </tr>
            </thead>
            <tbody>
            <%
            if(listSize > 0 ) {
            	String temp_subjseq = "1";
            	String temp_seq = "1";
	            for(int i = 0; i < listSize;) {
	                DataBox dbox = (DataBox)offSchlYearPlanList.get(i);
	
	                v_subj           = dbox.getString("d_subj");        
	                v_year           = dbox.getString("d_year");
	                v_subjnm         = dbox.getString("d_subjnm");  
	                v_upperclass     = dbox.getString("d_upperclass");
                	
                	v_subj_cnt       = dbox.getInt("d_subj_cnt");
                	
                	v_menuid = upperMap !=null && upperMap.get(v_upperclass) != null ?  upperMap.get(v_upperclass) : "00";
                	
                	// ������ ������û ������ ������ SEQ�� ��ũ, ������û ������ ������ ������ 1,1 �� ����
                	if(dbox.getString("d_status").equals("Y")) {
                		temp_subjseq = dbox.getString("d_subjseq");
                		temp_seq = dbox.getString("d_seq");
                	}

	        %>
	        <tr>
                <td class="ta_l"><a href="javascript:whenSubjInfo('<%=v_subj %>', '<%=temp_subjseq %>', '<%=temp_seq %>', '<%=v_menuid %>')"><%=v_subjnm %></a></td>
            <%  for(int k = 1 ; k <= 12 ; k++){ %>
                <td class="data<%=k == 1 || k%2 == 1 ?  " board_bg" : ""%>">
	        <%        
	                for(int j = 0 ; j < v_subj_cnt ; j++){
	                	dbox = (DataBox)offSchlYearPlanList.get(i+j);
	                	v_month_cnt   = dbox.getInt("d_month_"+(k < 10 ? "0"+k : "k")+"_cnt");
	                	if(v_month_cnt != 0) {
	                		v_status         = dbox.getString("d_status");
	                		v_edustart       = dbox.getString("d_edustart");    
	                        v_eduend         = dbox.getString("d_eduend");   
	                        v_subjseq        = dbox.getString("d_subjseq");
	                        v_seq            = dbox.getString("d_seq");
	                        if(v_status.equals("Y")) {
	                        	if( !box.getSession("userid").equals("") ) {
	                            	v_status = "<a href=\"javascript:whenSubjPropose('"+v_subj+"','"+v_year+"','"+v_subjseq+"','"+v_subjnm+"','"+v_seq+"')\" class=\"board_btn\"><span class=\"pd_l6 pd_r5\">��û</span></a>";
	                        	} else {
	                        		v_status = "<a href=\"javascript:alert('�α����� �̿��ϽǼ� �ֽ��ϴ�.')\" class=\"board_btn\"><span class=\"pd_l6 pd_r5\">��û</span></a>";
	                        	}
	                        } else {
	                            v_status = "";
	                        }
	                        
	                        int v_edustartMonth = Integer.parseInt(v_edustart.substring(4,6));
	                        int v_edustartDay = Integer.parseInt(v_edustart.substring(6,8));
	                        
	                        int v_eduendYear = Integer.parseInt(v_eduend.substring(0,4));
	                        int v_eduendMonth = Integer.parseInt(v_eduend.substring(4,6));
	                        int v_eduendDay = Integer.parseInt(v_eduend.substring(6,8));
	                        
	                        if(v_eduendYear > Integer.parseInt(v_year)){
	                        	v_eduend  = v_eduendMonth+"."+ v_eduendDay;
	                        } else if(v_eduendMonth > v_edustartMonth){
	                        	v_eduend  = v_eduendMonth+"."+ v_eduendDay;
	                        } else {
	                        	v_eduend = ""+v_eduendDay;
	                        }
	                        
	                        v_edustart = ""+v_edustartDay;
	                        
	                		v_edustart  = "<p"+(j > 0 ? "  class=\"mg_t20\"" : "")+" style='margin-top:0px;font-size:8px;'>"+v_edustart+"~"+v_eduend+"</p>";
	                		out.println(v_edustart+v_status);
	                	}
	                }
            %>
                </td>
            <% }  %>
            </tr>
            <% i += v_subj_cnt;
                }
            } else { %>
              <tr>
                <td colspan="13">��ϵ� ������ �����ϴ�</td>
              </tr>
            <%  } %>
            </tbody>
            </table>
            
            <%} %>
            
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->