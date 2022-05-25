<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page errorPage="/learn/library/error.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.credu.library.*" %>
<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
	if(box == null) { box = RequestManager.getBox(request); }
	
	//����ü��з��ڵ� ����
	DataBox data = (DataBox)request.getAttribute("data");
	if(data == null) { data = new DataBox("data"); }
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
	$(document).ready(function(){
		
		//���� üũ
		isNumber("isNumber");
		
	});
	
	//�з� ��� ȭ��
	function fnCmdListPage(){
		
		$("#p_process").val("listPage");
		$("#form1").attr({
					action:"/servlet/controller.course.EduSystemChartServlet",
					method:"post",
					target:"_self"
					});
		$("#form1").submit();
	}
	
	//�з� ����
	function fnCmdUpdate(){
	
		if($.trim($("#p_chartname").val()) == ""){
			alert("�з��ڵ���� �Է����ּ���!");
			$("#p_chartname").focus();
			return;
		}
		if($.trim($("#p_chartorder").val()) == ""){
			alert("�з��ڵ� ������ �Է����ּ���!");
			$("#p_chartorder").focus();
			return;
		}
		
		//���� üũ
		isNumber("isNumber");
		
		if(confirm("�����Ͻðڽ��ϱ�?")){
			$("#p_process").val("update");
			$("#form1").attr({
						action:"/servlet/controller.course.EduSystemChartServlet",
						method:"post",
						target:"_self"
						});
			$("#form1").submit();
		}
	}
	
	
	//�з� ����
	function fnCmdDelete(){
		
		if(confirm("�����Ͻðڽ��ϱ�?")){
			$("#p_process").val("delete");
			$("#form1").attr({
						action:"/servlet/controller.course.EduSystemChartServlet",
						method:"post",
						target:"_self"
						});
			$("#form1").submit();
		}
	}
	
	
	//����üũ
	function isNumber(textId){
		var text = "";
		$("." + textId).bind("keydown keyup focusout ",function(e){
			if ((e.which && e.keyCode) &&
				(e.which != 8) && (e.keyCode != 8) &&
				(e.which != 37) && (e.keyCode != 37) &&
				(e.which != 39) && (e.keyCode != 39) &&
				(e.which != 46) && (e.keyCode != 46)) {
  			 	$(this).val( $(this).val().replace(/[^0-9]/gi,"") * 1 );
			}else{
				if($.trim($(this).val()) == ""){
					$(this).val("0");
				}
			}
  		});
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
				<button id="oRegBtn" name="btn" class="btn_reg" onclick="fnCmdDelete(); return false;">����</button>
			</td>
		</tr>
		<tr><td height="3"></td></tr>
	</table>
	<!-- ��ư ���� e -->
	
	
	<form name="form1" id="form1" method="post" action="/servlet/controller.course.EduSystemChartServlet">
		<input type="hidden" name="p_process" id="p_process" value="" />
		<input type="hidden" name="p_chartcode" id="p_chartcode" value="<%=box.getString("p_chartcode") %>" />
		<input type="hidden" name="p_codegubun" id="p_codegubun" value="<%=box.getString("p_codegubun") %>" />
		
		
		<!-- ���� ���� s -->
		<table cellspacing="1" cellpadding="5" class="table_out" summary="����ü�赵 �з� ����">
			<caption style="display: none;">����ü�赵 �з� ����</caption>
			<colgroup>
					<col width="20%" />
					<col width="*" />
				</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="table_title">���� �з�����</th>
					<td class="table_02_2">[<%=data.getString("d_upperchartcode") %>] <%=data.getString("d_upperchartname") %></td>
				</tr>
				<tr>
					<th scope="row" class="table_title">&#42;�з��ڵ�</th>
					<td class="table_02_2"><%=data.getString("d_chartcode") %></td>
				</tr>
				<tr>
					<th scope="row" class="table_title">&#42;�з��ڵ��</th>
					<td class="table_02_2"><input type="text" name="p_chartname" id="p_chartname" value="<%=data.getString("d_chartname") %>" style="width: 80%;" /></td>
				</tr>
				<tr>
					<th scope="row" class="table_title">&#42;�з��ڵ����</th>
					<td class="table_02_2"><input type="text" name="p_chartorder" id="p_chartorder" value="<%=data.getString("d_chartorder") %>" style="width: 10%;" class="isNumber" /></td>
				</tr>
				<tr>
					<th scope="row" class="table_title">&#42;��뿩��</th>
					<td class="table_02_2">
						<input type="radio" name="p_useyn" id="p_useyn_y" value="Y" <%="Y".equals(data.getString("d_useyn"))?"checked='checked'":"" %> /><label for="p_useyn_y">Y</label>
						<input type="radio" name="p_useyn" id="p_useyn_n" value="N" <%="N".equals(data.getString("d_useyn"))?"checked='checked'":"" %> /><label for="p_useyn_n">N</label>
					</td>
				</tr>
				<tr>
					<th scope="row" class="table_title">����</th>
					<td class="table_02_2">
						<textarea name="p_summary" id="p_summary" rows="8" cols="100" ><%= data.getString("d_summary") %></textarea>
					</td>
				</tr>
				<tr>
					<th scope="row" class="table_title">������</th>
					<td class="table_02_2">
						<textarea name="p_jobarea" id="p_jobarea" rows="8" cols="100" ><%= data.getString("d_jobarea") %></textarea>
					</td>
				</tr>
				<tr>
					<th scope="row" class="table_title">�ʿ俪��</th>
					<td class="table_02_2">
						<textarea name="p_capacity" id="p_capacity" rows="8" cols="100" ><%= data.getString("d_capacity") %></textarea>
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
