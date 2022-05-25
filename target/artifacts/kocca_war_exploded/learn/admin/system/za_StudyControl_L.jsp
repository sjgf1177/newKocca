<%
//**********************************************************
//  1. ��      ��: �н���������
//  2. ���α׷���: za_StudyControl_L.jsp
//  3. ��      ��: �н���������
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: S.W.Kang 2005. 02. 22
//  7. ��      ��: 
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %> 
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    
	//DataBox dbox = (DataBox)request.getAttribute("StudyControl");

    ArrayList list1 = (ArrayList)request.getAttribute("StudyControl1"); 		//�н���������
    ArrayList list2 = (ArrayList)request.getAttribute("StudyControl2"); 		//�������н���������

    String  ss_gubun     = box.getString("p_gubun");            //����
		String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
		String  s_gadmin			= box.getSession("gadmin");
	
	int		v_seq	= 0;

%>
<html>	
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script>
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language="Javascript">
$(document).ready(function(){
	$("#p_startdt").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_enddt").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_startdt_1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
<!--
	//�н����� ���۽ð� �����
	function make_st_time()
	{
  		var hour = document.form1.p_st_hour.options[document.form1.p_st_hour.selectedIndex].value;
  		var minute = document.form1.p_st_min.options[document.form1.p_st_min.selectedIndex].value;
  		var st_time = hour+minute;
  	return st_time;
	}

	//�н����� ����ð� �����
	function make_ed_time()
	{
  		var hour = document.form1.p_ed_hour.options[document.form1.p_ed_hour.selectedIndex].value;
  		var minute = document.form1.p_ed_min.options[document.form1.p_ed_min.selectedIndex].value;
  		var ed_time = hour+minute;
  		return ed_time;
	}

	//�н����� ���۽ð� �����(������� �϶�)
	function make_st_time2(seq)
	{
  		var hour = document.form1["p_st_hour"+seq].value;
  		var minute = document.form1["p_st_min"+seq].value;
  		var st_time2 = hour+minute;
  		return st_time2;
	}

	//�н����� ����ð� �����(������� �϶�)
	function make_ed_time2(seq)
	{
  		var hour = document.form1["p_ed_hour"+seq].value;
  		var minute = document.form1["p_ed_min"+seq].value;
  		var ed_time2 = hour+minute;
  		return ed_time2;
	}

	//�н��������� ����Ʈ ȭ�� ��ȸ��
	function whenSubmit() {
	    document.form1.target="_self";
		document.form1.p_process.value="ListPage";
		document.form1.submit();
	}

	//�н����������� ����Ҷ�
	function whenSave(sc) {

		  if(document.form1.s_company.value == "ALL"){
			alert("ȸ�縦 �����Ͽ� �ֽʽÿ�.");
			document.form1.s_company.focus();
			return;
		  }

		  if(document.form1.p_gubun.value == "ALL"){
			alert("������ �����Ͽ� �ֽʽÿ�.");
			document.form1.p_gubun.focus();
			return;
		  }


		if(sc == 0){

				var st_time = make_st_time();
				var ed_time = make_ed_time();
				
				if ( blankCheck(document.form1.p_startdt.value) )
				{
					alert("�н��������� �Է��Ͻʽÿ�.");
					return;
				}
				if ( blankCheck(document.form1.p_enddt.value) )
				{
					alert("�н��������� �Է��Ͻʽÿ�.");
					return;
				}

				if (document.form1.p_startdt.value > document.form1.p_enddt.value) {
					alert("�н����� �������� �н����� ������ �����̾�� �մϴ�.");
					return ;
				}
				
				if (st_time > ed_time) {
					alert("�н����� ���۽ð��� �н����� ����ð� �����̾�� �մϴ�.");
					return;
				}
				
				if (document.form1.p_day1.value > document.form1.p_day2.value) {
					alert("�н����� ���ۿ����� �н����� ������� �����̾�� �մϴ�.");
					return;
				}
		
				document.form1.p_starttime.value = st_time;
		  		document.form1.p_endtime.value = ed_time;
		  		document.form1.p_isholiday.value = "N";

		}else if(sc==1){

				if ( blankCheck(document.form1.p_startdt_1.value) )
				{
					alert("�н����� �������� �Է��Ͻʽÿ�.");
					return;
				}
				
				document.form1.target="_self";

				document.form1.p_startdt.value = document.form1.p_startdt_1.value;
				document.form1.p_enddt.value = document.form1.p_startdt_1.value;
		  		document.form1.p_isuse.value = document.form1.p_isuse_1.value;
		  		document.form1.p_isholiday.value = "Y";
		}

		document.form1.p_process.value= "Insert";
		document.form1.submit();
	}

	//�н����������� �����Ҷ�
	function whenUpdate(seq,sc) {

		if(sc == 0){

			if (document.form1["p_startdt"+seq].value > document.form1["p_enddt"+seq].value) {
				alert("�н����� �������� �н����� ������ �����̾�� �մϴ�.");
				return;
			}
			
			var st_time2 = make_st_time2(seq);
			var ed_time2 = make_ed_time2(seq);
			
			if (st_time2 > ed_time2) {
				alert("�н����� ���۽ð��� �н����� ����ð� �����̾�� �մϴ�.");
				return;
			}
			
			if (document.form1["p_day1"+seq].value > document.form1["p_day2"+seq].value) {
				alert("�н����� ���ۿ����� �н����� ������� �����̾�� �մϴ�.");
				return;
			}
			document.form1.target="_self";

			document.form1.p_startdt.value = document.form1["p_startdt"+seq].value;
			document.form1.p_enddt.value 	 = document.form1["p_enddt"+seq].value;
			document.form1.p_starttime.value = st_time2;
			document.form1.p_endtime.value 	 = ed_time2;
			document.form1.p_day1.value		 = document.form1["p_day1"+seq].value;
			document.form1.p_day2.value		 = document.form1["p_day2"+seq].value;
			document.form1.p_isuse.value	 = document.form1["p_isuse"+seq].value;
			document.form1.p_seq.value		 = seq;
//			document.form1.p_gubun.value	 = document.form1["p_gubun"+seq].value;

		}else {

			if ( blankCheck(document.form1["p_startdt_1"+seq].value) )
			{
				alert("�н����� �������� �Է��Ͻʽÿ�.");
				return;
			}

			document.form1.p_starttime.value = "";
			document.form1.p_endtime.value 	 = "";
			document.form1.p_day1.value		 = "";
			document.form1.p_day2.value		 = "";
			document.form1.p_seq.value		 = seq;
			document.form1.p_startdt.value = document.form1["p_startdt_1"+seq].value;
			document.form1.p_enddt.value = document.form1["p_startdt_1"+seq].value;
			document.form1.p_isuse.value = document.form1["p_isuse_1"+seq].value;
		}

		document.form1.p_process.value = "Update";
		document.form1.submit();
	}

	//�н����������� �����Ҷ�
	function whenDelete(seq) {
		if (confirm("�����Ͻðڽ��ϱ�?")) {
		    document.form1.target="_self";
			document.form1.p_seq.value 		= seq;
			document.form1.p_process.value 	= "Delete";
			document.form1.submit();
		}
	}

    function whenExpList(){
    	window.self.name = "openExpList1";     
        open_window("openExpList","","100","100","800","600","N","yes","yes","yes","yes");  
        document.form1.target = "openExpList";               
        document.form1.p_process.value = 'ExpListPage';		
        document.form1.submit();
    }

	function whenOrder(column) {

		if (document.form1.p_orderType.value == " asc") {
			document.form1.p_orderType.value = " desc";
		} else {
			document.form1.p_orderType.value = " asc";
		}

		document.form1.p_orderColumn.value = column;
		document.form1.target = "_self";
		document.form1.p_process.value = "ListPage";
		document.form1.submit();
	}

-->
</script>
</head>
<body topmargin=0 leftmargin=0>
<form name="form1" method="post" action="/servlet/controller.system.StudyControlServlet">
<input type="hidden" name="p_process" 	value="">
<input type="hidden" name="p_seq" 		value="">
<input type="hidden" name="p_orderColumn">
<input type="hidden" name="p_orderType" value="<%=v_orderType%>">
<input type="hidden" name="p_startdate" value="">
<input type="hidden" name="p_enddate" 	value="">
<input type="hidden" name="p_starttime" value="">
<input type="hidden" name="p_endtime" 	value="">
<input type="hidden" name="p_isholiday" 	value="">

<table width="1000" border="0" cellspacing="0" cellpadding="0">
	<tr>
    	<td align="center">
			<table width="970" border="0" cellspacing="0" cellpadding="0" class=page_title>
        		<tr> 
          			<td><img src="/images/admin/system/unite_title22.gif" ></td>
          			<td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        		</tr>
      		</table>
		   	<br>
	   		<table width="970" cellpadding="1" cellspacing="0" class="form_table_out">
        		<tr> 
          			<td align="center">
          				<table width="970" cellpadding="0" cellspacing="0" class="form_table_bg">
              				<tr> 
                				<td height="7"></td>
              				</tr>
              				<tr> 
                			  <td>
                				<table  border="0" cellspacing="0" cellpadding="0">
                    			  <tr> 
                      				<td> &nbsp; 
                      				<%
                      					if(s_gadmin.equals("A1")){
                      				%>
															<%= SelectCompanyBean.getCompany(box, false, true)%><!-- getCompany(RequestBox, isChange, isALL)    ȸ�� -->
															<%
																} else {
															%>
															<%= SelectCompanyBean.getCompany(box, false, false)%><!-- getCompany(RequestBox, isChange, isALL)    ȸ�� -->
															<%	}	%>
									</td>
                      				<td width=10></td>
                      				<td align="right"> ���� </td>
                      				<td>&nbsp;<%=CodeConfigBean.getCodeGubunSelect("0049","",1,"p_gubun",ss_gubun,"",2)%>
									</td>
                      				<td width=10></td>
                      				<td><a href="javascript:whenSubmit();"><img src="/images/admin/button/b_go.gif"  border="0"></a></td>
                      				<td width=10></td>
                      				<td width=250><a href="javascript:whenExpList()"> <img src="/images/admin/button/btn_studyhour.gif" border="0"></a></td>
                    			  </tr>
                  				</table>
                  			  </td>
              				</tr>
              				<tr> 
                			  <td height="7"></td>
              				</tr>
            			</table>
            		</td>
        		</tr>
      		</table>
	  		<br>
			<!-------------������ ����-------------------------->
 			<table width="970" border="0" cellspacing="0" cellpadding="0">
        		<tr> 
          			<td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          			<td class=sub_title>�н� �������� ���</td>
        		</tr>
        		<tr> 
          			<td height=6></td>
          			<td height=6></td>
        		</tr>
      		</table> 
        	<!--------------������ ��---------------------------->
        	<table width="970"  cellpadding="0" cellspacing="1" class="table_out">
          		<tr>
            		<td width="80" height="50" class="table_title">�Ⱓ����</td>
            		<td width="200" class="table_02_1" align="center"><input type="text" name="p_startdt" id="p_startdt" class="datepicker_input1" size=10 value="">
              		~ 
              		<input tpye="text" name="p_enddt" id="p_enddt" class="datepicker_input1" size=10 value=""></td>
            		<td width="80" height="50" class="table_title">�ð�����</td>
            		<td width="220" class="table_02_1" align="center">
            			<script>select_hhmm("p_st_hour",<%= FormatDate.getDate("HH") %>,"p_st_min",<%= FormatDate.getDate("mm") %>)</script>
            			~
            			<script>select_hhmm("p_ed_hour",<%= FormatDate.getDate("HH") %>,"p_ed_min",<%= FormatDate.getDate("mm") %>)</script>
            		</td>
            		<td width="80" height="50" class="table_title">���� ����</td>
            		<td width="160" class="table_02_1" align="center">
						<select name="p_day1">
							<option value="1">��</option>
							<option value="2">ȭ</option>
							<option value="3">��</option>
							<option value="4">��</option>
							<option value="5">��</option>
							<option value="6">��</option>
							<option value="7">��</option>
						</select>
						~
						<select name="p_day2">
							<option value="1">��</option>
							<option value="2">ȭ</option>
							<option value="3">��</option>
							<option value="4">��</option>
							<option value="5">��</option>
							<option value="6">��</option>
							<option value="7">��</option>
						</select>
            		</td>
              		<td width="100" class="table_title">��뿩��</td>
              		<td width="50" class="table_02_1">
              			<select name="p_isuse" class="inputsearch">
              				<option value="Y">Y</option>
              				<option value="N">N</option>
              			</select>
              		</td>
					<td width="50" class="table_02_1"><a href="javascript:whenSave('0')"><img src="/images/admin/button/btn_add.gif" border="0" tabindex=73></a></td>
          		</tr>
        	</table>
      		<br>
	  		<br>
			<!-------------������ ����-------------------------->
 			<table width="970" border="0" cellspacing="0" cellpadding="0">
        		<tr> 
          			<td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          			<td class=sub_title>������ �н� �������� ���</td>
            		
        		</tr>
        		<tr> 
          			<td height=6></td>
          			<td height=6></td>
        		</tr>
      		</table> 
        	<!--------------������ ��---------------------------->
        	<table width="970"  cellpadding="0" cellspacing="1" class="table_out">
          		<tr>
            		<td width="15%" height="50" class="table_title">�����ϼ���</td>
            		<td width="10%" class="table_02_1" align="left">
					  <input type="text" name="p_startdt_1" id="p_startdt_1" class="datepicker_input1" size=10 value="">
					</td>
              		<td width="15%" class="table_title">��뿩��</td>
              		<td width="5%" class="table_02_1">
              			<select name="p_isuse_1" class="inputsearch">
              				<option value="Y">Y</option>
              				<option value="N">N</option>
              			</select>
              		</td>
					<td class="table_02_2"><a href="javascript:whenSave('1')"><img src="/images/admin/button/btn_add.gif" border="0" tabindex=73></a></td>
				</tr>
        	</table>
      		<br>
			<br>

            <!-------------������ ����-------------------------->
 			<table width="970" border="0" cellspacing="0" cellpadding="0">
        		<tr> 
          			<td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          			<td class=sub_title>�н� �������� ����Ʈ</td>
        		</tr>
        		<tr> 
          			<td height=6></td>
          			<td height=6></td>
        		</tr>
      		</table> 
        	<!--------------������ ��---------------------------->
			<!--------------�н����� ���� ����Ʈ------------------>
			<table width="970" cellpadding="0" cellspacing="1" class="table_out">
				<tr>
					<td class="table_title" height="20"><a href="javascript:whenOrder('company')" class="e">ȸ��</a></td>
					<td class="table_title"><a href="javascript:whenOrder('gubun')" class="e">����</a></td>
					<td class="table_title"><a href="javascript:whenOrder('startdt')" class="e">�Ⱓ����</a></td>
					<td class="table_title">�ð�����</td>
					<td class="table_title">��������</td>
					<td class="table_title"><a href="javascript:whenOrder('isuse')" class="e">��뿩��</a></td>
					<td class="table_title">���</td>
				</tr>
				<%
				if (list1.size() != 0) {

					for (int i=0 ; i < list1.size() ; i++) {
						DataBox dbox = (DataBox)list1.get(i);
						v_seq	= dbox.getInt("d_seq");						
				%>
				<tr>
					<td class="table_02_1" width="20%"><%= dbox.getString("d_companynm")%></td>
					<td class="table_02_1" width="10%"><%=CodeConfigBean.getCodeName("0049",dbox.getString("d_gubun")) %></td>
					<td class="table_02_1"><input type="text" name="p_startdt<%=v_seq%>" class="input" size=10 OnClick="MiniCal(this)" readonly value="<%=FormatDate.getFormatDate(dbox.getString("d_startdt"),"yyyy-MM-dd")%>">
						~ <input type="text" name="p_enddt<%=v_seq%>" class="input" size=10 OnClick="MiniCal(this)" readonly value="<%=FormatDate.getFormatDate(dbox.getString("d_enddt"),"yyyy-MM-dd")%>">
					</td>
					<td class="table_02_1">
						<script>select_hhmm("p_st_hour<%=v_seq%>",<%= dbox.getString("d_starttime").substring(0,2) %>,"p_st_min<%=v_seq%>",<%= dbox.getString("d_starttime").substring(2,4) %>)</script>
						~ <script>select_hhmm("p_ed_hour<%=v_seq%>",<%= dbox.getString("d_endtime").substring(0,2) %>,"p_ed_min<%=v_seq%>",<%= dbox.getString("d_endtime").substring(2,4) %>)</script>
					</td>
					<td class="table_02_1">
						<select name="p_day1<%=v_seq%>">
							<option value="1" <%if (dbox.getString("d_day1").equals("1")) out.print("selected"); %>>��</option>
							<option value="2" <%if (dbox.getString("d_day1").equals("2")) out.print("selected"); %>>ȭ</option>
							<option value="3" <%if (dbox.getString("d_day1").equals("3")) out.print("selected"); %>>��</option>
							<option value="4" <%if (dbox.getString("d_day1").equals("4")) out.print("selected"); %>>��</option>
							<option value="5" <%if (dbox.getString("d_day1").equals("5")) out.print("selected"); %>>��</option>
							<option value="6" <%if (dbox.getString("d_day1").equals("6")) out.print("selected"); %>>��</option>
							<option value="7" <%if (dbox.getString("d_day1").equals("7")) out.print("selected"); %>>��</option>
						</select>
						~
						<select name="p_day2<%=v_seq%>">
							<option value="1" <%if (dbox.getString("d_day2").equals("1")) out.print("selected"); %>>��</option>
							<option value="2" <%if (dbox.getString("d_day2").equals("2")) out.print("selected"); %>>ȭ</option>
							<option value="3" <%if (dbox.getString("d_day2").equals("3")) out.print("selected"); %>>��</option>
							<option value="4" <%if (dbox.getString("d_day2").equals("4")) out.print("selected"); %>>��</option>
							<option value="5" <%if (dbox.getString("d_day2").equals("5")) out.print("selected"); %>>��</option>
							<option value="6" <%if (dbox.getString("d_day2").equals("6")) out.print("selected"); %>>��</option>
							<option value="7" <%if (dbox.getString("d_day2").equals("7")) out.print("selected"); %>>��</option>
						</select>
					</td>
					<td class="table_02_1">
						<select name="p_isuse<%=v_seq%>" class="inputsearch">
							<option value="Y" <% if(dbox.getString("d_isuse").equals("Y")) out.print("selected"); %>>Y</option>
							<option value="N" <% if(dbox.getString("d_isuse").equals("N")) out.print("selected"); %>>N</option>
						</select>
					</td>
					<td class="table_02_1">
						<a href="javascript:whenUpdate('<%=v_seq%>','0')"><img src="/images/admin/button/btn_save.gif" border="0"></a>
						<a href="javascript:whenDelete('<%=v_seq%>')"><img src="/images/admin/button/btn_del.gif" border="0"></a>
					</td>
				<%
					}
				}else {
				%>
				<tr>
                	<td class="table_02_1" colspan="7">��ϵ� ������ �����ϴ�</td>
              	</tr>
              	<%
              	}
              	%>
			</table>
			<!--------------�н����� ���� ����Ʈ ��--------------->
			<br><br>
			<br>
            <!-------------������ ����-------------------------->
 			<table width="970" border="0" cellspacing="0" cellpadding="0">
        		<tr> 
          			<td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          			<td class=sub_title>������ �н� �������� ����Ʈ</td>
        		</tr>
        		<tr> 
          			<td height=6></td>
          			<td height=6></td>
        		</tr>
      		</table> 
        	<!--------------������ ��---------------------------->
			<!--------------�н����� ���� ����Ʈ------------------>
			<table width="970" cellpadding="0" cellspacing="1" class="table_out">
				<tr>
					<td class="table_title" height="20"><a href="javascript:whenOrder('company')" class="e">ȸ��</a></td>
					<td class="table_title"><a href="javascript:whenOrder('gubun')" class="e">����</a></td>
					<td class="table_title"><a href="javascript:whenOrder('startdt')" class="e">������</a></td>
					<td class="table_title"><a href="javascript:whenOrder('isuse')" class="e">��뿩��</a></td>
					<td class="table_title">���</td>
				</tr>
				<%
				if (list2.size() != 0) {

					for (int i=0 ; i < list2.size() ; i++) {
						DataBox dbox = (DataBox)list2.get(i);
						v_seq	= dbox.getInt("d_seq");						
				%>
				<tr>
					<td class="table_02_1" width="20%"><%= dbox.getString("d_companynm")%></td>
					<td class="table_02_1" width="10%"><%=CodeConfigBean.getCodeName("0049",dbox.getString("d_gubun")) %></td>
					<td class="table_02_1"><input type="text" name="p_startdt_1<%=v_seq%>" class="input" size=10 OnClick="MiniCal(this)" readonly value="<%=FormatDate.getFormatDate(dbox.getString("d_startdt"),"yyyy-MM-dd")%>">
					</td>
					<td class="table_02_1">
						<select name="p_isuse_1<%=v_seq%>" class="inputsearch">
							<option value="Y" <% if(dbox.getString("d_isuse").equals("Y")) out.print("selected"); %>>Y</option>
							<option value="N" <% if(dbox.getString("d_isuse").equals("N")) out.print("selected"); %>>N</option>
						</select>
					</td>
					<td class="table_02_1">
						<a href="javascript:whenUpdate('<%=v_seq%>','1')"><img src="/images/admin/button/btn_save.gif" border="0"></a>
						<a href="javascript:whenDelete('<%=v_seq%>')"><img src="/images/admin/button/btn_del.gif" border="0"></a>
					</td>
				<%
					}
				}else {
				%>
				<tr>
                	<td class="table_02_1" colspan="7">��ϵ� ������ �����ϴ�</td>
              	</tr>
              	<%
              	}
              	%>
			</table>
			<!--------------�н����� ���� ����Ʈ ��--------------->
      		<br>
    	</td>
  	</tr>
  	<tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
</table>
</form>
<div id=minical OnClick="this.style.display='none';" oncontextmenu='return false' 
ondragstart='return false' onselectstart='return false' 
style="background : buttonface; margin: 5; margin-top: 2;border-top: 1 
solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1 
solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index: 99">
</div>
</body>
</html>