
<%
//**********************************************************
//  1. ��      ��: ����ڷ��
//  2. ���α׷��� : za_PdsAdmin_L.jsp
//  3. ��      ��: ����ڷ�� ����Ʈ
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 1. 2
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page errorPage="/learn/library/error.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.credu.homepage.*"%>
<%@ page import="com.credu.library.*"%>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    int v_pageno    = box.getInt("p_pageno");
    int v_pagesize 	= box.getInt("p_pagesize");

    String v_event_seq  = box.getString("p_event_seq");
    String v_searchtext = box.getString("p_searchtext");
    String v_search     = box.getString("p_search");
    String v_sdate     	= box.getString("p_searchSdate");
    String v_edate     	= box.getString("p_searchEdate");


    DataBox info = (DataBox)request.getAttribute("info");
    ArrayList<DataBox> countList = (ArrayList)request.getAttribute("countList");
    ArrayList<DataBox> list = (ArrayList)request.getAttribute("list");
%>


<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">



<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<link rel="stylesheet" type="text/CSS" href="/css/jquery-ui-1.10.4.css">
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="text/javascript" src="/script/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/script/jquery-ui-1.10.4.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
	/**
	 * ������ �ʱ�ȭ �Լ�
	 */
	$(document).ready( function() {
		$("#p_sdate").datepicker({
	        showOn: "both", // ��ư�� �ؽ�Ʈ �ʵ� ��� Ķ������ �����ش�.
	        buttonImage: "/images/portal/ico/ico_calendar.gif", // ��ư �̹���
	        buttonText: "�˻� ��������",
	        buttonImageOnly: true, // ��ư�� �ִ� �̹����� ǥ���Ѵ�.
	        changeMonth: true, // ���� �ٲܼ� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
	        changeYear: true, // ���� �ٲ� �� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
	        // minDate: "-7d", // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
	        maxDate: "0d", // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
	        nextText: "���� ��", // next �������� ����.
	        prevText: "���� ��", // prev �������� ����.
	        numberOfMonths: [1,1], // �ѹ��� �󸶳� ���� ���� ǥ���Ұ��ΰ�. [2,3] �� ���, 2(��) x 3(��) = 6���� ���� ǥ���Ѵ�.
	        stepMonths: 1, // next, prev ��ư�� Ŭ�������� �󸶳� ���� ���� �̵��Ͽ� ǥ���ϴ°�.
	        yearRange: "-5:", // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
	        showButtonPanel: true, // Ķ���� �ϴܿ� ��ư �г��� ǥ���Ѵ�.
	        currentText: "����" , // ���� ��¥�� �̵��ϴ� ��ư �г�
	        closeText: "�ݱ�",  // �ݱ� ��ư �г�
	        dateFormat: "yymmdd", // �ؽ�Ʈ �ʵ忡 �ԷµǴ� ��¥ ����.
	        showAnim: "slideDown", //�ִϸ��̼��� �����Ѵ�.
	        showMonthAfterYear: true , // ��, ����� ����Ʈ �ڽ��� ��,�� ������ �ٲ��ش�.
	        dayNamesMin: ["��", "ȭ", "��", "��", "��", "��", "��"], // ������ �ѱ� ����.
	        monthNamesShort: ["1��","2��","3��","4��","5��","6��","7��","8��","9��","10��","11��","12��"], // ���� �ѱ� ����.
	
	        onClose: function( selectedDate ) {
	            $("#p_edate" ).datepicker( "option", "minDate", selectedDate );
	        }
	    });
	    $("#p_edate").datepicker({
	        showOn: "both", // ��ư�� �ؽ�Ʈ �ʵ� ��� Ķ������ �����ش�.
	        buttonImage: "/images/portal/ico/ico_calendar.gif", // ��ư �̹���
	        buttonText: "�˻� ��������",
	        buttonImageOnly: true, // ��ư�� �ִ� �̹����� ǥ���Ѵ�.
	        changeMonth: true, // ���� �ٲܼ� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
	        changeYear: true, // ���� �ٲ� �� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
	        // minDate: "-7d", // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
	        maxDate: "0d", // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
	        nextText: "���� ��", // next �������� ����.
	        prevText: "���� ��", // prev �������� ����.
	        numberOfMonths: [1,1], // �ѹ��� �󸶳� ���� ���� ǥ���Ұ��ΰ�. [2,3] �� ���, 2(��) x 3(��) = 6���� ���� ǥ���Ѵ�.
	        stepMonths: 1, // next, prev ��ư�� Ŭ�������� �󸶳� ���� ���� �̵��Ͽ� ǥ���ϴ°�.
	        yearRange: "-5:", // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
	        showButtonPanel: true, // Ķ���� �ϴܿ� ��ư �г��� ǥ���Ѵ�.
	        currentText: "����" , // ���� ��¥�� �̵��ϴ� ��ư �г�
	        closeText: "�ݱ�",  // �ݱ� ��ư �г�
	        dateFormat: "yymmdd", // �ؽ�Ʈ �ʵ忡 �ԷµǴ� ��¥ ����.
	        showAnim: "slideDown", //�ִϸ��̼��� �����Ѵ�.
	        showMonthAfterYear: true , // ��, ����� ����Ʈ �ڽ��� ��,�� ������ �ٲ��ش�.
	        dayNamesMin: ["��", "ȭ", "��", "��", "��", "��", "��"], // ������ �ѱ� ����.
	        monthNamesShort: ["1��","2��","3��","4��","5��","6��","7��","8��","9��","10��","11��","12��"], // ���� �ѱ� ����.
	
	        onClose: function( selectedDate ) {
	            $("#p_sdate" ).datepicker( "option", "maxDate", selectedDate );
	        }
	    });
	});

    //�̺�Ʈ �������
    function selectList() {
        document.form1.action = "/servlet/controller.homepage.OpenEventServlet";
        document.form1.p_process.value = "eventList";
        document.form1.p_pageno.value = "1";
        document.form1.target = "_self";
        document.form1.submit();
    }
    
    function detailPage(){
        document.form1.action = "/servlet/controller.homepage.OpenEventServlet";
        document.form1.p_process.value = "detailPage";
        document.form1.submit();
    }
    
    // �����ٿ�ε�
    function whenExcel(){
    	document.form1.action = "/servlet/controller.homepage.OpenEventServlet";
        document.form1.p_process.value = "excel";
        document.form1.submit();
    }
    
