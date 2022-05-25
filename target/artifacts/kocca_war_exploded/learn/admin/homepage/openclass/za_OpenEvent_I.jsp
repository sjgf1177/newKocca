
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

    ArrayList<DataBox> list = (ArrayList)request.getAttribute("list");
    ArrayList<DataBox> checkList = (ArrayList)request.getAttribute("checkList");
    
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
		$("#p_start_date").datepicker({
	        showOn: "both", // ��ư�� �ؽ�Ʈ �ʵ� ��� Ķ������ �����ش�.
	        buttonImage: "/images/portal/ico/ico_calendar.gif", // ��ư �̹���
	        buttonText: "�˻� ��������",
	        buttonImageOnly: true, // ��ư�� �ִ� �̹����� ǥ���Ѵ�.
	        changeMonth: true, // ���� �ٲܼ� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
	        changeYear: true, // ���� �ٲ� �� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
	        // minDate: "-7d", // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
	        maxDate: "100d", // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
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
	            $("#p_end_date" ).datepicker( "option", "minDate", selectedDate );
	        }
	    });
	    $("#p_end_date").datepicker({
	        showOn: "both", // ��ư�� �ؽ�Ʈ �ʵ� ��� Ķ������ �����ش�.
	        buttonImage: "/images/portal/ico/ico_calendar.gif", // ��ư �̹���
	        buttonText: "�˻� ��������",
	        buttonImageOnly: true, // ��ư�� �ִ� �̹����� ǥ���Ѵ�.
	        changeMonth: true, // ���� �ٲܼ� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
	        changeYear: true, // ���� �ٲ� �� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
	        // minDate: "-7d", // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
	        maxDate: "100d", // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
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
	            $("#p_start_date" ).datepicker( "option", "maxDate", selectedDate );
	        }
	    });
		
		
		$('#p_search_event').keypress(function(){
			if(event.keyCode == 13){
				searchOpenclass();
			}
		});
		
		$('#p_seq option').prop('selected', true);
	});

    //�̺�Ʈ �������
    function selectList() {
        document.form1.action = "/servlet/controller.homepage.OpenEventServlet";
        document.form1.p_process.value = "eventList";
        document.form1.p_pageno.value = "1";
        document.form1.target = "_self";
        document.form1.submit();
    }
    
    //�̺�Ʈ ���
    function whenInsert(){
    	
    	if($.trim($('#p_event_title').val()) == ""){
    		alert("�̺�Ʈ���� �Է��ϼ���.");
    		return;
    	}
    	if($('#p_start_date').val() == "" || $('#p_end_date').val() == ""){
    		alert("�̺�Ʈ�Ⱓ�� �Է��ϼ���.");
    		return;
    	}
    	
    	var limit = parseInt($.trim($('#p_study_limit').val()));
    	if(limit * 0 != 0){
    		alert("��÷��� ���¼��� �Է��ϼ���.");
    		return;
    	}
    	
    	if ( $("#p_seq option").size() == 0) {
            alert("��ϵ� ���°� �����ϴ�.");
            return;
        }
    	
    	$('#p_seq option').prop('selected', true);
        document.form1.action = "/servlet/controller.homepage.OpenEventServlet";
        document.form1.p_process.value = "insert";
        document.form1.submit();
    }
    
    // ���°˻�
    function searchOpenclass(){
    	$('#p_seq option').prop('selected', true);
    	document.form1.action = "/servlet/controller.homepage.OpenEventServlet";
        document.form1.p_process.value = "insertPage";
        document.form1.submit();
    }
    
    // ���� �߰�
    function fnSendToClassify() {
        if ( ($("#p_search_seq option:selected").length) == 0) {
            alert("�߰��� ���¸� �����ϼ���.");
            return false;
        }

        $("#p_search_seq option:selected").each( function() {
            $("#p_seq").append($(this));
        });
    }
    
    // ���� ����
    function fnRemoveFromClassify() {
        if ( ($("#p_seq option:selected").length) ==0 ) {
            alert("������ ���¸� �����ϼ���.");
            return false;
        }

        $("#p_seq option:selected").each( function() {
            $("#p_search_seq").append($(this));
        });
    }
    
