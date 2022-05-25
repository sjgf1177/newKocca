<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page errorPage="/learn/library/error.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.credu.library.*" %>
<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
	if(box == null) { box = RequestManager.getBox(request); }
	
	
	//B2C ��ü���԰��� ���
	ArrayList<DataBox> subjAll = (ArrayList<DataBox>) request.getAttribute("subjAll");
	
	//B2C ��ü�������� ���
	ArrayList<DataBox> goldAll = (ArrayList<DataBox>) request.getAttribute("goldAll");
	
	//����ü�赵�� ����� ���� ���
	ArrayList<DataBox> subjSelect = (ArrayList<DataBox>) request.getAttribute("subjSelect");
	
	

%>
<!doctype html>
<html>
<head>
<title>����ü�赵 ���� - ���� - ������ - �ѱ���������ī����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="text/javascript" src="/script/jquery-1.3.2.min.js"></script>
<script type="text/javascript">

	//jQuery Ready
	$(document).ready(function(){
		
		var mvalue = "subjSelect";
		var unmvalue = "subjAll";
		
		$("#moveRight_"+mvalue).click(function (){
			optionSelMove(mvalue, unmvalue);
		});
		
		$("#moveLeft_"+mvalue).click(function (){
			optionAllMove(mvalue, unmvalue);
		});
		
		$("#moveRightAll_"+mvalue).click(function (){
			optionSelMoveAll(mvalue, unmvalue);
		});
		
		$("#moveLeftAll_"+mvalue).click(function (){
			optionAllMoveAll(mvalue, unmvalue);
		});
		
	});

	//���õ� �׷����� �̵�
	function optionSelMove(mvalue, unvalue){
		$("#"+unvalue+" option:selected").each(function() {
			var opt = $(this).clone();
			$(this).remove();
			opt.removeAttr("selected");
			$("#"+mvalue).append(opt);
		});
	}
	
	//���õ��� ���� �׷����� �̵�
	function optionAllMove(mvalue, unvalue){
		$("#"+mvalue+" option:selected").each(function() {
			var opt = $(this).clone();
			$(this).remove();
			opt.removeAttr("selected");
			$("#"+unvalue).append(opt);
		});
	}
	
	//���õ� �׷����� ��ü �̵�
	function optionSelMoveAll(mvalue, unvalue){
		$("#"+unvalue+" option").each(function() {
			$(this).attr("selected","selected");
		});
		optionSelMove(mvalue, unvalue);
	}
	
	//���õ��� ���� �׷����� ��ü �̵�
	function optionAllMoveAll(mvalue, unvalue){
		$("#"+mvalue+" option").each(function() {
			$(this).attr("selected","selected");
		});
		
		optionAllMove(mvalue, unvalue);
	}
	
	
	//���õ� ���� ����
	function fnCmdUpdate(){
		
		$("#subjSelect > option").each(function() {
			$(this).attr("selected","selected");
		});
	
		
		if(confirm("�����Ͻðڽ��ϱ�?")){
			$("#p_process").val("subjcourseUpdate");
			$("#form1").attr({
						action:"/servlet/controller.course.EduSystemChartServlet",
						method:"post",
						target:"_self"
						});
			$("#form1").submit();
		}
	}
	
	//��� 
	function fnCmdListPage(){
		
		$("#p_process").val("listPage");
		$("#form1").attr({
					action:"/servlet/controller.course.EduSystemChartServlet",
					method:"post",
					target:"_self"
					});
		$("#form1").submit();
	}
	

