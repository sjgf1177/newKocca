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
<%!
	private void append(StringBuffer list, DataBox dbox) {
		list.append("<tr onmouseover=\"className='over'\" onmouseout=\"className=' '\">\n");
		list.append("	<td>" + dbox.get("d_classname") + "</td>\n");
		list.append("	<td class=\"ta_l\"><a href=\"\"><strong>" + dbox.get("d_subjnm") + "</strong></a></td>\n");
//�����Ⱓ/��û�Ⱓ	:	list.append("	<td class=\"num\">" + dbox.getDate("d_edustart") + "~" + dbox.getDate("d_edustart") + "<br /><span class=\"sdata\">" + dbox.getDate("d_propstart") + "~" + dbox.getDate("d_propend") + "</span></td>\n");
		list.append("	<td class=\"num\">" + dbox.getDate("d_edustart") + "~" + dbox.getDate("d_eduend") + "</span></td>\n");
//���ΰ�/������		list.append("	<td class=\"ta_r num\"><span class=\"td_lt\">" + dbox.getCommaInt("d_obiyong") + "��</span><br /><strong class=\"myclass\">" + dbox.getInt("d_biyong") + "��</strong></td>\n");
		list.append("	<td class=\"ta_r num\"><strong class=\"myclass\">" + dbox.getCommaInt("d_biyong") + "��</strong></td>\n");
		list.append("	<td><a href=\"javascript:fnSimpleDelete('" + dbox.get("d_subjnm") + "', '" + dbox.get("d_subj") + "','" + dbox.get("d_subjseq") + "', '" + dbox.get("d_year") + "');\" class=\"board_btn\"><span>����</span></a></td>\n");
		list.append("</tr>\n");
	}
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
	String p_specials = box.get("p_specials");
	String p_action = box.get("p_action");
	//String type = box.get("type");
	String v_upperclass = box.get("p_upperclass");
	int sumPrice = 0;
	int countPrice = 0;
	int biyong = 0;
	if (box == null) box = RequestManager.getBox(request);
	DataBox resultbox = (DataBox) request.getAttribute("resultbox");
	List<DataBox> proposeResultList = (List<DataBox>)resultbox.getObject("proposeResultList");		 // ���� ����Ʈ
	StringBuffer listY = new StringBuffer();
	StringBuffer listN = new StringBuffer();
	if (proposeResultList!=null) {
		for(DataBox dbox : proposeResultList) {
			if (dbox.get("d_chkfirst").equals("Y")) {
				biyong = dbox.getInt("d_biyong");
				sumPrice += biyong;
				if (biyong>0) countPrice++;
				append(listY, dbox);
			}
			else {
				append(listN, dbox);
			}
		}
	}
	
	// ������ ����
	int dis = resultbox.getInt("d_discount");
	int discountPrice = Integer.parseInt(Long.toString(sumPrice * dis/100));
	
	int usePoint = resultbox.getInt("d_getpoint") - (sumPrice - discountPrice) >= 0 ? (sumPrice - discountPrice) : resultbox.getInt("d_getpoint");
	%>

<%@ include file="/learn/user/portal/include/top.jsp"%>

