<%
//**********************************************************
//  1. ��	  ��: zu_Subject_Bill_Result.jsp
//  2. ���α׷���: zu_Subject_Bill_Result.jsp
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
<%@page import="com.credu.Bill.BillBean"%><jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
	if (box == null) box = RequestManager.getBox(request);
	String p_action = box.get("p_action");
	String type = box.get("type");
	String resultCode = box.get("resultCode");
	int totalPrice = Integer.parseInt(box.get("totalPrice"));
	DataBox payMethodType = BillBean.getPayMethod();
%>
<%@ include file="/learn/user/portal/include/top.jsp"%>

<!-- ��ũ��Ʈ���� -->
<script>
	var openwin=window.open("/inicis/childwin.html","childwin","width=300,height=160");
	openwin.close();

	/*------------------------------------------------------------------------------------------------------*
         * 1. $inipay->m_resultCode 										*
         *       ��. �� �� �� ��: "00" �� ��� ���� ����[�������Ա��� ��� - ������ �������Ա� ��û�� �Ϸ�]	*
         *       ��. �� �� �� ��: "00"���� ���� ��� ���� ����  						*
         *------------------------------------------------------------------------------------------------------*/

	function show_receipt() // ������ ���
	{
		if("<%=resultCode%>" == "00")
		{
			var receiptUrl = "https://iniweb.inicis.com/DefaultWebApp/mall/cr/cm/mCmReceipt_head.jsp?noTid=" + "<%=box.get("tid")%>" + "&noMethod=1";
			window.open(receiptUrl,"receipt","width=430,height=700");
		}
		else
		{
			alert("�ش��ϴ� ���������� �����ϴ�");
		}
	}

	function errhelp() // �� �������� ���
	{
		var errhelpUrl = "http://www.inicis.com/ErrCode/Error.jsp?result_err_code=" + "<%=box.get("resulterrCode")%>"
						 + "&mid=" + "<%=box.get("mid")%>"
						 + "&tid=<%=box.get("tid")%>" 
						 + "&goodname=" + "<%=box.get("goodname")%>" 
						 + "&price=" + "<%=box.get("price")%>" 
						 + "&paymethod=" + "<%=box.get("payMethod")%>" 
						 + "&buyername=" + "<%=box.get("buyername")%>" 
						 + "&buyertel=" + "<%=box.get("buyertel")%>" 
						 + "&buyeremail=" + "<%=box.get("buyeremail")%>" 
						 + "&codegw=" + "<%=box.get("codegw")%>";
		window.open(errhelpUrl,"errhelp","width=520,height=150, scrollbars=yes,resizable=yes");
	}
