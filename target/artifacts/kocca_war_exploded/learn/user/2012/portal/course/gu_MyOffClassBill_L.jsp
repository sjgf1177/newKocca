<%
//**********************************************************
//  1. ��      ��: �������� ������û Ȯ�� ��� ���
//  2. ���α׷���: gu_MyOffClass_L.jsp
//  3. ��      ��: �������� ������û Ȯ�� ��� ���
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009. 12. 24
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
	box.put("submenu","4");

    String  v_process   	= box.getString("p_process");
    String  v_user_id   	= box.getSession("userid");
    String  v_tem_grcode	= box.getSession("tem_grcode");
    
    String	v_listgubun		= "";
    String	v_tid			= "";
	String	v_userid		= "";
	String	v_usernm		= "";
    String	v_goodname		= "";
    double	v_price			= 0;
    double	v_biyong		= 0;
    String	v_resultcode	= "";
    String	v_paymethod		= "";
	String	v_buyername		= "";
    String	v_pgauthdate	= "";
    String	v_cancelyn		= "";
    String	v_canceldate	= "";
    String	v_canceltime	= "";
    String	v_billbegindt	= "";
    String	v_billenddt 	= "";
    String	v_paystatus		= "";
    String	v_ldate			= "";
    String	v_subj			= "";
    String	v_year			= "";
    String	v_subjseq		= "";
    String	v_seq			= "";
    String	v_pay_status_text	= "";

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

    list1 = (ArrayList)request.getAttribute("MyClassBillList");

    list1 = (ArrayList)request.getAttribute("MyOffClassBillList");
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="javascript">
<!--
	//�˻����뿡 �´� ����Ʈ �������� �̵�
	function selectList() {
    	document.form1.action = "/servlet/controller.study.MyClassBillServlet";
    	document.form1.p_process.value = "MyClassBillListPage";
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
	    document.form1.action = "/servlet/controller.study.MyClassBillServlet";
	    document.form1.submit();

	    farwindow.window.focus();
	    document.form1.target = window.self.name;
	}

	//������û �����˾�
	function payApply(p_listgubun, p_subj, p_year, p_subjseq, p_seq, p_tid, p_cancelyn){
	    window.self.name = "winProposePage";
	    farwindow = window.open("", "openWinPayApply", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 780, height = 800, top=0, left=0");
		document.form1.p_listgubun.value = p_listgubun;
		document.form1.p_subj.value = p_subj;
		document.form1.p_year.value = p_year;
		document.form1.p_subjseq.value = p_subjseq;
		document.form1.p_seq.value = p_seq;
        document.form1.p_tid.value = p_tid;
        document.form1.p_cancelyn.value = p_cancelyn;
	    document.form1.target = "openWinPayApply"
		document.form1.action = "/inicis/plugin_check_new_off.jsp";
	    document.form1.submit();

	    farwindow.window.focus();
	    document.form1.target = window.self.name;
	}
	
	//������������ ��ȸ
	function fnPayInfo(p_listgubun, p_tid, p_subj, p_year, p_subjseq, p_seq) {
		window.self.name = "winProposePage";
		open_window("openPayInfo","","100","100","550","450","no","no","no","yes","yes");
		document.form1.target = "openPayInfo";
		document.form1.p_tid.value = p_tid;
		document.form1.p_listgubun.value = p_listgubun;
		document.form1.p_subj.value = p_subj;
		document.form1.p_year.value = p_year;
		document.form1.p_subjseq.value = p_subjseq;
		document.form1.p_seq.value = p_seq;
		document.form1.action='/servlet/controller.study.MyClassBillServlet';
		document.form1.p_process.value = 'OffPayInfoPage';
		document.form1.submit();
	    document.form1.target = window.self.name;
	}

//������ Ȯ���ϴ°�
    function receipt(tid)
    {
      var receiptUrl = "https://iniweb.inicis.com/DefaultWebApp/mall/cr/cm/mCmReceipt_head.jsp?noTid=" + tid + "&noMethod=1";
      var a=window.open(receiptUrl,"receipt","width=430,height=700");
      //a.document.title="aaa";
    }
    function goPage(pageNum) {

    	document.form1.p_pageno.value = pageNum;
    	document.form1.action = "/servlet/controller.study.MyClassBillServlet";
    	document.form1.p_process.value = "MyOffClassBillListPage";
    	document.form1.submit();

    }
//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name= "form1" method= "post" action="">
    <input type='hidden' name='p_process'   />
    <input type='hidden' name='p_userid'    />
    <input type='hidden' name='p_subj'      />
    <input type='hidden' name='p_year'      />
    <input type='hidden' name='p_subjseq'   />
    <input type='hidden' name='p_seq'       />
    <input type='hidden' name='p_subjnm'    />
    <input type='hidden' name='p_tid'	    />
    <input type='hidden' name='p_paymethod' />
    <input type='hidden' name='p_listgubun' />
    <input type='hidden' name='p_cancelyn' />
    <input type="hidden" name="p_pageno" value="<%= v_pageno %>">
	<input type="hidden" name="p_pagesize"  value="<%=v_pagesize%>"/>
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagetitle"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > ���ǰ��ǽ� ><u>������ ��������</u></td>
			</tr>
		</table>
		<div class="concept a04">
			<div class="titlemsg"><img src="/images/2012/sub/page1/title/learning_payment.gif" alt="������ ��������"></div>
			<ul class="pagetab">
				<li><a href="/servlet/controller.study.MyClassBillServlet?p_process=MyClassBillListPage" tabindex="171" title="ȸ������ �¶��� ���� ���� ��ȸ �� ������ ������ �� �ֽ��ϴ�"><img src="/images/2012/sub/page1/tabmenu/online_off.png" alt="�¶��ΰ���"></a></li>
				<li><img src="/images/2012/sub/page1/tabmenu/offline_on.png" alt="�������ΰ���"></li>
			</ul>
		</div>
		<div class="myclass">
			<div class="listbar">
				<table class="listrable" cellpadding="0" cellspacing="0">
					<colgroup><col width="*"><col width="80"><col width="150"><col width="70"><col width="80"><col width="110"><col width="100"></colgroup>
					<tr class="listhead">
						<th>������</th>
						<th>������(��)</th>
						<th>������ �����Ⱓ</th>
						<th>��������</th>
						<th>��������</th>
						<th>ī����� ������</th>
						<th>��ҿϷ���</th>
					</tr>
					
					 <%
						if(list1 != null)
						{
							for(i = 0; i < list1.size(); i++)
							{
								DataBox dbox = (DataBox)list1.get(i);
				
								v_listgubun		= dbox.getString("d_listgubun");
								v_tid			= dbox.getString("d_tid");
								v_userid		= dbox.getString("d_userid");
								v_usernm		= dbox.getString("d_usernm");
							    v_goodname		= dbox.getString("d_goodname");
							    v_price			= dbox.getDouble("d_price");
							    v_biyong		= dbox.getDouble("d_biyong");
							    v_resultcode	= dbox.getString("d_resultcode");
							    v_paymethod		= dbox.getString("d_paymethod");
								v_buyername		= dbox.getString("d_buyername");
							    v_pgauthdate	= dbox.getString("d_pgauthdate");
							    v_cancelyn		= dbox.getString("d_cancelyn");
							    v_canceldate	= dbox.getString("d_canceldate");
							    v_canceltime	= dbox.getString("d_canceltime");
							    v_paystatus		= dbox.getString("d_paystatus");
							    v_billbegindt	= dbox.getString("d_billbegindt");
							    v_billenddt		= dbox.getString("d_billenddt");
							    v_ldate			= dbox.getString("d_ldate");
							    v_subj			= dbox.getString("d_subj");
							    v_year			= dbox.getString("d_year");
							    v_subjseq		= dbox.getString("d_subjseq");
							    v_seq			= dbox.getString("d_seq");
							    
							    v_dispnum	= dbox.getInt("d_dispnum");
						        v_totalpage	= dbox.getInt("d_totalpage");
				
								if ("BankBook".equals(v_paymethod)) {
									v_paymethod = "������";
								} else if ("Card".equals(v_paymethod)) {
									v_paymethod = "�ſ�ī��(ISP)";
								} else if ("DirectBank".equals(v_paymethod)) {
									v_paymethod = "�ǽð�������ü";
								} else if ("TaxBill".equals(v_paymethod)) {
									v_paymethod = "��꼭";
								} else if ("VBank".equals(v_paymethod)) {
									v_paymethod = "������(�������)";
								} else if ("VCard".equals(v_paymethod)) {
									v_paymethod = "�ſ�ī��(�Ƚ�Ŭ��)";
								}
				
								if ("99".equals(v_resultcode)) {
									v_pay_status_text = "�̰���";
								} else if ("00".equals(v_resultcode) && "Y".equals(v_cancelyn)) {
									v_pay_status_text = "��ҿϷ�";
								} else if ("00".equals(v_resultcode) && "N".equals(v_cancelyn)) {
									v_pay_status_text = "�����Ϸ�";
								}
								
								v_pgauthdate	= FormatDate.getFormatDate(v_pgauthdate,"yyyy.MM.dd");
								v_canceldate	= FormatDate.getFormatDate(v_canceldate,"yyyy.MM.dd");
								v_billbegindt	= FormatDate.getFormatDate(v_billbegindt,"yyyy.MM.dd");
								v_billenddt		= FormatDate.getFormatDate(v_billenddt,"yyyy.MM.dd");
					%>

					<tr class="listmiddle" onmouseover="this.style.background='#fbfbfb'" onmouseout="this.style.background=''">
						<td class="linefirst title" id="bboardfocus<%=i+1%>"><a href="javascript:fnPayInfo('<%= v_listgubun %>','<%= v_tid %>','<%= v_subj %>','<%= v_year %>','<%= v_subjseq %>','<%= v_seq %>')" onfocus="boardfocus('b',<%=i+1%>)" onblur="boardfocus('b',<%=i+1%>)" tabindex="<%="2"+i+"1"%>" title="<%= v_goodname %>"><%= v_goodname %></a></td>
						<td><%= new java.text.DecimalFormat("###,###,##0").format(v_price) %></td>
						<td><%= v_billbegindt %> ~ <%= v_billenddt %></td>
						<td><%= v_pay_status_text %></td>
						<td id="ctxtfocus<%=i+1%>">
							<% if (v_price==0) {%>
               	<%= v_pgauthdate %>
           		<% } else { %>
              	<a href="javascript:receipt('<%=v_tid%>')" tabindex="<%="2"+i+"2"%>" onfocus="txtlink('c',<%=i+1%>)" onblur="txtlink('c',<%=i+1%>)" style="letter-spacing: 0px; font-size: 12px;"><font color="red"><%= v_pgauthdate %></font></a>
          		<% }%>
          	</td>
						<td>
							<% if (v_price==0) {%>
               	����
           		<% } else { %>
              	<button type="button" tabindex="<%="2"+i+"3"%>" onclick="javascript:receipt('<%=v_tid%>')" class="btn_nomal_darkmint" title="ī������� ���������� �������� ��� ������ǥ�� �μ��� �� �ֽ��ϴ�">������ǥ</button>
          		<%}%>
							</td>
						<td><%if(!v_canceldate.equals("")){%><%= v_canceldate %><%}else{ %>&nbsp;<%} %></td>
					</tr>
					<%}%> 
						<%	if(i == 0){	 %>
			    		<tr><td colspan="7" align="center" class="linefirst">�ش��ϴ� �����Ͱ�  �����ϴ�.</td></tr>
			    	<% } %>
					<% } %>
				</table>
			</div>
			<div class="pageset">
				<%= PageUtil.re2012_printPageListDiv(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
			</div>
		</div>
	</div>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
