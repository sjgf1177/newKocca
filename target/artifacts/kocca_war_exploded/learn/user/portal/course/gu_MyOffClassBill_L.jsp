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

    list1 = (ArrayList)request.getAttribute("MyOffClassBillList");
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
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
//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name= "form1" method= "post">
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
        <td><img src="/images/portal/homepage_renewal/myclass/stitle_08.gif" alt="������ ���� ��ȸ/����" /></td>
        <td class="h_road">Home &gt; ���� ���ǽ�  &gt; <strong>������ ���� ��ȸ/����</strong></td>
      </tr>
      <tr>
        <td height="12" colspan="2"></td>
        </tr>
      <tr>
        <td height="1" colspan="2" bgcolor="E5E5E5"></td>
      </tr>
    </table>
    <!--Ÿ��Ʋ�κ�//-->
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><img src="/images/portal/homepage_renewal/myclass/bar_06.jpg" width="672" height="126" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
    <!--�Ǻκ�-->
    <table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><a href="/servlet/controller.study.MyClassBillServlet?p_process=MyClassBillListPage" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image55','','/images/portal/homepage_renewal/myclass/tab_on_001.gif',1)"><img src="/images/portal/homepage_renewal/myclass/tab_off_001.gif" name="Image55" id="Image55" /></a></td>
        <td><a href="/servlet/controller.study.MyClassBillServlet?p_process=MyOffClassBillListPage" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image56','','/images/portal/homepage_renewal/myclass/tab_on_002.gif',1)"><img src="/images/portal/homepage_renewal/myclass/tab_on_002.gif" name="Image56" id="Image56" /></a></td>
      </tr>
    </table>
    <!--�Ǻκ�//-->
    <!--���̺�κ�-->
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="tit_table">������</td>
        <td class="tit_table">����������Ⱓ</td>
        <td class="tit_table">������</td>
        <td class="tit_table">��������</td>
        <td class="tit_table">��������</td>
        <td class="tit_table_right">��ҿϷ���</td>
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
      <tr>
        <td class="ct_tit_table_left"><a href="javascript:fnPayInfo('<%= v_listgubun %>','<%= v_tid %>','<%= v_subj %>','<%= v_year %>','<%= v_subjseq %>','<%= v_seq %>')"><%= v_goodname %></a></td>
        <td class="ct_tit_table"><%= v_billbegindt %> ~ <%= v_billenddt %></td>
        <td class="ct_tit_table"><strong><%= new java.text.DecimalFormat("###,###,##0").format(v_price) %></strong></td>
        <td class="ct_tit_table"><%= v_pay_status_text %></td>
        <td class="ct_tit_table">
        		<% if (v_price==0) {%>
                         <%= v_pgauthdate %>
                     <% } else { %>
                        <a href="javascript:receipt('<%=v_tid%>')" style="letter-spacing: 0px; font-size: 12px;"><font color="red"><%= v_pgauthdate %></font></a>
                    <%}%>
                    </td>
        <td class="ct_tit_table_right"><%if(!v_canceldate.equals("")){%><%= v_canceldate %><%}else{ %>&nbsp;<%} %></td>
      </tr>      
      <%} }%>
      <tr>
        <td height="1" colspan="6" bgcolor="CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="6" bgcolor="F7F7F7"></td>
      </tr>
    </table>
    </td>
    <td width="20">&nbsp;</td>
    
  </tr>
</table>
      	
      	<%}else{ %>

			<h2><img src="/images/portal/myclass/h2_tit5.gif" alt="��������� ��ȸ/����" class="fl_l" /><p class="category">Home > ���ǰ��ǽ� > <strong>�����������ȸ/����</strong></p></h2>
 
			<%--<p class="myclass_tab cltxt_5"><a href="/servlet/controller.study.MyClassBillServlet?p_process=MyClassBillListPage"><img src="/images/portal/myclass/myclass_online_tab1_off.gif" alt="�¶��ΰ���" onmouseover="imgover(this);" onmouseout="imgout(this);" /></a><img src="/images/portal/myclass/myclass_online_tab2_on.gif" alt="�������ΰ���" /></p>--%>
            <img src="/images/portal/myclass/sletter_borimg.gif" alt="" style="width:681px;background-position: left 18px;background-repeat: no-repeat;">
            <p style="line-height:7px">&nbsp;</p>
            <a href="/servlet/controller.study.MyClassBillServlet?p_process=MyClassBillListPage"><img src="/images/portal/btn/btn_online_off.gif" alt="�¶��ΰ���" onmouseover="imgover(this);" onmouseout="imgout(this);" /></a><img src="/images/portal/btn/btn_offline_on.gif" alt="�������ΰ���">
			<table class="board_list ">
			<colgroup><col width="200px" /><col width="120px" /><col width="80px" /><col width="80px" /><col width="70px" /><col width="70px" /></colgroup>
			<thead>
			<tr class="myclass">
				<th class="row"><p>������</p></th>
				<th class="row"><p>����������Ⱓ</p></th>
				<th><p>������<br />�ǰ�����</p></th>
				<th><p>��������<br />�������</p></th>
				<th class="row"><p>��������</p></th>
				<th class="end"><p>��ҿϷ���</p></th>
			</tr>
			</thead>
			<tbody>
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
			<tr onmouseover="className='over'" onmouseout="className=' '">
				<td class="ta_l"><a href="javascript:fnPayInfo('<%= v_listgubun %>','<%= v_tid %>','<%= v_subj %>','<%= v_year %>','<%= v_subjseq %>','<%= v_seq %>')"><%= v_goodname %></a></td>
				<td class="num"><%= v_billbegindt %> ~ <%= v_billenddt %></td>
				<td class="num"><span class="td_lt"><%= new java.text.DecimalFormat("###,###,##0").format(v_biyong) %></span><br /><strong><%= new java.text.DecimalFormat("###,###,##0").format(v_price) %></strong></td>
				<td class="fs_s"><%= v_pay_status_text %><br />
                <% if ( "99".equals(v_resultcode) ) { %>
                    <%="<a href=\"javascript:payApply('" + v_listgubun + "','" + v_subj + "','" + v_year + "','" + v_subjseq + "','" + v_seq + "','" + v_tid + "', '" + v_cancelyn + "')\" class=\"board_btn2\"><span>�����ϱ�</span></a>"%>
                <%} else {%>
                    <%="" %>
                <%}%>
                <br><%= v_paymethod %></td>                
                <td class="num">
                    <% if (v_price==0) {
                         out.print(v_pgauthdate);
                      } else { %>
                        <a href="javascript:receipt('<%=v_tid%>')"><font color="red"><%= v_pgauthdate %></font></a>
                    <%}%>
                </td>
				<td class="num"><%= v_canceldate %></td>
			</tr>
<%
			}
		}
%>
<%
		if(i == 0){
%>
            <tr>
                <td colspan="6">���������� �����ϴ�.</td>
            </tr>
              <%
        }
%>
			</tbody>
			</table>
			<%} %>
</form>
<!-- Form ���� ���� -->

<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->