//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
	<form name="form1" method="post">
		<input type="hidden" name="p_process" 		value=""> 
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
								<a href="javascript:whenInsert();"><img src="/images/admin/button/btn_apply.gif" border="0"></a> 
							</td>
						</tr>
					</table> 
					<br/> 
					
					<!----------------- �̺�Ʈ���� ���� ----------------->
					<table cellspacing="1" cellpadding="5" class="table_out">
						<colgroup>
							<col width="20%"/>
							<col width="*"/>
						</colgroup>
						<tr>
							<td colspan="2" class="table_top_line"></td>
						</tr>
						<tr>
							<td class="table_title"><b>�̺�Ʈ��</b></td>
							<td class="table_02_2">
								<input type="text" class="input" id="p_event_title" name="p_event_title" value="<%=box.getString("p_event_title")%>" style="width:80%;"/>
							</td>
						</tr>
						<tr>
							<td class="table_title"><b>�̺�Ʈ�Ⱓ</b></td>
							<td class="table_02_2">
								<input type="text" id="p_start_date" name="p_start_date" value="<%=box.getString("p_start_date")%>" class="input date" readonly="readonly" maxlength="10" size="12" /> 
								~ 
								<input type="text" id="p_end_date" name="p_end_date" value="<%=box.getString("p_end_date")%>" class="input date" readonly="readonly" maxlength="10" size="12" />
							</td>
						</tr>
						<tr>
							<td class="table_title"><b>��÷��� ���¼�</b></td>
							<td class="table_02_2">
								<input type="text" class="input" id="p_study_limit" name="p_study_limit" value="<%=box.getString("p_study_limit")%>"/>
							</td>
						</tr>
						<tr>
							<td class="table_title"><b>��뿩��</b></td>
							<td class="table_02_2">
								<input type="radio" id="p_use_y" name="p_use_yn" value="Y" checked="checked"/><label for="p_use_y">Y</label>
								<input type="radio" id="p_use_n" name="p_use_yn" value="N" /><label for="p_use_n">N</label>
							</td>
						</tr>
					</table>
					<br/>
					<!----------------- �̺�Ʈ���� ���� ----------------->
					
					<!-- ��� ȭ�� ���� //-->
		            <table cellspacing="1" cellpadding="5" class="table_out">
		                <colgroup>
		                    <col width="45%;" />
		                    <col width="10%;" />
		                    <col width="*;" />
		                </colgroup>
		                <tr>
		                    <td colspan="3" class="table_top_line"></td>
		                </tr>
		                <tr>
		                    <td class="table_title">
		                    	<input type="text" class="input" id="p_search_event" name="p_search_event" value="<%=box.getString("p_search_event") %>" style="width:60%;ime-mode:active;"/>
		                    	<a href="javascript:searchOpenclass();"><img src="/images/admin/button/b_go.gif" align="absmiddle"  border="0"></a>
		                    </td>
		                    <td class="table_title">������/<br/>�����ϱ�</td>
		                    <td class="table_title">��ϵ� ����</td>
		                </tr>
		                <tr>
		                    <td class="table_01">
		                        <select multiple id="p_search_seq" size="20" style="font-size:10pt; width:420px; background-color:#efefef;" ondblclick="fnSendToClassify();">
		                        <%if(list != null && list.size() > 0){%>
		                        	<%for(DataBox dbox : list){%>
		                        		<option value="<%= dbox.getString("d_seq") %>"><%= dbox.getString("d_lecnm") %></option>
		                        	<%}%>
		                        <%}%>
		                        </select>
		                    </td>
		                    <td class="table_02_1">
		                    	<input type="button" onclick="fnSendToClassify();" value="&gt;&gt;"/>
		                    	<br/><br/>
		                    	<input type="button" onclick="fnRemoveFromClassify();" value="&lt;&lt;"/>
		                    </td>
		                    <td class="table_01">
		                        <select multiple id="p_seq" name="p_seq" size="20" style="font-size:10pt; width:420px; background-color:#ffffb3;" ondblclick="fnRemoveFromClassify();">
		                        <%if(checkList != null && checkList.size() > 0){%>
		                        	<%for(DataBox dbox : checkList){%>
		                        		<option value="<%= dbox.getString("d_seq") %>"><%= dbox.getString("d_lecnm") %></option>
		                        	<%}%>
		                        <%}%>
		                        </select>
		                    </td>
		                </tr>
		            </table>
					
					
				</td>
			</tr>
		</table>


		<%@ include file="/learn/library/getJspName.jsp"%>
	</form>
</body>
</html>
