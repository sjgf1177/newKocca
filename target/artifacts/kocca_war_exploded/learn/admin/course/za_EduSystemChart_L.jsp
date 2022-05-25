<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page errorPage="/learn/library/error.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.credu.library.*" %>
<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
	if(box == null) { box = RequestManager.getBox(request); }

	//����ü�赵 ���
	ArrayList<DataBox> resultList = (ArrayList<DataBox>) request.getAttribute("resultList");

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
		
		
	});
	
	
	//�������� ȭ��
	function fnCmdSubjCoursePage(chartcode){
	
		$("#p_chartcode").val(chartcode);
		$("#p_process").val("subjcourse");
		$("#form1").attr({
					action:"/servlet/controller.course.EduSystemChartServlet",
					method:"post",
					target:"_self"
					});
		$("#form1").submit();
	}
	
	//�з� ��� ȭ��
	function fnCmdInsertPage(codegubun){
	
		$("#p_codegubun").val(codegubun);
		$("#p_process").val("insertPage");
		$("#form1").attr({
					action:"/servlet/controller.course.EduSystemChartServlet",
					method:"post",
					target:"_self"
					});
		$("#form1").submit();
	}
	
	//�з� ���� ȭ��
	function fnCmdUpdatePage(chartcode){
		
		if(chartcode != null && chartcode != "0"){
			$("#p_chartcode").val(chartcode);
			$("#p_process").val("updatePage");
			$("#form1").attr({
						action:"/servlet/controller.course.EduSystemChartServlet",
						method:"post",
						target:"_self"
						});
			$("#form1").submit();
		}else{
			return;
		}
	
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
	
	<form name="form1" id="form1" method="post" action="/servlet/controller.course.EduSystemChartServlet">
		<input type="hidden" name="p_process" id="p_process" value="" />
		<input type="hidden" name="p_codegubun" id="p_codegubun" value="" />
		<input type="hidden" name="p_chartcode" id="p_chartcode" value="" />
		
		
	</form>
	
	
	<!-- �˻� ���� s -->
<!-- 	<table cellspacing="0" cellpadding="1" class="form_table_out"> -->
	
			
			
<!-- 			<tr> -->
<!-- 				<td bgcolor="#C6C6C6" align="center"> -->
<!-- 					<table cellspacing="0" cellpadding="0" class="form_table_bg"> -->
<!-- 						<tr><td height="7" width="99%"></td></tr> -->
<!-- 						<tr> -->
<!-- 							<td align="center" width="99%" valign="middle"> -->
<!-- 								<table width="99%" cellspacing="0" cellpadding="0" class="form_table"> -->
<!-- 									<tr> -->
<!-- 										<td> -->
<!-- 											<table cellspacing="0" cellpadding="0" width="99%"> -->
<!-- 												<colgroup> -->
<!-- 													<col width="10%"> -->
<!-- 													<col width="*"> -->
<!-- 												</colgroup> -->
<!-- 												<tr> -->
<!-- 													<td class="_tdT">�����׷�</td> -->
<!-- 													<td class="_tdS" style="text-align:left; padding-left:4px;"> -->
<!-- 														selectbox -->
<!-- 													</td> -->
<!-- 												</tr> -->
<!-- 											</table> -->
<!-- 										</td> -->
<!-- 									</tr> -->
<!-- 								</table> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 						<tr><td height="7" width="99%"></td></tr> -->
<!-- 					</table> -->
<!-- 				</td> -->
<!-- 			</tr> -->
			
<!-- 		</form> -->
		
<!-- 	</table> -->
	<!-- �˻� ���� e -->
<!-- 	<br /> -->
	
	
	<!-- ��ư ���� s -->
<!-- 	<table cellpadding="0" cellspacing="0" class="table1"> -->
<!-- 		<tr> -->
<!-- 			<td align="right" height="20"> -->
<!-- 				<a href="#" onclick="return false;">��з� �߰�</a> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 		<tr><td height="3"></td></tr> -->
<!-- 	</table> -->
	<!-- ��ư ���� e -->
	
	
	<!-- ��� ���� s -->
	<table cellspacing="1" cellpadding="5" class="table_out" summary="����ü�赵 �з� ���">
		<caption style="display: none;">����ü�赵 �з� ���</caption>
		<colgroup>
				<col width="15%" />
				<col width="15%" />
				<col width="20%" />
<!-- 				<col width="20%" />
				<col width="*" /> -->
			</colgroup>
		<tbody>
			<tr>
			
				<!-- *************************************************************************************************** -->
				<!-- 1,2depth �޴��� ����� ȭ�鿡�� �������� �ڵ�� �޶����� �ʵ��� ������ �� ������ ��(����̳� ������ �̷���� ��� �����ȭ�鿡�� ���� �۾� �ʿ�) -->
				<!-- *************************************************************************************************** -->
				<td class="table_title">1depth
 					<button name="btn" class="btn_basic" onclick="fnCmdInsertPage('1'); return false;">�߰�</button>
				</td>
				<td class="table_title">2depth
 					<button name="btn" class="btn_basic" onclick="fnCmdInsertPage('2'); return false;">�߰�</button>
				</td>
				
				<!-- <td class="table_title">3depth <button name="btn" class="btn_basic" onclick="fnCmdInsertPage('3'); return false;">�߰�</button></td>
				<td class="table_title">4depth <button name="btn" class="btn_basic" onclick="fnCmdInsertPage('4'); return false;">�߰�</button></td>
				<td class="table_title">5depth <button name="btn" class="btn_basic" onclick="fnCmdInsertPage('5'); return false;">�߰�</button></td> -->
			</tr>
			<%
				String achart = "";
				String bchart = "";
/* 				String cchart = "";
				String dchart = "";
				String echart = ""; */
				
				if(resultList != null && resultList.size() > 0){
					for(int i = 0; i < resultList.size(); i++){
						DataBox data = (DataBox) resultList.get(i);
						
			%>
			<tr>
						<%
							if(!achart.equals(data.getString("d_codea"))){
								achart = data.getString("d_codea");
						%>
							<td class="table_01" <%=data.getInt("d_acnt")>1?"rowspan=\""+data.getInt("d_acnt")+"\"":"" %>>
								<a href="#" onclick="fnCmdUpdatePage('<%=data.getString("d_codea") %>'); return false;"><%=!"".equals(data.getString("d_codenamea"))?data.getString("d_codenamea"):"-" %></a>
								<%-- <%=!"".equals(data.getString("d_codenamea"))?data.getString("d_codenamea"):"-" %> --%>
							</td>
						<%		
							}
						%>
						<%-- <%
							if(!bchart.equals(data.getString("d_codeb")) ){
								bchart = data.getString("d_codeb");
						%>
							<td class="table_02_1" <%=data.getInt("d_bcnt")>1?"rowspan=\""+data.getInt("d_bcnt")+"\"":"" %>>
								<a href="#" onclick="fnCmdUpdatePage('<%=data.getString("d_codeb") %>'); return false;"><%=!"".equals(data.getString("d_codenameb"))?data.getString("d_codenameb"):"-" %></a>
								<%=!"".equals(data.getString("d_codenameb"))?data.getString("d_codenameb"):"-" %>
							</td>
						<%		
							}
						%> --%>
						
						<%-- <%
							if(!cchart.equals(data.getString("d_codec"))){
								cchart = data.getString("d_codec");
						%>
							<td class="table_02_1" <%=data.getInt("d_ccnt")>1?"rowspan=\""+data.getInt("d_ccnt")+"\"":"" %>>
								<a href="#" onclick="fnCmdUpdatePage('<%=data.getString("d_codec") %>'); return false;"><%=!"".equals(data.getString("d_codenamec"))?data.getString("d_codenamec"):"-" %></a>
							</td>
						<%		
							}
						%>
						<%
							if(!dchart.equals(data.getString("d_coded"))){
								dchart = data.getString("d_coded");
						%>
							<td class="table_02_1" <%=data.getInt("d_dcnt")>1?"rowspan=\""+data.getInt("d_dcnt")+"\"":"" %>>
								<a href="#" onclick="fnCmdUpdatePage('<%=data.getString("d_coded") %>'); return false;"><%=!"".equals(data.getString("d_codenamed"))?data.getString("d_codenamed"):"-" %></a>
							</td>
						<%		
							}
						%> --%>
						<%
							if(!bchart.equals(data.getString("d_codeb"))){
								bchart = data.getString("d_codeb");
						%>
								<%if(!"".equals(data.getString("d_codenameb"))){ %>
									<td class="table_02_1" <%=data.getInt("d_bcnt")>1?"rowspan=\""+data.getInt("d_bcnt")+"\"":"" %>>
										<a href="#" onclick="fnCmdUpdatePage('<%=data.getString("d_codeb") %>'); return false;"><%=data.getString("d_codenameb") %></a>
									</td>
									<td class="table_02_1">
										<button name="btn" class="btn_basic" onclick="fnCmdSubjCoursePage('<%=data.getString("d_codeb") %>'); return false;">��������</button>
									</td>
								<%}else{ %>
								<td class="table_02_1" <%=data.getInt("d_bcnt")>1?"rowspan=\""+data.getInt("d_bcnt")+"\"":"" %>>-</td>
								<td class="table_02_1">
									<button name="btn" class="btn_basic" onclick="fnCmdSubjCoursePage('<%=data.getString("d_codea") %>'); return false;">��������</button>
								</td>
								<%} %>								
						<%		
							}
						%>
			</tr>
			<%			
					}
				}else{
			%>
			<tr><td colspan="3" class="table_02_2">�ش� ����� �����ϴ�</td></tr>
			<%		
				}
			%>
		</tbody>
	</table>
	<!-- ��� ���� e -->
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