<!-- ��ũ��Ʈ���� -->
<script language="JavaScript">
<!--//
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

	//������û
	function whenStartBill() {

		var lprice = document.form1.totalPrice.value;	// ���� �����ݾ�
		var tPrice = $("#sumPrice").val() * 1 - $("#discountPrice").val() * 1;	// ���� ���� �ݾ�
		var maxPoint = <%= resultbox.getInt("d_getpoint") %> * 1;	// ���� ����Ʈ

		var result_price;	// return ���� ���� �ݾ�

		if( lprice > 0 && lprice < 1000) {	// ���� �����ݾ��� õ�� �̸����� ������ ���� �ź�

			if( maxPoint < tPrice ) {	// ���� ����Ʈ�� ���� �ݾ׺��� ������
				
				var tusept = tPrice - 1000;	// ��밡���� �ִ� ����Ʈ
				var lpayprice = tPrice - tusept;
				
				$("#payPoint").val(tusept);
				$('#usePointTd').html("<input type='hidden' name='usePoint' value='"+tusept+"'/>- " + tusept + " ��");
				$('#totalPriceTd').html("<strong><em><input type='hidden' name='totalPrice' value='"+lpayprice+"'/>" + lpayprice + " ��</em></strong>");
				
			} else {	// ���� ����Ʈ�� �����ݾ׺��� ������

				$("#payPoint").val(tPrice);
				$('#usePointTd').html("<input type='hidden' name='usePoint' value='"+tPrice+"'/>- " + tPrice + " ��");
				$('#totalPriceTd').html("<strong><em><input type='hidden' name='totalPrice' value='0'/>0 ��</em></strong>");
				
			}

			alert("����/1000�� �̻� ������ �����մϴ�.");
			return;
			
		}
		
		document.form1.action = "/inicis/plugin_check_new.jsp";
		document.form1.submit();
		document.form1.target = "_self";
	}

	function show(x, y) {
		$('#list'+x).hide();
		$('#list'+y).fadeIn(700);
	}

	function whenPointChange(pointVar) {
		
		if(!numeric_chk(pointVar)) {
			$("#payPoint").val(<%= usePoint %>);
		}
		
		var point = pointVar.value;		// �Էµ� ����Ʈ ��
		var maxPoint = <%= resultbox.getInt("d_getpoint") %> * 1;	// ���� ����Ʈ
		
		if (point > maxPoint) {
			point = maxPoint;
			$("#payPoint").val(point);
		}
		
		var tPrice = $("#sumPrice").val() * 1 - $("#discountPrice").val() * 1;		// ���� ���� �ݾ�
		
		if ( tPrice < point ) {
			point = tPrice;
			$("#payPoint").val(point);
		}
		
		$('#usePointTd').html("<input type='hidden' name='usePoint' value='"+point+"'/>- " + point + " ��");
		
		var tPrice = $("#sumPrice").val()*1 - $("#discountPrice").val() * 1 - point * 1;
		
		$('#totalPriceTd').html("<strong><em><input type='hidden' name='totalPrice' value='"+tPrice+"'/>" + tPrice + " ��</em></strong>");
	}
	
	//���ɹ�ư Ŭ��
	function fnSimpleDelete(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10) {
		if (confirm(param1 + "������ ���� �����Ͻðڽ��ϱ�?")) {
				$.post("/servlet/controller.common.AjaxServlet"
						, {	  sqlNum:"propose.cancel", rerurnFunction:"simpleResult"
							, p_userid:"<%= box.getSession("userid")%>"
							, param1:param1
							, param2:param2
							, param3:param3
							, param4:param4
							, param5:param5
							, param6:param6
							, param7:param7
							, param8:param8
							, param9:param9
							, param10:param10
						}
						, function(data) {
							$("#ajaxDiv").html(data);
						});
		}
	}
	
	function simpleResult(data) {
		if (data.result=='true') {
			alert("�����Ͽ����ϴ�.");
			menuForward('3', '18');
		} 
		else alert("������ �����Ͽ����ϴ�.\n"+data.result);
	}
	
	$(document).ready(function(){
		<%--if(<%= proposeResultList==null || proposeResultList.size()==0 %>) {--%>
			<%--$("#startBillBtn").hide();--%>
			<%--alert("������û�� ������ �����ϴ�. �Ѱ� �̻���  ������ ��û�Ͽ� �ֽʽÿ�.");--%>
			<%--menuMainForward('3','/servlet/controller.study.MyClassServlet?p_process=EducationSubjectPage');--%>
		<%--}--%>
	});