</script>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->
<!-- form ���� -->

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
        <td><img src="/images/portal/homepage_renewal/myclass/stitle_06.gif" alt="��ٱ���" /></td>
        <td class="h_road">Home &gt; ���� ���ǽ�  &gt; <strong>��ٱ���</strong></td>
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
    <td><img src="/images/portal/homepage_renewal/myclass/toff_01.jpg" name="Image49" id="Image49" /></td>
    <td><img src="/images/portal/homepage_renewal/myclass/toff_02.jpg" name="Image50"  id="Image50" /></td>
    <td class="h_road" ><img src="/images/portal/homepage_renewal/myclass/ton_03.jpg" name="Image51" id="Image51" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

    <table border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="100" class="org"><div align="center"><img src="/images/portal/homepage_renewal/myclass/img_m_ok.jpg" width="388" height="70" /></div></td>
        </tr>
      <tr>
        <td>* ������û�Ͻ� ������ <strong>���� ���ǽ� &gt; ������ûȮ��/���</strong>���� Ȯ���Ͻ� �� �ֽ��ϴ�.</td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="20" height="40"><img src="/images/portal/homepage_renewal/common/icon_blue.jpg"/></td>
        <td><img src="/images/portal/homepage_renewal/myclass/sstitle_05.gif"/></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="1" colspan="2" bgcolor="#7692CB"></td>
      </tr>
      <% if( totalPrice > 0) { %>
      <tr>
        <td class="tit_table">��������</td>
        <td class="ct_tit_table_left"><a href="javascript:show_receipt()"><%=box.get("goodname")%></a></td>
      </tr>
      <tr>
        <td class="tit_table">�������</td>
        <td class="ct_tit_table_left"><a href="javascript:show_receipt()"><%= payMethodType.get(box.get("payMethod")) %></a></td>
      </tr>
      <tr>
        <td class="tit_table">�ſ�ī���ȣ</td>
        <td class="ct_tit_table_left"><a href="javascript:show_receipt()"><%= box.get("cardNumber") %></a></td>
      </tr>
      <tr>
        <td class="tit_table">���γ�¥</td>
        <td class="ct_tit_table_left"><%= box.getDate("pgAuthDate") %></td>
      </tr>
      <tr>
        <td class="tit_table">���νð�</td>
        <td class="ct_tit_table_left"><%= box.get("pgAuthTime") %></td>
      </tr>
      <tr>
        <td class="tit_table">���ι�ȣ</td>
        <td class="ct_tit_table_left"><a href="javascript:show_receipt()"><%= box.get("authCode") %></a></td>
      </tr>
      
      <tr>
        <td height="1" colspan="2" bgcolor="7692CB"></td>
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
        <td class="org">&nbsp;</td>
      </tr>
      <tr>
        <td height="25" class="blue_txt"> �ſ�ī�� �����ȳ�</td>
      </tr>
      <tr>
        <td>* �ſ�ī�� û������ &quot;�̴Ͻý�(inicis.com)&quot;���� ǥ��˴ϴ�.</td>
      </tr>
      <tr>
        <td>* LGī�� �� BCī���� ��� &quot;�̴Ͻý�(�̿� ������)&quot;���� ǥ��ǰ�, �Ｚī���� ��� &quot;�̴Ͻý�(�̿���� URL)&quot;�� <br />
          ��ǥ��˴ϴ�</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="25" class="blue_txt">������ü �����ȳ�</td>
      </tr>
      <tr>
        <td>* ������ ���忡�� &quot;�̴Ͻý�&quot;�� ǥ��˴ϴ�.</td>
      </tr>
      <%}else{ %>
      <tr>
        <td class="tit_table">��������</td>
        <td class="ct_tit_table_left"><%=box.get("goodname")%></td>
      </tr>
      <tr>
        <td class="tit_table">�������</td>
        <td class="ct_tit_table_left">����</td>
      </tr>
      <%} %>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><div align="right"><% if( totalPrice > 0) { %><a href="javascript:show_receipt()"><img src="/images/portal/homepage_renewal/myclass/btn_print2.jpg" alt="������ ���"  /></a><%} %><a href="javascript:menuForward('3', '17');"><img src="/images/portal/homepage_renewal/myclass/btn_list_ok_cc.jpg" alt="������û Ȯ��/���"  /></a><a href="javascript:menuMainForward('3','/servlet/controller.study.MyClassServlet?p_process=EducationSubjectPage');"><img src="/images/portal/homepage_renewal/myclass/btn_home.jpg" alt="Ȩ����"  /></a></div></td>
      </tr>
    </table></td>
    <td width="20">&nbsp;</td>

  </tr>
