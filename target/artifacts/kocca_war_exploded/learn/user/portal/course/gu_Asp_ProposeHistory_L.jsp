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
    int		v_rowspan		= 0;

    int     i           =  0;
    int     l           =  0;

    ArrayList list1     = null;
    //DEFINED class&variable END

    list1 = (ArrayList)request.getAttribute("ProposeHistoryList");
    String grcode=box.getSession("tem_grcode");
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
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

//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name= "form1" method= "post">
    <input type='hidden' name='p_process'>
    <input type='hidden' name='p_userid'    >
    <input type='hidden' name='p_subj'      >
    <input type='hidden' name='p_year'      >
    <input type='hidden' name='p_subjseq'   >
    <input type='hidden' name='p_subjnm'    >
    <input type='hidden' name='p_tid'	    >
    <input type='hidden' name='p_paymethod' >

			<h2><img src="/images/portal/myclass/h2_tit4.gif" alt="������ûȮ��/���" class="fl_l" /><p class="category">Home > ���ǰ��ǽ� > <strong>������ûȮ��/��û</strong></p></h2>


			<%--<p class="myclass_tab cltxt_4_on"><img src="/images/portal/myclass/myclass_online_tab1_on.gif" alt="�¶��ΰ���" /><a href="/servlet/controller.study.MyClassServlet?p_process=ProposeOffHistoryPage"><img src="/images/portal/myclass/myclass_online_tab2_off.gif" alt="�������ΰ���" onmouseover="imgover(this);" onmouseout="imgout(this);" /></a></p>--%>
            <img src="/images/portal/myclass/apply_borimg_on.gif" alt="" style="width:681px;background-position: left 18px;background-repeat: no-repeat;">
            <p style="line-height:7px">&nbsp;</p>
    <% if(grcode.equals("N000001")) { %>
            <img src="/images/portal/btn/btn_online_on.gif" alt="�¶��ΰ���"><a href="/servlet/controller.study.MyClassServlet?p_process=ProposeOffHistoryPage"><img src="/images/portal/btn/btn_offline_off.gif" alt="�������ΰ���" onmouseover="imgover(this);" onmouseout="imgout(this);" /></a>
    <%}%>
			<table class="board_list">
			<colgroup><col width="90px" /><col width="200px" /><col width="120px" /><col width="78px" /><col width="70px" /></colgroup>
			<thead>
			<tr class="myclass">
				<th class="row"><p>
                  <kocca_select:select name="p_upperclass" sqlNum="upperclass"  param=" "
	              onChange="selectList();" attr="�з�" selectedValue="<%= v_upperclass %>" isLoad="true" all="none" type="3"/>
                </p></th>
				<th class="row"><p>������</p></th>
				<th><p>�����Ⱓ<br />������û��</p></th>
				<th><p>���λ���<br />��������</p></th>
				<th class="end"><p>���</p></th>
			</tr>
			</thead>
			<tbody>

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

				v_edustart		= FormatDate.getFormatDate(v_edustart,"yyyy.MM.dd");
				v_eduend		= FormatDate.getFormatDate(v_eduend,"yyyy.MM.dd");
				v_appdate		= FormatDate.getFormatDate(v_appdate,"yyyy.MM.dd");
				v_refundabledate= FormatDate.getFormatDate(v_refundabledate,"yyyy.MM.dd");
				v_canceldate	= FormatDate.getFormatDate(v_canceldate,"yyyy.MM.dd");
				v_refunddate	= FormatDate.getFormatDate(v_refunddate,"yyyy.MM.dd");

				if ("Y".equals(v_chkfirst) && "Y".equals(v_chkfinal)) {
					v_chkstatus = "����";
				}
				if ("Y".equals(v_chkfirst) && "B".equals(v_chkfinal)) {
					v_chkstatus = "���δ��";
				}
				if ("Y".equals(v_chkfirst) && "N".equals(v_chkfinal)) {
					v_chkstatus = "�ݷ�";
				}

%>
			<tr onmouseover="className='over'" onmouseout="className=' '">
				<td><%= v_classname %></td>
				<td class="ta_l"><%= v_subjnm %></td>
				<td class="num"><%= v_edustart %> ~ <%= v_eduend %><br /> <%= v_appdate %></td>
				<td class="fs_s"><%= v_chkstatus %><br /><%= "Y".equals(v_refundyn) ? "ȯ�ҿϷ�" : "�����Ϸ�" %></td>
<%
				if (v_rowspan != 0) {
%>
				<td class="fs_s" rowspan="<%= v_rowspan %>">
<%
	                if ("N".equals(v_refundyn) && "Y".equals(v_refundableyn)) {
    	            	if (!"".equals(dbox.getString("d_canceldate"))) {
%>
                  <span class="fc_96">��ҿ�û��</span><br/><span class="ff_t fs_s"><%= v_canceldate %></span>
<%
						} else {
							if ("Y".equals(v_cancelableyn)) {
%>
                  <a href="javascript:cancelPropose('<%= v_tid %>','<%= v_paymethod %>')" class="board_btn2"><span>�������</span></a>
<%
							} else {
%>
				  <a href="javascript:cancelApply('<%= v_tid %>','<%= v_paymethod %>')" class="board_btn2"><span>��ҿ�û</span></a>
<%
							}
						}
                	} else {
                		if ("Y".equals(v_refundyn)) {
%>
				  <span class="fc_96">�����</span><br/><span class="ff_t fs_s"><%= v_refunddate %></span>
<%
                		} else {
%>
						�Ⱓ����
<%
                		}
                	}
				}
%>
              </td>
			</tr>
<%
			}
		}
%>
<%
		if(i == 0){
%>
            <tr>
                <td colspan="8">������û �̷��� �����ϴ�.</td>
            </tr>
              <%
        }
%>
			</tbody>
			</table>
</form>
<!-- Form ���� ���� -->

<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->