//-->
</script>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ��������-->
<!-- form ���� -->
<form name="form1" action="/servlet/controller.propose.ProposeCourseServlet" method="post">
	<input type="hidden" name="p_upperclass"	value="<%=v_upperclass%>"/>
	<input type="hidden" name="p_process"	value="<%=box.get("p_process")%>"/>
	<input type="hidden" name="p_rprocess"	value=""/>
	<input type="hidden" name="p_action"	value="<%=p_action%>"/>
	<input type="hidden" name="p_dis"	value="<%=dis%>"/>
	
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
    <td><img src="/images/portal/homepage_renewal/myclass/ton_01.jpg" name="Image49" id="Image49" /></td>
    <td><img src="/images/portal/homepage_renewal/myclass/toff_02.jpg" name="Image50"  id="Image50" /></td>
    <td class="h_road" ><img src="/images/portal/homepage_renewal/myclass/toff_03.jpg" name="Image51" id="Image51" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="org">* ������ �Ϸ�Ǿ� ������û�� �Ϸ�˴ϴ�.</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="org">* �������� ������ ��� 1�� ���� ��, ����������� ��ȸ/���Ρ����� ������ �����Ͽ� �ֽñ� �ٶ��ϴ�.</td>
        <td class="h_road">
        	<a href="/servlet/controller.study.MyClassBillServlet?p_process=MyOffClassBillListPage">
        		<img src="/images/portal/homepage_renewal/myclass/btn_offline_ok.jpg" />
        	</a>
        </td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="20" height="40"><img src="/images/portal/homepage_renewal/common/icon_blue.jpg"/></td>
        <td><img src="/images/portal/homepage_renewal/myclass/sstitle_02.gif"/></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="tit_table">�з�</td>
        <td class="tit_table"> ������ </td>
        <td class="tit_table">������</td>
        <td class="tit_table">�����Ⱓ</td>
        <td class="tit_table_right">����</td>
      </tr>
      <%
	if (proposeResultList!=null) {
		for(DataBox dbox : proposeResultList) { %>
      <tr>
        <td class="ct_tit_table"><%=dbox.get("d_classname") %></td>
        <td class="ct_tit_table_left"><%=dbox.get("d_subjnm") %></td>
        <td class="ct_tit_table"><strong><%=dbox.get("d_biyong") %></strong></td>
        <td class="ct_tit_table"><%=dbox.getDate("d_edustart") %>~<%=dbox.getDate("d_eduend") %></td>
        <td class="ct_tit_table_right"><a href="javascript:fnSimpleDelete('<%=dbox.get("d_subjnm")%>','<%=dbox.get("d_subj")%>','<%=dbox.get("d_subjseq")%>','<%=dbox.get("d_year")%>');"><img src="/images/portal/homepage_renewal/myclass/btn_sdel.jpg" alt="����" /></a></td>
      </tr>
      <%} }%>
      <tr>
        <td height="1" colspan="5" bgcolor="#C6C6C6"></td>
        </tr>
      <tr>
        <td height="30" colspan="2"><div align="center"><strong>�� �ֹ��ݾ�</strong></div></td>
        <td colspan="3"><div align="center"><span class="rtxt"><strong><input type='hidden' name='totalPrice' value='<%= sumPrice %>'/><%= StringUtil.setString(sumPrice) %> ��</strong></span></div></td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      
      <tr>
        <td height="1" colspan="3" bgcolor="CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="3" bgcolor="F7F7F7"></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>
        	<div align="center">
        		<a href="javascript:whenStartBill();" class="btn_account">
        			<img src="/images/portal/homepage_renewal/myclass/btn_pok.jpg" alt="�����ϱ�"  />
        		</a>
        	</div></td>
      </tr>
    </table></td>
    <td width="20">&nbsp;</td>
   
  </tr>
