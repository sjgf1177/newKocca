<%
//**********************************************************
//  1. ��      ��: �������� ������û ���� ��� ���
//  2. ���α׷���: gu_ProposeOffHistory_L.jsp
//  3. ��      ��: �������μ�����û Ȯ�� ��� ���
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009. 12. 14
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
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

	box.put("topmenu","2");
	box.put("submenu","3");

    String  v_process   	= box.getString("p_process");
    String  v_user_id   	= box.getSession("userid");
    String  v_tem_grcode	= box.getSession("tem_grcode");
    String  v_upperclass	= box.getString("v_upperclass");
        
	String	v_tid			= "";
	String	v_subj			= "";
	String	v_year			= "";
    String	v_subjseq		= "";
    String	v_seq			= "";
    String	v_subjnm		= "";
    String	v_edustart		= "";
    String	v_eduend		= "";
    String	v_appdate		= "";
    String	v_classname		= "";
	String	v_refundabledate= "";
    String	v_refundableyn	= "";
    String	v_refundyn		= "";
    String	v_canceldate	= "";
    String	v_paymethod		= "";
    String	v_chkfirst		= "";
    String	v_chkfinal		= "";
    String	v_accept_state	= "";
    String	v_rank			= "";
    String	v_cancelableyn	= "";
    String	v_refunddate	= "";
    double	v_biyong		= 0;
    int		v_rowspan		= 0;

    int     i           =  0;
    int     l           =  0;

    ArrayList list1     = null;
    //DEFINED class&variable END
    
    int v_pagesize = box.getInt("p_pagesize");
	int	 v_totalrowcount =  0;
	
	 int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0, v_tabseq = 0;

    // ����¡����
    int row      = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int v_pageno = box.getInt("p_pageno");   

	    

    list1 = (ArrayList)request.getAttribute("ProposeOffHistoryList");
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="javascript">
<!--
	//�˻����뿡 �´� ����Ʈ �������� �̵�
	function selectList() {
    	document.form1.action = "/servlet/controller.study.MyClassServlet";
    	document.form1.p_process.value = "ProposeOffHistoryPage";
    	document.form1.submit();
	}

	//������û �����˾�
	function payApply(p_listgubun, p_subj, p_year, p_subjseq, p_seq){
	    window.self.name = "winProposePage";
	    farwindow = window.open("", "openWinPayApply", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 780, height = 800, top=0, left=0");
		document.form1.p_listgubun.value = p_listgubun;
		document.form1.p_subj.value = p_subj;
		document.form1.p_year.value = p_year;
		document.form1.p_subjseq.value = p_subjseq;
		document.form1.p_seq.value = p_seq;
	    document.form1.target = "openWinPayApply"
		document.form1.action = "/inicis/plugin_check_new_off.jsp";
	    document.form1.submit();
	
	    farwindow.window.focus();
	    document.form1.target = window.self.name;
	}

	//�������
	function cancelPropose(p_tid, p_paymethod){

	    if(!confirm("������ ����Ͻðڽ��ϱ�?\n������û����� ���������� ��ҵ˴ϴ�.")){
	        return;
	    }
	   		
	    document.form1.target = "_self"
	    document.form1.p_tid.value = p_tid;
	    document.form1.p_paymethod.value = p_paymethod;
		document.form1.p_process.value = 'CancelOffPropose';
	    document.form1.action = "/servlet/controller.study.MyClassServlet";
	    document.form1.submit();
	}
	
	//������û ��� �˾�
	function cancelApply(p_tid, p_paymethod){
	    window.self.name = "winProposePage";
	    farwindow = window.open("", "openWinCancelApply", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 550, height = 400, top=0, left=0");
	    document.form1.target = "openWinCancelApply"
	    document.form1.p_tid.value = p_tid;
	    document.form1.p_paymethod.value = p_paymethod;
		document.form1.p_process.value = 'ProposeOffCancelApplyPage';
	    document.form1.action = "/servlet/controller.study.MyClassServlet";
	    document.form1.submit();

	    farwindow.window.focus();
	    document.form1.target = window.self.name;
	}

    //�������(��û�� �ϰ� �����̳� ���簡 ���°��
	function cancelApplyFirst(v_subj,v_year,v_subjseq,v_seq){
        if(!confirm("������ ����Ͻðڽ��ϱ�?")){
	        return;
	    }
        document.form1.target = "_self"
	    document.form1.p_tid.value = "";
	    document.form1.p_paymethod.value = "";
        document.form1.p_listgubun.value = "PROP";
		document.form1.p_subj.value = v_subj;
		document.form1.p_year.value = v_year;
		document.form1.p_subjseq.value = v_subjseq;
		document.form1.p_seq.value = v_seq;
		document.form1.p_process.value = 'ProposeOffCancelFirst';
	    document.form1.action = "/servlet/controller.study.MyClassServlet";
	    document.form1.submit();
	}

//������û��������
function updatePropose(subj,year,subjseq, subjnm) {
	if(<%= box.getSession("userid").length()==0 %>) {
		alert("�α����� �ʿ��մϴ�.");
		return;
	}

	var new_Open = window.open("","proposeWindow",'scrollbars=yes,width=800,height=600,resizable=no');
	document.form1.p_process.value = "UpdateSubjectEduProposePage";
	document.form1.target = "proposeWindow";
	document.form1.p_subj.value = subj;
	document.form1.p_year.value = year;
	document.form1.p_subjseq.value = subjseq;
	document.form1.action = "/servlet/controller.off.ProposeOffServlet";
	document.form1.submit();
	document.form1.target = "_self";
}

//������ �̵�
function goPage(pageNum) {

	document.form1.p_pageno.value = pageNum;
	document.form1.action = "/servlet/controller.study.MyClassServlet";
	document.form1.p_process.value = "ProposeOffHistoryPage";
	document.form1.submit();

}
    
//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name= "form1" method= "post" action="">
    <input type='hidden' name='p_process'  >
    <input type='hidden' name='p_userid'   >
    <input type='hidden' name='p_subj'     >
    <input type='hidden' name='p_year'     >
    <input type='hidden' name='p_subjseq'  >
    <input type='hidden' name='p_seq'      >
    <input type='hidden' name='p_subjnm'   >
    <input type='hidden' name='p_tid'	   >
    <input type='hidden' name='p_paymethod'>
    <input type='hidden' name='p_listgubun'>
    <input type="hidden" name="p_pageno" value="<%= v_pageno %>">
	<input type="hidden" name="p_pagesize"  value="<%=v_pagesize%>">
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagetitle"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > ���ǰ��ǽ� ><u>������û Ȯ��/���</u></td>
			</tr>
		</table>
		<div class="concept a03">
			<div class="titlemsg"><img src="/images/2012/sub/page1/title/learning_request.gif" alt="������û Ȯ��/���"></div>
			<ul class="pagetab">
				<li><a href="/servlet/controller.study.MyClassServlet?p_process=ProposeHistoryPage" tabindex="171" title="ȸ������ �¶��� ������û ������ Ȯ���� �� �ֽ��ϴ�"><img src="/images/2012/sub/page1/tabmenu/online_off.png" alt="�¶��ΰ���"></a></li>
				<li><img src="/images/2012/sub/page1/tabmenu/offline_on.png" alt="�������ΰ���"></li>
			</ul>
		</div>
		<div class="myclass">
			<div class="classtip">
				<h6><img src="/images/2012/sub/icon_dot.png" alt="dot"> ��<span>������ ������ ��� ��������� ��ȸ/���� > �������ΰ���</span>������ ������ �Ϸ��ϼž� ������û�� �Ϸ�˴ϴ�.</h6>
				<h6><img src="/images/2012/sub/icon_dot.png" alt="dot"> ������ ������ ��� 1�� ���� ��, �����մϴ�. <a href="/servlet/controller.study.MyClassBillServlet?p_process=MyOffClassBillListPage" tabindex="172" title="���� �ٷΰ���"><u>�������� �����ϱ�</u></a></h6>
			</div>
			<div class="listbar">
				<table class="listrable" cellpadding="0" cellspacing="0">
					<colgroup><col width="*"><col width="80"><col width="140"><col width="80"><col width="70"><col width="75"><col width="75"></colgroup>
					<tr class="listhead">
						<th>������</th>
						<th>������(��)</th>
						<th>�����Ⱓ</th>
						<th>������û��</th>
						<th>���λ���</th>
						<th>��������</th>
						<th>���</th>
					</tr>
					
					<%
						if(list1 != null)
						{
							for(i = 0; i < list1.size(); i++)
							{
								DataBox dbox = (DataBox)list1.get(i);
							   
								v_tid			= dbox.getString("d_tid");
								v_subj			= dbox.getString("d_subj");
								v_year			= dbox.getString("d_year");
								v_subjseq		= dbox.getString("d_subjseq");
								v_seq			= dbox.getString("d_seq");
								v_subjnm		= dbox.getString("d_subjnm");
								v_edustart		= dbox.getString("d_edustart");
								v_eduend		= dbox.getString("d_eduend");
								v_appdate		= dbox.getString("d_appdate");
								v_classname		= dbox.getString("d_classname");
								v_refundabledate= dbox.getString("d_refundabledate");
								v_refundableyn	= dbox.getString("d_refundableyn");
								v_refundyn		= dbox.getString("d_refundyn");
								v_canceldate	= dbox.getString("d_canceldate");
								v_paymethod		= dbox.getString("d_paymethod");
								v_chkfirst		= dbox.getString("d_chkfirst");
								v_chkfinal		= dbox.getString("d_chkfinal");
								v_rank			= dbox.getString("d_rank");
								v_cancelableyn	= dbox.getString("d_cancelableyn");
								v_refunddate	= dbox.getString("d_refunddate");
								v_rowspan		= dbox.getInt("d_rowspan");
								v_biyong		= dbox.getDouble("d_biyong");
				
								v_edustart		= FormatDate.getFormatDate(v_edustart,"yyyy.MM.dd");
								v_eduend		= FormatDate.getFormatDate(v_eduend,"yyyy.MM.dd");
								v_appdate		= FormatDate.getFormatDate(v_appdate,"yyyy.MM.dd");
								v_refundabledate= FormatDate.getFormatDate(v_refundabledate,"yyyy.MM.dd");
								v_canceldate	= FormatDate.getFormatDate(v_canceldate,"yyyy.MM.dd");
								v_refunddate	= FormatDate.getFormatDate(v_refunddate,"yyyy.MM.dd");
								
								v_dispnum	= dbox.getInt("d_dispnum");
						        v_totalpage	= dbox.getInt("d_totalpage");
								
								if ("U".equals(v_chkfirst) && "U".equals(v_chkfinal)) {
				//					v_accept_state	= "��ǥ���";
									v_accept_state	= "��ó��";
								} else if ("Y".equals(v_chkfirst) && "U".equals(v_chkfinal)) {
				//					v_accept_state	= "�����հ�";
									v_accept_state	= "1������";
								} else if ("Y".equals(v_chkfirst) && "N".equals(v_chkfinal)) {
									v_accept_state	= "�������հ�";
								} else if ("Y".equals(v_chkfirst) && "Y".equals(v_chkfinal)) {
				//					v_accept_state	= "�հ�";
									v_accept_state	= "��������";
								} else if ("N".equals(v_chkfirst) && "U".equals(v_chkfinal)) {
				//					v_accept_state	= "���հ�";
									v_accept_state	= "�̽���";
								}
				%>
					
					
					<tr class="listmiddle" onmouseover="this.style.background='#fbfbfb'" onmouseout="this.style.background=''">
						<td class="linefirst title"><%= v_subjnm %></td>
						<td><%if(v_biyong == 0){%>����<%}else{%><%= new java.text.DecimalFormat("###,###,##0").format(v_biyong) %><%} %></td>
						<td><%= v_edustart %> ~ <%= v_eduend %></td>
						<td><%if(!v_appdate.equals("")){%><%= v_appdate %><%}else{ %>&nbsp;<%} %></td>
						<td><%if(!v_accept_state.equals("")){ %><%= v_accept_state %><%}else{ %>&nbsp;<%} %></td>
						<td>
							<%
								if ("".equals(v_tid) && "N".equals(v_refundyn) && "Y".equals(v_chkfirst) && "U".equals(v_chkfinal)) {
							%>
				            	<a href="javascript:payApply('PROP','<%= v_subj %>','<%= v_year %>','<%= v_subjseq %>','<%= v_seq %>')" tabindex="<%="2"+i+"1"%>">
				                  	<img src="/images/portal/homepage_renewal/myclass/btn_off_pay.jpg" alt="�����ϱ�">
				                  </a>
							<%
								} else if (!"".equals(v_tid) && "N".equals(v_refundyn)) {
							%>
							                 �����Ϸ�
							<%
								} else if ("Y".equals(v_refundyn)) {
							%>
							                  ȯ�ҿϷ�
							<%
								}
							%>
						</td>
						<td>
							<%
							            if (!"".equals(v_tid) && "N".equals(v_refundyn) && "Y".equals(v_refundableyn)) {
							            	if (!"".equals(dbox.getString("d_canceldate"))) {
							%>
							             <span class="fc_96"> ��ҿ�û��</span><br><%= v_canceldate %>
							<%                	
											} else {
													if ("Y".equals(v_cancelableyn)) {
							%>
							              <a href="javascript:cancelPropose('<%= v_tid %>','<%= v_paymethod %>')" tabindex="<%="2"+i+"2"%>" title="������û�� ����մϴ�">
							              	<img src="/images/portal/homepage_renewal/myclass/btn_off_cancel.jpg" alt="�������">
							              </a>
							<%
													} else {
							%>
										  <a href="javascript:cancelApply('<%= v_tid %>','<%= v_paymethod %>')" tabindex="<%="2"+i+"2"%>" title="��Ҹ� ��û�մϴ�">
										  	<img src="/images/portal/homepage_renewal/myclass/btn_off_cancel_y.jpg" alt="��ҿ�û">
										  </a>
							<%
													}
											}
							            } else if ("".equals(v_tid) && "N".equals(v_refundyn) && "Y".equals(v_refundableyn)) {
							%>
							              <a href="javascript:cancelApplyFirst('<%= v_subj %>','<%= v_year %>','<%= v_subjseq %>','<%= v_seq %>')" tabindex="<%="2"+i+"3"%>" title="������û�� ����մϴ�">
							              	<img src="/images/portal/homepage_renewal/myclass/btn_off_cancel.jpg" alt="�������">
							              </a><br>
							              <a href="javascript:updatePropose('<%= v_subj %>','<%= v_year %>','<%= v_subjseq %>','<%= v_subjnm %>')" tabindex="<%="2"+i+"3"%>" title="���������� �����մϴ�">
							              	<img src="/images/portal/homepage_renewal/myclass/btn_off_info.jpg" alt="��������">
							              </a>
							<%
							        	} else {
							        		if ("Y".equals(v_refundyn)) {
							%>
									  �����<br><%= v_refunddate %>
							<%
							        		}else{%>
							        		&nbsp;<%}
							        	}
							%>
						</td>
					</tr>
					
					<%} 
				      }
				      if(i == 0){%>
				      	<tr>
				      		<td colspan="7" class="linefirst">
				      			������û �̷��� �����ϴ�.
				      		</td>
				      	</tr>
				      <%} %>
				</table>
			</div>
			<div class="pageset">
				<%= PageUtil.re2012_printPageListDiv(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
			</div>
		</div>
	</div>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
