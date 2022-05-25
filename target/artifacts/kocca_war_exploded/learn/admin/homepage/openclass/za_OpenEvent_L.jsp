
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

    int v_dispnum   = 0;
    int v_totalpage = 0;
    
    int v_totalrowcount = 0;

    int v_pageno    = box.getInt("p_pageno");
    int v_pagesize 	= box.getInt("p_pagesize");

    String v_searchtext = box.getString("p_searchtext");
    String v_search     = box.getString("p_search");


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
	    $("#p_searchSdate").datepicker({
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
	            $("#p_searchEdate" ).datepicker( "option", "minDate", selectedDate );
	        }
	    });
	    $("#p_searchEdate").datepicker({
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
	            $("#p_searchSdate" ).datepicker( "option", "maxDate", selectedDate );
	        }
	    });
	    
	    $('#p_searchtext').keypress(function(){
	    	if(event.keyCode == 13){
	    		selectList();
	    	}
	    });
	
	    searchChange();
	});

    //����Ʈ ��ȸ
    function selectList() {
        document.form1.action = "/servlet/controller.homepage.OpenEventServlet";
        document.form1.p_process.value = "eventList";
        document.form1.p_pageno.value = "1";
        document.form1.target = "_self";
        document.form1.submit();
    }
    
    //������ �̵�
    function goPage(pageNum) {
	    document.form1.action = "/servlet/controller.homepage.OpenEventServlet";
	    document.form1.p_process.value = "eventList";
	    document.form1.p_pageno.value = pageNum;
        document.form1.target = "_self";
	    document.form1.submit();
    }
    
    //����Ʈ���� ���� ����
    function pagesize(pageSize) {
        document.form1.p_pagesize.value = pageSize;
        selectList();
    }
    
    
    
    //�Է�ȭ�� �̵�
    function insertPage() {
        document.form1.action = "/servlet/controller.homepage.OpenEventServlet";
        document.form1.p_process.value = "insertPage";
        document.form1.submit();
    }
    
    //����� ���������
    function detailPage(seq){
        document.form1.p_event_seq.value = seq;
        document.form1.action = "/servlet/controller.homepage.OpenEventServlet";
        document.form1.p_process.value = "detailPage";
        document.form1.submit();
    }
    
    //����������
    function updatePage(seq){
    	document.form1.p_event_seq.value = seq;
        document.form1.action = "/servlet/controller.homepage.OpenEventServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

    function searchChange(){
    	var v_search = document.form1.p_search.value;
    	if(v_search == "title"){
    		$('#titleLayer').show();
    		$('#dateLayer').hide();
    	}else{
    		$('#titleLayer').hide();
    		$('#dateLayer').show();
    	}
    }
//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
	<form name="form1" method="post">
		<input type="hidden" name="p_process" 	value=""> 
		<input type="hidden" name="p_event_seq" value=""> 
		<input type="hidden" name="p_pageno" 	value="<%=v_pageno %>"> 
		<input type="hidden" name="p_pagesize" 	value="<%=v_pagesize %>"> 


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
							<td align="right" width="85%">
								<select name="p_search" onchange="javascript:searchChange();">
									<option value='title' <% if (v_search.equals("title")) out.print("selected"); %>>�̺�Ʈ��</option>
									<option value='date' <% if (v_search.equals("date")) out.print("selected"); %>>�̺�Ʈ�Ⱓ</option>
								</select> 
								<span id="titleLayer">
									<input id="p_searchtext" name="p_searchtext" type="text" class="input" value='<%=v_searchtext %>'>
								</span>
								<span id="dateLayer">
									<input type="text" id="p_searchSdate" name="p_searchSdate" value="<%= box.getString("p_searchSdate") %>" class="input date" maxlength="10" size="12" /> 
									~ 
									<input type="text" id="p_searchEdate" name="p_searchEdate" value="<%= box.getString("p_searchEdate") %>" class="input date" maxlength="10" size="12" />
									�� �̺�Ʈ ������ ����
								</span>
							</td>
							<td align="right">
								<a href="javascript:selectList();"><img src="/images/admin/button/b_go.gif" border="0"></a> 
								<%if(BulletinManager.isAuthority(box, box.getString("p_canAppend"))) {%> 
									<a href="javascript:insertPage();"><img src="/images/admin/button/btn_add.gif" border="0"></a> 
								<%}%>
							</td>
						</tr>
					</table> 
					<br> 
					
					<!----------------- List ���� ----------------->
					<table class="table_out" cellspacing="1" cellpadding="5">
		                <tr>
		                    <td colspan="6" class="table_top_line"></td>
		                </tr>
		                <tr>
		                    <td class="table_title" width="5%"><b>NO</b></td>
		                    <td class="table_title"><b>�̺�Ʈ��</b></td>
		                    <td class="table_title" width="20%"><b>�̺�Ʈ�Ⱓ</b></td>
		                    <td class="table_title" width="12%"><b>��÷����¼�</b></td>
		                    <td class="table_title" width="10%"><b>��뿩��</b></td>
		                    <td class="table_title" width="10%"><b>����ڰ���</b></td>
		                </tr>
		                <%if(list != null && list.size() > 0){%>
		                	<%
		                		for(DataBox dbox : list){
		                			v_totalrowcount = dbox.getInt("d_tot_cnt");
		                			v_totalpage = dbox.getInt("d_totalpage");
		                	%>
	                				<tr>
	                					<td class="table_02_1" ><%=dbox.getString("d_event_seq")%></td>
	                					<td class="table_02_2" >
	                						<a href="#none" onclick="updatePage('<%=dbox.getString("d_event_seq")%>');"><%=dbox.getString("d_event_title")%></a>
	                					</td>
	                					<td class="table_02_1" >
	                						<%=dbox.getString("d_start_date")%> ~ <%=dbox.getString("d_end_date")%>
	                					</td>
	                					<td class="table_02_1" ><%=dbox.getString("d_study_limit")%></td>
	                					<td class="table_02_1" ><%=dbox.getString("d_use_yn")%></td>
	                					<td class="table_02_1" >
	                						<a href="#none" onclick="detailPage('<%=dbox.getString("d_event_seq")%>');"><img src="/images/admin/button/btn_checkok.gif"></a>
	                					</td>
	                				</tr>
		                	<%
		                		}
		                	%>
		                <%}else{%>
		                	<tr>
		                		<td class="table_02_1" colspan="6">��ȸ�� �����Ͱ� �����ϴ�.</td>
		                	</tr>
		                <%}%>
		            </table>
					<!----------------- List ���� ----------------->
					
					<!----------------- total ���� ----------------->
		            <br>
		            <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
		                <tr>
		                    <td align="right" valign="absmiddle">
		                        <%= PageUtil.printPageSizeList(v_totalpage, v_pageno, 0, v_pagesize, v_totalrowcount) %>
		                    </td>
		                </tr>
		            </table>
		            <!----------------- total �� ----------------->
				</td>
			</tr>
		</table>


		<%@ include file="/learn/library/getJspName.jsp"%>
	</form>
</body>
</html>