</table>
			
			<%}else{ %>
	
	<h2><img src="/images/portal/myclass/h2_tit3.gif" alt="��ٱ���" class="fl_l" /><p class="category">Home &gt; ���ǰ��ǽ� &gt; <strong>��ٱ���</strong></p></h2>
	<ul class="basket_tab">
		<li><img src="/images/portal/myclass/basket_tab1_on.gif" alt="1.��û��� Ȯ��" /></li>
		<li><img src="/images/portal/myclass/basket_tab2.gif" alt="2.�������� Ȯ��" /></li>
		<li><img src="/images/portal/myclass/basket_tab3.gif" alt="3.�����Ϸ�" /></li>
	</ul>
    <br>
    �� ������ �Ϸ�Ǿ� ������û�� �Ϸ�˴ϴ�.<br>
    <span style="color:red;">��  <strong>�������� ����</strong>�� ��� 1�� ���� ��, <strong>����������� ��ȸ/���Ρ�</strong>���� ������ �����Ͽ� �ֽñ� �ٶ��ϴ�.</span>
    <a href="/servlet/controller.study.MyClassBillServlet?p_process=MyOffClassBillListPage"><span style="color:red;vertical-align:middle;"><img src="/images/portal/btn/btn_basket_buy.gif" alt="�����ϱ� �ٷΰ���" style="CURSOR:POINTER;"/></span></a>
<!-- 	<li>���� ��û �� ������ ������ 2���� <%//=resultbox.getInt("d_discount2")%>%~ 5���� <%//=resultbox.getInt("d_discount5")%>%�ý��� �ڵ����� �˴ϴ�.</li>  -->
	<h3 class=" mg_t30"><img src="/images/portal/myclass/stit_basket1.gif" alt="��û����" /></h3>

<div id="listY">
<!--
	****************
	1�� ������ ����ϰ� �Ǿ ���νÿ� �̽��ν� ������ �ʿ��ϸ� ����Ѵ�.
	****************
	<ul class="tabwrap mg_t35">
		<li><a href="javascript:show('N', 'Y');" class="tab_myclass tab_myclass_on"><span>���ΰ���</span></a></li>
		<li><a href="javascript:show('Y', 'N');" class="tab_myclass"><span>���δ�����</span></a></li>
	</ul>
	****************
	��
	****************
-->
	<table class="board_list">
	<colgroup><col width="110px" /><col width="270px" /><col width="150px" /><col width="90px" /><col width="70px" /></colgroup>
	<thead>
	<tr class="myclass">
		<th><p>�з�</p></th>
		<th><p>������</p></th>
		<th><p>�����Ⱓ</p></th>
		<th><p>������</p></th>
		<th class="end"><p>����</p></th>
	</tr>
	</thead>
	<tbody>
		<%= listY.toString() %>
	</tbody>
	</table>
</div>
<!--
	****************
	1�� ������ ����ϰ� �Ǿ ���νÿ� �̽��ν� ������ �ʿ��ϸ� ����Ѵ�.
	****************
<div id="listN" style="display:none">
	<ul class="tabwrap mg_t35">
		<li><a href="javascript:show('N', 'Y');" class="tab_myclass"><span>���ΰ���</span></a></li>
		<li><a href="javascript:show('Y', 'N');" class="tab_myclass tab_myclass_on"><span>���δ�����</span></a></li>
	</ul>
	<table class="board_list">
	<colgroup><col width="110px" /><col width="270px" /><col width="150px" /><col width="90px" /><col width="70px" /></colgroup>
	<thead>
	<tr class="myclass">
		<th><p>�з�</p></th>
		<th><p>������</p></th>
		<th><p>�����Ⱓ</p></th>
		<th><p>������</p></th>
		<th class="end"><p>����</p></th>
	</tr>
	</thead>
	<tbody>
		<%= listN.toString() %>
	</tbody>
	</table>
</div>
	****************
	��
	****************
  -->
<%	if (resultbox.getInt("d_getpoint")!=0) {%>
	<h3 class=" mg_t30"><img src="/images/portal/myclass/stit_basket2.gif" alt="����Ʈ���" /></h3>
	<div class="basket_point">
		<p class="point_info">���� ȸ������ ����Ͻ� �� �ִ� ����Ʈ�� <strong><%= resultbox.getCommaInt("d_getpoint") %> ����Ʈ</strong> �Դϴ�.<br/>
		����Ͻ� ����Ʈ�� �Է��Ͽ� �ֽʽÿ�.</p>
<!-- 		<p class="point_input"><input type="text" style="width:110px;" value="<%= StringUtil.setString(usePoint) %>" /><a href="" class="btn_wh"><span>����Ʈ���</span></a></p> -->
		<p class="point_input"><span>�������Ʈ</span> <input type="text" name="payPoint" id="payPoint" style="width:110px;" value="<%= usePoint %>" onkeyup="whenPointChange(this);"/></p>
	</div>
<%	}	else { %>
<input type="hidden" name="payPoint" id="payPoint" style="width:110px;" value="<%= usePoint %>" onkeyup="whenPointChange(this);"/>
<%	}	%>
	<h3 class=" mg_t30"><img src="/images/portal/myclass/stit_basket3.gif" alt="�� �����ݾ�" /></h3>
	<table class="box_list">
	<colgroup><col width="175px" /><col width="175px" /><col width="175px" /><col width="175px" /></colgroup>
	<thead>
	<tr>
		<th>������</th>
		<th>��������</th>
		<th>����Ʈ���</th>
		<th>�ǰ��� �ݾ�</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td><input type='hidden' name='sumPrice' id='sumPrice' value='<%= sumPrice %>'/><%= StringUtil.setString(sumPrice) %> ��</td>
		<td><input type='hidden' name='discountPrice' id='discountPrice' value='<%= discountPrice %>'/>- <%= StringUtil.setString(discountPrice) %> ��</td>
		<td id="usePointTd"><input type='hidden' name='usePoint' value='<%= usePoint %>'/>- <%= StringUtil.setString(usePoint) %> ��</td>
		<td id="totalPriceTd"><strong><em><input type='hidden' name='totalPrice' value='<%= sumPrice-discountPrice-usePoint %>'/><%= StringUtil.setString(sumPrice-discountPrice-usePoint) %></em> ��</strong></td>
	</tr>
	</tbody>
	</table>
	
	<p id="startBillBtn" class="board_btn ag_c mg_t20">
		<a href="javascript:whenStartBill();" class="btn_account"><span>�����ϱ�</span></a>
	</p>
	
	<%} %>
</form>
<!-- form �� -->

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->
