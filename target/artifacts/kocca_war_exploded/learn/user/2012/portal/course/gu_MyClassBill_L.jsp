<%
//**********************************************************
//  1. ��      ��: ������û Ȯ�� ��� ���
//  2. ���α׷���: gu_MyClassBill_L.jsp
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
	box.put("submenu","4");

    String  v_process   	= box.getString("p_process");
    String  v_user_id   	= box.getSession("userid");
    String  v_tem_grcode	= box.getSession("tem_grcode");
    String  v_upperclass	= box.getString("v_upperclass");

	String	v_tid			= "";
	String	v_userid		= "";
	String	v_usernm		= "";
    String	v_goodname		= "";
    String	v_inputdate		= "";
    double	v_price			= 0;
    double	v_biyong		= 0;
    String	v_resultcode	= "";
    String	v_paymethod		= "";
	String	v_buyername		= "";
    String	v_pgauthdate	= "";
    String	v_cancelyn		= "";
    String	v_canceldate	= "";
    String	v_canceltime	= "";
    String	v_paystatus		= "";
    String	v_ldate			= "";

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
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<script type="text/javascript"  src="/script/jquery-1.3.2.min.js"></script>
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

	//������������ ��ȸ
	function fnPayInfo(p_tid) {
		window.self.name = "winProposePage";
		open_window("openPayInfo","","100","100","550","450","no","no","no","yes","yes");
		document.form1.target = "openPayInfo";
		document.form1.p_tid.value = p_tid;
		document.form1.action='/servlet/controller.study.MyClassBillServlet';
		document.form1.p_process.value = 'PayInfoPage';
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
    
  //������ �̵�
    function goPage(pageNum) {

    	document.form1.p_pageno.value = pageNum;
    	document.form1.action = "/servlet/controller.study.MyClassBillServlet";
    	document.form1.p_process.value = "MyClassBillListPage";
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
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > ���ǰ��ǽ� ><u>������ ��������</u></td>
			</tr>
		</table>
		<div class="concept a04">
			<div class="titlemsg"><img src="/images/2012/sub/page1/title/learning_payment.gif" alt="������ ��������"></div>
			<ul class="pagetab">
				<li><img src="/images/2012/sub/page1/tabmenu/online_on.png" alt="�¶��ΰ���"></li>
				<li><a href="/servlet/controller.study.MyClassBillServlet?p_process=MyOffClassBillListPage" tabindex="171" title="ȸ������ �������� ���� ���� ��ȸ �� ������ ������ �� �ֽ��ϴ�"><img src="/images/2012/sub/page1/tabmenu/offline_off.png" alt="�������ΰ���"></a></li>
			</ul>
		</div>
		<div class="myclass">
			<div class="listbar">
				<table class="listrable" cellpadding="0" cellspacing="0" summary="�¶��ΰ��� ������ �������� ����Դϴ�">
					<colgroup><col width="*"><col width="80"><col width="80"><col width="80"><col width="80"><col width="120"><col width="120"></colgroup>
					<tr class="listhead">
						<th>������</th>
						<th>������(��)</th>
						<th>������û��</th>
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
								
								v_tid			= dbox.getString("d_tid");
								v_userid		= dbox.getString("d_userid");
								v_usernm		= dbox.getString("d_usernm");
						    v_goodname		= dbox.getString("d_goodname");
						    v_inputdate		= dbox.getString("d_inputdate");
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
						    v_ldate			= dbox.getString("d_ldate");
						    
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
								} else if ("FreePay".equals(v_paymethod)) {
									v_paymethod = "�������";
								}
				
								v_inputdate		= FormatDate.getFormatDate(v_inputdate,"yyyy.MM.dd");
								v_pgauthdate	= FormatDate.getFormatDate(v_pgauthdate,"yyyy.MM.dd");
								v_canceldate	= FormatDate.getFormatDate(v_canceldate,"yyyy.MM.dd");
					%>
					<tr class="listmiddle" onmouseover="this.style.background='#fbfbfb'" onmouseout="this.style.background=''">
						<!-- <td class="linefirst courseimg"> �¶��� </td>   -->
						<td class="linefirst title courselist" id="bboardfocus<%=i+1%>">
							<a href="javascript:fnPayInfo('<%= v_tid %>')" onfocus="boardfocus('b',<%=i+1%>)" onblur="boardfocus('b',<%=i+1%>)" tabindex="<%="2"+i+"1"%>" title="<%= v_goodname %>"><%= v_goodname %></a>
							<!-- <br><img src="/images/2012/common/icon/icon_online.gif" alt="�¶��ΰ���">
							<img src="/images/2012/common/icon/icon_pc.gif" alt="PC�н�"> -->
							<!-- <img src="/images/2012/common/icon/icon_mobile.gif" alt="������н�"> -->
						</td>
						<td><%= new java.text.DecimalFormat("###,###,##0").format(v_price) %></td>
						<td><%= v_inputdate %></td>
						<td><%= "Y".equals(v_cancelyn) ? "ȯ�ҿϷ�" : "�����Ϸ�" %></td>
						<td id="btxtfocus<%=i+1%>">
							<% if (v_price==0 || v_paymethod.equals("�������")) {%><%= v_pgauthdate %>
              <% } else { %><a href="javascript:receipt('<%=v_tid%>')" onfocus="txtlink('b',<%=i+1%>)" onblur="txtlink('b',<%=i+1%>)" tabindex="<%="2"+i+"2"%>" style="letter-spacing: 0px; font-size: 12px;"><font color="red"><%= v_pgauthdate %></font></a>
              <%}%>
            </td>
						<td>
						<% if (v_price==0 || v_paymethod.equals("�������")) {%>����
            <% } else { %>
            	<button type="button" tabindex="<%="2"+i+"3"%>" onclick="javascript:receipt('<%=v_tid%>')" class="btn_nomal_darkmint" title="ī������� ���������� �������� ��� ������ǥ�� �μ��� �� �ֽ��ϴ�">������ǥ</button>
            <%}%>
						</td>
						<td><%if(!v_canceldate.equals("")){%><%= v_canceldate %><%}else{ %>&nbsp;<%} %></td>
					</tr>
					<%} %>
						<%	if(i == 0){	 %>
					    <tr><td colspan="8" align="center" class="linefirst">�ش��ϴ� ����Ÿ��  �����ϴ�.</td></tr>
					    <% } %>	
					<%}%>
				</table>
			</div>
			<div class="pageset">
				<%= PageUtil.re2012_printPageListDiv(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
			</div>
		</div>
	</div>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