</table>
      	
      	
      	<%}else{ %>
<h2><img src="/images/portal/myclass/h2_tit3.gif" alt="��ٱ���" class="fl_l" /><p class="category">Home &gt; ���ǰ��ǽ� &gt; <strong>��ٱ���</strong></p></h2>

<ul class="basket_tab">
	<li><img src="/images/portal/myclass/basket_tab1.gif" alt="1.��û��� Ȯ��" /></li>
	<li><img src="/images/portal/myclass/basket_tab2_2.gif" alt="2.�������� Ȯ��" /></li>
	<li><img src="/images/portal/myclass/basket_tab3_on.gif" alt="3.�����Ϸ�" /></li>
</ul>

<div class="message_wrap mg_t15">
	<img src="/images/portal/myclass/basket_message.gif" alt="���� ��û�Ͻ� ������ ������ �Ϸ�Ǿ����ϴ�." />
	<p class="message_comment"><img src="/images/portal/ico/ico_comment_arrow.gif" alt="" />������û�Ͻ� ������ <strong>���� ���ǽ� &gt; ������ûȮ��/���</strong>���� Ȯ���Ͻ� �� �ֽ��ϴ�.</p>
</div>
			<h3><img src="/images/portal/myclass/stit_basket7.gif" alt="��������" /></h3>
			<table class="view_myclass">
			<colgroup><col width="18%" /><col width="82%" /></colgroup>
		<% if( totalPrice > 0) { %>
			<tr>
				<th>��������</th>
				<td class="txt end"><a href="javascript:show_receipt()"><%=box.get("goodname")%></a></td>
			</tr>
			<tr>
				<th>�������</th>
				<td class="txt end"><a href="javascript:show_receipt()"><%= payMethodType.get(box.get("payMethod")) %></a></td>
			</tr>
			<tr>
				<th>�ſ�ī���ȣ</th>
				<td class="txt end"><a href="javascript:show_receipt()"><%= box.get("cardNumber") %></a></td>
			</tr>
			<tr>
				<th>���γ�¥</th>
				<td class="txt end"><%= box.getDate("pgAuthDate") %></td>
			</tr>
			<tr>
				<th>���νð�</th>
				<td class="txt end"><%= box.get("pgAuthTime") %></td>
			</tr>
			<tr>
				<th>���ι�ȣ</th>
				<td class="txt end"><a href="javascript:show_receipt()"><%= box.get("authCode") %></a></td>
			</tr>
			</table>

			<div class="message_comment_list">
				<p class="tit">�ſ�ī�� �����ȳ�</p>
				<p class="message_comment"><img src="/images/portal/ico/ico_comment_arrow.gif" alt="" />�ſ�ī�� û������ "�̴Ͻý�(inicis.com)"���� ǥ��˴ϴ�.</p>
				<p class="message_comment"><img src="/images/portal/ico/ico_comment_arrow.gif" alt="" />LGī�� �� BCī���� ��� "�̴Ͻý�(�̿� ������)"���� ǥ��ǰ�, �Ｚī���� ��� "�̴Ͻý�(�̿���� URL)"�� ǥ��˴ϴ�.</p>
			</div>

			<div class="message_comment_list">
				<p class="tit">������ü �����ȳ�</p>
				<p class="message_comment"><img src="/images/portal/ico/ico_comment_arrow.gif" alt="" />������ ���忡�� "�̴Ͻý�"�� ǥ��˴ϴ�.</p>
			</div>
			<p class="board_btn ag_c mg_t40"><a href="javascript:show_receipt()" class="btn_gr"><span>������ ���</span></a><a href="javascript:menuForward('3', '17');" class="btn_gr"><span>������û Ȯ��/���</span></a><a href="javascript:menuMainForward('3','/servlet/controller.study.MyClassServlet?p_process=EducationSubjectPage');" class="btn_gr"><span> Ȩ����</span></a></p>
		<% } else { %>
			<tr>
				<th>��������</th>
				<td class="txt end"><%=box.get("goodname")%></td>
			</tr>
			<tr>
				<th>�������</th>
				<td class="txt end">����</td>
			</tr>
			</table>
			<p class="board_btn ag_c mg_t40"><a href="javascript:menuForward('3', '17');" class="btn_gr"><span>������û Ȯ��/���</span></a><a href="javascript:menuMainForward('3','/servlet/controller.study.MyClassServlet?p_process=EducationSubjectPage');" class="btn_gr"><span> Ȩ����</span></a></p>
		<% } %>
		<%} %>
<!-- form �� -->
<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->