</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
<tr>
<td align="center" valign="top">


	<!-- content ���� s -->
	<!-- content ���� s -->
	<!-- content ���� s -->
	<!-- content ���� s -->
	<!-- content ���� s -->



	<!-- title ���� s -->
	<table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
		<tr>
			<td style="text-align:left;"><img src="/images/admin/course/c_title01.gif" ></td> <!-- ��� �޴��� -->
			<td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
		</tr>
	</table>
	<!-- title ���� e -->
	<br />
	
	<!-- ��ư ���� s -->
	<table cellpadding="0" cellspacing="0" class="table1">
		<tr>
			<td align="right" height="20">
				<button id="oRegBtn" name="btn" class="btn_reg" onclick="fnCmdListPage(); return false;">���</button>
				<button id="oRegBtn" name="btn" class="btn_reg" onclick="fnCmdUpdate(); return false;">����</button>
			</td>
		</tr>
		<tr><td height="3"></td></tr>
	</table>
	<!-- ��ư ���� e -->
	
	
	<form name="form1" id="form1" method="post" action="/servlet/controller.course.EduSystemChartServlet">
		<input type="hidden" name="p_process" id="p_process" value="" />
		<input type="hidden" name="p_chartcode" id="p_chartcode" value="<%=box.getString("p_chartcode") %>" />
		
		
		
		<!-- ���� ���� s -->
		<table cellspacing="1" cellpadding="5" class="table_out" summary="����ü�赵 ��������">
			<caption style="display: none;">����ü�赵 ��������</caption>
			<colgroup>
				<col width="47%" />
				<col width="6%" />
				<col width="47%" />
			</colgroup>
			<thead>
				<th scope="col" class="table_title">��ü���� ���</th>
				<th scope="col" class="table_title"></th>
				<th scope="col" class="table_title">���ð��� ���</th>
			</thead>
			<tbody>
				<tr>
					<td class="table_02_2">
						<span style="width:98%;">���԰���</span>
						<select id="subjAll" name="subjAll" style="width:98%; height:250px" multiple="multiple">
							<%
								if(subjAll != null && subjAll.size() > 0){
									for(DataBox alldata : subjAll){
							%>
							<option value="<%=alldata.getString("d_subj") %>">[<%=alldata.getString("d_subj") %>]<%=alldata.getString("d_subjnm") %></option>
							<%			
									}
								}
							%>
						
						</select>
						<br/>
						<br/>
						<span style="width:98%;">��������</span>
						<select id="goldAll" name="goldAll" style="width:98%; height:250px" multiple="multiple">
							<%
								if(goldAll != null && goldAll.size() > 0){
									for(DataBox alldata : goldAll){
							%>
							<option value="<%=alldata.getString("d_seq") %>">[<%=alldata.getString("d_seq") %>]<%=alldata.getString("d_lecnm") %></option>
							<%			
									}
								}
							%>
						
						</select>						
					</td>
					<td class="table_02_3">
						<button type="button" id="moveRight_subjSelect" name="btn" class="btn_reg" onclick="return false;">&#62;</button><br />
						<button type="button" id="moveLeft_subjSelect" name="btn" class="btn_reg" onclick="return false;">&#60;</button><br />
						<br />
						<button type="button" id="moveRightAll_subjSelect" name="btn" class="btn_reg" onclick="return false;">&#62;&#62;</button><br />
						<button type="button" id="moveLeftAll_subjSelect" name="btn" class="btn_reg" onclick="return false;">&#60;&#60;</button><br />
					</td>
					<td class="table_02_2">
						<select id="subjSelect" name="subjSelect" style="width:98%; height:550px" multiple="multiple">
							<%
								if(subjSelect != null && subjSelect.size() > 0){
									for(DataBox selectdata : subjSelect){
							%>
							<option value="<%=selectdata.getString("d_subj") %>">[<%=selectdata.getString("d_subj") %>]<%=selectdata.getString("d_subjnm") %></option>
							<%			
									}
								}
							%>
						</select>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- ���� ���� e -->
		
	</form>
	<br />
	
	
	
	
	
	
	<!-- content ���� e -->
	<!-- content ���� e -->
	<!-- content ���� e -->
	<!-- content ���� e -->
	<!-- content ���� e -->
	
	
</td>
</tr>
<tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
</table>
</body>
</html>
