<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page errorPage="/learn/library/error.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.credu.library.*" %>
<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
	if(box == null) { box = RequestManager.getBox(request); }
	
	
	//�ֻ��� ����ü��з��ڵ� ���
	ArrayList<DataBox> uLChartCodeList = (ArrayList<DataBox>) request.getAttribute("uLChartCodeList");


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
		
		//���� üũ
		isNumber("isNumber");
		
		
		if(Number($("#p_codegubun").val()) > 2){
			
			$(".upperchartselectbox").change(function (){
				if(Number($(".upperchartselectbox:last").attr("ordr")) > Number($(this).attr("ordr"))){
					fnCmdChartList($(this));
				}
				
			});
		}
		
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
	
	//�з� ���
	function fnCmdInsert(){
		
	
		if(Number($("#p_codegubun").val()) > 1){
			
			if($("#p_maxupperchart").val() == ""){
				alert("�����з��ڵ带 �������ּ���!");
				$("#p_maxupperchart").focus();
				return;
			}
		}
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
		
		if(confirm("�����Ͻðڽ��ϱ�?")){
			$("#p_process").val("insert");
			$("#form1").attr({
						action:"/servlet/controller.course.EduSystemChartServlet",
						method:"post",
						target:"_self"
						});
			$("#form1").submit();
		}
	}
	
	
	//����ü��з� ���� ��� ��������
	function fnCmdChartList($this){
		
		var ordr = $this.attr("ordr");
		var depth = Number($("#p_codegubun").val())-3;
		
		$(".upperchartselectbox").each(function(index) {
        	if(Number($(this).attr("ordr")) > ordr){
        		$(this).find("option").remove();
        		$(this).append("<option value=\"\">����</option>");
        	}
       	});
		
		$.ajax({
	        type: "POST",
	        dataType:"json",
	        url:"/servlet/controller.course.EduSystemChartServlet",
	        data: {
	            "p_process": "uLChartCodeList",
	            "p_codeselect": $("#p_codegubun").val(),
	            "p_upperchartcode": $this.val().split("_")[1]
	        },
	        success: function(data) {
	        	
	        	$("#p_lowchartgubun").val(depth);
	        	
	        	$("#p_upperchartcode_"+ordr+" > option").remove();
        		$("#p_upperchartcode_"+ordr).append("<option value=\"\">����</option>")
	        	$.each(data, function(idx, obj) {
	        		$("#p_upperchartcode_"+ordr).append("<option value=\""+obj.d_maxupperchartcode+"_"+obj.d_chartcode+"\">"+ obj.d_chartname +"</option>")
	        	});
			},
			error:function (){
				$("#p_upperchartcode_"+ordr+" > option").remove();
        		$("#p_upperchartcode_"+ordr).append("<option value=\"\">����</option>")
			}
	  	});
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
							<button id="oRegBtn" name="btn" class="btn_reg" onclick="fnCmdInsert(); return false;">����</button>
						</td>
					</tr>
					<tr><td height="3"></td></tr>
				</table>
				<!-- ��ư ���� e -->
	
				<form name="form1" id="form1" method="post" action="/servlet/controller.course.EduSystemChartServlet">
					<input type="hidden" name="p_process" id="p_process" value="" />
					<input type="hidden" name="p_codegubun" id="p_codegubun" value="<%=box.getInt("p_codegubun") %>" />
					<input type="hidden" name="p_lowchartgubun" id="p_lowchartgubun" value="" />
				
					<!-- ��� ���� s -->
					<table cellspacing="1" cellpadding="5" class="table_out" summary="����ü�赵 �з� ���">
						<caption style="display: none;">����ü�赵 �з� ���</caption>
						<colgroup>
								<col width="20%" />
								<col width="*" />
							</colgroup>
						<tbody>
							<tr>
								<th scope="row" class="table_title">&#42;�з��ڵ�</th>
								<td class="table_02_2">&#42;�ý��� �ڵ��ο�</td>
							</tr>
							
							<%
								if(box.getInt("p_codegubun") > 1){
							%>
							<tr>
								<th scope="row" class="table_title">&#42;�����з��ڵ�</th>
								<td class="table_02_2" id="upperchart">
									<select name="p_maxupperchart" id="p_maxupperchart" ordr="0" class="upperchartselectbox">
										<option value="">����1</option>
										<%
											if(uLChartCodeList != null && uLChartCodeList.size() > 0){
												for(DataBox data : uLChartCodeList){
										%>
										<option value="<%=data.getString("d_maxupperchartcode") %>_<%=data.getString("d_chartcode") %>"><%=data.getString("d_chartname") %></option>
										<%
												}
											}else{
										%>
										<option value="">�ش� �з��� �����ϴ�</option>
										<%
											}
										%>
									</select>
									
									<%for(int i = 0; i < (box.getInt("p_codegubun")-2); i++){ %>
									&nbsp;
									<select name="p_upperchartcode_<%=i %>" id="p_upperchartcode_<%=i %>" ordr="<%=i+1 %>" class="upperchartselectbox">
										<option value="">����2</option>
									</select>
									<%} %>
									
								</td>
							</tr>
							<%
								}
							%>
							
							<tr>
								<th scope="row" class="table_title">&#42;�з��ڵ��</th>
								<td class="table_02_2"><input type="text" name="p_chartname" id="p_chartname" value="" style="width: 80%;" /></td>
							</tr>
							<tr>
								<th scope="row" class="table_title">&#42;�з��ڵ����</th>
								<td class="table_02_2"><input type="text" name="p_chartorder" id="p_chartorder" value="" style="width: 10%;" class="isNumber" /></td>
							</tr>
							<tr>
								<th scope="row" class="table_title">&#42;��뿩��</th>
								<td class="table_02_2">
									<input type="radio" name="p_useyn" id="p_useyn_y" value="Y" checked="checked" /><label for="p_useyn_y">Y</label>
									<input type="radio" name="p_useyn" id="p_useyn_n" value="N" /><label for="p_useyn_n">N</label>
								</td>
							</tr>
							<tr>
								<th scope="row" class="table_title">����</th>
								<td class="table_02_2">
									<textarea name="p_summary" id="p_summary" rows="8" cols="100" ></textarea>
								</td>
							</tr>
							<tr>
								<th scope="row" class="table_title">������</th>
								<td class="table_02_2">
									<textarea name="p_jobarea" id="p_jobarea" rows="8" cols="100" ></textarea>
								</td>
							</tr>
							<tr>
								<th scope="row" class="table_title">�ʿ俪��</th>
								<td class="table_02_2">
									<textarea name="p_capacity" id="p_capacity" rows="8" cols="100" ></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- ��� ���� e -->
				</form>
				<br />
			</td>
		</tr>
		<tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
	</table>
</body>
</html>
