<%
//**********************************************************
//  1. ��      ��: ������û Ȯ�� ��� ���
//  2. ���α׷���: gu_ProposeHistory_L.jsp
//  3. ��      ��: ������û Ȯ�� ��� ���
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
    String	v_subjnm		= "";
    String	v_edustart		= "";
    String	v_eduend		= "";
    String	v_appdate		= "";
    String	v_classname		= "";
	String	v_refundabledate= "";
    String	v_refundableyn	= "";
    String	v_cancelableyn	= "";
    String	v_refundyn		= "";
    String	v_canceldate	= "";
    String	v_paymethod		= "";
    String	v_acceptyn		= "";
    String	v_chkfirst		= "";
    String	v_chkfinal		= "";
    String	v_chkstatus		= "";
    String	v_rank			= "";
    String	v_refunddate	= "";
    String	v_paystatus	    = "";
    double	v_biyong		= 0;
    int		v_rowspan		= 0;

    int     i           =  0;
    int     l           =  0;

    ArrayList list1     = null;
    //DEFINED class&variable END

    list1 = (ArrayList)request.getAttribute("ProposeHistoryList");
    String grcode=box.getSession("tem_grcode");
    
    int v_pagesize = box.getInt("p_pagesize");
	int	 v_totalrowcount =  0;
    
    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0, v_tabseq = 0;

    // ����¡����
    int row      = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int v_pageno = box.getInt("p_pageno");   
    
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="javascript">
<!--
	//�˻����뿡 �´� ����Ʈ �������� �̵�
	function selectList() {
    	document.form1.action = "/servlet/controller.study.MyClassServlet";
    	document.form1.p_process.value = "ProposeHistoryPage";
    	document.form1.submit();
	}

	//������û ��� �˾�
	function cancelApply(p_tid, p_paymethod){
	    window.self.name = "winProposePage";
	    farwindow = window.open("", "openWinCancelApply", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 550, height = 450, top=0, left=0");
	    document.form1.target = "openWinCancelApply"
	    document.form1.p_tid.value = p_tid;
	    document.form1.p_paymethod.value = p_paymethod;
		document.form1.p_process.value = 'ProposeCancelApplyPage';
	    document.form1.action = "/servlet/controller.study.MyClassServlet";
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
		document.form1.p_process.value = 'CancelPropose';
	    document.form1.action = "/servlet/controller.study.MyClassServlet";
	    document.form1.submit();
	}
	
	//������ �̵�
	function goPage(pageNum) {

		document.form1.p_pageno.value = pageNum;
		document.form1.action = "/servlet/controller.study.MyClassServlet";
		document.form1.p_process.value = "ProposeHistoryPage";
		document.form1.submit();

	}

//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name= "form1" method= "post" action="">
    <input type='hidden' name='p_process'>
    <input type='hidden' name='p_userid'    >
    <input type='hidden' name='p_subj'      >
    <input type='hidden' name='p_year'      >
    <input type='hidden' name='p_subjseq'   >
    <input type='hidden' name='p_subjnm'    >
    <input type='hidden' name='p_tid'	    >
    <input type='hidden' name='p_paymethod' >
    <input type="hidden" name="p_pageno" value="<%= v_pageno %>">
	<input type="hidden" name="p_pagesize"  value="<%=v_pagesize%>"/>
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
				<li><img src="/images/2012/sub/page1/tabmenu/online_on.png" alt="�¶��ΰ���"></li>
				<li><a href="/servlet/controller.study.MyClassServlet?p_process=ProposeOffHistoryPage" tabindex="171" title="ȸ������ �������� ������û ������ Ȯ���� �� �ֽ��ϴ�"><img src="/images/2012/sub/page1/tabmenu/offline_off.png" alt="�������ΰ���"></a></li>
			</ul>
		</div>
		<div class="myclass">
			<div class="listbar">
				<table class="listrable" cellpadding="0" cellspacing="0">
					<colgroup><col width="120"><col width="*"><col width="100"><col width="140"><col width="80"><col width="70"><col width="80"><col width="120"></colgroup>
					<tr class="listhead">
						<th colspan="2">������</th>
						<th>������(��)</th>
						<th>�����Ⱓ</th>
						<th>������û��</th>
						<th>���λ���</th>
						<th>��������</th>
						<th>���</th>
					</tr>
					<%
					for(i = 0; i < list1.size(); i++)
					{
						DataBox dbox = (DataBox)list1.get(i);
						
						String imgurl = dbox.getString("d_introducefilenamenew");
					   
						v_tid			= dbox.getString("d_tid");
						v_subj			= dbox.getString("d_subj");
						v_year			= dbox.getString("d_year");
						v_subjseq		= dbox.getString("d_subjseq");
						v_subjnm		= dbox.getString("d_subjnm");
						v_edustart		= dbox.getString("d_edustart");
						v_eduend		= dbox.getString("d_eduend");
						v_appdate		= dbox.getString("d_appdate");
						v_classname		= dbox.getString("d_classname");
						v_refundabledate= dbox.getString("d_refundabledate");
						v_refundableyn	= dbox.getString("d_refundableyn");
						v_cancelableyn	= dbox.getString("d_cancelableyn");
						v_refundyn		= dbox.getString("d_refundyn");
						v_canceldate	= dbox.getString("d_canceldate");
						v_paymethod		= dbox.getString("d_paymethod");
						v_acceptyn		= dbox.getString("d_acceptyn");
						v_chkfirst		= dbox.getString("d_chkfirst");
						v_chkfinal		= dbox.getString("d_chkfinal");
						v_rank			= dbox.getString("d_rank");
						v_rowspan		= dbox.getInt("d_rowspan");
						v_refunddate	= dbox.getString("d_refunddate");
						v_biyong		= dbox.getDouble("d_biyong");
		
						v_edustart		= FormatDate.getFormatDate(v_edustart,"yyyy.MM.dd");
						v_eduend		= FormatDate.getFormatDate(v_eduend,"yyyy.MM.dd");
						v_appdate		= FormatDate.getFormatDate(v_appdate,"yyyy.MM.dd");
						v_refundabledate= FormatDate.getFormatDate(v_refundabledate,"yyyy.MM.dd");
						v_canceldate	= FormatDate.getFormatDate(v_canceldate,"yyyy.MM.dd");
						v_refunddate	= FormatDate.getFormatDate(v_refunddate,"yyyy.MM.dd");
						
						
						v_dispnum	= dbox.getInt("d_dispnum");
				        v_totalpage	= dbox.getInt("d_totalpage");
				        
				        
						if (imgurl.equals("")) {
							imgurl = "/images/2012/common/not_image.gif";
						} else {
							imgurl = "http://edu.kocca.or.kr/upload/bulletin/"+imgurl;
						}
						
						if ("Y".equals(v_chkfirst) && "Y".equals(v_chkfinal)) {
							v_chkstatus = "����";
						}
						if ("Y".equals(v_chkfirst) && "B".equals(v_chkfinal)) {
							v_chkstatus = "���δ��";
						}
						if ("Y".equals(v_chkfirst) && "N".equals(v_chkfinal)) {
							v_chkstatus = "�ݷ�";
						}
		
		               if ("Y".equals(v_refundyn)) {
		                        v_paystatus = "ȯ�ҿϷ�";
		               } else {
		                   if (!v_chkfinal.equals("Y") && v_tid.equals("")) {
		                       v_paystatus ="�̰���";
		                   } else {
		                        v_paystatus ="�����Ϸ�";        
		                   }
		               }
					%>
					<tr class="listmiddle" onmouseover="this.style.background='#fbfbfb'" onmouseout="this.style.background=''">
						<td class="linefirst courseimg"><img src="<%=imgurl%>" class="course" alt="<%= v_subjnm %>"></td>
						<td class="title courselist" id="bboardfocus<%=i%>">
							<a href="#" tabindex="<%="2"+i+"1"%>" onfocus="boardfocus('b',<%=i%>)" onblur="boardfocus('b',<%=i%>)" title="[<%= v_edustart %> ~ <%= v_eduend %>] <%= v_subjnm %>"><%= v_subjnm %></a>
							<br><img src="/images/2012/common/icon/icon_online.gif" alt="�¶��ΰ���">
							<img src="/images/2012/common/icon/icon_pc.gif" alt="PC�н�">
							<!-- <img src="/images/2012/common/icon/icon_mobile.gif" alt="������н�"> -->
						</td>
						<td><%if(v_biyong == 0){%>����<%}else{%><%= new java.text.DecimalFormat("###,###,##0").format(v_biyong) %><%} %></td>
						<td><%= v_edustart %> ~ <%= v_eduend %></td>
						<td><%if(!v_appdate.equals("")){%><%= v_appdate %><%}else{ %>&nbsp;<%} %></td>
						<td><%= v_chkstatus %></td>
						<td><%= v_paystatus %></td>
						<td>
						<%
							if (v_rowspan != 0) {
                if ("N".equals(v_refundyn) && "Y".equals(v_refundableyn)) {
  	            	if (!"".equals(dbox.getString("d_canceldate"))) {
						%>
			      	��ҿ�û��<br><%= v_canceldate %>
						<%                	
									} else {
										if ("Y".equals(v_cancelableyn)) {
						%>
	                <a href="javascript:cancelPropose('<%= v_tid %>','<%= v_paymethod %>')" tabindex="<%="2"+i+"2"%>" class="board_btn2">
	                <img src="/images/portal/homepage_renewal/myclass/btn_off_cancel.jpg">
	                </a>
						<%
								} else {
						%>
			            <a href="javascript:cancelApply('<%= v_tid %>','<%= v_paymethod %>')" tabindex="<%="2"+i+"3"%>" class="board_btn2">
			            	<img src="/images/portal/homepage_renewal/myclass/btn_off_cancel_y.jpg">
			            </a>
						<%
								}
							}
	                	} else {
	                		if ("Y".equals(v_refundyn)) {
						%>
							            �����<br/><%= v_refunddate %>
							            <%
			                		} else {
						%>
									    �Ⱓ����
						<%
			                		}
			                	}
							}else{
						%>
							&nbsp;<%} %>						
						</td>
					</tr>
					<% } %>
					<%	if(i == 0){	 %>
				  <tr>
				  	<td colspan="8" align="center" class="linefirst">��û�� ������ �����ϴ�.</td>
				  </tr>
				  <% } %>
				</table>
			</div>
			<div class="pageset">
				<%= PageUtil.re2012_printPageListDiv(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
			</div>
		</div>
	</div>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