//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
	<form name="form1" method="post">
		<input type="hidden" name="p_process" 		value=""> 
		<input type="hidden" name="p_event_seq" 	value="<%=v_event_seq%>"> 
		<input type="hidden" name="p_pageno" 		value="<%=v_pageno%>"> 
		<input type="hidden" name="p_pagesize" 		value="<%=v_pagesize%>"> 
		<input type="hidden" name="p_searchtext" 	value="<%=v_searchtext%>"> 
		<input type="hidden" name="p_search" 		value="<%=v_search%>"> 
		<input type="hidden" name="p_searchSdate" 	value="<%=v_sdate%>"> 
		<input type="hidden" name="p_searchEdate" 	value="<%=v_edate%>"> 


		<table width="1000" border="0" cellspacing="0" cellpadding="0" height="600">
			<tr>
				<td align="center" valign="top">
					<!----------------- title ���� ----------------->
					<table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
						<tr>
							<td><img src="/images/admin/portal/s.1_41.gif"></td>
							<td align="right"><img src="/images/admin/common/sub_title_tail.gif"></td>
						</tr>
					</table> 
					<!----------------- title �� -----------------> 
					<br>
					
					
					<table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
						<tr valign="middle">
							<td align="right">
								<a href="javascript:selectList();"><img src="/images/admin/button/btn_return.gif" border="0"></a> 
							</td>
						</tr>
					</table> 
					<br/> 
					
					<!----------------- �̺�Ʈ���� ���� ----------------->
					<table cellspacing="1" cellpadding="5" class="table_out">
						<colgroup>
							<col width="15%"/>
							<col width="50%"/>
							<col width="15%"/>
							<col width="20%"/>
						</colgroup>
						<tr>
							<td colspan="4" class="table_top_line"></td>
						</tr>
						<tr>
							<td class="table_title"><b>�̺�Ʈ��</b></td>
							<td class="table_02_2"><%=info.getString("d_event_title")%></td>
							<td class="table_title"><b>��뿩��</b></td>
							<td class="table_02_2"><%=info.getString("d_use_yn")%></td>
						</tr>
						<tr>
							<td class="table_title"><b>�̺�Ʈ�Ⱓ</b></td>
							<td class="table_02_2"><%=info.getString("d_start_date")%> ~ <%=info.getString("d_end_date")%></td>
							<td class="table_title"><b>��÷��� ���¼�</b></td>
							<td class="table_02_2"><%=info.getString("d_study_limit")%></td>
						</tr>
					</table>
					<br/>
					<!----------------- �̺�Ʈ���� ���� ----------------->
					 
					<!----------------- List ���� ----------------->
					<table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
						<tr valign="middle">
							<td align="right" width="95%">
								�̺�Ʈ ���� ������
								<input type="text" id="p_sdate" name="p_sdate" value="<%= box.getString("p_sdate") %>" class="input date" maxlength="10" size="12" /> 
								~ 
								<input type="text" id="p_edate" name="p_edate" value="<%= box.getString("p_edate") %>" class="input date" maxlength="10" size="12" />
							</td>
							<td align="right">
								<a href="javascript:detailPage();"><img src="/images/admin/button/b_go.gif" border="0"></a> 
							</td>
						</tr>
					</table> 
					<table class="table_out" cellspacing="1" cellpadding="5">
		                <tr>
		                    <td colspan="8" class="table_top_line"></td>
		                </tr>
		                <tr>
		                    <td class="table_title" width="5%"><b>�����ڵ�</b></td>
		                    <td class="table_title"><b>���¸�</b></td>
		                    <td class="table_title" width="15%"><b><%=box.getDate("p_sdate", ".")%> ~ <%=box.getDate("p_edate", ".")%></b></td>
		                    <td class="table_title" width="15%"><b>�̺�Ʈ�Ⱓ(��ü)</b></td>
		                    <td class="table_title" width="15%"><b>�̺�Ʈ�Ⱓ(�α���)</b></td>
		                </tr>
		                <%if(countList != null && countList.size() > 0){%>
		                	<%
		                		int prev_total = 0;
		                		int event_total = 0;
		                		int login_total = 0;
		                		for(DataBox dbox : countList){
		                			prev_total += dbox.getInt("d_prev_count");
		                			event_total += dbox.getInt("d_event_all_count");
		                			login_total += dbox.getInt("d_login_count");
		                	%>
	                				<tr>
	                					<td class="table_02_1"><%=dbox.getString("d_seq")%></td>
	                					<td class="table_02_2"><%=dbox.getString("d_lecnm")%></td>
	                					<td class="table_02_1"><%=dbox.getString("d_prev_count")%></td>
	                					<td class="table_02_1"><%=dbox.getString("d_event_all_count")%></td>
	                					<td class="table_02_1"><%=dbox.getString("d_login_count")%></td>
	                				</tr>
		                	<%
		                		}
		                		if(countList != null && countList.size() > 0){
		                	%>
	                				<tr>
	                					<td class="table_01" colspan="2"><b>��  ��</b></td>
	                					<td class="table_01"><b><%=prev_total%></b></td>
	                					<td class="table_01"><b><%=event_total%></b></td>
	                					<td class="table_01"><b><%=login_total%></b></td>
	                				</tr>
		                	<%
		                		}
		                	%>
		                <%}else{%>
		                	<tr>
		                		<td class="table_02_1" colspan="8">��ȸ�� �����Ͱ� �����ϴ�.</td>
		                	</tr>
		                <%}%>
		            </table>
		            <br/>
					<!----------------- List ���� ----------------->
					 
					 
					<table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
						<tr valign="middle">
							<td align="right">
								<a href="javascript:whenExcel();"><img src="/images/admin/button/btn_excell_print.gif" border="0"></a> 
							</td>
						</tr>
					</table> 
					
					<!----------------- List ���� ----------------->
					<table class="table_out" cellspacing="1" cellpadding="5">
		                <tr>
		                    <td colspan="9" class="table_top_line"></td>
		                </tr>
		                <tr>
		                    <td class="table_title" width="3%"><b>No</b></td>
		                    <td class="table_title" width="5%"><b>���̵�</b></td>
		                    <td class="table_title" width="5%"><b>�̸�</b></td>
		                    <td class="table_title" width="5%"><b>�̸���</b></td>
		                    <td class="table_title" width="0%"><b>��ȭ��ȣ</b></td>
		                    <td class="table_title" width="5%"><b>�����ڵ�</b></td>
		                    <td class="table_title"><b>���¸�</b></td>
		                    <td class="table_title" width="8%"><b>�н��Ͻ�</b></td>
		                    <td class="table_title" width="5%"><b>�н�Ƚ��</b></td>
		                </tr>
		                <%if(list != null && list.size() > 0){%>
		                	<%
		                		int v_row = 1;
		                		int v_row_cnt = 1;
		                		String v_userid = "";
		                		String v_name 	= "";
		                		String v_email	= "";
		                		String v_handphone = "";
		                		String v_seq	= "";
		                		String v_userid_tmp = "";
		                		String v_lecnm	= "";
		                		for(DataBox dbox : list){
		                			v_row_cnt = dbox.getInt("d_row_cnt");
		                			v_userid	= dbox.getString("d_userid");
		                			v_name		= dbox.getString("d_name");
		                			v_email		= dbox.getString("d_email");
		                			v_handphone	= dbox.getString("d_handphone");
		                			v_seq		= dbox.getString("d_seq");
		                			v_lecnm 	= dbox.getString("d_lecnm");
		                	%>
	                				<tr>
	                					<%if(!v_userid_tmp.equals(v_userid)){%>
	                					<%v_userid_tmp = v_userid;%>
	                					<td class="table_02_1" rowspan="<%=v_row_cnt%>"><%=v_row++%></td>
	                					<td class="table_02_1" rowspan="<%=v_row_cnt%>"><%=v_userid%></td>
	                					<td class="table_02_1" rowspan="<%=v_row_cnt%>"><%=v_name%></td>
	                					<td class="table_02_2" rowspan="<%=v_row_cnt%>"><%=v_email%></td>
	                					<td class="table_02_1" rowspan="<%=v_row_cnt%>"><%=v_handphone%></td>
	                					<%}%>
	                					<td class="table_02_1"><%=v_seq%></td>
	                					<td class="table_02_2"><%=v_lecnm%></td>
	                					<td class="table_02_1"><%=dbox.getString("d_study_date")%></td>
	                					<td class="table_02_1"><%=dbox.getString("d_study_count")%></td>
	                				</tr>
		                	<%
		                		}
		                	%>
		                <%}else{%>
		                	<tr>
		                		<td class="table_02_1" colspan="9">��ȸ�� �����Ͱ� �����ϴ�.</td>
		                	</tr>
		                <%}%>
		            </table>
					<!----------------- List ���� ----------------->
					
				</td>
			</tr>
		</table>


		<%@ include file="/learn/library/getJspName.jsp"%>
	</form>
</body>
</html>
